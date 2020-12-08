Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D9D2D31F0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:16:48 +0100 (CET)
Received: from localhost ([::1]:33426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmhXb-0004T0-GN
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:16:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIt-0007VA-8d
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:36 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:42311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIp-0006LH-7b
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:34 -0500
Received: by mail-ot1-x342.google.com with SMTP id 11so16601120oty.9
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ST8z3iXy65XpIqpPPS3C3oOPVYpkO0PbHbv3ibdmUyU=;
 b=zaamZuy2WtYxIW4kqK4LXrhb+L/YXJImcZ/LNoUVfWeGghEp65FmFu/kq75QaoE3+e
 7LtKzOpiTbAaVwU8p5gd2vypSR1ahrxEBnbwWwPMwRd8Q15LYeR31BmwmdWJeppmxkyY
 CERSrukQjLwVxAjyljTKLZAwkSf7eCxlhUj3fQDYO7sJchGXa6xg8Zd0QUx65rDqE4Vv
 kvpxUez+e2oCjsUHRxlstUxwceqaOP0R3fvdyxhkP3Cz5o+MTUYfbegSeKv+S4ciGdKp
 vNV2kp719gV7iQxA7uQVnWPNzrcHixhkgSEFcFon3R3kaNmGZdnFumvpLJf94qzsWNT0
 hgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ST8z3iXy65XpIqpPPS3C3oOPVYpkO0PbHbv3ibdmUyU=;
 b=KMBV0POifCHdIQnOZQwY12DNXrMs4vPY+IYghG95u9A2CPtNDKcEwWhDRckIoCnllS
 RM4iDQ9i3TxdujGZ3OBHaPgZVk/m7IbH0lv0eTMmm2yMzzf8gpt+c5Q09rDaLu9aXuIn
 h98RFrgCDw3ZJncOToYmB4kg4Zp8Y04OVlDTx078OGD02VxyP5Ishq/lBmVv88Q9HcUm
 tOK7hmn7O5kmScipk5xzsIKXEJGvr/n5bbD8Mb4YM+x8GP1+0Gggkf3/3M28WEqZAw0p
 aattUwSEotxuAaAhM/qGNzCJCrxMzeDeJgGNZVD/nY4nKMW+EQfl9OU9PfpZRBT92RFO
 Z1bA==
X-Gm-Message-State: AOAM530QPr4hYDlPJAJFrbmHYR42DUWuZ80B8zsk8IQPE1VmHvFHb0M+
 5wXlaycRxzYm4c/W2BMsI5bMLoR88Q8QW2tm
X-Google-Smtp-Source: ABdhPJz104giqjm4gZbTNe6S5jQ0zug1gCr06qdvy5+4JXHZULXxeATlaDb2n+oPR/UBdr1LEV4rww==
X-Received: by 2002:a05:6830:1610:: with SMTP id
 g16mr8736901otr.345.1607450488559; 
 Tue, 08 Dec 2020 10:01:28 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/24] target/arm: Fix SCTLR_B test for TCGv_i64 load/store
Date: Tue,  8 Dec 2020 12:00:59 -0600
Message-Id: <20201208180118.157911-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just because operating on a TCGv_i64 temporary does not
mean that we're performing a 64-bit operation.  Restrict
the frobbing to actual 64-bit operations.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index f35d376341..ef9192cf6b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -949,7 +949,7 @@ static void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
     tcg_gen_qemu_ld_i64(val, addr, index, opc);
 
     /* Not needed for user-mode BE32, where we use MO_BE instead.  */
-    if (!IS_USER_ONLY && s->sctlr_b) {
+    if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
         tcg_gen_rotri_i64(val, val, 32);
     }
 
@@ -968,7 +968,7 @@ static void gen_aa32_st_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
     TCGv addr = gen_aa32_addr(s, a32, opc);
 
     /* Not needed for user-mode BE32, where we use MO_BE instead.  */
-    if (!IS_USER_ONLY && s->sctlr_b) {
+    if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
         TCGv_i64 tmp = tcg_temp_new_i64();
         tcg_gen_rotri_i64(tmp, val, 32);
         tcg_gen_qemu_st_i64(tmp, addr, index, opc);
-- 
2.25.1


