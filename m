Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F453BF064
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 21:41:55 +0200 (CEST)
Received: from localhost ([::1]:55266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1DQh-0001j3-00
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 15:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1DJZ-0004BO-H3
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:34:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1DJW-0007nv-HU
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:34:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625686470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=muJDJ7+wfZs2/M1m0FdspOh9UZ+U4wDZmyCZZIiyx5A=;
 b=RFXgj1NTysGWtxp+oDG2fb1kpPAemvmHf6mAHAoriOqlWT1/9Cmfb6rmnKyYjlaFIHSdA2
 BjGuS+zMHpWgsSxIrZwNbWZrYa6u4yis3X5rGBMoFidnzQomViCzP12uZ9jcZ1l95kq5iG
 bjU2c7UWM9LGuYLEuN2b5McIdIYhdCI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-kQaNX9OPPUKCenRNG8JFYQ-1; Wed, 07 Jul 2021 15:34:28 -0400
X-MC-Unique: kQaNX9OPPUKCenRNG8JFYQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0C821023F45;
 Wed,  7 Jul 2021 19:34:26 +0000 (UTC)
Received: from localhost (ovpn-113-79.rdu2.redhat.com [10.10.113.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B90BD100EBB0;
 Wed,  7 Jul 2021 19:34:09 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 12/15] softmmu/physmem: Don't use atomic operations in
 ram_block_discard_(disable|require)
Date: Wed,  7 Jul 2021 15:32:38 -0400
Message-Id: <20210707193241.2659335-13-ehabkost@redhat.com>
In-Reply-To: <20210707193241.2659335-1-ehabkost@redhat.com>
References: <20210707193241.2659335-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

We have users in migration context that don't hold the BQL (when
finishing migration). To prepare for further changes, use a dedicated mutex
instead of atomic operations. Keep using qatomic_read ("READ_ONCE") for the
functions that only extract the current state (e.g., used by
virtio-balloon), locking isn't necessary.

While at it, split up the counter into two variables to make it easier
to understand.

Suggested-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Auger Eric <eric.auger@redhat.com>
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
Cc: teawater <teawaterz@linux.alibaba.com>
Cc: Marek Kedzierski <mkedzier@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210413095531.25603-11-david@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 softmmu/physmem.c | 70 ++++++++++++++++++++++++++---------------------
 1 file changed, 39 insertions(+), 31 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 9b171c9dbe5..f1275b61f84 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -3684,56 +3684,64 @@ void mtree_print_dispatch(AddressSpaceDispatch *d, MemoryRegion *root)
     }
 }
 
-/*
- * If positive, discarding RAM is disabled. If negative, discarding RAM is
- * required to work and cannot be disabled.
- */
-static int ram_block_discard_disabled;
+static unsigned int ram_block_discard_required_cnt;
+static unsigned int ram_block_discard_disabled_cnt;
+static QemuMutex ram_block_discard_disable_mutex;
+
+static void ram_block_discard_disable_mutex_lock(void)
+{
+    static gsize initialized;
+
+    if (g_once_init_enter(&initialized)) {
+        qemu_mutex_init(&ram_block_discard_disable_mutex);
+        g_once_init_leave(&initialized, 1);
+    }
+    qemu_mutex_lock(&ram_block_discard_disable_mutex);
+}
+
+static void ram_block_discard_disable_mutex_unlock(void)
+{
+    qemu_mutex_unlock(&ram_block_discard_disable_mutex);
+}
 
 int ram_block_discard_disable(bool state)
 {
-    int old;
+    int ret = 0;
 
+    ram_block_discard_disable_mutex_lock();
     if (!state) {
-        qatomic_dec(&ram_block_discard_disabled);
-        return 0;
+        ram_block_discard_disabled_cnt--;
+    } else if (!ram_block_discard_required_cnt) {
+        ram_block_discard_disabled_cnt++;
+    } else {
+        ret = -EBUSY;
     }
-
-    do {
-        old = qatomic_read(&ram_block_discard_disabled);
-        if (old < 0) {
-            return -EBUSY;
-        }
-    } while (qatomic_cmpxchg(&ram_block_discard_disabled,
-                             old, old + 1) != old);
-    return 0;
+    ram_block_discard_disable_mutex_unlock();
+    return ret;
 }
 
 int ram_block_discard_require(bool state)
 {
-    int old;
+    int ret = 0;
 
+    ram_block_discard_disable_mutex_lock();
     if (!state) {
-        qatomic_inc(&ram_block_discard_disabled);
-        return 0;
+        ram_block_discard_required_cnt--;
+    } else if (!ram_block_discard_disabled_cnt) {
+        ram_block_discard_required_cnt++;
+    } else {
+        ret = -EBUSY;
     }
-
-    do {
-        old = qatomic_read(&ram_block_discard_disabled);
-        if (old > 0) {
-            return -EBUSY;
-        }
-    } while (qatomic_cmpxchg(&ram_block_discard_disabled,
-                             old, old - 1) != old);
-    return 0;
+    ram_block_discard_disable_mutex_unlock();
+    return ret;
 }
 
 bool ram_block_discard_is_disabled(void)
 {
-    return qatomic_read(&ram_block_discard_disabled) > 0;
+    return qatomic_read(&ram_block_discard_disabled_cnt);
 }
 
 bool ram_block_discard_is_required(void)
 {
-    return qatomic_read(&ram_block_discard_disabled) < 0;
+    return qatomic_read(&ram_block_discard_required_cnt);
 }
-- 
2.31.1


