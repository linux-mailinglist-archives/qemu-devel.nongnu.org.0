Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5170E5F6006
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 06:22:41 +0200 (CEST)
Received: from localhost ([::1]:55730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogIPA-0001Lc-DF
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 00:22:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoX-0004Mc-60
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:52 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:55877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoS-0003ye-Ju
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:47 -0400
Received: by mail-pj1-x1035.google.com with SMTP id gf8so645623pjb.5
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=4KnyaNg03Q9A36I/gIWbI9OfpLPWp7gded3zO91Ecgk=;
 b=su22LA51LAlBZ5rh4bVZjIyaL67icvgoHbS7AEqJ23xaJ76MnQXcKvtFTQlmleSUn8
 7DoM5S7O6FwYytB6BGao0+MhHOXpRRYXokGPIa1CNJMIUPdwHWv3ley/1avDYdeBrrme
 DMGEDVVVRVuAMeKvVSCOktnSaGC/+HKf5jWm7FMeIpegj8jE8KYx/Q6p/Ayy4PJo6PdQ
 K41jaAXEbR4N3IiUzI9nuuBH4yajBV2pstGqJIJxK3m8U7TUiDDHV/RBW/rrFkoobcOU
 zxyPklqhH3XDi5HPGS0By1RQnMla8x5Yytr7dOOj8326cs6J1cFZNRCVFxBKzJULYcH8
 ABsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=4KnyaNg03Q9A36I/gIWbI9OfpLPWp7gded3zO91Ecgk=;
 b=fN0de8pH67GVZ5z3BQgI0LEV1vBMyA3gqWEnJo50U98x7G2z/OfcesE14GHNAwUJYd
 dZRhtY4YdVWaPOtlNNyzDE1M1LVglSK+1/SqoGCzqjCLIbYHB2u8bHmYho/X/WKSLCTL
 CiwHVa4rXspDEAn4MlFv2GYyUuUFINWjsE6DNVuv5S2GAJlt5BjYolC+JE98J4zTJMl3
 yipUvQ/JQ4INMgdubPFXMPw2BPv+8kAJ0h8F1Fj/OZEwpQNXryqp4dDgYNKypVjVsWhp
 BEJPaJA8bHAb8WYbtjKm7XwsWlpjR5lqot+tncFqk4lhg+9xJ6EC13ut5MJIY+E0lcVT
 HA7w==
X-Gm-Message-State: ACrzQf3FJz3c4kJZq2ZnYwCrQfrwdtYz0dMxs6a5S0WQmNVQkepddPcx
 piqQeocp0vn5APtPQDvMsTkLlk0XNLfAKA==
X-Google-Smtp-Source: AMsMyM6ia+x9XZfIzkYgbIIaPJRtsctywaaix+j2/8jUofVr0t97f0Z88dxa9mDs2rC/4vzpgF0SBA==
X-Received: by 2002:a17:90b:3e8b:b0:202:c85d:8ffa with SMTP id
 rj11-20020a17090b3e8b00b00202c85d8ffamr8549769pjb.155.1665027883177; 
 Wed, 05 Oct 2022 20:44:43 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a17090ad0c600b00205f4f7a3b3sm1905086pjw.21.2022.10.05.20.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:44:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH 21/26] target/s390x: Remove PER check from use_goto_tb
Date: Wed,  5 Oct 2022 20:44:16 -0700
Message-Id: <20221006034421.1179141-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006034421.1179141-1-richard.henderson@linaro.org>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While it is common for the PC update to happen in the
shadow of a goto_tb, it is not required to be there.
By moving it before the goto_tb, we can also place the
call to helper_per_branch there, and then afterward
chain to the next tb.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index a2315ac73e..e6c7c2a6ae 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -654,9 +654,6 @@ static void gen_op_calc_cc(DisasContext *s)
 
 static bool use_goto_tb(DisasContext *s, uint64_t dest)
 {
-    if (per_enabled(s)) {
-        return false;
-    }
     return translator_use_goto_tb(&s->base, dest);
 }
 
@@ -1157,15 +1154,16 @@ static DisasJumpType help_goto_direct(DisasContext *s, int64_t disp)
         per_branch_disp(s, disp);
         return DISAS_NEXT;
     }
+
+    update_psw_addr_disp(s, disp);
+    per_branch_dest(s, psw_addr);
+
     if (use_goto_tb(s, s->base.pc_next + disp)) {
         update_cc_op(s);
         tcg_gen_goto_tb(0);
-        update_psw_addr_disp(s, disp);
         tcg_gen_exit_tb(s->base.tb, 0);
         return DISAS_NORETURN;
     } else {
-        update_psw_addr_disp(s, disp);
-        per_branch_dest(s, psw_addr);
         return DISAS_PC_UPDATED;
     }
 }
-- 
2.34.1


