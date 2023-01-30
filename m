Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E302681C52
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:06:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMbGH-00005c-NU; Mon, 30 Jan 2023 16:00:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbFr-0007pN-L9
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:59:55 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbFp-0005FZ-R5
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:59:55 -0500
Received: by mail-pg1-x52f.google.com with SMTP id e10so8574358pgc.9
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hsnVbtUsNvcT2lLRbZgtaNtUs4XL0a0c4I5MMD7HBSk=;
 b=xmEDgCwkvP6j36quHZASghdKDQmArklMRCSo3BHoK5FIF1GnHVYCH/kiG3Qhu1eBst
 nkfQjFBlQqlYn0tH1hAwM45+ZIBpcoGgGy+lomknNarKyuX5/oWf7u4zUL2lB0AbYUiB
 XfQEQBhSeBT6qh2PSsHEdIdILhD3026+xRPwD2YL5VdVF96qpxzmKWvy5+GjjMscMVik
 5+0b5/+8IxjQxZkAKzuCRmMkj6JG24lX9qgK81jinbQYODfbe+DgGt8Os1DJuR485NEP
 xi5QGauvhjfIS652NlVUREIXkO79gKozfvjeAnFmEDNKP5PPaVBHyGLi4tFBjWxj3+H6
 IW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hsnVbtUsNvcT2lLRbZgtaNtUs4XL0a0c4I5MMD7HBSk=;
 b=e3bWck5bsjgIWNf9LBiwFoeIu/XcoyhFJRxcs/IqsWy7ftVBtn/vbZ/ytLgG4dwBA3
 4kkpt7S2yOsVf6J1jTaepuNopCgUJlxRJojQCketDF3gZPEoXIPguditApKVUBHNv8MN
 3FMTdvoeymTy6ENzOqspp1lQqAsUm6txKuVR7EzzpBgiYm97nhk2+BMqEWx+F1IhDNr/
 CoQKIGwPCjjkTKCg3oiF8lLqn8+vhSco/2f1RCDI+kU5dQ3167Pe49VXfxSrXgtztA4k
 fNMEe7CDQW8qVqxeeJkwLa3tNTon785B13hacosOpSPb1C/f+Y1mn9/sqIbTLPt2pP7t
 6UwA==
X-Gm-Message-State: AO0yUKXd89CNWm5rjIPEKE4pqKjyNBUCINp6oxjlaF9+fwXI3yO8kTqQ
 /cGi7jXBmRmhbtM2QUaxz4LcfggeFFgjghQd
X-Google-Smtp-Source: AK7set8EvLWQ3qZ+cUOmzF3UVjGXmJrZUHDbJD/CzG6l/njACdEq2870Kmy7tcOHdaViVxrJgqIweg==
X-Received: by 2002:a62:fb1a:0:b0:593:e4b9:dc8b with SMTP id
 x26-20020a62fb1a000000b00593e4b9dc8bmr1755152pfm.27.1675112392373; 
 Mon, 30 Jan 2023 12:59:52 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 x10-20020aa79a4a000000b00593eb3a5e44sm102933pfj.37.2023.01.30.12.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:59:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	cota@braap.org
Subject: [PATCH 07/27] tcg: Remove TEMP_NORMAL
Date: Mon, 30 Jan 2023 10:59:15 -1000
Message-Id: <20230130205935.1157347-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130205935.1157347-1-richard.henderson@linaro.org>
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

