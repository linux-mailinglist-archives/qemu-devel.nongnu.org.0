Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A0E63FFFC
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 06:52:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ymm-0002iu-6u; Fri, 02 Dec 2022 00:40:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymi-0002i1-UT
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:29 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0yme-0003O3-05
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:28 -0500
Received: by mail-pf1-x42d.google.com with SMTP id 124so4008028pfy.0
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 21:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=y8WEsTTyeGQR6dZ2OaXpTAI/FZ+2tdaCITo/e1JRHd4=;
 b=cDEzc/fXKMhZoNbg0A+LnBBC3ht43Ale0DD/5KAxv8nPadpFEc+CaHlswOWG5aJIaN
 KF6zlugJglbE0cdcvH45Z6f/avFMX03VukKjDX4Fm0veljvI2Ow/VlOV0CRMIcz8pp06
 bSVCk9snJMBO3kbJaWxqBXuIYlRn6I6vivuU1oIWXkXuhXCxp7I4+oZMJV82qNrKPXzh
 08P4fDhqx98u40XWluiM7SN46c6uDcXHUY0Z/WtPJw60sbmdfQsP8nFx6fRXIyUJbz8n
 sjS2/UScNMi9u9PkU7KKPnNJ9WmeQtYn1ttO1VUQBwoxljueCdjzESVmaZ1A/ji9CnAL
 OeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y8WEsTTyeGQR6dZ2OaXpTAI/FZ+2tdaCITo/e1JRHd4=;
 b=flawSaQhP1mX6vJGlIVtcsouWxrKtI/WbWABkTdwTm7r8gaSRAfO5MxldO4uA/INhR
 d7s9+mTFuN5n5/MDJn3aCXPCZWnxApj+nqKMK88G9fUtCSEOBmwDd3qZ3byeAmPcU4+r
 2PqrpixQPxeD8ii2n+woMq7JaaG90XaDhbAyioiSHRxA8m3wqg5NIwduKFbqpPFbhJSo
 5G+yl8LfDNaJXdLlNiwvY7nJbyCqzqYDTkqtOswIA5RE5YPIgQiqB2DdMtBZwe8u5M4z
 XdoNqEX2wqVqKAVPu1/YoMQu8bGVKcOnlbXBsvE1Q5j00gQ9q1Z5bkWqASfuP00rG07C
 GdYA==
X-Gm-Message-State: ANoB5pmQJrM6IrBlFTTfoJmzm1fXJAO6GDWyZmoTQj96t2UQNE2elNtB
 NsYHucmvEPhc6rON26xzcMJ/t24HgnT/r09F
X-Google-Smtp-Source: AA0mqf7CBfoIaK2NzU8oDtkXOFMc7O4c5gDZ7oJLpjUkiGuaO6C3eByeycvHeAFRycYIvKzpBGqUSQ==
X-Received: by 2002:a63:5a48:0:b0:45f:88b2:1766 with SMTP id
 k8-20020a635a48000000b0045f88b21766mr43762837pgm.357.1669959622754; 
 Thu, 01 Dec 2022 21:40:22 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b00186f0f59c85sm4637075plh.235.2022.12.01.21.40.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 21:40:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 23/34] accel/tcg/plugin: Don't search for the function
 pointer index
Date: Thu,  1 Dec 2022 21:39:47 -0800
Message-Id: <20221202053958.223890-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202053958.223890-1-richard.henderson@linaro.org>
References: <20221202053958.223890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

The function pointer is immediately after the output and input
operands; no need to search.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/plugin-gen.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 80dff68934..9e359c006a 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -381,32 +381,25 @@ static TCGOp *copy_st_ptr(TCGOp **begin_op, TCGOp *op)
 static TCGOp *copy_call(TCGOp **begin_op, TCGOp *op, void *empty_func,
                         void *func, int *cb_idx)
 {
+    TCGOp *old_op;
+    int func_idx;
+
     /* copy all ops until the call */
     do {
         op = copy_op_nocheck(begin_op, op);
     } while (op->opc != INDEX_op_call);
 
     /* fill in the op call */
-    op->param1 = (*begin_op)->param1;
-    op->param2 = (*begin_op)->param2;
+    old_op = *begin_op;
+    TCGOP_CALLI(op) = TCGOP_CALLI(old_op);
+    TCGOP_CALLO(op) = TCGOP_CALLO(old_op);
     tcg_debug_assert(op->life == 0);
-    if (*cb_idx == -1) {
-        int i;
 
-        /*
-         * Instead of working out the position of the callback in args[], just
-         * look for @empty_func, since it should be a unique pointer.
-         */
-        for (i = 0; i < MAX_OPC_PARAM_ARGS; i++) {
-            if ((uintptr_t)(*begin_op)->args[i] == (uintptr_t)empty_func) {
-                *cb_idx = i;
-                break;
-            }
-        }
-        tcg_debug_assert(i < MAX_OPC_PARAM_ARGS);
-    }
-    op->args[*cb_idx] = (uintptr_t)func;
-    op->args[*cb_idx + 1] = (*begin_op)->args[*cb_idx + 1];
+    func_idx = TCGOP_CALLO(op) + TCGOP_CALLI(op);
+    *cb_idx = func_idx;
+
+    op->args[func_idx] = (uintptr_t)func;
+    op->args[func_idx + 1] = old_op->args[func_idx + 1];
 
     return op;
 }
-- 
2.34.1


