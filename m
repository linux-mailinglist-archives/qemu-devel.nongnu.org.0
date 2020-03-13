Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E290183FD2
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Mar 2020 04:53:14 +0100 (CET)
Received: from localhost ([::1]:53371 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCbNo-0008AK-Sx
	for lists+qemu-devel@lfdr.de; Thu, 12 Mar 2020 23:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47824)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jiangyifei@huawei.com>) id 1jCbMI-0006tc-Uc
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 23:51:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jiangyifei@huawei.com>) id 1jCbMH-0000at-Np
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 23:51:38 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:34910 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jiangyifei@huawei.com>)
 id 1jCbMH-0000SG-Ak; Thu, 12 Mar 2020 23:51:37 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 854F2B06234F1C8F1D0E;
 Fri, 13 Mar 2020 11:51:31 +0800 (CST)
Received: from huawei.com (10.133.201.158) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Fri, 13 Mar 2020
 11:51:21 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
Subject: [PATCH RFC 3/9] target/riscv: Implement function kvm_arch_init_vcpu
Date: Fri, 13 Mar 2020 11:49:43 +0800
Message-ID: <20200313034949.3028-4-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
In-Reply-To: <20200313034949.3028-1-jiangyifei@huawei.com>
References: <20200313034949.3028-1-jiangyifei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.201.158]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: anup.patel@wdc.com, zhang.zhanghailiang@huawei.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 victor.zhangxiaofeng@huawei.com, Alistair.Francis@wdc.com,
 yinyipeng1@huawei.com, palmer@dabbelt.com, Yifei Jiang <jiangyifei@huawei.com>,
 dengkai1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Get isa info from kvm while kvm init.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
---
 target/riscv/kvm.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 8c386d9acf..3e8f8e7185 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -38,6 +38,18 @@
 #include "qemu/log.h"
 #include "hw/loader.h"
=20
+static __u64 kvm_riscv_reg_id(__u64 type, __u64 idx)
+{
+    __u64 id =3D KVM_REG_RISCV | type | idx;
+
+#if defined(TARGET_RISCV32)
+    id |=3D KVM_REG_SIZE_U32;
+#elif defined(TARGET_RISCV64)
+    id |=3D KVM_REG_SIZE_U64;
+#endif
+    return id;
+}
+
 const KVMCapabilityInfo kvm_arch_required_capabilities[] =3D {
     KVM_CAP_LAST_INFO
 };
@@ -79,7 +91,19 @@ void kvm_arch_init_irq_routing(KVMState *s)
=20
 int kvm_arch_init_vcpu(CPUState *cs)
 {
-    return 0;
+    int ret =3D 0;
+    uint64_t isa;
+    RISCVCPU *cpu =3D RISCV_CPU(cs);
+    __u64 id;
+
+    id =3D kvm_riscv_reg_id(KVM_REG_RISCV_CONFIG, KVM_REG_RISCV_CONFIG_R=
EG(isa));
+    ret =3D kvm_get_one_reg(cs, id, &isa);
+    if (ret) {
+        return ret;
+    }
+    cpu->env.misa =3D isa;
+
+    return ret;
 }
=20
 int kvm_arch_msi_data_to_gsi(uint32_t data)
--=20
2.19.1



