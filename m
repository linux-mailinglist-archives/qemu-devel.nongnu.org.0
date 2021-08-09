Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F03DC3E464C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:13:49 +0200 (CEST)
Received: from localhost ([::1]:48208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD56D-00055Z-1V
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD53g-00024p-2k; Mon, 09 Aug 2021 09:11:12 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:34310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD53e-00019t-60; Mon, 09 Aug 2021 09:11:11 -0400
Received: by mail-qk1-x731.google.com with SMTP id w197so16906100qkb.1;
 Mon, 09 Aug 2021 06:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DGlUQPK9e7epKwUBSBa5Q0ZSUZZqLkFNIDCZO/0kZRQ=;
 b=Hh4mP8xuT9pt3Vt0hdIO+ov7n/iqMrlhtCR7L1MfhC4X4RVJ+FaWuGPecjG9J+CaW3
 8BQmNITgavnmvAEyFu1+9smuTCALYkezzb1qlDhg6B1MXiqCmU7AW/Z/tt5KpiNZQBzM
 Md824C+ARJSh/fRHgCYlfawzTFfNCFKh2TF57yk8kacYulUo53UDKuG5DeYZ6i61tBNk
 B5wsN1C6ei5QPR0Uha9M8pcped42KvIIK10UIF+t56vCen8YTLp3EoORK3vXsjdZiYUs
 n2d711g7J97qcCs1q754EWARLyw4Ymw38s3gQOmmv3hSjhJk9pgtoeNC7SkOqs0FdOGU
 NY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DGlUQPK9e7epKwUBSBa5Q0ZSUZZqLkFNIDCZO/0kZRQ=;
 b=P8Q52ZoOuMMo5EV2d4mqiQKpQRbCPyf/B+1E4nF3VtUbYWJgh3LGxTyynhb5VHpqzB
 W3IstTbthyH3hHo5DI4sdJ1f8ufmHd+g4jbFei0ZTKQLH/2Uio4JSjzjPmuNUbEs7W1d
 pWsd1oKxvEIFehPaIqyUY2dxR4s491xkjnJLKxDrkm/lwW60A+9rmXWFOdSEK4H+FBB4
 6mww9dxZuWEaZOhIrvxixDzi7D9GxPcSUPuQWmnlBzeTaFVrjdhoE3/DyKojGi2M01sM
 NENexbPewje10RPdCfuBIyszsaVOpvGa+NBUromzGQsJ2HL1Qcqx0w17OTKARlV0sUjI
 3UJg==
X-Gm-Message-State: AOAM530NUO/EAjhX9MxQc9Ob5thRewsW/IltnnMBvdwWFihf/3nTkyuM
 3a8CN0GVnunx6as6LA1rav/NdbutxEJxLg==
X-Google-Smtp-Source: ABdhPJzHT+U1Thv18v7oW0fhMgRcswsLwBd5N0hUgUZsyGl96jvZD4ebqCOtKzp2LSDravYvMjyZXA==
X-Received: by 2002:a37:6888:: with SMTP id d130mr4181772qkc.391.1628514668799; 
 Mon, 09 Aug 2021 06:11:08 -0700 (PDT)
Received: from rekt.ibmuc.com ([191.19.172.190])
 by smtp.gmail.com with ESMTPSA id f3sm6757435qti.65.2021.08.09.06.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 06:11:08 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/19] target/ppc: add exclusive Book3S PMU reg read/write
 functions
Date: Mon,  9 Aug 2021 10:10:39 -0300
Message-Id: <20210809131057.1694145-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809131057.1694145-1-danielhb413@gmail.com>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x731.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: gustavo.romero@linaro.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PowerPC PMU, as described by PowerISA v3.1, has a lot of functions
that freezes, resets and sets counters to specific values depending on
the circuntances. Some of these are trigged based on read/value of the
PMU registers (MMCR0, MMCR1, MMCR2, MMCRA and PMC counters).

Having to handle the PMU logic using the generic read/write functions
can impact all other registers that has nothing to do with the PMU that
uses these functions. This patch creates two new functions,
spr_read_pmu_generic() and spr_write_pmu_generic, that will be used later
on to handle PMU logic together with the read/write of PMU registers.

