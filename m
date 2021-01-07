Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BC62EE8FA
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:44:39 +0100 (CET)
Received: from localhost ([::1]:60830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxe1G-0004JF-Tf
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:44:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdkY-0004RH-Vi
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:27:23 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdkX-0006NU-4j
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:27:22 -0500
Received: by mail-wm1-x332.google.com with SMTP id r4so6807545wmh.5
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rBzgLDqqE9tlixFb1w2Ems4Ej+21PfOS0dtp5Xnk1qE=;
 b=XbMQJGvj/ERQdAoqFOepJIDBJBm4DPyk7iHUwRpA3fFh+5xFh/FO+wULHMhIpPtpVU
 H1Ylr0RRBgLph1HF5h/zyUPw5cfKvJqceiULQvPmTTiey43fJhlF+sNyMcEUZ46prG92
 QN+7j0zYlZTGJQO7doASweklnwwodL8ol0ZvtJNl6NxddseLXLPtrisuM/epcYJPLxrZ
 oewa1iIHa+nYlvFTn8ciNS2ZrXFMHkVnyidP2Zk+sYiFtpbJhrX5PfRQ9wHPF0xwV7Uv
 T2Rkjd7GhvS6ELbcbPEI/+4VwMqO5BPVJMyCbz6WWXRLJ40zDb1ERjkeg9hYrlL1hGeC
 TTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rBzgLDqqE9tlixFb1w2Ems4Ej+21PfOS0dtp5Xnk1qE=;
 b=SwnipXqacUbcp28jufW6vPURkr0JT2f9aBB9K3nxV14ZxKMrzCUNl/u40b4OD34ylb
 XGC2ZRrGcAIvGoVcg88jFY5WUvwKQkYSJL9ddGPNKLJPMzyQX5ubFhbzNNptBSCDr1QS
 JYOTrL8oSZc/k2MO6scx5hldEF63isVjmZ0mO/LqQaAMJz8GsFypXQuXHndVeiWICVM3
 U+fgA4xSHr/ZfSOz5NiPDk0vKIxSiFTo4gvcB34AzmuN1byaqSwE6LrVE+EEVaWWLwr+
 TmNu1Par8NBJHyzABcmxv4fiUIEyUefs1DyZD1CgFXgie5AxqCUJKPTohxhCjeNkBwFL
 /+5Q==
X-Gm-Message-State: AOAM531T//u3Xc6E/EiTYB0MjC8fOvKgcDu929fs2eOsHfEy8eZv9glE
 UwYHLNkpROC9B+0ExYcfL3jtT6Uoloo=
X-Google-Smtp-Source: ABdhPJz3cwRLw1uViG9szTaeR7d2mfQE7xcFc/rcQiEksAumr9lADebyUs4v2fikkm9QTzErOR897w==
X-Received: by 2002:a1c:4645:: with SMTP id t66mr510210wma.152.1610058439578; 
 Thu, 07 Jan 2021 14:27:19 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id f77sm9367016wmf.42.2021.01.07.14.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:27:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 51/66] target/mips: Pass TCGCond argument to MSA
 gen_check_zero_element()
Date: Thu,  7 Jan 2021 23:22:38 +0100
Message-Id: <20210107222253.20382-52-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simplify gen_check_zero_element() by passing the TCGCond
argument along.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201215225757.764263-25-f4bug@amsat.org>
---
 target/mips/msa_translate.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/target/mips/msa_translate.c b/target/mips/msa_translate.c
index a4f9a6c1285..52bd428759a 100644
--- a/target/mips/msa_translate.c
+++ b/target/mips/msa_translate.c
@@ -304,7 +304,8 @@ static inline int check_msa_access(DisasContext *ctx)
     return 1;
 }
 
-static void gen_check_zero_element(TCGv tresult, uint8_t df, uint8_t wt)
+static void gen_check_zero_element(TCGv tresult, uint8_t df, uint8_t wt,
+                                   TCGCond cond)
 {
     /* generates tcg ops to check if any element is 0 */
     /* Note this function only works with MSA_WRLEN = 128 */
@@ -339,7 +340,7 @@ static void gen_check_zero_element(TCGv tresult, uint8_t df, uint8_t wt)
     tcg_gen_or_i64(t0, t0, t1);
     /* if all bits are zero then all elements are not zero */
     /* if some bit is non-zero then some element is zero */
-    tcg_gen_setcondi_i64(TCG_COND_NE, t0, t0, 0);
+    tcg_gen_setcondi_i64(cond, t0, t0, 0);
     tcg_gen_trunc_i64_tl(tresult, t0);
     tcg_temp_free_i64(t0);
     tcg_temp_free_i64(t1);
@@ -378,10 +379,7 @@ static bool gen_msa_BxZ(DisasContext *ctx, int df, int wt, int s16, bool if_not)
         return true;
     }
 
-    gen_check_zero_element(bcond, df, wt);
-    if (if_not) {
-        tcg_gen_setcondi_tl(TCG_COND_EQ, bcond, bcond, 0);
-    }
+    gen_check_zero_element(bcond, df, wt, if_not ? TCG_COND_EQ : TCG_COND_NE);
 
     ctx->btarget = ctx->base.pc_next + (s16 << 2) + 4;
     ctx->hflags |= MIPS_HFLAG_BC;
-- 
2.26.2


