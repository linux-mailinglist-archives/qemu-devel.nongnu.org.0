Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBF03B78B6
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:33:09 +0200 (CEST)
Received: from localhost ([::1]:59206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJTo-0007BR-5j
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwY-00045t-Ea
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:47 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:46769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwM-00030K-NB
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:46 -0400
Received: by mail-pl1-x632.google.com with SMTP id c15so21770pls.13
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r6z5etdTT2JEFWUbs+95xLr9toUzAo+pdbx3zMIT52I=;
 b=q56kToAOfVmr8IjoXyg3FeJOoSAuSDPX/psFzzrlpLc9Lowj60QOSLSNSxdvWOhNFy
 dyZNC3e1cRbFGZrWAypFQhaEqAO4dFGpaNCJLhRurSCVKFfHv6ltQw87PPoneBE46fmV
 YOK5qD2yZIsOAIXpeHmmgmvyU7z6gUQYTd7cNhXkPuFpTuXMtmspyLkh9k9aK9uWFnfV
 skfWhkV8nPS1mhNxYUpRQHu6rOVqidOhULsmo0D6j6CR/ET4Pq34z877PUmktuKo25LR
 QIJFAalI08wQZVlt+DKwnD0Sw7t8mdrMNkGh329io3trF5/YbT0ps4XmfQDWvSiqOv0H
 5BPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r6z5etdTT2JEFWUbs+95xLr9toUzAo+pdbx3zMIT52I=;
 b=gKPusYAfNdlN1sxO/t255FmDHwF5pO5pYbvW52V2ofabrRpyWevyLwcgHo1EFpvYuH
 8EGusw3nbLhxo+FFhmWg6Po4B6a1scVDVTmX62O6CVJkx9pyiBh/YIkhQ01IBKVF+kN6
 AY6OyWWvF7pQM4nD1Y6K9Pvu/FXXbUstaqCmSLK9w5JIoBf2fgdNzsoiyU85Hpu0I9yc
 98284LatXB3+P+NP4qSORnhJK/ajemuAQYvFEU7v8BEb6DgX7WJsgHX7SAbycxc4aM5O
 HNqkcocPsUr7V9Hy5EGQZIGL9Z6/6wUsReZ/mI4nEjm15g3bLL3uo/El7Z0Tkzcaw+dn
 hqkQ==
X-Gm-Message-State: AOAM531lDFRZlJnPeA1+d58gpNz7zeY5qI0kcEXCVXBrD0a9Ilw7J4CH
 J57A/X9gY1KbGZD0iGL6y+9TpOrrRkq1Kw==
X-Google-Smtp-Source: ABdhPJzqit1U8Jevt2kgInq5TprJu8r8jg1nf1bspKG7D1bC/x7HOagarsHPVwNok1WcTwRoH/tNEg==
X-Received: by 2002:a17:902:f1d3:b029:128:b8db:24dc with SMTP id
 e19-20020a170902f1d3b0290128b8db24dcmr17543235plc.47.1624993111114; 
 Tue, 29 Jun 2021 11:58:31 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 21sm18002849pfh.103.2021.06.29.11.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:58:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 51/63] tcg: Handle new bswap flags during optimize
Date: Tue, 29 Jun 2021 11:54:43 -0700
Message-Id: <20210629185455.3131172-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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


