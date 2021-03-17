Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BA633F4AA
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:53:58 +0100 (CET)
Received: from localhost ([::1]:50836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYUf-0000Ay-MK
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:53:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCQ-0005Av-BH
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:06 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:35800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCJ-00078g-Qj
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:06 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 v24-20020a9d69d80000b02901b9aec33371so2173926oto.2
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+MEWN9WQ0I4wojHOI5XK5Q12NZO/KQfmuWx2IIReuGY=;
 b=iAIpaRN9fzHJe6Zq/oNfk4C+KnVoniPee5dMnAIOi6D9eb0d54hhyh3PKaUSK41ix2
 o/ikz4wynk5+599xz1xRV7XPJE3igC0I/z5gbgP+ykQesalbSTFu8Iz6aoMoEdcCcpV/
 /cWEWFUjA/pjo1nlmnH6Hi8pK02aOZxM4hNH9NHV3mn/YfNGQ75+R0nfhjc6W02jABI1
 Bq2s9XjaLt+h/k6T2iSRv6WO1No92C1kun5ouCZ0pgG0cEMwWZvkDbjIy4ed5cUXcEuS
 Zkx5GJEYXOFoWvEsM229Bdg3dt3t/3XthhaegwmUnq61uVmKotz1a0dIL9eTprtPa4o3
 jmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+MEWN9WQ0I4wojHOI5XK5Q12NZO/KQfmuWx2IIReuGY=;
 b=kQ8KSeNOfNuFHqTWHl7UzWfuI1/QfFgPlf24V02xwkdbk3sCboiPfgfS2UIIsWoukS
 XZE2G68K+8+CbaiSiBllYQugEQTgAfRIb6WcymJwbi1flj16XBcsddTTB5LaCE5d5hQ1
 bcZ16x5CFbAafODihHV18yCDbwGpwiEsCsggUeW7o9XTcoiV2SyV/95nYvRJuXiSONkW
 /7ZrDOPqTnl6KOP1BN0R6eb9bfzQe5sQfHbgEFKHywy/wg9Q17RcaqhyzUplSYVd0fZd
 77nfQpbDjhlARE5o5zblavX/fPzMb1rcsBlR5Vk4TBEJr26NlH2f305ph/IUTw8bBhSd
 PZAw==
X-Gm-Message-State: AOAM5308BcGsXMC2Ln0LlnLdYZ4m3hoocTwaybJgHe0mJgoTjhkyewbH
 6rmm4131jsDAMcJA4s6LywdrSsR89L4zjfP/
X-Google-Smtp-Source: ABdhPJw79/t56GsyEgGtR4fdKwenpK4v075IuH/RG34pmDoi8/a8UXu7lk3SrUqWrT+ur45LqBGX8Q==
X-Received: by 2002:a05:6830:1282:: with SMTP id
 z2mr3887328otp.30.1615995298070; 
 Wed, 17 Mar 2021 08:34:58 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:34:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/38] tcg/tci: Reuse tci_args_l for exit_tb
Date: Wed, 17 Mar 2021 09:34:18 -0600
Message-Id: <20210317153444.310566-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not emit a uint64_t, but a tcg_target_ulong, aka uintptr_t.
This reduces the size of the constant on 32-bit hosts.
The assert for label != NULL has to be removed because that
is a valid value for exit_tb.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c                | 13 ++++---------
 tcg/tci/tcg-target.c.inc |  2 +-
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 0f8f606808..71d6720e22 100644
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
@@ -402,7 +400,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
     tcg_target_ulong regs[TCG_TARGET_NB_REGS];
     long tcg_temps[CPU_TEMP_BUF_NLONGS];
     uintptr_t sp_value = (uintptr_t)(tcg_temps + CPU_TEMP_BUF_NLONGS);
-    uintptr_t ret = 0;
 
     regs[TCG_AREG0] = (tcg_target_ulong)env;
     regs[TCG_REG_CALL_STACK] = sp_value;
@@ -817,9 +814,9 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -977,6 +974,4 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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


