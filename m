Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EE059640D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 22:56:12 +0200 (CEST)
Received: from localhost ([::1]:36158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO3bf-0006wS-Bf
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 16:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3Gs-0004tw-3b
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:34:45 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:43934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3Go-0004ZK-Tr
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:34:41 -0400
Received: by mail-oi1-x235.google.com with SMTP id w196so13274201oiw.10
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 13:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=02+0PqV78M/uqtw50M+3MleQPnTNyfkwEaJtFvLiO+Q=;
 b=M3vLF9HgNXhc/1766Egl1iCWJS9pBruT371vggXZsr7+1LxNvOBFaMOURr6r9pzH+q
 4DvWZm1Q+mCvwP4QIsQM1u6xEeTWkkcY49XR6/YJo2Ny+ShjBQAcAdgiEMTxRvD9XIpq
 M0vwo8JT/U6p1jy3wbXy5fuWERXTjh4oxcIqz8neBPuktnYZz27wEsfZ761iUs2+So/w
 7f20AlTumkYTZvAYs7RUDWrU5/W3HTpgPAqzHo+M1DWFODSRSLmp91SI3ingma+3Ns6S
 TFp4foK8WO1DkAjt8pDEWcfdR5pPdTz+PR1KWNUJe9pzDSyLa5phFCxmCF63/35ON7Nw
 kD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=02+0PqV78M/uqtw50M+3MleQPnTNyfkwEaJtFvLiO+Q=;
 b=SkATlzAW9XrzeV95WPtpRkcAwV8xKZ0ZTNn6Q0enh79FVeOoa8c2mK3RElSdld4WqP
 pD7TciW7W5gzdOp/cEUPXKHTIyBynOJO2HvQb2HEk/OJ8y0Y/ClyjbVgswvVnBr1CEZ7
 4FWQ83Sj0HyR7xeBBlP9CvtptmvjiaxMK6fPblHVuejawuioaUFSeNqI4CtmIjKz2xVy
 5ZNHxieJmxJ6GuQiA25uXI29jl6T6YefpGFJRulEgVPx3wXrP+DGdL3+oYUX8wdjIqx6
 LL7J2YYUcS6gKCoFBjr77Cr+XAEykYjvohcQgpLSySJms3fFPAtGdypNWzfO17iJW006
 Jq3w==
X-Gm-Message-State: ACgBeo1qZgJPkebTgJ4dGbT4efZh//9MV4zJHl5ftyAVnBCUbSdR4g3p
 eVC4B/TpFDbKDy8BEQn2UxbaRE0Nh7kLvg==
X-Google-Smtp-Source: AA6agR5+aB1DKznv1HwcuQIR7e0IiOEw/NSWXQyIWF7lOUYROQ/dgGtzRjVHJvP4KrWnH8chDcKS3A==
X-Received: by 2002:a05:6808:3081:b0:343:56a3:cc23 with SMTP id
 bl1-20020a056808308100b0034356a3cc23mr153655oib.58.1660682077867; 
 Tue, 16 Aug 2022 13:34:37 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 13:34:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 14/33] accel/tcg: Raise PROT_EXEC exception early
Date: Tue, 16 Aug 2022 15:33:41 -0500
Message-Id: <20220816203400.161187-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
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

We currently ignore PROT_EXEC on the initial lookup, and
defer raising the exception until cpu_ld*_code().
It makes more sense to raise the exception early.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c      | 2 +-
 accel/tcg/translate-all.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 7887af6f45..7b8977a0a4 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -222,7 +222,7 @@ static TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
     desc.cflags = cflags;
     desc.trace_vcpu_dstate = *cpu->trace_dstate;
     desc.pc = pc;
-    phys_pc = get_page_addr_code(desc.env, pc);
+    phys_pc = get_page_addr_code_hostp(desc.env, pc, false, NULL);
     if (phys_pc == -1) {
         return NULL;
     }
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 596029b26d..a5ca424f13 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1343,7 +1343,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     assert_memory_lock();
     qemu_thread_jit_write();
 
-    phys_pc = get_page_addr_code(env, pc);
+    phys_pc = get_page_addr_code_hostp(env, pc, false, NULL);
 
     if (phys_pc == -1) {
         /* Generate a one-shot TB with 1 insn in it */
-- 
2.34.1


