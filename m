Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D75E30E997
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 02:49:17 +0100 (CET)
Received: from localhost ([::1]:34466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Tlk-0006s5-5U
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 20:49:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Ti6-0004cS-BS
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:35 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:35656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Ti1-0003Ym-EO
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:30 -0500
Received: by mail-pj1-x102c.google.com with SMTP id e9so829693pjj.0
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V9K6psPZgkSjeT0TMBnqZlPYxPfyJCvKViKqKJxu0LY=;
 b=uuIVQvvvSb6f8yb+XbcoE1ez4bzg77o2R+bPOvOsPZFrd8xitgjQ/eaWytDgX6R/55
 2uTY/fPh/rdTdr8ajzUGWCcb90Ad5nRk5s7usl3RFG8DAZGJgWBdYWBArEEwAWdAdMOw
 0X+7ThiJbQEe7SzMAtL0G4a/c+NuSRQtJ8oLWz3JHMyM9T+DmULo+ppdh10O6W5uVB9s
 5hPrQHEM+VTjrLnmsMaVVUbjd7WP6ED9J+Rr3BhXvt0nLP37/GqYzU6WThepyrkKp/+f
 Iqxzh7ZhGC11M8yRns9LwzdA3S9py/T7dZPezyRmQu5SMdYFRifzEzmVSct51eT+xLSH
 CmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V9K6psPZgkSjeT0TMBnqZlPYxPfyJCvKViKqKJxu0LY=;
 b=rEX6kfkyrC6D9H9N+4MRB5QBZ+OJiFS1NUHAX/3U8rgEAwKWh62UvHwWZGi9lIrTqJ
 kXnpRYwsuBCA15hUm41iU8SeuXy1YhtNr/vi2pwzn8hPB0ixNdVKTX+k7GUmQSW5bWcC
 gTdaAy7cNJBR/pomV6SLTDdSL0UoSmvatLvw5Lr83XPWuXOuHtFNL3P0KpMiRBc3JG+b
 LCaYOPmeN6hv1aXEO3CjUM7Slg0xsnSki5Iht/t3jFaRPKpB1+H1KvTx4Ymr7/IKIKjK
 dqqmyO8/ObqCaA18F1O6s/HFJFEiYiRzhdn74/PoMGbM8xPi64fi3neR1PhCVaDekUEB
 FN5Q==
X-Gm-Message-State: AOAM531lFp5D8LvYHRcLGHwJ+GayVlhkfF0Ss/gjXRFJLUNq6Ip+ZSLa
 Mq4N72aUF3maLhJH/35Fn3efSWddmC7FtH3K
X-Google-Smtp-Source: ABdhPJx2Hu6C4L74Qt6XqPcFtxwhL/jyo+lC5vtzZeTiBieEbO6pA4eQUCNgpNhKhQLlbUm4kFrs0Q==
X-Received: by 2002:a17:903:1c3:b029:de:6b19:e72e with SMTP id
 e3-20020a17090301c3b02900de6b19e72emr5785243plh.63.1612403124015; 
 Wed, 03 Feb 2021 17:45:24 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:45:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/93] tcg/tci: Make tci_tb_ptr thread-local
Date: Wed,  3 Feb 2021 15:43:41 -1000
Message-Id: <20210204014509.882821-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

Each thread must have its own pc, even under TCI.

Remove the GETPC ifdef, because GETPC is always available for
helpers, and thus is always required.  Move the assignment
under INDEX_op_call, because the value is only visible when
we make a call to a helper function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 2 +-
 tcg/tcg-common.c        | 4 ----
 tcg/tci.c               | 7 +++----
 3 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 125000bcf7..f933c74c44 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -544,7 +544,7 @@ void tb_set_jmp_target(TranslationBlock *tb, int n, uintptr_t addr);
 
 /* GETPC is the true target of the return instruction that we'll execute.  */
 #if defined(CONFIG_TCG_INTERPRETER)
-extern uintptr_t tci_tb_ptr;
+extern __thread uintptr_t tci_tb_ptr;
 # define GETPC() tci_tb_ptr
 #else
 # define GETPC() \
diff --git a/tcg/tcg-common.c b/tcg/tcg-common.c
index 7e1992e79e..aa0c4f60c9 100644
--- a/tcg/tcg-common.c
+++ b/tcg/tcg-common.c
@@ -25,10 +25,6 @@
 #include "qemu/osdep.h"
 #include "tcg/tcg.h"
 
-#if defined(CONFIG_TCG_INTERPRETER)
-uintptr_t tci_tb_ptr;
-#endif
-
 TCGOpDef tcg_op_defs[] = {
 #define DEF(s, oargs, iargs, cargs, flags) \
          { #s, oargs, iargs, cargs, iargs + oargs + cargs, flags },
diff --git a/tcg/tci.c b/tcg/tci.c
index 3fc82d3c79..b3f9531a73 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -57,6 +57,8 @@ typedef uint64_t (*helper_function)(tcg_target_ulong, tcg_target_ulong,
                                     tcg_target_ulong, tcg_target_ulong);
 #endif
 
+__thread uintptr_t tci_tb_ptr;
+
 static tcg_target_ulong tci_read_reg(const tcg_target_ulong *regs, TCGReg index)
 {
     tci_assert(index < TCG_TARGET_NB_REGS);
@@ -526,16 +528,13 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #endif
         TCGMemOpIdx oi;
 
-#if defined(GETPC)
-        tci_tb_ptr = (uintptr_t)tb_ptr;
-#endif
-
         /* Skip opcode and size entry. */
         tb_ptr += 2;
 
         switch (opc) {
         case INDEX_op_call:
             t0 = tci_read_ri(regs, &tb_ptr);
+            tci_tb_ptr = (uintptr_t)tb_ptr;
 #if TCG_TARGET_REG_BITS == 32
             tmp64 = ((helper_function)t0)(tci_read_reg(regs, TCG_REG_R0),
                                           tci_read_reg(regs, TCG_REG_R1),
-- 
2.25.1


