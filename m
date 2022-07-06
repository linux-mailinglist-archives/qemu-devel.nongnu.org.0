Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A32569395
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 22:49:41 +0200 (CEST)
Received: from localhost ([::1]:57186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Bxs-0000EA-Uy
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 16:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BMN-0000if-IF; Wed, 06 Jul 2022 16:10:59 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d]:43845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BML-0003gu-Cz; Wed, 06 Jul 2022 16:10:55 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id d187so16177803vsd.10;
 Wed, 06 Jul 2022 13:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2eaOVbokY+S8+DaN4zl7nKIlg6C9aLbG5VzjxMhIIbc=;
 b=YfRDZKgmxlGjRBCMPctRJokiS9kLfsvFil7iqWxGEig9hTbqhrTJocKlPmonKz/Ncj
 Ukg6IglY+U5VL5iOjqp24lrlQkazAZ0rbRfklHuJ9HxVwj8SM7CmDrdfggwYs8wVQZuD
 MEbVm2znAoie6ekMCgrAezxOltcviysYZ0VC+e8qdLMQrdFqIC6vJFEwm14PLQ5B2y07
 QS9u3gHhFHI1vhs6NpMpSbSC6qfTQTYGXrNostvm63nh1/+LTzlon5glcffcrTJP0yKE
 d2QPo2JR+iOots40X5b4qB7owottmeM3NmMFpSLJrJ4o4UJM1/WKpvaz1WgqYUMWf4ws
 3NTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2eaOVbokY+S8+DaN4zl7nKIlg6C9aLbG5VzjxMhIIbc=;
 b=n49vFkrCMYTdD8RoGRp0F5X3yGbnbTi79hjdVH4ayfPzNeP74Mf9do9Nl+aNyT+vq2
 cY2B6rpFEuiMzzUUNruneiM8CGLPWy0zLDEVi7bFwMkTVGFhhzV8oYiIO5FdodGPh5NJ
 e/gipKv5Y9M7QuHFDF7NoWP2alx3WR+oN5HwGLAByauJZIcaqjEf4V3sQHYHVAJOjgtO
 TQPQ7hZGo9DcF0IIbtgsvCLQrUCrXh77dqiCKbYQLB4CL6iHXtc6sQHKmv+AxIb64U5s
 yDKf6lIYFjzvFHBaONnTBNrpdmh6Dscsg5G7bXBSRsWqTh1IdDeLdja62fkTqS8Qd/h3
 mJJg==
X-Gm-Message-State: AJIora+M3xuIogw8o79XALN2/CMUsO8Pn7fMBUF0OeqWps5vzF0lpEAM
 nQJH5Nkcqh9xJvUZ4rTwwaWMMM8PRz8=
X-Google-Smtp-Source: AGRyM1tv2B4t/e6iyyogD1PM04VfMhkmnJUkueOohmzI+9Xbp5n4QxQ0p0JeyF+Nv8/9TnTigjdCEw==
X-Received: by 2002:a05:6102:7b9:b0:356:9ef:999e with SMTP id
 x25-20020a05610207b900b0035609ef999emr24674504vsg.47.1657138251914; 
 Wed, 06 Jul 2022 13:10:51 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056122015600b003744975035asm788662vko.19.2022.07.06.13.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 13:10:51 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PULL 31/34] target/ppc: implement cdtbcd
Date: Wed,  6 Jul 2022 17:09:43 -0300
Message-Id: <20220706200946.471114-32-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706200946.471114-1-danielhb413@gmail.com>
References: <20220706200946.471114-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Implements the Convert Declets To Binary Coded Decimal instruction.
Since libdecnumber doesn't expose the methods for direct conversion
(decDigitsFromDPD, DPD2BCD, etc), a positive decimal32 with zero
exponent is used as an intermediate value to convert the declets.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Message-Id: <20220629162904.105060-12-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/dfp_helper.c                    | 26 ++++++++++++++++++++++
 target/ppc/helper.h                        |  1 +
 target/ppc/insn32.decode                   |  1 +
 target/ppc/translate/fixedpoint-impl.c.inc |  7 ++++++
 4 files changed, 35 insertions(+)

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index db9e994c8c..5ba74b2124 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -1392,6 +1392,32 @@ DFP_HELPER_SHIFT(DSCLIQ, 128, 1)
 DFP_HELPER_SHIFT(DSCRI, 64, 0)
 DFP_HELPER_SHIFT(DSCRIQ, 128, 0)
 
+target_ulong helper_CDTBCD(target_ulong s)
+{
+    uint64_t res = 0;
+    uint32_t dec32, declets;
+    uint8_t bcd[6];
+    int i, w, sh;
+    decNumber a;
+
+    for (w = 1; w >= 0; w--) {
+        res <<= 32;
+        declets = extract64(s, 32 * w, 20);
+        if (declets) {
+            /* decimal32 with zero exponent and word "w" declets */
+            dec32 = (0x225ULL << 20) | declets;
+            decimal32ToNumber((decimal32 *)&dec32, &a);
+            decNumberGetBCD(&a, bcd);
+            for (i = 0; i < a.digits; i++) {
+                sh = 4 * (a.digits - 1 - i);
+                res |= (uint64_t)bcd[i] << sh;
+            }
+        }
+    }
+
+    return res;
+}
+
 target_ulong helper_CBCDTD(target_ulong s)
 {
     uint64_t res = 0;
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 583c8dd0c2..ed0641a234 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -54,6 +54,7 @@ DEF_HELPER_3(sraw, tl, env, tl, tl)
 DEF_HELPER_FLAGS_2(CFUGED, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 DEF_HELPER_FLAGS_2(PDEPD, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 DEF_HELPER_FLAGS_2(PEXTD, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_1(CDTBCD, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_1(CBCDTD, TCG_CALL_NO_RWG_SE, tl, tl)
 #if defined(TARGET_PPC64)
 DEF_HELPER_FLAGS_2(cmpeqb, TCG_CALL_NO_RWG_SE, i32, tl, tl)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 65bcaf657f..f7653ef9d5 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -317,6 +317,7 @@ PEXTD           011111 ..... ..... ..... 0010111100 -   @X
 ## BCD Assist
 
 ADDG6S          011111 ..... ..... ..... - 001001010 -  @X
+CDTBCD          011111 ..... ..... ----- 0100011010 -   @X_sa
 CBCDTD          011111 ..... ..... ----- 0100111010 -   @X_sa
 
 ### Float-Point Load Instructions
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 892c9d2568..cb0097bedb 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -530,6 +530,13 @@ static bool trans_ADDG6S(DisasContext *ctx, arg_X *a)
     return true;
 }
 
+static bool trans_CDTBCD(DisasContext *ctx, arg_X_sa *a)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, BCDA_ISA206);
+    gen_helper_CDTBCD(cpu_gpr[a->ra], cpu_gpr[a->rs]);
+    return true;
+}
+
 static bool trans_CBCDTD(DisasContext *ctx, arg_X_sa *a)
 {
     REQUIRE_INSNS_FLAGS2(ctx, BCDA_ISA206);
-- 
2.36.1


