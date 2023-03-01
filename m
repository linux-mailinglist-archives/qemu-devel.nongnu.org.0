Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC826A65EA
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:58:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCfF-0003CU-03; Tue, 28 Feb 2023 21:57:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCfD-0003Ag-6z
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:55 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCfB-0003LL-G3
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:54 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so15829450pjh.0
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OGaAndSOVNml6Vg1GlNPZnbg1Tdeb/O6nFbkdqQhPlg=;
 b=Lac+m13BhK0FIZ5qNRzV83vW/Sxu65u2mrIE1JXJC1V3dJfGdzSSOlwsW4DnOBE2Eb
 GQJaQHcGHLSoNwVHrjKxQABNz5d7tpyT0li31jJzP88Hs8LlDoOpyNFWUkeoUb3dE10c
 dUQVS6mJgbD0V6ya+Vba4rB7ItHc6AtO2MMuApSfZ+ZBd8U+02Q2YAQ6cGJe+A5tTjAI
 08wfG4EZurVvnv+Zk2LcmkSwWi4ZUaIJYLHK0hvuISyEAyc8UqOHSM+G0CJZXSnZyWnG
 0qYOi66Bm6Qypn878akr8KCwwvq9nJVDuOa7a4jaxwDbDayaPwmIOwFVKPsnDkYpa5/T
 wtng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OGaAndSOVNml6Vg1GlNPZnbg1Tdeb/O6nFbkdqQhPlg=;
 b=5SuBYU8cIOxVTvF6FJd6drAKggASGTaPlqxJ9uzSYgn3Sd4TbMEUDHhUeJwqVAKJ36
 t9tQmewS4TK8oRcGs2fOzpwfbE7zepFHZbWaZEc/AOlrP/foD/5XZNTsilTlqfmxyLdi
 M13QiylNFOJCDZnxhw0qNJc35W7DlS3FrnwoOO0lLXcuHGljPzeCxjSUugjqp3Abns0c
 FXNwDsh6W2HPv3Pih6jMiCll5EruzwqQIQI7cT8j24E7NeGy0uVMPd8rJGhkSN0u60yN
 Z8SbNCf4bbppowxKJbnusKH2glaWwbkDw15BmgwwHsofYMcqYRI7F3ysUgltC97NG/Cd
 UEcg==
X-Gm-Message-State: AO0yUKVtwU6araUxLcSgf3YqDj5QjtoRYL14i6vvk/Ccs+acL10kDYTD
 Z8FPKQli9OCgEhPGsA343ZMACePic7OFskwVKNw=
X-Google-Smtp-Source: AK7set/dblgLT+4Yjlru/vavFSQqN4KfT7SNZOviUhwsPC6gFbTMJQei4YjZ1cd26Nkmnv37uVfz2Q==
X-Received: by 2002:a17:902:dac8:b0:19c:fc41:2dfd with SMTP id
 q8-20020a170902dac800b0019cfc412dfdmr5956090plx.29.1677639471953; 
 Tue, 28 Feb 2023 18:57:51 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:57:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 39/62] tcg: Remove TEMP_NORMAL
Date: Tue, 28 Feb 2023 16:56:20 -1000
Message-Id: <20230301025643.1227244-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
index 1dbb24294e..9be3632b94 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1257,7 +1257,7 @@ TCGTemp *tcg_global_mem_new_internal(TCGType type, TCGv_ptr base,
 TCGTemp *tcg_temp_new_internal(TCGType type, bool temp_local)
 {
     TCGContext *s = tcg_ctx;
-    TCGTempKind kind = temp_local ? TEMP_TB : TEMP_NORMAL;
+    TCGTempKind kind = temp_local ? TEMP_TB : TEMP_EBB;
     TCGTemp *ts;
     int idx, k;
 
@@ -1367,7 +1367,7 @@ void tcg_temp_free_internal(TCGTemp *ts)
          * silently ignore free.
          */
         return;
-    case TEMP_NORMAL:
+    case TEMP_EBB:
     case TEMP_TB:
         break;
     default:
@@ -1383,7 +1383,7 @@ void tcg_temp_free_internal(TCGTemp *ts)
 #endif
 
     idx = temp_idx(ts);
-    k = ts->base_type + (ts->kind == TEMP_NORMAL ? 0 : TCG_TYPE_COUNT);
+    k = ts->base_type + (ts->kind == TEMP_EBB ? 0 : TCG_TYPE_COUNT);
     set_bit(idx, s->free_temps[k].l);
 }
 
@@ -1910,7 +1910,6 @@ static void tcg_reg_alloc_start(TCGContext *s)
             break;
         case TEMP_GLOBAL:
             break;
-        case TEMP_NORMAL:
         case TEMP_EBB:
             val = TEMP_VAL_DEAD;
             /* fall through */
@@ -1940,9 +1939,6 @@ static char *tcg_get_arg_str_ptr(TCGContext *s, char *buf, int buf_size,
         snprintf(buf, buf_size, "loc%d", idx - s->nb_globals);
         break;
     case TEMP_EBB:
-        snprintf(buf, buf_size, "ebb%d", idx - s->nb_globals);
-        break;
-    case TEMP_NORMAL:
         snprintf(buf, buf_size, "tmp%d", idx - s->nb_globals);
         break;
     case TEMP_CONST:
@@ -2762,7 +2758,6 @@ static void la_bb_end(TCGContext *s, int ng, int nt)
         case TEMP_TB:
             state = TS_DEAD | TS_MEM;
             break;
-        case TEMP_NORMAL:
         case TEMP_EBB:
         case TEMP_CONST:
             state = TS_DEAD;
@@ -2811,9 +2806,6 @@ static void la_bb_sync(TCGContext *s, int ng, int nt)
                 continue;
             }
             break;
-        case TEMP_NORMAL:
-            s->temps[i].state = TS_DEAD;
-            break;
         case TEMP_EBB:
         case TEMP_CONST:
             continue;
@@ -3571,7 +3563,6 @@ static void temp_free_or_dead(TCGContext *s, TCGTemp *ts, int free_or_dead)
     case TEMP_TB:
         new_type = TEMP_VAL_MEM;
         break;
-    case TEMP_NORMAL:
     case TEMP_EBB:
         new_type = free_or_dead < 0 ? TEMP_VAL_MEM : TEMP_VAL_DEAD;
         break;
@@ -3859,7 +3850,6 @@ static void tcg_reg_alloc_bb_end(TCGContext *s, TCGRegSet allocated_regs)
         case TEMP_TB:
             temp_save(s, ts, allocated_regs);
             break;
-        case TEMP_NORMAL:
         case TEMP_EBB:
             /* The liveness analysis already ensures that temps are dead.
                Keep an tcg_debug_assert for safety. */
@@ -3896,9 +3886,6 @@ static void tcg_reg_alloc_cbranch(TCGContext *s, TCGRegSet allocated_regs)
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


