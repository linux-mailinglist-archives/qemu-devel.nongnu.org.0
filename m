Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB406DB858
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 04:50:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkybc-000486-80; Fri, 07 Apr 2023 22:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkybT-0003RK-N6
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 22:46:59 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkybP-0007o1-Dt
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 22:46:59 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 r21-20020a17090aa09500b0024663a79050so1799886pjp.4
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 19:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680922014;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i9b6w9gWvCthNszMWt3+LpRjnTOnldmnZfV8N9JLl1Q=;
 b=mNqwgYQxaqFP05iSLGzuLd83cPZq4R+/hfCKIZS9ZdZ9yoYtHZYv8AutYLN8pLpMJA
 JoEsqJXY2DGdoXMQvpNu+LEzuhoo/yIrL8eZdsj3MhiQ0b5yuJ5h94tu+1J/GGbYt0ou
 Lz7YACRgSDN/Lton69PVNJuBrbheW+KRiw3Rt4Ze5QWFaS9cqM7hoxCDx3rL9xXRQule
 jKieLkzOY79x1yPVsVdY2nDfgTi+O/5V8VQuFmDAHmLEO/ujNTaMxsOnfITIUa+MpMqV
 lm+4bA8322Vk2iJ7heiwVRQwpl99Uxe/zW/VIlqfF3xHRZfzjby1aze25vlLUJUPaA0l
 Mn6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680922014;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i9b6w9gWvCthNszMWt3+LpRjnTOnldmnZfV8N9JLl1Q=;
 b=pjtlwiDpK6z6JdPJM0cNbeouyyYGM3pjB9yh9gwS0HKtBy2tpQx0mK62y1v0AyTIDE
 YS0Gfn7NGO6bIehlFLxr/UVjnak/u7dzELcb7P8HQSZ8Xjl9i16hRiFslm3sLkQaLfNj
 T5bH/iKWxfbvVuY7PzAFm4VsuKkxaEg1TnAvNPxqmC1whLm0FyASckck3EMZCtJGYfP6
 BCTxejNrbfB/hUb4unI2RYn5Ed00RSeN9iTMtd9NgFkCklmCfVGw4yk016fJ14NXsQUC
 dY61XzyK+b6yEOqIntP89PHGB9T7itzKxvg+qCmQSRgL0OdFCOWviuuIHzZE/GTW5zBr
 mH+w==
X-Gm-Message-State: AAQBX9eeYXhlImIiOiSuKQCcw0uYLIpyuVfB60P/Arka5k1BcDLKP625
 U12MXO0673qw6IhM8SHoqU2FEYu38qV/mj7muxY=
X-Google-Smtp-Source: AKy350afekGrs4Ilr5JSxEjrIeMg3QO5lc9jGk4llK0z0wI8yIvW6lzOaKbnr5QBDXk8HNSgbarVXw==
X-Received: by 2002:a17:902:ce8e:b0:1a2:56f4:d369 with SMTP id
 f14-20020a170902ce8e00b001a256f4d369mr793479plg.19.1680922014054; 
 Fri, 07 Apr 2023 19:46:54 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a170902761000b0019aa8149cc9sm3551981pll.35.2023.04.07.19.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:46:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 42/42] tcg/sparc64: Pass TCGType to tcg_out_qemu_{ld,st}
Date: Fri,  7 Apr 2023 19:43:14 -0700
Message-Id: <20230408024314.3357414-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

We need to set this in TCGLabelQemuLdst, so plumb this
all the way through from tcg_out_op.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index f3e5e856d6..05fc65faac 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1178,7 +1178,7 @@ static const int qemu_st_opc[(MO_SIZE | MO_BSWAP) + 1] = {
 };
 
 static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
-                            MemOpIdx oi, bool is_64)
+                            MemOpIdx oi, TCGType d_type)
 {
     MemOp memop = get_memop(oi);
     tcg_insn_unit *label_ptr;
@@ -1324,7 +1324,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
 }
 
 static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
-                            MemOpIdx oi, bool is64)
+                            MemOpIdx oi, TCGType d_type)
 {
     MemOp memop = get_memop(oi);
     tcg_insn_unit *label_ptr;
@@ -1351,8 +1351,7 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
 
     tcg_out_mov(s, TCG_TYPE_REG, TCG_REG_O1, addrz);
     tcg_out_movext(s, (memop & MO_SIZE) == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32,
-                   TCG_REG_O2, is64 ? TCG_TYPE_I64 : TCG_TYPE_I32,
-                   memop & MO_SIZE, data);
+                   TCG_REG_O2, d_type, memop & MO_SIZE, data);
 
     func = qemu_st_trampoline[memop & (MO_BSWAP | MO_SIZE)];
     tcg_debug_assert(func != NULL);
@@ -1637,16 +1636,16 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_qemu_ld(s, a0, a1, a2, false);
+        tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, a0, a1, a2, true);
+        tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I64);
         break;
     case INDEX_op_qemu_st_i32:
-        tcg_out_qemu_st(s, a0, a1, a2, false);
+        tcg_out_qemu_st(s, a0, a1, a2, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, a0, a1, a2, true);
+        tcg_out_qemu_st(s, a0, a1, a2, TCG_TYPE_I64);
         break;
 
     case INDEX_op_ld32s_i64:
-- 
2.34.1


