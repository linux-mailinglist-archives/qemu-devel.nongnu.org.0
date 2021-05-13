Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D67A37FCDB
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:52:24 +0200 (CEST)
Received: from localhost ([::1]:38842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhFVX-0005CK-Fn
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lhFHs-00065z-Ow
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:38:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lhFHr-0001Je-3O
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:38:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620927494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yaNTKcQ78iWG3tweSBSqT2U1/jqZGHJyko/SiaBEb6o=;
 b=G00jd8i/dk+Ovdum02OySMVRjN98tAA0WNjBALnFn1by1N2/V83OElsv8iOegrhmlUjOeY
 IKpKroMgOXz45eMRnGeh2eyIm9IyCY4vXhiKS0XbLyS1OA4ALOe3axWWmhjNvc7Nf0esEB
 q6BWdXXfv2WiIoCeEzL12F4T2EI7eqc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-EYzJh8AdOviJcn_xwfZJwA-1; Thu, 13 May 2021 13:38:09 -0400
X-MC-Unique: EYzJh8AdOviJcn_xwfZJwA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEDA2107ACE3;
 Thu, 13 May 2021 17:38:08 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-113-200.ams2.redhat.com
 [10.36.113.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44D685D6AC;
 Thu, 13 May 2021 17:38:07 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, david@redhat.com, zhukeqian1@huawei.com,
 jiangkunkun@huawei.com, armbru@redhat.com, peter.maydell@linaro.org,
 huangy81@chinatelecom.cn
Subject: [PULL 07/17] numa: Make all callbacks of ram block notifiers optional
Date: Thu, 13 May 2021 18:37:27 +0100
Message-Id: <20210513173737.279402-8-dgilbert@redhat.com>
In-Reply-To: <20210513173737.279402-1-dgilbert@redhat.com>
References: <20210513173737.279402-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Let's make add/remove optional. We want to introduce a RAM block
notifier for RAM migration that is only interested in resize events.

Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210429112708.12291-4-david@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hw/core/numa.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index 4c58b2348d..1058d3697b 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -818,8 +818,11 @@ static int ram_block_notify_add_single(RAMBlock *rb, void *opaque)
 void ram_block_notifier_add(RAMBlockNotifier *n)
 {
     QLIST_INSERT_HEAD(&ram_list.ramblock_notifiers, n, next);
+
     /* Notify about all existing ram blocks. */
-    qemu_ram_foreach_block(ram_block_notify_add_single, n);
+    if (n->ram_block_added) {
+        qemu_ram_foreach_block(ram_block_notify_add_single, n);
+    }
 }
 
 void ram_block_notifier_remove(RAMBlockNotifier *n)
@@ -832,7 +835,9 @@ void ram_block_notify_add(void *host, size_t size, size_t max_size)
     RAMBlockNotifier *notifier;
 
     QLIST_FOREACH(notifier, &ram_list.ramblock_notifiers, next) {
-        notifier->ram_block_added(notifier, host, size, max_size);
+        if (notifier->ram_block_added) {
+            notifier->ram_block_added(notifier, host, size, max_size);
+        }
     }
 }
 
@@ -841,7 +846,9 @@ void ram_block_notify_remove(void *host, size_t size, size_t max_size)
     RAMBlockNotifier *notifier;
 
     QLIST_FOREACH(notifier, &ram_list.ramblock_notifiers, next) {
-        notifier->ram_block_removed(notifier, host, size, max_size);
+        if (notifier->ram_block_removed) {
+            notifier->ram_block_removed(notifier, host, size, max_size);
+        }
     }
 }
 
-- 
2.31.1


