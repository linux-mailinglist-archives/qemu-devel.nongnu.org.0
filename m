Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7813C178D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:58:15 +0200 (CEST)
Received: from localhost ([::1]:54326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XLq-0005em-61
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:58:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5C-0001WN-5a
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:02 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:35550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X54-0008AY-Vi
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:01 -0400
Received: by mail-pf1-x434.google.com with SMTP id d12so5974279pfj.2
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UtQMxk5KkpHW1Lqe7n4zGp+8V8xKH7OiQm+b/05+KCc=;
 b=XkHDJ2fpzTG+VU3SP4IIyDo1dXpRf50kJiR6IwKn1RVO0ZB87RNuMxJyPIzI4PwrXs
 6Y5fC5buYHNsaqzUKFDxaErmyTjSmuOfGl4zdY6cniToz8/8cXmeGMpAp22GM9cgrji2
 i32RFdfHRljVMGOIN62m8QWq5rRAYi1z0nBlpcJ6rFQRSSGOHeM8il9WuOAPlhZfc4QG
 KHZc5cW452L7dQw5QhwG2Y3QW5femDlcoQ5XlVaCYCEdqdXDP3f6MjkCUSUmmtyGa8/d
 E1FnbRj4M1//QmLnhnkOKu9GEGcG/I1nxir91kDTxU2orhj8Xr9KMwdRrkNiZpDKcy4p
 QvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UtQMxk5KkpHW1Lqe7n4zGp+8V8xKH7OiQm+b/05+KCc=;
 b=dqfuqMPYEAlhCwGzHMdzc0St/6Fk3V9DeOkQyt02Ps7KmDsfTyuqYLhsGJTxp+N5fK
 P3C/khSL4w3RJH5wxt31Pbk6/GGM/qzKRSkdlyA1pXVONI6YFpTMuR/ZTItvgtK2Bpba
 3wVmWSrLMxUt387vYvW/i1mtSszZHiR8weY3+B0sPqRUT+Pq2AMIggkhyaIhmnIc6zzt
 q6xJpy/5g3wkCfmrrmIzZQuuNb0oug+b3nuuRE1E0nTBLpPVN8mmDoxpSB9vp92yRR4t
 dWx70gfWSpM3HfJx7A6YMwQmr/VTbblg0Ul7n2bpxYBXc5HVqUQi6Q/DIChiRsLhwFIa
 YQOg==
X-Gm-Message-State: AOAM531/5jtNqyy3VGQBeV8pUaiSu6wsgOeLgKk9ocb1qRsvz0Qowsox
 74dGJPjLh0vSHFRY+XC45ETbpMAOe8FHHw==
X-Google-Smtp-Source: ABdhPJzm74F11i17HavxjQcsT1PRABxnYmhQJNErrK5lLyZZyHC3vEI/1trfJmciL7YWb618xf5/Lw==
X-Received: by 2002:a63:ee11:: with SMTP id e17mr32902327pgi.323.1625762453641; 
 Thu, 08 Jul 2021 09:40:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j129sm3465678pfb.132.2021.07.08.09.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 09:40:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/28] target/arm: Use DISAS_TOO_MANY for ISB and SB
Date: Thu,  8 Jul 2021 09:40:27 -0700
Message-Id: <20210708164050.711967-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708164050.711967-1-richard.henderson@linaro.org>
References: <20210708164050.711967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using gen_goto_tb directly misses the single-step check.
Let the branch or debug exception be emitted by arm_tr_tb_stop.

Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 28e478927d..293917be4f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8905,7 +8905,7 @@ static bool trans_ISB(DisasContext *s, arg_ISB *a)
      * self-modifying code correctly and also to take
      * any pending interrupts immediately.
      */
-    gen_goto_tb(s, 0, s->base.pc_next);
+    s->base.is_jmp = DISAS_TOO_MANY;
     return true;
 }
 
@@ -8919,7 +8919,7 @@ static bool trans_SB(DisasContext *s, arg_SB *a)
      * for TCG; MB and end the TB instead.
      */
     tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
-    gen_goto_tb(s, 0, s->base.pc_next);
+    s->base.is_jmp = DISAS_TOO_MANY;
     return true;
 }
 
-- 
2.25.1


