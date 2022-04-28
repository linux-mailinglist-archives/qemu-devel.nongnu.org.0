Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9415137DF
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:12:12 +0200 (CEST)
Received: from localhost ([::1]:55498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5oR-0005fk-Ta
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Ji-0005O3-Js
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:26 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Jg-0006Ia-5i
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:25 -0400
Received: by mail-wr1-x431.google.com with SMTP id t6so7100873wra.4
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lw22yLpKBp23Dxk60BPYeO1neuJgKvW+94z5AEn/+zk=;
 b=juPZf3WwbKd6fXZWJ5nAF78o9e7w0yfGHqdVX5XTLQTGzrGT6aHuCIADCpob/XB/ck
 WU0GiyUqJyKvhv62z78jdGCJMrem4cNX5a0BJzt0SLqgTu2XqDwTHcBa+SUTFyZ2kmFd
 81DPN82sv8I2S87w3UOu2AO5ct6Vr9JU6zbSmRgjvMicGB3yXhiLyKINkluTdlngnafv
 E7TbeNEyi28lT2ZlrDTvL0uGdBXGQOmyfzDo3r9Ov5e6y62SY/VJDlTpXhxSSCXV3/rJ
 EZ4q1qJrkp8dPdXoOsP7EHuf0qOinBsJk+ohynSW7acB7C2AtPj3ZO/gWsL8Xut3wbnJ
 erHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lw22yLpKBp23Dxk60BPYeO1neuJgKvW+94z5AEn/+zk=;
 b=7m7A+GnvlmggjzuP+N3wqp7HyowIc/9iL0MniRidfXrKgVXA7lLemIfJ54MbeAf3gP
 qRxk6RJ+Imgm3PBQOL87QsAkLNPfwPT9pRp4yaLi0+aR1CLKTZP1TWA/T1GZmBXh9QX4
 DaXjHGI+Ehw4L7iPyT5XheBu1XA8KuOrIZ82WnUy4w5qrkunmiK5mY9txy6tCHOc0yeS
 1UHbRBG4hudlY0Pee+e53nAbmw9r+t95ZKxDYfsSUCiXfmAFCjYwmM/2EIbSWc15aWRr
 vc1hdL0ntRqLDTxkXtIdUbWFKHl9HGloI5NWy5Xq9TZs2d+kCSXtjx4OdZ/T6GHE9j+p
 dvbQ==
X-Gm-Message-State: AOAM530dSSEFXUqE33gq+LTLjdYO/NZOfGqlld/j78wEKyQZ1d5T6ROK
 12aVhQ60+8XGbCGma5tOqX+IF0xrtpa90w==
X-Google-Smtp-Source: ABdhPJw2CAaUy2Buzomn4dnUM8B/eBc2yt9Yzz62ovX9gSOtZ7z2NEGRVXmUHAsHho2ewgVjtUbOIw==
X-Received: by 2002:adf:fe84:0:b0:20a:dc0b:4f2d with SMTP id
 l4-20020adffe84000000b0020adc0b4f2dmr16712221wrr.229.1651156822810; 
 Thu, 28 Apr 2022 07:40:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/54] target/arm: Use tcg_constant in balance of
 translate-a64.c
Date: Thu, 28 Apr 2022 15:39:25 +0100
Message-Id: <20220428143958.2451229-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

Finish conversion of the file to tcg_constant_*.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220426163043.100432-22-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 1c2ffe37d93..a869d573098 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -13894,7 +13894,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
         }
 
         if (is_scalar) {
-            tcg_res[1] = tcg_const_i64(0);
+            tcg_res[1] = tcg_constant_i64(0);
         }
 
         for (pass = 0; pass < 2; pass++) {
@@ -14298,7 +14298,7 @@ static void disas_crypto_four_reg(DisasContext *s, uint32_t insn)
         tcg_op2 = tcg_temp_new_i32();
         tcg_op3 = tcg_temp_new_i32();
         tcg_res = tcg_temp_new_i32();
-        tcg_zero = tcg_const_i32(0);
+        tcg_zero = tcg_constant_i32(0);
 
         read_vec_element_i32(s, tcg_op1, rn, 3, MO_32);
         read_vec_element_i32(s, tcg_op2, rm, 3, MO_32);
@@ -14318,7 +14318,6 @@ static void disas_crypto_four_reg(DisasContext *s, uint32_t insn)
         tcg_temp_free_i32(tcg_op2);
         tcg_temp_free_i32(tcg_op3);
         tcg_temp_free_i32(tcg_res);
-        tcg_temp_free_i32(tcg_zero);
     }
 }
 
@@ -14826,22 +14825,19 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             gen_helper_yield(cpu_env);
             break;
         case DISAS_WFI:
-        {
-            /* This is a special case because we don't want to just halt the CPU
-             * if trying to debug across a WFI.
+            /*
+             * This is a special case because we don't want to just halt
+             * the CPU if trying to debug across a WFI.
              */
-            TCGv_i32 tmp = tcg_const_i32(4);
-
             gen_a64_set_pc_im(dc->base.pc_next);
-            gen_helper_wfi(cpu_env, tmp);
-            tcg_temp_free_i32(tmp);
-            /* The helper doesn't necessarily throw an exception, but we
+            gen_helper_wfi(cpu_env, tcg_constant_i32(4));
+            /*
+             * The helper doesn't necessarily throw an exception, but we
              * must go back to the main loop to check for interrupts anyway.
              */
             tcg_gen_exit_tb(NULL, 0);
             break;
         }
-        }
     }
 }
 
-- 
2.25.1


