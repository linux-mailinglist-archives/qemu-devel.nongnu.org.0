Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542C9694F86
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 19:38:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRdiV-0004sK-Fk; Mon, 13 Feb 2023 13:38:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pRdiQ-0004o6-M8
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:38:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pRdiO-0007Fg-0j
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:38:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676313490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=LgxqwaxiolQtVNA7/arrNKztezL1tC9Ut/TMgeuYP2U=;
 b=ZSRvD1zcGtTrJ6ZDZdfdu61Dr2cAv4zK6LSwrP3br5mmo6JXenyfyVAHUSoKjJDVLdz4FN
 ActwrqUStekByor16Er3ZSMoAPWX2bETxPtNrM4cvpPH/x9zJcspdECp1lSTXQvp0mA97T
 AOmXSUCGzXpu7rvOMSGS3WgNwz092Rg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-f_7-ah3IPQKZhWuN5-GHeQ-1; Mon, 13 Feb 2023 13:38:09 -0500
X-MC-Unique: f_7-ah3IPQKZhWuN5-GHeQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F0E8101A521;
 Mon, 13 Feb 2023 18:38:09 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C21F540398A0;
 Mon, 13 Feb 2023 18:38:06 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 pbonzini@redhat.com, qemu-devel@nongnu.org
Cc: philmd@linaro.org
Subject: [PATCH v2] target/arm: Add raw_writes ops for register whose write
 induce TLB maintenance
Date: Mon, 13 Feb 2023 19:38:03 +0100
Message-Id: <20230213183803.3239258-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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

Some registers whose 'cooked' writefns induce TLB maintenance do
not have raw_writefn ops defined. If only the writefn ops is set
(ie. no raw_writefn is provided), it is assumed the cooked also
work as the raw one. For those registers it is not obvious the
tlb_flush works on KVM mode so better/safer setting the raw write.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>

---

v1 -> v2:
- do not add raw_writefn if type is set to ARM_CP_NO_RAW [Peter]

I am not familiar with those callbacks. I am not sure whether
the .raw_writefn must be set only for registers only doing some
TLB maintenance or shall be set safely on other registers doing
TLB maintenance + other state settings.
---
 target/arm/helper.c | 39 +++++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c62ed05c12..0bd8806999 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -719,16 +719,20 @@ static const ARMCPRegInfo not_v7_cp_reginfo[] = {
      * the unified TLB ops but also the dside/iside/inner-shareable variants.
      */
     { .name = "TLBIALL", .cp = 15, .crn = 8, .crm = CP_ANY,
-      .opc1 = CP_ANY, .opc2 = 0, .access = PL1_W, .writefn = tlbiall_write,
+      .opc1 = CP_ANY, .opc2 = 0, .access = PL1_W,
+      .writefn = tlbiall_write, .raw_writefn = raw_write,
       .type = ARM_CP_NO_RAW },
     { .name = "TLBIMVA", .cp = 15, .crn = 8, .crm = CP_ANY,
-      .opc1 = CP_ANY, .opc2 = 1, .access = PL1_W, .writefn = tlbimva_write,
+      .opc1 = CP_ANY, .opc2 = 1, .access = PL1_W,
+      .writefn = tlbimva_write, .raw_writefn = raw_write,
       .type = ARM_CP_NO_RAW },
     { .name = "TLBIASID", .cp = 15, .crn = 8, .crm = CP_ANY,
-      .opc1 = CP_ANY, .opc2 = 2, .access = PL1_W, .writefn = tlbiasid_write,
+      .opc1 = CP_ANY, .opc2 = 2, .access = PL1_W,
+      .writefn = tlbiasid_write, .raw_writefn = raw_write,
       .type = ARM_CP_NO_RAW },
     { .name = "TLBIMVAA", .cp = 15, .crn = 8, .crm = CP_ANY,
-      .opc1 = CP_ANY, .opc2 = 3, .access = PL1_W, .writefn = tlbimvaa_write,
+      .opc1 = CP_ANY, .opc2 = 3, .access = PL1_W,
+      .writefn = tlbimvaa_write, .raw_writefn = raw_write,
       .type = ARM_CP_NO_RAW },
     { .name = "PRRR", .cp = 15, .crn = 10, .crm = 2,
       .opc1 = 0, .opc2 = 0, .access = PL1_RW, .type = ARM_CP_NOP },
@@ -4183,14 +4187,14 @@ static const ARMCPRegInfo vmsa_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 0, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_tvm_trvm,
       .fgt = FGT_TTBR0_EL1,
-      .writefn = vmsa_ttbr_write, .resetvalue = 0,
+      .writefn = vmsa_ttbr_write, .resetvalue = 0, .raw_writefn = raw_write,
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ttbr0_s),
                              offsetof(CPUARMState, cp15.ttbr0_ns) } },
     { .name = "TTBR1_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 0, .opc2 = 1,
       .access = PL1_RW, .accessfn = access_tvm_trvm,
       .fgt = FGT_TTBR1_EL1,
-      .writefn = vmsa_ttbr_write, .resetvalue = 0,
+      .writefn = vmsa_ttbr_write, .resetvalue = 0, .raw_writefn = raw_write,
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ttbr1_s),
                              offsetof(CPUARMState, cp15.ttbr1_ns) } },
     { .name = "TCR_EL1", .state = ARM_CP_STATE_AA64,
@@ -4450,13 +4454,13 @@ static const ARMCPRegInfo lpae_cp_reginfo[] = {
       .type = ARM_CP_64BIT | ARM_CP_ALIAS,
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ttbr0_s),
                              offsetof(CPUARMState, cp15.ttbr0_ns) },
