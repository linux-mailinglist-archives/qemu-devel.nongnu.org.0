Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D68067875A
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 21:15:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK3DO-00014a-5M; Mon, 23 Jan 2023 15:14:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pK3DM-00011b-3U
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 15:14:48 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pK3DK-0007AK-Dv
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 15:14:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VLL73lb2utPNE3jIRkpN4EnH4IiSRUHAVh9bTMXesto=; b=JhDb/m/pKgcIFOZpZYBCsrfgKY
 9B+WPa3eAolUZZIP96TrwHGiDx+gXilUH3w1qgClTfoassAcGOkJGdKOoReapaub9I8W3D85QWFoO
 ibLUhOpZJnyrLhVLkmIG8PVbd/iJ8I7bXu9mQSWT234DFmXWAaz40QlBeL/msyJcKtfI=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng,
	kwolf@redhat.com,
	hreitz@redhat.com
Subject: [PATCH] block: Handle curl 7.55.0, 7.85.0 version changes
Date: Mon, 23 Jan 2023 21:14:31 +0100
Message-Id: <20230123201431.23118-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* 7.55.0 deprecates CURLINFO_CONTENT_LENGTH_DOWNLOAD in favour of a *_T
  version, which returns curl_off_t instead of a double.
* 7.85.0 deprecates CURLOPT_PROTOCOLS and CURLOPT_REDIR_PROTOCOLS in
  favour of *_STR variants, specifying the desired protocols via a
  string.

Signed-off-by: Anton Johansson <anjo@rev.ng>
---
 block/curl.c | 44 +++++++++++++++++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 7 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index cba4c4cac7..0b125095e3 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -37,8 +37,15 @@
 
 // #define DEBUG_VERBOSE
 
+/* CURL 7.85.0 switches to a string based API for specifying
+ * the desired protocols.
+ */
+#if LIBCURL_VERSION_NUM >= 0x075500
+#define PROTOCOLS "HTTP,HTTPS,FTP,FTPS"
+#else
 #define PROTOCOLS (CURLPROTO_HTTP | CURLPROTO_HTTPS | \
                    CURLPROTO_FTP | CURLPROTO_FTPS)
+#endif
 
 #define CURL_NUM_STATES 8
 #define CURL_NUM_ACB    8
@@ -509,9 +516,18 @@ static int curl_init_state(BDRVCURLState *s, CURLState *state)
          * obscure protocols.  For example, do not allow POP3/SMTP/IMAP see
          * CVE-2013-0249.
          *
-         * Restricting protocols is only supported from 7.19.4 upwards.
+         * Restricting protocols is only supported from 7.19.4 upwards. Note:
+         * version 7.85.0 deprecates CURLOPT_*PROTOCOLS in favour of a string
+         * based CURLOPT_*PROTOCOLS_STR API.
          */
-#if LIBCURL_VERSION_NUM >= 0x071304
+#if LIBCURL_VERSION_NUM >= 0x075500
+        if (curl_easy_setopt(state->curl,
+                             CURLOPT_PROTOCOLS_STR, PROTOCOLS) ||
+            curl_easy_setopt(state->curl,
+                             CURLOPT_REDIR_PROTOCOLS_STR, PROTOCOLS)) {
+            goto err;
+        }
+#elif LIBCURL_VERSION_NUM >= 0x071304
         if (curl_easy_setopt(state->curl, CURLOPT_PROTOCOLS, PROTOCOLS) ||
             curl_easy_setopt(state->curl, CURLOPT_REDIR_PROTOCOLS, PROTOCOLS)) {
             goto err;
@@ -669,7 +685,12 @@ static int curl_open(BlockDriverState *bs, QDict *options, int flags,
     const char *file;
     const char *cookie;
     const char *cookie_secret;
-    double d;
+    /* CURL >= 7.55.0 uses curl_off_t for content length instead of a double */
+#if LIBCURL_VERSION_NUM >= 0x073700
+    curl_off_t cl;
+#else
+    double cl;
+#endif
     const char *secretid;
     const char *protocol_delimiter;
     int ret;
@@ -796,27 +817,36 @@ static int curl_open(BlockDriverState *bs, QDict *options, int flags,
     }
     if (curl_easy_perform(state->curl))
         goto out;
-    if (curl_easy_getinfo(state->curl, CURLINFO_CONTENT_LENGTH_DOWNLOAD, &d)) {
+    /* CURL 7.55.0 deprecates CURLINFO_CONTENT_LENGTH_DOWNLOAD in favour of
+     * the *_T version which returns a more sensible type for content length.
+     */
+#if LIBCURL_VERSION_NUM >= 0x073700
+    if (curl_easy_getinfo(state->curl, CURLINFO_CONTENT_LENGTH_DOWNLOAD_T, &cl)) {
+        goto out;
+    }
+#else
+    if (curl_easy_getinfo(state->curl, CURLINFO_CONTENT_LENGTH_DOWNLOAD, &cl)) {
         goto out;
     }
+#endif
     /* Prior CURL 7.19.4 return value of 0 could mean that the file size is not
      * know or the size is zero. From 7.19.4 CURL returns -1 if size is not
      * known and zero if it is really zero-length file. */
 #if LIBCURL_VERSION_NUM >= 0x071304
-    if (d < 0) {
+    if (cl < 0) {
         pstrcpy(state->errmsg, CURL_ERROR_SIZE,
                 "Server didn't report file size.");
         goto out;
     }
 #else
-    if (d <= 0) {
+    if (cl <= 0) {
         pstrcpy(state->errmsg, CURL_ERROR_SIZE,
                 "Unknown file size or zero-length file.");
         goto out;
     }
 #endif
 
-    s->len = d;
+    s->len = cl;
 
     if ((!strncasecmp(s->url, "http://", strlen("http://"))
         || !strncasecmp(s->url, "https://", strlen("https://")))
-- 
2.39.0


