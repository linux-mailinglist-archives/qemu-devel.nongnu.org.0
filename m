Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5BE63FFF5
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 06:49:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ymQ-0002XF-BQ; Fri, 02 Dec 2022 00:40:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymO-0002WR-0T
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:08 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymM-0003Jv-8W
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:07 -0500
Received: by mail-pl1-x62b.google.com with SMTP id d3so3700852plr.10
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 21:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ubo08p5oxlcYFeE84Rh/1/JAKSwpqaTGcXF5lplXqUE=;
 b=se85c88E/4JZCgeYUOJfR49v03FoPWYHU+VbI75ZE10TWracAi2+P2IrmTHO/+v6W4
 K9poU++hE3QZbDTa2zfzNkH6KSx/iMtU2chpeUIcLbJYc0gKwsTWOvEEoApRJnvDSgYb
 fsJRUdCwuVGwhbH317+/NV6BxahwxjYTl6JesM3OXgvh2ZKorASAr8/hTLtL2QJz6XpY
 uwROIFAF5wJU5t38qBzcfaNxyqQ+kK4abzTAKnGBU/kueYsxr+J37r8u8Wwdrt7mnGpf
 A12mphCJg0Vww7oqkCTusXWBcU1T7FbW5kjhMWeqEaoKR82RQ2Iv/8WnHIOe2CJ26Zpl
 dwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ubo08p5oxlcYFeE84Rh/1/JAKSwpqaTGcXF5lplXqUE=;
 b=VVJ20iBguNRXv1NKTKr08YEXxQ5QgAaPBynOQMq+eSF107tIccSHZGg3+pyOlKEYQe
 e3p8wjaWEUqVmSu5WbzVTRzXhQHB5NgCHsEhkDA6IqefTUeg5fyPrcUzX0EWXdS1aFza
 yH1Sk3DjrfXbXG4Nurm5hIqNuobYdnSYTqiopRPzyRPvH+eQbAUA8Q4d7JRBCKdaPMC8
 ka1MaDrWzQ9dHqDxZhFJk9o7kaDLNVMJuuri+/LxSCgm9V0imxwHEtUXOeCbKz7YM+67
 LbLcDCm20qu6zWL8Poq8ohRO2P1ucEORJB4f9krYuxBT+K7JtHhgyAwRBUqvvAqqfcIy
 cbOw==
X-Gm-Message-State: ANoB5pkdbzZlLRjIlULkj6gc4G+oMV/IwoKo/c0knsz3wjMTsBvXjMfj
 3IXmYzX91/IDsCtS9OIKF/Mis4MBCKC5fj9c
X-Google-Smtp-Source: AA0mqf6fD7udkKXTLCuuYfn8ayi0Sko0HEgJKyk6yvs/T89IbhgaA3YXC9aSLAcMFP35XZlk12KeSQ==
X-Received: by 2002:a17:90a:2f62:b0:219:14b9:ac05 with SMTP id
 s89-20020a17090a2f6200b0021914b9ac05mr33972800pjd.175.1669959605010; 
 Thu, 01 Dec 2022 21:40:05 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b00186f0f59c85sm4637075plh.235.2022.12.01.21.40.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 21:40:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/34] tcg: Fix tcg_reg_alloc_dup*
Date: Thu,  1 Dec 2022 21:39:29 -0800
Message-Id: <20221202053958.223890-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202053958.223890-1-richard.henderson@linaro.org>
References: <20221202053958.223890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
index db64799e03..d1e91b8acc 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3515,7 +3515,6 @@ static void tcg_reg_alloc_dup(TCGContext *s, const TCGOp *op)
         ots->reg = tcg_reg_alloc(s, dup_out_regs, allocated_regs,
                                  op->output_pref[0], ots->indirect_base);
         ots->val_type = TEMP_VAL_REG;
-        ots->mem_coherent = 0;
         s->reg_to_temp[ots->reg] = ots;
     }
 
@@ -3569,6 +3568,7 @@ static void tcg_reg_alloc_dup(TCGContext *s, const TCGOp *op)
     tcg_debug_assert(ok);
 
  done:
+    ots->mem_coherent = 0;
     if (IS_DEAD_ARG(1)) {
         temp_dead(s, its);
     }
@@ -3799,7 +3799,6 @@ static bool tcg_reg_alloc_dup2(TCGContext *s, const TCGOp *op)
         ots->reg = tcg_reg_alloc(s, dup_out_regs, allocated_regs,
                                  op->output_pref[0], ots->indirect_base);
         ots->val_type = TEMP_VAL_REG;
-        ots->mem_coherent = 0;
         s->reg_to_temp[ots->reg] = ots;
     }
 
@@ -3843,6 +3842,7 @@ static bool tcg_reg_alloc_dup2(TCGContext *s, const TCGOp *op)
     return false;
 
  done:
+    ots->mem_coherent = 0;
     if (IS_DEAD_ARG(1)) {
         temp_dead(s, itsl);
     }
-- 
2.34.1


