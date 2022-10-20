Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC736062A8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:16:09 +0200 (CEST)
Received: from localhost ([::1]:32902 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWKo-0002ll-UP
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:15:49 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWDt-0007ar-RK
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU8D-0005YR-QY
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:56 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:38781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU89-000196-Md
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:35 -0400
Received: by mail-pg1-x529.google.com with SMTP id 20so1884712pgc.5
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LMGG6u36Dw67iE/Juteia6nMKD7kG1VCYlvUM0ALFns=;
 b=eBRICGFW4YMVDZJXURArMwyIzk3MnMksaC8nmrqB5PXALRRN33GD+ZtUyZDJ8vFeVG
 Ej+/mD3nCO200/UycVi3fN4A0oFVVIP9ZCbtNO6WYyIazyB29HbG6NBGoBo2Fk/mLV7N
 fkHT+I629vFtFa1zWNlgw2gVu/gw1jZeww7quutu/PY74S1bIQ0wMu+UxxcWo489AOA8
 wStdfWyRwe4Xk0mzs/cktsbandvMZxP7bhJ1Ga2odN8sOVLCjlX+WDpa7utZmk5I9VJ8
 7GrSMDa8K9NiBX7REwWmJQLDKoiR7hG4JMSEwAl5jnO0PoCauWC/oMfFIdcA/K/BDZIh
 7QNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LMGG6u36Dw67iE/Juteia6nMKD7kG1VCYlvUM0ALFns=;
 b=VlhsPrWlO9Iimil7RMau9SnBzx2eGqw3lv9Ztu0viWEjjsOr/A1+RwCUKEPS5VUAcH
 oTLDHisVG1eI02gmTXO4qK5Iwi5Y64QmiOMy9V/7uPpoEXRDQBFXzjBfEyIMhoaj1wlL
 YCrxZv0q/Erd+J5spTGujyLexC02+cll1aYh89dd2BGadP3Un6TYrOfvni5WNFewisMc
 AmbhkcKnX3X9EWpuUvRtXw448g0L4HgMhfL8DtPrQJF4gp1J5iaW/jhBguPA3GRNK/A6
 qU/NSAObfTiHmuLXMAWs+thWCqphA6NFATl/sWbZ31UIrLlwf7fpEPy8o89KWm2XcvPM
 d7Yw==
X-Gm-Message-State: ACrzQf2f74oKfN6y86zJ2hNdBVwRpV6boKhz8toyluddy1mzhkLhAXjV
 GhRzCXZZUuxehU/ANqbDpI+hdCnZBF/xU1OH
X-Google-Smtp-Source: AMsMyM6nUN7oHzRDgGjFaHhu7dUwDZIwBBxVQLWH/PHAVUkCHULWwnFnVsvddsOVhFRNwkSp8VCwhg==
X-Received: by 2002:a63:e113:0:b0:439:e032:c879 with SMTP id
 z19-20020a63e113000000b00439e032c879mr11423272pgh.287.1666266872487; 
 Thu, 20 Oct 2022 04:54:32 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 w206-20020a627bd7000000b0056109e15638sm13065464pfc.54.2022.10.20.04.54.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:54:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 27/31] tcg: Add TCG_CALL_RET_BY_VEC
Date: Thu, 20 Oct 2022 21:52:38 +1000
Message-Id: <20221020115242.2301066-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115242.2301066-1-richard.henderson@linaro.org>
References: <20221020115242.2301066-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will be used by _WIN64 to return i128.  Not yet used,
because allocation is not yet enabled.  Since this is for
exactly one backend, go ahead and make the few changes needed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-internal.h        |  1 +
 tcg/tcg.c                 | 17 +++++++++++++++++
 tcg/i386/tcg-target.c.inc | 16 +++++++++++++++-
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index 1fe7bd7d5d..44ef51ca30 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -38,6 +38,7 @@ typedef enum {
     TCG_CALL_RET_NORMAL,         /* by registers */
     TCG_CALL_RET_NORMAL_4,       /* for i128, by 4 registers */
     TCG_CALL_RET_BY_REF,         /* for i128, by reference as first arg */
+    TCG_CALL_RET_BY_VEC,         /* for i128, by vector register */
 } TCGCallReturnKind;
 
 typedef enum {
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 47f1f906fd..2c7eece27f 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -768,6 +768,8 @@ static void init_call_layout(TCGHelperInfo *info)
                 cum.reg_slot = 1;
             }
             break;
+        case TCG_CALL_RET_BY_VEC:
+            break;
         default:
             g_assert_not_reached();
         }
@@ -4683,6 +4685,21 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
         }
         break;
 
+    case TCG_CALL_RET_BY_VEC:
+        {
+            TCGTemp *ts = arg_temp(op->args[0]);
+
+            tcg_debug_assert(ts->type == TCG_TYPE_I128);
+            if (!ts->mem_allocated) {
+                temp_allocate_frame(s, ts);
+            }
+            tcg_out_st(s, TCG_TYPE_V128,
+                       tcg_target_call_oarg_reg(TCG_CALL_RET_BY_VEC, 0),
+                       ts->mem_base->reg, ts->mem_offset + i * 4);
+            ts->val_type = TEMP_VAL_MEM;
+        }
+        break;
+
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 82c8491152..3b4b66c224 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -120,6 +120,13 @@ static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
             return TCG_REG_EDX;
         }
         break;
+#ifdef _WIN64
+    case TCG_CALL_RET_BY_VEC:
+        if (slot == 0) {
+            return TCG_REG_XMM0;
+        }
+        break;
+#endif
     default:
         break;
     }
@@ -1194,9 +1201,16 @@ static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
          * The gvec infrastructure is asserts that v128 vector loads
          * and stores use a 16-byte aligned offset.  Validate that the
          * final pointer is aligned by using an insn that will SIGSEGV.
+         *
+         * This specific instance is also used by TCG_CALL_RET_BY_VEC,
+         * for _WIN64, which must have SSE2 but may not have AVX.
          */
         tcg_debug_assert(arg >= 16);
-        tcg_out_vex_modrm_offset(s, OPC_MOVDQA_WxVx, arg, 0, arg1, arg2);
+        if (have_avx1) {
+            tcg_out_vex_modrm_offset(s, OPC_MOVDQA_WxVx, arg, 0, arg1, arg2);
+        } else {
+            tcg_out_modrm_offset(s, OPC_MOVDQA_WxVx, arg, arg1, arg2);
+        }
         break;
     case TCG_TYPE_V256:
         /*
-- 
2.34.1


