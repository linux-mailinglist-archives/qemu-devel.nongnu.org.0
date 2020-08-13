Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FC62438B6
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Aug 2020 12:38:47 +0200 (CEST)
Received: from localhost ([::1]:53044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6AdC-00011M-VT
	for lists+qemu-devel@lfdr.de; Thu, 13 Aug 2020 06:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1k6AXD-00007R-Mh; Thu, 13 Aug 2020 06:32:35 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4183 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1k6AXA-0006p0-Dr; Thu, 13 Aug 2020 06:32:35 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 179987BC8489A00C4CB9;
 Thu, 13 Aug 2020 18:32:27 +0800 (CST)
Received: from localhost.localdomain (10.175.104.175) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 13 Aug 2020 18:32:19 +0800
From: Peng Liang <liangpeng10@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC 3/9] target/arm: register CPU features for property
Date: Thu, 13 Aug 2020 18:26:51 +0800
Message-ID: <20200813102657.2588720-4-liangpeng10@huawei.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200813102657.2588720-1-liangpeng10@huawei.com>
References: <20200813102657.2588720-1-liangpeng10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=liangpeng10@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 06:32:27
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, cohuck@redhat.com,
 xiexiangyou@huawei.com, Peng Liang <liangpeng10@huawei.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Arm architecture specifies a number of ID registers that are
characterized as comprising a set of 4-bit ID fields. Each ID field
identifies the presence, and possibly the level of support for, a
particular feature in an implementation of the architecture. [1]

For most of the ID fields, there is a minimum presence value, equal to
or higher than which means the corresponding CPU feature is implemented.
Hence, we can use the minimum presence value to determine whether a CPU
feature is enabled and enable a CPU feature.

To disable a CPU feature, setting the corresponding ID field to 0x0/0xf
(for unsigned/signed field) seems as a good idea.  However, it maybe
lead to some problems.  For example,  ID_AA64PFR0_EL1.FP is a signed ID
field. ID_AA64PFR0_EL1.FP == 0x0 represents the implementation of FP
(floating-point) and ID_AA64PFR0_EL1.FP == 0x1 represents the
implementation of FPHP (half-precision floating-point).  If
ID_AA64PFR0_EL1.FP is set to 0xf when FPHP is disabled (which is also
disable FP), guest kernel maybe stuck.  Hence, we add a ni_value (means
not-implemented value) to disable a CPU feature safely.

[1] D13.1.3 Principles of the ID scheme for fields in ID registers in
    DDI.0487

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
---
 target/arm/cpu.c | 343 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 343 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 79d7a6b45c..113cf4a9e7 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1146,6 +1146,348 @@ unsigned int gt_cntfrq_period_ns(ARMCPU *cpu)
       NANOSECONDS_PER_SECOND / cpu->gt_cntfrq_hz : 1;
 }
 
