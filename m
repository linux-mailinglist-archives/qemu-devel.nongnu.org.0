Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6172469AF3B
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 16:13:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT2Nb-0004vx-WA; Fri, 17 Feb 2023 10:10:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pT2NV-0004qU-S6
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:10:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pT2NS-0007UL-N7
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:10:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676646621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iX5amJWrhuVNwnzXLAkWB0HtD2Kd+TSKoYIaorCoBIk=;
 b=Ea3B0alJ2f9AABQuMC4rIC/WhIlV0m9QD/QAOPufla7YjGz+RVwCCg6WRyvN7tTmyLKwDK
 RjJVOXP7ZFoDhObJgOGY6Ddqlr+5+WhP8EL6U0010BqXeWS/fcAjMYSpA8dtqFZJrke0XG
 +7j1AfAqNSy17Du0Hrr1j2ZHaaqGMSE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-398-eKaQM3C3Py-IYp27aTSJRg-1; Fri, 17 Feb 2023 10:10:19 -0500
X-MC-Unique: eKaQM3C3Py-IYp27aTSJRg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE2543C1023E;
 Fri, 17 Feb 2023 15:10:18 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1674E492C14;
 Fri, 17 Feb 2023 15:10:17 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 18/22] block: Handle curl 7.55.0, 7.85.0 version changes
Date: Fri, 17 Feb 2023 16:09:50 +0100
Message-Id: <20230217150954.283920-18-kwolf@redhat.com>
In-Reply-To: <20230217150954.283920-1-kwolf@redhat.com>
References: <20230217150829.283583-1-kwolf@redhat.com>
 <20230217150954.283920-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
---
 block/curl.c | 44 +++++++++++++++++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 7 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index ba9977af5a..8bb39a134e 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -38,8 +38,15 @@
 
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
@@ -510,9 +517,18 @@ static int curl_init_state(BDRVCURLState *s, CURLState *state)
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
@@ -670,7 +686,12 @@ static int curl_open(BlockDriverState *bs, QDict *options, int flags,
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
@@ -797,27 +818,36 @@ static int curl_open(BlockDriverState *bs, QDict *options, int flags,
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
2.39.2


