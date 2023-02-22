Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 757D969FF7C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 00:30:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUyWK-0000QR-HP; Wed, 22 Feb 2023 18:27:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWI-0000Pi-FM
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:30 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWG-0005JQ-QG
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:30 -0500
Received: by mail-pl1-x632.google.com with SMTP id ky4so11973435plb.3
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 15:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=044lOBdNN9k7zB6D1jhexzPP0pLmLoW054ztxYqMPtc=;
 b=hIhyRCJ3iMkQeG79fT2vqY9kjo7frLDA42vatHeW/fmGP8exVBWNNXcZeZ+pkln7eu
 x8fFUYzn18algtjxmUwIUMGaPs2Uf5sOvmBMRAipW1CKbPMzuLSa+Ggl+FRVW2EuR8j2
 9n9MAgvC9CExV6j1NWZYEynHTjAcRDuYVUHixucrHP9iV3whPF4hCXNCbNJswtmuPqcu
 vsxMtMt3ZwzXfp/UfLMoEdgt9t7IblmPo7/mrLrJmBGqDSb3f3ljt1sUGmpJCULgk23f
 DF30QS0hn8u1AEpSv8QmyQy8CaIoZtYFfMNp5cBP5J9XpiliXu/QUZv5rZaWSS3wXh7h
 zBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=044lOBdNN9k7zB6D1jhexzPP0pLmLoW054ztxYqMPtc=;
 b=yxtCpav2+qfV4t5edcha0/CmS1jaub5okEJ9laoqbSETy9G2nymbYx8zV7Sponp5Yq
 CfsqobzQltHLyzwafRBPCd7PKXUwSJw+PRbF0uu4MmkL0U4qRUvgHIL+XfJew1WltyXR
 vFRwq694HdpGdTCv4X8rD0bPcVxJZk4EAJpleX47+GEWQdQbzYd0m5Me0BlBUFfEryd/
 ivpN31WMmdJyOEuyHeQiWnjsNRqQs0eNOdq8ifZ/ESfqwmUuk/Ae5SwkYZ8v0xxBRn95
 m0qdv0UTRw8sEUoZvIEf8vaKfEcVyevxZfFe7+1Tld4RscQlp5y4I2MQoJsG+Re5xJLV
 dxIA==
X-Gm-Message-State: AO0yUKURbuhxWfEDxEDIpwYEj3eKb6cIvJRUPZ2ZklY0YvKyHVfuVBSp
 /tMIGSjDDc+jtJn7yyZdaL8nZnQl/t/sjNhe8KY=
X-Google-Smtp-Source: AK7set+d/6qrJHyFyJUa5V9k3EOFvi/adT0HwZQ2Onc5Lo7ucAwHTRCuRVHTh7KvrQf9wgiwPD7E4w==
X-Received: by 2002:a17:90a:1c5:b0:237:39b1:7b7 with SMTP id
 5-20020a17090a01c500b0023739b107b7mr5126469pjd.11.1677108447430; 
 Wed, 22 Feb 2023 15:27:27 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a17090ad49000b00234e6d2de3dsm5008918pju.11.2023.02.22.15.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 15:27:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 07/28] tcg: Remove TEMP_NORMAL
Date: Wed, 22 Feb 2023 13:26:54 -1000
Message-Id: <20230222232715.15034-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222232715.15034-1-richard.henderson@linaro.org>
References: <20230222232715.15034-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
index 8d4ce7bd1e..f52e9baf83 100644
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
@@ -3568,7 +3560,6 @@ static void temp_free_or_dead(TCGContext *s, TCGTemp *ts, int free_or_dead)
     case TEMP_TB:
         new_type = TEMP_VAL_MEM;
         break;
-    case TEMP_NORMAL:
     case TEMP_EBB:
         new_type = free_or_dead < 0 ? TEMP_VAL_MEM : TEMP_VAL_DEAD;
         break;
@@ -3856,7 +3847,6 @@ static void tcg_reg_alloc_bb_end(TCGContext *s, TCGRegSet allocated_regs)
         case TEMP_TB:
             temp_save(s, ts, allocated_regs);
             break;
-        case TEMP_NORMAL:
         case TEMP_EBB:
             /* The liveness analysis already ensures that temps are dead.
                Keep an tcg_debug_assert for safety. */
@@ -3893,9 +3883,6 @@ static void tcg_reg_alloc_cbranch(TCGContext *s, TCGRegSet allocated_regs)
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


