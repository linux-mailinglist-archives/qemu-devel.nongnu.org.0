Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 776EC2D0837
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 00:50:46 +0100 (CET)
Received: from localhost ([::1]:33044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km3nh-0006KO-Hj
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 18:50:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3dt-0005ga-2M
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:40:41 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3dq-0007hi-Jl
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:40:36 -0500
Received: by mail-wr1-x435.google.com with SMTP id l9so1888797wrt.13
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 15:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Aknicxq69ir15ZLnRnKAAOwqB9N6TW01pMwQWojqcCI=;
 b=SMcwF9Y38HdM3cHw+XUBTdWjcIxdXMevhr+d3RMSQzJm7SV4btb/jzsKL6dyAT8J4N
 RF/q0qOF69NuRBYtyjFNGzlvDciWaIjIoQVXTlKFg3tNb+UMTvzOHNi8cTjrAvr38IOB
 7gxFGtyOi+UX+l/vxT+ZZYH98m14+QNyVTZyi5LpzA4E9c7w2hx1RKB5VHo0meETNuh6
 5BvCm5p+lwkR3annd+3tgsEfLQdKYojvFNrou4sqlExf9n+yKPonUV1PUUHYd51z2D8V
 fre8cnC9LZsoexMnX6V4/ERaQtZ9XG4ZVXhtBJRs6VxhywP0thKFBNq8kwz6b45vW5Qn
 b69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Aknicxq69ir15ZLnRnKAAOwqB9N6TW01pMwQWojqcCI=;
 b=oQTkfEnYF2OYMwqXkG+pTL/3tetSJ3IazK56h7ZMOhAxoVLSRLSsWpSU0dJVs1l9g/
 oAW8pyYdUsSqo3EwFZLoPG0a1y6xpQQGmCLLHFoPoeJvpZ86K3ZHD1z6ELZLhmrTaJtf
 XSVHha1CGO4f/g0ABxI1T7k4m7hyhHj14fxifRSKjZTknJOny+NNVS0DQhntPA3G0bbi
 p5HNHNtRsxIEoLg+cq6Gtq8IMD/gMVAKk+0ulhtZPgJ4VGWmZLbF7ng7lqh+jTXyXJp+
 aOdU0N14cazT+65gtVfbvXVIrNwHQyhCG++E7FMszHiUVpPsvrY19xX/Saerg7hCR9cM
 cMeA==
X-Gm-Message-State: AOAM531x46ZrreWDWPUzZ0YSBQIYdgc1RD9DgIJ0nnkoOaaJwwBeDDG3
 g+SbZPU65VT9x7DGklcy/ou26YSL58c=
X-Google-Smtp-Source: ABdhPJxxew9ajV5OxcxEX4k8jrJziKOpQJ8c03uGsdsLbbr/Q/8/WsepohI0sQWMGW6MqgyNb1BSYA==
X-Received: by 2002:adf:f48c:: with SMTP id l12mr16503466wro.280.1607298032990; 
 Sun, 06 Dec 2020 15:40:32 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id a12sm12721260wrq.58.2020.12.06.15.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 15:40:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/19] target/mips: Extract cpu_supports*/cpu_set* translate.c
Date: Mon,  7 Dec 2020 00:39:38 +0100
Message-Id: <20201206233949.3783184-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201206233949.3783184-1-f4bug@amsat.org>
References: <20201206233949.3783184-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move cpu_supports*() and cpu_set_exception_base() from
translate.c to cpu.c.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.c       | 18 ++++++++++++++++++
 target/mips/translate.c | 18 ------------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 76d50b00b42..8d9ef139f07 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -310,3 +310,21 @@ MIPSCPU *mips_cpu_create_with_clock(const char *cpu_type, Clock *cpu_refclk)
 
     return MIPS_CPU(cpu);
 }
+
+bool cpu_supports_cps_smp(const char *cpu_type)
+{
+    const MIPSCPUClass *mcc = MIPS_CPU_CLASS(object_class_by_name(cpu_type));
+    return (mcc->cpu_def->CP0_Config3 & (1 << CP0C3_CMGCR)) != 0;
+}
+
+bool cpu_supports_isa(const char *cpu_type, uint64_t isa)
+{
+    const MIPSCPUClass *mcc = MIPS_CPU_CLASS(object_class_by_name(cpu_type));
+    return (mcc->cpu_def->insn_flags & isa) != 0;
+}
+
+void cpu_set_exception_base(int vp_index, target_ulong address)
+{
+    MIPSCPU *vp = MIPS_CPU(qemu_get_cpu(vp_index));
+    vp->env.exception_base = address;
+}
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 346635370c4..dbb71fdaa5d 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -31766,24 +31766,6 @@ void cpu_mips_realize_env(CPUMIPSState *env)
     mvp_init(env, env->cpu_model);
 }
 
-bool cpu_supports_cps_smp(const char *cpu_type)
-{
-    const MIPSCPUClass *mcc = MIPS_CPU_CLASS(object_class_by_name(cpu_type));
-    return (mcc->cpu_def->CP0_Config3 & (1 << CP0C3_CMGCR)) != 0;
-}
-
-bool cpu_supports_isa(const char *cpu_type, uint64_t isa)
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


