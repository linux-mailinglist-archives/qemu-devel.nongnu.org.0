Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B66A24CFC5F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:10:48 +0100 (CET)
Received: from localhost ([::1]:60522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBGJ-0004VV-Rf
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:10:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRAik-0004qY-Dv
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:36:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRAii-0008BW-FW
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:36:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646649363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R8PWxhzUI6Di3fIe9Wn9PnZu1OI3GMlrTVuwXVg5Qgs=;
 b=GrDqtGvmiG7NCualRSWA2hWq4KB8QAPepX3L2YXTIECDVfrTXfo2tM9eyo14MO0pvKIHoW
 QV6wu5hXRGn1bz7Ppa6ntm0uyB0s/0pjl3q9CiCFaF7jugrAa9bsvIG5c7XpKW4yhaBFqC
 EZd2KzCjXHmXSDfHIqlVsBgH3ehXXtw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-wtFLmau8NHCOxskJUQAMXw-1; Mon, 07 Mar 2022 05:36:02 -0500
X-MC-Unique: wtFLmau8NHCOxskJUQAMXw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1DCC657;
 Mon,  7 Mar 2022 10:36:01 +0000 (UTC)
Received: from localhost (unknown [10.39.194.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5742E7B6FB;
 Mon,  7 Mar 2022 10:36:01 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 03/23] block/curl.c: Check error return from curl_easy_setopt()
Date: Mon,  7 Mar 2022 11:35:29 +0100
Message-Id: <20220307103549.808809-4-hreitz@redhat.com>
In-Reply-To: <20220307103549.808809-1-hreitz@redhat.com>
References: <20220307103549.808809-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Coverity points out that we aren't checking the return value
from curl_easy_setopt() for any of the calls to it we make
in block/curl.c.

Some of these options are documented as always succeeding (e.g.
CURLOPT_VERBOSE) but others have documented failure cases (e.g.
CURLOPT_URL).  For consistency we check every call, even the ones
that theoretically cannot fail.

Fixes: Coverity CID 1459336, 1459482, 1460331
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220222152341.850419-3-peter.maydell@linaro.org>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/curl.c | 90 +++++++++++++++++++++++++++++++++-------------------
 1 file changed, 57 insertions(+), 33 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index 9516852971..1e0f609579 100644
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
+        if (curl_easy_setopt(state->curl, CURLOPT_URL, s->url) ||
+            curl_easy_setopt(state->curl, CURLOPT_SSL_VERIFYPEER,
+                             (long) s->sslverify) ||
+            curl_easy_setopt(state->curl, CURLOPT_SSL_VERIFYHOST,
+                             s->sslverify ? 2L : 0L)) {
+            goto err;
+        }
         if (s->cookie) {
-            curl_easy_setopt(state->curl, CURLOPT_COOKIE, s->cookie);
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
2.34.1


