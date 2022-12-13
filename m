Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EDF64BE59
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:27:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Cmc-0000Zg-4a; Tue, 13 Dec 2022 16:25:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cma-0000ZF-1u
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:25:48 -0500
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5CmY-0003BD-7r
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:25:47 -0500
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1443a16b71cso14157372fac.13
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 13:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=14I+QLaNg6Y9e4H/8QMxuuyCzHk2ngznUAbtAPjHaRo=;
 b=ktBkQfAUxQRmVBbwJCanoaPTPlYSrnlCuCEJuLx//tzf9L3msFVgjDBglNksqRVRMm
 6jZ2v/dtnQoh9JG4LfcHGMP91nvLAX2r9WkDQkBY56AQNVr5Ss/9GHCGp6yUF8lqUwQO
 UWmvDh6ECKNjY/IX1EAF03ZLNJ8J1Nv4sISJIFXvhsTIog2i/hj6gnqVM4guOJ7LBcE5
 bHXO91Qe5f/0Xize5qDV3KLTeJPkdk6iVwqPf+8dXIE3CdcdFkEoPAv7L45RDt/n/Qj3
 3ZP4LG66FC7t6eeNjcyh15N0YTdymiY6gtfBQu3jY7xpzk8gTj7NUAgybHVkQmNV5BcZ
 K9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=14I+QLaNg6Y9e4H/8QMxuuyCzHk2ngznUAbtAPjHaRo=;
 b=h4jgz2XHZ3RQwrXn57O5/6RTzwTbzcLt/4Vsy0J/ja9E8OvGTtfl2REaYFAfe7ZJMM
 lYuIL69/MSZFklZ9GAO+cwcHUEhD0UjrCJU1TtP9OZUNXBrNKCRJHJcyO7m1sKUwtEsX
 ojyT6eCC5ImTrFPPfYljjoGwBKe4rAahjPYwKlf/zpELSD/uOkHeO44l7gUCXAzYLnQl
 3eaMP17zECA9DHSXuuM+VQ8cg+zhVR1rgunItNqxCpXlypO8eGlxGnnr1mwuSdsyMHnW
 nHT6bsMxKgTa1K9q7L0o4TP/CQNDK4BxmS/eGefMjFk4/CxdmtJRyurHbDao+vL4MjlO
 nXqA==
X-Gm-Message-State: ANoB5plCcLRlSgR2SQFr/4AxqwMkIvuPvF5goCYUYZdtInM5TqqLqWyM
 +LZ2exv8R//MUeGdn4Z3vZWTnAKdA4prpCSfqh0=
X-Google-Smtp-Source: AA0mqf7vVQzugblCvdnAuZb4F+psDky8WffjiY62FICODZ1eRBFeNkofFR5pdo/N/rg+hukEzQBVPg==
X-Received: by 2002:a05:6870:4e03:b0:148:15ba:8869 with SMTP id
 pl3-20020a0568704e0300b0014815ba8869mr7026936oab.8.1670966744258; 
 Tue, 13 Dec 2022 13:25:44 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:c63:85ed:4256:8ad0])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a056808098700b0035c073aa0d8sm5006831oic.18.2022.12.13.13.25.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 13:25:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/27] tcg: Fix tcg_reg_alloc_dup*
Date: Tue, 13 Dec 2022 15:25:15 -0600
Message-Id: <20221213212541.1820840-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213212541.1820840-1-richard.henderson@linaro.org>
References: <20221213212541.1820840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
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

The assignment to mem_coherent should be done with any
modification, not simply with a newly allocated register.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 05d2b70ab7..371908b34b 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3498,7 +3498,6 @@ static void tcg_reg_alloc_dup(TCGContext *s, const TCGOp *op)
         ots->reg = tcg_reg_alloc(s, dup_out_regs, allocated_regs,
                                  op->output_pref[0], ots->indirect_base);
         ots->val_type = TEMP_VAL_REG;
-        ots->mem_coherent = 0;
         s->reg_to_temp[ots->reg] = ots;
     }
 
@@ -3552,6 +3551,7 @@ static void tcg_reg_alloc_dup(TCGContext *s, const TCGOp *op)
     tcg_debug_assert(ok);
 
  done:
+    ots->mem_coherent = 0;
     if (IS_DEAD_ARG(1)) {
         temp_dead(s, its);
     }
@@ -3779,7 +3779,6 @@ static bool tcg_reg_alloc_dup2(TCGContext *s, const TCGOp *op)
         ots->reg = tcg_reg_alloc(s, dup_out_regs, allocated_regs,
                                  op->output_pref[0], ots->indirect_base);
         ots->val_type = TEMP_VAL_REG;
-        ots->mem_coherent = 0;
         s->reg_to_temp[ots->reg] = ots;
     }
 
@@ -3823,6 +3822,7 @@ static bool tcg_reg_alloc_dup2(TCGContext *s, const TCGOp *op)
     return false;
 
  done:
+    ots->mem_coherent = 0;
     if (IS_DEAD_ARG(1)) {
         temp_dead(s, itsl);
     }
-- 
2.34.1