+/**
+ * CPUFeatureInfo:
+ * @reg: The ID register where the ID field is in.
+ * @name: The name of the CPU feature.
+ * @length: The bit length of the ID field.
+ * @shift: The bit shift of the ID field in the ID register.
+ * @min_value: The minimum value equal to or larger than which means the CPU
+ *   feature is implemented.
+ * @ni_value: Not-implemented value. It will be set to the ID field when
+ *   disabling the CPU feature.  Usually, it's min_value - 1.
+ * @sign: Whether the ID field is signed.
+ * @is_32bit: Whether the CPU feature is for 32-bit.
+ *
+ * In ARM, a CPU feature is described by an ID field, which is a 4-bit field in
+ * an ID register.
+ */
+typedef struct CPUFeatureInfo {
+    CPUIDReg reg;
+    const char *name;
+    int length;
+    int shift;
+    int min_value;
+    int ni_value;
+    bool sign;
+    bool is_32bit;
+} CPUFeatureInfo;
+
+#define FIELD_INFO(id_reg, field, s, min_val, ni_val, is32bit) { \
+    .reg = id_reg, \
+    .length = R_ ## id_reg ## _ ## field ## _LENGTH, \
+    .shift = R_ ## id_reg ## _ ## field ## _SHIFT, \
+    .sign = s, \
+    .min_value = min_val, \
+    .ni_value = ni_val, \
+    .name = #field, \
+    .is_32bit = is32bit, \
+}
+
+static struct CPUFeatureInfo cpu_features[] = {
+    FIELD_INFO(ID_ISAR0, SWAP, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR0, BITCOUNT, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR0, BITFIELD, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR0, CMPBRANCH, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR0, COPROC, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR0, DEBUG, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR0, DIVIDE, false, 1, 0, true),
+
+    FIELD_INFO(ID_ISAR1, ENDIAN, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR1, EXCEPT, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR1, EXCEPT_AR, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR1, EXTEND, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR1, IFTHEN, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR1, IMMEDIATE, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR1, INTERWORK, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR1, JAZELLE, false, 1, 0, true),
+
+    FIELD_INFO(ID_ISAR2, LOADSTORE, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR2, MEMHINT, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR2, MULTIACCESSINT, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR2, MULT, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR2, MULTS, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR2, MULTU, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR2, PSR_AR, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR2, REVERSAL, false, 1, 0, true),
+
+    FIELD_INFO(ID_ISAR3, SATURATE, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR3, SIMD, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR3, SVC, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR3, SYNCHPRIM, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR3, TABBRANCH, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR3, T32COPY, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR3, TRUENOP, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR3, T32EE, false, 1, 0, true),
+
+    FIELD_INFO(ID_ISAR4, UNPRIV, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR4, WITHSHIFTS, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR4, WRITEBACK, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR4, SMC, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR4, BARRIER, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR4, SYNCHPRIM_FRAC, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR4, PSR_M, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR4, SWP_FRAC, false, 1, 0, true),
+
+    FIELD_INFO(ID_ISAR5, SEVL, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR5, AES, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR5, SHA1, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR5, SHA2, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR5, CRC32, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR5, RDM, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR5, VCMA, false, 1, 0, true),
+
+    FIELD_INFO(ID_ISAR6, JSCVT, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR6, DP, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR6, FHM, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR6, SB, false, 1, 0, true),
+    FIELD_INFO(ID_ISAR6, SPECRES, false, 1, 0, true),
+
+    FIELD_INFO(ID_MMFR3, CMAINTVA, false, 1, 0, true),
+    FIELD_INFO(ID_MMFR3, CMAINTSW, false, 1, 0, true),
+    FIELD_INFO(ID_MMFR3, BPMAINT, false, 1, 0, true),
+    FIELD_INFO(ID_MMFR3, MAINTBCST, false, 1, 0, true),
+    FIELD_INFO(ID_MMFR3, PAN, false, 1, 0, true),
+    FIELD_INFO(ID_MMFR3, COHWALK, false, 1, 0, true),
+    FIELD_INFO(ID_MMFR3, CMEMSZ, false, 1, 0, true),
+    FIELD_INFO(ID_MMFR3, SUPERSEC, false, 1, 0, true),
+
+    FIELD_INFO(ID_MMFR4, SPECSEI, false, 1, 0, true),
+    FIELD_INFO(ID_MMFR4, AC2, false, 1, 0, true),
+    FIELD_INFO(ID_MMFR4, XNX, false, 1, 0, true),
+    FIELD_INFO(ID_MMFR4, CNP, false, 1, 0, true),
+    FIELD_INFO(ID_MMFR4, HPDS, false, 1, 0, true),
+    FIELD_INFO(ID_MMFR4, LSM, false, 1, 0, true),
+    FIELD_INFO(ID_MMFR4, CCIDX, false, 1, 0, true),
+    FIELD_INFO(ID_MMFR4, EVT, false, 1, 0, true),
+
+    FIELD_INFO(MVFR0, SIMDREG, false, 1, 0, true),
+    FIELD_INFO(MVFR0, FPSP, false, 1, 0, true),
+    FIELD_INFO(MVFR0, FPDP, false, 1, 0, true),
+    FIELD_INFO(MVFR0, FPTRAP, false, 1, 0, true),
+    FIELD_INFO(MVFR0, FPDIVIDE, false, 1, 0, true),
+    FIELD_INFO(MVFR0, FPSQRT, false, 1, 0, true),
+    FIELD_INFO(MVFR0, FPSHVEC, false, 1, 0, true),
+    FIELD_INFO(MVFR0, FPROUND, false, 1, 0, true),
+
+    FIELD_INFO(MVFR1, FPFTZ, false, 1, 0, true),
+    FIELD_INFO(MVFR1, FPDNAN, false, 1, 0, true),
+    FIELD_INFO(MVFR1, SIMDLS, false, 1, 0, true),
+    FIELD_INFO(MVFR1, SIMDINT, false, 1, 0, true),
+    FIELD_INFO(MVFR1, SIMDSP, false, 1, 0, true),
+    FIELD_INFO(MVFR1, SIMDHP, false, 1, 0, true),
+    FIELD_INFO(MVFR1, FPHP, false, 1, 0, true),
+    FIELD_INFO(MVFR1, SIMDFMAC, false, 1, 0, true),
+
+    FIELD_INFO(MVFR2, SIMDMISC, false, 1, 0, true),
+    FIELD_INFO(MVFR2, FPMISC, false, 1, 0, true),
+
+    FIELD_INFO(ID_DFR0, COPDBG, false, 1, 0, true),
+    FIELD_INFO(ID_DFR0, COPSDBG, false, 1, 0, true),
+    FIELD_INFO(ID_DFR0, MMAPDBG, false, 1, 0, true),
+    FIELD_INFO(ID_DFR0, COPTRC, false, 1, 0, true),
+    FIELD_INFO(ID_DFR0, MMAPTRC, false, 1, 0, true),
+    FIELD_INFO(ID_DFR0, MPROFDBG, false, 1, 0, true),
+    FIELD_INFO(ID_DFR0, PERFMON, false, 1, 0, true),
+    FIELD_INFO(ID_DFR0, TRACEFILT, false, 1, 0, true),
+
+    FIELD_INFO(ID_AA64ISAR0, AES, false, 1, 0, false),
+    FIELD_INFO(ID_AA64ISAR0, SHA1, false, 1, 0, false),
+    FIELD_INFO(ID_AA64ISAR0, SHA2, false, 1, 0, false),
+    FIELD_INFO(ID_AA64ISAR0, CRC32, false, 1, 0, false),
+    FIELD_INFO(ID_AA64ISAR0, ATOMIC, false, 1, 0, false),
+    FIELD_INFO(ID_AA64ISAR0, RDM, false, 1, 0, false),
+    FIELD_INFO(ID_AA64ISAR0, SHA3, false, 1, 0, false),
+    FIELD_INFO(ID_AA64ISAR0, SM3, false, 1, 0, false),
+    FIELD_INFO(ID_AA64ISAR0, SM4, false, 1, 0, false),
+    FIELD_INFO(ID_AA64ISAR0, DP, false, 1, 0, false),
+    FIELD_INFO(ID_AA64ISAR0, FHM, false, 1, 0, false),
+    FIELD_INFO(ID_AA64ISAR0, TS, false, 1, 0, false),
+    FIELD_INFO(ID_AA64ISAR0, TLB, false, 1, 0, false),
+    FIELD_INFO(ID_AA64ISAR0, RNDR, false, 1, 0, false),
+
+    FIELD_INFO(ID_AA64ISAR1, DPB, false, 1, 0, false),
+    FIELD_INFO(ID_AA64ISAR1, APA, false, 1, 0, false),
+    FIELD_INFO(ID_AA64ISAR1, API, false, 1, 0, false),
+    FIELD_INFO(ID_AA64ISAR1, JSCVT, false, 1, 0, false),
+    FIELD_INFO(ID_AA64ISAR1, FCMA, false, 1, 0, false),
+    FIELD_INFO(ID_AA64ISAR1, LRCPC, false, 1, 0, false),
+    FIELD_INFO(ID_AA64ISAR1, GPA, false, 1, 0, false),
+    FIELD_INFO(ID_AA64ISAR1, GPI, false, 1, 0, false),
+    FIELD_INFO(ID_AA64ISAR1, FRINTTS, false, 1, 0, false),
+    FIELD_INFO(ID_AA64ISAR1, SB, false, 1, 0, false),
+    FIELD_INFO(ID_AA64ISAR1, SPECRES, false, 1, 0, false),
+
+    FIELD_INFO(ID_AA64PFR0, EL0, false, 1, 0, false),
+    FIELD_INFO(ID_AA64PFR0, EL1, false, 1, 0, false),
+    FIELD_INFO(ID_AA64PFR0, EL2, false, 1, 0, false),
+    FIELD_INFO(ID_AA64PFR0, EL3, false, 1, 0, false),
+    FIELD_INFO(ID_AA64PFR0, FP, true, 0, 0xf, false),
+    FIELD_INFO(ID_AA64PFR0, ADVSIMD, true, 0, 0xf, false),
+    FIELD_INFO(ID_AA64PFR0, GIC, false, 1, 0, false),
+    FIELD_INFO(ID_AA64PFR0, RAS, false, 1, 0, false),
+    FIELD_INFO(ID_AA64PFR0, SVE, false, 1, 0, false),
+
+    FIELD_INFO(ID_AA64PFR1, BT, false, 1, 0, false),
+    FIELD_INFO(ID_AA64PFR1, SBSS, false, 1, 0, false),
+    FIELD_INFO(ID_AA64PFR1, MTE, false, 1, 0, false),
+    FIELD_INFO(ID_AA64PFR1, RAS_FRAC, false, 1, 0, false),
+
+    FIELD_INFO(ID_AA64MMFR0, PARANGE, false, 1, 0, false),
+    FIELD_INFO(ID_AA64MMFR0, ASIDBITS, false, 1, 0, false),
+    FIELD_INFO(ID_AA64MMFR0, BIGEND, false, 1, 0, false),
+    FIELD_INFO(ID_AA64MMFR0, SNSMEM, false, 1, 0, false),
+    FIELD_INFO(ID_AA64MMFR0, BIGENDEL0, false, 1, 0, false),
+    FIELD_INFO(ID_AA64MMFR0, TGRAN16, false, 1, 0, false),
+    FIELD_INFO(ID_AA64MMFR0, TGRAN64, false, 1, 0, false),
+    FIELD_INFO(ID_AA64MMFR0, TGRAN4, false, 1, 0, false),
+    FIELD_INFO(ID_AA64MMFR0, TGRAN16_2, false, 1, 0, false),
+    FIELD_INFO(ID_AA64MMFR0, TGRAN64_2, false, 1, 0, false),
+    FIELD_INFO(ID_AA64MMFR0, TGRAN4_2, false, 1, 0, false),
+    FIELD_INFO(ID_AA64MMFR0, EXS, false, 1, 0, false),
+
+    FIELD_INFO(ID_AA64MMFR1, HAFDBS, false, 1, 0, false),
+    FIELD_INFO(ID_AA64MMFR1, VMIDBITS, false, 1, 0, false),
+    FIELD_INFO(ID_AA64MMFR1, VH, false, 1, 0, false),
+    FIELD_INFO(ID_AA64MMFR1, HPDS, false, 1, 0, false),
+    FIELD_INFO(ID_AA64MMFR1, LO, false, 1, 0, false),
+    FIELD_INFO(ID_AA64MMFR1, PAN, false, 1, 0, false),
+    FIELD_INFO(ID_AA64MMFR1, SPECSEI, false, 1, 0, false),
+    FIELD_INFO(ID_AA64MMFR1, XNX, false, 1, 0, false),
+
+    FIELD_INFO(ID_AA64MMFR2, CNP, false, 1, 0, false),
+    FIELD_INFO(ID_AA64MMFR2, UAO, false, 1, 0, false),
+    FIELD_INFO(ID_AA64MMFR2, LSM, false, 1, 0, false),
+    FIELD_INFO(ID_AA64MMFR2, IESB, false, 1, 0, false),
+    FIELD_INFO(ID_AA64MMFR2, VARANGE, false, 1, 0, false),
+    FIELD_INFO(ID_AA64MMFR2, CCIDX, false, 1, 0, false),
+    FIELD_INFO(ID_AA64MMFR2, NV, false, 1, 0, false),
+    FIELD_INFO(ID_AA64MMFR2, ST, false, 1, 0, false),
+    FIELD_INFO(ID_AA64MMFR2, AT, false, 1, 0, false),
+    FIELD_INFO(ID_AA64MMFR2, IDS, false, 1, 0, false),
+    FIELD_INFO(ID_AA64MMFR2, FWB, false, 1, 0, false),
+    FIELD_INFO(ID_AA64MMFR2, TTL, false, 1, 0, false),
+    FIELD_INFO(ID_AA64MMFR2, BBM, false, 1, 0, false),
+    FIELD_INFO(ID_AA64MMFR2, EVT, false, 1, 0, false),
+    FIELD_INFO(ID_AA64MMFR2, E0PD, false, 1, 0, false),
+
+    FIELD_INFO(ID_AA64DFR0, DEBUGVER, false, 1, 0, false),
+    FIELD_INFO(ID_AA64DFR0, TRACEVER, false, 1, 0, false),
+    FIELD_INFO(ID_AA64DFR0, PMUVER, false, 1, 0, false),
+    FIELD_INFO(ID_AA64DFR0, BRPS, false, 1, 0, false),
+    FIELD_INFO(ID_AA64DFR0, WRPS, false, 1, 0, false),
+    FIELD_INFO(ID_AA64DFR0, CTX_CMPS, false, 1, 0, false),
+    FIELD_INFO(ID_AA64DFR0, PMSVER, false, 1, 0, false),
+    FIELD_INFO(ID_AA64DFR0, DOUBLELOCK, false, 1, 0, false),
+    FIELD_INFO(ID_AA64DFR0, TRACEFILT, false, 1, 0, false),
+
+    {
+        .reg = ID_AA64PFR0, .length = R_ID_AA64PFR0_FP_LENGTH,
+        .shift = R_ID_AA64PFR0_FP_SHIFT, .sign = true, .min_value = 1,
+        .ni_value = 0, .name = "FPHP", .is_32bit = false,
+    },
+    {
+        .reg = ID_AA64PFR0, .length = R_ID_AA64PFR0_ADVSIMD_LENGTH,
+        .shift = R_ID_AA64PFR0_ADVSIMD_SHIFT, .sign = true, .min_value = 1,
+        .ni_value = 0, .name = "ADVSIMDHP", .is_32bit = false,
+    },
+    {
+        .reg = ID_AA64ISAR0, .length = R_ID_AA64ISAR0_AES_LENGTH,
+        .shift = R_ID_AA64ISAR0_AES_SHIFT, .sign = false, .min_value = 2,
+        .ni_value = 1, .name = "PMULL", .is_32bit = false,
+    },
+    {
+        .reg = ID_AA64ISAR0, .length = R_ID_AA64ISAR0_SHA2_LENGTH,
+        .shift = R_ID_AA64ISAR0_SHA2_SHIFT, .sign = false, .min_value = 2,
+        .ni_value = 1, .name = "SHA512", .is_32bit = false,
+    },
+    {
+        .reg = ID_AA64ISAR0, .length = R_ID_AA64ISAR0_TS_LENGTH,
+        .shift = R_ID_AA64ISAR0_TS_SHIFT, .sign = false, .min_value = 2,
+        .ni_value = 1, .name = "FLAGM2", .is_32bit = false,
+    },
+    {
+        .reg = ID_AA64ISAR1, .length = R_ID_AA64ISAR1_DPB_LENGTH,
+        .shift = R_ID_AA64ISAR1_DPB_SHIFT, .sign = false, .min_value = 2,
+        .ni_value = 1, .name = "DCPODP", .is_32bit = false,
+    },
+    {
+        .reg = ID_AA64ISAR1, .length = R_ID_AA64ISAR1_LRCPC_LENGTH,
+        .shift = R_ID_AA64ISAR1_LRCPC_SHIFT, .sign = false, .min_value = 2,
+        .ni_value = 1, .name = "ILRCPC", .is_32bit = false,
+    },
+};
+
+static void arm_cpu_get_bit_prop(Object *obj, Visitor *v, const char *name,
+                                 void *opaque, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    CPUFeatureInfo *feat = opaque;
+    int field_value = feat->sign ? sextract64(cpu->isar.regs[feat->reg],
+                                              feat->shift, feat->length) :
+                                   extract64(cpu->isar.regs[feat->reg],
+                                             feat->shift, feat->length);
+    bool value = field_value >= feat->min_value;
+
+    visit_type_bool(v, name, &value, errp);
+}
+
+static void arm_cpu_set_bit_prop(Object *obj, Visitor *v, const char *name,
+                                 void *opaque, Error **errp)
+{
+    DeviceState *dev = DEVICE(obj);
+    ARMCPU *cpu = ARM_CPU(obj);
+    ARMISARegisters *isar = &cpu->isar;
+    CPUFeatureInfo *feat = opaque;
+    Error *local_err = NULL;
+    bool value;
+
+    if (dev->realized) {
+        qdev_prop_set_after_realize(dev, name, errp);
+        return;
+    }
+
+    visit_type_bool(v, name, &value, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    if (value) {
+        isar->regs[feat->reg] = deposit64(isar->regs[feat->reg],
+                                          feat->shift, feat->length,
+                                          feat->min_value);
+    } else {
+        isar->regs[feat->reg] = deposit64(isar->regs[feat->reg],
+                                          feat->shift, feat->length,
+                                          feat->ni_value);
+    }
+}
+
+static void arm_cpu_register_feature_props(ARMCPU *cpu)
+{
+    int i;
+    int num = sizeof(cpu_features) / sizeof(cpu_features[i]);
+    ObjectProperty *op;
+    CPUARMState *env = &cpu->env;
+
+    for (i = 0; i < num; i++) {
+        if ((arm_feature(env, ARM_FEATURE_AARCH64) && cpu_features[i].is_32bit)
+            || (!arm_feature(env, ARM_FEATURE_AARCH64) &&
+                cpu_features[i].is_32bit)) {
+            continue;
+        }
+        op = object_property_find(OBJECT(cpu), cpu_features[i].name, NULL);
+        if (!op) {
+            error_report("register name %s", cpu_features[i].name);
+            object_property_add(OBJECT(cpu), cpu_features[i].name, "bool",
+                    arm_cpu_get_bit_prop,
+                    arm_cpu_set_bit_prop,
+                    NULL, &cpu_features[i]);
+        }
+    }
+}
+
 void arm_cpu_post_init(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -1271,6 +1613,7 @@ void arm_cpu_post_init(Object *obj)
         }
     }
 #endif
+    arm_cpu_register_feature_props(cpu);
 }
 
 static void arm_cpu_finalizefn(Object *obj)
-- 
2.18.4


