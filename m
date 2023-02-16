Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5286999BF
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:19:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSgyx-0008Bk-SH; Thu, 16 Feb 2023 11:19:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1pSgyh-000866-LU
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:19:25 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.223] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1pSgyf-00054c-EY
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:19:23 -0500
HMM_SOURCE_IP: 172.18.0.188:50698.1319324123
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-118.116.19.27 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 861F52800E3;
 Fri, 17 Feb 2023 00:19:14 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([118.116.19.27])
 by app0023 with ESMTP id f08dd78b756545d9a1458872790a429d for
 qemu-devel@nongnu.org; Fri, 17 Feb 2023 00:19:18 CST
X-Transaction-ID: f08dd78b756545d9a1458872790a429d
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 118.116.19.27
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v4 03/10] kvm: dirty-ring: Fix race with vcpu creation
Date: Fri, 17 Feb 2023 00:18:32 +0800
Message-Id: <1d14deb6684bcb7de1c9633c5bd21113988cc698.1676563222.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1676563222.git.huangy81@chinatelecom.cn>
References: <cover.1676563222.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1676563222.git.huangy81@chinatelecom.cn>
References: <cover.1676563222.git.huangy81@chinatelecom.cn>
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
index 9b26582655..47483cdfa0 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -685,6 +685,15 @@ static uint32_t kvm_dirty_ring_reap_one(KVMState *s, CPUState *cpu)
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
2.17.1


