Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0734736FEC6
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 18:40:52 +0200 (CEST)
Received: from localhost ([::1]:33298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcWCB-0004CJ-0i
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 12:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcVuF-00071H-Fw
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 12:22:20 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcVuC-00038N-MN
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 12:22:19 -0400
Received: by mail-wr1-x436.google.com with SMTP id d4so2773773wru.7
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 09:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yslsL0vxZl/43aFqtxJCsTyiqJiMHzf4CLCZds7Mx6M=;
 b=NIri3LLZmivN37gIpUM1t4iGBcIlcsxu7Ayq94Dir2pHxQJcU7YIIUUh+WQLhVDqB5
 Vt7Bm/htuXvGb3QpMbzPDtGO4aLa18pRBi4vQ7/RfPksMU5RNAJip6YBvG3LvpI2SxFh
 1wIGhUkL5ebYd4bGlQYxq7Ow8gXJLMiCr8l2w4G47Du8QzRWBJ09w0Oj57Iklh8KPMZo
 PfQPyE6oAVrVG2qrY0adsbkAeqy3pL5hxC7c69mET4onFT0PDAIZrwkEOGwekrAt7PAw
 WgeOMcN4Vd2g4VETQPFYUJB+EmfBt8c6D5W/RXbt3n0A3Y9nqSkJV12aLDnYqoGefl/+
 EwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yslsL0vxZl/43aFqtxJCsTyiqJiMHzf4CLCZds7Mx6M=;
 b=V1RLJ8H+g50mwOH/UY2mdkPGg8aLyXeQ4sPJWqlm1FvWfFunwrQJ+tWioByn6CFGuk
 HdQqQ1X8rTv6Mtu4L4NENdQwVfMiwu90lku0H8zMGavcbvGQaJTKdyyBplHMJXo2hyoz
 L9Bd5SykOxuJGUqPFr4i9z4DFAM/sR8MDyRTt3TG3kmYEqTvpov3bl4HAHKkBXVTnTLi
 ojxUWd70DF+of8JKdhYo5g8+VoJO+bvA13qkzjW9fx5UjO7cIC8FnM/meQn2Q4ReBaFO
 EZ/Vmy8Wi4whgyQ0UbLPHfycUUDhroIPSfqkTcTejh6hcCTmKY5q4OGg1JBNoSxRa5Tg
 nMwg==
X-Gm-Message-State: AOAM533R264n/AAaMTkNRtStJSe7tVvV9SjmtZjsQlkf+pOYLUHLsvif
 RCLfl2VDpd7vpM5R4TELOjQAMQxxLIRjYk2p
X-Google-Smtp-Source: ABdhPJxqN41N8FLiwtcq/a/4H1YO91PcXfEOdVzw/KpsmUjc3LQeRF8L2GK35nIE5ktxAYW1Sue1dg==
X-Received: by 2002:adf:fa84:: with SMTP id h4mr7807714wrr.44.1619799734592;
 Fri, 30 Apr 2021 09:22:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 3sm17120838wma.45.2021.04.30.09.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 09:22:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Make WFI a NOP for userspace emulators
Date: Fri, 30 Apr 2021 17:22:12 +0100
Message-Id: <20210430162212.825-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
---
 target/arm/op_helper.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 65cb37d088f..1a475aa51eb 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -286,6 +286,17 @@ static inline int check_wfx_trap(CPUARMState *env, bool is_wfe)
 
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
 
@@ -310,6 +321,7 @@ void HELPER(wfi)(CPUARMState *env, uint32_t insn_len)
     cs->exception_index = EXCP_HLT;
     cs->halted = 1;
     cpu_loop_exit(cs);
+#endif
 }
 
 void HELPER(wfe)(CPUARMState *env)
-- 
2.20.1


