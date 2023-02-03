Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C71A368A01A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 18:17:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNzgW-00074I-Ct; Fri, 03 Feb 2023 12:17:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pNzgT-00073T-RS
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 12:17:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pNzgQ-0003j3-DH
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 12:17:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675444625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=H87psRagJYTdzx3tENLQCPSm9o01fzQsLmOMat36+r4=;
 b=KsK62vldtwTS1i3JJNpxOeQ39dZ40BreGACxkWhvq5ZMLyGZdidkIj0LaKT8PgJ2LsdWoI
 c4Ie2gZC2P/AtKua0fSs4klfoia2x6CzGJ0ZErtYCmnUTBqRdD7IJr9T8kny62l3Xv6+Sa
 oF1AmAZOqHUxQ/tsqJWS893mi/M8+1c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-PVumxtSrMxurjDg8s3hAdg-1; Fri, 03 Feb 2023 12:17:03 -0500
X-MC-Unique: PVumxtSrMxurjDg8s3hAdg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C57193C025C7;
 Fri,  3 Feb 2023 17:17:02 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 108492026D37;
 Fri,  3 Feb 2023 17:17:00 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Add raw_writes ops for register whose write
 induce TLB maintenance
Date: Fri,  3 Feb 2023 18:16:57 +0100
Message-Id: <20230203171657.2867598-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124;
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

Many registers whose 'cooked' writefns induce TLB maintenance do
not have raw_writefn ops defined. If only the writefn ops is set
(ie. no raw_writefn is provided), it is assumed the cooked also
work as the raw one. For those registers it is not obvious the
tlb_flush works on KVM mode so better/safer setting the raw write.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>

---

