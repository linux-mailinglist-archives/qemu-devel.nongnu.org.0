Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE603C1B1E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 23:40:29 +0200 (CEST)
Received: from localhost ([::1]:48356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1bkw-00022g-Fg
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 17:40:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1bia-0008PY-SB
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 17:38:01 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:41524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1biY-0008LQ-NR
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 17:38:00 -0400
Received: by mail-pl1-x632.google.com with SMTP id z2so998335plg.8
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 14:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=asfzam4uxshAkMTtphuDnwfvWVKH3o+9edCCgJ8GjhQ=;
 b=mhOiG8XsljiOmtR8hr7vS8Mio9HzTexa/asLGDfTkCTr0VlzwYb6LwoaP9BIdBDdIA
 c9gk3aNSUdG4Tw2urYklIg2tspXW/1pwPRQojB3tbPTgX1/MDkb6/U8FOTVnG0mXDO0q
 wnhTHL7x1gEQHk7vTNRbtoYeg1hh/njae1zEjDpVZGh67Tz/m4FnEu4d8rMmOxP0qq+K
 lmzRmD+XEr9/OX52OQJEZqQIVJ4ZyEp15zddIxf6u8DeCF1E1ZwnsSlxgYI8bzjPrVkz
 Yrt9lPAMxnworgEXEdscRPXGqjYAxpM7Jqi6ZZ7nqk21fR5gaqwSC3P/9WiMXp00aVDW
 xjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=asfzam4uxshAkMTtphuDnwfvWVKH3o+9edCCgJ8GjhQ=;
 b=oYYyLabzUOw3eAcCTI6bjNXivALuvlf/LoTW55zeEQ4ad2WS7dsHbGggihKRY24b2u
 GpXgWEtkqiebIHACZye9wlqZwXWRFKB6Q2z5FrU3E6UccKHn5RA9vQ80fWwd4hpKLzVO
 DeTLtMLPLPBKyKeZ325Cbvioye3hyGiYsbK/J5P1dyxnUfiSBWqENXfRDK0gx/R9Xpsl
 QZpnwwzy8yPSJmRX0UsEISQ+lcAXJuO5ixwOoNuFLNnUEI48lMBRUFUoQWnJVZyj6b4Q
 Qu1APka2kNblv3z03c7FjkAVNjTcua78thjh5xonRJvnohxVJ5scbir84jL5DjXxE6rC
 44gA==
X-Gm-Message-State: AOAM530I4azGNjqweAg7YSY2d/mLC1kAd4qQ+KHjNz9QwcPot8gtRTUT
 MvpUKnpWu42ZG4Auy6BgV6nIC/J3lHnnHw==
X-Google-Smtp-Source: ABdhPJwz+OD3I6uyo8hE7XpXbR8/vFkQGvBx08srd6+sDVZTN4+Yk3wLS6vemvAiA8HQUTPeXDtSYQ==
X-Received: by 2002:a17:90a:ec08:: with SMTP id
 l8mr9771317pjy.68.1625780277218; 
 Thu, 08 Jul 2021 14:37:57 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id g27sm4322800pgl.19.2021.07.08.14.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 14:37:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] target/openrisc: Use tcg_constant_tl for dc->R0
Date: Thu,  8 Jul 2021 14:37:52 -0700
Message-Id: <20210708213754.830485-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708213754.830485-1-richard.henderson@linaro.org>
References: <20210708213754.830485-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: shorne@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The temp allocated for tcg_const_tl is auto-freed at branches,
but pure constants are not.  So we can remove the extra hoop
jumping in trans_l_swa.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/openrisc/translate.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index 1e437d2f9d..96df513fd3 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -733,12 +733,6 @@ static bool trans_l_swa(DisasContext *dc, arg_store *a)
     ea = tcg_temp_new();
     tcg_gen_addi_tl(ea, cpu_R(dc, a->a), a->i);
 
-    /* For TB_FLAGS_R0_0, the branch below invalidates the temporary assigned
-       to cpu_regs[0].  Since l.swa is quite often immediately followed by a
-       branch, don't bother reallocating; finish the TB using the "real" R0.
-       This also takes care of RB input across the branch.  */
-    dc->R0 = cpu_regs[0];
-
     lab_fail = gen_new_label();
     lab_done = gen_new_label();
     tcg_gen_brcond_tl(TCG_COND_NE, ea, cpu_lock_addr, lab_fail);
@@ -746,7 +740,7 @@ static bool trans_l_swa(DisasContext *dc, arg_store *a)
 
     val = tcg_temp_new();
     tcg_gen_atomic_cmpxchg_tl(val, cpu_lock_addr, cpu_lock_value,
-                              cpu_regs[a->b], dc->mem_idx, MO_TEUL);
+                              cpu_R(dc, a->b), dc->mem_idx, MO_TEUL);
     tcg_gen_setcond_tl(TCG_COND_EQ, cpu_sr_f, val, cpu_lock_value);
     tcg_temp_free(val);
 
@@ -1602,7 +1596,7 @@ static void openrisc_tr_tb_start(DisasContextBase *db, CPUState *cs)
     /* Allow the TCG optimizer to see that R0 == 0,
        when it's true, which is the common case.  */
     if (dc->tb_flags & TB_FLAGS_R0_0) {
-        dc->R0 = tcg_const_tl(0);
+        dc->R0 = tcg_constant_tl(0);
     } else {
         dc->R0 = cpu_regs[0];
     }
-- 
2.25.1


