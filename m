Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CCC6417CB
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Dec 2022 17:40:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1VXw-0001tc-Vj; Sat, 03 Dec 2022 11:39:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1p1VXp-0001t2-2J
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 11:39:17 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.223] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1p1VXm-0004lV-Um
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 11:39:16 -0500
HMM_SOURCE_IP: 172.18.0.218:35940.967913464
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.43.82 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id C93542800CB;
 Sun,  4 Dec 2022 00:39:10 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([125.69.43.82])
 by app0025 with ESMTP id 53a174e7275940cb8ce935665b44c9c1 for
 qemu-devel@nongnu.org; Sun, 04 Dec 2022 00:39:11 CST
X-Transaction-ID: 53a174e7275940cb8ce935665b44c9c1
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 125.69.43.82
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Eric Blake <eblake@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 03/10] kvm: dirty-ring: Fix race with vcpu creation
Date: Sun,  4 Dec 2022 00:38:48 +0800
Message-Id: <1b3cb65e09304c3327121b89cb7387961a59c408.1670085207.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1670085207.git.huangy81@chinatelecom.cn>
References: <cover.1670085207.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1670085207.git.huangy81@chinatelecom.cn>
References: <cover.1670085207.git.huangy81@chinatelecom.cn>
Received-SPF: pass client-ip=42.123.76.223;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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

From: Peter Xu <peterx@redhat.com>

It's possible that we want to reap a dirty ring on a vcpu that is during
creation, because the vcpu is put onto list (CPU_FOREACH visible) before
initialization of the structures.  In this case:

qemu_init_vcpu
    x86_cpu_realizefn
        cpu_exec_realizefn
            cpu_list_add      <---- can be probed by CPU_FOREACH
        qemu_init_vcpu
            cpus_accel->create_vcpu_thread(cpu);
                kvm_init_vcpu
                    map kvm_dirty_gfns  <--- kvm_dirty_gfns valid

Don't try to reap dirty ring on vcpus during creation or it'll crash.

Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=2124756
Reported-by: Xiaohui Li <xiaohli@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 accel/kvm/kvm-all.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index f99b0be..ff26b07 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -683,6 +683,15 @@ static uint32_t kvm_dirty_ring_reap_one(KVMState *s, CPUState *cpu)
     uint32_t ring_size = s->kvm_dirty_ring_size;
     uint32_t count = 0, fetch = cpu->kvm_fetch_index;
 
+    /*
+     * It's possible that we race with vcpu creation code where the vcpu is
+     * put onto the vcpus list but not yet initialized the dirty ring
+     * structures.  If so, skip it.
+     */
+    if (!cpu->created) {
+        return 0;
+    }
+
     assert(dirty_gfns && ring_size);
     trace_kvm_dirty_ring_reap_vcpu(cpu->cpu_index);
 
-- 
1.8.3.1


