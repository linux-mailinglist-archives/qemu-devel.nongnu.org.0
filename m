Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B31F7515F66
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 19:05:46 +0200 (CEST)
Received: from localhost ([::1]:37668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkqXR-00024h-Jc
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 13:05:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkqUI-0008Fr-HI
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:02:30 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:46045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkqUH-0001BL-2B
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:02:30 -0400
Received: by mail-pg1-x529.google.com with SMTP id 7so4871759pga.12
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 10:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FnO0D6F2pYY5RB06rXsSe/52+8hRyxsKagxEsMSImdc=;
 b=WvIGJftUfn9oqTAGN5/K6vyGRaiRQh46Nruw1hxDAj+/Td/kb08C83x+Pkqm5DR6DA
 cLjzqImdjNvvjW0BDC2e7xYNLO3Wv6CNYHYqxjk/FQyuuXPAd7D69wL0d/Rq2GZ/4IRY
 JHOpt/RvQdQK+4PxHg6uduL5zZTa4Wn0YCVwiZQlktyB26zdOfJjJxaRjPpvQvx7Hs7N
 WMPpXiNjkUXkaq6csKELEK/G23N7Oa2R58Hw8zwLsoRX46tRuIP1v/rxorNhOvOXQxAa
 xAFbl7QBsu1WQ8ps5m0xDzRSY7reqWny9tfCHihf9jtDHXDkf7dO3Yo73jN9/n7Uej3K
 seoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FnO0D6F2pYY5RB06rXsSe/52+8hRyxsKagxEsMSImdc=;
 b=Z0HyaYnvDXzjeYIy80mgREFYIADsEGbUvOwfvtr1xTfoxwR68ZBaL1q54yZ28cRE3G
 zALBzA3nqxcMGiHLqPGa9zb4KX5Jutss/3ZCVwwJfG4CJcS0HmEYiDhc2hAlqfkAtXem
 W4bwmjQPhb8MikG9SD+R/RlMolS0CyP0p3HU20BFbb7snY4TchmdnHH172RGVTEdXizo
 ca1ld9U9CVeWcIV4U5Pi5itV1xEgDtZlWBYMd3nhSJ3zw8e+kFJrZgazD9qy45QtCOmY
 Fs2n1xVHnBL2XnMFnFq4A8RcgWk+m0OPVDG2Z8EETRm3I3uMNNzi510eWXKx2u0HhMRT
 Z5VQ==
X-Gm-Message-State: AOAM5304yUazLLkHKgUAq8mxB4kodfHAcdc9awo6BsElhp+jWnp2+kak
 QqIJfXt9PiuouEMzt+4I70WwE741pqS+NA==
X-Google-Smtp-Source: ABdhPJxYeWY7fJUmpebnMAfqWzph92NojQFYEV0YfXOu76krehCgZKp+HF2D8pd2qgTUj2ZCD5svtw==
X-Received: by 2002:a65:5b81:0:b0:3aa:1671:c6a7 with SMTP id
 i1-20020a655b81000000b003aa1671c6a7mr3650363pgr.169.1651338147480; 
 Sat, 30 Apr 2022 10:02:27 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 j10-20020a62b60a000000b0050dc762817dsm1753826pff.87.2022.04.30.10.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 10:02:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/m68k: Clear mach in m68k_cpu_disas_set_info
Date: Sat, 30 Apr 2022 10:02:24 -0700
Message-Id: <20220430170225.326447-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430170225.326447-1-richard.henderson@linaro.org>
References: <20220430170225.326447-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Zero selects all cpu features in disas/m68k.c,
which is really what we want -- not limited to 68040.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/cpu.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index c7aeb7da9c..5671067923 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -75,12 +75,8 @@ static void m68k_cpu_reset(DeviceState *dev)
 
 static void m68k_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 {
-    M68kCPU *cpu = M68K_CPU(s);
-    CPUM68KState *env = &cpu->env;
     info->print_insn = print_insn_m68k;
-    if (m68k_feature(env, M68K_FEATURE_M68000)) {
-        info->mach = bfd_mach_m68040;
-    }
+    info->mach = 0;
 }
 
 /* CPU models */
-- 
2.34.1


