Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD47F2D7C99
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:17:39 +0100 (CET)
Received: from localhost ([::1]:43560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knm30-0002yF-Hg
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:17:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knlu5-0003PQ-PS
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:08:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knlu4-00022i-Aj
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:08:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hIRKwnrx4PPsDE3REBIRH80Y3RMFY+GnMz9eOGwKwhM=;
 b=LIZUS3P1uJprHdEbfT/5cfPxNn4jFQ8V8YpGr9WUJJKDw0pHaxqgO+5FyeXUyWlay9QgEl
 VK5zJ1jtWHnq4zgWCg11bnc3Zo1/feH60Jz4XqeZ+MdVXrZkpnuvv4pJCFzS/Kjut5VJU5
 42Gx3hA7MPNPHfPIEmwJqPHUP6KM9NE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-YPq9T5cRNb21-zucCOLBBA-1; Fri, 11 Dec 2020 12:08:19 -0500
X-MC-Unique: YPq9T5cRNb21-zucCOLBBA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 490B2800D55;
 Fri, 11 Dec 2020 17:08:18 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43BCA5D741;
 Fri, 11 Dec 2020 17:08:17 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 02/34] block/curl: Use lock guard macros
Date: Fri, 11 Dec 2020 18:07:40 +0100
Message-Id: <20201211170812.228643-3-kwolf@redhat.com>
In-Reply-To: <20201211170812.228643-1-kwolf@redhat.com>
References: <20201211170812.228643-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gan Qixin <ganqixin@huawei.com>

Replace manual lock()/unlock() calls with lock guard macros
(QEMU_LOCK_GUARD/WITH_QEMU_LOCK_GUARD) in block/curl.

Signed-off-by: Gan Qixin <ganqixin@huawei.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201203075055.127773-3-ganqixin@huawei.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/curl.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index 4f907c47be..d24a4c5897 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -564,23 +564,23 @@ static void curl_detach_aio_context(BlockDriverState *bs)
     BDRVCURLState *s = bs->opaque;
     int i;
 
-    qemu_mutex_lock(&s->mutex);
-    for (i = 0; i < CURL_NUM_STATES; i++) {
-        if (s->states[i].in_use) {
-            curl_clean_state(&s->states[i]);
+    WITH_QEMU_LOCK_GUARD(&s->mutex) {
+        for (i = 0; i < CURL_NUM_STATES; i++) {
+            if (s->states[i].in_use) {
+                curl_clean_state(&s->states[i]);
+            }
+            if (s->states[i].curl) {
+                curl_easy_cleanup(s->states[i].curl);
+                s->states[i].curl = NULL;
+            }
+            g_free(s->states[i].orig_buf);
+            s->states[i].orig_buf = NULL;
         }
-        if (s->states[i].curl) {
-            curl_easy_cleanup(s->states[i].curl);
-            s->states[i].curl = NULL;
+        if (s->multi) {
+            curl_multi_cleanup(s->multi);
+            s->multi = NULL;
         }
-        g_free(s->states[i].orig_buf);
-        s->states[i].orig_buf = NULL;
-    }
-    if (s->multi) {
-        curl_multi_cleanup(s->multi);
-        s->multi = NULL;
     }
-    qemu_mutex_unlock(&s->mutex);
 
     timer_del(&s->timer);
 }
-- 
2.29.2