I'am not familiar with those callbacks. I have tested in kvm accelerated
mode including migration but I fail to test with TCG. It SIGSEVs for
me even without my additions. I am not sure whether the .raw_writefn
must be set only for registers only doing some TLB maintenance or
shall be set safely on other registers doing TLB maintenance + other
state settings.
---
 target/arm/helper.c | 242 +++++++++++++++++++++++---------------------
 1 file changed, 128 insertions(+), 114 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 72b37b7cf1..cf92812aa3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -718,16 +718,20 @@ static const ARMCPRegInfo not_v7_cp_reginfo[] = {
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
@@ -2229,52 +2233,52 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
     /* 32 bit ITLB invalidates */
     { .name = "ITLBIALL", .cp = 15, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 0,
       .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
-      .writefn = tlbiall_write },
+      .writefn = tlbiall_write, .raw_writefn = raw_write },
     { .name = "ITLBIMVA", .cp = 15, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 1,
       .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
-      .writefn = tlbimva_write },
+      .writefn = tlbimva_write, .raw_writefn = raw_write },
     { .name = "ITLBIASID", .cp = 15, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 2,
       .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
-      .writefn = tlbiasid_write },
+      .writefn = tlbiasid_write, .raw_writefn = raw_write },
     /* 32 bit DTLB invalidates */
     { .name = "DTLBIALL", .cp = 15, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 0,
       .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
-      .writefn = tlbiall_write },
+      .writefn = tlbiall_write, .raw_writefn = raw_write },
     { .name = "DTLBIMVA", .cp = 15, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 1,
       .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
-      .writefn = tlbimva_write },
+      .writefn = tlbimva_write, .raw_writefn = raw_write },
     { .name = "DTLBIASID", .cp = 15, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 2,
       .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
-      .writefn = tlbiasid_write },
+      .writefn = tlbiasid_write, .raw_writefn = raw_write },
     /* 32 bit TLB invalidates */
     { .name = "TLBIALL", .cp = 15, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 0,
       .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
-      .writefn = tlbiall_write },
+      .writefn = tlbiall_write, .raw_writefn = raw_write },
     { .name = "TLBIMVA", .cp = 15, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 1,
       .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
-      .writefn = tlbimva_write },
+      .writefn = tlbimva_write, .raw_writefn = raw_write },
     { .name = "TLBIASID", .cp = 15, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 2,
       .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
-      .writefn = tlbiasid_write },
+      .writefn = tlbiasid_write, .raw_writefn = raw_write },
     { .name = "TLBIMVAA", .cp = 15, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 3,
       .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
-      .writefn = tlbimvaa_write },
+      .writefn = tlbimvaa_write, .raw_writefn = raw_write },
 };
 
 static const ARMCPRegInfo v7mp_cp_reginfo[] = {
     /* 32 bit TLB invalidates, Inner Shareable */
     { .name = "TLBIALLIS", .cp = 15, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 0,
       .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlbis,
-      .writefn = tlbiall_is_write },
+      .writefn = tlbiall_is_write, .raw_writefn = raw_write },
     { .name = "TLBIMVAIS", .cp = 15, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 1,
       .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlbis,
-      .writefn = tlbimva_is_write },
+      .writefn = tlbimva_is_write, .raw_writefn = raw_write },
     { .name = "TLBIASIDIS", .cp = 15, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 2,
       .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlbis,
-      .writefn = tlbiasid_is_write },
+      .writefn = tlbiasid_is_write, .raw_writefn = raw_write },
     { .name = "TLBIMVAAIS", .cp = 15, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 3,
       .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlbis,
-      .writefn = tlbimvaa_is_write },
+      .writefn = tlbimvaa_is_write, .raw_writefn = raw_write },
 };
 
 static const ARMCPRegInfo pmovsset_cp_reginfo[] = {
@@ -3912,12 +3916,12 @@ static const ARMCPRegInfo pmsav8r_cp_reginfo[] = {
       .cp = 15, .opc1 = 0, .crn = 6, .crm = 3, .opc2 = 0,
       .access = PL1_RW, .type = ARM_CP_NO_RAW,
       .accessfn = access_tvm_trvm,
-      .readfn = prbar_read, .writefn = prbar_write },
+      .readfn = prbar_read, .writefn = prbar_write, .raw_writefn = raw_write  },
     { .name = "PRLAR",
       .cp = 15, .opc1 = 0, .crn = 6, .crm = 3, .opc2 = 1,
       .access = PL1_RW, .type = ARM_CP_NO_RAW,
       .accessfn = access_tvm_trvm,
-      .readfn = prlar_read, .writefn = prlar_write },
+      .readfn = prlar_read, .writefn = prlar_write, .raw_writefn = raw_write },
     { .name = "PRSELR", .resetvalue = 0,
       .cp = 15, .opc1 = 0, .crn = 6, .crm = 2, .opc2 = 1,
       .access = PL1_RW, .accessfn = access_tvm_trvm,
@@ -3926,11 +3930,13 @@ static const ARMCPRegInfo pmsav8r_cp_reginfo[] = {
     { .name = "HPRBAR", .resetvalue = 0,
       .cp = 15, .opc1 = 4, .crn = 6, .crm = 3, .opc2 = 0,
       .access = PL2_RW, .type = ARM_CP_NO_RAW,
-      .readfn = hprbar_read, .writefn = hprbar_write },
+      .readfn = hprbar_read,
+      .writefn = hprbar_write, .raw_writefn = raw_write },
     { .name = "HPRLAR",
       .cp = 15, .opc1 = 4, .crn = 6, .crm = 3, .opc2 = 1,
       .access = PL2_RW, .type = ARM_CP_NO_RAW,
-      .readfn = hprlar_read, .writefn = hprlar_write },
+      .readfn = hprlar_read,
+      .writefn = hprlar_write, .raw_writefn = raw_write },
     { .name = "HPRSELR", .resetvalue = 0,
       .cp = 15, .opc1 = 4, .crn = 6, .crm = 2, .opc2 = 1,
       .access = PL2_RW,
@@ -3939,7 +3945,8 @@ static const ARMCPRegInfo pmsav8r_cp_reginfo[] = {
     { .name = "HPRENR",
       .cp = 15, .opc1 = 4, .crn = 6, .crm = 1, .opc2 = 1,
       .access = PL2_RW, .type = ARM_CP_NO_RAW,
-      .readfn = hprenr_read, .writefn = hprenr_write },
+      .readfn = hprenr_read,
+      .writefn = hprenr_write, .raw_writefn = raw_write },
 };
 
 static const ARMCPRegInfo pmsav7_cp_reginfo[] = {
@@ -3951,17 +3958,17 @@ static const ARMCPRegInfo pmsav7_cp_reginfo[] = {
     { .name = "DRBAR", .cp = 15, .crn = 6, .opc1 = 0, .crm = 1, .opc2 = 0,
       .access = PL1_RW, .type = ARM_CP_NO_RAW,
       .fieldoffset = offsetof(CPUARMState, pmsav7.drbar),
-      .readfn = pmsav7_read, .writefn = pmsav7_write,
+      .readfn = pmsav7_read, .writefn = pmsav7_write, .raw_writefn = raw_write,
       .resetfn = arm_cp_reset_ignore },
     { .name = "DRSR", .cp = 15, .crn = 6, .opc1 = 0, .crm = 1, .opc2 = 2,
       .access = PL1_RW, .type = ARM_CP_NO_RAW,
       .fieldoffset = offsetof(CPUARMState, pmsav7.drsr),
-      .readfn = pmsav7_read, .writefn = pmsav7_write,
+      .readfn = pmsav7_read, .writefn = pmsav7_write, .raw_writefn = raw_write,
       .resetfn = arm_cp_reset_ignore },
     { .name = "DRACR", .cp = 15, .crn = 6, .opc1 = 0, .crm = 1, .opc2 = 4,
       .access = PL1_RW, .type = ARM_CP_NO_RAW,
       .fieldoffset = offsetof(CPUARMState, pmsav7.dracr),
-      .readfn = pmsav7_read, .writefn = pmsav7_write,
+      .readfn = pmsav7_read, .writefn = pmsav7_write, .raw_writefn = raw_write,
       .resetfn = arm_cp_reset_ignore },
     { .name = "RGNR", .cp = 15, .crn = 6, .opc1 = 0, .crm = 2, .opc2 = 0,
       .access = PL1_RW,
@@ -4139,13 +4146,13 @@ static const ARMCPRegInfo vmsa_cp_reginfo[] = {
     { .name = "TTBR0_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 0, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_tvm_trvm,
-      .writefn = vmsa_ttbr_write, .resetvalue = 0,
+      .writefn = vmsa_ttbr_write, .resetvalue = 0, .raw_writefn = raw_write,
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ttbr0_s),
                              offsetof(CPUARMState, cp15.ttbr0_ns) } },
     { .name = "TTBR1_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 0, .opc2 = 1,
       .access = PL1_RW, .accessfn = access_tvm_trvm,
-      .writefn = vmsa_ttbr_write, .resetvalue = 0,
+      .writefn = vmsa_ttbr_write, .resetvalue = 0, .raw_writefn = raw_write,
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ttbr1_s),
                              offsetof(CPUARMState, cp15.ttbr1_ns) } },
     { .name = "TCR_EL1", .state = ARM_CP_STATE_AA64,
@@ -4403,13 +4410,13 @@ static const ARMCPRegInfo lpae_cp_reginfo[] = {
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
@@ -5260,83 +5267,83 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     { .name = "TLBI_VMALLE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 0,
       .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_vmalle1is_write },
+      .writefn = tlbi_aa64_vmalle1is_write, .raw_writefn = raw_write },
     { .name = "TLBI_VAE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 1,
       .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_vae1is_write },
+      .writefn = tlbi_aa64_vae1is_write, .raw_writefn = raw_write },
     { .name = "TLBI_ASIDE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 2,
       .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_vmalle1is_write },
