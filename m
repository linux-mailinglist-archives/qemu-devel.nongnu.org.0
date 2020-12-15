Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 054F02DB6EC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 00:09:45 +0100 (CET)
Received: from localhost ([::1]:37020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJRw-00014x-1l
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 18:09:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJH5-0003Bp-V4
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:58:31 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:40545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJH4-0003f9-Hy
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:58:31 -0500
Received: by mail-ej1-x643.google.com with SMTP id x16so30050739ejj.7
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 14:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0ud89HtdSyuwzqz0NlT4/PCPOyWmeeMuUKVW0RQc4ak=;
 b=R8Q/u6+uWuVnK9aH5rSnyo3uq6CPH9LEzjvDfihNcP/Oqy1TpUAulCP7BgTnEaSu4G
 l+E/Q9AflTdohyTRq2LrpLNOj5c3Hm1PmbOdImn5u8eVBGJXO3zK6L546r9SjcTivbT8
 uNKS3mINCH6gJ6HQPW6Ea37Ma/9B+Hqt/Igf/P9CrljRhNBDFze2k1Fprkj8Q2ZF5STN
 +k9TbVyjUVYNFxPht7VEuoe26q1yTuuiDilT1OX8cJ09eMHdPWQ/viDNbawwCKLMpI81
 p64BZ59K/3DLKJnE8lbAIivgAo3tFU9ftiSOyxTwRyiZTiga5uYW4tcrlhMF0wQrm/MN
 PiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0ud89HtdSyuwzqz0NlT4/PCPOyWmeeMuUKVW0RQc4ak=;
 b=RJmRNAyKe/LcicWfDgYzDowkjAQ+6jm74s6+x4m1WpFkyRn6fEIn8+IP8Diyv+yGAl
 WZEqLY7ArM9y/cAwPrlhrxZg2CQhRddxFEtB9+bMggG1xvC8hofORSDCYvNnZt5GvEJk
 0ThvVk//ubEuap7O3WkbQF7SbtaO2h1OvgTdWp4sF2MHlbZemG2UDJJhr0FGK94bpmAJ
 kcX0fZsuQNuhxI93BjNqa1VNlKSIpn6A2bWKkzzMyYK2eAvv1ISVk5mxLcqL+D6SRbtV
 Q7Reaj3Es8dompMmkU5JetXrHUgs9pd0I/xYFDIn/3Xftd5YNfJlnptuDqcZDUXyHO8x
 GeWA==
X-Gm-Message-State: AOAM531QaCZojSnehVMot4/pjNbLAYe1hMpbaQgg5P0p+eJGd8nT880M
 VtXL29XN9VE4vmRsvm8YLpc=
X-Google-Smtp-Source: ABdhPJz4LrH39C3yWw1Con4fZAHpZ4vpgToMC4Fn3eXoof1muEPI7fFCR+i/YKfY8AYmXD1Csav6+Q==
X-Received: by 2002:a17:906:4412:: with SMTP id
 x18mr6572504ejo.301.1608073109258; 
 Tue, 15 Dec 2020 14:58:29 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id z96sm19329766ede.81.2020.12.15.14.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 14:58:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 05/24] target/mips: Simplify msa_reset()
Date: Tue, 15 Dec 2020 23:57:38 +0100
Message-Id: <20201215225757.764263-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201215225757.764263-1-f4bug@amsat.org>
References: <20201215225757.764263-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x643.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Call msa_reset() unconditionally, but only reset
the MSA registers if MSA is implemented.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.c          | 5 +----
 target/mips/cpu-defs.c.inc | 4 ++++
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 1b4c13bc972..77ebd94c655 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -531,10 +531,7 @@ static void mips_cpu_reset(DeviceState *dev)
         env->hflags |= MIPS_HFLAG_M16;
     }
 
-    /* MSA */
-    if (ase_msa_available(env)) {
-        msa_reset(env);
-    }
+    msa_reset(env);
 
     compute_hflags(env);
     restore_fp_status(env);
diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
index a788f5a6b6d..bf12e91f715 100644
--- a/target/mips/cpu-defs.c.inc
+++ b/target/mips/cpu-defs.c.inc
@@ -976,6 +976,10 @@ static void mvp_init(CPUMIPSState *env)
 
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


