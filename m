Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3824D46D6
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:27:36 +0100 (CET)
Received: from localhost ([::1]:44362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHtH-0001y3-DO
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:27:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxo-0006K4-Ih
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:28:14 -0500
Received: from [2607:f8b0:4864:20::532] (port=41819
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxl-00082B-CO
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:28:11 -0500
Received: by mail-pg1-x532.google.com with SMTP id o26so4484785pgb.8
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PHMXz9q73HVjYaAorTgnEhJkrDs42cYUdRyVosZEm/k=;
 b=UO36UmZntZvgjIPv5B0+rQ27YUeBJ/Iwa7/nvsUwT9IeiWn6KzBiy45kZl5URtgXjT
 JXKE60W8g3Ug8Tp0ec9wcUFp/s1cfrLQk6cm9pA0DRTFIkHGi28UWMI6sttspZR55nUw
 J4PeriBNbi5prGQaBGec8oSyAd3SD7Np5lWhwHFL9lgxEGs43IVnLND85mPjfVoMPcrH
 Khsl/s05OF+X+ldvqz9PkCsCkSpWaFb236PQECBc/72vS/e9dIQkMRb1cO1sVgGMUXal
 zTp9ltfQuJyIxt8RFnMjFQEPsyoYyVOG9mMIzZ1UTs0Ea8s+RRt17io5KjFjCZdW/70Z
 GDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PHMXz9q73HVjYaAorTgnEhJkrDs42cYUdRyVosZEm/k=;
 b=Omf1Rxb1Sv3npqywiKF8q6Q/ZrdQr9/jWDXvoKk97fwXLbOVhLEH94Ghhs3Z2KCmdV
 ONeS+7fHIj45xjdZnGd1IlhwspBt4MC9ssJFVvdEMlO2AKdStASm42HR7DMo2GLUt3xT
 7JNRqqrF1uzlLJT04cWgUKDqawYj/qTFF99XfAqlxPYgXdPZHLhRy+oux+SqIfra8q9O
 EArXkD9+khCHfc4QudlPPHv8lL/51zYAM8kKgaz4m2HxgvNfBu98IFctMP3uz1AwjMWl
 bh9nx5/QSRHlLBSZQVIYi/hC5ZNjvqVfnKe889uaaKkrAvKgE9upxTJEdoulKhRT1Uiv
 VKpA==
X-Gm-Message-State: AOAM531Y/eWppf8BqAkwQ1oA1aIQVs+nu56Fb+wrqOsru8R4jSa4St1T
 JzMtZsjqp7Gk1xKSxSwOA2/Bhc9MR/jsCw==
X-Google-Smtp-Source: ABdhPJzGwPtmJkx6BLf0S3I+9FEmNOEv0jzaLhZ7fCnm0yiFjQFUQUtp0vXDc9TcUTc3vVTaBwkATA==
X-Received: by 2002:a05:6a00:a8f:b0:4e1:2619:11a2 with SMTP id
 b15-20020a056a000a8f00b004e1261911a2mr4483830pfl.53.1646911688184; 
 Thu, 10 Mar 2022 03:28:08 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3114977pjb.1.2022.03.10.03.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:28:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 36/48] target/nios2: Hoist set of is_jmp into gen_goto_tb
Date: Thu, 10 Mar 2022 03:27:13 -0800
Message-Id: <20220310112725.570053-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rather than force all callers to set this, do it
within the subroutine.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index f61ba92052..51907586ab 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -165,6 +165,7 @@ static void gen_goto_tb(DisasContext *dc, int n, uint32_t dest)
         tcg_gen_movi_tl(cpu_pc, dest);
         tcg_gen_exit_tb(NULL, 0);
     }
+    dc->base.is_jmp = DISAS_NORETURN;
 }
 
 static void gen_jumpr(DisasContext *dc, int regno, bool is_call)
@@ -208,7 +209,6 @@ static void jmpi(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     J_TYPE(instr, code);
     gen_goto_tb(dc, 0, (dc->pc & 0xF0000000) | (instr.imm26 << 2));
-    dc->base.is_jmp = DISAS_NORETURN;
 }
 
 static void call(DisasContext *dc, uint32_t code, uint32_t flags)
@@ -251,7 +251,6 @@ static void br(DisasContext *dc, uint32_t code, uint32_t flags)
     I_TYPE(instr, code);
 
     gen_goto_tb(dc, 0, dc->base.pc_next + (instr.imm16.s & -4));
-    dc->base.is_jmp = DISAS_NORETURN;
 }
 
 static void gen_bxx(DisasContext *dc, uint32_t code, uint32_t flags)
@@ -263,7 +262,6 @@ static void gen_bxx(DisasContext *dc, uint32_t code, uint32_t flags)
     gen_goto_tb(dc, 0, dc->base.pc_next);
     gen_set_label(l1);
     gen_goto_tb(dc, 1, dc->base.pc_next + (instr.imm16.s & -4));
-    dc->base.is_jmp = DISAS_NORETURN;
 }
 
 /* Comparison instructions */
-- 
2.25.1


