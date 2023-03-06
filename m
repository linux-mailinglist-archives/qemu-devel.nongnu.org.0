Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1546AD127
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 23:08:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZIwd-0006UV-4K; Mon, 06 Mar 2023 17:04:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwa-0006SE-54
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:04:32 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwY-0006oz-FZ
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:04:31 -0500
Received: by mail-pl1-x62a.google.com with SMTP id p20so12036783plw.13
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 14:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678140269;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w2GsuBqezAObm8K6pvzmGWqlGyI6qx54Ha8z5VsFlJI=;
 b=XF6aVZiFaDSCfpv5i6wpSJrbo1wnAk4Lg/YKTGAvUNFcnLLFpgYn9j44C25MAnRuKX
 8KCV+rP2Z97dav/lxzZBLrcCwGWto0kC0i/0wZURYB2Qw5trGhIKMBDqeaO3n6KXmsUp
 pgbKlJ3X5AQ20+tBo0tO5XWp5Tuj9ZiQgW8JuXX7mqug/umxWE4VE6mowBEpJhJYTyJT
 IafQ5KHov2DSR3kj2kQLLJUhV6mp7N5EKqMIsuza4PPX9S8pEK0UmOKxFk+u7E0Bwl/s
 jeI7/JYSX+/4um8n6GfhQOcV/1Yf/VvyfcfXKYcFxcUevlaytfUbdAlad1IBnHS8MzZB
 M8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678140269;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w2GsuBqezAObm8K6pvzmGWqlGyI6qx54Ha8z5VsFlJI=;
 b=XSER1KA3GQitwrdk0VtrpdClhjxVCaH/ddJKyzioDyKNuUOWJXqPphmDcl1WcVvIkU
 vIkIZVkq5UFDVz4QcU61Vyjx9aCH8QicdJKbNpuoOa7M6SCI+6hxq70+pJ/t81YTujMa
 +7Va8E4JhN2/5QedIMNk4cbcx09j9ex63j/sfJHXYMagVGroMbQ7cw1JSgeGyQjifsPh
 w1uEl+1YBNbdS+vuDHGZp1yM7rPO5HAcN25oxwKI6nXcQF867YYsd9STCL6ANMFwW6+r
 zpmYbjCW2TY0n3Rk7E6Ksg8BBjJvmsdXRWOPslLxEayh4qZDMFqEFaBhmhvqg7bNnnBH
 FO5g==
X-Gm-Message-State: AO0yUKWcGv+q2z+0XgVgqf6Fx2DUksPV7YpapOwhir2BW2/YF262n0fa
 I+6TTQb60hNc25X1xrYiAM7T+w==
X-Google-Smtp-Source: AK7set86m3SSi3ZuVxAuZrx9wDlNf0KSiK8B16jm2xwyheb+OYFz3XtHidI/Gt1Fudk4Kp6TCPeDAA==
X-Received: by 2002:a17:90a:e7c6:b0:234:8950:6d1f with SMTP id
 kb6-20020a17090ae7c600b0023489506d1fmr13217071pjb.11.1678140269144; 
 Mon, 06 Mar 2023 14:04:29 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 h9-20020a17090acf0900b00219752c8ea5sm6336914pju.37.2023.03.06.14.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 14:04:28 -0800 (PST)
Subject: [PULL 05/22] disas/riscv Fix ctzw disassemble
Date: Mon,  6 Mar 2023 14:02:42 -0800
Message-Id: <20230306220259.7748-6-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306220259.7748-1-palmer@rivosinc.com>
References: <20230306220259.7748-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Ivan Klokov <ivan.klokov@syntacore.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Ivan Klokov <ivan.klokov@syntacore.com>

Due to typo in opcode list, ctzw is disassembled as clzw instruction.

Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>
Fixes: 02c1b569a15b ("disas/riscv: Add Zb[abcs] instructions")
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <20230217151459.54649-1-ivan.klokov@syntacore.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 disas/riscv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index ddda687c13..54455aaaa8 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -1645,7 +1645,7 @@ const rv_opcode_data opcode_data[] = {
     { "max", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
     { "maxu", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
     { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
-    { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "ctzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
     { "cpopw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
     { "slli.uw", rv_codec_i_sh5, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
     { "add.uw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
-- 
2.39.2


