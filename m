Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09060308E40
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 21:19:43 +0100 (CET)
Received: from localhost ([::1]:57824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5aF3-0006ma-Sy
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 15:19:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6T-0006GT-Q5
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:10:49 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:41414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6R-00083P-Qq
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:10:49 -0500
Received: by mail-pf1-x42b.google.com with SMTP id q20so6921337pfu.8
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 12:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nSEK3p+qxylOawpMIAYivHlEQIteSEhF1LMizEZTG7s=;
 b=FxLQijXnggCEea9Glr6nnqx0WAzTL/2qyTBsAkXba3kBv99WXB/SE2r3pBOP4eXDnS
 hZGs4sxIfUN9bcroSMc/NYoRA9yV77BmAWkA56yMJ2UP660WmFAXuu6YD8+7/qLDqIDz
 QzuIAxFBAeOGx3Rkts+/izmPawnK4gM1echVmyX/fVml4ZFgD5zMCiD/hOxeds8CyycM
 QVoyQtGBo93tpnHMwHklJqeL+c0w0P4U4o0lbv9YJ3cQ3YSe0n9ccHLadCvF5z2vmIls
 TYYnvkw0nCNZrC28YJ0l9/SyCw8A1oeVC/aydtlvDY6hNI918AQtqISHyOAvlsF+lqYu
 TiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nSEK3p+qxylOawpMIAYivHlEQIteSEhF1LMizEZTG7s=;
 b=Gz6zJpPOgsPEBqmQPDOTEu7x7/tT/1QoYbVlIl3Z9a0SQpYmJoVmT4dIp/dTqRQy2k
 u5GtUCpHMQFAPGHejj2g3StWMYF7kkfckvL2LRXTD5m8NYNW1Bk4BzzcwpRK+emsJdIa
 +YUlOurC5o95IshDX/B+DE35t/ZsT7nWTyjbD0RK9oRC1J8GOgMsHX2EBKJiiZZrNWk9
 cqjHqLv17gCESapIkgi0WtrzYNzaNa9c1EnIIDz+QrVOD0/DWTHcrSJlPkYZURaNDKep
 WQm3M8RhKZm0YQWUNCjrFSGUfNZgfXxSWvxOgkNsfilyKO3F6kO60fALvPwLOp7cPIql
 ojkQ==
X-Gm-Message-State: AOAM530v5+6Vn4OlrAUhzY25AB50ktbQkFcIsJXHaMMDX6MupVQ7I0ZD
 y+xwTv/QUHAGPuoih7mYdLbErRWnby6iaGos
X-Google-Smtp-Source: ABdhPJwbURMxkrEwyGl635G4mDZAkhXev1040x1caTu/h1ptF1/GvMzwdCgLPzgbGSp+6BEcHLyeZw==
X-Received: by 2002:a62:f207:0:b029:1c0:434b:cc14 with SMTP id
 m7-20020a62f2070000b02901c0434bcc14mr5984833pfh.11.1611951046482; 
 Fri, 29 Jan 2021 12:10:46 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id d133sm9247265pfd.6.2021.01.29.12.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 12:10:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/24] tcg/tci: Split out target constraints to
 tcg-target-con-str.h
Date: Fri, 29 Jan 2021 10:10:13 -1000
Message-Id: <20210129201028.787853-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129201028.787853-1-richard.henderson@linaro.org>
References: <20210129201028.787853-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target-con-str.h | 11 +++++++++++
 tcg/tci/tcg-target.h         |  2 ++
 tcg/tci/tcg-target.c.inc     | 14 --------------
 3 files changed, 13 insertions(+), 14 deletions(-)
 create mode 100644 tcg/tci/tcg-target-con-str.h

diff --git a/tcg/tci/tcg-target-con-str.h b/tcg/tci/tcg-target-con-str.h
new file mode 100644
index 0000000000..87c0f19e9c
--- /dev/null
+++ b/tcg/tci/tcg-target-con-str.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define TCI target-specific operand constraints.
+ * Copyright (c) 2021 Linaro
+ */
+
+/*
+ * Define constraint letters for register sets:
+ * REGS(letter, register_mask)
+ */
+REGS('r', MAKE_64BIT_MASK(0, TCG_TARGET_NB_REGS))
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index bb784e018e..ab832aecc3 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -207,4 +207,6 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
     /* no need to flush icache explicitly */
 }
 
+#define TCG_TARGET_CON_STR_H
+
 #endif /* TCG_TARGET_H */
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index b62e14d5ce..493bbf1e39 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -302,20 +302,6 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
     return true;
 }
 
-/* Parse target specific constraints. */
-static const char *target_parse_constraint(TCGArgConstraint *ct,
-                                           const char *ct_str, TCGType type)
-{
-    switch (*ct_str++) {
-    case 'r':
-        ct->regs = BIT(TCG_TARGET_NB_REGS) - 1;
-        break;
-    default:
-        return NULL;
-    }
-    return ct_str;
-}
-
 #if defined(CONFIG_DEBUG_TCG_INTERPRETER)
 /* Show current bytecode. Used by tcg interpreter. */
 void tci_disas(uint8_t opc)
-- 
2.25.1


