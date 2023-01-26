Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E56267C402
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 05:43:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKu2A-00009a-IF; Wed, 25 Jan 2023 23:38:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu26-00007M-HR
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:38:42 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu24-0004P7-Ru
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:38:42 -0500
Received: by mail-pj1-x102b.google.com with SMTP id o13so538805pjg.2
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 20:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IayjR5zNq60WEhTjWTVhpDuC8xofWVLS8FB3KMbySkk=;
 b=E2aF/CV7GEEdbqctV19XbNXYt9hI1iB3wvMIN4VT7w9rbkLvrFVVooBOq9PBPXXYWF
 RYzBGuidaFITG335vizaLK7o8E+r6KHAvU1l0Cee5TJ6uI1epr9eRNyXrrHrDeCCdJLd
 sAYeKZy2COuMQFq391VTIGDIG27+ROCqx0Mhsa7RYuoIyN7k3wmvuJaDtF6EoWh8vBMn
 TRgWBLSmbAZSnbk5jQxR/8s5R6vmorNjO4clVLa1PjU0fLWieFnslSpBLoFzVG5MmS8L
 pRC/tWPGcBRqkLbIaQjJi+//bUgZGhhRArpGJSDHskoRFR+bmfHt0PElpweWKwqMDbV3
 gw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IayjR5zNq60WEhTjWTVhpDuC8xofWVLS8FB3KMbySkk=;
 b=pI0fYtgdXKGCnzp+Yw1wwKCF1fTszsTGAH+3r78T+kYYvUoE1juuJ+T7+MR7A2lUYB
 2CbK/Hf10QEv73HaJ2ca4zbUzCMukb4J/Qdrn2nJc4m0QWrH/7HkraZe6VvIZijq+0SA
 Nua6ogiBMBmuW+GhlQzVanrVv6+aVQye4AHpiRp8W7eLuFN4eO/Mu1AFxV8X9res7Wb+
 1MVHbGqy8wzO2FqCSU3JM+Gk6PySuZrUnjaMCw0xVdK2sOJo/yNJhiescPQxLZGViTSr
 oJ+SwOD4pmI62H2I9wP9YTlSQQAhNHtPlsOvDxosj7NgDtl9BUDg3wjtZmG5LTgeqbkz
 oirA==
X-Gm-Message-State: AFqh2krohY5XpdZnN2Mjou0yp3bLx5+ecgEzuOLjO3FHOTQgRyB/ycfL
 oZUEfQ0KkcVqU3/iWRn86w6Cb2Bg/brkI061vu8=
X-Google-Smtp-Source: AMrXdXtBSIOJEmjsGz3BOMCbXWrkyzRnxek8u7LUWNkSqE+aoJAVCBKLgjKG2OICE/K68h1K7nQgcg==
X-Received: by 2002:a17:90b:1112:b0:21a:1f5f:e798 with SMTP id
 gi18-20020a17090b111200b0021a1f5fe798mr36008904pjb.48.1674707918652; 
 Wed, 25 Jan 2023 20:38:38 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 s62-20020a17090a69c400b00228e56d375asm233376pjj.33.2023.01.25.20.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 20:38:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH v5 07/36] tcg: Add TCG_CALL_RET_BY_VEC
Date: Wed, 25 Jan 2023 18:37:55 -1000
Message-Id: <20230126043824.54819-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126043824.54819-1-richard.henderson@linaro.org>
References: <20230126043824.54819-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
index 72ac76926a..084e3c3a54 100644
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
@@ -4598,6 +4602,21 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
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


