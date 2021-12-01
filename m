Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D96A346519D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 16:27:49 +0100 (CET)
Received: from localhost ([::1]:52190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msRWP-00047g-09
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 10:27:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msRMu-0006YT-Jb; Wed, 01 Dec 2021 10:18:00 -0500
Received: from [2607:f8b0:4864:20::92b] (port=46054
 helo=mail-ua1-x92b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msRMs-0003Jq-SB; Wed, 01 Dec 2021 10:18:00 -0500
Received: by mail-ua1-x92b.google.com with SMTP id ay21so49720349uab.12;
 Wed, 01 Dec 2021 07:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KyHmNPPcGfp1m5OtL1IcCdqAPQjbKMVP58bRxviE58g=;
 b=eRmfzuswKTisUPI/hgbergiAOEYQAanlG545o21liZBu92Iu4wQ+0cPz2hE2N9PJij
 DdgBEncxzPgC0maRQxVfn+jZsCnfk3977B9iiCUPxkGsOFtO36PhO+orcEBc4EqYRt+X
 xaXTxBKmVEaPZQHE/ap1OgoJdp+VXwO5lAtxg+htYwhrsSFOH4vAiR2yIe3XGvuY7YRw
 1RURjusOp0sDcRWwT+BgJdAiiW0F/tUDURLrYSzx5WwCX3wrWg4ACs0l4elKa7bdtTP0
 Ip3tC2PKK+L7w8BBRY2XgZHNJ9B8gLvWuzi5vxWX2NpoaF9BPSNP8RJITkrJidKHqaMb
 y87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KyHmNPPcGfp1m5OtL1IcCdqAPQjbKMVP58bRxviE58g=;
 b=Xs9m9j5FRhlutzsQE1Izend/tjyzm14A1SEv0ysBI49ZCS0VDLFlRgijYdxK9Lv5EG
 pcv3y7I4wpVlc9AmdOT9bjkaCdmLhAZrpzbOfug7HeKi9v4+IyNjKwhzEIt3wRSCDd/L
 cGyafnd/8MT3yVRlbUo3P5B+vpqNmu1R0/agxKMjrJR+VdMzOQs5KTRn+jFEhlanAqOB
 JgNLVRJ/a9V2gOUxRNP18TVBCaWDKjY7dkDjrLD+/mBKqGSrkF4o0KLtGJJRgESi39eN
 8npmouWO1/FW1c3AQK9AX/QjQEoj2XsAoMXe8d/aI/OvMrAHc+GS7Dsm3tPCeUy2ElDK
 LB5w==
X-Gm-Message-State: AOAM533NTClamKHYuQVYa8BB+0Z2bOTWx4IVPojvGRZwr5pOUi9h0BTb
 Kz9mV+PuU0qXAe32nLHitxumBQ3m7S8=
X-Google-Smtp-Source: ABdhPJzeKHlQIWVNAMxTyVEgRNi73UysOMwVOt9GcAWRfJc8csNsCQukDksp7AnveUeB9998drUWZA==
X-Received: by 2002:a67:f912:: with SMTP id t18mr7944709vsq.6.1638371877470;
 Wed, 01 Dec 2021 07:17:57 -0800 (PST)
Received: from rekt.COMFAST ([177.68.212.35])
 by smtp.gmail.com with ESMTPSA id q26sm109610vsp.23.2021.12.01.07.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 07:17:57 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 04/10] target/ppc: PMU: update counters on MMCR1 write
Date: Wed,  1 Dec 2021 12:17:28 -0300
Message-Id: <20211201151734.654994-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211201151734.654994-1-danielhb413@gmail.com>
References: <20211201151734.654994-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MMCR1 determines the events to be sampled by the PMU. Updating the
counters at every MMCR1 write ensures that we're not sampling more
or less events by looking only at MMCR0 and the PMCs.

It is worth noticing that both the Book3S PowerPC PMU, and this IBM
Power8+ PMU that we're modeling, also uses MMCRA, MMCR2 and MMCR3 to
control the PMU. These three registers aren't being handled in this
initial implementation, so for now we're controlling all the PMU
aspects using MMCR0, MMCR1 and the PMCs.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu_init.c            |  2 +-
 target/ppc/helper.h              |  1 +
 target/ppc/power8-pmu-regs.c.inc | 11 +++++++++++
 target/ppc/power8-pmu.c          |  7 +++++++
 target/ppc/spr_tcg.h             |  1 +
 5 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index a7f47ec322..2d72dde26d 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6825,7 +6825,7 @@ static void register_book3s_pmu_sup_sprs(CPUPPCState *env)
                      KVM_REG_PPC_MMCR0, 0x80000000);
     spr_register_kvm(env, SPR_POWER_MMCR1, "MMCR1",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_generic, &spr_write_MMCR1,
                      KVM_REG_PPC_MMCR1, 0x00000000);
     spr_register_kvm(env, SPR_POWER_MMCRA, "MMCRA",
                      SPR_NOACCESS, SPR_NOACCESS,
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index d7567f75b4..94b4690375 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -21,6 +21,7 @@ DEF_HELPER_1(hrfid, void, env)
 DEF_HELPER_2(store_lpcr, void, env, tl)
 DEF_HELPER_2(store_pcr, void, env, tl)
 DEF_HELPER_2(store_mmcr0, void, env, tl)
+DEF_HELPER_2(store_mmcr1, void, env, tl)
 DEF_HELPER_3(store_pmc, void, env, i32, i64)
 DEF_HELPER_2(read_pmc, tl, env, i32)
 #endif
diff --git a/target/ppc/power8-pmu-regs.c.inc b/target/ppc/power8-pmu-regs.c.inc
index f0c9cc343b..25b13ad564 100644
--- a/target/ppc/power8-pmu-regs.c.inc
+++ b/target/ppc/power8-pmu-regs.c.inc
@@ -255,6 +255,12 @@ void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn)
 {
     write_MMCR0_common(ctx, cpu_gpr[gprn]);
 }
