Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8D5312938
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:14:50 +0100 (CET)
Received: from localhost ([::1]:57738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8x0j-0005zr-OT
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:14:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSP-0002ON-6J
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:21 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:40859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSN-00066f-FU
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:20 -0500
Received: by mail-pl1-x631.google.com with SMTP id y10so7020166plk.7
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=06Y+cyMxl+dC1AQMaIsueXy7S/PiohsOvXqBqGkx3uw=;
 b=rXxC+wdq/sBJHlDndYVHNKoZkRxYVRDWJJ7FUhJiMWjXvg74TxD3BeIVSqZYMI4Qet
 ujRlU/7L+ErrbIZNE0vMWGPZG3nyevzDo3L0u0+0K1ohTJUMtlRjL772D/YTH/Sini7J
 JXj1mZ9b6Sh3uPyUE2KgSNUFfGUW3LMkDTw9lM/cHgxl5ipINx9IfdFlQMQd0W8bGEK5
 Z++tb4ixlarIu//tY83k0nnGxS3zjzD3dPjaV29OtHHXgQyqHt8sYctvui1BQdTJwbUD
 MwuHeawJ27Xb2+sR4Hf7D72zuV8738bljUTnIb8vCVB55GVB/WJtQqd+rwEiXlFPEu1V
 anqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=06Y+cyMxl+dC1AQMaIsueXy7S/PiohsOvXqBqGkx3uw=;
 b=VxD9OrhQieXfXiBSX3/KxOqllhepSf5hs55SiPax9xggK8Ej6UrqNYptsQs2Y+ZDXi
 OTQMUGZH4uKfF7UjawGDZzkVOibn1ptggRyhicujM1WA+R4uSZI4FFhJZ/swDqKtvmPd
 b/G05O7KsWmUXIggGwSqwcIkcxzYNVbS53qohn7tDsZdJW7QFl5TXqQnJKhVwywAdJic
 OhtdPn4hPgMrJbQBcOAgyMlTS6SIFYILtf+Ni29LKLQDcVyCH7tvJGHIyObHJ3oXaoIK
 SKgTsrb2JE+eBi2p4D9W6Qi0qXPtx+O03zr3Q+JvaZtUNR1PPtAS0SWviJuCbZSjHs8G
 TygA==
X-Gm-Message-State: AOAM530waDDSjNgbz9s+sCp4sQT8WxvFOb93BBJU8Bv1C6pNmjVNxSVm
 kpKRGO7TTxFxDmPhhzytBcHFBL2AHYJ8xw==
X-Google-Smtp-Source: ABdhPJzSYP0LAe4dC4SX1YqXqESDZ5kQIeMp7BiG1R6Nk0bJNF4GXD9YVAAP0AW8HBafVhUfywxCdg==
X-Received: by 2002:a17:90a:e508:: with SMTP id
 t8mr859949pjy.106.1612751958158; 
 Sun, 07 Feb 2021 18:39:18 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id 74sm650954pfw.53.2021.02.07.18.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:39:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 44/70] tcg/tci: Split out tcg_out_op_p
Date: Sun,  7 Feb 2021 18:37:26 -0800
Message-Id: <20210208023752.270606-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 1e3f2c4049..cb0cbbb8da 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -293,6 +293,16 @@ static void tcg_out_op_l(TCGContext *s, TCGOpcode op, TCGLabel *l0)
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_p(TCGContext *s, TCGOpcode op, void *p0)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_i(s, (uintptr_t)p0);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rrs(TCGContext *s, TCGOpcode op,
                            TCGReg r0, TCGReg r1, intptr_t i2)
 {
@@ -403,17 +413,13 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
 
     switch (opc) {
     case INDEX_op_exit_tb:
-        tcg_out_op_t(s, opc);
-        tcg_out_i(s, args[0]);
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_p(s, opc, (void *)args[0]);
         break;
 
     case INDEX_op_goto_tb:
         tcg_debug_assert(s->tb_jmp_insn_offset == 0);
         /* indirect jump method. */
-        tcg_out_op_t(s, opc);
-        tcg_out_i(s, (uintptr_t)(s->tb_jmp_target_addr + args[0]));
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_p(s, opc, s->tb_jmp_target_addr + args[0]);
         set_jmp_reset_offset(s, args[0]);
         break;
 
-- 
2.25.1


