Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38683312923
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:03:34 +0100 (CET)
Received: from localhost ([::1]:60672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wpp-00032M-7m
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:03:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRg-0001Zj-I7
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:38 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:46090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRZ-0005ro-1e
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:34 -0500
Received: by mail-pf1-x435.google.com with SMTP id k13so2293810pfh.13
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SiXlz8iU8i8mL6XFtS7HcVMO8xC61iquHDNUAoO7sPU=;
 b=i5OdUspvMMPqenMeMkiA84dVMCe4fKMTMEDCFInX2YOSWrei35xVv62fj6hAE2Z+cf
 njBTlBa+awiy6WacZhggBnWU4DsROOrvJSKLK65MaORyCEvOoavxtADvItNxo1D5Vytz
 XD9k48gLuDfFhkSi1eh3PASFxMO4DV0jnzQ8hGEgIQDhsW7V/PYKoeppmjKRBhrV6RXR
 aUSwMGeFpp4VNHAAy0muAWuneN4uxNrLv4W6OJE6av327d1ud5BLhxMiAHHGTH85LXt/
 766gHAP+NVb+OzjnSoWN5wo1xx/5Z5JoA5dL+S89WQ5KUvVmGrOKYcZYdCtzWXiEPcfh
 eNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SiXlz8iU8i8mL6XFtS7HcVMO8xC61iquHDNUAoO7sPU=;
 b=KW4T00zcaP5MUQcY6lQ2S6BR4YHfmwdU8veGvh0t9bimBVJOzMmX/n1m0RpMak96gJ
 qOBfbTrO0S53+kF1Z3INGcFQ+5n+XpIXZvhIH0+TIPrXa0gFYwIsq34td0yva2YMQAgQ
 bp43/aYKK32eJJ63niRizoK0xA+cUc8oBmhIZRpGfrK8SeDxqFx/R/9W0GZvxpMY+rVI
 0xPYx8VLjtXBNpmdb1xBrUz7lcVNb1txvUfAvot2RNj0Z2NXW2NYUBJAKpT30IT0GRG4
 cvFxT++gC7dW+w7Puq9J9K4Ie4EsNTPa2zSEDmZke+GkBf+UZRhCfC4BV3C+rlMXtwEI
 aKOg==
X-Gm-Message-State: AOAM530lY2MFHoOXcZcSnGwNm7O7mVkd+Td+e8cSKioCM+Wx9ndAUaXJ
 4oUhAJElpGYHbp6W8cH4gL8mQ/qZGFPYnw==
X-Google-Smtp-Source: ABdhPJwWEInjTsVP65suz6N/fai0VB8uiS0AuVIsaS1ffZ/uUnWHnW+bNOQq/PsH8ZzWda4k3yt1xA==
X-Received: by 2002:a63:5416:: with SMTP id i22mr15432214pgb.43.1612751907573; 
 Sun, 07 Feb 2021 18:38:27 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:38:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 27/70] tcg/tci: Reuse tci_args_l for exit_tb
Date: Sun,  7 Feb 2021 18:37:09 -0800
Message-Id: <20210208023752.270606-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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


