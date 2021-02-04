Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E4A30EA2D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:30:15 +0100 (CET)
Received: from localhost ([::1]:35978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UPO-0004ue-76
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:30:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjO-0005Y4-Gb
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:50 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:46449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjK-00041S-OM
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:50 -0500
Received: by mail-pg1-x532.google.com with SMTP id r38so1003416pgk.13
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SiXlz8iU8i8mL6XFtS7HcVMO8xC61iquHDNUAoO7sPU=;
 b=hiG+dztcIn9Nhpj83I3qjdwExxUgw9sdDINPStrgmg15gZtHqnfLIHnIm/QDm8Frir
 6DpY82HCGtCXTomQ0lcn8hsjI6ut+cTgSqkByBHsUwi/TbYI22dK/HjcG8dOYnTmVjgU
 B0Unm/IYlhvTc+16DRGds0ZSfTUtUWXzlK4QLiPSy1mDdn+hf41oGX9ivtRftO1e+cjx
 Pp+iL7nhcnAXs7EPm/SEWSs3B9MJzk6o0Xl4BN5C1LsKZOem1pqgDAZIkwpgicB9RNcK
 nAzkPME/LMJDB3z6uXFSoSadXw+ZIvRrpx62tsF1jPYPCJPbdXwg9pApoRoCgbfiaZ9d
 46Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SiXlz8iU8i8mL6XFtS7HcVMO8xC61iquHDNUAoO7sPU=;
 b=UAEaKjtYIRLAy8lIzJOQ/K5BahiNoF5FLTmS5exY0TNds8e9jn+VJu8KmPkSDX6hDI
 3ZPmAY5dZKnYiE5Xr0nXT/ZkUZOR1HuUQM45W8n/WydDs2PvG5llgmLZUpcKak9PIWac
 u/+l8M6eJMmQ0LqdL49t5nNR/guUAcS6v5VQNYTfzYY7oBbYTANsVFLt3tUSbBNEEajl
 5KFqI+FCMQA63RfRypxawezSClNTTMXVeWwc4T+tAfmHZp1/9ZhUUetpfszGby5rPilY
 IeFiPTwGlgRYLl9MM+80LeK1cvV71S6XDv9rvl98UDDA0Xj/5hJy/XV09eEQdxWIdO64
 7X1w==
X-Gm-Message-State: AOAM530pLaSVkqtRpjFHIE8HYCyfJMgNJiGhu44dwHM5yM7ErdQUzZfN
 D2bksxfMscs18b6ueyoR9QjHEilKZ04EUIIX
X-Google-Smtp-Source: ABdhPJyKk11Q1moMYshAhNH0rSfS+ZEkeMI78a5OnFzNwj50uaOx7Uy+JAiO/jRtogLk+pvwXlfAPg==
X-Received: by 2002:a65:44c5:: with SMTP id g5mr6641718pgs.295.1612403205478; 
 Wed, 03 Feb 2021 17:46:45 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:46:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 52/93] tcg/tci: Reuse tci_args_l for exit_tb
Date: Wed,  3 Feb 2021 15:44:28 -1000
Message-Id: <20210204014509.882821-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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

Do not emit a uint64_t, but a tcg_target_ulong, aka uintptr_t.
This reduces the size of the constant on 32-bit hosts.
The assert for label != NULL has to be removed because that
is a valid value for exit_tb.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c                | 13 ++++---------
 tcg/tci/tcg-target.c.inc |  2 +-
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 92b13829c3..57b6defe09 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -160,9 +160,7 @@ tci_read_ulong(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
 
 static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
 {
-    tcg_target_ulong label = tci_read_i(tb_ptr);
-    tci_assert(label != 0);
-    return label;
+    return tci_read_i(tb_ptr);
 }
 
 /*
@@ -417,7 +415,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
     tcg_target_ulong regs[TCG_TARGET_NB_REGS];
     long tcg_temps[CPU_TEMP_BUF_NLONGS];
     uintptr_t sp_value = (uintptr_t)(tcg_temps + CPU_TEMP_BUF_NLONGS);
-    uintptr_t ret = 0;
 
     regs[TCG_AREG0] = (tcg_target_ulong)env;
     regs[TCG_REG_CALL_STACK] = sp_value;
@@ -832,9 +829,9 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             /* QEMU specific operations. */
 
         case INDEX_op_exit_tb:
-            ret = *(uint64_t *)tb_ptr;
-            goto exit;
-            break;
+            tci_args_l(&tb_ptr, &ptr);
+            return (uintptr_t)ptr;
+
         case INDEX_op_goto_tb:
             /* Jump address is aligned */
             tb_ptr = QEMU_ALIGN_PTR_UP(tb_ptr, 4);
@@ -992,6 +989,4 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         }
         tci_assert(tb_ptr == old_code_ptr + op_size);
     }
-exit:
-    return ret;
 }
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index c79f9c32d8..ff8040510f 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -401,7 +401,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
 
     switch (opc) {
     case INDEX_op_exit_tb:
-        tcg_out64(s, args[0]);
+        tcg_out_i(s, args[0]);
         break;
 
     case INDEX_op_goto_tb:
-- 
2.25.1


