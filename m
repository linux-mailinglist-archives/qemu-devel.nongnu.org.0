Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 599A56254D5
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 09:01:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOgN-000733-Vs; Fri, 11 Nov 2022 02:42:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOgJ-0006za-53
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:42:31 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOgH-0000JD-EV
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:42:30 -0500
Received: by mail-pf1-x42e.google.com with SMTP id i3so4210850pfc.11
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ykW3p8xDFujqs9enheSpuJYpD12Nxn1fGpKV437Ebps=;
 b=NTcjZpfWPvhdBvM+9dOQ18RqXlkZKZKtpAkFKOt5OK75jwc0K6r3w32QR8uUWy2QZq
 xr9SH8tyvVbklFph0kmNExIQwvxP0jMb4H0gJuBVKaM1BNrEh7tF1mSI9cIQhNC9B5vV
 FU+Bv8Ib8NIW0JxCV8U4tJ0Na2YDtUny8553V1SE5iL5eKTw6qwxymYPQAUckyNPAPLl
 bVL/m5jH8/8yRIxuVCQFAjb5LcU3a2UaMV/tN1ngKv1J21eY28D7IFybZEeTXVybdnps
 +MV5i/L9IIO1RBaPQmxOFMPy/eCQz//rCUidyC3ffqMzYHXnsCyT6aocaR7z7TSwxiTT
 F6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ykW3p8xDFujqs9enheSpuJYpD12Nxn1fGpKV437Ebps=;
 b=fiYls68NOYar6JFkPJLu34fITP7f33MiDKz/E/bpyNQP6NDbPvmQGVc2BPP515ouC8
 RgqvmU6yzmVgAYmjp+usmsdH/8CFLFbiNo81Uh+xPLYrhfHUxBiVqVIiZGhtJXgRNOPX
 RMkcG0uvi5mWq1NJPCwmLwFJ2jLJd7nutN4qcMbYuaPc1lASPzSd/gjHBy8KoeIPk/52
 9bj7rY6Q5o2m7TlwfzcnT17tQRxSV/PTcw4yUSNjALKnMHCn4fbalFxMWHf2lzmDQrFW
 85K1qscg22Zskd3lZX9xNbjIpJIyCNX9zCtOYMjmpYLb3ctyE4R9MhQ8VY2nlMDwfFAf
 XuHg==
X-Gm-Message-State: ANoB5pnxM+R5v3S7zC2PtiHmG8CUAeqgr+cZlT2DAV8DDdJb4lKNO5A0
 pEEVYTztw9q60LU2KfZKuWFiXSOPSOP6H8vn
X-Google-Smtp-Source: AA0mqf68lHMrUbCgGABufezbN5WfXFhN1Y83b3gec976u5wfU2P2WfRdaREfXlNHDdyv5fmveed5lw==
X-Received: by 2002:a63:e644:0:b0:459:7d5f:293e with SMTP id
 p4-20020a63e644000000b004597d5f293emr569379pgj.602.1668152547996; 
 Thu, 10 Nov 2022 23:42:27 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001754fa42065sm976069plg.143.2022.11.10.23.42.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 23:42:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 v3 35/45] tcg: Add TCG_CALL_RET_BY_VEC
Date: Fri, 11 Nov 2022 17:40:51 +1000
Message-Id: <20221111074101.2069454-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111074101.2069454-1-richard.henderson@linaro.org>
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
index 97c97158cd..3476721fbe 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -730,6 +730,10 @@ static void init_call_layout(TCGHelperInfo *info)
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


