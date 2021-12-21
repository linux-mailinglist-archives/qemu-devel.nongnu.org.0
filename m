Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CB547C443
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 17:55:24 +0100 (CET)
Received: from localhost ([::1]:50452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mziQ7-0000Oj-4Z
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 11:55:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIt-00008X-IA
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:47:55 -0500
Received: from [2607:f8b0:4864:20::630] (port=45051
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIo-0007b5-OY
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:47:55 -0500
Received: by mail-pl1-x630.google.com with SMTP id q17so11185497plr.11
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 08:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GUca+63qIJTLMQAWr92ep0gyUQJuyE3JsMVKseasO3I=;
 b=MV4jMt/5mCVxV8uMwlSmj1AqEwDNc1F0n9t7xFGN5+OpkK62liAyIN7d4vX/VsFTWW
 2wq5kMgaom/MjnEaJ+qS5umGpZ18m5N+TdqHe/sD0+Rm1CdJxXu8kcm/kq+zMBilfT3c
 u/sqlc0Cuf3CqPI1ugTzuQ8XAQGKIngvI54hK8V6YzZ0XyGK4UA16fbV3KIamAu9p0V1
 kakoEJGtriC+WAxxIYdOP24HInZgvUSWExuGFyJhcSWxYO8RBl3ZBDvnjx5Rn1CZOj2m
 IxSvqUE+6mGXX8UHyf4yGIp0Ebnx0/GWRS+ErcW7gjVURmhN6UwHhYDU8Ebtcq2aq0Wa
 EbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GUca+63qIJTLMQAWr92ep0gyUQJuyE3JsMVKseasO3I=;
 b=xAJlyAq3qjcvqAxdOkHHVF6HhsA9V+bDJZ+YeCTEjsRkog5J22B9tjbw5Ref/zd/br
 UHG5aKoDJKmBUCepaclG2hsDzsUW+aelITPPuThg/keWTfAfRVuG/CSkIqho5TveTE1G
 wCLuCbcVQBIrAA4mCYo88H3WmyIH48S4AUOiPu1y8MsEJXcf0ZCrUVnumS8oka/klxi8
 c23S2uEFHsdAWLwW/AmIB+x6ExsYLvX2wXGoKyC7w3pTM0T4/wEafEcnPOXaVsH/N9Hm
 aA7gg8OjPSw/TGkPuQvpd+TASYcE7S10n0sf9AqXQJ5muYvBIofx+rWX6TpcU6au0Irp
 rgSQ==
X-Gm-Message-State: AOAM533DTkMtfnWqPYYP7YPOEm/IBB7Wc1ISxY1qZUFq8hGPSAcBbfN+
 jm7mAH7cJyNxoNjBTy6kQ+69P3I6Rs2aTQ==
X-Google-Smtp-Source: ABdhPJwvpTiKHsn8qTRQl3BAvYG5whqG0UuDRYDReO16QVpwQKHPaZ/nanLdwlyErZDT5REQSF3pRA==
X-Received: by 2002:a17:90b:380d:: with SMTP id
 mq13mr4938491pjb.110.1640105264759; 
 Tue, 21 Dec 2021 08:47:44 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id b192sm2256818pga.35.2021.12.21.08.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 08:47:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/31] tcg/loongarch64: Define the operand constraints
Date: Tue, 21 Dec 2021 08:47:12 -0800
Message-Id: <20211221164737.1076007-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221164737.1076007-1-richard.henderson@linaro.org>
References: <20211221164737.1076007-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: WANG Xuerui <git@xen0n.name>

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211221054105.178795-7-git@xen0n.name>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target-con-str.h | 28 +++++++++++++++
 tcg/loongarch64/tcg-target.c.inc     | 52 ++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 tcg/loongarch64/tcg-target-con-str.h

diff --git a/tcg/loongarch64/tcg-target-con-str.h b/tcg/loongarch64/tcg-target-con-str.h
new file mode 100644
index 0000000000..c3986a4fd4
--- /dev/null
+++ b/tcg/loongarch64/tcg-target-con-str.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define LoongArch target-specific operand constraints.
+ *
+ * Copyright (c) 2021 WANG Xuerui <git@xen0n.name>
+ *
+ * Based on tcg/riscv/tcg-target-con-str.h
+ *
+ * Copyright (c) 2021 Linaro
+ */
+
+/*
+ * Define constraint letters for register sets:
+ * REGS(letter, register_mask)
+ */
+REGS('r', ALL_GENERAL_REGS)
+REGS('L', ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
+
+/*
+ * Define constraint letters for constants:
+ * CONST(letter, TCG_CT_CONST_* bit set)
+ */
+CONST('I', TCG_CT_CONST_S12)
+CONST('N', TCG_CT_CONST_N12)
+CONST('U', TCG_CT_CONST_U12)
+CONST('Z', TCG_CT_CONST_ZERO)
+CONST('C', TCG_CT_CONST_C12)
+CONST('W', TCG_CT_CONST_WSZ)
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 653ef0a4bb..1c1b798c06 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -116,3 +116,55 @@ static const int tcg_target_call_oarg_regs[] = {
     TCG_REG_A0,
     TCG_REG_A1,
 };
+
+#define TCG_CT_CONST_ZERO  0x100
+#define TCG_CT_CONST_S12   0x200
+#define TCG_CT_CONST_N12   0x400
+#define TCG_CT_CONST_U12   0x800
+#define TCG_CT_CONST_C12   0x1000
+#define TCG_CT_CONST_WSZ   0x2000
+
+#define ALL_GENERAL_REGS      MAKE_64BIT_MASK(0, 32)
+/*
+ * For softmmu, we need to avoid conflicts with the first 5
+ * argument registers to call the helper.  Some of these are
+ * also used for the tlb lookup.
+ */
+#ifdef CONFIG_SOFTMMU
+#define SOFTMMU_RESERVE_REGS  MAKE_64BIT_MASK(TCG_REG_A0, 5)
+#else
+#define SOFTMMU_RESERVE_REGS  0
+#endif
+
+
+static inline tcg_target_long sextreg(tcg_target_long val, int pos, int len)
+{
+    return sextract64(val, pos, len);
+}
+
+/* test if a constant matches the constraint */
+static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
+{
+    if (ct & TCG_CT_CONST) {
+        return true;
+    }
+    if ((ct & TCG_CT_CONST_ZERO) && val == 0) {
+        return true;
+    }
+    if ((ct & TCG_CT_CONST_S12) && val == sextreg(val, 0, 12)) {
+        return true;
+    }
+    if ((ct & TCG_CT_CONST_N12) && -val == sextreg(-val, 0, 12)) {
+        return true;
+    }
+    if ((ct & TCG_CT_CONST_U12) && val >= 0 && val <= 0xfff) {
+        return true;
+    }
+    if ((ct & TCG_CT_CONST_C12) && ~val >= 0 && ~val <= 0xfff) {
+        return true;
+    }
+    if ((ct & TCG_CT_CONST_WSZ) && val == (type == TCG_TYPE_I32 ? 32 : 64)) {
+        return true;
+    }
+    return false;
+}
-- 
2.25.1


