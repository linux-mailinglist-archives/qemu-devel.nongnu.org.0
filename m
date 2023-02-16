Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 338B0698BA4
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 06:18:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSWeG-0002IC-Ga; Thu, 16 Feb 2023 00:17:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.nowakowski@fungible.com>)
 id 1pSWeD-0002Hc-Q5
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:17:33 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.nowakowski@fungible.com>)
 id 1pSWeC-0002z0-8a
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:17:33 -0500
Received: by mail-lf1-x131.google.com with SMTP id j17so1411634lfr.3
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 21:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fungible.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YJpoJan2rSCcRgdqx81gLTcIRZ83+AP6IzlPgi+QAhI=;
 b=BI9q75/+1jk0R0k7rBAfBtwChZKD3jzfVvvmkb7gxxVu9Rg8zruvjQNJxF6WE0sbtN
 Q98zax+3loArPkfTSuQnF7GLPFsdlI02djmZvlqsoJaDMf7gIHxCTe0qIxCsofmIHOVs
 N70o1Efvy/DjryzdYOWMZB74mOAbL1vPdY//A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YJpoJan2rSCcRgdqx81gLTcIRZ83+AP6IzlPgi+QAhI=;
 b=dr1rGDJHSI3RulHch5rmjKLQho5MQBzaojuH/E089k0kvHc00rQtEQ4ye3+reAol32
 XcsaPs3BIcGTv1Ea+tZqgSzf4fJbBI6r0zRTXD3hl977bRdo6xPTb2tzFrK9uy6NnpWr
 MD2qukR8TEqT4S7o4ZjxyMShBHI7RV0EeYtS33bwSj0g2e40dPWSXccnWre0ZDXo1JIg
 Djb4QHN5IstXwm5CxRG+o+k1iAfpqNQDw7IaRnPK8PmNGhYhoaGcKabF1y5xcbJNPGgc
 Dyr0oV9g6oESSFHPzzE1Lsq2okh0pUUO2X/EZPLOsu2R0n1tvIsbe+SR4g43f8R4vIx4
 mR1g==
X-Gm-Message-State: AO0yUKWy4ZLk6hmFuAlXI8AEg8dxSlO91fIuiIsb+nltuzvzCDmK0bsp
 Ku9/pWvOCX4nLZHWMPWBHKI8aO3lIG7vk4oh
X-Google-Smtp-Source: AK7set8iii4LC1X9i6jM4K1FAfO1oKyPAyxWGA+DGqEV99WksOWwDvXoxL3Q3xSpIGvk0Pqqi4JpCg==
X-Received: by 2002:a19:f505:0:b0:4d5:9682:6ec6 with SMTP id
 j5-20020a19f505000000b004d596826ec6mr1486460lfb.18.1676524650242; 
 Wed, 15 Feb 2023 21:17:30 -0800 (PST)
Received: from WR-NOWAKOWSKI.fungible.local (77-255-255-121.adsl.inetia.pl.
 [77.255.255.121]) by smtp.gmail.com with ESMTPSA id
 s1-20020a19ad41000000b004b7033da2d7sm141278lfd.128.2023.02.15.21.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 21:17:29 -0800 (PST)
From: Marcin Nowakowski <marcin.nowakowski@fungible.com>
To: qemu-devel@nongnu.org
Cc: marcin.nowakowski@fungible.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PATCH v2 2/4] target/mips: fix SWM32 handling for micromips
Date: Thu, 16 Feb 2023 06:17:15 +0100
Message-Id: <20230216051717.3911212-3-marcin.nowakowski@fungible.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230216051717.3911212-1-marcin.nowakowski@fungible.com>
References: <20230216051717.3911212-1-marcin.nowakowski@fungible.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=marcin.nowakowski@fungible.com; helo=mail-lf1-x131.google.com
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

SWM32 should store a sequence of 32-bit words from the GPRs, but it was
incorrectly coded to store 16-bit words only. As a result, an LWM32 that
usually follows would restore invalid register values.

Fixes: 7dd547e5ab ("target/mips: Use cpu_*_mmuidx_ra instead of
MMU_MODE*_SUFFIX")

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@fungible.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/mips/tcg/ldst_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/tcg/ldst_helper.c b/target/mips/tcg/ldst_helper.c
index d0bd0267b2..c1a8380e34 100644
--- a/target/mips/tcg/ldst_helper.c
+++ b/target/mips/tcg/ldst_helper.c
@@ -248,14 +248,14 @@ void helper_swm(CPUMIPSState *env, target_ulong addr, target_ulong reglist,
         target_ulong i;
 
         for (i = 0; i < base_reglist; i++) {
-            cpu_stw_mmuidx_ra(env, addr, env->active_tc.gpr[multiple_regs[i]],
+            cpu_stl_mmuidx_ra(env, addr, env->active_tc.gpr[multiple_regs[i]],
                               mem_idx, GETPC());
             addr += 4;
         }
     }
 
     if (do_r31) {
-        cpu_stw_mmuidx_ra(env, addr, env->active_tc.gpr[31], mem_idx, GETPC());
+        cpu_stl_mmuidx_ra(env, addr, env->active_tc.gpr[31], mem_idx, GETPC());
     }
 }
 
-- 
2.25.1


