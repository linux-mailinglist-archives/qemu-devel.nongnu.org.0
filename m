Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A9D47C4B6
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 18:09:20 +0100 (CET)
Received: from localhost ([::1]:33248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzidb-00020p-4H
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 12:09:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziJA-0000zx-G3
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:12 -0500
Received: from [2607:f8b0:4864:20::436] (port=43933
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziJ3-0007fT-0t
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:12 -0500
Received: by mail-pf1-x436.google.com with SMTP id 196so8740020pfw.10
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 08:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qQ0I9rAWgkrU2eJcY8Ph2P35NmJRfaSlHBZfKDlj2Eg=;
 b=Qn6aKaHo1B1zexQcQcGKT/CaKUoQ9v7EBksw3r4cAZ+yuMYr3YWTAYP2ykntSbaXEm
 1bhGL/lMoeDBB+QjTztcGnNUxb2esBOy6apn4hT8QhVZ5kziTdD8D3Nq48/giDgdNIZE
 CPh5KyhNUWocXPYM1PvCUrWI6liqbKh2t7Cdq2ht+aKrU0D1uTHkW8bzfU/8pOktthlr
 dxClANQPGVbEBjei8Qf/c/i+JUrowwkzI7cA6fUlnLkp5OCoLCCa3nA7deuRm5m1aoKg
 phuRtiURMpZddNEWD4NyYaSdPVor6IHbVAGKygmoH3BYCO+xGUkw7WBKCiqCSkj9re8q
 jqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qQ0I9rAWgkrU2eJcY8Ph2P35NmJRfaSlHBZfKDlj2Eg=;
 b=4kCUgSpSBolydKzmecr6gDFrnmbg0to3oKlfunbbrR1qoz4bmessUJUtk9RnsAdWMM
 KQseuZIYKOAUPFnfahe8GIoV3yKrHlq8QAAiqBXymXmacsH2qlQ3IiEdiegzdWOgSGny
 Lm4VEQTyP3j9ogpcA/L9VJGxiDt70NJ0RNsmkAiAoFy2cAddB7SFuZFjPLn1mmsHi6Fk
 bZKIHIoN6fkAVBrh5vG/UFEJq2tj91Vqu1yNEJZvQA+ROmoR9LHVB12L/VYjRGDxVu2r
 8yfevCIlSizhs2yBZbQwpiUOiZD69KbyKA/4+/I0fkL3ZSsWOltYRpruSiJtwjtmB+8g
 /Rtg==
X-Gm-Message-State: AOAM530nDdgQU0SEb4KnJUzyJjC8p6Ao9Mf/UD7ukw3jY7qIK5Qh7Vci
 WBxNaTqedCsYDh1kGUryJ/6mnbBl9w/t3Q==
X-Google-Smtp-Source: ABdhPJxezXFeImLV4xpm+eJ18pp44spjlxHxTxxozZrAuRAxbRdnlfoCtwwQvaD3x0axv3xlZZQG7g==
X-Received: by 2002:a63:284:: with SMTP id 126mr3639180pgc.328.1640105283613; 
 Tue, 21 Dec 2021 08:48:03 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id b192sm2256818pga.35.2021.12.21.08.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 08:48:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/31] tcg/loongarch64: Register the JIT
Date: Tue, 21 Dec 2021 08:47:33 -0800
Message-Id: <20211221164737.1076007-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221164737.1076007-1-richard.henderson@linaro.org>
References: <20211221164737.1076007-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: WANG Xuerui <git@xen0n.name>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: WANG Xuerui <git@xen0n.name>

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211221054105.178795-28-git@xen0n.name>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 44 ++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 19bfc135f6..9cd46c9be3 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1631,3 +1631,47 @@ static void tcg_target_init(TCGContext *s)
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_TP);
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_RESERVED);
 }
+
+typedef struct {
+    DebugFrameHeader h;
+    uint8_t fde_def_cfa[4];
+    uint8_t fde_reg_ofs[ARRAY_SIZE(tcg_target_callee_save_regs) * 2];
+} DebugFrame;
+
+#define ELF_HOST_MACHINE EM_LOONGARCH
+
+static const DebugFrame debug_frame = {
+    .h.cie.len = sizeof(DebugFrameCIE) - 4, /* length after .len member */
+    .h.cie.id = -1,
+    .h.cie.version = 1,
+    .h.cie.code_align = 1,
+    .h.cie.data_align = -(TCG_TARGET_REG_BITS / 8) & 0x7f, /* sleb128 */
+    .h.cie.return_column = TCG_REG_RA,
+
+    /* Total FDE size does not include the "len" member.  */
+    .h.fde.len = sizeof(DebugFrame) - offsetof(DebugFrame, h.fde.cie_offset),
+
+    .fde_def_cfa = {
+        12, TCG_REG_SP,                 /* DW_CFA_def_cfa sp, ...  */
+        (FRAME_SIZE & 0x7f) | 0x80,     /* ... uleb128 FRAME_SIZE */
+        (FRAME_SIZE >> 7)
+    },
+    .fde_reg_ofs = {
+        0x80 + 23, 11,                  /* DW_CFA_offset, s0, -88 */
+        0x80 + 24, 10,                  /* DW_CFA_offset, s1, -80 */
+        0x80 + 25, 9,                   /* DW_CFA_offset, s2, -72 */
+        0x80 + 26, 8,                   /* DW_CFA_offset, s3, -64 */
+        0x80 + 27, 7,                   /* DW_CFA_offset, s4, -56 */
+        0x80 + 28, 6,                   /* DW_CFA_offset, s5, -48 */
+        0x80 + 29, 5,                   /* DW_CFA_offset, s6, -40 */
+        0x80 + 30, 4,                   /* DW_CFA_offset, s7, -32 */
+        0x80 + 31, 3,                   /* DW_CFA_offset, s8, -24 */
+        0x80 + 22, 2,                   /* DW_CFA_offset, s9, -16 */
+        0x80 + 1 , 1,                   /* DW_CFA_offset, ra, -8 */
+    }
+};
+
+void tcg_register_jit(const void *buf, size_t buf_size)
+{
+    tcg_register_jit_int(buf, buf_size, &debug_frame, sizeof(debug_frame));
+}
-- 
2.25.1


