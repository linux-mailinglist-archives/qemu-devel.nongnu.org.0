Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E95C769DD23
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 10:47:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUPE2-0006eG-DN; Tue, 21 Feb 2023 04:46:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUPDo-0006XH-4v
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:46:04 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUPDl-0005gz-E7
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:46:03 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 l2-20020a05600c1d0200b003e1f6dff952so3005043wms.1
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 01:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2E4fiXlJ7CJ9nfjz2dqu3lzDAw7M+EYkDKHTbulwIxo=;
 b=KHnk+ORnE464Egflg7HSTtBv2mD626isu0cKO+aCg1o6gnAowryzZVJATKoubrUxMe
 AQgver8oGlJJfapgqFdldbYOOeBvK5lTU7tKUNcsADcBZ7cjqyySdAYqkQpMsCLzyPXc
 U89Vl7w8Ay9jyRdP2hShQE1Geao4RtCpq6ZcKaXKYLQxXw5fet56XlJDgzOcP0Kud14e
 BMPdgTT8316WgZzeAZEi7/gfj8rR7H4ldDarx5R3Ii+nQsfL6lgBCD251u8PxQLeZa+C
 m38AmVIB0/fZG71TTWLOQwACZrZtT0iqaCrakWLSTV1Tx/PU145IAWFD9ws5SHSIbQvI
 rBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2E4fiXlJ7CJ9nfjz2dqu3lzDAw7M+EYkDKHTbulwIxo=;
 b=rwtMlvT7Tc5dYRRHG+Wc2UwjSTejhqOTlReZQxjKFPGnHq3Ji0ExGIYVMoO4R6hD/b
 69w038smhCzETv+u2cv6NjG+yIFVBRHeq7TqY0ZHYYm+Cul4hKWhK+d11olWvWFfKLLM
 ffE4UXok4e56LthiNuUZe/cwrJk0+N4lP9wOX8IkVsjbxsyMBYazALDMGHl+4jweNf43
 njhNTIngDfWIRUU7s2ToCvGrs+NTeRA6VOK+oGvXYurrVUf4wPuqtrY/sKSTriM+IDui
 YEnoN565aXXqlwSH/69QcSaM5ld9bzcSfOKNiUWHNiHRQU3kfSNfDsVU5QdgKjedjuPS
 wy0A==
X-Gm-Message-State: AO0yUKXe1Ss6O3ia9yfPrCOw/Bk45QUEkPTol2M5pib9wsiZYOMcSdnU
 encxuOxPNfenGkaRgXje1tsqVg==
X-Google-Smtp-Source: AK7set8o1TlWWW5C65jGJ6EB1xR70VbgMv+ZyCJMYq6qijLDoVWEyh9228Dx65MBvR9qbb5amMqSzw==
X-Received: by 2002:a05:600c:994:b0:3e2:152d:894e with SMTP id
 w20-20020a05600c099400b003e2152d894emr3012017wmp.15.1676972759935; 
 Tue, 21 Feb 2023 01:45:59 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003e21f01c426sm3194687wmn.9.2023.02.21.01.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 01:45:59 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 037621FFB8;
 Tue, 21 Feb 2023 09:45:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-block@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Anton Johansson <anjo@rev.ng>
Subject: [PATCH v2 01/14] block: Handle curl 7.55.0, 7.85.0 version changes
Date: Tue, 21 Feb 2023 09:45:45 +0000
Message-Id: <20230221094558.2864616-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221094558.2864616-1-alex.bennee@linaro.org>
References: <20230221094558.2864616-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Anton Johansson <anjo@rev.ng>

* 7.55.0 deprecates CURLINFO_CONTENT_LENGTH_DOWNLOAD in favour of a *_T
  version, which returns curl_off_t instead of a double.
* 7.85.0 deprecates CURLOPT_PROTOCOLS and CURLOPT_REDIR_PROTOCOLS in
  favour of *_STR variants, specifying the desired protocols via a
  string.

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230123201431.23118-1-anjo@rev.ng>
[AJB: fixed author]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 block/curl.c | 44 +++++++++++++++++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 7 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index cbada22e9e..8efd97b349 100644
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
2.39.1


