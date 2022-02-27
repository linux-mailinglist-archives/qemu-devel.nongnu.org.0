Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE154C5E0D
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 19:25:34 +0100 (CET)
Received: from localhost ([::1]:34568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOOEf-0001uO-CZ
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 13:25:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOOAu-0002m5-Ic
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 13:21:40 -0500
Received: from [2607:f8b0:4864:20::435] (port=38668
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOOAt-0007pI-3p
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 13:21:40 -0500
Received: by mail-pf1-x435.google.com with SMTP id x18so9085542pfh.5
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 10:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RAL1NIBF7xZKJotAn1xZ6zr2b57K5Ny5tPwj+GqSPZE=;
 b=QqKWF0fvqJFVLJShPA8r41r1TNaHsWYCesDf309pymM+7B1pP8MUsdzydywBvKxMUn
 cByMo9LYsdqFZyMxwHfIudAs6M859AgcvGPnvYyLM4R2KfBEW4/5ZaBKpNp/a82Oxehx
 78wjic7OMjwttOdfq9RJvrSXvSJsUVhxxiQldiyQlD+xx3mH7AzSPlC9AQKzm6oIKTeN
 9KoYDJDLmd8NZuKZghxaJ1AW98JLJEOCYBvuUxGBhDHguZ1BPnYMCDmTBP6pcQcxh/TW
 jHdkX66CVGl5JO3pz+qyi3l4qVMbUVPiLAqO6I8LjraaGG7QuhqEk6IGecPpizos26MX
 oqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RAL1NIBF7xZKJotAn1xZ6zr2b57K5Ny5tPwj+GqSPZE=;
 b=BnhvJ81nPV20SM78Yj7oTaX4Uxp/L7OkwJni1AeH4XC9wjUuiLPP4syMLPR4yaLQ3U
 jrDzSF+C8AhfrjEaSs2e8VklFdCRF2VRJR5r3EM+Xq/cAQNCB+1jCBgYUmGlaUJ4INP8
 zQgbxpuTx4LKcwY5SFzXeVcG4D+irRpI61HS2IJuB52VrSNO/RQqecNhHmxFBUc0en7p
 Ywn4BB0v4D0o7PiQz8FPFbHzq6XKVl/GXDoknTE7cInmr9hHSZHH2cpjC+jYvGTsOPnK
 F/zVj1Y1JjJM9YMY7FCUxqajhi3Vtjwx6C5KKK7jNq1rLWbmeF5qRddND8HTSxmUXtlM
 M3AQ==
X-Gm-Message-State: AOAM533qlRlOTxBaB1wrYBktOnF2o+H3VVQi7sJZ9bVuzpUTezveHKam
 ulwCrZucxXSa3qE0Z0C2GxFU6yvigG1oyg==
X-Google-Smtp-Source: ABdhPJwBQcR8sfQHDLKAuM+mCFeOgiTpXg52+wuVkXooqUMKDfPyInPANQwvb0ROk9D9NrHX0dACmg==
X-Received: by 2002:a05:6a00:1494:b0:4f0:ece9:a01c with SMTP id
 v20-20020a056a00149400b004f0ece9a01cmr17484247pfu.58.1645986097953; 
 Sun, 27 Feb 2022 10:21:37 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-23be-43d9-7006-705a.res6.spectrum.com.
 [2603:800c:1201:c600:23be:43d9:7006:705a])
 by smtp.gmail.com with ESMTPSA id
 t41-20020a056a0013a900b004e167af0c0dsm10776252pfg.89.2022.02.27.10.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 10:21:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/7] target/nios2: Special case ipending in rdctl and wrctl
Date: Sun, 27 Feb 2022 08:21:24 -1000
Message-Id: <20220227182125.21809-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220227182125.21809-1-richard.henderson@linaro.org>
References: <20220227182125.21809-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It was never correct to be able to write to ipending.
Until the rest of the irq code is tidied, the read of ipending
will generate an "unnecessary" mask.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 52965ba17e..b17ce25a36 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -452,6 +452,15 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
     }
 
     switch (instr.imm5 + CR_BASE) {
+    case CR_IPENDING:
+        /*
+         * The value of the ipending register is synthetic.
+         * In hw, this is the AND of a set of hardware irq lines
+         * with the ienable register.  In qemu, we re-use the space
+         * of CR_IPENDING to store the set of irq lines.
+         */
+        tcg_gen_and_tl(cpu_R[instr.c], cpu_R[CR_IPENDING], cpu_R[CR_IENABLE]);
+        break;
     default:
         tcg_gen_mov_tl(cpu_R[instr.c], cpu_R[instr.imm5 + CR_BASE]);
         break;
@@ -477,6 +486,9 @@ static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
     case CR_TLBMISC:
         gen_helper_mmu_write_tlbmisc(cpu_env, v);
         break;
+    case CR_IPENDING:
+        /* ipending is read only, writes ignored. */
+        break;
     default:
         tcg_gen_mov_tl(cpu_R[instr.imm5 + CR_BASE], v);
         break;
-- 
2.25.1


