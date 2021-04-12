Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6654135BA6F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 08:56:28 +0200 (CEST)
Received: from localhost ([::1]:50232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVqUl-0001OO-Cz
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 02:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1lVqSG-00088Q-Hx; Mon, 12 Apr 2021 02:53:52 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1lVqSD-0004cj-Mi; Mon, 12 Apr 2021 02:53:52 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FJfXg3Pn4zqTLc;
 Mon, 12 Apr 2021 14:51:31 +0800 (CST)
Received: from huawei.com (10.174.186.236) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.498.0; Mon, 12 Apr 2021
 14:53:35 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
Subject: [PATCH RFC v5 09/12] target/riscv: Add host cpu type
Date: Mon, 12 Apr 2021 14:52:43 +0800
Message-ID: <20210412065246.1853-10-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20210412065246.1853-1-jiangyifei@huawei.com>
References: <20210412065246.1853-1-jiangyifei@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.236]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=jiangyifei@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: bin.meng@windriver.com, sagark@eecs.berkeley.edu, kvm@vger.kernel.org,
 libvir-list@redhat.com, kbastian@mail.uni-paderborn.de, anup.patel@wdc.com,
 yinyipeng1@huawei.com, Alistair.Francis@wdc.com,
 Yifei Jiang <jiangyifei@huawei.com>, kvm-riscv@lists.infradead.org,
 palmer@dabbelt.com, fanliang@huawei.com, wu.wubin@huawei.com,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'host' type cpu is set isa to RVXLEN simply, more isa info
will obtain from KVM in kvm_arch_init_vcpu()

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
---
 target/riscv/cpu.c | 9 +++++++++
 target/riscv/cpu.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index dd34ab4978..8132d35a92 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -216,6 +216,12 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
 }
 #endif
 
+static void riscv_host_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    set_misa(env, RVXLEN);
+}
+
 static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
 {
     ObjectClass *oc;
@@ -706,6 +712,9 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .class_init = riscv_cpu_class_init,
     },
     DEFINE_CPU(TYPE_RISCV_CPU_ANY,              riscv_any_cpu_init),
+#if defined(CONFIG_KVM)
+    DEFINE_CPU(TYPE_RISCV_CPU_HOST,             riscv_host_cpu_init),
+#endif
 #if defined(TARGET_RISCV32)
     DEFINE_CPU(TYPE_RISCV_CPU_BASE32,           rv32_base_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_IBEX,             rv32_ibex_cpu_init),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index a489d94187..3ca3dad341 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -43,6 +43,7 @@
 #define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51")
 #define TYPE_RISCV_CPU_SIFIVE_U34       RISCV_CPU_TYPE_NAME("sifive-u34")
 #define TYPE_RISCV_CPU_SIFIVE_U54       RISCV_CPU_TYPE_NAME("sifive-u54")
+#define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
 
 #if defined(TARGET_RISCV32)
 # define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE32
-- 
2.19.1


