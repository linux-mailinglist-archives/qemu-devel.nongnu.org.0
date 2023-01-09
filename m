Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8340661C24
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 02:53:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEhBh-0000kK-F1; Sun, 08 Jan 2023 20:42:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBf-0000jQ-It
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:42:55 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBd-0001Vi-Nt
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:42:55 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 v13-20020a17090a6b0d00b00219c3be9830so7808579pjj.4
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 17:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8+Kh3rqXdCacs3XVxM/U6nRtJh0Sr0T/rkkzzgRcDAI=;
 b=NlZFaD5lxjLMYTfBRIg+oEIAQQbbss6I7/NBJuEPaKm1q15m0PNcI8Yvu2eIn4sRuV
 4qtsydtVU10W8uIPV9Oc06n1FJsmOz2I460avyVEUemfY6hG6+PVx80L3YvMBlY8Vy3n
 fg9mLY6gNlzG4OetDP3654jJbrabssUwt5tk9ZrLF88SnTMsEwumFv7x77ugqA0rjJcs
 s1/4nrT/YjftXMcwrTN9m9Ih+5/N56FnVNmVIhDfEk5JUHzo8x6tNh7oFNqVXKkGbY/N
 HaaJHjObKpDStHSlJUB1oe51sWxDP2ffJuWDoD42o0PRjiyUNs87Ql4uHTdK5ZdO6gki
 AYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8+Kh3rqXdCacs3XVxM/U6nRtJh0Sr0T/rkkzzgRcDAI=;
 b=yK1oFaVcNVwXxbwG61MhpYOjV/rjxzL9ld2uOlZRMBYKC8uMLqO0lJM8ZBdiajVYfN
 H0V/k65thSOqk48yDtWn6UPnG5rgK0qkcl5eStWvdPZsQ04zw2HQC0SppbXElO9RfjVj
 8ti5QwQnNjtaE9ZjEtiVQsaAKUumHKGUjOZqlh4wquWwTRTHv4iGOLwwYvkUf83NFZjm
 CNofd/JC7cCpD5rDv6pg+wcxdi2jBOFH8YZMUR5yihKkaFhTg0XSJ8ZaHgjS/359SZU+
 3QwfPSTbfdc2KoJDiRCeLZ3KWJ1TA0GZYOiAcCIe74k2ih34mH6df53mNcW1vN14blN4
 eBrg==
X-Gm-Message-State: AFqh2kqtLEnIQIaRBpWAJXRIuy6xMcmqlkOA/1AEYodY+JVlnTYaiFmQ
 TTbNDkegEh+D7R6nf1Q6UHqiANxu/L7aBezX
X-Google-Smtp-Source: AMrXdXuMIJJmSoCT5NIF+5X+23907Tyy6uYWkC8xXbUAUoUIXLCwt3fVlOspJDWcvpBkPjBQoPcJMg==
X-Received: by 2002:a17:902:ead4:b0:189:c429:f615 with SMTP id
 p20-20020a170902ead400b00189c429f615mr62582833pld.1.1673228572337; 
 Sun, 08 Jan 2023 17:42:52 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a170902ca0d00b00178b77b7e71sm4743617pld.188.2023.01.08.17.42.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 17:42:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/22] tcg/i386: Remove unused goto_tb code for indirect
 jump
Date: Sun,  8 Jan 2023 17:42:28 -0800
Message-Id: <20230109014248.2894281-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109014248.2894281-1-richard.henderson@linaro.org>
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index feb257db01..c4ff59e9ee 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -2383,23 +2383,19 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     switch (opc) {
     case INDEX_op_goto_tb:
-        if (s->tb_jmp_insn_offset) {
-            /* direct jump method */
-            int gap;
-            /* jump displacement must be aligned for atomic patching;
+        qemu_build_assert(TCG_TARGET_HAS_direct_jump);
+        {
+            /*
+             * Jump displacement must be aligned for atomic patching;
              * see if we need to add extra nops before jump
              */
-            gap = QEMU_ALIGN_PTR_UP(s->code_ptr + 1, 4) - s->code_ptr;
+            int gap = QEMU_ALIGN_PTR_UP(s->code_ptr + 1, 4) - s->code_ptr;
             if (gap != 1) {
                 tcg_out_nopn(s, gap - 1);
             }
             tcg_out8(s, OPC_JMP_long); /* jmp im */
             s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
             tcg_out32(s, 0);
-        } else {
-            /* indirect jump method */
-            tcg_out_modrm_offset(s, OPC_GRP5, EXT5_JMPN_Ev, -1,
-                                 (intptr_t)(s->tb_jmp_target_addr + a0));
         }
         set_jmp_reset_offset(s, a0);
         break;
-- 
2.34.1


