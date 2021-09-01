Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACADF3FD84F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:00:24 +0200 (CEST)
Received: from localhost ([::1]:50028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLNyh-0006Yk-NT
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:00:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcJ-00075j-6t
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:15 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:51166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcH-0005oB-AS
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:14 -0400
Received: by mail-wm1-x330.google.com with SMTP id m2so1549062wmm.0
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1L/RlCqBiqLml/hFd0+F4uicJlE4I9SpOhrbXo7Iy/w=;
 b=KAc3cgnz8qMRNwjpuYTS5etFj6yWICTU1+XC+WYBJEJimZtuJjKoMSqqz6swPpgQdH
 jVPu1XNfEx5JSzBkB9LYbQ8qplvuBMSHFVFR/2wQQPbnzVu76mGj9CnX+AdJ5URxj6YL
 P3+BOdUvAmmF22ebu3TeUuOXEm/iK3HtPsyRatE5jdEpQWCbK24yUgJsTl+Ks0pzihez
 k4TkVRkeDeQOppwftrlm0y647m4I9SSBBSyAK349CwilMfCHF03+EdoFUiD6brElBz+Z
 vWJEIwbKPGN/2hBU0pLzjjJrlRFZQ24KEpQvO8BnueJmhhQHHWf7LyiNjNjIN8cLJErW
 pqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1L/RlCqBiqLml/hFd0+F4uicJlE4I9SpOhrbXo7Iy/w=;
 b=P2Sncb4A3N9I3xaAyCXdQWT0gMEJFZFHN5BQvFpCxAirCwz9N8aJBOW0zjFdijN5WP
 nHaWJeFC3TSH1tu2phj2jE/9WTFOniKut1pVyAK2gxJlNgdrB8M0k6JhMbldDNEaPFL5
 6Ael1Ahn2+BUnSjecPV99MBwsa0UlBtHlLwr7rxyR273nkS9JPAn5f3+XWU9YIXJmD+I
 YhoWlix9PgSSaT9ThMNxNlEHQYX0UqLfJuYZCm+DClGsL62er/lv4TlAasepnYbUdJt3
 ll9DgPJfhKqAHpRdGFtv/Ip3CefBmXlw1EGE2Z/lWURNtbRmSwjbyY5NKHcSmZc6Bi9b
 Nuog==
X-Gm-Message-State: AOAM530gcbQhz6pQvmhdOJHmjY4c2nn15slUQCpHxeGCW4NtFqNvL8gI
 QrVl7pVL7ROK+6wDYlUk3k35ENk1e2e9cg==
X-Google-Smtp-Source: ABdhPJy1zTrkf+njzXNB9pxJ1Y3kokGU76OrS3r9wPaj1Dat2jGcQ/PRe/hGPanFBgRu7mwyj7HwqQ==
X-Received: by 2002:a1c:20d7:: with SMTP id g206mr9230512wmg.153.1630492632002; 
 Wed, 01 Sep 2021 03:37:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/51] target-arm: Add support for Fujitsu A64FX
Date: Wed,  1 Sep 2021 11:36:26 +0100
Message-Id: <20210901103653.13435-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>

Add a definition for the Fujitsu A64FX processor.

The A64FX processor does not implement the AArch32 Execution state,
so there are no associated AArch32 Identification registers.

For SVE, the A64FX processor supports only 128,256 and 512bit vector
lengths.

The Identification register values are defined based on the FX700,
and have been tested and confirmed.

Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu64.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 2f0cbddab56..15245a60a8c 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -841,10 +841,58 @@ static void aarch64_max_initfn(Object *obj)
                         cpu_max_set_sve_max_vq, NULL, NULL);
 }
 
+static void aarch64_a64fx_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,a64fx";
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
+    cpu->midr = 0x461f0010;
+    cpu->revidr = 0x00000000;
+    cpu->ctr = 0x86668006;
+    cpu->reset_sctlr = 0x30000180;
+    cpu->isar.id_aa64pfr0 =   0x0000000101111111; /* No RAS Extensions */
+    cpu->isar.id_aa64pfr1 = 0x0000000000000000;
+    cpu->isar.id_aa64dfr0 = 0x0000000010305408;
+    cpu->isar.id_aa64dfr1 = 0x0000000000000000;
+    cpu->id_aa64afr0 = 0x0000000000000000;
+    cpu->id_aa64afr1 = 0x0000000000000000;
+    cpu->isar.id_aa64mmfr0 = 0x0000000000001122;
+    cpu->isar.id_aa64mmfr1 = 0x0000000011212100;
+    cpu->isar.id_aa64mmfr2 = 0x0000000000001011;
+    cpu->isar.id_aa64isar0 = 0x0000000010211120;
+    cpu->isar.id_aa64isar1 = 0x0000000000010001;
+    cpu->isar.id_aa64zfr0 = 0x0000000000000000;
+    cpu->clidr = 0x0000000080000023;
+    cpu->ccsidr[0] = 0x7007e01c; /* 64KB L1 dcache */
+    cpu->ccsidr[1] = 0x2007e01c; /* 64KB L1 icache */
+    cpu->ccsidr[2] = 0x70ffe07c; /* 8MB L2 cache */
+    cpu->dcz_blocksize = 6; /* 256 bytes */
+    cpu->gic_num_lrs = 4;
+    cpu->gic_vpribits = 5;
+    cpu->gic_vprebits = 5;
+
+    /* Suppport of A64FX's vector length are 128,256 and 512bit only */
+    aarch64_add_sve_properties(obj);
+    bitmap_zero(cpu->sve_vq_supported, ARM_MAX_VQ);
+    set_bit(0, cpu->sve_vq_supported); /* 128bit */
+    set_bit(1, cpu->sve_vq_supported); /* 256bit */
+    set_bit(3, cpu->sve_vq_supported); /* 512bit */
+
+    /* TODO:  Add A64FX specific HPC extension registers */
+}
+
 static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
     { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
     { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
+    { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
     { .name = "max",                .initfn = aarch64_max_initfn },
 };
 
-- 
2.20.1


