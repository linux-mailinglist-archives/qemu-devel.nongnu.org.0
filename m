Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD71463FFF3
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 06:45:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ymj-0002i7-MU; Fri, 02 Dec 2022 00:40:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymh-0002gf-2N
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:27 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymf-0003LQ-JX
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:26 -0500
Received: by mail-pf1-x432.google.com with SMTP id c15so3933194pfb.13
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 21:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xkHs/JNafN+YjGb6eAc9hA5RUp/EaWywLclAr9TKVEU=;
 b=JGTh5vi7oDP4GQoYiemlG+qGJ+xwxiyT01haKjIQ8RK6E95NsxjLbQLreWuVkGPn10
 npSIcZ0pUuVxQ5/PkayeVccjO36017Z7FEFnX2NP6981T/7JPveAqla3wHDV8O6vVf39
 3hbPCqUG1MrEIo8dQucgDRI//OW3ncHgFdHJqID5kw6NNJT5rbiFKLZqZOcpZRWuPVeX
 7lSbFw1LDyjC1cgakMBtNUJr+czQKtSJ0YJP2qpxAQ+Y1fKXfx87A8Xf/ik7rrnrE4t5
 7eYt65S3Y68FNO4Vl8pmun9QMprOqmE4IyHln/y3Nevv2H0zb/t81+5Y/NNT51SX5GuM
 oLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xkHs/JNafN+YjGb6eAc9hA5RUp/EaWywLclAr9TKVEU=;
 b=0zKVEb7ywpE2fNE1IEg58fmYDARVcGkrjeJprNgLLfCwNpzk//LZUZYoIpu6Qj5gRv
 zh+Gr3Xjvw8hMO0Jj8j3X1LN7P8uIEIaNZGIIOJ4Int4EpsqSM5H315wncWmQWRIiCG1
 HZsSVR18JN9AM2yLV5GFeAi9hIMbSOZ45OQg2dKdENvhfHcXHbSTNdwTI4RKtZ6g7UzC
 TLj0Mjy++ByJKO7ekacpGYSMvWmUWeGRI9ytam+EhIjHg0TUYCqIhLorE3vOx1BOp2AI
 oK8qDPMobgJhyfkrS6OYY2VP2y0GaXXptIr36mrDjlVtl+ZKsNS9aFp/y1MlK61NnenZ
 czhA==
X-Gm-Message-State: ANoB5pkC0mAO6k6x5zj1CTboSMhwdUu1b/Etd4IH+LpHV7+wKTMtQb51
 8xWJ7yvhppfDeyPyuIMh6HK0UdwbxTpZN9UF
X-Google-Smtp-Source: AA0mqf6FnAlyccSQ86I7nlDczuQ9bBSro1Umyr/G20OXVBJDci6ia3tBrFM9eTr4kVpnvLfzM+cqMw==
X-Received: by 2002:a63:ed4b:0:b0:477:786:b22b with SMTP id
 m11-20020a63ed4b000000b004770786b22bmr46711514pgk.195.1669959624897; 
 Thu, 01 Dec 2022 21:40:24 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b00186f0f59c85sm4637075plh.235.2022.12.01.21.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 21:40:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 25/34] accel/tcg/plugin: Use copy_op in append_{udata,
 mem}_cb
Date: Thu,  1 Dec 2022 21:39:49 -0800
Message-Id: <20221202053958.223890-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202053958.223890-1-richard.henderson@linaro.org>
References: <20221202053958.223890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

Better to re-use the existing function for copying ops.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/plugin-gen.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 77e6823d6b..a6aaacd053 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -415,11 +415,11 @@ static TCGOp *append_udata_cb(const struct qemu_plugin_dyn_cb *cb,
     op = copy_const_ptr(&begin_op, op, cb->userp);
 
     /* copy the ld_i32, but note that we only have to copy it once */
-    begin_op = QTAILQ_NEXT(begin_op, link);
-    tcg_debug_assert(begin_op && begin_op->opc == INDEX_op_ld_i32);
     if (*cb_idx == -1) {
-        op = tcg_op_insert_after(tcg_ctx, op, INDEX_op_ld_i32);
-        memcpy(op->args, begin_op->args, sizeof(op->args));
+        op = copy_op(&begin_op, op, INDEX_op_ld_i32);
+    } else {
+        begin_op = QTAILQ_NEXT(begin_op, link);
+        tcg_debug_assert(begin_op && begin_op->opc == INDEX_op_ld_i32);
     }
 
     /* call */
@@ -462,11 +462,11 @@ static TCGOp *append_mem_cb(const struct qemu_plugin_dyn_cb *cb,
     op = copy_const_ptr(&begin_op, op, cb->userp);
 
     /* copy the ld_i32, but note that we only have to copy it once */
-    begin_op = QTAILQ_NEXT(begin_op, link);
-    tcg_debug_assert(begin_op && begin_op->opc == INDEX_op_ld_i32);
     if (*cb_idx == -1) {
-        op = tcg_op_insert_after(tcg_ctx, op, INDEX_op_ld_i32);
-        memcpy(op->args, begin_op->args, sizeof(op->args));
+        op = copy_op(&begin_op, op, INDEX_op_ld_i32);
+    } else {
+        begin_op = QTAILQ_NEXT(begin_op, link);
+        tcg_debug_assert(begin_op && begin_op->opc == INDEX_op_ld_i32);
     }
 
     /* extu_tl_i64 */
-- 
2.34.1


