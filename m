Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3004A6B0FC3
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:06:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZx8j-0004yp-P4; Wed, 08 Mar 2023 11:59:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx8U-0004ln-Cp; Wed, 08 Mar 2023 11:59:30 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx8P-00049l-8x; Wed, 08 Mar 2023 11:59:30 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id A15B540111;
 Wed,  8 Mar 2023 19:58:58 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 41CE192;
 Wed,  8 Mar 2023 19:58:57 +0300 (MSK)
Received: (nullmailer pid 2098385 invoked by uid 1000);
 Wed, 08 Mar 2023 16:58:55 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 45/47] block: Handle curl 7.55.0, 7.85.0 version changes
Date: Wed,  8 Mar 2023 19:57:48 +0300
Message-Id: <20230308165815.2098148-45-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
References: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Anton Johansson <anjo@rev.ng>

* 7.55.0 deprecates CURLINFO_CONTENT_LENGTH_DOWNLOAD in favour of a *_T
  version, which returns curl_off_t instead of a double.
* 7.85.0 deprecates CURLOPT_PROTOCOLS and CURLOPT_REDIR_PROTOCOLS in
  favour of *_STR variants, specifying the desired protocols via a
  string.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1440
Signed-off-by: Anton Johansson <anjo@rev.ng>
Message-Id: <20230123201431.23118-1-anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
(cherry picked from commit e7b8d9d038f313c2b9e601609e7d7c3ca6ad0234)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
2.30.2


