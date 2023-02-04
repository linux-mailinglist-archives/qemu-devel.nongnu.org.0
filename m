Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E92A68AB42
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:36:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOLTy-00054B-C2; Sat, 04 Feb 2023 11:33:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLTn-00051e-D1
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:39 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLTl-0002WZ-Mr
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:31 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 c10-20020a17090a1d0a00b0022e63a94799so11532076pjd.2
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 08:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VEYAVv3uTHjDLkvnKAH+q9p4eT7p7ztNQuvr2AdlOgU=;
 b=k3vcqAUnPMAUcW3FC8yHygmgVTZZdEbwAGc4/vR81wB13CNSrhbBbfLaqsN5mYCCHT
 aX5cSRa0YHgWKj44hTmZCGXyPfZIn8dzbQyLEdA4w6cf+S0LiPbI2fioVYXTsgwV76fX
 km6l8kPuCz6GLoI9irlyapNmRanBctb74FwLkGobi3QQqwo2forIVgx2g6aAqCNXJ9jk
 fIGCsivU7m7oJpCq9AttpTRKJQfBzpO6AQsFA/cCv0bsYhDMADLAe4f1KrxSXDdPEmuC
 aEhDbVLLiOR8HBzehVV5A9ym9IecBuXBkThqeMsgTyGbcPts9JrIDwarJpAn6aVZWfD5
 GWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VEYAVv3uTHjDLkvnKAH+q9p4eT7p7ztNQuvr2AdlOgU=;
 b=mN/BFzS4XdHA5MfDp5wC2bthiueslAbb6ZjgOzFYHtIi2jYjSChN+M14C5pcboG4vQ
 f9NBCDpLyuEXf4xLquO5An/pYubgRKjuHO1vLJrOuPikBDrKNwid+wXMpGce087VjoCr
 Bxds8OOrGRt9X+e9ZQ7rpBKQx9jiMIKbKwCMqVuLx7z4AUIXsnFhM6JCS8/m+BWqkWsU
 FXbnlEwmcSWQ4OhWVJN7KXGsXOxX/C5wcRv9znlVW6QvF9WQVt+BlwyQl7uDkr+Ja3XR
 DMDLwVTo6Y7Tx15q+THV7YHq2nV0wUTJh2+RVF2pJd7dgMarRx6zy45/KMGG2Qp4ePPP
 mPCg==
X-Gm-Message-State: AO0yUKXZd7sq9dGyIERnSkK2TcmihWQHpI+8/RQtpXBZ336Uh4WAuyfh
 rReFzU1LySTJpPpvMwMsv+uV+/m07Gh//ybM
X-Google-Smtp-Source: AK7set8Q0WC+CcFRQm3+/5vhkOCyvKmjRocYrjphGEfvhnD+GrJ5oW2lqUGeM/9VqyIGRt9dBaJp+w==
X-Received: by 2002:a17:902:e2d4:b0:194:a663:675b with SMTP id
 l20-20020a170902e2d400b00194a663675bmr12243490plc.19.1675528408246; 
 Sat, 04 Feb 2023 08:33:28 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a1709029a9300b00186b69157ecsm3660859plp.202.2023.02.04.08.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 08:33:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 09/40] tcg: Add TCG_CALL_RET_BY_VEC
Date: Sat,  4 Feb 2023 06:32:39 -1000
Message-Id: <20230204163310.815536-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230204163310.815536-1-richard.henderson@linaro.org>
References: <20230204163310.815536-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
index a77483eee8..098be83b00 100644
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
@@ -4605,6 +4609,21 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
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


