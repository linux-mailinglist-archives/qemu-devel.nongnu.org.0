Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78346655BFC
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 01:15:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9EP2-0002oc-44; Sat, 24 Dec 2022 18:58:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOq-0002RG-PX
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:58 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOp-0006Lh-4n
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:56 -0500
Received: by mail-pl1-x62c.google.com with SMTP id s7so8041314plk.5
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 15:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mg8MgGwO6jjwnW8nsumFgvs1cdVJMS+XlnPx9WvPnOA=;
 b=jVsHDW2dOsj9Uf9ClwroBVKqF4rtBnpBQ9zw9TuZdJ5Iq+O3j59xtERtroqKlLFWaJ
 wToULnB5bNRu7PJGAHOUWXS8BsmqCgc1vNpMM8vYsrgua2qz6VexWKmAzAS/N4z0MQgb
 AQg1BBgITQSU79QVyHDtTYvxY5Dj6AtEpjK9/ONbieWof3Q2ZbqwMaG961rRBXtkafXO
 2ROX+k4rm2tY3FRLIh9tCggJJ/M5QLEvXfhPArhMcqjvV2kWtQRKlzevpBNcQpf+vLSH
 a/5FvTMUukj/5mUfJBNNeDvCmixw+0fMnktj/sJm8qc/4zb/JY8vjJwYqQvgwfVjwoTk
 3/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mg8MgGwO6jjwnW8nsumFgvs1cdVJMS+XlnPx9WvPnOA=;
 b=P1AjQjx19VwZ8QK/EKbi9IJ9xUi6NN+lsIa/P1oSC0YrOySQk8POOJS4JDj8HkZs27
 AVyNVLDE7dWVjFLnb5IDCxBL+rSLC/L0Gc++xnZkIltovCuvK8IVWGYF3kHZw7qZgNeL
 SxNvxiw4Jdtz4HKMX20PTyO+k+D2zNU3r43vmbrScK4Idc5SowKpw9ebzuSN8gjowtnt
 clFd3oi1b0Nrt6ZtmoRqUKiyKp6fpkFvGC0RyPb3ksq9PM704i7B/ZCRKgdMM/y2sdJe
 79HLEhS8BuqQctjzAO003DjW+IWn5eU1u2v4qs9S9zOneFmaf2k2npR0piFz5dObUlfv
 fuqA==
X-Gm-Message-State: AFqh2kokimaLJd1VPagzy76DFXepvPuXJU+WyVWBjRSaQ0b081csKmR1
 x94IkGaITBIJVqe5EIF62Eozep0ztVuIG65K
X-Google-Smtp-Source: AMrXdXvTTYG8+6uHiwnLAhiHTTNI5I9xI/nUhVyR1ntt2sC74YRC8TtuPzvUfYN8fXqZur0TJImVQA==
X-Received: by 2002:a17:902:aa8e:b0:191:4575:48aa with SMTP id
 d14-20020a170902aa8e00b00191457548aamr14484923plr.11.1671926274440; 
 Sat, 24 Dec 2022 15:57:54 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 cp12-20020a170902e78c00b00187022627d7sm4599716plb.36.2022.12.24.15.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 15:57:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v5 34/43] accel/tcg/plugin: Use copy_op in append_{udata,
 mem}_cb
Date: Sat, 24 Dec 2022 15:57:11 -0800
Message-Id: <20221224235720.842093-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224235720.842093-1-richard.henderson@linaro.org>
References: <20221224235720.842093-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Acked-by: Alex Bennée <alex.bennee@linaro.org>
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


