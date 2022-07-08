Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A65F556BD32
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 18:06:24 +0200 (CEST)
Received: from localhost ([::1]:34938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9qUp-0001VZ-PK
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 12:06:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pjX-0004Ps-NI
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:17:40 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:40672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pjU-0002WJ-0V
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:17:30 -0400
Received: by mail-pg1-x533.google.com with SMTP id i190so10006052pge.7
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5PME71S11cSPKZ4C3ISqAJ4KA5QkjnbMhk+jE1tP2f8=;
 b=SvXHXwwrb9UIIWa/IQI8vlHZiYEKQYfspABMDonF+Wqb7Zmul6sWgIjcs0m7hSFltQ
 Ntxrh6838agLRvEL9vNHu15nVOwOLkoi40QBMojgzsV3ErZQjLXpKZNy4SJRCNOIAKsR
 sCTJr0u19Q1ipUgteeqDQVSAsJAceVmmBwAAHna4Id7veoXbHwaDhFblSVxpXLpJGSte
 cPi0OKjo+OkbkFAunHCS2PwFGBx7wEb5WxUWfUNpTUw4rzCs0diFuRmuSJy8tPLKGyCs
 TlkdZX1LOK05AB4XydiQqracouR7Sez/oWAHJcgg07lpnV30N6i45MPfauy00+OSC1A6
 5VNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5PME71S11cSPKZ4C3ISqAJ4KA5QkjnbMhk+jE1tP2f8=;
 b=fbGQ9BHeVwxJ9VnO5+la4IOxyR6dBPAPL9oSP6Bn0HuwwlnnKPCqHROInY+Nmmd2za
 zPe/Zwde0/Vo2nhycmdLYm7x0hVO7bMe2JeBhwORnha3Z+hvegMM1gSS5fViyWLCr6dD
 Yxd5718zcQx6cXPHR3Tp/cCMcbyDPODz1CO6e4RmyLvOAX/OeAlfJsNCP6k+KqBozEmf
 lhlBKJ2ShyyeG7IHalcylfYn1eMq8Q+KmZ9rCLhPe3XEGxPoOM9y9SjZkvekoejuVjkR
 9CBoXkbz8Kzp5FiqJRy1zHHrRdc/xl5MMWAgbekrR1dASxbph4dmT6QftgEgJfusAB9b
 YnxA==
X-Gm-Message-State: AJIora/Jo7VJA6bn2K6GtJAW7xd+qOEoqhhG9J6OYW8Akw1d0AkrEdDC
 pNXWqdtUZDEw7IxX02d2itC1CfywGz43IR/R
X-Google-Smtp-Source: AGRyM1sjS5xgiQJI15oRciK2W+2myttAdH6q2ZbzugxPxi0j5ozTsU2xoGEEnUSsfmEw/xZh8o03Zw==
X-Received: by 2002:aa7:8895:0:b0:528:c6c7:c603 with SMTP id
 z21-20020aa78895000000b00528c6c7c603mr4542097pfe.46.1657293445432; 
 Fri, 08 Jul 2022 08:17:25 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:17:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 33/45] linux-user/aarch64: Clear tpidr2_el0 if CLONE_SETTLS
Date: Fri,  8 Jul 2022 20:45:28 +0530
Message-Id: <20220708151540.18136-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_cpu.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/linux-user/aarch64/target_cpu.h b/linux-user/aarch64/target_cpu.h
index 97a477bd3e..f90359faf2 100644
--- a/linux-user/aarch64/target_cpu.h
+++ b/linux-user/aarch64/target_cpu.h
@@ -34,10 +34,13 @@ static inline void cpu_clone_regs_parent(CPUARMState *env, unsigned flags)
 
 static inline void cpu_set_tls(CPUARMState *env, target_ulong newtls)
 {
-    /* Note that AArch64 Linux keeps the TLS pointer in TPIDR; this is
+    /*
+     * Note that AArch64 Linux keeps the TLS pointer in TPIDR; this is
      * different from AArch32 Linux, which uses TPIDRRO.
      */
     env->cp15.tpidr_el[0] = newtls;
+    /* TPIDR2_EL0 is cleared with CLONE_SETTLS. */
+    env->cp15.tpidr2_el0 = 0;
 }
 
 static inline abi_ulong get_sp_from_cpustate(CPUARMState *state)
-- 
2.34.1


