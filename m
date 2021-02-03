Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AF630D16B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 03:24:14 +0100 (CET)
Received: from localhost ([::1]:45216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l77q1-0008E2-As
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 21:24:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77iH-0007jV-2B
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:13 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:40440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77iD-00011k-IM
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:12 -0500
Received: by mail-pf1-x431.google.com with SMTP id i63so15644957pfg.7
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 18:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nSEK3p+qxylOawpMIAYivHlEQIteSEhF1LMizEZTG7s=;
 b=sTREIQBPV+e5HqTyNRKNllcVT4l4X7zmhOxjCg4U/HzYswx4M4OBW3OosnZyVzivB6
 Fh22QEXRvcTXHWvUVJ7a0SLwr9TBwmBld9E9ycLd4Nn8TjQfe+t/tjPLP4BX6u6aTp32
 aJBAWm4jJV0NyC62PDVhqnbbT/erLrtgplD8Eoq7uBAteSDekd3jG5KImgYbUJJvdz0o
 kGNLV0gKNSTdfwmkZyMz438v2Suj8g5U+gNy9hGBMeoN2ZI6udSpAhiDl/Mh0/X1EzKI
 DNZra4EGHYw6VYDMdQuC9fSxP754oe6whshYimr/YM/85/ddsXiuygvzcx8JGh0e9v30
 FdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nSEK3p+qxylOawpMIAYivHlEQIteSEhF1LMizEZTG7s=;
 b=r2ltruog7XBm3ZYMEIEuhYfJQAmVKFLzySCtkG5pRxSqIHh7O+iZ032CMvH7apDiHn
 cZremKRHPAAz/wdqgO37dRQ/BdqfLgRkNTiurLjWlCESAhHWi8fM7Z2jj4eR0zIG6/XS
 Yi3zOHhDzuCk5FyARdjOQvh+KP7I/XH2HCZg/TtuPDWRCPFObxBlfd3/hnkUjQo7IbHd
 lO8Me5RhkKS5zoI6GBixlmoeaLg3XC7kEjx94oLr94+5CtnjwhtSDS7ANWEk0ilIoEvH
 8NgG56vy4UxIqqJzWgNdBSFJOx8ZOVPqwwaLMVAN3PMzWvq/4CTFn5BjG0kwVplKifVx
 wLLA==
X-Gm-Message-State: AOAM531NhiV0vvYF1Nfi0oXdVx1WlCsCQ6/aWsZXYQx3q6G5caRf6cMn
 6Y81sSuQFtWReMgEDvtGcYOrHMul2BDr7MjJ
X-Google-Smtp-Source: ABdhPJwDgTy5zF0suPAierohQZwjzyZMP9pgeLSHbrHbxLlQMGaPjRSYWiNkr23gEBII0AAZHjeHCA==
X-Received: by 2002:a62:3812:0:b029:1be:cbfd:ca78 with SMTP id
 f18-20020a6238120000b02901becbfdca78mr1005865pfa.28.1612318567262; 
 Tue, 02 Feb 2021 18:16:07 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id x1sm270301pgj.37.2021.02.02.18.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 18:16:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/24] tcg/tci: Split out target constraints to
 tcg-target-con-str.h
Date: Tue,  2 Feb 2021 16:15:35 -1000
Message-Id: <20210203021550.375058-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203021550.375058-1-richard.henderson@linaro.org>
References: <20210203021550.375058-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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