+      .writefn = tlbi_aa64_vmalle1is_write, .raw_writefn = raw_write },
     { .name = "TLBI_VAAE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 3,
       .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_vae1is_write },
+      .writefn = tlbi_aa64_vae1is_write, .raw_writefn = raw_write },
     { .name = "TLBI_VALE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 5,
       .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_vae1is_write },
+      .writefn = tlbi_aa64_vae1is_write, .raw_writefn = raw_write },
     { .name = "TLBI_VAALE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 7,
       .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_vae1is_write },
+      .writefn = tlbi_aa64_vae1is_write, .raw_writefn = raw_write },
     { .name = "TLBI_VMALLE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 0,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_vmalle1_write },
+      .writefn = tlbi_aa64_vmalle1_write, .raw_writefn = raw_write },
     { .name = "TLBI_VAE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 1,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_vae1_write },
+      .writefn = tlbi_aa64_vae1_write, .raw_writefn = raw_write },
     { .name = "TLBI_ASIDE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 2,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_vmalle1_write },
+      .writefn = tlbi_aa64_vmalle1_write, .raw_writefn = raw_write },
     { .name = "TLBI_VAAE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 3,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_vae1_write },
+      .writefn = tlbi_aa64_vae1_write, .raw_writefn = raw_write },
     { .name = "TLBI_VALE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 5,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_vae1_write },
+      .writefn = tlbi_aa64_vae1_write, .raw_writefn = raw_write },
     { .name = "TLBI_VAALE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 7,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_vae1_write },
+      .writefn = tlbi_aa64_vae1_write, .raw_writefn = raw_write },
     { .name = "TLBI_IPAS2E1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 1,
       .access = PL2_W, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_ipas2e1is_write },
