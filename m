Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A3649FF87
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 18:26:36 +0100 (CET)
Received: from localhost ([::1]:35980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDV19-0000JM-Vs
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 12:26:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDUXk-0008B1-Uy
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 11:56:13 -0500
Received: from [2a00:1450:4864:20::42c] (port=45865
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDUXh-00023B-In
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 11:56:12 -0500
Received: by mail-wr1-x42c.google.com with SMTP id m14so11791701wrg.12
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 08:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=my6AC68IrsDTzgwV0y0YsmAQ4IVN0yCb3Xq0zo4Jr8A=;
 b=GPHbsr1jOs3xYEqJ8MY1HwnoPyho4Kb57rdGuMpnGA5L8YpEsxe8yl7lgVdZmXk6R6
 pBpimGGQ5KFb6+HKsu3qdR1WXjjJeeIVuqN0MBWYQkPzub6twmWHvX/p08mi4vxVFMG2
 BeHkW1O1gTKmRsxhQUqf+k5tXhf15mFhrI2Hnp5K5Rx+QhUsb3832OMn9sGPQ6gtlwUi
 6SPoC+V82zv2csUzJZwQqK09nCy5C57MyXVHwkz5Mdj0ECe32Qk9KwEsyRsrfYsR0umy
 O8FT7bbbImWvbDh3zpXOY90prC4fCGFZyabNnzqlwi+lYZhVtHh2jEQu2cc3kiI5AkwU
 gD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=my6AC68IrsDTzgwV0y0YsmAQ4IVN0yCb3Xq0zo4Jr8A=;
 b=K3WFAwD4k+zyATEnsfBcjcsWMjn/FiERKkjNubzy70rJPKX69oNTHT+m5p7GfTfa+c
 Ghe74HDcjHeW/GyvjPTnx+55FBl+qBwUoIIVHLTLlviZAmw4KLyTKZxieQ9P1coRmzjt
 7Xvy3VkgqKd2DlQ6FvnolkMXATje2C++kbiOmU8PvAxiChedtGHXPr4MvKt5uK7Yg7kM
 v7qEVKbg+W728BdAVU232Fx9BMB3i2pnocZ0y+Kdyy6aSebGP7TbVdCqbZWQPgfy6Qbf
 lBCuGltMcae3rZ4LwmfF6fSKVxEbO2pIto+z7rsii+0f3KwoCMUJ1ZEbOJs+L9x7ZOC3
 cddw==
X-Gm-Message-State: AOAM5327jS86LXMbgPbE+x0GZFcyG1ScGVccncc8ysYgwzn/3tvx2r7l
 O6NZI01hN6yTcDtJbDYOap1enKkt16Dyig==
X-Google-Smtp-Source: ABdhPJwvJoCps5xcq8YR5gwtrJgfCVztjHDG+QBNo/P0RJivDM8tix6wZotGZW1b0rDTe+kiA7+TVA==
X-Received: by 2002:adf:aade:: with SMTP id i30mr7744876wrc.629.1643388937705; 
 Fri, 28 Jan 2022 08:55:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id n13sm2497220wms.8.2022.01.28.08.55.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 08:55:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] block/curl.c: Check error return from curl_easy_setopt()
Date: Fri, 28 Jan 2022 16:55:35 +0000
Message-Id: <20220128165535.2550899-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

Fixes: Coverity CID 1459336, 1459482, 1460331
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Big fat disclaimer: tested only with 'make check', which I suspect
may not be exercising this block backend. Hints on how to test
more thoroughly are welcome.

 block/curl.c | 90 +++++++++++++++++++++++++++++++++-------------------
 1 file changed, 58 insertions(+), 32 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index 6a6cd729758..aaee1b17bef 100644
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
@@ -763,10 +785,11 @@ static int curl_open(BlockDriverState *bs, QDict *options, int flags,
     }
 
     s->accept_range = false;
-    curl_easy_setopt(state->curl, CURLOPT_NOBODY, 1);
-    curl_easy_setopt(state->curl, CURLOPT_HEADERFUNCTION,
-                     curl_header_cb);
-    curl_easy_setopt(state->curl, CURLOPT_HEADERDATA, s);
+    if (curl_easy_setopt(state->curl, CURLOPT_NOBODY, 1) ||
+        curl_easy_setopt(state->curl, CURLOPT_HEADERFUNCTION, curl_header_cb) ||
+        curl_easy_setopt(state->curl, CURLOPT_HEADERDATA, s)) {
+        goto out;
+    }
     if (curl_easy_perform(state->curl))
         goto out;
     if (curl_easy_getinfo(state->curl, CURLINFO_CONTENT_LENGTH_DOWNLOAD, &d)) {
@@ -879,7 +902,10 @@ static void curl_setup_preadv(BlockDriverState *bs, CURLAIOCB *acb)
 
     snprintf(state->range, 127, "%" PRIu64 "-%" PRIu64, start, end);
     trace_curl_setup_preadv(acb->bytes, start, state->range);
-    curl_easy_setopt(state->curl, CURLOPT_RANGE, state->range);
+    if (curl_easy_setopt(state->curl, CURLOPT_RANGE, state->range)) {
+        curl_clean_state(state);
+        goto out;
+    }
 
     if (curl_multi_add_handle(s->multi, state->curl) != CURLM_OK) {
         state->acb[0] = NULL;
-- 
2.25.1


