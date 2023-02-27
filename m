Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9956A3AEC
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 06:52:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWIH-0003kA-UM; Mon, 27 Feb 2023 00:43:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWID-0003Ro-Pw
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:43:21 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIB-0004nL-Uj
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:43:21 -0500
Received: by mail-pg1-x529.google.com with SMTP id q23so2845803pgt.7
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TREbAd+70LxESacRUJBX2SCfwkFxNEG89YG9D3Coqs4=;
 b=u91QM0vZV0sU5gQYlowKL8wPNntK0dCJfYlWxQ4bex6qA+S09hppHLJiHNq4bzb6gt
 Evaa81Qm76aMzImAZxxHVah3f6S/2jz6TPsWogQDTYz8xoJ9ReGhXTmhlh0ORLHF70FS
 1HSIkdl5R1SvWxPF55/FvuzSTgE8IyMMHNf6cYdC97eiBklGsbfhb+a+m9d1UZuknd61
 qN5Rz1FAaNLGKVlDT78kdy3KKEK1xdsjkrPYnf57l5VdABuJTu4w/6Yykjo/oEKHFdBD
 O7/MK0RpUPTnocvKnmCGKde82kuCxRNvFn9MZPP0ojO63kTGhlvXTmtT/Xkg8dMlKKtt
 etoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TREbAd+70LxESacRUJBX2SCfwkFxNEG89YG9D3Coqs4=;
 b=kPZxococgII3IVIMrUqU18qqF/SP46y0Lq3EJRxCC+u7AopOsp+TDqVGihn5zCYZqO
 9i2CCADib7mrQxgFylNdvkKw2Z9z7SIxu/RKic8SCk0DsbPYTMH6E6zvqxh0GCv4JhNH
 BXfVDjs0wZNrkmXAFDnHh+B3iHT3tVNg+q0KqvSWPitGCzwYarJlrCjnHqPR5m+jyeCQ
 OwxYXohU7UdTfWfV+1A7s/7mhqZjTFlf8Jt3DNySnLpgqtQRoL8blnwxRSJC4Do9ohSK
 QUgycQGqMZCvtMyZEacsZsfjujPoFfuvb2bJ2AkIn0x020l5OdidanZkaLlQ/zr0W4lU
 /SMw==
X-Gm-Message-State: AO0yUKXRgFZLzWTrCfCUJuvoTVFFXVthagVt2Att5y20SF3Lpj1ubMcd
 zy+7Gbtp21OvAeIuHCTwkjvKq5rvZKz/uyEL4WI=
X-Google-Smtp-Source: AK7set9Bm4FHptm4TqueIFWmi1FWYKB1qXBjprjEUKWxwt8rTf7pOy3bNfBp37aal2V0XjCLllVZWg==
X-Received: by 2002:a62:1946:0:b0:5a8:bd6e:90fb with SMTP id
 67-20020a621946000000b005a8bd6e90fbmr17879877pfz.19.1677476596145; 
 Sun, 26 Feb 2023 21:43:16 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 12/70] target/avr: Avoid use of tcg_const_i32 in SBIC, SBIS
Date: Sun, 26 Feb 2023 19:41:35 -1000
Message-Id: <20230227054233.390271-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

The use of separate data/port variables is existing
practice elsewhere, e.g. SBI, CBI.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/translate.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index b9506a8d86..190d0c3f97 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -1288,12 +1288,13 @@ static bool trans_SBRS(DisasContext *ctx, arg_SBRS *a)
  */
 static bool trans_SBIC(DisasContext *ctx, arg_SBIC *a)
 {
-    TCGv temp = tcg_const_i32(a->reg);
+    TCGv data = tcg_temp_new_i32();
+    TCGv port = tcg_constant_i32(a->reg);
 
-    gen_helper_inb(temp, cpu_env, temp);
-    tcg_gen_andi_tl(temp, temp, 1 << a->bit);
+    gen_helper_inb(data, cpu_env, port);
+    tcg_gen_andi_tl(data, data, 1 << a->bit);
     ctx->skip_cond = TCG_COND_EQ;
-    ctx->skip_var0 = temp;
+    ctx->skip_var0 = data;
 
     return true;
 }
@@ -1305,12 +1306,13 @@ static bool trans_SBIC(DisasContext *ctx, arg_SBIC *a)
  */
 static bool trans_SBIS(DisasContext *ctx, arg_SBIS *a)
 {
-    TCGv temp = tcg_const_i32(a->reg);
+    TCGv data = tcg_temp_new_i32();
+    TCGv port = tcg_constant_i32(a->reg);
 
-    gen_helper_inb(temp, cpu_env, temp);
-    tcg_gen_andi_tl(temp, temp, 1 << a->bit);
+    gen_helper_inb(data, cpu_env, port);
+    tcg_gen_andi_tl(data, data, 1 << a->bit);
     ctx->skip_cond = TCG_COND_NE;
-    ctx->skip_var0 = temp;
+    ctx->skip_var0 = data;
 
     return true;
 }
-- 
2.34.1