+      .writefn = tlbi_aa64_ipas2e1is_write, .raw_writefn = raw_write },
     { .name = "TLBI_IPAS2LE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 5,
       .access = PL2_W, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_ipas2e1is_write },
+      .writefn = tlbi_aa64_ipas2e1is_write, .raw_writefn = raw_write },
     { .name = "TLBI_ALLE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 4,
       .access = PL2_W, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_alle1is_write },
+      .writefn = tlbi_aa64_alle1is_write, .raw_writefn = raw_write },
     { .name = "TLBI_VMALLS12E1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 6,
       .access = PL2_W, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_alle1is_write },
+      .writefn = tlbi_aa64_alle1is_write, .raw_writefn = raw_write },
     { .name = "TLBI_IPAS2E1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 1,
       .access = PL2_W, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_ipas2e1_write },
+      .writefn = tlbi_aa64_ipas2e1_write, .raw_writefn = raw_write },
     { .name = "TLBI_IPAS2LE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 5,
       .access = PL2_W, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_ipas2e1_write },
+      .writefn = tlbi_aa64_ipas2e1_write, .raw_writefn = raw_write },
     { .name = "TLBI_ALLE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 4,
       .access = PL2_W, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_alle1_write },
+      .writefn = tlbi_aa64_alle1_write, .raw_writefn = raw_write },
     { .name = "TLBI_VMALLS12E1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 6,
       .access = PL2_W, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_alle1is_write },
+      .writefn = tlbi_aa64_alle1is_write, .raw_writefn = raw_write },
 #ifndef CONFIG_USER_ONLY
     /* 64 bit address translation operations */
     { .name = "AT_S1E1R", .state = ARM_CP_STATE_AA64,
@@ -5390,39 +5397,39 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     /* TLB invalidate last level of translation table walk */
     { .name = "TLBIMVALIS", .cp = 15, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 5,
       .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlbis,
-      .writefn = tlbimva_is_write },
+      .writefn = tlbimva_is_write, .raw_writefn = raw_write },
     { .name = "TLBIMVAALIS", .cp = 15, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 7,
       .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlbis,
-      .writefn = tlbimvaa_is_write },
+      .writefn = tlbimvaa_is_write, .raw_writefn = raw_write },
     { .name = "TLBIMVAL", .cp = 15, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 5,
       .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
-      .writefn = tlbimva_write },
+      .writefn = tlbimva_write, .raw_writefn = raw_write },
     { .name = "TLBIMVAAL", .cp = 15, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 7,
       .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
-      .writefn = tlbimvaa_write },
+      .writefn = tlbimvaa_write, .raw_writefn = raw_write },
     { .name = "TLBIMVALH", .cp = 15, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 5,
       .type = ARM_CP_NO_RAW, .access = PL2_W,
-      .writefn = tlbimva_hyp_write },
+      .writefn = tlbimva_hyp_write, .raw_writefn = raw_write },
     { .name = "TLBIMVALHIS",
       .cp = 15, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 5,
       .type = ARM_CP_NO_RAW, .access = PL2_W,
-      .writefn = tlbimva_hyp_is_write },
+      .writefn = tlbimva_hyp_is_write, .raw_writefn = raw_write },
     { .name = "TLBIIPAS2",
       .cp = 15, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 1,
       .type = ARM_CP_NO_RAW, .access = PL2_W,
-      .writefn = tlbiipas2_hyp_write },
+      .writefn = tlbiipas2_hyp_write, .raw_writefn = raw_write },
     { .name = "TLBIIPAS2IS",
       .cp = 15, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 1,
       .type = ARM_CP_NO_RAW, .access = PL2_W,
-      .writefn = tlbiipas2is_hyp_write },
+      .writefn = tlbiipas2is_hyp_write, .raw_writefn = raw_write },
     { .name = "TLBIIPAS2L",
       .cp = 15, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 5,
       .type = ARM_CP_NO_RAW, .access = PL2_W,
-      .writefn = tlbiipas2_hyp_write },
+      .writefn = tlbiipas2_hyp_write, .raw_writefn = raw_write },
     { .name = "TLBIIPAS2LIS",
       .cp = 15, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 5,
       .type = ARM_CP_NO_RAW, .access = PL2_W,
-      .writefn = tlbiipas2is_hyp_write },
+      .writefn = tlbiipas2is_hyp_write, .raw_writefn = raw_write },
     /* 32 bit cache operations */
     { .name = "ICIALLUIS", .cp = 15, .opc1 = 0, .crn = 7, .crm = 1, .opc2 = 0,
       .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_ticab },
