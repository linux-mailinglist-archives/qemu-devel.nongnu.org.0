Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3EB53B156
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 03:48:44 +0200 (CEST)
Received: from localhost ([::1]:43326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwZx5-0001Te-QH
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 21:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZj7-0002Wt-NU
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:34:17 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:43967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZj6-0005G5-4X
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:34:17 -0400
Received: by mail-pf1-x434.google.com with SMTP id y189so3447526pfy.10
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 18:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CpiwNuN9uaF8J7CUE8swrx6xThfojHeB858pnr3+AiA=;
 b=sHsVAgCRwajM3ZFKTsSm/NiFM3eWVtD0Wq/y0eWUP2TDHz8likNPKekX7321z1muMM
 b6VtFxfcbJGxKHBOF2Bc3m1PuWpBTqUCqXrfyGRZmPEbr1qBebbCvST3OxM9fddgJum7
 jOKGcRhSAh4UXtWVp6WYUsFphy9XzBmqHPWo2CN7wELZFe1Z5z+B4iWWi9N0t+LsHXnv
 6pgMR43HMNy88fnVwQP+xHXr2WFJgwqLfPlpyvu5akMxDO9uvOpPvfunqkrbMO1K9c75
 LW2OCAu4lonUbCQYEaFtzO2YDmIYVYnSIZDLP60e+uO8ikwT2LxwtSAsukeNO90RqdEl
 Fgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CpiwNuN9uaF8J7CUE8swrx6xThfojHeB858pnr3+AiA=;
 b=hFjGvtz1gRXkMqIhcue/GN3/RAOmp6DVzIjCNSWVretS0icrPNULdYa3WTR7FgqaJr
 YGy2gbRHhMWRkI3Pob/01Gwgjiv2P19QedlJuHII2hylVJLw0V6//OAVQq5gECrmNh7D
 2e+UoSOWEScQ7qjZpR4XZ2IoFKaFsQl2AsNHt2rN53fNyBgcIANPzYJX9xL49PSVcS5p
 wrTdupXiOicPW9A+MUcZolH6SbuMIel6b6Gl8M2LHp9Nh48+s9V/1AGKnk8pFlM+6NYQ
 1ndBBLR3ff5ovSZnGY7cukLhf0LlvJKXeyNz+FaLljsG/s4Tg4OJh+uCYt2+tX4JlR0U
 Ueiw==
X-Gm-Message-State: AOAM532PmPRFIffnD8QOMEldzFx9D5DiwrzmuqnAxjfyTYt22/pdSpjA
 IJ1DcvnLEvjlntJU48GJGdRvnBVXpQL3DA==
X-Google-Smtp-Source: ABdhPJyqs9gLt/SVrqSHDYvaig3/RQrN6h9DSDbR58TWoG7db/LTwaYPNu/53oqi0fydG5GnW5fHTw==
X-Received: by 2002:a65:63d9:0:b0:374:6b38:c6b3 with SMTP id
 n25-20020a6563d9000000b003746b38c6b3mr1951822pgv.195.1654133654775; 
 Wed, 01 Jun 2022 18:34:14 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:1eca:8ee3:9269:e00c])
 by smtp.gmail.com with ESMTPSA id
 l191-20020a6391c8000000b003fc5b1db26fsm1962875pge.52.2022.06.01.18.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 18:34:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v6 09/17] target/m68k: Fix stack frame for EXCP_ILLEGAL
Date: Wed,  1 Jun 2022 18:33:53 -0700
Message-Id: <20220602013401.303699-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602013401.303699-1-richard.henderson@linaro.org>
References: <20220602013401.303699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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

According to the M68040 Users Manual, section 8.4.1, Four word
stack frame (format 0), includes Illegal Instruction.  Use the
correct frame format, which does not use the ADDR argument.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/op_helper.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 3cb71c9140..aa62158eb9 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -391,11 +391,14 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
         }
         break;
 
+    case EXCP_ILLEGAL:
+        do_stack_frame(env, &sp, 0, oldsr, 0, env->pc);
+        break;
+
     case EXCP_ADDRESS:
         do_stack_frame(env, &sp, 2, oldsr, 0, env->pc);
         break;
 
-    case EXCP_ILLEGAL:
     case EXCP_TRAPCC:
         /* FIXME: addr is not only env->pc */
         do_stack_frame(env, &sp, 2, oldsr, env->pc, env->pc);
-- 
2.34.1


