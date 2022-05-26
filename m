Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E21F5355DE
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 23:58:13 +0200 (CEST)
Received: from localhost ([::1]:48628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuLUi-0004Ye-Cx
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 17:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCb-0001xt-4h; Thu, 26 May 2022 17:39:29 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:36633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCZ-000878-Kn; Thu, 26 May 2022 17:39:28 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 e11-20020a9d6e0b000000b0060afcbafa80so1832793otr.3; 
 Thu, 26 May 2022 14:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OSARLpvl5HOEG35MaaIA9lU2nypVaQbJw20HJ3sH30M=;
 b=obdwbCCoO6lY5C3wUfXCw8+OTkUe0DOVLVW/OFNrVGrjPSlOg0WHqRAlZRKYhVTP/s
 d2D8cSY0yFkOgJc8VGJHwxituep8YYCy4YesT/sZ/hNVxZHcV1Lxdijcq4cKBpqlRnPh
 DtucUDoqEcnnu/akgUM4/kMlFD372jIp2uyotcMza9wVWr3xiQg7fe+w4ZUGVi48lREF
 l9WtnquZMhYCgBX9Lrb5SMk6VI0jNZZAUbg3tsLCos5PvpagHb62z9zf6JcPA9sj3mA0
 lq8fMRAL2vMLwmysWUsGOQmokZQlliibkPvaYyiY41BMJyDHl+18RycfHpZaJ9tg4NW7
 lrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OSARLpvl5HOEG35MaaIA9lU2nypVaQbJw20HJ3sH30M=;
 b=0b+m7AntaVBJTtvQzRRKIsx+wsAq3L5Rkob0yCfuPcC2gaOvLNm1CDw4r2Fo/qFLka
 FPHQLEjD17f4QP6dvJZ0ZMNnZjfWvPKbEUX4idwQwLzs51TlN8VIT4dnayUBXuVR7jcO
 v/BfttEWAEeosvMHdMcQMuVVvnmL54Eto6n3Jsqdj3owU8FMkWmwGzZ/d5e++2JyEPHe
 m/8iavjKtkWWOuCw5r1aG/WFg1PWSq2Vv/8H3pxlwrswfobj8LRtk/DOXoR35XtG62FD
 qbyt4qIhma3IJPuXH8vQZ/jrstseEEA39aNVcPmyrGFcDm2a7M/0+DTweSmSE066ke/t
 F/UQ==
X-Gm-Message-State: AOAM531OndGxZaoP4qzFrRQhqjtrat9o4pNUWjNYPN0iKZizYQV1pRwO
 M/pp259nxeHg2rN/9RlqSaaoiMx3OSU=
X-Google-Smtp-Source: ABdhPJw5wktXpc2nKBHmzCVrFKFiO+gnT/TexmkTsRGTjn3iOS8TXYS24nefkpqZ1JBV5H4fbpbFqA==
X-Received: by 2002:a9d:4802:0:b0:60a:f005:d18f with SMTP id
 c2-20020a9d4802000000b0060af005d18fmr12840863otf.253.1653601166111; 
 Thu, 26 May 2022 14:39:26 -0700 (PDT)
Received: from balboa.COMFAST (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 l43-20020a0568302b2b00b00606ad72bdcbsm1066999otv.38.2022.05.26.14.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 14:39:25 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PULL 19/34] target/ppc: introduce do_va_helper
Date: Thu, 26 May 2022 18:38:00 -0300
Message-Id: <20220526213815.92701-20-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220526213815.92701-1-danielhb413@gmail.com>
References: <20220526213815.92701-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x336.google.com
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

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220517123929.284511-10-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/translate/vmx-impl.c.inc | 32 +++++------------------------
 1 file changed, 5 insertions(+), 27 deletions(-)

diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 764ac45409..e66301c007 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -2553,20 +2553,17 @@ static void gen_vmladduhm(DisasContext *ctx)
     tcg_temp_free_ptr(rd);
 }
 
-static bool trans_VPERM(DisasContext *ctx, arg_VA *a)
+static bool do_va_helper(DisasContext *ctx, arg_VA *a,
+    void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr))
 {
     TCGv_ptr vrt, vra, vrb, vrc;
-
-    REQUIRE_INSNS_FLAGS(ctx, ALTIVEC);
     REQUIRE_VECTOR(ctx);
 
     vrt = gen_avr_ptr(a->vrt);
     vra = gen_avr_ptr(a->vra);
     vrb = gen_avr_ptr(a->vrb);
     vrc = gen_avr_ptr(a->rc);
-
-    gen_helper_VPERM(vrt, vra, vrb, vrc);
-
+    gen_helper(vrt, vra, vrb, vrc);
     tcg_temp_free_ptr(vrt);
     tcg_temp_free_ptr(vra);
     tcg_temp_free_ptr(vrb);
@@ -2575,27 +2572,8 @@ static bool trans_VPERM(DisasContext *ctx, arg_VA *a)
     return true;
 }
 
-static bool trans_VPERMR(DisasContext *ctx, arg_VA *a)
-{
-    TCGv_ptr vrt, vra, vrb, vrc;
-
-    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
-    REQUIRE_VECTOR(ctx);
-
-    vrt = gen_avr_ptr(a->vrt);
-    vra = gen_avr_ptr(a->vra);
-    vrb = gen_avr_ptr(a->vrb);
-    vrc = gen_avr_ptr(a->rc);
-
-    gen_helper_VPERMR(vrt, vra, vrb, vrc);
-
-    tcg_temp_free_ptr(vrt);
-    tcg_temp_free_ptr(vra);
-    tcg_temp_free_ptr(vrb);
-    tcg_temp_free_ptr(vrc);
-
-    return true;
-}
+TRANS_FLAGS(ALTIVEC, VPERM, do_va_helper, gen_helper_VPERM)
+TRANS_FLAGS2(ISA300, VPERMR, do_va_helper, gen_helper_VPERMR)
 
 static bool trans_VSEL(DisasContext *ctx, arg_VA *a)
 {
-- 
2.36.1


