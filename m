Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BCB681D35
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:50:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMc1S-0001uP-SU; Mon, 30 Jan 2023 16:49:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc1P-0001tx-Ji
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:49:03 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc1O-0005bg-0l
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:49:03 -0500
Received: by mail-pl1-x633.google.com with SMTP id d3so13065851plr.10
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=enoyLDYZPbuMXIEMCUDcqm9A2zJNeFfelrYBMwbxjgg=;
 b=LLTWegc1BbfoHUYPNNwxJ2Uvu2MWoeWnB9wizPJaEsCWp65nrehFFDn9pKL/P5Soy9
 r6KHa/iF8Vs0351KWptqt2XONkR1+XFhbCdQuiQ0Q39ajKIG9+/eeZBCOHBmG9j1iC+C
 2L18UMTy/o3faGmMxDh8MFou5nFl/nXNOopuQadgMKLwjpnNJHS9QSBG4UhECh14Nh44
 8U9i/F7S+4x8mzce+aXzOEjAVeBZph2jqUM7E9Iy9wO16Xmo7Y7dgjku0bjw9YwOMXpQ
 Gr2sevzw+ejZdLdhpAQYokvSFVdeYIftoT5Jw2y8s4U1BpHYWIrfElJjjbsvuRlrONth
 7Lwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=enoyLDYZPbuMXIEMCUDcqm9A2zJNeFfelrYBMwbxjgg=;
 b=aYLIQukvp3HXkwZqz/xJRZceaAoHhq4kMv0sGRfATuglYZRyvahwJBy38D5WMXkcYm
 mF//7LozN/nQLQd2xhAAbbgU9r6WPcChIap4PRllndtioBStJcP55bPqopQxFm0qzlax
 kEzXL35ZQSXajpTJgL8tS0YW69/zgM7bbTtsuqD8kLhacjDiD+Cqb+rk00hJdKXKJibZ
 NbzAJSMw+MpmCHYE8PAciZCv27iqD5qtlG1JTPS5ndtWjlnEg/DfuNFmokwDQwnuqDdk
 ho/IqPNF0gLVpUuKvhRK9Z8eJL9PvpyM+X2TPE6wIlEzpQwxHAgzEGKDSMQ+SWgvTp+W
 u0dw==
X-Gm-Message-State: AO0yUKUTJc2Q6IP8zdYpVQOwoKPJxjoun1Axx61t1qCmV2MTqHSx7xwd
 tnTGg5iPsI+pSiGWBzGlGfTy4doViuBWzVjH
X-Google-Smtp-Source: AK7set8VRjT2n9wKipKMz8L9a81jMMVO06Y1noFzhjWb/uhpHorUYWpS2xTFOFwvGUheWa7hRJB7Sw==
X-Received: by 2002:a17:90b:1b4a:b0:22b:f93b:b5c0 with SMTP id
 nv10-20020a17090b1b4a00b0022bf93bb5c0mr25283475pjb.44.1675115340513; 
 Mon, 30 Jan 2023 13:49:00 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a17090ad14400b00219220edf0dsm7451215pjw.48.2023.01.30.13.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 13:49:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v6 07/36] tcg: Add TCG_CALL_RET_BY_VEC
Date: Mon, 30 Jan 2023 11:48:15 -1000
Message-Id: <20230130214844.1158612-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130214844.1158612-1-richard.henderson@linaro.org>
References: <20230130214844.1158612-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

This will be used by _WIN64 to return i128.  Not yet used,
because allocation is not yet enabled.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-internal.h |  1 +
 tcg/tcg.c          | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index 2ec1ea01df..33f1d8b411 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -37,6 +37,7 @@
 typedef enum {
     TCG_CALL_RET_NORMAL,         /* by registers */
     TCG_CALL_RET_BY_REF,         /* for i128, by reference */
+    TCG_CALL_RET_BY_VEC,         /* for i128, by vector register */
 } TCGCallReturnKind;
 
 typedef enum {
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 5d321e7e82..edc6185bf4 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -752,6 +752,10 @@ static void init_call_layout(TCGHelperInfo *info)
             /* Query the last register now to trigger any assert early. */
             tcg_target_call_oarg_reg(info->out_kind, info->nr_out - 1);
             break;
+        case TCG_CALL_RET_BY_VEC:
+            /* Query the single register now to trigger any assert early. */
+            tcg_target_call_oarg_reg(TCG_CALL_RET_BY_VEC, 0);
+            break;
         case TCG_CALL_RET_BY_REF:
             /*
              * Allocate the first argument to the output.
@@ -4602,6 +4606,21 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
         }
         break;
 
+    case TCG_CALL_RET_BY_VEC:
+        {
+            TCGTemp *ts = arg_temp(op->args[0]);
+
+            tcg_debug_assert(ts->base_type == TCG_TYPE_I128);
+            tcg_debug_assert(ts->temp_subindex == 0);
+            if (!ts->mem_allocated) {
+                temp_allocate_frame(s, ts);
+            }
+            tcg_out_st(s, TCG_TYPE_V128,
+                       tcg_target_call_oarg_reg(TCG_CALL_RET_BY_VEC, 0),
+                       ts->mem_base->reg, ts->mem_offset);
+        }
+        /* fall through to mark all parts in memory */
+
     case TCG_CALL_RET_BY_REF:
         /* The callee has performed a write through the reference. */
         for (i = 0; i < nb_oargs; i++) {
-- 
2.34.1


