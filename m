Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 104622CC5BC
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 19:46:26 +0100 (CET)
Received: from localhost ([::1]:42544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkX8z-0006ML-1F
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 13:46:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkX7A-0004yY-AX
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 13:44:33 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:32773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkX78-0002bB-Ab
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 13:44:32 -0500
Received: by mail-ej1-x641.google.com with SMTP id 7so5988796ejm.0
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 10:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cd+cZl3lcOYz3Gxtj1/bjHSaDTLTKsW2lXk6GJRA4IU=;
 b=S2pR8EmGeeVTU63mgKk5Ud1W84JypeTfvaScnRER/pLP+zhKc7dFIbwqQywoU8Sk6l
 6hs/J8GZ4N4fmmVTk/zb4WGXKxjjY/ZZ9WW8CW0Qs7ylTTn25wfjNkppjruxwne46iAJ
 4EZYq6ljyoPw/QqwcQvsFDrcq4iEZ31gy4PcFZclYqxksynZOnjaleoZlOb3YY69+EQK
 2UwSy9tUeBNUaEyiF2s8my6cYm7deOfQb98F13nZEhSuRLY7ub88SoazSM+CpQmJYIyV
 ugiN1YMf3DE5AKJPngoLMuSsNhd9353DkzFOjasJ+E9+Xzd1pfWzHr1HW4rotZlGcKUI
 qtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Cd+cZl3lcOYz3Gxtj1/bjHSaDTLTKsW2lXk6GJRA4IU=;
 b=iWllMFX3Ws3/2ks6e6CMl/EW5MXZm35TTZWAjJSDKSJnuhHNLMVwCEmYx3YxHW7e6M
 +0X9UBfrK8BH9OgbK9R+oqeSQ6+9eIwQ+xDod8H/tGQoN5bXSPJqnkqs/lUibhz3c+2Q
 rKcZVgq+E+mcMxERe/gajHCVIbW4lr8pY0TPS8YKHHgZufATO+vsUWVRgNCfWZ/mwQYU
 ahFcrevvsfVXlm0pnoQljT4s7dIloexP9TX1zlHFxWVOelfWEOyQrbmAOSNaAl5pVLe0
 1pcebtAYO+QwsjRAYvPittsT1ICOQ0qVRXPVG7FncBAd1uOWct7GKgUNY3YASontIBWL
 FU4A==
X-Gm-Message-State: AOAM531w7NrkhVpYV1YfoeaD8EKRNW7ZaCIICdY7ab1He3ApTpr4rAP+
 sScYcDQ/76rRpvG8MM6XdBt1Bap0Uhg=
X-Google-Smtp-Source: ABdhPJwV+gLJt4YMjpfq4QmFKSJ/vB4g2/7zLmukJCqDsckb+0ljrPmo2gKywnORW4y3V4vD2C5YXQ==
X-Received: by 2002:a17:906:3704:: with SMTP id
 d4mr1151640ejc.338.1606934668730; 
 Wed, 02 Dec 2020 10:44:28 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id p91sm550214edp.9.2020.12.02.10.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 10:44:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/9] target/mips: Simplify msa_reset()
Date: Wed,  2 Dec 2020 19:44:08 +0100
Message-Id: <20201202184415.1434484-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201202184415.1434484-1-f4bug@amsat.org>
References: <20201202184415.1434484-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x641.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Call msa_reset() inconditionally, but only reset
the MSA registers if MSA is implemented.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Maybe not very useful.
---
 target/mips/translate.c          | 5 +----
 target/mips/translate_init.c.inc | 4 ++++
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index a7c01c2ea5b..803ffefba2c 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -31997,10 +31997,7 @@ void cpu_state_reset(CPUMIPSState *env)
         env->hflags |= MIPS_HFLAG_M16;
     }
 
-    /* MSA */
-    if (ase_msa_available(env)) {
-        msa_reset(env);
-    }
+    msa_reset(env);
 
     compute_hflags(env);
     restore_fp_status(env);
diff --git a/target/mips/translate_init.c.inc b/target/mips/translate_init.c.inc
index 79f75ed863c..3b069190ed8 100644
--- a/target/mips/translate_init.c.inc
+++ b/target/mips/translate_init.c.inc
@@ -1018,6 +1018,10 @@ static void mvp_init (CPUMIPSState *env, const mips_def_t *def)
 
 static void msa_reset(CPUMIPSState *env)
 {
+    if (!ase_msa_available(env)) {
+        return;
+    }
+
 #ifdef CONFIG_USER_ONLY
     /* MSA access enabled */
     env->CP0_Config5 |= 1 << CP0C5_MSAEn;
-- 
2.26.2


