Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 370116E8E56
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:38:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQje-00062I-Ue; Thu, 20 Apr 2023 05:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaotianrui@loongson.cn>)
 id 1ppQjb-0005hc-1H
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:37:47 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhaotianrui@loongson.cn>) id 1ppQjX-0004PE-BV
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:37:45 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Bxok6KB0FkxnEfAA--.37551S3;
 Thu, 20 Apr 2023 17:36:10 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxwOSGB0FkUfEwAA--.29752S9; 
 Thu, 20 Apr 2023 17:36:10 +0800 (CST)
From: Tianrui Zhao <zhaotianrui@loongson.cn>
To: qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, gaosong@loongson.cn
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 maobibo@loongson.cn, zhaotianrui@loongson.cn
Subject: [PATCH RFC v1 07/10] target/loongarch: Implement kvm_arch_handle_exit
Date: Thu, 20 Apr 2023 17:36:03 +0800
Message-Id: <20230420093606.3366969-8-zhaotianrui@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230420093606.3366969-1-zhaotianrui@loongson.cn>
References: <20230420093606.3366969-1-zhaotianrui@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxwOSGB0FkUfEwAA--.29752S9
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Cw4UJF4UuF1kXFy5ur17ZFb_yoW8Gr4Upa
 y7Arn0krWxW39rJwnxX3Z3Wr13ZFW0ganrXay7trWFvw45Z34rCFy8KwnIqFW5t34xJw40
 qF1xA3ZF9F1jvrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b0kFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
 0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCF
 FI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x0Yz7
 v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv
 8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
 xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
 jxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
 0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
 67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=zhaotianrui@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Implement kvm_arch_handle_exit for loongarch. In this
function, the KVM_EXIT_LOONGARCH_IOCSR is handled,
we read or write the iocsr address space by the addr,
length and is_write argument in kvm_run.

Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
---
 target/loongarch/kvm.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/target/loongarch/kvm.c b/target/loongarch/kvm.c
index f8772bbb27..4ce343d276 100644
--- a/target/loongarch/kvm.c
+++ b/target/loongarch/kvm.c
@@ -499,7 +499,29 @@ bool kvm_arch_cpu_check_are_resettable(void)
 
 int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
 {
-    return 0;
+    int ret = 0;
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+    MemTxAttrs attrs = {};
+
+    attrs.requester_id = env_cpu(env)->cpu_index;
+
+    DPRINTF("%s\n", __func__);
+    switch (run->exit_reason) {
+    case KVM_EXIT_LOONGARCH_IOCSR:
+        address_space_rw(&env->address_space_iocsr,
+                         run->iocsr_io.phys_addr,
+                         attrs,
+                         run->iocsr_io.data,
+                         run->iocsr_io.len,
+                         run->iocsr_io.is_write);
+        break;
+    default:
+        ret = -1;
+        fprintf(stderr, "KVM: unknown exit reason %d\n", run->exit_reason);
+        break;
+    }
+    return ret;
 }
 
 void kvm_arch_accel_class_init(ObjectClass *oc)
-- 
2.31.1