-      .writefn = vmsa_ttbr_write, },
+      .writefn = vmsa_ttbr_write, .raw_writefn = raw_write },
     { .name = "TTBR1", .cp = 15, .crm = 2, .opc1 = 1,
       .access = PL1_RW, .accessfn = access_tvm_trvm,
       .type = ARM_CP_64BIT | ARM_CP_ALIAS,
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ttbr1_s),
                              offsetof(CPUARMState, cp15.ttbr1_ns) },
-      .writefn = vmsa_ttbr_write, },
+      .writefn = vmsa_ttbr_write, .raw_writefn = raw_write },
 };
 
 static uint64_t aa64_fpcr_read(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -5899,12 +5903,12 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .type = ARM_CP_IO,
       .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 0,
       .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.hcr_el2),
-      .writefn = hcr_write },
+      .writefn = hcr_write, .raw_writefn = raw_write },
     { .name = "HCR", .state = ARM_CP_STATE_AA32,
       .type = ARM_CP_ALIAS | ARM_CP_IO,
       .cp = 15, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 0,
       .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.hcr_el2),
-      .writefn = hcr_writelow },
+      .writefn = hcr_writelow, .raw_writefn = raw_write },
     { .name = "HACR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 7,
       .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
@@ -5971,6 +5975,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
     { .name = "TCR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 2,
       .access = PL2_RW, .writefn = vmsa_tcr_el12_write,
+      .raw_writefn = raw_write,
       .fieldoffset = offsetof(CPUARMState, cp15.tcr_el[2]) },
     { .name = "VTCR", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 2,
@@ -5987,10 +5992,10 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .type = ARM_CP_64BIT | ARM_CP_ALIAS,
       .access = PL2_RW, .accessfn = access_el3_aa32ns,
       .fieldoffset = offsetof(CPUARMState, cp15.vttbr_el2),
-      .writefn = vttbr_write },
+      .writefn = vttbr_write, .raw_writefn = raw_write },
     { .name = "VTTBR_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 0,
-      .access = PL2_RW, .writefn = vttbr_write,
+      .access = PL2_RW, .writefn = vttbr_write, .raw_writefn = raw_write,
       .fieldoffset = offsetof(CPUARMState, cp15.vttbr_el2) },
     { .name = "SCTLR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 0, .opc2 = 0,
@@ -6002,7 +6007,8 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.tpidr_el[2]) },
     { .name = "TTBR0_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 0,
-      .access = PL2_RW, .resetvalue = 0, .writefn = vmsa_tcr_ttbr_el2_write,
+      .access = PL2_RW, .resetvalue = 0,
+      .writefn = vmsa_tcr_ttbr_el2_write, .raw_writefn = raw_write,
       .fieldoffset = offsetof(CPUARMState, cp15.ttbr0_el[2]) },
     { .name = "HTTBR", .cp = 15, .opc1 = 4, .crm = 2,
       .access = PL2_RW, .type = ARM_CP_64BIT | ARM_CP_ALIAS,
@@ -6139,7 +6145,7 @@ static const ARMCPRegInfo el2_v8_cp_reginfo[] = {
       .cp = 15, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 4,
       .access = PL2_RW,
       .fieldoffset = offsetofhigh32(CPUARMState, cp15.hcr_el2),
-      .writefn = hcr_writehigh },
+      .writefn = hcr_writehigh, .raw_writefn = raw_write },
 };
 
 static CPAccessResult sel2_access(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -6189,12 +6195,12 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
     { .name = "SCR_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 1, .opc2 = 0,
       .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.scr_el3),
-      .resetfn = scr_reset, .writefn = scr_write },
+      .resetfn = scr_reset, .writefn = scr_write, .raw_writefn = raw_write },
     { .name = "SCR",  .type = ARM_CP_ALIAS | ARM_CP_NEWEL,
       .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
       .fieldoffset = offsetoflow32(CPUARMState, cp15.scr_el3),
-      .writefn = scr_write },
+      .writefn = scr_write, .raw_writefn = raw_write },
     { .name = "SDER32_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 1, .opc2 = 1,
       .access = PL3_RW, .resetvalue = 0,
@@ -7862,6 +7868,7 @@ static const ARMCPRegInfo vhe_reginfo[] = {
     { .name = "TTBR1_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 1,
       .access = PL2_RW, .writefn = vmsa_tcr_ttbr_el2_write,
+      .raw_writefn = raw_write,
       .fieldoffset = offsetof(CPUARMState, cp15.ttbr1_el[2]) },
 #ifndef CONFIG_USER_ONLY
     { .name = "CNTHV_CVAL_EL2", .state = ARM_CP_STATE_AA64,
-- 
2.37.3


