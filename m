Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCBD6A3A22
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 05:29:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWV7u-0002dg-17; Sun, 26 Feb 2023 23:28:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pWV7t-0002dX-1C
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 23:28:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pWV7r-0003uK-IC
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 23:28:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677472115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HOhpwxg5W41kqEZ6DVz9gB+jt0gJUFC4UZr/Z/fVdA4=;
 b=hGiLz0sv/7SRmgjt4PmEYcwtBNSLGKiK13lNEMqH4RRHxZ0AAQ/UJJ/UHqu8JIw14tkwVF
 d0TSvbI/DJ2WOB6LgtHZQwiTYbWeh6Yh36NwoSOr3SaWT+GiAFjJgsklHFtS+Z1nRY+vvy
 OM3jcIbHX7zQmNo27MQ6x7Vz8+T2HV4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-dU3GxINjPJqNarUJSbc8uQ-1; Sun, 26 Feb 2023 23:28:33 -0500
X-MC-Unique: dU3GxINjPJqNarUJSbc8uQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98F10101A521;
 Mon, 27 Feb 2023 04:28:32 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-58.bne.redhat.com [10.64.54.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B6CA1121314;
 Mon, 27 Feb 2023 04:28:27 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com,
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 maz@kernel.org, zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v2 2/4] kvm: Synchronize the backup bitmap in the last stage
Date: Mon, 27 Feb 2023 12:26:27 +0800
Message-Id: <20230227042629.339747-3-gshan@redhat.com>
In-Reply-To: <20230227042629.339747-1-gshan@redhat.com>
References: <20230227042629.339747-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
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

In the last stage of live migration or memory slot removal, the
backup bitmap needs to be synchronized when it has been enabled.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
---
 accel/kvm/kvm-all.c      | 11 +++++++++++
 include/sysemu/kvm_int.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 01a6a026af..b5e12de522 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1352,6 +1352,10 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
                  */
                 if (kvm_state->kvm_dirty_ring_size) {
                     kvm_dirty_ring_reap_locked(kvm_state, NULL);
+                    if (kvm_state->kvm_dirty_ring_with_bitmap) {
+                        kvm_slot_sync_dirty_pages(mem);
+                        kvm_slot_get_dirty_log(kvm_state, mem);
+                    }
                 } else {
                     kvm_slot_get_dirty_log(kvm_state, mem);
                 }
@@ -1573,6 +1577,12 @@ static void kvm_log_sync_global(MemoryListener *l, bool last_stage)
         mem = &kml->slots[i];
         if (mem->memory_size && mem->flags & KVM_MEM_LOG_DIRTY_PAGES) {
             kvm_slot_sync_dirty_pages(mem);
+
+            if (s->kvm_dirty_ring_with_bitmap && last_stage &&
+                kvm_slot_get_dirty_log(s, mem)) {
+                kvm_slot_sync_dirty_pages(mem);
+            }
+
             /*
              * This is not needed by KVM_GET_DIRTY_LOG because the
              * ioctl will unconditionally overwrite the whole region.
@@ -3701,6 +3711,7 @@ static void kvm_accel_instance_init(Object *obj)
     s->kernel_irqchip_split = ON_OFF_AUTO_AUTO;
     /* KVM dirty ring is by default off */
     s->kvm_dirty_ring_size = 0;
+    s->kvm_dirty_ring_with_bitmap = false;
     s->notify_vmexit = NOTIFY_VMEXIT_OPTION_RUN;
     s->notify_window = 0;
 }
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index 60b520a13e..fdd5b1bde0 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -115,6 +115,7 @@ struct KVMState
     } *as;
     uint64_t kvm_dirty_ring_bytes;  /* Size of the per-vcpu dirty ring */
     uint32_t kvm_dirty_ring_size;   /* Number of dirty GFNs per ring */
+    bool kvm_dirty_ring_with_bitmap;
     struct KVMDirtyRingReaper reaper;
     NotifyVmexitOption notify_vmexit;
     uint32_t notify_window;
-- 
2.23.0


