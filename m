Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 914B23B736E
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 15:44:18 +0200 (CEST)
Received: from localhost ([::1]:59736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyE2C-0003ar-94
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 09:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lyDxi-0003UP-24
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 09:39:38 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:59772
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lyDxc-00043u-RR
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 09:39:36 -0400
HMM_SOURCE_IP: 172.18.0.48:50414.1447535983
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.43.101?logid-1ed94964eb2a4b1eab273f92c2ac1cf2
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 2C7AB280097;
 Tue, 29 Jun 2021 21:39:30 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id e04062918c4340fab2187bc998fc59c1 for
 qemu-devel@nongnu.org; Tue Jun 29 21:39:29 2021
X-Transaction-ID: e04062918c4340fab2187bc998fc59c1
X-filter-score: 
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel@nongnu.org
Subject: [PATCH v11 1/6] KVM: introduce dirty_pages and kvm_dirty_ring_enabled
Date: Tue, 29 Jun 2021 21:39:13 +0800
Message-Id: <1303c5663728fccba0636688fc138ba92912f73d.1624973150.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1624973150.git.huangy81@chinatelecom.cn>
References: <cover.1624973150.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1624973150.git.huangy81@chinatelecom.cn>
References: <cover.1624973150.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Hyman <huangy81@chinatelecom.cn>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

dirty_pages is used to calculate dirtyrate via dirty ring, when
enabled, kvm-reaper will increase the dirty pages after gfns
being dirtied.

kvm_dirty_ring_enabled shows if kvm-reaper is working. dirtyrate
thread could use it to check if measurement can base on dirty
ring feature.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Message-Id: <fee5fb2ab17ec2159405fc54a3cff8e02322f816.1624040308.git.huangy81@chinatelecom.cn>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 accel/kvm/kvm-all.c   | 7 +++++++
 include/hw/core/cpu.h | 1 +
 include/sysemu/kvm.h  | 1 +
 3 files changed, 9 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index e5b10dd..e0e88a2 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -469,6 +469,7 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
     cpu->kvm_fd = ret;
     cpu->kvm_state = s;
     cpu->vcpu_dirty = true;
+    cpu->dirty_pages = 0;
 
     mmap_size = kvm_ioctl(s, KVM_GET_VCPU_MMAP_SIZE, 0);
     if (mmap_size < 0) {
@@ -743,6 +744,7 @@ static uint32_t kvm_dirty_ring_reap_one(KVMState *s, CPUState *cpu)
         count++;
     }
     cpu->kvm_fetch_index = fetch;
+    cpu->dirty_pages += count;
 
     return count;
 }
@@ -2293,6 +2295,11 @@ bool kvm_vcpu_id_is_valid(int vcpu_id)
     return vcpu_id >= 0 && vcpu_id < kvm_max_vcpu_id(s);
 }
 
+bool kvm_dirty_ring_enabled(void)
+{
+    return kvm_state->kvm_dirty_ring_size ? true : false;
+}
+
 static int kvm_init(MachineState *ms)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 4e0ea68..80fcb1d 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -374,6 +374,7 @@ struct CPUState {
     struct kvm_run *kvm_run;
     struct kvm_dirty_gfn *kvm_dirty_gfns;
     uint32_t kvm_fetch_index;
+    uint64_t dirty_pages;
 
     /* Used for events with 'vcpu' and *without* the 'disabled' properties */
     DECLARE_BITMAP(trace_dstate_delayed, CPU_TRACE_DSTATE_MAX_EVENTS);
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index a1ab1ee..7b22aeb 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -547,4 +547,5 @@ bool kvm_cpu_check_are_resettable(void);
 
 bool kvm_arch_cpu_check_are_resettable(void);
 
+bool kvm_dirty_ring_enabled(void);
 #endif
-- 
1.8.3.1


