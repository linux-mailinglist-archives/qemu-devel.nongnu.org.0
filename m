Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE956A65E4
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:58:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCf4-0001h4-Jl; Tue, 28 Feb 2023 21:57:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCey-0001NL-Nt
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:40 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCex-0003Hz-3K
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:40 -0500
Received: by mail-pl1-x635.google.com with SMTP id a2so2121288plm.4
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2JXcb7ZH7fR6wbeffPOlf4awGGiKtoeN8TUjCn8atFg=;
 b=UBKSkAn+3On5kxMmI7TkBuBlwX3qGjtwL/QNN7waRkBy7Fu62HvYlEQRZzWzKnOclB
 TExozpFQrHfnW1LJungDezek107qv3qhJ7hvLABp4I6G1Ep3WXqDsz8SA1gHccpooFC+
 BBxlgWQM1iWO2G5Ajs3KY8zPZDxC6oJcH0NX5HVIXZsI2FPOtlWrdR848oMfpaInSIDA
 NBFwgaIFugXoQNM3Dlxg2alLjgWrecubZ+c7Pwjg6owEEzEUOfFvr4y0Q4A9y61TxZhm
 YSQLD/oGOeE3ZEtpaNYtwxuviJcaWYpmYtw0ofeH6aRj0i5GJXU67fwKiTdKmu9CN1TF
 L3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2JXcb7ZH7fR6wbeffPOlf4awGGiKtoeN8TUjCn8atFg=;
 b=KEd7GxbwnSTgWpaHn4cXXShPtVuXTCjBDDPB/IHemB0h8nMwHLHbs/Z7bRBnf1aTuf
 MnCw+Mw/uqT47lEU+0IA+3TDevSKTwBMoDEZrcOMGvYDN/1wAcFC8aZ3LggezKVxfrqU
 a4fTNIs0xMnbruJLqkMvk3DixgigjC5He7uo/Zq5OIubep+D115+qJcUcWsT2j8zyXxQ
 IPIDEJVTu7X96dBORevKs4kgve3G3IVPq3jk7/w1f386GUdEUFqIX2MFXF024s5YPTNN
 tEVC8C+D9nWBB55NAQf2Nhcx1C28jbVzr5b2A58gXpFOWvY5hBuGAhm8zqsjwZzBR+hX
 28Qg==
X-Gm-Message-State: AO0yUKVV5tARHcBVXBQ/Cs1YLNdg0bOMUTzO8Wd3VEGFDNVXZuIEVoyS
 xUbwnc3xVAB3BIzaaDy95gjPU99h3wMJWqeqtzw=
X-Google-Smtp-Source: AK7set+eA2NE4AOjJ5hpY4StbVSvIr9/2O2dof+gVbAPchu/W5zBaLO1e8SsKE8QHg5korii7IyPLA==
X-Received: by 2002:a17:903:40c7:b0:19c:aa28:2d08 with SMTP id
 t7-20020a17090340c700b0019caa282d08mr4301705pld.24.1677639457837; 
 Tue, 28 Feb 2023 18:57:37 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:57:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 30/62] target/arm: Replace `tb_pc()` with `tb->pc`
Date: Tue, 28 Feb 2023 16:56:11 -1000
Message-Id: <20230301025643.1227244-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

From: Anton Johansson via <qemu-devel@nongnu.org>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230227135202.9710-27-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 850b018efb..5182ed0c91 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -86,9 +86,9 @@ void arm_cpu_synchronize_from_tb(CPUState *cs,
          * never possible for an AArch64 TB to chain to an AArch32 TB.
          */
         if (is_a64(env)) {
-            env->pc = tb_pc(tb);
+            env->pc = tb->pc;
         } else {
-            env->regs[15] = tb_pc(tb);
+            env->regs[15] = tb->pc;
         }
     }
 }
-- 
2.34.1


