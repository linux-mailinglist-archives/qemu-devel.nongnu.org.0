Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C366AFAAD
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 00:48:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZh1z-0000Ly-1R; Tue, 07 Mar 2023 18:47:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh1w-0000E3-2Y
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:47:40 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh1u-0002go-Fi
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:47:39 -0500
Received: by mail-wr1-x432.google.com with SMTP id h11so13781051wrm.5
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 15:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678232857;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OWLKTAiO22eOFIqE0r2ZKSlIhbJwHJ6ob/hpxtZPjvo=;
 b=B7M5uKYXYg1CUYNAgJgEcmrNPwzxV4Sh0R3tpe/+9j5HhW7o2FOb5FVWj4iyUE8pcc
 YKNUJzng8Og6kzvDYAG8nmBWoLRR/VGFGSbh0AfXp1VwwaMLXmeAhEkgPWMxNjWFvh9F
 tCcc6v5eOhAPmu50MfONL8j51Ip044hoOjWlII7qEs2KoGBqWbA4ZCBlUv899oU9hlvc
 ZcYi734tm2OUZmAsAHQFyDecalVee7LiUp7SEeE8oEp9axlzsrh7MxbdxymUn+xlEfsY
 r5GoD2MQtojxpQlmpIDQA32m3U0hcPtyzz8xswQpSqHH+lmIHGO0dyiGKpezJ/hSUyB5
 CY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678232857;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OWLKTAiO22eOFIqE0r2ZKSlIhbJwHJ6ob/hpxtZPjvo=;
 b=ER1t8vg/WQkwgLZwDEJdERVYk4WEt007PdkvHvMMn5k+qw3ded1Ek9fSTuDXhp2A3E
 m0LbBIp09jhVaZDjR8O3FSpvJN2nkPMm8+jWMInFZA4Sb0NpYZsbQofQhkv1jbX/8Zp5
 OixGTbjc5LJ4TEzKH7Aj/Q95buE/bmG3Vt8rSLEUgMhcorKeN6+M8vd6Re8vZrfAG4KO
 /LjydFgx/XorawfXDiGpMcA+YhPFVuWzCwYG4YJIp6JPygMFyTpft20FXkfIxAPi3ZrS
 3nLiM/6i3nZSrRw+I3kqpkF3mAaLPuxUiza5loQT5VCMvpnNWWYj6YG7UDyhE41wW24C
 DU+g==
X-Gm-Message-State: AO0yUKV9plEaUXWKdKc9KUapOX2yKqjFIyjjyaPkA/qCQTlk0mOyHLLK
 CoOzYUB3L09FW0r0RQRD8dXIMf2vN8OUttpZCBk=
X-Google-Smtp-Source: AK7set+6BlgkUGiYDFbWRrw20oGWcF0wGMMvIxS8JnqoUffhSZpl4sv0hhyPCCqmaUVAjlW8gx+z6w==
X-Received: by 2002:adf:dd4a:0:b0:2c8:14ba:459f with SMTP id
 u10-20020adfdd4a000000b002c814ba459fmr11256694wrm.20.1678232856935; 
 Tue, 07 Mar 2023 15:47:36 -0800 (PST)
Received: from localhost.localdomain (57.red-88-29-179.dynamicip.rima-tde.net.
 [88.29.179.57]) by smtp.gmail.com with ESMTPSA id
 n16-20020a5d67d0000000b002c758fe9689sm13634387wrw.52.2023.03.07.15.47.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Mar 2023 15:47:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Marcin Nowakowski <marcin.nowakowski@fungible.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PULL 04/20] target/mips: Fix SWM32 handling for microMIPS
Date: Wed,  8 Mar 2023 00:46:55 +0100
Message-Id: <20230307234711.55375-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230307234711.55375-1-philmd@linaro.org>
References: <20230307234711.55375-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Marcin Nowakowski <marcin.nowakowski@fungible.com>

SWM32 should store a sequence of 32-bit words from the GPRs, but it was
incorrectly coded to store 16-bit words only. As a result, an LWM32 that
usually follows would restore invalid register values.

Fixes: 7dd547e5ab ("target/mips: Use cpu_*_mmuidx_ra instead of
MMU_MODE*_SUFFIX")

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@fungible.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230216051717.3911212-3-marcin.nowakowski@fungible.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
2.38.1


