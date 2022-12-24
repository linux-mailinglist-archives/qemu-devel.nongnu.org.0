Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24056655BE5
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 01:09:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9EP4-0002ra-5Z; Sat, 24 Dec 2022 18:58:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOp-0002QB-FH
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:56 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOn-0006Jk-Sv
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:55 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 v13-20020a17090a6b0d00b00219c3be9830so7981152pjj.4
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 15:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qmknChCT1BuzZEHCmViTBYnc57/Tlc2QwxNuPPER9qk=;
 b=RxBjxwrcpyDwBOkTD8XlAfWGDxdZYtfY/N6aLzE+tzdd6NgflXKFQofLsJv7aDWFtr
 Clxg6s31KWSzlv1uD8d5QE9sy29ebIvJ2WCrAEaSZ2fb4fSWQTGIIgHjMla/LGFt836R
 XYmTudRItEBP9bvsF3rfcz+xhtmEkayhT4FVHf+H9eLZs+k68qnkXGDkOIuXhZFZ6jLg
 YHlehvT40hsIbCEf/tkLt4Vxmk2O2oyjGxQE+lxrGzimNAF1EDmpdCeH6PnPPjausUk2
 bQfFVMkupu0taejvKhVXmI9BAM1NRrD0GLTFNgOMahcNidh10QPMNY7lIYM3AlQ9In5y
 Xy4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qmknChCT1BuzZEHCmViTBYnc57/Tlc2QwxNuPPER9qk=;
 b=lphPCan38dFk3kTTeCfdggGbe/eZzyIop3b/AtG7zinYSLzjrrgOllBeSmCDyX3TRW
 Hduf0M2CkyCArwUxDjTuro1Tjo7Bu5BVmKe6pyT6ZpQfpnGKSw+7mI1KOaBX76KPS2fc
 kljos1Ddcs1ZiNwZUsFcMKOn1AKqD8zsUm3NSx/X6+YZ9iZ8t/r2Lb2W186dFwjuWDof
 tBRN4zUVBXHWZdR8woSmdYUU+NTz8xk4YIrMpGUakroIzmVAE2T1tc6Bm+lQCKTSynL1
 ii8xk/vrvoRO7+hORLkMNXoKwqIlPC8m1mV40h4VDv5YcvAzMHKsda17T2D/TtdXY+4q
 Sg7A==
X-Gm-Message-State: AFqh2krCWd6LkSfDEaFJMZp5uR4Dct7rITeZ5qLVJOCiax1xoscC7xSC
 AsHeVOfL/s2pS7eVsNAW2Lo30UaBLRWHekTp
X-Google-Smtp-Source: AMrXdXtcLMCFP2sYjXGQ15Xa9r6g3L4dfdsLeL8PpuEelrFQDFGnKtREmlW07hD3t4vCXhfgi4MTwg==
X-Received: by 2002:a17:902:cf02:b0:191:283d:5afb with SMTP id
 i2-20020a170902cf0200b00191283d5afbmr15403615plg.50.1671926272502; 
 Sat, 24 Dec 2022 15:57:52 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 cp12-20020a170902e78c00b00187022627d7sm4599716plb.36.2022.12.24.15.57.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 15:57:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v5 32/43] accel/tcg/plugin: Don't search for the function
 pointer index
Date: Sat, 24 Dec 2022 15:57:09 -0800
Message-Id: <20221224235720.842093-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224235720.842093-1-richard.henderson@linaro.org>
References: <20221224235720.842093-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


