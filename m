Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E419659388
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:05:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2rB-000322-DP; Thu, 29 Dec 2022 19:02:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2r9-00031n-Vt
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:40 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2r8-0002hW-Ac
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:39 -0500
Received: by mail-pl1-x630.google.com with SMTP id d9so3610128pll.9
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=14I+QLaNg6Y9e4H/8QMxuuyCzHk2ngznUAbtAPjHaRo=;
 b=YXDY7Gnc2LNTkdXFDVwU0n9aaJIVsDn2nVtGQiBNASSBBJKzRZMFWhXIYcoZBiSeHP
 laP/qxK9gFNhdqE1TrTz0xDRxn0rHqczYlUqzVPvRG3y4cYFy7E43z0BjWUNwJTQgNhm
 ZSxiBSdClMDQ/Mrd32+4dPsaUY1IZQo2O+Zoq/ZEqDz7TCfwjot5qYydrHhBe5Wkf7v2
 /8UJ/mt7Amf1Jl1NQje1lGYZ/DCWYRXxboOz9yRXiTlEjKC1PU1zmoFr6UNd1oDEfPLO
 cAVEXtScYj8jgUaSVFWjCdMoRJN5PkUhdayNhzXlRibrUttmMX+1+5pix1ynmRN6wEfL
 crRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=14I+QLaNg6Y9e4H/8QMxuuyCzHk2ngznUAbtAPjHaRo=;
 b=CFBlFGXGHQVRZIzYqdN8BEzMBK+kG10OecrSt5BAYys9VfETYfRj/ppqh4Qb80pMAF
 6uJdhDDYnFsNj8VHzceDzSGM9lDj9VfMOEHaaIavQEo6KW+yTL1QRbTCDpBiURS6PyVE
 v+huRJ6plRrLLQ0T6JdkjpOWjlCjpI9Kls8WpVD2CsxzJYEbvq52AIDNT5xeYX0tC4FH
 KWQvh/Rqn4w9HGPf0idKwh8c012aCBsNWXRiMJv4FfZ8cDhHF1fWXU0n8AujEPj2AmZy
 Z+MhljZPZVKIITr49JsdYWVAtLs6hPoTVcQQAeFns2JKF7+wlAomFD5M4JJNrdaajcUI
 mjCw==
X-Gm-Message-State: AFqh2kqYW3Ut9HD2ikqkfMJPOzIQM/qWXncYSs+VZCMPJaelwtJh8IO/
 eU5fEYI+xApPc/4yuVYiX14bf+j/bi+Se2UA
X-Google-Smtp-Source: AMrXdXuqpHSwdDPl5a/EveBJCtKoCeXj6zp9ak2BLFPapaKXtAqL+9WXAKbjvmuykCbvU/LmWhfqCw==
X-Received: by 2002:a17:902:904b:b0:186:95c9:ddc9 with SMTP id
 w11-20020a170902904b00b0018695c9ddc9mr37846166plz.55.1672358556934; 
 Thu, 29 Dec 2022 16:02:36 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170903028e00b00192849e1d0asm7343953plr.116.2022.12.29.16.02.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:02:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/47] tcg: Fix tcg_reg_alloc_dup*
Date: Thu, 29 Dec 2022 16:01:49 -0800
Message-Id: <20221230000221.2764875-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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


