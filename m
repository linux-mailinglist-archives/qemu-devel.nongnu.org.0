Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2DE6A3B06
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 06:58:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWDR-0003Ix-Oz; Mon, 27 Feb 2023 00:38:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCa-0002v1-Oi
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:37:33 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCX-0002bw-QI
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:37:32 -0500
Received: by mail-pf1-x430.google.com with SMTP id g12so2833011pfi.0
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u3LWtGSaR9SZMaOcttY5mYoHUtJxLxRAkcHm/oHuhko=;
 b=I2oquTATx9zNLVxKWLnTpU/CA/ActTQvCn/9y0kz1bK9PAsnQAo9fLykHPdmbqWqHm
 992iv+Ti/eFB9SE7xyNDtKBHAiJVc/wyAWBg0e4wtKk5Y/G2EP9yEFA22phMLlxd9QpL
 0olz2bUUUhiEYfzfngoq73OakZUTagaNRxEN7MJFoNbkX37MQPfaHmQp3+I3HU09sgGQ
 gkvPV1jLnJytEzgDR5x5HaJYA6R8tGsk572MfcUf8UUOycgatarT4f0WjeYkJACpCd6N
 qypNj944VLDbXBQj4HKf/PAAr6wNUO+55pUAKbRodczmHPOKHXaEfWIQ7RPgwiZr+LcJ
 aXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u3LWtGSaR9SZMaOcttY5mYoHUtJxLxRAkcHm/oHuhko=;
 b=518yXkSq91ru4V5Upz7rdS22Kfs9XsprskuEUP0nK0qPSUpLjaWDj4vs7QAqAiLl2Z
 9IKRIFgpnyfmnNB4RBPyOPC/fyxs6uHs6SNcVqBm4tmwCkeEG5CUA/QwGNZImDCOs9xv
 HE3eZIPQ1Lf6SMpn5gWlPb8zA13L2L+d66F1eYU4lkyQiOftMyXps1FGxJwPw5GbzRRR
 UhlAm5Ayg47EkBGti9sgKWSVGvv5/PfLDqqyPSmypAql9boF3+sEVuVNECRx/FqMHVm1
 t1eoxn4pScX3mAc2AZJP6L6abma+0+98gzBMfqsM5fQYsvbIZIedkzI11GHywuQgOXWd
 FDCA==
X-Gm-Message-State: AO0yUKXrhQ0RFDirqa4ooYJBGwnDSFcA6MoNIKMKLk9oVysC0FJZ7EhP
 fiLg1iq5U7pcsoeifb+juXklqwh+IubhnHoCvUc=
X-Google-Smtp-Source: AK7set8BWy8Nbm6eiuYfXtXzJtnMPR82is1PHWJFWNmMRJnG4mZQt9z7MEyGiwmdjYzk2SVqSA2C1g==
X-Received: by 2002:aa7:96dd:0:b0:5d5:9350:ae05 with SMTP id
 h29-20020aa796dd000000b005d59350ae05mr15996156pfq.32.1677476248372; 
 Sun, 26 Feb 2023 21:37:28 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:37:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 08/31] tcg: Remove TEMP_NORMAL
Date: Sun, 26 Feb 2023 19:36:38 -1000
Message-Id: <20230227053701.368744-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


