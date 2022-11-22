Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3168E6341B1
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 17:41:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxWJl-0002Hp-Fg; Tue, 22 Nov 2022 11:40:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxWJX-0002GQ-9Y
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 11:40:03 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxWJT-0003nb-G2
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 11:40:02 -0500
Received: by mail-wr1-x433.google.com with SMTP id z4so10990775wrr.3
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 08:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HqDPpnWELHr2m7elwL0yB9WHHm7yHlEKuLIM5l4oojA=;
 b=ML/oFIuAVEeanFtQtlzUzlU2mfjKw55JkQMX6vyJAa6Suh4VoG5Z22UIPB+dsT8N6b
 dMHnwnrnCMOvxNbSmQKuEbll2i3r2azAUf3sXjzxP9RbqtQ/G//RWFr8Jqbh0G3vXgIX
 jsBoouhipahyu1o4OE8tW+hkonm0yVKjcXplvO0H6vNJt/pWgbjrv2kcukXXlnkEsOqm
 3kNL1u0bPp3mFb0UlI9MeZUeYYCJyDeTlVRgol/OndeqkSaHKzYSlcBBL0z/YGrnK0hw
 8fucL1PBStmqE4HiDCuaZ2TgK27VARIKXYDvhJVC2EFyMxF1ZGjnhJdackZFSFvXp/SS
 jt7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HqDPpnWELHr2m7elwL0yB9WHHm7yHlEKuLIM5l4oojA=;
 b=7rjCSdUuFNxGhaP8MngxBIHExprZVUblxS4uxHqfqVjkxhpsQoF5cWWA3bJ+gUynkK
 OAKxr2F7Vz6Zn0dgDIMAvgIlNylgMseg5w8SSXEtb6mF2N/kHH/TnBdYHxmG/EfSTG2y
 7Kv5nWQKOX6wXWd2tvdVVU2sdrdJ3fvsdiNIH4+uHcygTU5ZCJ6f/d9uZViL3IlHyH8U
 eqbCo80+5YOTFlkGRmyw3ffRJMAPyVSEMwzohRqeutLaVN+hMZKz3Zs7urHY1esydbCu
 owfRPZwjAyKQHPd/418o9rgz0DEg7fn+vS4XDAcsOQc0UZsMBNtHQt2QO1RwOHzhvZB/
 Rtlw==
X-Gm-Message-State: ANoB5pnrzw7L9uNZWevonerzr0VJaQUplvCZFHsa5iHQ84eMZDDxua0b
 WVSjN0CxUIuIJ6DEfadE5kZZt0kih11y/Q==
X-Google-Smtp-Source: AA0mqf7Df347lPSwhiTqcFkVz7UhhhoYFLrpVcPtPa5HcD4otLIQLb5o5Y1jvSSNuOKsmu9d0JBBVg==
X-Received: by 2002:a5d:4c8c:0:b0:241:c222:e27e with SMTP id
 z12-20020a5d4c8c000000b00241c222e27emr10328767wrs.236.1669135198016; 
 Tue, 22 Nov 2022 08:39:58 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l10-20020adff48a000000b002366ded5864sm14353585wro.116.2022.11.22.08.39.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 08:39:57 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] target/arm: Use signed quantity to represent VMSAv8-64
 translation level
Date: Tue, 22 Nov 2022 16:39:54 +0000
Message-Id: <20221122163954.1900093-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221122163954.1900093-1-peter.maydell@linaro.org>
References: <20221122163954.1900093-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

From: Ard Biesheuvel <ardb@kernel.org>

The LPA2 extension implements 52-bit virtual addressing for 4k and 16k
translation granules, and for the former, this means an additional level
of translation is needed. This means we start counting at -1 instead of
0 when doing a walk, and so 'level' is now a signed quantity, and should
be typed as such. So turn it from uint32_t into int32_t.

This avoids a level of -1 getting misinterpreted as being >= 3, and
terminating a page table walk prematurely with a bogus output address.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8ca468d65bc..f812734bfb2 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1172,7 +1172,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     ARMCPU *cpu = env_archcpu(env);
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
     bool is_secure = ptw->in_secure;
-    uint32_t level;
+    int32_t level;
     ARMVAParameters param;
     uint64_t ttbr;
     hwaddr descaddr, indexmask, indexmask_grainsize;
@@ -1302,7 +1302,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
          */
         uint32_t sl0 = extract32(tcr, 6, 2);
         uint32_t sl2 = extract64(tcr, 33, 1);
-        uint32_t startlevel;
+        int32_t startlevel;
         bool ok;
 
         /* SL2 is RES0 unless DS=1 & 4kb granule. */
-- 
2.25.1


