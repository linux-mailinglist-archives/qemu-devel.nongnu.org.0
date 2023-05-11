Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF66B6FED90
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:11:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1Ip-0006mv-ST; Thu, 11 May 2023 04:05:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1Ib-0006PK-LX
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:17 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1IU-0000wF-Dg
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:17 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-50bcb4a81ceso14613456a12.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792308; x=1686384308;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QD1cfplkf+/IZwEsl1xHBR+T6wK07Cr9vNJTvgqMw3Y=;
 b=Bq3V9m833qx+cQJhZXR00GsloJe1rd9yiq3Wo4i5lbs0J/GP8kUC5x5Hu9yTL5c070
 IW+cYCXR/IIwmaycSL+C16xsNv2eDFxTX454T05kVyiuXTouinGbqBhW/mdvlPz5oZVG
 TdUw8AmU0as08J0Tc4cfWoj+hua99g2YleXuUuHHUnFJTWHBxi1WzT2iZrjp/4akJk+O
 B8R7cR/XrmXlFrNqIW8eVTUYXaAW1ToG1Lo6bmiPt2C3lxx4ojR6NE6a3kCyRwDut5EV
 QnGKxpog7DuLd+7GABV/6ZKUxYj9rre+aLtUp4YKwK3FZqu/4IPDWWoUJBA8TLWHShQF
 RIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792308; x=1686384308;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QD1cfplkf+/IZwEsl1xHBR+T6wK07Cr9vNJTvgqMw3Y=;
 b=ZeOATaQ/vEDEU3LDk4+e4/XYwkC8VjXj08ikFVVpqcmrIuYr9lXFBC67ENLm5Sz21X
 hL49xlgz2h/0sHxLbnsroaRk1dIvawl+9fh0slfn+0lUBrPcRAAnnTeu6mew78Iwohf4
 G76KDCVwjn28AtZUlyen7634KeZ+fhM7hHAbui80vS3Ekh9fNauGxMHpi+gNtKv/+PHh
 vpjF2+2E84sffN3bjr5MbW18QtBI6Yev2mxBxCeK09U5zTAiIKCrShI3C7PIHfRELfF/
 yrkQrQPp9toy3JnBfzYWJ5uRddn67urpqBPFszkeYxFztiYvTXFmLxAn1RGm6Z5wKJvR
 UfQw==
X-Gm-Message-State: AC+VfDxBGPaxrDrVMEPPr0G6QiR++oqlmb31maDd0FD2Px7+2WjEXb3y
 vfkS5fKl5HDfPQ664aqfl8wFYSne6JonYm1GPocl9A==
X-Google-Smtp-Source: ACHHUZ4K+r1OoH/qhu8rfjqXw9d7NaCOp0TY626YM/y6y+39UVpCCC7VKq2vUh8sBCyo8TdaOA1xxg==
X-Received: by 2002:a05:6402:517b:b0:4fa:b302:84d4 with SMTP id
 d27-20020a056402517b00b004fab30284d4mr16746120ede.13.1683792308238; 
 Thu, 11 May 2023 01:05:08 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 i12-20020aa7c70c000000b0050bd7267a5csm2662095edq.58.2023.05.11.01.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:05:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 25/53] tcg/loongarch64: Convert tcg_out_qemu_{ld,st}_slow_path
Date: Thu, 11 May 2023 09:04:22 +0100
Message-Id: <20230511080450.860923-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
and tcg_out_st_helper_args.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 37 ++++++++++----------------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 2f2c34b930..60d2c904dd 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -824,51 +824,36 @@ static bool tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
     return reloc_br_sd10k16(s->code_ptr - 1, target);
 }
 
+static const TCGLdstHelperParam ldst_helper_param = {
+    .ntmp = 1, .tmp = { TCG_REG_TMP0 }
+};
+
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
-    MemOpIdx oi = l->oi;
-    MemOp opc = get_memop(oi);
-    MemOp size = opc & MO_SIZE;
+    MemOp opc = get_memop(l->oi);
 
     /* resolve label address */
     if (!reloc_br_sk16(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
-    /* call load helper */
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A0, TCG_AREG0);
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A1, l->addrlo_reg);
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A2, oi);
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A3, (tcg_target_long)l->raddr);
-
-    tcg_out_call_int(s, qemu_ld_helpers[size], false);
-
-    tcg_out_movext(s, l->type, l->datalo_reg,
-                   TCG_TYPE_REG, opc & MO_SSIZE, TCG_REG_A0);
+    tcg_out_ld_helper_args(s, l, &ldst_helper_param);
+    tcg_out_call_int(s, qemu_ld_helpers[opc & MO_SIZE], false);
+    tcg_out_ld_helper_ret(s, l, false, &ldst_helper_param);
     return tcg_out_goto(s, l->raddr);
 }
 
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
-    MemOpIdx oi = l->oi;
-    MemOp opc = get_memop(oi);
-    MemOp size = opc & MO_SIZE;
+    MemOp opc = get_memop(l->oi);
 
     /* resolve label address */
     if (!reloc_br_sk16(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
-    /* call store helper */
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A0, TCG_AREG0);
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A1, l->addrlo_reg);
-    tcg_out_movext(s, size == MO_64 ? TCG_TYPE_I32 : TCG_TYPE_I32, TCG_REG_A2,
-                   l->type, size, l->datalo_reg);
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A3, oi);
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A4, (tcg_target_long)l->raddr);
-
-    tcg_out_call_int(s, qemu_st_helpers[size], false);
-
+    tcg_out_st_helper_args(s, l, &ldst_helper_param);
+    tcg_out_call_int(s, qemu_st_helpers[opc & MO_SIZE], false);
     return tcg_out_goto(s, l->raddr);
 }
 #else
-- 
2.34.1


