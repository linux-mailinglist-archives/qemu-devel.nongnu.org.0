Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 692712D7C9A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:18:03 +0100 (CET)
Received: from localhost ([::1]:44620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knm3O-0003T2-3g
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:18:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knlu4-0003OD-I5
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:08:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knlu1-00021J-T6
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:08:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6xXTpU1H6DvmIaGvUCDdqUlVNd9M8yhJU7IteDKiJRk=;
 b=ho0R4788FMLAS4+LwMcFX35YzeX3tWxTfE1Sk4wWSu10uLVlrTIaZmL5BP4C2xAYO8Y0Uu
 b/gIhQFluSpNWko9oWl/Rj7WU5M8cL60iarVa9d+J7xR1EZmTYpiaf7Zpo90B6kfqPSU/f
 2oe73ideqA2R32ERUsr4G48E9smUE/4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-CYtthzKNPUmhheOxlePl1Q-1; Fri, 11 Dec 2020 12:08:18 -0500
X-MC-Unique: CYtthzKNPUmhheOxlePl1Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBBCE84E1F8;
 Fri, 11 Dec 2020 17:08:16 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB76E5D71D;
 Fri, 11 Dec 2020 17:08:15 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 01/34] block/accounting: Use lock guard macros
Date: Fri, 11 Dec 2020 18:07:39 +0100
Message-Id: <20201211170812.228643-2-kwolf@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
(QEMU_LOCK_GUARD/WITH_QEMU_LOCK_GUARD) in block/accounting.

Signed-off-by: Gan Qixin <ganqixin@huawei.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201203075055.127773-2-ganqixin@huawei.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/accounting.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/block/accounting.c b/block/accounting.c
index 8d41c8a83a..2030851d79 100644
--- a/block/accounting.c
+++ b/block/accounting.c
@@ -199,29 +199,27 @@ static void block_account_one_io(BlockAcctStats *stats, BlockAcctCookie *cookie,
         return;
     }
 
-    qemu_mutex_lock(&stats->lock);
-
-    if (failed) {
-        stats->failed_ops[cookie->type]++;
-    } else {
-        stats->nr_bytes[cookie->type] += cookie->bytes;
-        stats->nr_ops[cookie->type]++;
-    }
+    WITH_QEMU_LOCK_GUARD(&stats->lock) {
+        if (failed) {
+            stats->failed_ops[cookie->type]++;
+        } else {
+            stats->nr_bytes[cookie->type] += cookie->bytes;
+            stats->nr_ops[cookie->type]++;
+        }
 
-    block_latency_histogram_account(&stats->latency_histogram[cookie->type],
-                                    latency_ns);
+        block_latency_histogram_account(&stats->latency_histogram[cookie->type],
+                                        latency_ns);
 
-    if (!failed || stats->account_failed) {
-        stats->total_time_ns[cookie->type] += latency_ns;
-        stats->last_access_time_ns = time_ns;
+        if (!failed || stats->account_failed) {
+            stats->total_time_ns[cookie->type] += latency_ns;
+            stats->last_access_time_ns = time_ns;
 
-        QSLIST_FOREACH(s, &stats->intervals, entries) {
-            timed_average_account(&s->latency[cookie->type], latency_ns);
+            QSLIST_FOREACH(s, &stats->intervals, entries) {
+                timed_average_account(&s->latency[cookie->type], latency_ns);
+            }
         }
     }
 
-    qemu_mutex_unlock(&stats->lock);
-
     cookie->type = BLOCK_ACCT_NONE;
 }
 
-- 
2.29.2


