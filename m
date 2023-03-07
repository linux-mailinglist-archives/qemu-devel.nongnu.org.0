Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2516AF0D0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:36:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZc9h-0003i0-Lo; Tue, 07 Mar 2023 13:35:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9f-0003e5-Az
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:19 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9d-0007jU-Mu
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:19 -0500
Received: by mail-pl1-x62f.google.com with SMTP id v11so15108294plz.8
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678214117;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ob6o2+PyWVMcZzAwGqvOjE3dmqAG4vSrJnMbHtf/LLI=;
 b=d5nTPWYoN300jTLNIIwcf82EgaX5/2v79sfJm8QFadwHkc3uDP2sqmPf3KIEi1I/24
 6cOYQpUgWgpRDJqbR3lrIT9Hz0PNx8IBRkPbXEFzmv9/CmY9+yAnNGwZfATCjm2y5ozP
 souiqp9TKYnP/qdyvIAxk4mLrf94JDxQnaUqA/YOmUkCFzGN1xto1iAkCtnNhmqU1Gr/
 2HeqhgpB3TwShB0s82wHBZu2scrR6ya3nFeEou6XSmAOCmnA94UGakI8KnNhRnl5Bjo1
 COwnPlb8vx1OTOJhg4SHRggk08jOSoAuPEIK4WS2GzRZqDwwmgvhce9x+nIp9UaUsrvY
 oeCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678214117;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ob6o2+PyWVMcZzAwGqvOjE3dmqAG4vSrJnMbHtf/LLI=;
 b=SAwkVyoxK+YCMpMeQJlQz/YrzEhk5Xmh9oJ3dNXueKTCV6wL/0w54igqIzpEN+WlnO
 OvAjrLyWkBDWY4x2Uhbb0JSGEFgeP8Mti7MOMT7ZGXss6z8msmyO7k8tCddW/+v+5Rhg
 Cp0qwnxM9RbcUsVB5ZX8f31rnwZ3jUSIiDyThFyv4ZWJOX8026HnKe2MWsiesim+A1To
 SOi/AW78D1qyQDQsIVPIofAW5jD3+jeTmQqeXsJVIhdqEc5lecluz25zIzoSqhXDSZ6i
 NqiG0N/t1YgIfN+X/mqamIkiOPijOe2opCs08X4IQFQBULPkFGT7YYkoLsiVe7+M3nuy
 0HUA==
X-Gm-Message-State: AO0yUKVoNQK/U96yU6EdyJ+8D2NJIgU+5emBT23lTwFY2Gkq4c7VNntI
 QXvCfrDHhhsYVILHxHr+RRKf/MHlWfbVe9BWzD0=
X-Google-Smtp-Source: AK7set9PU/I5M4nGNlXbHheWfTSL7JY8h5dT9XcYqHM08CZV6hlXmLT57d55akTV82gksw3ZRkpoFA==
X-Received: by 2002:a17:90b:1bc5:b0:233:affd:a96c with SMTP id
 oa5-20020a17090b1bc500b00233affda96cmr19382846pjb.16.1678214116915; 
 Tue, 07 Mar 2023 10:35:16 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a17090a1b0100b0022c0a05229fsm7757940pjq.41.2023.03.07.10.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:35:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 16/25] target/ppc: Avoid tcg_const_* in xxeval
Date: Tue,  7 Mar 2023 10:34:54 -0800
Message-Id: <20230307183503.2512684-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307183503.2512684-1-richard.henderson@linaro.org>
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Initialize a new temp instead of tcg_const_*.
Fix a pasto in a comment.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: Cédric Le Goater <clg@kaod.org>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Greg Kurz <groug@kaod.org>
Cc: qemu-ppc@nongnu.org
---
 target/ppc/translate/vsx-impl.c.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 6e63403727..9916784e64 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2449,7 +2449,8 @@ static void gen_xxeval_i64(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b, TCGv_i64 c,
     TCGv_i64 conj, disj;
 
     conj = tcg_temp_new_i64();
-    disj = tcg_const_i64(0);
+    disj = tcg_temp_new_i64();
+    tcg_gen_movi_i64(disj, 0);
 
     /* Iterate over set bits from the least to the most significant bit */
     while (imm) {
@@ -2492,8 +2493,9 @@ static void gen_xxeval_vec(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b,
     int bit;
     TCGv_vec disj, conj;
 
-    disj = tcg_const_zeros_vec_matching(t);
     conj = tcg_temp_new_vec_matching(t);
+    disj = tcg_temp_new_vec_matching(t);
+    tcg_gen_dupi_vec(vece, disj, 0);
 
     /* Iterate over set bits from the least to the most significant bit */
     while (imm) {
@@ -2546,7 +2548,7 @@ static bool trans_XXEVAL(DisasContext *ctx, arg_8RR_XX4_imm *a)
 
     /* Equivalent functions that can be implemented with a single gen_gvec */
     switch (a->imm) {
-    case 0b00000000: /* true */
+    case 0b00000000: /* false */
         set_cpu_vsr(a->xt, tcg_constant_i64(0), true);
         set_cpu_vsr(a->xt, tcg_constant_i64(0), false);
         break;
-- 
2.34.1


