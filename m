Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADF2655BE1
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 01:06:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9EOc-0002ML-AD; Sat, 24 Dec 2022 18:57:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOZ-0002L4-L4
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:39 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOX-0006GI-Pu
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:39 -0500
Received: by mail-pj1-x102b.google.com with SMTP id p4so7977174pjk.2
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 15:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=14I+QLaNg6Y9e4H/8QMxuuyCzHk2ngznUAbtAPjHaRo=;
 b=WyfO2Znfa/bjfoJsLV/2GL7/2JoxXIk+Y2PVtcNuyZ7+UJWGHAHua3gZzWHk4VDnP3
 dsvEwebxAbmk24x2951Y7UxdlEbSOIDkBXTijoM8iRIttbSsJ0QCu4LRWJjEtPLlNfeU
 rJB4xDGRxfNLO67Zj9HwRckmdY+IvnMoNReMPAbgHRudJ2EA5qPG5GLHxSS/qaxFeaH7
 OwU6UaLt6hUjYocxf/hKNfcyXZgmQDvQPdmnEiCprPm6yIB9d4XATURAxZiEYNO6MTWU
 EblOsKvGDUWSpJtJIQ7YUJduiQvZYG9omChItitxxPhw6Xp5Ex4M3Ko2lMYvwmHe8uRI
 TXgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=14I+QLaNg6Y9e4H/8QMxuuyCzHk2ngznUAbtAPjHaRo=;
 b=5LzKx0Hl6z6dqTYbjBLqkC/iUtCnSHIw4Q2kf9uhmKx20pW+gGzUodkaQ/tex2tI6m
 d9ZeN+9TL8vc5+5kP78OrTyJQxsT7genJyz98767mEHnqpMO5LdFBZqjCebz6Fc86oPo
 otrx54nUh5PYnHEH38r48CQ2DfwtEjqNPFRzvGO2FiC1OA1fawvCoMCIqbx5hTuMBj0n
 HcrGLxVZWWKBBBREeWtfdKnlvV2Ud4AxnllhX2+Lu+iWBLZ3+jUO1AP7SHHUmoy8CPSk
 IRkViHwstPfxmVnxXHt0jhZ8GExiIVrbz0blgIuhLmPFQSD7p2rqkvCCcjDt86Iu7ieu
 Om6A==
X-Gm-Message-State: AFqh2krj905ajK/Aev7dhMfvV/9zjANaeA1jXI/CVj2bCDV3HDDcI6cF
 /hY+bd0ZJtzo0nZsXMf+yN76SrP+pSme/aZf
X-Google-Smtp-Source: AMrXdXt2C4QLqq6+/8yobvA1x1Lk95Z9/jIb7EH6Lj4KNqsR6ZuL8oEoI+OT+0Kd8CqZj0CwFK5npQ==
X-Received: by 2002:a17:903:3311:b0:189:6522:7cc0 with SMTP id
 jk17-20020a170903331100b0018965227cc0mr15626046plb.50.1671926257015; 
 Sat, 24 Dec 2022 15:57:37 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 cp12-20020a170902e78c00b00187022627d7sm4599716plb.36.2022.12.24.15.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 15:57:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v5 15/43] tcg: Fix tcg_reg_alloc_dup*
Date: Sat, 24 Dec 2022 15:56:52 -0800
Message-Id: <20221224235720.842093-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224235720.842093-1-richard.henderson@linaro.org>
References: <20221224235720.842093-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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


