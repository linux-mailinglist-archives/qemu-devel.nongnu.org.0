Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D00A564BE68
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:29:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Cn0-0000jE-NW; Tue, 13 Dec 2022 16:26:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cmv-0000gf-FQ
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:26:10 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cmt-0003H5-HS
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:26:09 -0500
Received: by mail-ot1-x32c.google.com with SMTP id
 db10-20020a0568306b0a00b0066d43e80118so689507otb.1
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 13:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mMNzNph6e5r2svno188/dE/TADl+oZbDomGCeY1Dcjs=;
 b=Uw+nC2BCJ0PNJERXJeyBgmvOCCYs3/S8CSvZBN4SEYCb+CWJTEVxdkbksyO8MBGu4k
 sRE6iFHjCERcZEK9MW1XsM/7k6x38R8P6W3X+n2fb9GrqR3umEzlvP+Yk2RFy65w17yT
 bMpvYJwXUkXz/sxNLpOsuS8YCwVO7z2V5HTgXFTlSAwW8bCQTCwpFYCA0DDTElpe0u+d
 Eq55ASjlSa2MZ+lY8Q6YY0VmQUePtK35k2xhZc/6zZSu7H2NwMYbwbatPs8CObwZNLRV
 nsaStPeSmEj9XX9lReVPgGQ6T8jJaaeNu5zQ37unIqWzfICiK9xQVw7ez+TpxvKPOJFl
 We4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mMNzNph6e5r2svno188/dE/TADl+oZbDomGCeY1Dcjs=;
 b=2rxk+9McnbZtVcIXfYyr5bTiXRfjAznIc3t5LEBGsxcUcdtRbjV27gERLaCcne72gc
 S7RgYMstpaw8KD+gjrcAXkpZlcGAozFrg78YrnCOZK+W4ANyd8cjH5jBlYiVWjTq6WbQ
 lvM/QdAXDR12pqvrAcojNIgeKGRvbQoQ7ewGRETXRKWG9T9r3CHizylJEEJ+AlKKJFwo
 b8c1qjhft9p8cKJ/8jiNEoQksMuH2YCRTw970guez/Vl0JsoItyzQxagGA58Zbn9Hmv7
 lqakKdR0ggliZ0I2temo5xJ/Z9fR+AEgIga5tcnNqcErSLLbFVjBdoRipdDFQj3gAOjT
 gq5Q==
X-Gm-Message-State: ANoB5pn1aIJnNmVrlcOsc2qJHwvaBhSFW43H9FE3crY78fN2D2X0PUbo
 WulVYSS1YE3Fscnd15SLjKR+yzfnmbpl24SU6BE=
X-Google-Smtp-Source: AA0mqf6Cj+hQ1kwShXd+L/Z+xt+2CKuIhaJ42T3SllqYqPoSqZgJyzoFHv5jZ0fWipuaOcNy3RD6Zg==
X-Received: by 2002:a9d:734e:0:b0:670:6b4d:78b5 with SMTP id
 l14-20020a9d734e000000b006706b4d78b5mr11024582otk.16.1670966763308; 
 Tue, 13 Dec 2022 13:26:03 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:c63:85ed:4256:8ad0])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a056808098700b0035c073aa0d8sm5006831oic.18.2022.12.13.13.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 13:26:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 19/27] accel/tcg/plugin: Use copy_op in append_{udata,
 mem}_cb
Date: Tue, 13 Dec 2022 15:25:33 -0600
Message-Id: <20221213212541.1820840-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213212541.1820840-1-richard.henderson@linaro.org>
References: <20221213212541.1820840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
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
Cc: Alex Bennée <alex.bennee@linaro.org>
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


