Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A002689BFB
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:37:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNx5U-0008Mc-OO; Fri, 03 Feb 2023 09:30:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4f-0006pf-RW
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:57 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4d-000592-3N
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:56 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 d4-20020a05600c3ac400b003db1de2aef0so4003100wms.2
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=K2xxnob3/roFGLD087p6MyGRfXODxkAp5LJkBKCgYJQ=;
 b=PisbtmTPlprY7uJgKO9dr130HwaV6I0k/581DvL/Ur1rRt1o9kX0WtKcKRfLAiO9dB
 uz+lDZtKar+gY/3EI8nmSVEg/mTvcOWTS0My/OMBsOhV5wwA2gKHsUBdPuwbLPqBwV1T
 mOybnQZwg+ZKNLK3pDud/yJHjw5WAiVBVvU4+NpyZBXEA/GHKM7bU/7JmlQcDhXr1Dsp
 9pdS/fjYfr/9wxyAwBAVLu4ppPSPluAK8KJvgHtJg6M72j5+jQNpAZqj85bJzw6Na1Ua
 uSzodVHKnEMqfNWKiuK/TTTtFgX+NcrlH8YuXTpJswZiSIRB82FdYTqvOKo2UgJIzcTT
 o6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K2xxnob3/roFGLD087p6MyGRfXODxkAp5LJkBKCgYJQ=;
 b=qsvlPlzjAL/BJKFwnJjsWqRdpUW1ZiVYSHZYXUIeA2YbSdmq+Xcc2jNL7W0+eQxDWY
 1OWB3TqMAdf+ejY6+H39rGQTTvvzqGc09tIj8khfy6PpLBM4i0rC7jxoL1T7r19TGbpD
 2KqPaCDeA3oMAXuaK1/Dpzyweo78na3swYlPWfqEm9R38GKxoxyfRIoT52Jul3bQmP2m
 Lr+dqfAAFs0CTFkQa03uDXIoE3WcYEKqnfYSZFRsk4eadQisdO1lt8PyaG+je1nG8OyN
 6Q0xTQtnYUGMVN+71fPBq/OUpJrf4Xn5jSYsTgnCXOtmUfszuz4FtxkgioBXVSiAC9Sg
 kCGA==
X-Gm-Message-State: AO0yUKWDbkEQHv7h7bL4eMMJOKAFGTqPeQPf3/8QjhDBJ0NnkT82L5AL
 sLk3BCjwahOUIN7N2KDN3L0Gn3vQt5tuOgos
X-Google-Smtp-Source: AK7set92dXak9YmbUOnuQWb/BW6qCoI8EiiyKUADxChCEG7IVrqI9cv8JZCj88GO3ZLW18MOWTLydA==
X-Received: by 2002:a05:600c:4e4e:b0:3dd:e621:d328 with SMTP id
 e14-20020a05600c4e4e00b003dde621d328mr12317510wmq.8.1675434593694; 
 Fri, 03 Feb 2023 06:29:53 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm2578492wmf.42.2023.02.03.06.29.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 06:29:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/33] target/arm: Mark up sysregs for HFGITR bits 48..63
Date: Fri,  3 Feb 2023 14:29:23 +0000
Message-Id: <20230203142927.834793-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203142927.834793-1-peter.maydell@linaro.org>
References: <20230203142927.834793-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Mark up the sysreg definitions for the system instructions
trapped by HFGITR bits 48..63.

Some of these bits are for trapping instructions which are
not in the system instruction encoding (i.e. which are
not handled by the ARMCPRegInfo mechanism):
 * ERET, ERETAA, ERETAB
 * SVC

We will have to handle those separately and manually.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Fuad Tabba <tabba@google.com>
Message-id: 20230130182459.3309057-20-peter.maydell@linaro.org
Message-id: 20230127175507.2895013-20-peter.maydell@linaro.org
---
 target/arm/cpregs.h | 4 ++++
 target/arm/helper.c | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 2e5ac6b4f98..efcf9181b97 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -696,6 +696,10 @@ typedef enum FGTBit {
     DO_BIT(HFGITR, TLBIVAAE1),
     DO_BIT(HFGITR, TLBIVALE1),
     DO_BIT(HFGITR, TLBIVAALE1),
+    DO_BIT(HFGITR, CFPRCTX),
+    DO_BIT(HFGITR, DVPRCTX),
+    DO_BIT(HFGITR, CPPRCTX),
+    DO_BIT(HFGITR, DCCVAC),
 } FGTBit;
 
 #undef DO_BIT
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5b9cc087e28..c0403aadae2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5295,6 +5295,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     { .name = "DC_CVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 10, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NOP,
+      .fgt = FGT_DCCVAC,
       .accessfn = aa64_cacheop_poc_access },
     { .name = "DC_CSW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 10, .opc2 = 2,
@@ -7588,10 +7589,12 @@ static const ARMCPRegInfo mte_el0_cacheop_reginfo[] = {
     { .name = "DC_CGVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 10, .opc2 = 3,
       .type = ARM_CP_NOP, .access = PL0_W,
+      .fgt = FGT_DCCVAC,
       .accessfn = aa64_cacheop_poc_access },
     { .name = "DC_CGDVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 10, .opc2 = 5,
       .type = ARM_CP_NOP, .access = PL0_W,
+      .fgt = FGT_DCCVAC,
       .accessfn = aa64_cacheop_poc_access },
     { .name = "DC_CGVAP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 12, .opc2 = 3,
@@ -7747,24 +7750,30 @@ static CPAccessResult access_predinv(CPUARMState *env, const ARMCPRegInfo *ri,
 static const ARMCPRegInfo predinv_reginfo[] = {
     { .name = "CFP_RCTX", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 3, .opc2 = 4,
+      .fgt = FGT_CFPRCTX,
       .type = ARM_CP_NOP, .access = PL0_W, .accessfn = access_predinv },
     { .name = "DVP_RCTX", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 3, .opc2 = 5,
+      .fgt = FGT_DVPRCTX,
       .type = ARM_CP_NOP, .access = PL0_W, .accessfn = access_predinv },
     { .name = "CPP_RCTX", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 3, .opc2 = 7,
+      .fgt = FGT_CPPRCTX,
       .type = ARM_CP_NOP, .access = PL0_W, .accessfn = access_predinv },
     /*
      * Note the AArch32 opcodes have a different OPC1.
      */
     { .name = "CFPRCTX", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 0, .crn = 7, .crm = 3, .opc2 = 4,
+      .fgt = FGT_CFPRCTX,
       .type = ARM_CP_NOP, .access = PL0_W, .accessfn = access_predinv },
     { .name = "DVPRCTX", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 0, .crn = 7, .crm = 3, .opc2 = 5,
+      .fgt = FGT_DVPRCTX,
       .type = ARM_CP_NOP, .access = PL0_W, .accessfn = access_predinv },
     { .name = "CPPRCTX", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 0, .crn = 7, .crm = 3, .opc2 = 7,
+      .fgt = FGT_CPPRCTX,
       .type = ARM_CP_NOP, .access = PL0_W, .accessfn = access_predinv },
 };
 
-- 
2.34.1


