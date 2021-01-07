Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E062EE8C8
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:34:36 +0100 (CET)
Received: from localhost ([::1]:54634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxdrX-0005sM-7F
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:34:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdjn-0002zz-Ir
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:26:35 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdjm-00069U-5K
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:26:35 -0500
Received: by mail-wr1-x42b.google.com with SMTP id 91so7129268wrj.7
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SLgFG7YcdrjVHzWVWnO7xpT2n5lITWbqMk/I8sXWfOk=;
 b=d/2kXACMCYQclLA1uft/PbEWTToOKXFyqPw7O1axl2zel4sbNPxpmJ5XC3TjHwoKyb
 CEzzvJI4PAqaea5ghcON4a6gP4M65sPAYy7wEC2imtZENY4uqrK0U6GLXZoPEZmTbNFO
 Np8//S9+Sl80Rp9AsJZ/sD/GMGolPSyN7A8loIZENr/TZNM45KsGZ1hIzHPRSqUOIj1Q
 r8lsYqMDqomOL6eczMsHZ4A5ZPjr6gArW2M+DOv6QJzEmGkAflMzXJ1cDfjaBSf5F5cj
 oC5/V/JYLot/Yg2ZuVl7Hc40x8cq5/jIAU/b4ld7YGv+wvO0wTR70yV/5b+r/zJAPjES
 PgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SLgFG7YcdrjVHzWVWnO7xpT2n5lITWbqMk/I8sXWfOk=;
 b=AozF60EnlXluQVEMtuGhc6J9z8ozG/LgFPC3ruZzylSUSTlLTqOnKErs1Zz/Mpcmza
 G/gGsOeuAVMDTTrlYdS3KimS9NA7Ls6YWGyJdX9prcSik2dutufQJtUlj8pxnlarvUSG
 Wswt0F82H6IbjCiSWwHgekMQxDie0wYFQACkBv/nTcxmKUIkw1+qLVuGDEz9NNUAjjg6
 n0qu0D6wH22m2ZbBMd4lbAxPyeVF6/9A7axNdolBiG/jSWISOzJptmemvSENK/pC+0h7
 zw6V+7SW0hI1gD0mI7+5ZLLkk0XDUVCuW73xJxJcuXrWh7ZMHn7hf4kKa252lbmBESVO
 4AFA==
X-Gm-Message-State: AOAM532L3Yey4gyhdXm/rofaWamURmlvE834S5p/oK8AJZnBD79HIRzh
 lVgUA3cfahITq9HXBAncpXzWsI1axAE=
X-Google-Smtp-Source: ABdhPJwABwkMalCqlOIOuUNqZu3FWRSiPZD48Pp+/a8H7j6j4kjy5sVuElCjluc7YUiLCJi3AklShw==
X-Received: by 2002:a5d:6944:: with SMTP id r4mr688892wrw.134.1610058392803;
 Thu, 07 Jan 2021 14:26:32 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id o124sm10003482wmb.5.2021.01.07.14.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:26:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 42/66] target/mips: Alias MSA vector registers on FPU scalar
 registers
Date: Thu,  7 Jan 2021 23:22:29 +0100
Message-Id: <20210107222253.20382-43-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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

Commits 863f264d10f ("add msa_reset(), global msa register") and
cb269f273fd ("fix multiple TCG registers covering same data")
removed the FPU scalar registers and replaced them by aliases to
the MSA vector registers.

It is not very clear to have FPU registers displayed with MSA
register names, even if MSA ASE is not present.

Instead of aliasing FPU registers to the MSA ones (even when MSA
is absent), we now alias the MSA ones to the FPU ones (only when
MSA is present).

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <20201208003702.4088927-7-f4bug@amsat.org>
---
 target/mips/translate.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index e3cea5899f3..30354fee828 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -31561,16 +31561,20 @@ void mips_tcg_init(void)
                                         offsetof(CPUMIPSState,
                                                  active_tc.gpr[i]),
                                         regnames[i]);
-
     for (i = 0; i < 32; i++) {
         int off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[0]);
-        msa_wr_d[i * 2] =
-                tcg_global_mem_new_i64(cpu_env, off, msaregnames[i * 2]);
+
+        fpu_f64[i] = tcg_global_mem_new_i64(cpu_env, off, fregnames[i]);
+    }
+    /* MSA */
+    for (i = 0; i < 32; i++) {
+        int off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[0]);
+
         /*
-         * The scalar floating-point unit (FPU) registers are mapped on
-         * the MSA vector registers.
+         * The MSA vector registers are mapped on the
+         * scalar floating-point unit (FPU) registers.
          */
-        fpu_f64[i] = msa_wr_d[i * 2];
+        msa_wr_d[i * 2] = fpu_f64[i];
         off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[1]);
         msa_wr_d[i * 2 + 1] =
                 tcg_global_mem_new_i64(cpu_env, off, msaregnames[i * 2 + 1]);
-- 
2.26.2


