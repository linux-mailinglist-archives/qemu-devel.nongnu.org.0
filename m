Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA873A5E84
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:44:58 +0200 (CEST)
Received: from localhost ([::1]:58330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsiDK-0006yS-0q
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6v-0002MP-LE
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:21 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:40619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6n-0003Zv-5j
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:21 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 mp5-20020a17090b1905b029016dd057935fso9589252pjb.5
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 01:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=UZkn/bCz3YGcO9TqhXoosXO7opN8+jen9eeeiO+Mw8Y=;
 b=SSJlREGT/yv8Er9ROaPRLix0KZGEhoeElfqmFmPuh1LkGcO0KuZvpCZFgmCnNdB2Jn
 Xdn2eItMpgGbK/fImwcCHnafZPSlgRuhIA7qIIVfnymNhoTCW3oAaVC0Jw0C8L/Ucdyi
 IW8AZU1PfheTPYJdFCPGJCo9FtAYhk5KGFtWrhhpGdrT0PiIo4B4zeUj2ImePYFYM7cz
 awk0xU6kmEhWDvUZBlwXa10P6ejLhrQDuj2ney61sv/5FudCRs7HW2czRlA64/ikT5TU
 dliyR42zN7sst2wPh2y1fKPPJKo0LfpPxBhgbygX8FevVtq9G9Z1HTwkeSe1Q5hqVRQJ
 ZsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UZkn/bCz3YGcO9TqhXoosXO7opN8+jen9eeeiO+Mw8Y=;
 b=j2sjOsICCQKC3neNFBdMtiVBOTPkReH0XafKP9nUvIEUyYwVudjfeweDT5ElHikQ+e
 Esoy14CdW7i4bSFZLrBq6Vn40TipkX9tOFilLPgKCD59tm4LWYH9XlQjUU0SbkfmxlM8
 Tg8xErUfmClSoddfyGCKiXwGxW6RwWgv2alVj/XuOXJ4nBQSABRhVOm/ShsjJmZnfTq6
 uhN09tAPyFiGEE3t3g1qwn3PJwMPhsSg7pkKe0huznHoHqZPxx5/zVAAgCiEfkql/XSb
 0edUk1ShjeCxmxVVmKZqFA4JSvvfKrYujpdmSN0rM2q3+KfZJ+gevlKVPTcgCohkU9Cf
 bhFQ==
X-Gm-Message-State: AOAM530LcHaXeVVCCKs7HnZuArs9BekR+6vfG60I4TzlBtE1bo21ZEx/
 WtpxW06T3HqnHn6KxDWxxpAg9JCFWqLOHA==
X-Google-Smtp-Source: ABdhPJyac6wxzceVMefh0x8lrkLYBHtTW8NPasP0OJlpi6QdYKolTkoLyjBqsRaRX/mGGOnnOIbPdw==
X-Received: by 2002:a17:902:222:b029:11b:9cea:eea9 with SMTP id
 31-20020a1709020222b029011b9ceaeea9mr3816446plc.11.1623659891130; 
 Mon, 14 Jun 2021 01:38:11 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id h20sm2242022pfh.24.2021.06.14.01.38.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 01:38:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/28] tcg: Handle new bswap flags during optimize
Date: Mon, 14 Jun 2021 01:37:48 -0700
Message-Id: <20210614083800.1166166-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614083800.1166166-1-richard.henderson@linaro.org>
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Notice when the input is known to be zero-extended and force
the TCG_BSWAP_IZ flag on.  Honor the TCG_BSWAP_OS bit during
constant folding.  Propagate the input to the output mask.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 56 +++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 51 insertions(+), 5 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 37c902283e..3b6983fbef 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -354,10 +354,12 @@ static uint64_t do_constant_folding_2(TCGOpcode op, uint64_t x, uint64_t y)
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
@@ -1028,6 +1030,42 @@ void tcg_optimize(TCGContext *s)
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
@@ -1134,9 +1172,6 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(ext16s):
         CASE_OP_32_64(ext16u):
         CASE_OP_32_64(ctpop):
-        CASE_OP_32_64(bswap16):
-        CASE_OP_32_64(bswap32):
-        case INDEX_op_bswap64_i64:
         case INDEX_op_ext32s_i64:
         case INDEX_op_ext32u_i64:
         case INDEX_op_ext_i32_i64:
@@ -1150,6 +1185,17 @@ void tcg_optimize(TCGContext *s)
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


