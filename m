Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EDB312919
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 03:55:59 +0100 (CET)
Received: from localhost ([::1]:44414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wiT-0004Hu-Tk
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 21:55:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRV-0001YD-2a
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:29 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:41409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRS-0005pb-Ft
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:24 -0500
Received: by mail-pf1-x42b.google.com with SMTP id q20so8752345pfu.8
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v4sc5nm0f4c/U5WbNEJOfl++DRfDxzP3f+V/F9gDHfw=;
 b=PiAOY4PiU2BNuaZMc0bTeLzUS+1tGo6zQ9e3oMxctkh7egbO6OY/M8rbjpF4QIptXe
 G3rmKB/T/dpefo/z9989+yqTaf4GSSm8qym70PPT2CGH/x/tS4bTHDbrEw+G0RvcooEj
 1wdirOzjvup9il/RCS4VFmu+Dkbf3Bo9y4x5++28rchxfzutriNK3q5bm3bxxuY7D5Ic
 0adpx1rUCYQ27X4JmL8Uh18CEea6xilTf5ikYrP3NKHduPgI9NZEpF9r3qLxQcVTdVJT
 rKD+YxjbeShfp8JloV0Z5z9qvClXpDKvZJvXonmevIy6Fd2uVeK3alnoMb9Jhg5sS2g+
 7Q/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v4sc5nm0f4c/U5WbNEJOfl++DRfDxzP3f+V/F9gDHfw=;
 b=ZAI5fPfAqHB345s37xV4eTq35iDAac6Ca1djzHRPcEa50ttwvAIIzYIW6b4q9sEgoh
 QY7tqXNlFMJHhnAggpM4UK3J+U41bpWOlrTQGRERpnas0Zb1RSOJbbhZbsTs7ILBfNrc
 FBd7QrpsmPpKvPt3o0c+dUKU+G+tZtBeix0Z/tlkbt4obhAD0XwgX/2AeLZ53+uKJ0lr
 18CqweM3kGau83EOmvjwoUBhpzpFWxTI1zvwq7oRTvLZrr29tjg5doKrhqI943Wfn3oV
 tWyyfw1tYoVhZOz+xMj35X2Nm4E81ArZPP+Pso8fKwp0CxNOUsBFz/MJj+5x2nJd5JTF
 Cimg==
X-Gm-Message-State: AOAM532vl1e29eZnP/dsPo79I+kWgjPup0MCb7UxTLm7/lh/Jy7OmmRj
 x3kL3Ad4fmwp7bsofaWoQdb2bjtG/tGC/w==
X-Google-Smtp-Source: ABdhPJzhk9Gj13HN9ICvYrRXhl8/FcPaO6E4PpQH03UrKi+NPynQcnmekD+m2E+NDdhDLQLAUaErrA==
X-Received: by 2002:aa7:92c6:0:b029:1cb:1c6f:c605 with SMTP id
 k6-20020aa792c60000b02901cb1c6fc605mr15928253pfa.4.1612751901242; 
 Sun, 07 Feb 2021 18:38:21 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:38:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 22/70] tcg/tci: Split out tci_args_l
Date: Sun,  7 Feb 2021 18:37:04 -0800
Message-Id: <20210208023752.270606-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
 tcg/tci.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 86625061f1..8bc9dd27b0 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -184,6 +184,11 @@ static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
  *   s = signed ldst offset
  */
 
+static void tci_args_l(const uint8_t **tb_ptr, void **l0)
+{
+    *l0 = (void *)tci_read_label(tb_ptr);
+}
+
 static void tci_args_rr(const uint8_t **tb_ptr,
                         TCGReg *r0, TCGReg *r1)
 {
@@ -434,9 +439,9 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #endif
             break;
         case INDEX_op_br:
-            label = tci_read_label(&tb_ptr);
+            tci_args_l(&tb_ptr, &ptr);
             tci_assert(tb_ptr == old_code_ptr + op_size);
-            tb_ptr = (uint8_t *)label;
+            tb_ptr = ptr;
             continue;
         case INDEX_op_setcond_i32:
             tci_args_rrrc(&tb_ptr, &r0, &r1, &r2, &condition);
-- 
2.25.1


