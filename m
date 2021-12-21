Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF92047C4A5
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 18:05:43 +0100 (CET)
Received: from localhost ([::1]:50424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzia6-0002sS-Rw
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 12:05:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziJ6-0000n9-GY
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:08 -0500
Received: from [2607:f8b0:4864:20::536] (port=42676
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIo-0007cT-Oj
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:08 -0500
Received: by mail-pg1-x536.google.com with SMTP id g2so10253043pgo.9
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 08:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aRDFGEdRx4gKiMYB6nK14fb+uw0O+ZvZTgYpZPI8a7w=;
 b=MGaSxePdYAS/uXlXuM0qZlv8vJBVxV1z90+Sv7DOmk6i37ypInUejUYZgytpU71qG+
 cM8GFtAb4cebn7tu4mbX7oFhCtN+dh0skr863kd9jnO7Wl5U4po8eo4B6L0CFT2oCmZb
 55KdzeBqwjHqUaPTXKeRHuihvprlLYhPfwTI+DFmpNI6lDRTZKLXwJlm+D7cQcgPC9M+
 pvQbq69rMZOuSDl7172AbOO1qh2hLfxZZfnpIeSVAZ/yMdIUC9rVzQ/Hlw0eO/Fbko0o
 NhiO1nDheLkOnk4yS10NFvv5D3aaLgaScxkcFPKfbd4zTPb5pUuT6RiZVemh+KCvArSi
 StjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aRDFGEdRx4gKiMYB6nK14fb+uw0O+ZvZTgYpZPI8a7w=;
 b=KtD3s0e1a0KloODmNyAhkooI1gopnoXVacX6DmQgoCWHEHVAoROTRfhEDQuHYuHg1p
 x0HnG05WhVHWhJgClsAsWZiUiqWvL0brySzqdZ1FQlN9JeW3oInsmFtv+dI2ViKG+5iP
 29Sd43P6sVmPTJEByh3P9+Gq/uHzlkl1FwF1U0IbiY4c5XRfJkxNJMR7myYD0WAaDIW0
 dqTx4wYcQC2rQKmVx87ZKeWbLZkpnAm4rszugTDK9RDiJfiF0zcxvXS/IBGuD0gE86w2
 bbThd0/s6T0q+WOihBwukheou7YFyy2bNd4OWUZjmm6jfRt+rkwGWfXxSoE9BLOXFEpT
 3vvg==
X-Gm-Message-State: AOAM530ckuZZGuS/oCmmZ+CIFO7nMoUF0gNX3SIFePSuDFaqHgvpjIMK
 x44FnJPuIsXLKisWCU2IlXnhe0EQMLNdVQ==
X-Google-Smtp-Source: ABdhPJyfY4WhwW9EXHFQOJlBZ+mXo03yQH4RtG76CH7AzHN5Nd3gKk18Rfa2PyLdLs+As1dZlMvzvg==
X-Received: by 2002:a63:f30b:: with SMTP id l11mr1453872pgh.272.1640105268253; 
 Tue, 21 Dec 2021 08:47:48 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id b192sm2256818pga.35.2021.12.21.08.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 08:47:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/31] tcg/loongarch64: Implement goto_ptr
Date: Tue, 21 Dec 2021 08:47:16 -0800
Message-Id: <20211221164737.1076007-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221164737.1076007-1-richard.henderson@linaro.org>
References: <20211221164737.1076007-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Message-Id: <20211221054105.178795-11-git@xen0n.name>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target-con-set.h | 17 +++++++++++++++++
 tcg/loongarch64/tcg-target.c.inc     | 15 +++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 tcg/loongarch64/tcg-target-con-set.h

diff --git a/tcg/loongarch64/tcg-target-con-set.h b/tcg/loongarch64/tcg-target-con-set.h
new file mode 100644
index 0000000000..5cc4407367
--- /dev/null
+++ b/tcg/loongarch64/tcg-target-con-set.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define LoongArch target-specific constraint sets.
+ *
+ * Copyright (c) 2021 WANG Xuerui <git@xen0n.name>
+ *
+ * Based on tcg/riscv/tcg-target-con-set.h
+ *
+ * Copyright (c) 2021 Linaro
+ */
+
+/*
+ * C_On_Im(...) defines a constraint set with <n> outputs and <m> inputs.
+ * Each operand should be a sequence of constraint letters as defined by
+ * tcg-target-con-str.h; the constraint combination is inclusive or.
+ */
+C_O0_I1(r)
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index bb45ea0fcf..3a8c52465b 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -397,9 +397,24 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_mb(s, a0);
         break;
 
+    case INDEX_op_goto_ptr:
+        tcg_out_opc_jirl(s, TCG_REG_ZERO, a0, 0);
+        break;
+
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     default:
         g_assert_not_reached();
     }
 }
+
+static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
+{
+    switch (op) {
+    case INDEX_op_goto_ptr:
+        return C_O0_I1(r);
+
+    default:
+        g_assert_not_reached();
+    }
+}
-- 
2.25.1


