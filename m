Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C43CB44D83D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 15:28:08 +0100 (CET)
Received: from localhost ([::1]:47450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlB3f-0006sP-U0
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 09:28:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mlAst-0003cH-JK
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:16:59 -0500
Received: from mga18.intel.com ([134.134.136.126]:11032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mlAso-0006m7-Ue
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:16:59 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="219806968"
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="219806968"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 06:16:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="492556213"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga007.jf.intel.com with ESMTP; 11 Nov 2021 06:16:40 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [RFC PATCH 11/13] kvm: register private memory slots
Date: Thu, 11 Nov 2021 22:13:50 +0800
Message-Id: <20211111141352.26311-12-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211111141352.26311-1-chao.p.peng@linux.intel.com>
References: <20211111141352.26311-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=134.134.136.126;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga18.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 david@redhat.com, "J . Bruce Fields" <bfields@fieldses.org>,
 dave.hansen@intel.com, "H . Peter Anvin" <hpa@zytor.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 Sean Christopherson <seanjc@google.com>, susie.li@intel.com,
 Jeff Layton <jlayton@kernel.org>, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 accel/kvm/kvm-all.c      | 9 +++++++++
 include/sysemu/kvm_int.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 0125c17edb..d336458e9e 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -138,6 +138,7 @@ struct KVMState
     QTAILQ_HEAD(, KVMMSIRoute) msi_hashtab[KVM_MSI_HASHTAB_SIZE];
 #endif
     KVMMemoryListener memory_listener;
+    KVMMemoryListener private_memory_listener;
     QLIST_HEAD(, KVMParkedVcpu) kvm_parked_vcpus;
 
     /* For "info mtree -f" to tell if an MR is registered in KVM */
@@ -359,6 +360,7 @@ static int kvm_set_user_memory_region(KVMMemoryListener *kml, KVMSlot *slot, boo
     mem.guest_phys_addr = slot->start_addr;
     mem.userspace_addr = (unsigned long)slot->ram;
     mem.flags = slot->flags;
+    mem.fd = slot->fd;
 
     if (slot->memory_size && !new && (mem.flags ^ slot->old_flags) & KVM_MEM_READONLY) {
         /* Set the slot size to 0 before setting the slot to the desired
@@ -1423,6 +1425,9 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
         mem->ram_start_offset = ram_start_offset;
         mem->ram = ram;
         mem->flags = kvm_mem_flags(mr);
+        if (mr->ram_block) {
+            mem->fd = mr->ram_block->fd;
+        }
         kvm_slot_init_dirty_bitmap(mem);
         err = kvm_set_user_memory_region(kml, mem, true);
         if (err) {
@@ -2580,6 +2585,9 @@ static int kvm_init(MachineState *ms)
 
     kvm_memory_listener_register(s, &s->memory_listener,
                                  &address_space_memory, 0);
+    kvm_memory_listener_register(s, &s->private_memory_listener,
+                                 &address_space_private_memory, 2);
+
     if (kvm_eventfds_allowed) {
         memory_listener_register(&kvm_io_listener,
                                  &address_space_io);
@@ -2613,6 +2621,7 @@ err:
         close(s->fd);
     }
     g_free(s->memory_listener.slots);
+    g_free(s->private_memory_listener.slots);
 
     return ret;
 }
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index c788452cd9..0c11c63263 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -28,6 +28,7 @@ typedef struct KVMSlot
     int as_id;
     /* Cache of the offset in ram address space */
     ram_addr_t ram_start_offset;
+    int fd;
 } KVMSlot;
 
 typedef struct KVMMemoryListener {
-- 
2.17.1


