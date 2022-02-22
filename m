Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A704BFE29
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 17:11:26 +0100 (CET)
Received: from localhost ([::1]:50180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMXl7-00087k-Ng
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 11:11:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMX14-0002FY-8I
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 10:23:50 -0500
Received: from [2a00:1450:4864:20::431] (port=43701
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMX10-0004kw-US
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 10:23:49 -0500
Received: by mail-wr1-x431.google.com with SMTP id s1so7570719wrg.10
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 07:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vfGIcscrnr0jVMPKzVirQZ2NrPwATUp/U3SteJbuuPg=;
 b=x0duNAryg1IVBcMX+AqetT4lCapgO83cKNbHrnc0urhk3CCpPH/HdagDxXavsk8XFG
 Q2WqT+ILUtvuutXO64qou7nOiQGTrEg8tx51n+bT3FENfsfQX8t0AGWWtFBOfUj6QUb6
 CzzlMUPkrxAbG81j7Fi7iHOCxDqyRpVDvNKZlqsyNsTSGPdFOebQfbWj/bHqXYHkz6ue
 wa+JNqRK4kRgeE+wBk8ju98SVgoWbOOde9We1eROzGQdkOxPCIIUy2ZsiWRhlZB8Sy0t
 L2u5PUr1T95VdI+hXrlzn6b8QIGYAchE4ozdzj6ge9prLZ/mJT3MUoNc2MkArFssFEdF
 VAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vfGIcscrnr0jVMPKzVirQZ2NrPwATUp/U3SteJbuuPg=;
 b=3u7147eaXBWgvVF2MJ3Bfjd7D8jDgXhcqURDZ3mOIJwD5Qc/C1lC1ZTGBIHy0T/6OJ
 q6F7f8Z21nIMg5zEJ1jFJiai1S+fYfox8R/qI4HjkjEh1aOcFe/AM56D5XWOQKcPeyt3
 Bol7k0mCbXZScKkkF7gLVw4H4d/kEOd5CULuq1dAVFvz54RJcJQpsu+fxh3B/vYJWQjO
 ee7ZZayU/HBgNb1KjUyai+J/lvxpiepd53D5CJec3V9c3WXs5qWgesKnMXhiw6ez7tkK
 mVKCSOkO6PlfcmxD5oSiQqi2E3RpdKzEdchM2z/f1F5ZH5WFTn8OJ22dT2sAYtQ9MWaX
 jUuw==
X-Gm-Message-State: AOAM530EM0r8OyoQBc5i4dthqdeh1RYOwvPcj3BRTPa8Xc/jJBLnL5uX
 86riSr3qNTkKeE37r+5PNOdTPK1o6OYy4A==
X-Google-Smtp-Source: ABdhPJy9BClo/y/ZaBXuy7r9jJLuk0Y2VyZv3YBXbqYRQpxLvHlGNfbtW52tLrMTzE+kxIYV5MWyBg==
X-Received: by 2002:a05:6000:1ac5:b0:1ea:7870:d7eb with SMTP id
 i5-20020a0560001ac500b001ea7870d7ebmr5215872wry.171.1645543425342; 
 Tue, 22 Feb 2022 07:23:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a7bc4d0000000b0037bbe255339sm2687403wmk.15.2022.02.22.07.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 07:23:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] block/curl.c: Check error return from
 curl_easy_setopt()
Date: Tue, 22 Feb 2022 15:23:41 +0000
Message-Id: <20220222152341.850419-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222152341.850419-1-peter.maydell@linaro.org>
References: <20220222152341.850419-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity points out that we aren't checking the return value
from curl_easy_setopt() for any of the calls to it we make
in block/curl.c.

Some of these options are documented as always succeeding (e.g.
CURLOPT_VERBOSE) but others have documented failure cases (e.g.
CURLOPT_URL).  For consistency we check every call, even the ones
that theoretically cannot fail.

Fixes: Coverity CID 1459336, 1459482, 1460331
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Changes v1->v2:
 * set the error string in the failure path for the
   direct setopt calls in curl_open()
 * fix the failure path in curl_setup_preadv() by putting
   the curl_easy_setopt() call in the same if() condition
   as the existing curl_multi_add_handle()
---
 block/curl.c | 92 +++++++++++++++++++++++++++++++++-------------------
 1 file changed, 58 insertions(+), 34 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index 95168529715..1e0f6095797 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -458,38 +458,51 @@ static int curl_init_state(BDRVCURLState *s, CURLState *state)
         if (!state->curl) {
             return -EIO;
         }
-        curl_easy_setopt(state->curl, CURLOPT_URL, s->url);
-        curl_easy_setopt(state->curl, CURLOPT_SSL_VERIFYPEER,
-                         (long) s->sslverify);
-        curl_easy_setopt(state->curl, CURLOPT_SSL_VERIFYHOST,
-                         s->sslverify ? 2L : 0L);
-        if (s->cookie) {
-            curl_easy_setopt(state->curl, CURLOPT_COOKIE, s->cookie);
+        if (curl_easy_setopt(state->curl, CURLOPT_URL, s->url) ||
+            curl_easy_setopt(state->curl, CURLOPT_SSL_VERIFYPEER,
+                             (long) s->sslverify) ||
+            curl_easy_setopt(state->curl, CURLOPT_SSL_VERIFYHOST,
+                             s->sslverify ? 2L : 0L)) {
+            goto err;
+        }
+        if (s->cookie) {
+            if (curl_easy_setopt(state->curl, CURLOPT_COOKIE, s->cookie)) {
+                goto err;
+            }
+        }
+        if (curl_easy_setopt(state->curl, CURLOPT_TIMEOUT, (long)s->timeout) ||
+            curl_easy_setopt(state->curl, CURLOPT_WRITEFUNCTION,
+                             (void *)curl_read_cb) ||
+            curl_easy_setopt(state->curl, CURLOPT_WRITEDATA, (void *)state) ||
+            curl_easy_setopt(state->curl, CURLOPT_PRIVATE, (void *)state) ||
+            curl_easy_setopt(state->curl, CURLOPT_AUTOREFERER, 1) ||
+            curl_easy_setopt(state->curl, CURLOPT_FOLLOWLOCATION, 1) ||
+            curl_easy_setopt(state->curl, CURLOPT_NOSIGNAL, 1) ||
+            curl_easy_setopt(state->curl, CURLOPT_ERRORBUFFER, state->errmsg) ||
+            curl_easy_setopt(state->curl, CURLOPT_FAILONERROR, 1)) {
+            goto err;
         }
-        curl_easy_setopt(state->curl, CURLOPT_TIMEOUT, (long)s->timeout);
-        curl_easy_setopt(state->curl, CURLOPT_WRITEFUNCTION,
-                         (void *)curl_read_cb);
-        curl_easy_setopt(state->curl, CURLOPT_WRITEDATA, (void *)state);
-        curl_easy_setopt(state->curl, CURLOPT_PRIVATE, (void *)state);
-        curl_easy_setopt(state->curl, CURLOPT_AUTOREFERER, 1);
-        curl_easy_setopt(state->curl, CURLOPT_FOLLOWLOCATION, 1);
-        curl_easy_setopt(state->curl, CURLOPT_NOSIGNAL, 1);
-        curl_easy_setopt(state->curl, CURLOPT_ERRORBUFFER, state->errmsg);
-        curl_easy_setopt(state->curl, CURLOPT_FAILONERROR, 1);
-
         if (s->username) {
-            curl_easy_setopt(state->curl, CURLOPT_USERNAME, s->username);
+            if (curl_easy_setopt(state->curl, CURLOPT_USERNAME, s->username)) {
+                goto err;
+            }
         }
         if (s->password) {
-            curl_easy_setopt(state->curl, CURLOPT_PASSWORD, s->password);
+            if (curl_easy_setopt(state->curl, CURLOPT_PASSWORD, s->password)) {
+                goto err;
+            }
         }
         if (s->proxyusername) {
-            curl_easy_setopt(state->curl,
-                             CURLOPT_PROXYUSERNAME, s->proxyusername);
+            if (curl_easy_setopt(state->curl,
+                                 CURLOPT_PROXYUSERNAME, s->proxyusername)) {
+                goto err;
+            }
         }
         if (s->proxypassword) {
-            curl_easy_setopt(state->curl,
-                             CURLOPT_PROXYPASSWORD, s->proxypassword);
+            if (curl_easy_setopt(state->curl,
+                                 CURLOPT_PROXYPASSWORD, s->proxypassword)) {
+                goto err;
+            }
         }
 
         /* Restrict supported protocols to avoid security issues in the more
@@ -499,18 +512,27 @@ static int curl_init_state(BDRVCURLState *s, CURLState *state)
          * Restricting protocols is only supported from 7.19.4 upwards.
          */
 #if LIBCURL_VERSION_NUM >= 0x071304
-        curl_easy_setopt(state->curl, CURLOPT_PROTOCOLS, PROTOCOLS);
-        curl_easy_setopt(state->curl, CURLOPT_REDIR_PROTOCOLS, PROTOCOLS);
+        if (curl_easy_setopt(state->curl, CURLOPT_PROTOCOLS, PROTOCOLS) ||
+            curl_easy_setopt(state->curl, CURLOPT_REDIR_PROTOCOLS, PROTOCOLS)) {
+            goto err;
+        }
 #endif
 
 #ifdef DEBUG_VERBOSE
-        curl_easy_setopt(state->curl, CURLOPT_VERBOSE, 1);
+        if (curl_easy_setopt(state->curl, CURLOPT_VERBOSE, 1)) {
+            goto err;
+        }
 #endif
     }
 
     state->s = s;
 
     return 0;
+
+err:
+    curl_easy_cleanup(state->curl);
+    state->curl = NULL;
+    return -EIO;
 }
 
 /* Called with s->mutex held.  */
