Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 636982D908D
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 21:32:41 +0100 (CET)
Received: from localhost ([::1]:32946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koY2q-0003az-Eh
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 15:32:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXsS-0003i9-K4
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:21:56 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:54121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXsP-0005jw-9L
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:21:56 -0500
Received: by mail-wm1-x32b.google.com with SMTP id k10so11958239wmi.3
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 12:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LJkeleUBcGHGZISXoGddym+wEofBms0JlYm/28m4/UY=;
 b=reyXPlTsnGycXX/TRzVcaYnbIZrraBL/+1KXKqsJN518qKtofjV3OtHNLtKCd+Wqo2
 Hy6a4QWpLfWJpOdeaPucv4VDG+ZmA50p+k1bIYMXwunOMS5ZFWEMNjjQJo2hBDPNmJQn
 qBSUzBgNtwDk8Y3LilDtvW4faxdvEb+ePpYpJNlxO+HqPNAXcCPTvWJ9yuV8NCEjpvzj
 Yny9byxkkJcZMhMxoHX2lWxrHq0veg6FzSj+5XFNqN1g/xsiVUt2OD9tx+agwiNVqwfs
 qJ6Fxu0vDt+IHbYZkniWL2ODYcrE9P/QLEnKosFIHTbMnA7esKmJeKQHVLNUNKfuY8w5
 w08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LJkeleUBcGHGZISXoGddym+wEofBms0JlYm/28m4/UY=;
 b=TOgSkN1aV1cuniv4ORsQy029CjxfMex/aiN0vbWWOnA+eovCjMkfiHpRDPn8BUEuT9
 rXiPEVAGWUlY4e8KNuwoTM8T22jr1L5HiHx94qizC3a9n6rp2Xzt6Jlvb3dTCbrYMppr
 w1GnmvaYy+RIlaokjUpLW0ZB7wPQ2BSVvdtkb74KD3j3fyXg8iiR514XxZRUzLcAlfy9
 dfnnl5sTxCbj26+UgsERjN62EkwdHqEbXn33h290L5O2kkOTrN4Lk1i0buWaU8QCfwLS
 SrIkeBCOBgYVW8MVElqCaYHDkTldGpx6bpfwkz1Y9Fv6ZGbACWVmi3puQlMS9DFXlOag
 3Gxw==
X-Gm-Message-State: AOAM530BeBfGBxIZjV6Ec42hKQA21D9mGiR7HUlWW5wUKN+qY++EYyWR
 jnPBxSjJoYNXwNLo1uNSCYkHOIPQaLs=
X-Google-Smtp-Source: ABdhPJzMp3L7Q56kV+1c+M42iFI4YcY1kR8SEFv4g7CMPo7HH5NN8auAyFYmAwgHAOZbOuQSJxuF6w==
X-Received: by 2002:a1c:4d05:: with SMTP id o5mr25058616wmh.85.1607890908729; 
 Sun, 13 Dec 2020 12:21:48 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id e16sm31304940wra.94.2020.12.13.12.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 12:21:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/26] target/mips: Inline cpu_mips_realize_env() in
 mips_cpu_realizefn()
Date: Sun, 13 Dec 2020 21:19:44 +0100
Message-Id: <20201213201946.236123-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201213201946.236123-1-f4bug@amsat.org>
References: <20201213201946.236123-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201206233949.3783184-17-f4bug@amsat.org>
---
 target/mips/cpu.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index f2c4de7d070..aadc6f8e74d 100644
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
-    mvp_init(env);
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
+    mvp_init(env);
 
     cpu_reset(cs);
     qemu_init_vcpu(cs);
-- 
2.26.2


