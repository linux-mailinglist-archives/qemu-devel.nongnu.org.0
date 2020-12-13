Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4359C2D908A
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 21:30:08 +0100 (CET)
Received: from localhost ([::1]:53872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koY0M-0000QZ-SR
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 15:30:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXs8-000373-Sy
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:21:37 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:36258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXs7-0005fF-4j
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:21:36 -0500
Received: by mail-wm1-x334.google.com with SMTP id y23so13448343wmi.1
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 12:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IDtGX2egqT20QSVpEfuV5BUBIdAjxxq0FJmWInmLOws=;
 b=Rxe8/tK8x4o7R657Ex50CPpjB7/EeLZSFOP/XW+Mp4GBXVOrmqCRbWCxCDTTx9gQik
 x0rBQFDVRBfCSceRMW6vr0zWpwdDCV5lTNHemp/PDmd2xIab4knatraB71vETXn7AK7P
 RaNYEktPRVo/AgDkUZkmq+4gZV7c0YwWEqxeNLxTR7RWm5qW/1YAY7u+bn3Syll+J/G/
 qr5Onq688Qk5UTFBdCX/MytWg0Esf5gND5ozdRUZFhagfjUrlaf79+cD6Sr+9UyKaJqk
 GDbwH1buILB/J3O50q+c6kXzfv2nc/cn2hPveeyXR0JTBMuhp0slv+HJywc43jEmgZta
 /X/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IDtGX2egqT20QSVpEfuV5BUBIdAjxxq0FJmWInmLOws=;
 b=R+wOyUahZPOK8z8pi0tX4THzqgtnzOl/D29kUwDf+HNuJrwQM2vzNswKnDSC6gr4o+
 S1Bt4xRWdOT+ouEZJMNncR/tYrt/vz/GGvuhbE5BayfHtqlBSTHcgk9QMnCRplbHP40n
 S4/gflGSQIJ/ReFscvytsswwn4SZ0GyXJ+LYyyYEFNh//JVE6+O8b4aoc+Fj6nddMuHA
 z1ZJZrWgByq9+Mbh7g4wqgq1RY7gIfr9PLhOjJ3XfCOEEliTaeWaRtbcDZzmvVaktfbZ
 fF1buZ7WDTHrOWNDIozK8eVc1rUN3sM4DMhGg8yU/JZtmu1puLXmWkKW6lU4fH0p7iV2
 +63w==
X-Gm-Message-State: AOAM5309pmo/DA64A2V0dHY0fT62CjYVMYUKl2v2bMnDaaovCIlBZD+g
 THs6GNzF/6u8KqOs3s5D5zokwdxXlqM=
X-Google-Smtp-Source: ABdhPJw978QeLLZUhsM1IEM53GS3n3KXCYYFMbTvhHOFyz2/tV3RpsUG9gPyUqOu8SIdUbYNfVOzxA==
X-Received: by 2002:a05:600c:211:: with SMTP id
 17mr24471325wmi.84.1607890893645; 
 Sun, 13 Dec 2020 12:21:33 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id v189sm28388850wmg.14.2020.12.13.12.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 12:21:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/26] target/mips: Extract cpu_supports*/cpu_set* translate.c
Date: Sun, 13 Dec 2020 21:19:41 +0100
Message-Id: <20201213201946.236123-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201213201946.236123-1-f4bug@amsat.org>
References: <20201213201946.236123-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move cpu_supports*() and cpu_set_exception_base() from
translate.c to cpu.c.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201206233949.3783184-9-f4bug@amsat.org>
---
 target/mips/cpu.c       | 18 ++++++++++++++++++
 target/mips/translate.c | 18 ------------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 9d7edc1ca21..3024c51a211 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -315,3 +315,21 @@ bool cpu_supports_isa(const CPUMIPSState *env, uint64_t isa_mask)
 {
     return (env->cpu_model->insn_flags & isa_mask) != 0;
 }
+
+bool cpu_type_supports_isa(const char *cpu_type, uint64_t isa)
+{
+    const MIPSCPUClass *mcc = MIPS_CPU_CLASS(object_class_by_name(cpu_type));
+    return (mcc->cpu_def->insn_flags & isa) != 0;
+}
+
+bool cpu_type_supports_cps_smp(const char *cpu_type)
+{
+    const MIPSCPUClass *mcc = MIPS_CPU_CLASS(object_class_by_name(cpu_type));
+    return (mcc->cpu_def->CP0_Config3 & (1 << CP0C3_CMGCR)) != 0;
+}
+
+void cpu_set_exception_base(int vp_index, target_ulong address)
+{
+    MIPSCPU *vp = MIPS_CPU(qemu_get_cpu(vp_index));
+    vp->env.exception_base = address;
+}
diff --git a/target/mips/translate.c b/target/mips/translate.c
index ccc82abce04..84d2d44e5d5 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -31766,24 +31766,6 @@ void cpu_mips_realize_env(CPUMIPSState *env)
     mvp_init(env);
 }
 
-bool cpu_type_supports_cps_smp(const char *cpu_type)
-{
-    const MIPSCPUClass *mcc = MIPS_CPU_CLASS(object_class_by_name(cpu_type));
-    return (mcc->cpu_def->CP0_Config3 & (1 << CP0C3_CMGCR)) != 0;
-}
-
-bool cpu_type_supports_isa(const char *cpu_type, uint64_t isa)
-{
-    const MIPSCPUClass *mcc = MIPS_CPU_CLASS(object_class_by_name(cpu_type));
-    return (mcc->cpu_def->insn_flags & isa) != 0;
-}
-
-void cpu_set_exception_base(int vp_index, target_ulong address)
-{
-    MIPSCPU *vp = MIPS_CPU(qemu_get_cpu(vp_index));
-    vp->env.exception_base = address;
-}
-
 void cpu_state_reset(CPUMIPSState *env)
 {
     CPUState *cs = env_cpu(env);
-- 
2.26.2


