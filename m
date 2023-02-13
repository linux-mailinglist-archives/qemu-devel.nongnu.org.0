Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B46693B6D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 01:41:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRMtQ-0000AL-31; Sun, 12 Feb 2023 19:40:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pRMtM-00008p-7B
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 19:40:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pRMtF-0003G3-OJ
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 19:40:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676248813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MieI0tUPvKHAzyaNhamlVacY89iWUjdbjGkwj8aXQPw=;
 b=f8Iw/R+K4KbfrxmFqDOUYPUKsUDd4sfLrQGR/4XLGk4R5/SbZhEgMXFKUCU2spHWPdxLrJ
 RK02AP+cTH/T+HtHMDJnqncO5FzLxvPEz8PzZBJjzYIr+1QaQWkhZu/wc73GuTAH92oo9Q
 zgUmPD27frsaOaVB/PObAFrnbGm+fu4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-nSIowKVqNtacQbJLZsTuTA-1; Sun, 12 Feb 2023 19:40:12 -0500
X-MC-Unique: nSIowKVqNtacQbJLZsTuTA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF1DD800B24;
 Mon, 13 Feb 2023 00:40:11 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-114.bne.redhat.com [10.64.54.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76264401014C;
 Mon, 13 Feb 2023 00:40:06 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com,
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 maz@kernel.org, zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v1 4/6] kvm: Add helper kvm_dirty_ring_init()
Date: Mon, 13 Feb 2023 08:39:23 +0800
Message-Id: <20230213003925.40158-5-gshan@redhat.com>
In-Reply-To: <20230213003925.40158-1-gshan@redhat.com>
References: <20230213003925.40158-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Due to multiple capabilities associated with the dirty ring for different
architectures: KVM_CAP_DIRTY_{LOG_RING, LOG_RING_ACQ_REL} for x86 and
arm64 separately. There will be more to be done in order to support the
dirty ring for arm64.

Lets add helper kvm_dirty_ring_init() to enable the dirty ring. With this,
the code looks a bit clean.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 accel/kvm/kvm-all.c | 76 ++++++++++++++++++++++++++++-----------------
 1 file changed, 47 insertions(+), 29 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index b5e12de522..e5035026c9 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1453,6 +1453,50 @@ static int kvm_dirty_ring_reaper_init(KVMState *s)
     return 0;
 }
 
+static int kvm_dirty_ring_init(KVMState *s)
+{
+    uint32_t ring_size = s->kvm_dirty_ring_size;
+    uint64_t ring_bytes = ring_size * sizeof(struct kvm_dirty_gfn);
+    int ret;
+
+    s->kvm_dirty_ring_size = 0;
+    s->kvm_dirty_ring_bytes = 0;
+
+    /* Bail if the dirty ring size isn't specified */
+    if (!ring_size) {
+        return 0;
+    }
+
+    /*
+     * Read the max supported pages. Fall back to dirty logging mode
+     * if the dirty ring isn't supported.
+     */
+    ret = kvm_vm_check_extension(s, KVM_CAP_DIRTY_LOG_RING);
+    if (ret <= 0) {
+        warn_report("KVM dirty ring not available, using bitmap method");
+        return 0;
+    }
+
+    if (ring_bytes > ret) {
+        error_report("KVM dirty ring size %" PRIu32 " too big "
+                     "(maximum is %ld).  Please use a smaller value.",
+                     ring_size, (long)ret / sizeof(struct kvm_dirty_gfn));
+        return -EINVAL;
+    }
+
+    ret = kvm_vm_enable_cap(s, KVM_CAP_DIRTY_LOG_RING, 0, ring_bytes);
+    if (ret) {
+        error_report("Enabling of KVM dirty ring failed: %s. "
+                     "Suggested minimum value is 1024.", strerror(-ret));
+        return -EIO;
+    }
+
+    s->kvm_dirty_ring_size = ring_size;
+    s->kvm_dirty_ring_bytes = ring_bytes;
+
+    return 0;
+}
+
 static void kvm_region_add(MemoryListener *listener,
                            MemoryRegionSection *section)
 {
@@ -2522,35 +2566,9 @@ static int kvm_init(MachineState *ms)
      * Enable KVM dirty ring if supported, otherwise fall back to
      * dirty logging mode
      */
-    if (s->kvm_dirty_ring_size > 0) {
-        uint64_t ring_bytes;
-
-        ring_bytes = s->kvm_dirty_ring_size * sizeof(struct kvm_dirty_gfn);
-
-        /* Read the max supported pages */
-        ret = kvm_vm_check_extension(s, KVM_CAP_DIRTY_LOG_RING);
-        if (ret > 0) {
-            if (ring_bytes > ret) {
-                error_report("KVM dirty ring size %" PRIu32 " too big "
-                             "(maximum is %ld).  Please use a smaller value.",
-                             s->kvm_dirty_ring_size,
-                             (long)ret / sizeof(struct kvm_dirty_gfn));
-                ret = -EINVAL;
-                goto err;
-            }
-
-            ret = kvm_vm_enable_cap(s, KVM_CAP_DIRTY_LOG_RING, 0, ring_bytes);
-            if (ret) {
-                error_report("Enabling of KVM dirty ring failed: %s. "
-                             "Suggested minimum value is 1024.", strerror(-ret));
-                goto err;
-            }
-
-            s->kvm_dirty_ring_bytes = ring_bytes;
-         } else {
-             warn_report("KVM dirty ring not available, using bitmap method");
-             s->kvm_dirty_ring_size = 0;
-        }
+    ret = kvm_dirty_ring_init(s);
+    if (ret < 0) {
+        goto err;
     }
 
     /*
-- 
2.23.0