We're not ready to add specific PMU logic in these new functions yet, so
for now these are just stubs that calls spr_read/write_generic(). No
functional change is made.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu_init.c  | 24 ++++++++++++------------
 target/ppc/spr_tcg.h   |  2 ++
 target/ppc/translate.c | 12 ++++++++++++
 3 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 505a0ed6ac..021c1bc750 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6821,47 +6821,47 @@ static void register_book3s_pmu_sup_sprs(CPUPPCState *env)
 {
     spr_register_kvm(env, SPR_POWER_MMCR0, "MMCR0",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_pmu_generic, &spr_write_pmu_generic,
                      KVM_REG_PPC_MMCR0, 0x00000000);
     spr_register_kvm(env, SPR_POWER_MMCR1, "MMCR1",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_pmu_generic, &spr_write_pmu_generic,
                      KVM_REG_PPC_MMCR1, 0x00000000);
     spr_register_kvm(env, SPR_POWER_MMCRA, "MMCRA",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_pmu_generic, &spr_write_pmu_generic,
                      KVM_REG_PPC_MMCRA, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC1, "PMC1",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_pmu_generic, &spr_write_pmu_generic,
                      KVM_REG_PPC_PMC1, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC2, "PMC2",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_pmu_generic, &spr_write_pmu_generic,
                      KVM_REG_PPC_PMC2, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC3, "PMC3",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_pmu_generic, &spr_write_pmu_generic,
                      KVM_REG_PPC_PMC3, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC4, "PMC4",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_pmu_generic, &spr_write_pmu_generic,
                      KVM_REG_PPC_PMC4, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC5, "PMC5",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_pmu_generic, spr_write_pmu_generic,
                      KVM_REG_PPC_PMC5, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC6, "PMC6",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_pmu_generic, &spr_write_pmu_generic,
                      KVM_REG_PPC_PMC6, 0x00000000);
     spr_register_kvm(env, SPR_POWER_SIAR, "SIAR",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_pmu_generic, &spr_write_pmu_generic,
                      KVM_REG_PPC_SIAR, 0x00000000);
     spr_register_kvm(env, SPR_POWER_SDAR, "SDAR",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_pmu_generic, &spr_write_pmu_generic,
                      KVM_REG_PPC_SDAR, 0x00000000);
 }
 
@@ -6941,7 +6941,7 @@ static void register_power8_pmu_sup_sprs(CPUPPCState *env)
 {
     spr_register_kvm(env, SPR_POWER_MMCR2, "MMCR2",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_pmu_generic, &spr_write_pmu_generic,
                      KVM_REG_PPC_MMCR2, 0x00000000);
     spr_register_kvm(env, SPR_POWER_MMCRS, "MMCRS",
                      SPR_NOACCESS, SPR_NOACCESS,
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index 0be5f347d5..2aab5878a0 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -25,6 +25,8 @@
 void spr_noaccess(DisasContext *ctx, int gprn, int sprn);
 void spr_read_generic(DisasContext *ctx, int gprn, int sprn);
 void spr_write_generic(DisasContext *ctx, int sprn, int gprn);
+void spr_read_pmu_generic(DisasContext *ctx, int gprn, int sprn);
+void spr_write_pmu_generic(DisasContext *ctx, int sprn, int gprn);
 void spr_read_xer(DisasContext *ctx, int gprn, int sprn);
 void spr_write_xer(DisasContext *ctx, int sprn, int gprn);
 void spr_read_lr(DisasContext *ctx, int gprn, int sprn);
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 171b216e17..c8f3878002 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -385,6 +385,12 @@ void spr_read_generic(DisasContext *ctx, int gprn, int sprn)
     spr_load_dump_spr(sprn);
 }
 
+void spr_read_pmu_generic(DisasContext *ctx, int gprn, int sprn)
+{
+    /* For now it's just a call to spr_read_generic() */
+    spr_read_generic(ctx, gprn, sprn);
+}
+
 static void spr_store_dump_spr(int sprn)
 {
 #ifdef PPC_DUMP_SPR_ACCESSES
@@ -400,6 +406,12 @@ void spr_write_generic(DisasContext *ctx, int sprn, int gprn)
     spr_store_dump_spr(sprn);
 }
 
+void spr_write_pmu_generic(DisasContext *ctx, int sprn, int gprn)
+{
+    /* For now it's just a call to spr_write_generic() */
+    spr_write_generic(ctx, sprn, gprn);
+}
+
 #if !defined(CONFIG_USER_ONLY)
 void spr_write_generic32(DisasContext *ctx, int sprn, int gprn)
 {
-- 
2.31.1


