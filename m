Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 719A33636D7
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 18:50:46 +0200 (CEST)
Received: from localhost ([::1]:56874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYAdB-0002U9-GW
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 12:50:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYALr-0003Q4-46
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:32:54 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYALp-0004ix-Mx
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:32:50 -0400
Received: by mail-wr1-x42c.google.com with SMTP id x7so31477154wrw.10
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 09:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cI4PhTSssBzprnZ9SB2PDNkaKKDmK+zR2mUB8dIm1f8=;
 b=KEKbRbsa2f2G22Y2inuzubP5Eq/wiREfvKZDs5nl+LGGmOtvXfpiKMvD3dhkxdfOn5
 IM9YbT9Nr7QPRRvOJJzHe9++Mnu/GBwK/xOW4SXBS3N8IQsyhH0ZsvT44PrdHDpasHxC
 euwJ8l9iAC2vdPf26TK8DfuLnaRImeTYZBsmHxOmRbIotHAK5AAKxiBBdN77KIz10Efg
 L9Mep61Ag9SpKDc/DgPXSMdjIznf2xvziZLGyRpUjZY+PnpI8+a9F7rb0SVEBD48ilxP
 T4LHU05YEXIuUTetq2svLRBdktyy5l0Cl7YGCRoYeX4P9D6io70XHrHjr/OtyjHsBLBg
 yJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cI4PhTSssBzprnZ9SB2PDNkaKKDmK+zR2mUB8dIm1f8=;
 b=lp5c0RG15+NTtlyzKUBGkkkblAEtZuaBOAyoN4xw6Mxtz9LzHHnI1HJCVlWX+/j57x
 XQdvXO+Z42FNIn7kRk3CvXCEpjDWdllOe+7ayzvPoDSALej2cNHMJ1rGyliX5XPsBn8K
 ApYJrx7+dvRdAz1AcsMaz9HVspNht3gBrL7aWU/COxWJW4nti9W/F0s30fZ0g4bTEczB
 XbXDXCaR4CXvF8EQEK5cR16Hcv9g5YF57NsiYuOcrhlTtdVSOO1Ugv+Psls3KC+kD1Ed
 WuH7XcZfeSIFXHBXJQ+A0i+24zEqay5Oc4ZbHDypOjX5/7LttzmcKw/FL+hPSnLcXA9Y
 PXZg==
X-Gm-Message-State: AOAM532L2Q4gcz93Yq4aCyhBKlCybh5x9QEKl7CSE9urGYla+Xlvjwuc
 8ZtwsuAPp7iOA+reOl2POkvo/eSZxAAiSA==
X-Google-Smtp-Source: ABdhPJz/QVJzcwROUFOwqZt6enXpMGm7isC084naZPNds8n1/BxnuQxhsSyadI+BUxhqdEoqqbxeqw==
X-Received: by 2002:a5d:590d:: with SMTP id v13mr9661732wrd.85.1618763568242; 
 Sun, 18 Apr 2021 09:32:48 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id q10sm16652158wmc.31.2021.04.18.09.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 09:32:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/26] target/mips: Restrict mmu_init() to TCG
Date: Sun, 18 Apr 2021 18:31:23 +0200
Message-Id: <20210418163134.1133100-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418163134.1133100-1-f4bug@amsat.org>
References: <20210418163134.1133100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

mmu_init() is only required by TCG accelerator.
Restrict its declaration and call to TCG.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h         | 3 ---
 target/mips/tcg/tcg-internal.h | 2 ++
 target/mips/cpu.c              | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 59c2c22cd0a..13f8e421662 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -233,9 +233,6 @@ void cpu_mips_store_compare(CPUMIPSState *env, uint32_t value);
 void cpu_mips_start_count(CPUMIPSState *env);
 void cpu_mips_stop_count(CPUMIPSState *env);
 
-/* helper.c */
-void mmu_init(CPUMIPSState *env, const mips_def_t *def);
-
 static inline void restore_pamask(CPUMIPSState *env)
 {
     if (env->hflags & MIPS_HFLAG_ELPA) {
diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-internal.h
index b65580af211..70655bab45c 100644
--- a/target/mips/tcg/tcg-internal.h
+++ b/target/mips/tcg/tcg-internal.h
@@ -20,6 +20,8 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
 #if !defined(CONFIG_USER_ONLY)
 
+void mmu_init(CPUMIPSState *env, const mips_def_t *def);
+
 void update_pagemask(CPUMIPSState *env, target_ulong arg1, int32_t *pagemask);
 
 uint32_t cpu_mips_get_random(CPUMIPSState *env);
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index ac38a3262ca..bfc927dd9cd 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -718,7 +718,7 @@ static void mips_cpu_realizefn(DeviceState *dev, Error **errp)
 
     env->exception_base = (int32_t)0xBFC00000;
 
-#ifndef CONFIG_USER_ONLY
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
     mmu_init(env, env->cpu_model);
 #endif
     fpu_init(env, env->cpu_model);
-- 
2.26.3