TEMP_NORMAL is a subset of TEMP_EBB.  Promote single basic
block temps to single extended basic block.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h |  2 --
 tcg/tcg.c         | 19 +++----------------
 2 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 8786607510..ace910cf3b 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -429,8 +429,6 @@ typedef enum TCGTempVal {
 } TCGTempVal;
 
 typedef enum TCGTempKind {
-    /* Temp is dead at the end of all basic blocks. */
-    TEMP_NORMAL,
     /*
      * Temp is dead at the end of the extended basic block (EBB),
      * the single-entry multiple-exit region that falls through
diff --git a/tcg/tcg.c b/tcg/tcg.c
index fb9ab967ea..da02a180b1 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1258,7 +1258,7 @@ TCGTemp *tcg_global_mem_new_internal(TCGType type, TCGv_ptr base,
 TCGTemp *tcg_temp_new_internal(TCGType type, bool temp_local)
 {
     TCGContext *s = tcg_ctx;
-    TCGTempKind kind = temp_local ? TEMP_TB : TEMP_NORMAL;
+    TCGTempKind kind = temp_local ? TEMP_TB : TEMP_EBB;
     TCGTemp *ts;
     int idx, k;
 
@@ -1368,7 +1368,7 @@ void tcg_temp_free_internal(TCGTemp *ts)
          * silently ignore free.
          */
         return;
-    case TEMP_NORMAL:
+    case TEMP_EBB:
     case TEMP_TB:
         break;
     default:
@@ -1384,7 +1384,7 @@ void tcg_temp_free_internal(TCGTemp *ts)
 #endif
 
     idx = temp_idx(ts);
-    k = ts->base_type + (ts->kind == TEMP_NORMAL ? 0 : TCG_TYPE_COUNT);
+    k = ts->base_type + (ts->kind == TEMP_EBB ? 0 : TCG_TYPE_COUNT);
     set_bit(idx, s->free_temps[k].l);
 }
 
@@ -1909,7 +1909,6 @@ static void tcg_reg_alloc_start(TCGContext *s)
             break;
         case TEMP_GLOBAL:
             break;
-        case TEMP_NORMAL:
         case TEMP_EBB:
             val = TEMP_VAL_DEAD;
             /* fall through */
@@ -1939,9 +1938,6 @@ static char *tcg_get_arg_str_ptr(TCGContext *s, char *buf, int buf_size,
         snprintf(buf, buf_size, "loc%d", idx - s->nb_globals);
         break;
     case TEMP_EBB:
-        snprintf(buf, buf_size, "ebb%d", idx - s->nb_globals);
-        break;
-    case TEMP_NORMAL:
         snprintf(buf, buf_size, "tmp%d", idx - s->nb_globals);
         break;
     case TEMP_CONST:
@@ -2760,7 +2756,6 @@ static void la_bb_end(TCGContext *s, int ng, int nt)
         case TEMP_TB:
             state = TS_DEAD | TS_MEM;
             break;
-        case TEMP_NORMAL:
         case TEMP_EBB:
         case TEMP_CONST:
             state = TS_DEAD;
@@ -2809,9 +2804,6 @@ static void la_bb_sync(TCGContext *s, int ng, int nt)
                 continue;
             }
             break;
-        case TEMP_NORMAL:
-            s->temps[i].state = TS_DEAD;
-            break;
         case TEMP_EBB:
         case TEMP_CONST:
             continue;
@@ -3565,7 +3557,6 @@ static void temp_free_or_dead(TCGContext *s, TCGTemp *ts, int free_or_dead)
     case TEMP_TB:
         new_type = TEMP_VAL_MEM;
         break;
-    case TEMP_NORMAL:
     case TEMP_EBB:
         new_type = free_or_dead < 0 ? TEMP_VAL_MEM : TEMP_VAL_DEAD;
         break;
@@ -3853,7 +3844,6 @@ static void tcg_reg_alloc_bb_end(TCGContext *s, TCGRegSet allocated_regs)
         case TEMP_TB:
             temp_save(s, ts, allocated_regs);
             break;
-        case TEMP_NORMAL:
         case TEMP_EBB:
             /* The liveness analysis already ensures that temps are dead.
                Keep an tcg_debug_assert for safety. */
@@ -3890,9 +3880,6 @@ static void tcg_reg_alloc_cbranch(TCGContext *s, TCGRegSet allocated_regs)
         case TEMP_TB:
             tcg_debug_assert(ts->val_type != TEMP_VAL_REG || ts->mem_coherent);
             break;
-        case TEMP_NORMAL:
-            tcg_debug_assert(ts->val_type == TEMP_VAL_DEAD);
-            break;
         case TEMP_EBB:
         case TEMP_CONST:
             break;
-- 
2.34.1