@@ -765,10 +787,13 @@ static int curl_open(BlockDriverState *bs, QDict *options, int flags,
     }
 
     s->accept_range = false;
-    curl_easy_setopt(state->curl, CURLOPT_NOBODY, 1);
-    curl_easy_setopt(state->curl, CURLOPT_HEADERFUNCTION,
-                     curl_header_cb);
-    curl_easy_setopt(state->curl, CURLOPT_HEADERDATA, s);
+    if (curl_easy_setopt(state->curl, CURLOPT_NOBODY, 1) ||
+        curl_easy_setopt(state->curl, CURLOPT_HEADERFUNCTION, curl_header_cb) ||
+        curl_easy_setopt(state->curl, CURLOPT_HEADERDATA, s)) {
+        pstrcpy(state->errmsg, CURL_ERROR_SIZE,
+                "curl library initialization failed.");
+        goto out;
+    }
     if (curl_easy_perform(state->curl))
         goto out;
     if (curl_easy_getinfo(state->curl, CURLINFO_CONTENT_LENGTH_DOWNLOAD, &d)) {
@@ -881,9 +906,8 @@ static void curl_setup_preadv(BlockDriverState *bs, CURLAIOCB *acb)
 
     snprintf(state->range, 127, "%" PRIu64 "-%" PRIu64, start, end);
     trace_curl_setup_preadv(acb->bytes, start, state->range);
-    curl_easy_setopt(state->curl, CURLOPT_RANGE, state->range);
-
-    if (curl_multi_add_handle(s->multi, state->curl) != CURLM_OK) {
+    if (curl_easy_setopt(state->curl, CURLOPT_RANGE, state->range) ||
+        curl_multi_add_handle(s->multi, state->curl) != CURLM_OK) {
         state->acb[0] = NULL;
         acb->ret = -EIO;
 
-- 
2.25.1


