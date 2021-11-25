Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E56FC45DCFB
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 16:11:23 +0100 (CET)
Received: from localhost ([::1]:45296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqGPD-0006CR-0V
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 10:11:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mqGMZ-0002oQ-3X; Thu, 25 Nov 2021 10:08:39 -0500
Received: from [2607:f8b0:4864:20::92d] (port=36448
 helo=mail-ua1-x92d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mqGMX-00021R-6Z; Thu, 25 Nov 2021 10:08:38 -0500
Received: by mail-ua1-x92d.google.com with SMTP id r15so12966756uao.3;
 Thu, 25 Nov 2021 07:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pUIFlcKij/L6qpLI3KtedQbz+F43S5wU9u9virOCZ2w=;
 b=k9ciLPjcMWNm9ZyLHJo/P4Yxh5P/Qnsr10hCHWTCjLaBGDgp6JDVObzhsiSePlYCD7
 ha9EG5N551Rkn5zN+elLNohCUrO6Ess2iBX3k6hdmgh4E55AkjxozX/kABu9Eq0hLzTh
 EnvvsqYmN1Mu697eFhHihbteiOq8mVuqL8a458uya4MXI2fca7rrqJSgxgc3enfrZlnE
 Oi4OVqGD2IoeMenwjl7xzUqf4stN7Bio7v1S8GWXC7QNzQWaGywhE4siaXV90ZbVLkT+
 pwK1eflWxrSNu0XxXe87SSBPDagK+UTZ59s8nOj9ehpa1mAWpT3NgB4uqtjwd0ODZVYW
 YLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pUIFlcKij/L6qpLI3KtedQbz+F43S5wU9u9virOCZ2w=;
 b=fu2nCe/guHqXkT9u2NIkaaEzikUQ8ZGesQRbnF0jV5eXJ323eFGjHEQyNZZg3ejhzA
 LJnfUgcjeR2CW9QRgIkHgypM3pCIUAeTltxBW5Xlb9ZeI+loyrw+SLMpP4pyb+536tqT
 ZNs1bhnnhxWqqWBTGKy/oJSVQnHQC9rWxjK8P7+TQIi1jpGnhNRG4A9maoDk1fpn4IWj
 LVNpaeY/eKEjtno7qFy0lRVg7UB8NTm5bih+JUBPGnObStFdbLMdOYKf9EdiJv6Jmw0F
 v/MQw/OhmZGdQfrXNx0rfGFilKMgIIwm3ATc9ZBB2KmlyuBle/Ieu99Qzmje7Sj3Hs3g
 h1Og==
X-Gm-Message-State: AOAM531GRs4emQ6flP7TWEqGRJ5fQUaKyXhfpifC+HQ5QuBPazziT4a1
 DIB+7Xm/AZV89nArCkwo2r0gZ0sV4cw=
X-Google-Smtp-Source: ABdhPJxwMsS1kOSkvnM/1IRXNoDXf3T+gHRIq6H1LD7wm74Nd5N/GTW3nKi1OtoKEmoczU7Grl9USg==
X-Received: by 2002:a05:6102:953:: with SMTP id
 a19mr10177328vsi.28.1637852916023; 
 Thu, 25 Nov 2021 07:08:36 -0800 (PST)
Received: from rekt.ibmuc.com ([191.19.215.188])
 by smtp.gmail.com with ESMTPSA id i27sm2081057uab.8.2021.11.25.07.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 07:08:35 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 04/10] target/ppc: PMU: update counters on MMCR1 write
Date: Thu, 25 Nov 2021 12:08:11 -0300
Message-Id: <20211125150817.573204-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211125150817.573204-1-danielhb413@gmail.com>
References: <20211125150817.573204-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92d.google.com
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
index 5f2623aa25..acdaee7459 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -145,6 +145,13 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
     }
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


