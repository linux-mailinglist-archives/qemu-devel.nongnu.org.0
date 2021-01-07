Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 940C82EE8C1
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:33:29 +0100 (CET)
Received: from localhost ([::1]:49884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxdqS-0003u8-Hd
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:33:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdhu-0008Md-Ra
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:24:40 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdhs-00056e-L8
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:24:38 -0500
Received: by mail-wr1-x432.google.com with SMTP id r7so7117004wrc.5
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LDza1xPJHLgPcRTP3LkN+2X1iZhd2c06drajcL8+MJU=;
 b=u7McaY5ZOFPgSgui9Y82tO0QSZuNWvAtKwv1fJAJ3BzvICR2REIrXHvhezyAD/caAz
 awSqgWTLvWnOY8zw7Zz5gwtrvPeui0P1VAGCO+zvYPy8gOB2LkZSvhA9QEjmD6Li4N3E
 Usp9xMHF6tCUriJroaGarSi1mjk7Do+jmXyStVih6KykFVMqRI5FC952hSS+NogEdmTm
 lqiFpzt6RpUuKryqezm4mHFD+Oz4zx9F789e4ZLEeK9xrd7d47Xmp0ngdC+DHZwyLAgi
 DQog/Xll9uXaPNxKyPjXJRqa+uD9dHCSiMZhViGvI+ZIyCz0N6AXP/laxVpNCuB2Uc8F
 Czhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LDza1xPJHLgPcRTP3LkN+2X1iZhd2c06drajcL8+MJU=;
 b=ZSLrdGgGTv9lja9jix+w10Vof5aXLz7KT5TiYhN0BGg/1W7Rl9GZLvr3tdLhQVVoEm
 lE1XKyXsqSR52IbsT1d3TOBXCAYMiuU9FSanK36vb8DKpi3SpwiS2QhqJ6haNMhVLxtt
 buBKMrKHDaWf9IIHcURCcdmwUD1+dFFt8NWnPqwXzF2OaZFJZzmaR00q9d/8rFf197SZ
 LVxk6FSiex61tVZGHKc4nnBfsPZpsuBy9UYMpCI2IguQqQdUg2CCsRe6N6RALPnauYh2
 MIXcTOtih6e9U+J1I9aVdNqaRhBEA26/OjFtbBHlfTLZ1eqdt+C5g2aBRzW0WVmx3A4o
 RDMg==
X-Gm-Message-State: AOAM530fPZe335HoUtLael3CAOMZOXIKxauVQR7teR2fQXoYCLOV/7aJ
 SzoReG7T/Pt7d05HucM3a8uZNOcSD9I=
X-Google-Smtp-Source: ABdhPJzZbJj2jP0coNCZGst8B6hah0/bCVtvfFQLvcALnm39BBi1/wYWYtIpo/dUiEchSaYAkdfcWw==
X-Received: by 2002:adf:e406:: with SMTP id g6mr657530wrm.255.1610058275274;
 Thu, 07 Jan 2021 14:24:35 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id k1sm10356498wrn.46.2021.01.07.14.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:24:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/66] target/mips: Inline cpu_state_reset() in mips_cpu_reset()
Date: Thu,  7 Jan 2021 23:22:06 +0100
Message-Id: <20210107222253.20382-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201214183739.500368-2-f4bug@amsat.org>
---
 target/mips/cpu.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 12126d37f16..4a251e2d3e8 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -104,10 +104,16 @@ static bool mips_cpu_has_work(CPUState *cs)
 
 #include "translate_init.c.inc"
 
-/* TODO QOM'ify CPU reset and remove */
-static void cpu_state_reset(CPUMIPSState *env)
+static void mips_cpu_reset(DeviceState *dev)
 {
-    CPUState *cs = env_cpu(env);
+    CPUState *cs = CPU(dev);
+    MIPSCPU *cpu = MIPS_CPU(cs);
+    MIPSCPUClass *mcc = MIPS_CPU_GET_CLASS(cpu);
+    CPUMIPSState *env = &cpu->env;
+
+    mcc->parent_reset(dev);
+
+    memset(env, 0, offsetof(CPUMIPSState, end_reset_fields));
 
     /* Reset registers to their default values */
     env->CP0_PRid = env->cpu_model->CP0_PRid;
@@ -330,20 +336,6 @@ static void cpu_state_reset(CPUMIPSState *env)
         /* UHI interface can be used to obtain argc and argv */
         env->active_tc.gpr[4] = -1;
     }
-}
-
-static void mips_cpu_reset(DeviceState *dev)
-{
-    CPUState *s = CPU(dev);
-    MIPSCPU *cpu = MIPS_CPU(s);
-    MIPSCPUClass *mcc = MIPS_CPU_GET_CLASS(cpu);
-    CPUMIPSState *env = &cpu->env;
-
-    mcc->parent_reset(dev);
-
-    memset(env, 0, offsetof(CPUMIPSState, end_reset_fields));
-
-    cpu_state_reset(env);
 
 #ifndef CONFIG_USER_ONLY
     if (kvm_enabled()) {
-- 
2.26.2


