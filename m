Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 685DF6A2804
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:01:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqPX-0000Q4-Bp; Sat, 25 Feb 2023 04:00:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPV-0000Pm-5S
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:05 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPS-0004ql-Sc
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:04 -0500
Received: by mail-pf1-x430.google.com with SMTP id y10so823919pfi.8
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u3LWtGSaR9SZMaOcttY5mYoHUtJxLxRAkcHm/oHuhko=;
 b=S00lqzLnLLXbz1rsBLd437WBQxH/vVQhSJz2zq9h9sK0DNosiNF/494wUS9K3BNCsW
 hRNwvh5oI+ZTRT+F1AIm1ia4MyaNPxW4CwyLF+ZBmBuYuuCuSqe6YmZVZTXRw9uk0Gnv
 TgyLXmoYBMx02iO69CyVwV5JiUY/aukLCihJwQTMooUcwFvA5th985Dlg7ir+lH21WQ9
 vzRElRpu/dGVNw6yKsn6mec8f/tlzgk9xz7caWlbQWug75mtwQ+WARAHOxm6S1OS1bmB
 VPwl1HpPdO1U34XZpJDalfFBxDjjkLzutBCp2jL47hWVMgMSh/KF5ridQmrb7N3fzKRh
 bpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u3LWtGSaR9SZMaOcttY5mYoHUtJxLxRAkcHm/oHuhko=;
 b=IBsTeWBbQt8Vj6V+/5zuzN2mf0lY02FvPqrP7Lpj4x+69ow1rlT4V8ETMlMS8Y4XUx
 r2WWB7Rdqve26vlb6x2e7GaTwDJeloTc6xL0aKyLdtIMmzRysjhW+Hcpln7Ge2EONmuM
 9UjJ4EKN76Dog76Uf1nJ92KF0xWFpfBzzZHcoNtgjC9ziG3RvIccs4Q4Xj4wuZ418RRZ
 TB6qcLsmChl9A3AvmtNssEabhGZmze8Eb1oiy5XuuHPES6y9495bAP+fS9cmIfuwkUme
 iyNhydnl3HVLPNYdbXHMbyMKj/XaPK2NvTLf/vGRwfvcmv2qhYThJ0BLQYy1WNHbMtvC
 tGeQ==
X-Gm-Message-State: AO0yUKUXloD77h7IBjasMmHU3zMMyIzER/7tXOH02d61PZ/Ljl586U8v
 OPaR39kugNUu0+43q1OgMLRgzt9DXdXaHEOmWhY=
X-Google-Smtp-Source: AK7set+/kM0XwhrnA5EJsholjzeqchOuVJYo767+ZLe2f8MBw90e43s+n85sCNvb09fc1ZN9lIudNQ==
X-Received: by 2002:aa7:8bcf:0:b0:5db:4373:c3c7 with SMTP id
 s15-20020aa78bcf000000b005db4373c3c7mr8728778pfd.20.1677315601378; 
 Sat, 25 Feb 2023 01:00:01 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a639251000000b00502ecb91940sm715546pgn.55.2023.02.25.01.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:00:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 08/30] tcg: Remove TEMP_NORMAL
Date: Fri, 24 Feb 2023 22:59:23 -1000
Message-Id: <20230225085945.1798188-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225085945.1798188-1-richard.henderson@linaro.org>
References: <20230225085945.1798188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h |  2 --
 tcg/tcg.c         | 19 +++----------------
 2 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 2010e746ca..02d5cfc049 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -431,8 +431,6 @@ typedef enum TCGTempVal {
 } TCGTempVal;
 
 typedef enum TCGTempKind {
-    /* Temp is dead at the end of all basic blocks. */
-    TEMP_NORMAL,
     /*
      * Temp is dead at the end of the extended basic block (EBB),
      * the single-entry multiple-exit region that falls through
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 6646770268..7ffd4a4f28 100644
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
 
@@ -1911,7 +1911,6 @@ static void tcg_reg_alloc_start(TCGContext *s)
             break;
         case TEMP_GLOBAL:
             break;
-        case TEMP_NORMAL:
         case TEMP_EBB:
             val = TEMP_VAL_DEAD;
             /* fall through */
@@ -1941,9 +1940,6 @@ static char *tcg_get_arg_str_ptr(TCGContext *s, char *buf, int buf_size,
         snprintf(buf, buf_size, "loc%d", idx - s->nb_globals);
         break;
     case TEMP_EBB:
-        snprintf(buf, buf_size, "ebb%d", idx - s->nb_globals);
-        break;
-    case TEMP_NORMAL:
         snprintf(buf, buf_size, "tmp%d", idx - s->nb_globals);
         break;
     case TEMP_CONST:
@@ -2763,7 +2759,6 @@ static void la_bb_end(TCGContext *s, int ng, int nt)
         case TEMP_TB:
             state = TS_DEAD | TS_MEM;
             break;
-        case TEMP_NORMAL:
         case TEMP_EBB:
         case TEMP_CONST:
             state = TS_DEAD;
@@ -2812,9 +2807,6 @@ static void la_bb_sync(TCGContext *s, int ng, int nt)
                 continue;
             }
             break;
-        case TEMP_NORMAL:
-            s->temps[i].state = TS_DEAD;
-            break;
         case TEMP_EBB:
         case TEMP_CONST:
             continue;
@@ -3572,7 +3564,6 @@ static void temp_free_or_dead(TCGContext *s, TCGTemp *ts, int free_or_dead)
     case TEMP_TB:
         new_type = TEMP_VAL_MEM;
         break;
-    case TEMP_NORMAL:
     case TEMP_EBB:
         new_type = free_or_dead < 0 ? TEMP_VAL_MEM : TEMP_VAL_DEAD;
         break;
@@ -3860,7 +3851,6 @@ static void tcg_reg_alloc_bb_end(TCGContext *s, TCGRegSet allocated_regs)
         case TEMP_TB:
             temp_save(s, ts, allocated_regs);
             break;
-        case TEMP_NORMAL:
         case TEMP_EBB:
             /* The liveness analysis already ensures that temps are dead.
                Keep an tcg_debug_assert for safety. */
@@ -3897,9 +3887,6 @@ static void tcg_reg_alloc_cbranch(TCGContext *s, TCGRegSet allocated_regs)
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


