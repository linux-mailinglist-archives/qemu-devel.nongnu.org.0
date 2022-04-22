Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 801A150BEAF
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:29:17 +0200 (CEST)
Received: from localhost ([::1]:48998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhx5o-000648-L3
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwad-0008HV-Tx
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:03 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:41510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwab-0007yY-R0
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:03 -0400
Received: by mail-il1-x131.google.com with SMTP id h4so5417914ilq.8
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zCoM+nxCW+KhPaK3jdR/NXDiI5y1zUCOgbetADXQNIY=;
 b=uS1aPitEgiCNiYI8ZMc40KsbtT16ogFkT5/u41LVGeI7s8LsPHmrU12kDvKuhMr3pg
 aR+XYa9jtYkuxhe9RU32t/yilViTkoS5vtxBtzmeB/otr+QztyNCfCfql5LOEj2pLMMi
 72JiSpyfMPJDbDVTOStMa1W88WAXRxJtNdAiRIWX+8wAjH7NiH0wVkSHkOqSDv4/sEjf
 0fpRdBNyYy0baPKITvMSytqTHjfn4OZn4y9ta0SlWtDsghx4kNGLgumNTLvqqsWZToi4
 GIQFu+kczuyH5yMDdWv+UCAmTkmYJFNdiU7lp3AqzRTRnW7sv5oBsNOYqX9QUIJqJBRb
 wWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zCoM+nxCW+KhPaK3jdR/NXDiI5y1zUCOgbetADXQNIY=;
 b=s3huyu3EQ3/RkxufUcx9OY7K8DZ9gLv/C8ra4R7X1TcaqrsRhEQxpPizA+QIc2HSjs
 Bs2rbw1Ao1dhV8l5527r/eTNG54JoFhxbLWAeubkXe2lxb2Ic2KGTBU5w5ZcvOykfCJT
 Lappoej/n+noyxX8VEK+JUKLHgE9yPmW1ZUHYZ1EjbMTxOQIARZ9msb0/y4rTeN3Ro8p
 H20IY3C9Ol1hkX5zLy8kY0FSBKHGQyaUdV4dibipyvu9ifw0SJUCHom6Ey8vK2aDqx/X
 3rSy/GRQf/Urn3H96f3PLi0kr6Q2QhJEwppeLPeevZaAgv6JhRQgt3bCx3y5yPR38x1N
 qoWw==
X-Gm-Message-State: AOAM533kUuqG1fg5s+2p0JG3KN+v3wz6JZN7P4Ena4mhpOykszxO01AR
 ap3cgWZkyDb7idhzHBb6wFWZdtOoQYJfrc0h
X-Google-Smtp-Source: ABdhPJzRGgz12lP7eQ6fmd28r9am+nAdGBZ2EW/XgacQKTWujvzi801UvJoQA2NsMpUbObl2rqOKRQ==
X-Received: by 2002:a05:6e02:1be1:b0:2cd:5e70:a2ea with SMTP id
 y1-20020a056e021be100b002cd5e70a2eamr2487891ilv.204.1650646620733; 
 Fri, 22 Apr 2022 09:57:00 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a6b8b17000000b00649a2634725sm816380iod.17.2022.04.22.09.56.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:57:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 44/68] target/nios2: Split out helpers for gen_i_cmpxx
Date: Fri, 22 Apr 2022 09:52:14 -0700
Message-Id: <20220422165238.1971496-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do as little work as possible within the macro.
Split out helper functions and pass in arguments instead.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index a3c63dbbbd..86978ba47a 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -71,6 +71,18 @@ typedef struct {
         .a     = extract32((code), 27, 5), \
     }
 
+typedef target_ulong ImmFromIType(const InstrIType *);
+
+static target_ulong imm_unsigned(const InstrIType *i)
+{
+    return i->imm16.u;
+}
+
+static target_ulong imm_signed(const InstrIType *i)
+{
+    return i->imm16.s;
+}
+
 /* R-Type instruction parsing */
 typedef struct {
     uint8_t op;
@@ -268,15 +280,23 @@ static void gen_bxx(DisasContext *dc, uint32_t code, uint32_t flags)
 }
 
 /* Comparison instructions */
-#define gen_i_cmpxx(fname, op3)                                              \
-static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)         \
-{                                                                            \
-    I_TYPE(instr, (code));                                                   \
-    tcg_gen_setcondi_tl(flags, cpu_R[instr.b], cpu_R[instr.a], (op3));       \
+static void do_i_cmpxx(DisasContext *dc, uint32_t insn,
+                       TCGCond cond, ImmFromIType *imm)
+{
+    I_TYPE(instr, insn);
+
+    if (likely(instr.b != R_ZERO)) {
+        tcg_gen_setcondi_tl(cond, cpu_R[instr.b],
+                            load_gpr(dc, instr.a), imm(&instr));
+    }
 }
 
-gen_i_cmpxx(gen_cmpxxsi, instr.imm16.s)
-gen_i_cmpxx(gen_cmpxxui, instr.imm16.u)
+#define gen_i_cmpxx(fname, imm)                                             \
+    static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)    \
+    { do_i_cmpxx(dc, code, flags, imm); }
+
+gen_i_cmpxx(gen_cmpxxsi, imm_signed)
+gen_i_cmpxx(gen_cmpxxui, imm_unsigned)
 
 /* Math/logic instructions */
 #define gen_i_math_logic(fname, insn, resimm, op3)                          \
-- 
2.34.1


