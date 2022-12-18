Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A9965043D
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 18:52:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6xoA-0007R3-W2; Sun, 18 Dec 2022 12:50:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6xo8-0007Q7-SJ
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:50:40 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6xo7-0000L4-BU
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:50:40 -0500
Received: by mail-pl1-x629.google.com with SMTP id a9so6983527pld.7
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 09:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ChM3sc+CzkwOQP5vDmtYYgkxWLAHmyAWfx0/hRvgZJM=;
 b=aUTDnrC1x//mLA6hkNfbMg8ksldr4oU22bQtO0rpFjQKuWxfHvchU8EkjAU958j1oR
 0NSP3F9MrVaCV04v2F09lG198oOz3pMAjBrIeHs/ZmQUnwiQQkEt2nbP1bNWCHzo/fHm
 ghxnNqkI5IQXnhHdQY6RIjf2geIzfggR/7WdKWP2neD1rsIV0YKoN+zcpwOcY4vlFyhb
 HKQrWnlJUBSgrRDAhukIYLRigo3KB9zG0GRJvdbCl6LcUJUF5DAANcRsjusWwMHR3qQQ
 FghiZRdF8JHsqbKfHsL1nFQAbaDI2cbKBqZ3w+Vn/hgyTvgd8/gSgNYeGSaJjGyKYRHo
 bnZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ChM3sc+CzkwOQP5vDmtYYgkxWLAHmyAWfx0/hRvgZJM=;
 b=wyzGZ2cZXDeY70D7rT3/VCLe54IpL2B7t4eitjMENIi6Z3FDklW5Ht8Age3LWxYR5X
 NCfRJATXFAEjrOgSihnB0n2rM+d9GAx14mw6x6Y5nMEZgN+BRLr9PKGUzUwTAvbbRAOe
 t+2vbGOOUvULCD1vTttbtgSTisyuLLP77yoxnir5oFUEYManXYLRjtxEV9WxJcudknjf
 F0LSbaVwOXA6nubxso3m/bBvaKRC9fw+oaJehqNNpl4zGzJtBrlaHKhBYEmKiM3aEgRA
 ZoC4QumI5bAFucytSr/3r5b2PBnOYhD+Vq5XNMy4ddiFabWBITv46biIwcxKhuL0/od1
 AASg==
X-Gm-Message-State: ANoB5pmOHuoc8YX1Vo17yOVchYBADZMX1yOHdwHgnx2gpXMbMHYkQEjE
 9mJckV8uyFeIqR0poG2rzmlLN3Vu3VQV5Lbu
X-Google-Smtp-Source: AA0mqf6W6ACqOi1fhN2yePBqFUx9GVW+mqnwz04lLSjlZi/GviyF+6fwohhxrOT/azgL6gTB0ft6zA==
X-Received: by 2002:a17:903:2481:b0:189:b0ff:e316 with SMTP id
 p1-20020a170903248100b00189b0ffe316mr37262655plw.38.1671385837906; 
 Sun, 18 Dec 2022 09:50:37 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:3808:f064:41b8:eb9e])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a170902d2c900b00176b84eb29asm5318837plc.301.2022.12.18.09.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Dec 2022 09:50:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Guenter Roeck <linux@roeck-us.net>,
 qemu-stable@nongnu.org
Subject: [PULL 1/2] target/sh4: Mask restore of env->flags from tb->flags
Date: Sun, 18 Dec 2022 09:50:34 -0800
Message-Id: <20221218175035.449904-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221218175035.449904-1-richard.henderson@linaro.org>
References: <20221218175035.449904-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

From: Guenter Roeck <linux@roeck-us.net>

The values in env->flags are a subset of tb->flags.
Restore only the bits that belong.

Cc: qemu-stable@nongnu.org
Fixes: ab419fd8a035 ("target/sh4: Fix TB_FLAG_UNALIGN")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Message-ID: <20221212011345.GA2235238@roeck-us.net>
[rth: Reduce to only the the superh_cpu_synchronize_from_tb change]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 951eb6b9c8..f0934b20fa 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -47,7 +47,7 @@ static void superh_cpu_synchronize_from_tb(CPUState *cs,
     SuperHCPU *cpu = SUPERH_CPU(cs);
 
     cpu->env.pc = tb_pc(tb);
-    cpu->env.flags = tb->flags;
+    cpu->env.flags = tb->flags & TB_FLAG_ENVFLAGS_MASK;
 }
 
 static void superh_restore_state_to_opc(CPUState *cs,
-- 
2.34.1


