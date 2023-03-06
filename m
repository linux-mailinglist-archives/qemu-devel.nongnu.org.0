Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECCD6AB40E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:52:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYz0y-0001P9-GA; Sun, 05 Mar 2023 19:47:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYz0m-0000ua-Da
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:47:34 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYz0j-00083V-6F
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:47:30 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so11592787pjb.1
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ffIRJJZsDHLT84eFdCU9iQVajgGGbUtXykNH2y89apg=;
 b=cVna2UdMDzhuhqRQMr1BtcxamblNL3r9rRFsZwht/nMlnSzaJxlY05pTxNNlOu6T/l
 QLogSw72U7Qf50erec9KinEnt+F6bdOnCeEtyiGf9bkm7YOO0AuLdQ48hNfCgIHclKGa
 UwWxtjn/nobo/eIuKMtfx1vFWCMMgyCrHXE9K29gRmZUZQR2Z6OqNppzkce6h0AwaMOm
 dpW9jszfVv21Bti4wFvvHu8DbTv5Iz1HzZ0AJKYOJU7g4Fa+oha5agsy1aecx+yzLEhU
 +jhcaK1UibMyYHkUJr6wklLV4uI7jL+/uFe345q1BMfmZQYu5cJaVllYXrH+4BCpJq4+
 x5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ffIRJJZsDHLT84eFdCU9iQVajgGGbUtXykNH2y89apg=;
 b=HLS7s0xJo463PT8ClfGoaeKmgUQ5MpDoUXkJFzhiB8ibsHerrSNTUKb8kLqOoYpBhw
 sFJ0iA5eaAD5jpYIXwhjn7TTkpGlrBd2PbnwngyPAbtHmIcfP5UDlPAfsE3+6F7yJJ6G
 CH7I6Wx3/cs9NaPT/4w8X5zyWnfFnaars6i6HzXEvX/TnMYx2i3tBdQsj7gG7Qz57aXr
 kQyQj4l6hIs/2La6M6FMIS2QqRIddrsHyVUQzkLbygUhkJ+Dzr88aUpCxSHLDd72BSQJ
 X/zmesasBJjcCut5Guu6kHeTDj0wlsB9/fjpY+XRt7TAWV9mTEkyV7KX8Kbi//WcmRIn
 IbTg==
X-Gm-Message-State: AO0yUKX1iYAwCdFi7ShUCB5UfR+E0NbR1B+BY1XnWSfv749X6N7W7Mhp
 uFjVIlZV+8+GJeYt91ZsJbgLfLK4kmofqy287rgLXw==
X-Google-Smtp-Source: AK7set8/dSDz6QXv4si1OgM2eJ6LgQWUI5uzkhS+5KKBCnBwyYshLOrgwVlpNWu0buVWZ9ueQ/C0UA==
X-Received: by 2002:a17:90b:4c43:b0:230:c467:1c7e with SMTP id
 np3-20020a17090b4c4300b00230c4671c7emr9887853pjb.11.1678063647631; 
 Sun, 05 Mar 2023 16:47:27 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 mv15-20020a17090b198f00b0023087e8adf8sm4971492pjb.21.2023.03.05.16.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:47:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PULL 80/84] target/xtensa: Tidy translate_clamps
Date: Sun,  5 Mar 2023 16:39:50 -0800
Message-Id: <20230306003954.1866998-81-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

All writes to arg[0].out; use tcg_constant_i32.

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index e3fcd50691..d727f9ffd8 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1514,11 +1514,11 @@ static void translate_callxw(DisasContext *dc, const OpcodeArg arg[],
 static void translate_clamps(DisasContext *dc, const OpcodeArg arg[],
                              const uint32_t par[])
 {
-    TCGv_i32 tmp1 = tcg_const_i32(-1u << arg[2].imm);
-    TCGv_i32 tmp2 = tcg_const_i32((1 << arg[2].imm) - 1);
+    TCGv_i32 tmp1 = tcg_constant_i32(-1u << arg[2].imm);
+    TCGv_i32 tmp2 = tcg_constant_i32((1 << arg[2].imm) - 1);
 
-    tcg_gen_smax_i32(tmp1, tmp1, arg[1].in);
-    tcg_gen_smin_i32(arg[0].out, tmp1, tmp2);
+    tcg_gen_smax_i32(arg[0].out, tmp1, arg[1].in);
+    tcg_gen_smin_i32(arg[0].out, arg[0].out, tmp2);
 }
 
 static void translate_clrb_expstate(DisasContext *dc, const OpcodeArg arg[],
-- 
2.34.1


