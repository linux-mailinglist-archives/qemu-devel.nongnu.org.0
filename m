Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A0F3B4D32
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 08:45:59 +0200 (CEST)
Received: from localhost ([::1]:49952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx24k-0000KJ-UQ
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 02:45:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vr-0002BM-5x
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:47 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:42496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vo-0000O2-Ex
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:46 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 13-20020a17090a08cdb029016eed209ca4so6847332pjn.1
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 23:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r6z5etdTT2JEFWUbs+95xLr9toUzAo+pdbx3zMIT52I=;
 b=E6aEOaIi4Ex76Bu8F0iMgYJfqXrfZLT/2Znj/+Equ38HqWaoqdqLpSLvmm2TFb+2t3
 HMOeqbX+ZQJnXVbDjMMzFjdWbDu0WSQ7/eoxFytSQNzbzJEQt/GWT8ABoIYpHh/MtDQR
 DlAfAuMQNZWH+4LO7d22GKByahVWpR0etreRuOuK4n8t7sOFC1qpaaYyr8v53GfkFZq9
 N1lvipSY6NvetiPUus4aHFjFh8Ih73q56TcBroPi+IM+t/syNdVQfKRfQXpKPR4a/UiG
 xzPH0WuEeWDym2aFCeBjVcTyoLobeHGgJiRIGnwX0yoNt29CpExEsUBwiuWqjeR90P5/
 UbCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r6z5etdTT2JEFWUbs+95xLr9toUzAo+pdbx3zMIT52I=;
 b=GlFJKl1KYm1SD9OS4W4knJHBaNf+kLJxyQQ3u2a293errcCpbyBXRZcqRr54zDONtQ
 52Se90RXvGQD9mp4dvfdh4j0+z+NjunIwQeGSOAMoInS6ZH7NXVVwhyhb8RPThiSRX3s
 TXormM61mr0C313s9g4Svdwb+vk9KfwagpN3wWcuK78XLcjmUHJ5csIcuwjcyqxCFRQD
 5AspwJq4uEn0hNcd8za+EXetPIMC7lPtR7TgcK6ydOOSlZA8hy+X+0Adx5azPYsAxVVG
 QcHn1VFYoM6laR6GpbWRg4qeOR6/bu4iPAmG5urz0g5p7ynmCi22KrUAt1mnDHae44A1
 zWhg==
X-Gm-Message-State: AOAM532FaoB6imjtiUW5T8SNrOR36X387kMF8IjmtOvgbYUA6fowUD8p
 EXS+0cDtsGpatkUtKJNW4aGVmKtfNKCGXw==
X-Google-Smtp-Source: ABdhPJxIyj2lvw+xykMICN9HqSIAcj/fWt6LxlCHudAIt0eFIvl4DNL9wns8CIg646ZIx/qPCHx6ug==
X-Received: by 2002:a17:902:b082:b029:113:e50d:c404 with SMTP id
 p2-20020a170902b082b0290113e50dc404mr12303313plr.5.1624689402882; 
 Fri, 25 Jun 2021 23:36:42 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v9sm7724201pgq.54.2021.06.25.23.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 23:36:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/29] tcg: Handle new bswap flags during optimize
Date: Fri, 25 Jun 2021 23:36:19 -0700
Message-Id: <20210626063631.2411938-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210626063631.2411938-1-richard.henderson@linaro.org>
References: <20210626063631.2411938-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Notice when the input is known to be zero-extended and force
the TCG_BSWAP_IZ flag on.  Honor the TCG_BSWAP_OS bit during
constant folding.  Propagate the input to the output mask.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 56 +++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 51 insertions(+), 5 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 211a4209a0..9876ac52a8 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -355,10 +355,12 @@ static uint64_t do_constant_folding_2(TCGOpcode op, uint64_t x, uint64_t y)
         return (uint16_t)x;
 
     CASE_OP_32_64(bswap16):
-        return bswap16(x);
+        x = bswap16(x);
+        return y & TCG_BSWAP_OS ? (int16_t)x : x;
 
     CASE_OP_32_64(bswap32):
-        return bswap32(x);
+        x = bswap32(x);
+        return y & TCG_BSWAP_OS ? (int32_t)x : x;
 
     case INDEX_op_bswap64_i64:
         return bswap64(x);
@@ -1029,6 +1031,42 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
+        CASE_OP_32_64(bswap16):
+            mask = arg_info(op->args[1])->mask;
+            if (mask <= 0xffff) {
+                op->args[2] |= TCG_BSWAP_IZ;
+            }
+            mask = bswap16(mask);
+            switch (op->args[2] & (TCG_BSWAP_OZ | TCG_BSWAP_OS)) {
+            case TCG_BSWAP_OZ:
+                break;
+            case TCG_BSWAP_OS:
+                mask = (int16_t)mask;
+                break;
+            default: /* undefined high bits */
+                mask |= MAKE_64BIT_MASK(16, 48);
+                break;
+            }
+            break;
+
+        case INDEX_op_bswap32_i64:
+            mask = arg_info(op->args[1])->mask;
+            if (mask <= 0xffffffffu) {
+                op->args[2] |= TCG_BSWAP_IZ;
+            }
+            mask = bswap32(mask);
+            switch (op->args[2] & (TCG_BSWAP_OZ | TCG_BSWAP_OS)) {
+            case TCG_BSWAP_OZ:
+                break;
+            case TCG_BSWAP_OS:
+                mask = (int32_t)mask;
+                break;
+            default: /* undefined high bits */
+                mask |= MAKE_64BIT_MASK(32, 32);
+                break;
+            }
+            break;
+
         default:
             break;
         }
@@ -1135,9 +1173,6 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(ext16s):
         CASE_OP_32_64(ext16u):
         CASE_OP_32_64(ctpop):
-        CASE_OP_32_64(bswap16):
-        CASE_OP_32_64(bswap32):
-        case INDEX_op_bswap64_i64:
         case INDEX_op_ext32s_i64:
         case INDEX_op_ext32u_i64:
         case INDEX_op_ext_i32_i64:
@@ -1151,6 +1186,17 @@ void tcg_optimize(TCGContext *s)
             }
             goto do_default;
 
+        CASE_OP_32_64(bswap16):
+        CASE_OP_32_64(bswap32):
+        case INDEX_op_bswap64_i64:
+            if (arg_is_const(op->args[1])) {
+                tmp = do_constant_folding(opc, arg_info(op->args[1])->val,
+                                          op->args[2]);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
+                break;
+            }
+            goto do_default;
+
         CASE_OP_32_64(add):
         CASE_OP_32_64(sub):
         CASE_OP_32_64(mul):
-- 
2.25.1