@@ -5823,12 +5830,12 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
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
@@ -5895,6 +5902,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
     { .name = "TCR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 2,
       .access = PL2_RW, .writefn = vmsa_tcr_el12_write,
+      .raw_writefn = raw_write,
       .fieldoffset = offsetof(CPUARMState, cp15.tcr_el[2]) },
     { .name = "VTCR", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 2,
@@ -5911,10 +5919,10 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
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
@@ -5926,7 +5934,8 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.tpidr_el[2]) },
     { .name = "TTBR0_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 0,
-      .access = PL2_RW, .resetvalue = 0, .writefn = vmsa_tcr_ttbr_el2_write,
+      .access = PL2_RW, .resetvalue = 0,
+      .writefn = vmsa_tcr_ttbr_el2_write, .raw_writefn = raw_write,
       .fieldoffset = offsetof(CPUARMState, cp15.ttbr0_el[2]) },
     { .name = "HTTBR", .cp = 15, .opc1 = 4, .crm = 2,
       .access = PL2_RW, .type = ARM_CP_64BIT | ARM_CP_ALIAS,
@@ -5934,47 +5943,47 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
     { .name = "TLBIALLNSNH",
       .cp = 15, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 4,
       .type = ARM_CP_NO_RAW, .access = PL2_W,
-      .writefn = tlbiall_nsnh_write },
+      .writefn = tlbiall_nsnh_write, .raw_writefn = raw_write },
     { .name = "TLBIALLNSNHIS",
       .cp = 15, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 4,
       .type = ARM_CP_NO_RAW, .access = PL2_W,
-      .writefn = tlbiall_nsnh_is_write },
+      .writefn = tlbiall_nsnh_is_write, .raw_writefn = raw_write },
     { .name = "TLBIALLH", .cp = 15, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 0,
       .type = ARM_CP_NO_RAW, .access = PL2_W,
-      .writefn = tlbiall_hyp_write },
+      .writefn = tlbiall_hyp_write, .raw_writefn = raw_write },
     { .name = "TLBIALLHIS", .cp = 15, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 0,
       .type = ARM_CP_NO_RAW, .access = PL2_W,
-      .writefn = tlbiall_hyp_is_write },
+      .writefn = tlbiall_hyp_is_write, .raw_writefn = raw_write },
     { .name = "TLBIMVAH", .cp = 15, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 1,
       .type = ARM_CP_NO_RAW, .access = PL2_W,
-      .writefn = tlbimva_hyp_write },
+      .writefn = tlbimva_hyp_write, .raw_writefn = raw_write },
     { .name = "TLBIMVAHIS", .cp = 15, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 1,
       .type = ARM_CP_NO_RAW, .access = PL2_W,
-      .writefn = tlbimva_hyp_is_write },
+      .writefn = tlbimva_hyp_is_write, .raw_writefn = raw_write },
     { .name = "TLBI_ALLE2", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 0,
       .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
-      .writefn = tlbi_aa64_alle2_write },
+      .writefn = tlbi_aa64_alle2_write, .raw_writefn = raw_write },
     { .name = "TLBI_VAE2", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 1,
       .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
-      .writefn = tlbi_aa64_vae2_write },
+      .writefn = tlbi_aa64_vae2_write, .raw_writefn = raw_write },
     { .name = "TLBI_VALE2", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 5,
       .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
-      .writefn = tlbi_aa64_vae2_write },
+      .writefn = tlbi_aa64_vae2_write, .raw_writefn = raw_write },
     { .name = "TLBI_ALLE2IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 0,
       .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
-      .writefn = tlbi_aa64_alle2is_write },
+      .writefn = tlbi_aa64_alle2is_write, .raw_writefn = raw_write },
     { .name = "TLBI_VAE2IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 1,
       .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
-      .writefn = tlbi_aa64_vae2is_write },
+      .writefn = tlbi_aa64_vae2is_write, .raw_writefn = raw_write },
     { .name = "TLBI_VALE2IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 5,
       .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
-      .writefn = tlbi_aa64_vae2is_write },
+      .writefn = tlbi_aa64_vae2is_write, .raw_writefn = raw_write },
 #ifndef CONFIG_USER_ONLY
     /*
      * Unlike the other EL2-related AT operations, these must
@@ -6063,7 +6072,7 @@ static const ARMCPRegInfo el2_v8_cp_reginfo[] = {
       .cp = 15, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 4,
       .access = PL2_RW,
       .fieldoffset = offsetofhigh32(CPUARMState, cp15.hcr_el2),
-      .writefn = hcr_writehigh },
+      .writefn = hcr_writehigh, .raw_writefn = raw_write },
 };
 
 static CPAccessResult sel2_access(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -6113,12 +6122,12 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
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
@@ -6185,27 +6194,27 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
     { .name = "TLBI_ALLE3IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 3, .opc2 = 0,
       .access = PL3_W, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_alle3is_write },
+      .writefn = tlbi_aa64_alle3is_write, .raw_writefn = raw_write },
     { .name = "TLBI_VAE3IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 3, .opc2 = 1,
       .access = PL3_W, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_vae3is_write },
+      .writefn = tlbi_aa64_vae3is_write, .raw_writefn = raw_write },
     { .name = "TLBI_VALE3IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 3, .opc2 = 5,
       .access = PL3_W, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_vae3is_write },
+      .writefn = tlbi_aa64_vae3is_write, .raw_writefn = raw_write },
     { .name = "TLBI_ALLE3", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 7, .opc2 = 0,
       .access = PL3_W, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_alle3_write },
+      .writefn = tlbi_aa64_alle3_write, .raw_writefn = raw_write },
     { .name = "TLBI_VAE3", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 7, .opc2 = 1,
       .access = PL3_W, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_vae3_write },
+      .writefn = tlbi_aa64_vae3_write, .raw_writefn = raw_write },
     { .name = "TLBI_VALE3", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 7, .opc2 = 5,
       .access = PL3_W, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_vae3_write },
+      .writefn = tlbi_aa64_vae3_write, .raw_writefn = raw_write },
 };
 
 #ifndef CONFIG_USER_ONLY
@@ -7113,19 +7122,19 @@ static const ARMCPRegInfo tlbirange_reginfo[] = {
     { .name = "TLBI_RVAE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 1,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_rvae1_write },
+      .writefn = tlbi_aa64_rvae1_write, .raw_writefn = raw_write },
     { .name = "TLBI_RVAAE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 3,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_rvae1_write },
+      .writefn = tlbi_aa64_rvae1_write, .raw_writefn = raw_write },
    { .name = "TLBI_RVALE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 5,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_rvae1_write },
+      .writefn = tlbi_aa64_rvae1_write, .raw_writefn = raw_write },
     { .name = "TLBI_RVAALE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 7,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_rvae1_write },
+      .writefn = tlbi_aa64_rvae1_write, .raw_writefn = raw_write },
     { .name = "TLBI_RIPAS2E1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 2,
       .access = PL2_W, .type = ARM_CP_NO_RAW,
@@ -7137,11 +7146,11 @@ static const ARMCPRegInfo tlbirange_reginfo[] = {
     { .name = "TLBI_RVAE2IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 2, .opc2 = 1,
       .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
-      .writefn = tlbi_aa64_rvae2is_write },
+      .writefn = tlbi_aa64_rvae2is_write, .raw_writefn = raw_write },
    { .name = "TLBI_RVALE2IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 2, .opc2 = 5,
       .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
-      .writefn = tlbi_aa64_rvae2is_write },
+      .writefn = tlbi_aa64_rvae2is_write, .raw_writefn = raw_write },
     { .name = "TLBI_RIPAS2E1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 2,
       .access = PL2_W, .type = ARM_CP_NO_RAW,
@@ -7153,19 +7162,19 @@ static const ARMCPRegInfo tlbirange_reginfo[] = {
    { .name = "TLBI_RVAE2OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 5, .opc2 = 1,
       .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
-      .writefn = tlbi_aa64_rvae2is_write },
+      .writefn = tlbi_aa64_rvae2is_write, .raw_writefn = raw_write },
    { .name = "TLBI_RVALE2OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 5, .opc2 = 5,
       .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
-      .writefn = tlbi_aa64_rvae2is_write },
+      .writefn = tlbi_aa64_rvae2is_write, .raw_writefn = raw_write },
     { .name = "TLBI_RVAE2", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 6, .opc2 = 1,
       .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
-      .writefn = tlbi_aa64_rvae2_write },
+      .writefn = tlbi_aa64_rvae2_write, .raw_writefn = raw_write },
    { .name = "TLBI_RVALE2", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 6, .opc2 = 5,
       .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
-      .writefn = tlbi_aa64_rvae2_write },
+      .writefn = tlbi_aa64_rvae2_write, .raw_writefn = raw_write },
    { .name = "TLBI_RVAE3IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 2, .opc2 = 1,
       .access = PL3_W, .type = ARM_CP_NO_RAW,
@@ -7196,47 +7205,47 @@ static const ARMCPRegInfo tlbios_reginfo[] = {
     { .name = "TLBI_VMALLE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 0,
       .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_vmalle1is_write },
+      .writefn = tlbi_aa64_vmalle1is_write, .raw_writefn = raw_write },
     { .name = "TLBI_VAE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 1,
       .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_vae1is_write },
+      .writefn = tlbi_aa64_vae1is_write, .raw_writefn = raw_write },
     { .name = "TLBI_ASIDE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 2,
       .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_vmalle1is_write },
+      .writefn = tlbi_aa64_vmalle1is_write, .raw_writefn = raw_write },
     { .name = "TLBI_VAAE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 3,
       .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_vae1is_write },
+      .writefn = tlbi_aa64_vae1is_write, .raw_writefn = raw_write },
     { .name = "TLBI_VALE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 5,
       .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_vae1is_write },
+      .writefn = tlbi_aa64_vae1is_write, .raw_writefn = raw_write },
     { .name = "TLBI_VAALE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 7,
       .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_vae1is_write },
+      .writefn = tlbi_aa64_vae1is_write, .raw_writefn = raw_write },
     { .name = "TLBI_ALLE2OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 0,
       .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
-      .writefn = tlbi_aa64_alle2is_write },
+      .writefn = tlbi_aa64_alle2is_write, .raw_writefn = raw_write },
     { .name = "TLBI_VAE2OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 1,
       .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
-      .writefn = tlbi_aa64_vae2is_write },
+      .writefn = tlbi_aa64_vae2is_write, .raw_writefn = raw_write },
    { .name = "TLBI_ALLE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 4,
       .access = PL2_W, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_alle1is_write },
+      .writefn = tlbi_aa64_alle1is_write, .raw_writefn = raw_write },
     { .name = "TLBI_VALE2OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 5,
       .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
-      .writefn = tlbi_aa64_vae2is_write },
+      .writefn = tlbi_aa64_vae2is_write, .raw_writefn = raw_write },
     { .name = "TLBI_VMALLS12E1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 6,
       .access = PL2_W, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_alle1is_write },
+      .writefn = tlbi_aa64_alle1is_write, .raw_writefn = raw_write },
     { .name = "TLBI_IPAS2E1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 0,
       .access = PL2_W, .type = ARM_CP_NOP },
@@ -7252,15 +7261,15 @@ static const ARMCPRegInfo tlbios_reginfo[] = {
     { .name = "TLBI_ALLE3OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 1, .opc2 = 0,
       .access = PL3_W, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_alle3is_write },
+      .writefn = tlbi_aa64_alle3is_write, .raw_writefn = raw_write },
     { .name = "TLBI_VAE3OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 1, .opc2 = 1,
       .access = PL3_W, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_vae3is_write },
+      .writefn = tlbi_aa64_vae3is_write, .raw_writefn = raw_write },
     { .name = "TLBI_VALE3OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 1, .opc2 = 5,
       .access = PL3_W, .type = ARM_CP_NO_RAW,
-      .writefn = tlbi_aa64_vae3is_write },
+      .writefn = tlbi_aa64_vae3is_write, .raw_writefn = raw_write },
 };
 
 static uint64_t rndr_readfn(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -7676,6 +7685,7 @@ static const ARMCPRegInfo vhe_reginfo[] = {
     { .name = "TTBR1_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 1,
       .access = PL2_RW, .writefn = vmsa_tcr_ttbr_el2_write,
+      .raw_writefn = raw_write,
       .fieldoffset = offsetof(CPUARMState, cp15.ttbr1_el[2]) },
 #ifndef CONFIG_USER_ONLY
     { .name = "CNTHV_CVAL_EL2", .state = ARM_CP_STATE_AA64,
@@ -8664,7 +8674,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
                     .cp = 15, .opc1 = opc1, .crn = 6, .crm = crm, .opc2 = opc2,
                     .access = PL1_RW, .resetvalue = 0,
                     .accessfn = access_tvm_trvm,
-                    .writefn = pmsav8r_regn_write, .readfn = pmsav8r_regn_read
+                    .writefn = pmsav8r_regn_write, .readfn = pmsav8r_regn_read,
+                    .raw_writefn = raw_write
                 };
                 define_one_arm_cp_reg(cpu, &tmp_prbarn_reginfo);
                 g_free(tmp_string);
@@ -8676,7 +8687,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
                     .cp = 15, .opc1 = opc1, .crn = 6, .crm = crm, .opc2 = opc2,
                     .access = PL1_RW, .resetvalue = 0,
                     .accessfn = access_tvm_trvm,
-                    .writefn = pmsav8r_regn_write, .readfn = pmsav8r_regn_read
+                    .writefn = pmsav8r_regn_write, .readfn = pmsav8r_regn_read,
+                    .raw_writefn = raw_write
                 };
                 define_one_arm_cp_reg(cpu, &tmp_prlarn_reginfo);
                 g_free(tmp_string);
@@ -8694,7 +8706,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
                     .type = ARM_CP_NO_RAW,
                     .cp = 15, .opc1 = opc1, .crn = 6, .crm = crm, .opc2 = opc2,
                     .access = PL2_RW, .resetvalue = 0,
-                    .writefn = pmsav8r_regn_write, .readfn = pmsav8r_regn_read
+                    .writefn = pmsav8r_regn_write, .readfn = pmsav8r_regn_read,
+                    .raw_writefn = raw_write
                 };
                 define_one_arm_cp_reg(cpu, &tmp_hprbarn_reginfo);
                 g_free(tmp_string);
@@ -8706,7 +8719,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
                     .type = ARM_CP_NO_RAW,
                     .cp = 15, .opc1 = opc1, .crn = 6, .crm = crm, .opc2 = opc2,
                     .access = PL2_RW, .resetvalue = 0,
-                    .writefn = pmsav8r_regn_write, .readfn = pmsav8r_regn_read
+                    .writefn = pmsav8r_regn_write, .readfn = pmsav8r_regn_read,
+                    .raw_writefn = raw_write
                 };
                 define_one_arm_cp_reg(cpu, &tmp_hprlarn_reginfo);
                 g_free(tmp_string);
-- 
2.37.3


