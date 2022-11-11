Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 870FA62549D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 08:50:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOfp-0006Xh-NX; Fri, 11 Nov 2022 02:42:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfm-0006PW-Br
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:58 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfj-0007q4-IN
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:58 -0500
Received: by mail-pl1-x632.google.com with SMTP id y4so3644020plb.2
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=y8WEsTTyeGQR6dZ2OaXpTAI/FZ+2tdaCITo/e1JRHd4=;
 b=jiHVK5gVUs5ScMiO5cnvRwM3PLSds5+MY+21m9e7V5IWtOZyf+UuOlj55Wb2YdojK+
 GZ3twK1duIBxQJLv8ITaKZmdSIqDAVwPliFA3WBXTjcrJqGcIrCzX+t0x433Wb6VoisH
 t3hjFRlo+DrY7T5NFufnmZ4y45acgODdPJigxbtqKRQTsURvdkB2PzLTW/Yxv9KvHEhW
 Y6ObvBBn8VZvbKSCB/DPSkkDc5kqaOgCTsuVEj1jKUwMPsEFk8XNKKdEsDU3YgUuK/HD
 q1MH0nQkcU31XDK1DRqAnQr/Kj9HMvGrfjxBOGyWNO6YZiWyIPv7Uc9skH2r0B2kQkQN
 jzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y8WEsTTyeGQR6dZ2OaXpTAI/FZ+2tdaCITo/e1JRHd4=;
 b=JBtVt3+UR5xjEh2Nw5jdpNu7rxiR7KQjexmWJjQDty2uDxLyaG9vqySU6HiCkA/0kA
 pjI/jBudiKYuWaD3dm64KYtwOIlZZBCNcontcwBWwKFM/OSijRoHBaJb0vZQb4VEpbr8
 xxL3022N9IWwdRmSjbUA+J9HNo/3D3u77Ofl750QtSjdbrF7Km/q79iPMARWi7kFtDrU
 2P416FKZe7KMkmtil8FBJyO1Cl0JoJr9utnX6nrJrzqGSf5IARymS5c0tx5uVfDcdxNi
 KYn4g9446GmI44tYh8ZQNoikjH9pY8Yw5UmFmcm+sQPRG1czkDy4UODD6DwR7+q1WXLI
 0M7w==
X-Gm-Message-State: ANoB5pmjElxvy1jxtnaGd5iAXnlnYGyLQi/KfJ+jr4ENUlXVHlf2Wdh+
 hiBtG2LCUuw//86+0Z16Wqfja0xLSSTJWPm5
X-Google-Smtp-Source: AA0mqf5UmOdOSBJA27anj0QGDrUcWr9/yuJBk/LPs/hYNRsBkMy/nYGqvw1kH/AB7E3hK/bYWS3zDA==
X-Received: by 2002:a17:902:7b96:b0:188:53bd:878a with SMTP id
 w22-20020a1709027b9600b0018853bd878amr1493597pll.12.1668152512863; 
 Thu, 10 Nov 2022 23:41:52 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001754fa42065sm976069plg.143.2022.11.10.23.41.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 23:41:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 v3 19/45] accel/tcg/plugin: Don't search for the
 function pointer index
Date: Fri, 11 Nov 2022 17:40:35 +1000
Message-Id: <20221111074101.2069454-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111074101.2069454-1-richard.henderson@linaro.org>
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
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