+
+void spr_write_MMCR1(DisasContext *ctx, int sprn, int gprn)
+{
+    gen_icount_io_start(ctx);
+    gen_helper_store_mmcr1(cpu_env, cpu_gpr[gprn]);
+}
 #else
 void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn)
 {
@@ -301,6 +307,11 @@ void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn)
     spr_write_generic(ctx, sprn, gprn);
 }
 
+void spr_write_MMCR1(DisasContext *ctx, int sprn, int gprn)
+{
+    spr_write_generic(ctx, sprn, gprn);
+}
+
 void spr_write_PMC(DisasContext *ctx, int sprn, int gprn)
 {
     spr_write_generic(ctx, sprn, gprn);
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 7131f52ccc..73252529be 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -133,6 +133,13 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
     hreg_compute_hflags(env);
 }
 
+void helper_store_mmcr1(CPUPPCState *env, uint64_t value)
+{
+    pmu_update_cycles(env);
+
+    env->spr[SPR_POWER_MMCR1] = value;
+}
+
 target_ulong helper_read_pmc(CPUPPCState *env, uint32_t sprn)
 {
     pmu_update_cycles(env);
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index 1e79a0522a..1d6521eedc 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -26,6 +26,7 @@ void spr_noaccess(DisasContext *ctx, int gprn, int sprn);
 void spr_read_generic(DisasContext *ctx, int gprn, int sprn);
 void spr_write_generic(DisasContext *ctx, int sprn, int gprn);
 void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn);
+void spr_write_MMCR1(DisasContext *ctx, int sprn, int gprn);
 void spr_write_PMC(DisasContext *ctx, int sprn, int gprn);
 void spr_read_xer(DisasContext *ctx, int gprn, int sprn);
 void spr_write_xer(DisasContext *ctx, int sprn, int gprn);
-- 
2.31.1


