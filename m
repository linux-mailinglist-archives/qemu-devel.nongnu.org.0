Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B52513774
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 16:54:08 +0200 (CEST)
Received: from localhost ([::1]:42154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5Wx-0002Dv-Pv
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 10:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Jc-0005Jk-J4
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:22 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:45705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Jb-0006HI-1i
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:20 -0400
Received: by mail-wr1-x42c.google.com with SMTP id w4so7050015wrg.12
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=LOGHvBxXYzXTkGFJa6cK9FnjEwDj9sWdjIEaK6iDGIg=;
 b=mPReMNoLSCZRgprqPRZA3/bMDB7jgYorX7lSgekYTo02udPr4rFmGdimxRiS2cjLsl
 om0CtT7pGd2O97D+dA1vpH5neLbdf8lUiPJwEOOctSi7aur5z77uy7aN3TV9z/V4SLiq
 KXwPewUhAcwK2bfpMtXO83Dj8qksd3C9lYbJ+ibF2cBYpbFJnmcGjPBxJJ1S+tf5fWTS
 YmS+A+Onzaw+W1Li0KTR6pPXy4meF+LeX+rZKFuiwtOayau7b4kHTFB80n0qeBm+upHk
 coSc0oRZXG9wofi4r5x11j5t3fFb3yvPb2jyCA4iQ0abTtXj3BEr1+yoLxS0KUH2fp9u
 nDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LOGHvBxXYzXTkGFJa6cK9FnjEwDj9sWdjIEaK6iDGIg=;
 b=PQRXYITAWK3zXdvXvIKeQ91gQpJmH1mdNwWcsKD2KMMmkiP9Zbglku3lQ92XISan+Z
 boIza7D2O9syqg77pIkgV8O6z7NamGD18WPEYDN0kCSsarxHmLtYtDsYp/MSEJ4MJbO2
 5RsTeaWq8m3QeBfFwQwAIQ9rfCtYiOEpksJJl2qnAs53CKDKi1CcuqV9W1Rzb7Zy8ews
 ly7y3X+99TCpp607jtTpe96hNDvVwLM1+qtrs7Inc4QhPvlo0r4yEq9cYTERxB1c6lN1
 33K3pH3kCgnDbAOteZsHk/rme5XINNbt4BQvVvCpx+DLLnaXSwhE1eOGcFIZ+OQmYeXB
 A1CQ==
X-Gm-Message-State: AOAM531n9pmQoVeDUyCRsmEGb0Pxj4c6W94Sn1aOai7jZbN64v1949uH
 fG1khf8fHnjvpivEXlQ04go3hPSVa0hTNg==
X-Google-Smtp-Source: ABdhPJzxOx1ZtXXCzGuy5CWwKILTWMHe6Q9f1s9xLu9GNqZdzSkKRVllYjuaQCq1QxnqWkzOuxL0zg==
X-Received: by 2002:a5d:6949:0:b0:20a:e021:f8e0 with SMTP id
 r9-20020a5d6949000000b0020ae021f8e0mr14514953wrw.231.1651156817706; 
 Thu, 28 Apr 2022 07:40:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/54] target/arm: Use tcg_constant in disas_data_proc_2src
Date: Thu, 28 Apr 2022 15:39:20 +0100
Message-Id: <20220428143958.2451229-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Existing temp usage treats t1 as both zero and as a
temporary.  Rearrange to only require one temporary,
so remove t1 and rename t2.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220426163043.100432-17-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ff08306d2bc..358f42026c2 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5734,15 +5734,13 @@ static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
         if (sf == 0 || !dc_isar_feature(aa64_mte_insn_reg, s)) {
             goto do_unallocated;
         } else {
-            TCGv_i64 t1 = tcg_const_i64(1);
-            TCGv_i64 t2 = tcg_temp_new_i64();
+            TCGv_i64 t = tcg_temp_new_i64();
 
-            tcg_gen_extract_i64(t2, cpu_reg_sp(s, rn), 56, 4);
-            tcg_gen_shl_i64(t1, t1, t2);
-            tcg_gen_or_i64(cpu_reg(s, rd), cpu_reg(s, rm), t1);
+            tcg_gen_extract_i64(t, cpu_reg_sp(s, rn), 56, 4);
+            tcg_gen_shl_i64(t, tcg_constant_i64(1), t);
+            tcg_gen_or_i64(cpu_reg(s, rd), cpu_reg(s, rm), t);
 
-            tcg_temp_free_i64(t1);
-            tcg_temp_free_i64(t2);
+            tcg_temp_free_i64(t);
         }
         break;
     case 8: /* LSLV */
-- 
2.25.1


