Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 752CA64BE77
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:33:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Cmx-0000h8-EZ; Tue, 13 Dec 2022 16:26:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cmu-0000g1-2V
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:26:08 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cmo-0003GD-3q
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:26:06 -0500
Received: by mail-oi1-x234.google.com with SMTP id e205so1017016oif.11
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 13:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CGY8Ocb88UTBGvcjSvAAW2LYpXpJS1Nv/WKvbXwBWeI=;
 b=OZA4qz5waQctmW1fgO35pijZNJoRZWj127B4MreWmWuTMkG73aBxYQ+mhI+3NbJ45r
 3LyDFXipIpZ0FWPezqMUuHu+BAnuPH+QR0VpKKG972C6ztMdK6TD0AgXavirX+mlwJVW
 H7XSg5Pe7nfoAUNqstSyJxNa5gVsKP0eOLSMi5Md0Jx80ZEc6m6V//+LSBjTCfQ+HZNq
 TRLr5/8CoQedGPnIo/0YZ0sDByTNo/vT6rpgwXejp5U+XhLqXFQ4vrhDB1S9p+Iz1edD
 64oJvv+P/w1EeUpAYHm3hVlOi8hW1YBzYF5V8AhaX7vx6kAIqDwRe4Z/okM861xM8pOG
 ez0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CGY8Ocb88UTBGvcjSvAAW2LYpXpJS1Nv/WKvbXwBWeI=;
 b=ESzfaLnleJHyKJr5rqOqyLSEDTzP04LyFv1SCgko8d9zgUFmcSDriZJeTLUFM8XJEv
 qDsLFXBVdZXjjepvhH73Upur122hudaPUlftiazwWf+62RKqbEBBdMRxYtmO7xu4H7sh
 aizJVOfs4ofjV/wBl13R0tAgIIUmXd69Qz3/ioaAp8MvkLmBPd99UWLS7fBR1EoqgVz6
 bVEQvP2QMyngcY7Mhpr2UQONAX/+TM6+OxmkTjGBrH4f87x1Cloid0QirnFb1weZkWQw
 Aj2zicYwSG7asNNJ6qHjb7S1WwfSg7XZLKi7zVpFjkNaCBRNlPYYnqA3wHXru2LKEYUS
 X2OA==
X-Gm-Message-State: ANoB5pkwng03fwv90ZtU+IgRQvqRSgB4iYPep9AwDAtfkTIrYeiQoFb5
 1+IafdrSgppJA+rW4ahtRXPXGAqSI6stSLX9b60=
X-Google-Smtp-Source: AA0mqf7a2FwFkBGQ0T5J2iZf35t8wAXMIuhBzXn+wIJ8R3QqDS1aHicFSnpVV+g80suk6RRNBPbPWg==
X-Received: by 2002:a05:6808:e90:b0:359:a851:dfc1 with SMTP id
 k16-20020a0568080e9000b00359a851dfc1mr12150415oil.0.1670966761108; 
 Tue, 13 Dec 2022 13:26:01 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:c63:85ed:4256:8ad0])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a056808098700b0035c073aa0d8sm5006831oic.18.2022.12.13.13.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 13:26:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 17/27] accel/tcg/plugin: Don't search for the function
 pointer index
Date: Tue, 13 Dec 2022 15:25:31 -0600
Message-Id: <20221213212541.1820840-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213212541.1820840-1-richard.henderson@linaro.org>
References: <20221213212541.1820840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
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

The function pointer is immediately after the output and input
operands; no need to search.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Alex Bennée <alex.bennee@linaro.org>
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


