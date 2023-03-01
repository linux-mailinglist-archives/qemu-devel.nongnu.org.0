Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9386A65F1
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:58:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCfB-0002qA-Fu; Tue, 28 Feb 2023 21:57:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCf9-0002dw-Ly
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:51 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCf7-0003Jo-SI
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:51 -0500
Received: by mail-pl1-x633.google.com with SMTP id n6so11178949plf.5
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dEZb5B03EEmkiUjZIvzh3a844AlICh5cfJo+CxxAESY=;
 b=nfiJ0+TOQGpnHv4FQr7t1dq/XD1UpSPR1d7l/EBgkG4W1w50NuWlSOvjxd2eqRJyvu
 alqdhsXPBb1tPE1wJwNem5uWvHcPDyQ1LvYK7jm4OUpL+TaW2fJmeoL3Sg2Ghm8GgNJ7
 00JoClIowPtXlWnBq6VKwj7XDQ6SIdQeUOLZy6eIjXSSph6EI9AMlg3JCNx7XTjNa+qJ
 UGt9KyiZ4upb+LMQF9w+/55MUcmwj1gc88ywLD5g7fEtfV2o2Gt0NhF2Tx7QXjQl9ySE
 G0Uv+9jLBMKZKN7QenWqMj2vObJq/S4yVmjkMIuCyIxM5o+XbGSwzOaXeJ3Ns6orgeqU
 FoNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dEZb5B03EEmkiUjZIvzh3a844AlICh5cfJo+CxxAESY=;
 b=hrSDx63BprkGSDA1HzZYHRgdG2DzXiLQDV4+CH0fmv8+wCRK8LkfJOx0t6EfhGiefS
 kKAtMaYDApo0oXhn+C1S8BORnGc/+uasS8opIWXUtr7Q1EzThlsJRYFNLoHGeMNieyGc
 5/ETaiFjZNO8rRCf9a7DoxisVLI+QtT3SSeVwxqtrXFn22qJzXJA7qxI+gJmp/WVOIM0
 E8QArpnG9SjZrAnVUE8Z3OkIRl6cGZrkZYjq/MoDIwC8M+eluyHebjs5NsJxsZlka+3n
 5dF6LXPDom4KmPpyRfxVQ8CfvXHeXsbcuV/7dWpOMD1yvN3gZP/O0b4tG+UBZClPx/Os
 xlWw==
X-Gm-Message-State: AO0yUKWjnQLHg74UGjqEXErAS8PTUC30O6pwpz5UWA/K31oSS9LbovZ4
 zMNq3TKHL8o/NDb3GD8p9SVbpIt5/N40GJ6qiic=
X-Google-Smtp-Source: AK7set+5mwshum+AyoI18i9BOI04nUI8Yj/V2wvCQvUkuXp8YPqdVdEGrmwwRC5jMoBuwa24l+EgMA==
X-Received: by 2002:a17:903:64d:b0:19c:b2b2:a3b9 with SMTP id
 kh13-20020a170903064d00b0019cb2b2a3b9mr4038666plb.60.1677639469061; 
 Tue, 28 Feb 2023 18:57:49 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:57:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 37/62] tcg: Use noinline for major tcg_gen_code subroutines
Date: Tue, 28 Feb 2023 16:56:18 -1000
Message-Id: <20230301025643.1227244-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
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

This makes it easier to assign blame with perf.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 1a31a30a0d..71b6843eb1 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2635,7 +2635,8 @@ TCGOp *tcg_op_insert_after(TCGContext *s, TCGOp *old_op,
 }
 
 /* Reachable analysis : remove unreachable code.  */
-static void reachable_code_pass(TCGContext *s)
+static void __attribute__((noinline))
+reachable_code_pass(TCGContext *s)
 {
     TCGOp *op, *op_next, *op_prev;
     bool dead = false;
@@ -2859,7 +2860,8 @@ static void la_cross_call(TCGContext *s, int nt)
 /* Liveness analysis : update the opc_arg_life array to tell if a
    given input arguments is dead. Instructions updating dead
    temporaries are removed. */
-static void liveness_pass_1(TCGContext *s)
+static void __attribute__((noinline))
+liveness_pass_1(TCGContext *s)
 {
     int nb_globals = s->nb_globals;
     int nb_temps = s->nb_temps;
@@ -3199,7 +3201,8 @@ static void liveness_pass_1(TCGContext *s)
 }
 
 /* Liveness analysis: Convert indirect regs to direct temporaries.  */
-static bool liveness_pass_2(TCGContext *s)
+static bool __attribute__((noinline))
+liveness_pass_2(TCGContext *s)
 {
     int nb_globals = s->nb_globals;
     int nb_temps, i;
-- 
2.34.1


