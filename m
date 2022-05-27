Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10864536651
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 19:05:14 +0200 (CEST)
Received: from localhost ([::1]:44514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nudOi-0000JT-Pf
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 13:05:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nud8O-0001Wz-Ks
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:48:20 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:43840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nud8N-0005Ow-37
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:48:20 -0400
Received: by mail-pf1-x42d.google.com with SMTP id y189so4764241pfy.10
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 09:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CpiwNuN9uaF8J7CUE8swrx6xThfojHeB858pnr3+AiA=;
 b=rF8uUKHFA/lwUj7qslXyRn0RJYth79NoaRGgpwwhDKdk4hhVDBPgesoN/f8peVeQat
 qx92CuaejyNgD7xS8X4sWR7WL4UJv6hlEjXWPN9dxQKCFPVUYF42oYXU9+onBcL0lKbC
 StYPZQ8M8k7XHMesKsSk4XoWTVwYH26g7h3AkXGEREM/AvBclw60rCrvioy6lHy0M9N2
 b8P4ZANC8hQA+96xvl9KNuANr4l6RQhxkHxn1wH0mO7Yes+KxECCwa88EisoPhG+oZh9
 QFoqZ/ZryVT1xnSGrprQQljyJ95z/3XCiXSEJl85KhBk2d8W74DfE3Gxrya2j3QiISDF
 j80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CpiwNuN9uaF8J7CUE8swrx6xThfojHeB858pnr3+AiA=;
 b=Bv7mxG37mxWmHZjipgx/5Xnn/EPCXLAN9QTPCohdNPyEhpSwe/HSy9uwtkvyokHHwC
 3R7Nt2WG7SvAr/AcD4wXiYWDqUC9OchQifLs1iQvCRmF+LnpGHo0TjHMnlAlcRUJVbEB
 EkPtfq51bo1xxymGqKIF3gx/mFZDx3JQG02y3tex8Lhv+kWoteQauVyx2vbRLLLunpEE
 cYrbViYy9MQDYwKjNOHqKm5UTQQnMr6+UTN4dPLwTsjcWSDaAjZ4IWP03Hk4qxrJFDuu
 TJXi6136NGlEfYOjod6UmotHK5WJcKXzxU8ozixl7c5KzUcws24XzWCTDkAKY2DAki20
 ZoyA==
X-Gm-Message-State: AOAM5309BSe9gTnGprMwS2cyn1RUADKKXF+kOl98F3MyL2/G0pUFHAPU
 xU9UYnPVfXutqdpXMQMCd4r9DJjQmH5weA==
X-Google-Smtp-Source: ABdhPJzvPV8I/ZZRi2rGns9v8sWsmI+5jSomss5b3co6MYlAednFOSuv+vhapBbKp68oZ9tpcMUx0A==
X-Received: by 2002:a63:91ca:0:b0:3fa:e255:5beb with SMTP id
 l193-20020a6391ca000000b003fae2555bebmr11378454pge.70.1653670097786; 
 Fri, 27 May 2022 09:48:17 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 j11-20020aa7928b000000b0050dc7628133sm3861420pfa.13.2022.05.27.09.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 09:48:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v5 09/17] target/m68k: Fix stack frame for EXCP_ILLEGAL
Date: Fri, 27 May 2022 09:47:59 -0700
Message-Id: <20220527164807.135038-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527164807.135038-1-richard.henderson@linaro.org>
References: <20220527164807.135038-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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


