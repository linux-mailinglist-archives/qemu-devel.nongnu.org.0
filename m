Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A05A661312
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 03:38:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pELZE-0004o5-9U; Sat, 07 Jan 2023 21:37:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZC-0004nW-Px
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:37:46 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELYw-0004Y1-4i
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:37:46 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 o7-20020a17090a0a0700b00226c9b82c3aso5820227pjo.3
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 18:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KwGYqVGD9ayC3AoH0H/svPpb9D46lwJjNWaf8TUEnLU=;
 b=wo92Lmrg8YD5vmSAR4Njag3d7RjIflVg0qFT/FuisA8HWhC99wUN6pl72nAHTHIXC1
 m9qx2+ZH893MqiWmY+ZKAOMKIMOybMJ+CNP82Wn/2U7Ihku+KQJz9oddghm+k6QqLbY+
 /T+hysSGmq6i9kOGePI8M25ZlcAb3W0eub1ZvUInIqI3bK8DMIOukN2Y2RUEWTjchQPr
 YPp/mdD+aqWKlC8zPhN1Xn7PbIGuuyXS3Q8tzsHSWvU836rbpVaBHHKMEpfeySPrJps2
 kY/3EqK4L5ZHCyGHndh7yLAvasBEFFEYxYjbAs4XolIH+si8uitooS3Bh0G+wzyi4RCp
 6tzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KwGYqVGD9ayC3AoH0H/svPpb9D46lwJjNWaf8TUEnLU=;
 b=HpU53WWec+v6iKuQbKUMhhjfRSvH6cYLzv2DYAgcuvdOJqcEuMZ8cpJpwXo7tA7+yu
 BVYd/BmCyaSabzAjCo3eIiEmv14uK96RtY0+3Ac+hDbbap+C34J4uYS0lQdgghBD3quZ
 Ia0SU/qVApe+BVt6jmVGlvSDpBcrOiGuxpN4JilW0ROyGHxmSzjolcHT/XPdmSg/xVTs
 TL99462no4QkUep49iK6vSXNYsAaQ7uc7MB6Qvvq5pFb2IHyQzwcEmh10PKucFY8Bd6W
 CiVbiu+bNhCqQ6K8vGkmryASTF8i1lbSwtpzB8sM7083V+c5hUaIb8PvSX8SUmMHDGTz
 F2iA==
X-Gm-Message-State: AFqh2kpBk4jVpaeZ4kWfzWhCSRpZCqMDU3clPsAaLmQ19kcKrWs+TnI9
 nAC8Bt+dLTjZp3oqbw3T/j20gDkzq5KSC67+
X-Google-Smtp-Source: AMrXdXuvchFuNHxD5uxFyiEdD06AjVAaZQm4Sg+cipC99x3zOt9lqSTMkfEKHS3DFSMNh8ifrvfB2Q==
X-Received: by 2002:a17:902:7c08:b0:193:13fc:8840 with SMTP id
 x8-20020a1709027c0800b0019313fc8840mr6381304pll.21.1673145448869; 
 Sat, 07 Jan 2023 18:37:28 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
Subject: [PATCH v4 07/36] tcg: Add TCG_CALL_RET_BY_VEC
Date: Sat,  7 Jan 2023 18:36:50 -0800
Message-Id: <20230108023719.2466341-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
index 092cdaf422..c032606b21 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -731,6 +731,10 @@ static void init_call_layout(TCGHelperInfo *info)
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
@@ -4576,6 +4580,21 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
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


