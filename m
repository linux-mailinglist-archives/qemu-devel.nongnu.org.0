Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 918EA5AE65E
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 13:21:02 +0200 (CEST)
Received: from localhost ([::1]:41004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVWdZ-0003ML-Ha
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 07:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVeq-0003Ol-OE
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:17 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVeh-0005Cx-An
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:12 -0400
Received: by mail-wr1-x431.google.com with SMTP id b16so14692126wru.7
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=B458Afawec85XoXWpbjPbqxmo9p/Fje9hPN8wU9nu7E=;
 b=UiUweQOKTQn4C1NsSWHUPc8QeObtZn8xaOOAwLTmW57B6Lr9PjpntCA++aqW2n4CdX
 MSkp2AqS6vZohKOF9Hm0Rw3JqscYLLWdYlRu4ZaSNGf02uKKp+PNNNPtFWUZvCUfcR/y
 guwOPQNdLyQuRCySXzhMC7B0KNCM+iLZQ90BsHnZ+vxkjxWWXPXLNn1OEmFxArkNZuIj
 TG5wA/6/zxaCYIqC36/E0sm2u2K7oTm4Br/0snkdxLbgS2MPvXoFvKACiAdWj2fXgPmO
 HoV3EHUxR5Kgsp/93L2sPzzHnmsSTMMj+yvB2djc8xujSOd+Z0XnFa9kkWvX+FIE7i5d
 J5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=B458Afawec85XoXWpbjPbqxmo9p/Fje9hPN8wU9nu7E=;
 b=MtYPEdin9OdxPDTNeBNiTnZsJQR5Dab6amsi0x480FLUI2mJyZ85PT1sR4EJwFraPI
 VSPJqausG9VDMZEjeBW1q4ovWCdon7Lil4/IIaaKd5ry+fJ5lA3a2AVtgZcPWu++PkWt
 dV13al/cJIJwhaWnyXmPb2yU8Al/TaTN1YMdAVxd88Yt4iUnJbjYN/z1z5Tv4INfu71K
 nJbxgSUBbBNj+Zj/fHn/gsFuirn9vQDrRnRuwMhLcpGA1B9DO3b8aBSMOV1lkerlzwB3
 AwcgsAmhSkJSQhkuWehK/AXDV5p0N7Hv3+GXBwjPxwtx5HsxP0nKstkHWhMHI8kBmi6L
 3BMg==
X-Gm-Message-State: ACgBeo2rv3gthhE9SrkARuoUaus8D0sJdKxklzkl+dyzsHRKdhGXGjWA
 6yHrBf1p6vHBuO+BBml4gojD8EJh0PP01IzS
X-Google-Smtp-Source: AA6agR4cnZugKPbHtUFS5SajSjOLLRbmgEgP6UfZpdhm5lSgkJMTK36GlL0QnK48hZlriqlHEG90Cg==
X-Received: by 2002:a5d:6911:0:b0:226:f5d9:d545 with SMTP id
 t17-20020a5d6911000000b00226f5d9d545mr13909028wru.469.1662459486557; 
 Tue, 06 Sep 2022 03:18:06 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b003a62bc1735asm14094361wmq.9.2022.09.06.03.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:18:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH v1 17/26] target/s390x: Introduce help_goto_indirect
Date: Tue,  6 Sep 2022 11:17:38 +0100
Message-Id: <20220906101747.344559-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906101747.344559-1-richard.henderson@linaro.org>
References: <20220906101747.344559-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a small helper to handle unconditional indirect jumps.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index fc6b04e23e..712f6d5795 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1189,6 +1189,13 @@ static DisasJumpType help_goto_direct(DisasContext *s, int64_t disp)
     }
 }
 
+static DisasJumpType help_goto_indirect(DisasContext *s, TCGv_i64 dest)
+{
+    tcg_gen_mov_i64(psw_addr, dest);
+    per_branch(s, false);
+    return DISAS_PC_UPDATED;
+}
+
 static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
                                  bool is_imm, int imm, TCGv_i64 cdest)
 {
@@ -1219,9 +1226,7 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
             goto egress;
         }
         if (c->cond == TCG_COND_ALWAYS) {
-            tcg_gen_mov_i64(psw_addr, cdest);
-            per_branch(s, false);
-            ret = DISAS_PC_UPDATED;
+            ret = help_goto_indirect(s, cdest);
             goto egress;
         }
     }
@@ -1545,9 +1550,7 @@ static DisasJumpType op_bas(DisasContext *s, DisasOps *o)
 {
     pc_to_link_info(o->out, s);
     if (o->in2) {
-        tcg_gen_mov_i64(psw_addr, o->in2);
-        per_branch(s, false);
-        return DISAS_PC_UPDATED;
+        return help_goto_indirect(s, o->in2);
     } else {
         return DISAS_NEXT;
     }
@@ -1580,9 +1583,7 @@ static DisasJumpType op_bal(DisasContext *s, DisasOps *o)
 {
     save_link_info(s, o);
     if (o->in2) {
-        tcg_gen_mov_i64(psw_addr, o->in2);
-        per_branch(s, false);
-        return DISAS_PC_UPDATED;
+        return help_goto_indirect(s, o->in2);
     } else {
         return DISAS_NEXT;
     }
-- 
2.34.1


