Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA9D6F8E00
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 04:26:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv7bG-0008KO-Az; Fri, 05 May 2023 22:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaotianrui@loongson.cn>)
 id 1pv7bD-0008Ip-5q
 for qemu-devel@nongnu.org; Fri, 05 May 2023 22:24:39 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhaotianrui@loongson.cn>) id 1pv7b9-00051X-Ly
 for qemu-devel@nongnu.org; Fri, 05 May 2023 22:24:38 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8AxdfBeulVk+okFAA--.9261S3;
 Sat, 06 May 2023 10:24:30 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxOLZXulVkj9RMAA--.9112S5; 
 Sat, 06 May 2023 10:24:29 +0800 (CST)
From: Tianrui Zhao <zhaotianrui@loongson.cn>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 gaosong@loongson.cn, "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, maobibo@loongson.cn,
 zhaotianrui@loongson.cn, philmd@linaro.org, richard.henderson@linaro.org,
 peter.maydell@linaro.org
Subject: [PATCH RFC v3 3/9] target/loongarch: Supplement vcpu env initial when
 vcpu reset
Date: Sat,  6 May 2023 10:24:16 +0800
Message-Id: <20230506022422.59442-4-zhaotianrui@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230506022422.59442-1-zhaotianrui@loongson.cn>
References: <20230506022422.59442-1-zhaotianrui@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxOLZXulVkj9RMAA--.9112S5
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7uryxuF47CF4rJFy5Kr4fGrg_yoW8WF4fpr
 4I9rWqvw4rKFZrAan7Jas0qw1DXw1xKw1IqayfCas29FsrXr18ZFWv9wnFkFW7Aa4Fyr48
 ZFn8tr15XF4xXaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
 AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY
 1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
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

Supplement vcpu env initial when vcpu reset, including
init vcpu CSR_CPUID,CSR_TID to cpu->cpu_index. The two
regs will be used in kvm_get/set_csr_ioctl.

Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
---
 target/loongarch/cpu.c | 2 ++
 target/loongarch/cpu.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 97e6579f6a..d15b4b2844 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -486,10 +486,12 @@ static void loongarch_cpu_reset_hold(Object *obj)
 
     env->CSR_ESTAT = env->CSR_ESTAT & (~MAKE_64BIT_MASK(0, 2));
     env->CSR_RVACFG = FIELD_DP64(env->CSR_RVACFG, CSR_RVACFG, RBITS, 0);
+    env->CSR_CPUID = cs->cpu_index;
     env->CSR_TCFG = FIELD_DP64(env->CSR_TCFG, CSR_TCFG, EN, 0);
     env->CSR_LLBCTL = FIELD_DP64(env->CSR_LLBCTL, CSR_LLBCTL, KLO, 0);
     env->CSR_TLBRERA = FIELD_DP64(env->CSR_TLBRERA, CSR_TLBRERA, ISTLBR, 0);
     env->CSR_MERRCTL = FIELD_DP64(env->CSR_MERRCTL, CSR_MERRCTL, ISMERR, 0);
+    env->CSR_TID = cs->cpu_index;
 
     env->CSR_PRCFG3 = FIELD_DP64(env->CSR_PRCFG3, CSR_PRCFG3, TLB_TYPE, 2);
     env->CSR_PRCFG3 = FIELD_DP64(env->CSR_PRCFG3, CSR_PRCFG3, MTLB_ENTRY, 63);
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index e11c875188..1d9a4009b9 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -288,6 +288,7 @@ typedef struct CPUArchState {
     uint64_t CSR_PWCH;
     uint64_t CSR_STLBPS;
     uint64_t CSR_RVACFG;
+    uint64_t CSR_CPUID;
     uint64_t CSR_PRCFG1;
     uint64_t CSR_PRCFG2;
     uint64_t CSR_PRCFG3;
-- 
2.31.1


