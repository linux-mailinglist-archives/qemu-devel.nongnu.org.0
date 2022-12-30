Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7410659384
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:04:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2sR-0003uu-5J; Thu, 29 Dec 2022 19:03:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rW-00039G-Vr
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:03:05 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rQ-0002fT-7H
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:03:00 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 i12-20020a17090a4b8c00b0022632104a6eso2926867pjh.1
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qmknChCT1BuzZEHCmViTBYnc57/Tlc2QwxNuPPER9qk=;
 b=eLO5hR9SBeXisYZtsyBZe7aR9QD2YLfKd1/NGEEMiE8XpCKaA6MhrT+23oO7Or/3GW
 sB7otR+RNpPefXpqOfy6f6mKMNBmNN0X0F8jEqqqYvS19bC7x61RBGsGo9nFaUyZ3ako
 KFa5c/V60jViEPS8rQI5OPFzLk7EzkIuhhaTE6WELiK744hI9yE8GVeVKKURS3cmNbc0
 Hj70j6OLZKKGuE3bQXQTKix1A1XCyNKrMFr+gjrYEzQfr/+JTaX+PtZvN8ESq1/kkjRt
 urVqTzPII68dJjZpPY2B3BceyFrDIzTkXKwRPM9Sm89liE7zjiJFthOfJjTC3DP/Uv5E
 gzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qmknChCT1BuzZEHCmViTBYnc57/Tlc2QwxNuPPER9qk=;
 b=pL+Aw9d/3DvEF+POONjOZighqrpBBWkcy7VH/kRDu0LD17uMlDldiOpUMnCX8Bmw/4
 6CCnPZmWGHsNQ7LBAU3EOkaQrhcKi3gd/kJye+vcvNqZvMilh+iaEtxF96sMWNW4bg3+
 qASxWlXeAocbF7inCa0pl1EqpZafxvdq3fdb6uiF+ivZomrWWuVjPedYoJ5nGNybeEVC
 TPVf3psYJL9RIFHDM22jWuvFjBy3n+g6iKL1nyhcbhSPp1kHK2xLTCOa3wGHBMoNH8mm
 a3/PP/OvakZnisfsa3h/kIOJ5R1mrmXDgguehb5SsAuZjl9TODzBNTGHFemUx+FeuQxS
 Qv+w==
X-Gm-Message-State: AFqh2kqn+yixnkppVkqygJdNBbQxxu5GxvZU46kVqRnG2s36yZjf0XHY
 kAw+I2ziK3oppOOW17Oz2WNTZOvL821QycyN
X-Google-Smtp-Source: AMrXdXvyTeq2WUdXt4p2e3zYX9Vpo3DU8E6yRWbXULBuxu4OqUp4M5hqyWgPAKvKQ0WkX79uTjBheQ==
X-Received: by 2002:a17:902:848d:b0:189:76ef:a1b9 with SMTP id
 c13-20020a170902848d00b0018976efa1b9mr29280273plo.5.1672358572241; 
 Thu, 29 Dec 2022 16:02:52 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170903028e00b00192849e1d0asm7343953plr.116.2022.12.29.16.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:02:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 32/47] accel/tcg/plugin: Don't search for the function pointer
 index
Date: Thu, 29 Dec 2022 16:02:06 -0800
Message-Id: <20221230000221.2764875-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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


