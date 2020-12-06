Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1D92D0847
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 00:56:15 +0100 (CET)
Received: from localhost ([::1]:49022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km3t0-0004XD-4S
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 18:56:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3eY-0006LO-B9
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:41:20 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:51497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3eW-000813-S9
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:41:18 -0500
Received: by mail-wm1-x32b.google.com with SMTP id v14so10035548wml.1
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 15:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rwJkcz0lXzb5vYIm5eeEUAMRTcJm9OyTFdsDcyLncdA=;
 b=laKKK4RHTXy8RCtw8YQNsRI6lS8XnVTBs+k0U5wnfrp96iRrU7cYGLqtfaO7/imgqa
 AiUBjkAOSesZfYzma0jBgAy5zgRZot01FKcYILx6sFBv6NPtQvBZ7Ux5vPyjxsmhQn+A
 qhJp82N5XKYSBvrAfAKZr+zZ23+v+JWzlnCJtUc8WJdYbmDS9F97ztnSDflsxjTx0YMK
 7k3UADxCZn2OBBt9rVwM2IxFykAXJ4PkMYrBG6h1odWUSVeFZP70NWDZ8N21EanXXPnr
 aZWc2fsPyknluRq+qH+x/dhJGo2c6/LHoUq6ejkxmO5vGu1kVZpzk8vEl3yz2rZnJkfc
 sf8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rwJkcz0lXzb5vYIm5eeEUAMRTcJm9OyTFdsDcyLncdA=;
 b=QorCjlEc9J3Cc3KSDjRj/xTJL2L9QzR901Is2g6e6pJv2YYUGayl2wFDv0bMJni/h0
 gDnd8Nt3VrDOgC+9xj20X51nQ9nj6ibJd9xAyOa+Qbvgov8QFL3VNf25O9XBPjklPQ3n
 VK/JovBk6NW2ksL+U7/JO2SU5TI8yfZXndC6hFrVzou+9v0NlizNgiVmN4Ozv8JmPSsU
 +EiEZ4JDL5glrGchLeGgiyYl3703GwOQdt3TdCZamnEraQPvXaUeK5VakVO8VfIO/R2e
 e8+bGPwoQHli9RWvw7kb3YIW2+PRuZVvbJjqSDu/362C6bZWYCofPSmbtsEcF1n7SQdM
 wzKQ==
X-Gm-Message-State: AOAM530sM/D8oFFI7C6dSbw5TyeCBX+XWIY1iMmlHDsYZYYpTohnXXQl
 TB+vN4yIaRyMoJz6GekPxYFJ8zwKmVU=
X-Google-Smtp-Source: ABdhPJzhZk3PMkFWuwgqgm+vSByS3t56zMO6H60iDu1eNSR/tUHRY2Ir5MnTTAjNiAl+UrHL28WeTA==
X-Received: by 2002:a1c:3c09:: with SMTP id j9mr15542997wma.180.1607298074148; 
 Sun, 06 Dec 2020 15:41:14 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id y2sm12424711wrn.31.2020.12.06.15.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 15:41:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/19] target/mips: Inline cpu_mips_realize_env() in
 mips_cpu_realizefn()
Date: Mon,  7 Dec 2020 00:39:46 +0100
Message-Id: <20201206233949.3783184-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201206233949.3783184-1-f4bug@amsat.org>
References: <20201206233949.3783184-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 1073db7f257..899a746c3e5 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -104,17 +104,6 @@ static bool mips_cpu_has_work(CPUState *cs)
 
 #include "translate_init.c.inc"
 
-static void cpu_mips_realize_env(CPUMIPSState *env)
-{
-    env->exception_base = (int32_t)0xBFC00000;
-
-#ifndef CONFIG_USER_ONLY
-    mmu_init(env, env->cpu_model);
-#endif
-    fpu_init(env, env->cpu_model);
-    mvp_init(env, env->cpu_model);
-}
-
 /* TODO QOM'ify CPU reset and remove */
 static void cpu_state_reset(CPUMIPSState *env)
 {
@@ -400,6 +389,7 @@ static void mips_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
     MIPSCPU *cpu = MIPS_CPU(dev);
+    CPUMIPSState *env = &cpu->env;
     MIPSCPUClass *mcc = MIPS_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
 
@@ -423,7 +413,13 @@ static void mips_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
-    cpu_mips_realize_env(&cpu->env);
+    env->exception_base = (int32_t)0xBFC00000;
+
+#ifndef CONFIG_USER_ONLY
+    mmu_init(env, env->cpu_model);
+#endif
+    fpu_init(env, env->cpu_model);
+    mvp_init(env, env->cpu_model);
 
     cpu_reset(cs);
     qemu_init_vcpu(cs);
-- 
2.26.2


