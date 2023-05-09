Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E41826FBD19
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 04:23:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwCzN-0004GA-NE; Mon, 08 May 2023 22:22:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pwCzK-0004FI-UY
 for qemu-devel@nongnu.org; Mon, 08 May 2023 22:22:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pwCzJ-0001xm-1c
 for qemu-devel@nongnu.org; Mon, 08 May 2023 22:22:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683598920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dLq5iqfZvdwlN8H0aKrQpli7JcXdiwyOEHKYl3gEayQ=;
 b=Nf2LZJyWMjMUXaWZfoo02Pud84BrSKghG+sEkRwZ2eypNtZxyZP23IE//BMiluYBLodNuB
 hUZ6kBEYjfi7FlkKD494a1hBayN+9gowGKnm5b22/boQIv7SkOxLZFWgBCTwuE19FT8y2H
 BTWrSC/EpjPd/H8Iid+zq4YGSkLgRC0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-1Toaw5ZaPrSis9Tq_jJA5A-1; Mon, 08 May 2023 22:21:56 -0400
X-MC-Unique: 1Toaw5ZaPrSis9Tq_jJA5A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 753F91C05129;
 Tue,  9 May 2023 02:21:56 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-118.bne.redhat.com [10.64.54.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E8E6492B00;
 Tue,  9 May 2023 02:21:51 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com,
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 maz@kernel.org, zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v3 3/4] kvm: Add helper kvm_dirty_ring_init()
Date: Tue,  9 May 2023 12:21:21 +1000
Message-Id: <20230509022122.20888-4-gshan@redhat.com>
In-Reply-To: <20230509022122.20888-1-gshan@redhat.com>
References: <20230509022122.20888-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reviewed-by: Peter Xu <peterx@redhat.com>
Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
---
 accel/kvm/kvm-all.c | 76 ++++++++++++++++++++++++++++-----------------
 1 file changed, 47 insertions(+), 29 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index c3aaabf304..5d0de9d0a8 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1462,6 +1462,50 @@ static int kvm_dirty_ring_reaper_init(KVMState *s)
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
@@ -2531,35 +2575,9 @@ static int kvm_init(MachineState *ms)
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


