Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCD1378C59
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 14:39:01 +0200 (CEST)
Received: from localhost ([::1]:53026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg5Bc-00064T-HP
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 08:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4z8-000673-Eq
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:26:06 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4z5-0003FH-6c
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:26:06 -0400
Received: by mail-wr1-x430.google.com with SMTP id m9so16437496wrx.3
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 05:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JL7HH1O51sX2ceg9tbB6Rc1ZArs66XI/7qZrVHYeGK8=;
 b=OXA5Mh3Hm41Dn5xwmqhzHyxWGmDVLG26MccGUbL70LwtX+UhyCG8KZ6uCeLRDA+cK4
 FEaXBKvIGfE0lI7X3+GsOPoKewjX//Oh6F5s9Xw3+dX9u4AzxsCNgMuxlgqSUzJYl2+E
 rN2vkrL/PCz9mQSmmzboYOD/+lMQLPXbwDNeY3tAtusT6Tkbno0sfCtDBggelXAtyQvE
 M4YIJa/UBknLDAw8VAf67Kmj7/U/36CQJXLyqMs1KObk2FVMgCxR1JG1uQEn33YFPY3l
 AZdZqbAI9WsAiVBX9xvZpVSLeopsOPzx9ON/sPurJn6tlWbWCCuLH5P1u+xk/yoznYCr
 jzYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JL7HH1O51sX2ceg9tbB6Rc1ZArs66XI/7qZrVHYeGK8=;
 b=Ubz2OfBlS81ExCM5IrpSFnruUClc26vIK/8TIG6OxQ9yNU7z+S5Eh+nzNPbmBjTd7d
 qkMKMwp5PFvfSrw7NXEjy9nGZ8IdryI+mmoAlOj63L53rDOtAGu6RlMST7iVsR952SmK
 u5j8mXceA5UrqjbKW6a2LXozJ3qVQhQLcwOhagU8TGeruN1LAqaKN0NDc6NSR5bTWXyb
 neUFyq83ERHATsavfV+2P43demkng3u4v3SzWdZXWA/Q6w6Cpeeipk6/C1b8FWvcvxBm
 ihM9SMC8tRrnWY1b8QBk5gan7zn7UDDrtyrsbSuIBwGgL6S+PXT/9OrE6K+JZtsXUBIG
 AzLg==
X-Gm-Message-State: AOAM530cwteT7ViB8hpiM7q0i7oemsD/ps2fQhtxgA62SPp2E2CHqMTD
 /50e2AT040lOb5qc0hLmo7qlOULH/PWL5g==
X-Google-Smtp-Source: ABdhPJxqcbzFp1SnPvSixiG0euIL46p1skYILZWpRicpwRFS+09qvz61N2GWFFzgxBHoIgcSVI+Cew==
X-Received: by 2002:a05:6000:108f:: with SMTP id
 y15mr31362080wrw.115.1620649561878; 
 Mon, 10 May 2021 05:26:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d9sm22749897wrp.47.2021.05.10.05.26.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 05:26:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/26] target/arm: Make WFI a NOP for userspace emulators
Date: Mon, 10 May 2021 13:25:39 +0100
Message-Id: <20210510122548.28638-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510122548.28638-1-peter.maydell@linaro.org>
References: <20210510122548.28638-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

The WFI insn is not system-mode only, though it doesn't usually make
a huge amount of sense for userspace code to execute it.  Currently
if you try it in qemu-arm then the helper function will raise an
EXCP_HLT exception, which is not covered by the switch in cpu_loop()
and results in an abort:

qemu: unhandled CPU exception 0x10001 - aborting
R00=00000001 R01=408003e4 R02=408003ec R03=000102ec
R04=00010a28 R05=00010158 R06=00087460 R07=00010158
R08=00000000 R09=00000000 R10=00085b7c R11=408002a4
R12=408002b8 R13=408002a0 R14=0001057c R15=000102f8
PSR=60000010 -ZC- A usr32
qemu:handle_cpu_signal received signal outside vCPU context @ pc=0x7fcbfa4f0a12

Make the WFI helper function return immediately in the usermode
emulator. This turns WFI into a NOP, which is OK because:
 * architecturally "WFI is a NOP" is a permitted implementation
 * aarch64 Linux kernels use the SCTLR_EL1.nTWI bit to trap
   userspace WFI and NOP it (though aarch32 kernels currently
   just let WFI do whatever it would do)

We could in theory make the translate.c code special case user-mode
emulation and NOP the insn entirely rather than making the helper
do nothing, but because no real world code will be trying to
execute WFI we don't care about efficiency and the helper provides
a single place where we can make the change rather than having
to touch multiple places in translate.c and translate-a64.c.

Fixes: https://bugs.launchpad.net/qemu/+bug/1926759
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210430162212.825-1-peter.maydell@linaro.org
---
 target/arm/op_helper.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 78b831f1811..381f7857efb 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -285,6 +285,17 @@ static inline int check_wfx_trap(CPUARMState *env, bool is_wfe)
 
 void HELPER(wfi)(CPUARMState *env, uint32_t insn_len)
 {
+#ifdef CONFIG_USER_ONLY
+    /*
+     * WFI in the user-mode emulator is technically permitted but not
+     * something any real-world code would do. AArch64 Linux kernels
+     * trap it via SCTRL_EL1.nTWI and make it an (expensive) NOP;
+     * AArch32 kernels don't trap it so it will delay a bit.
+     * For QEMU, make it NOP here, because trying to raise EXCP_HLT
+     * would trigger an abort.
+     */
+    return;
+#else
     CPUState *cs = env_cpu(env);
     int target_el = check_wfx_trap(env, false);
 
@@ -309,6 +320,7 @@ void HELPER(wfi)(CPUARMState *env, uint32_t insn_len)
     cs->exception_index = EXCP_HLT;
     cs->halted = 1;
     cpu_loop_exit(cs);
+#endif
 }
 
 void HELPER(wfe)(CPUARMState *env)
-- 
2.20.1


