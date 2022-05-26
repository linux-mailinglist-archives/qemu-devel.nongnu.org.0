Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AFE5355FE
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 00:09:57 +0200 (CEST)
Received: from localhost ([::1]:45706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuLg4-0006ik-8B
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 18:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLD7-00035i-NL; Thu, 26 May 2022 17:40:01 -0400
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a]:34696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLD5-0008Ho-R1; Thu, 26 May 2022 17:40:01 -0400
Received: by mail-oo1-xc2a.google.com with SMTP id
 c17-20020a4ac311000000b0040ea8bf80f2so506211ooq.1; 
 Thu, 26 May 2022 14:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hk25HGZBaLpMerDZPSbyRqDhNanWmMznBdX0jrC9ibc=;
 b=RVkFAvk3IJaKrmqQuHhE+38afc++Peg5DyP9+d/8cb8Ppdzb7usYo/52x0NFm0ECP8
 J2QzDdmVp6r6xLZiL9m2mczODyJeux40EhHWFd8DVQ2+AOQryhwKcpZH2hrSoJe0i/Dz
 DAWsXh2f7E3ZT31qHvVR04b0hVJQ2orl3oZcFiEthUpFO84sTMJ1Gt14V3Ej3JNz8BC9
 DKZvk8O6pQqQBfPNLG66VzUbYOpykhM3dUtfZMPd8NWZtPHA7/xl3NipkEUo40sTMT6+
 JAu68aLovIibYUUdvvyIhU+dPJ/Vft4STUmlHxGsT3Layccnn6GABXLCnEB1HWXQoIiI
 3Rgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hk25HGZBaLpMerDZPSbyRqDhNanWmMznBdX0jrC9ibc=;
 b=sjn0J3Zbnjv/CSO/RIL/FrZlPPsfhzKUOLiWaCLbhshwTEB2mj1brzKI3jQEDiJrEI
 I9FdhxOS6ysi7IOhWrUQ2meVZSWEJtftI7BScddrAHpKK3bSfJ76u3o4Sc7FBx5W6P0Y
 M2Q8+8nMLwH8VfwYCuSK61rdeA1EjZnoQ7TJ/T2xATfseA6eiWVH9tZvCYdyG0hNYemj
 M+Sun73hhGXe10yK4FJYyf+ddLy3Kitvy2mG5g+gvapwa+oU1cbFAy6T/3wxONsaW/l1
 SeCfr+sG4dpVpXkAsZ8aSBUtm0uTPNNTeqFgcw/ZilHycIzu/gVJGBRI+hlYmJaHrcT5
 PMwA==
X-Gm-Message-State: AOAM530IvupZMnUqnxZD7ywza/Gdt6MlNC54rzU4ONQNN7F4fGppCY+5
 Jwe5Lzlu/yCSKVKVx+r0ZnvL3bfBmKE=
X-Google-Smtp-Source: ABdhPJznohNCAR48jKFcoS5H7tyJFQeM+fN4PdxPVa/IfyfUSHfgFabMlWp37xwVpnxTz9wEaps3ug==
X-Received: by 2002:a4a:d40d:0:b0:33a:33be:9c1e with SMTP id
 n13-20020a4ad40d000000b0033a33be9c1emr15638089oos.96.1653601198249; 
 Thu, 26 May 2022 14:39:58 -0700 (PDT)
Received: from balboa.COMFAST (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 l43-20020a0568302b2b00b00606ad72bdcbsm1066999otv.38.2022.05.26.14.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 14:39:57 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: [PULL 32/34] target/ppc: Implemented pmxvf*ger*
Date: Thu, 26 May 2022 18:38:13 -0300
Message-Id: <20220526213815.92701-33-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220526213815.92701-1-danielhb413@gmail.com>
References: <20220526213815.92701-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2a.google.com
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

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

Implement the following PowerISA v3.1 instructions:
pmxvf16ger2:   Prefixed Masked VSX Vector 16-bit Floating-Point GER
(rank-2 update)
pmxvf16ger2nn: Prefixed Masked VSX Vector 16-bit Floating-Point GER
(rank-2 update) Negative multiply, Negative accumulate
pmxvf16ger2np: Prefixed Masked VSX Vector 16-bit Floating-Point GER
(rank-2 update) Negative multiply, Positive accumulate
pmxvf16ger2pn: Prefixed Masked VSX Vector 16-bit Floating-Point GER
(rank-2 update) Positive multiply, Negative accumulate
pmxvf16ger2pp: Prefixed Masked VSX Vector 16-bit Floating-Point GER
(rank-2 update) Positive multiply, Positive accumulate
pmxvf32ger:    Prefixed Masked VSX Vector 32-bit Floating-Point GER
(rank-1 update)
pmxvf32gernn:  Prefixed Masked VSX Vector 32-bit Floating-Point GER
(rank-1 update) Negative multiply, Negative accumulate
pmxvf32gernp:  Prefixed Masked VSX Vector 32-bit Floating-Point GER
(rank-1 update) Negative multiply, Positive accumulate
pmxvf32gerpn:  Prefixed Masked VSX Vector 32-bit Floating-Point GER
(rank-1 update) Positive multiply, Negative accumulate
pmxvf32gerpp:  Prefixed Masked VSX Vector 32-bit Floating-Point GER
(rank-1 update) Positive multiply, Positive accumulate
pmxvf64ger:    Prefixed Masked VSX Vector 64-bit Floating-Point GER
(rank-1 update)
pmxvf64gernn:  Prefixed Masked VSX Vector 64-bit Floating-Point GER
(rank-1 update) Negative multiply, Negative accumulate
pmxvf64gernp:  Prefixed Masked VSX Vector 64-bit Floating-Point GER
(rank-1 update) Negative multiply, Positive accumulate
pmxvf64gerpn:  Prefixed Masked VSX Vector 64-bit Floating-Point GER
(rank-1 update) Positive multiply, Negative accumulate
pmxvf64gerpp:  Prefixed Masked VSX Vector 64-bit Floating-Point GER
(rank-1 update) Positive multiply, Positive accumulate

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220524140537.27451-7-lucas.araujo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/insn64.decode            | 38 +++++++++++++++++++++++++++++
 target/ppc/translate/vsx-impl.c.inc | 18 ++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 0eed35c8cd..5ecc5c85bf 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -73,10 +73,15 @@
 %xx3_xa         2:1 16:5
 %xx3_xb         1:1 11:5
 %xx3_at         23:3
+%xx3_xa_pair    2:1 17:4 !function=times_2
 @MMIRR_XX3      ...... .. .... .. . . ........ xmsk:4 ymsk:4  \
                 ...... ... .. ..... ..... ........ ...  \
                 &MMIRR_XX3 xa=%xx3_xa xb=%xx3_xb xt=%xx3_at
 
+@MMIRR_XX3_NO_P ...... .. .... .. . . ........ xmsk:4 .... \
+                ...... ... .. ..... ..... ........ ... \
+                &MMIRR_XX3 xb=%xx3_xb xt=%xx3_at pmsk=1
+
 ### Fixed-Point Load Instructions
 
 PLBZ            000001 10 0--.-- .................. \
@@ -145,6 +150,39 @@ PMXVI16GER2S    000001 11 1001 -- - - pmsk:2 ------ ........       \
 PMXVI16GER2SPP  000001 11 1001 -- - - pmsk:2 ------ ........       \
                 111011 ... -- ..... ..... 00101010 ..-  @MMIRR_XX3
 
+PMXVF16GER2     000001 11 1001 -- - - pmsk:2 ------ ........ \
+                111011 ... -- ..... ..... 00010011 ..-  @MMIRR_XX3
+PMXVF16GER2PP   000001 11 1001 -- - - pmsk:2 ------ ........ \
+                111011 ... -- ..... ..... 00010010 ..-  @MMIRR_XX3
+PMXVF16GER2PN   000001 11 1001 -- - - pmsk:2 ------ ........ \
+                111011 ... -- ..... ..... 10010010 ..-  @MMIRR_XX3
+PMXVF16GER2NP   000001 11 1001 -- - - pmsk:2 ------ ........ \
+                111011 ... -- ..... ..... 01010010 ..-  @MMIRR_XX3
+PMXVF16GER2NN   000001 11 1001 -- - - pmsk:2 ------ ........ \
+                111011 ... -- ..... ..... 11010010 ..-  @MMIRR_XX3
+
+PMXVF32GER      000001 11 1001 -- - - -------- .... ymsk:4 \
+                111011 ... -- ..... ..... 00011011 ..-  @MMIRR_XX3_NO_P xa=%xx3_xa
+PMXVF32GERPP    000001 11 1001 -- - - -------- .... ymsk:4 \
+                111011 ... -- ..... ..... 00011010 ..-  @MMIRR_XX3_NO_P xa=%xx3_xa
+PMXVF32GERPN    000001 11 1001 -- - - -------- .... ymsk:4 \
+                111011 ... -- ..... ..... 10011010 ..-  @MMIRR_XX3_NO_P xa=%xx3_xa
+PMXVF32GERNP    000001 11 1001 -- - - -------- .... ymsk:4 \
+                111011 ... -- ..... ..... 01011010 ..-  @MMIRR_XX3_NO_P xa=%xx3_xa
+PMXVF32GERNN    000001 11 1001 -- - - -------- .... ymsk:4 \
+                111011 ... -- ..... ..... 11011010 ..-  @MMIRR_XX3_NO_P xa=%xx3_xa
+
+PMXVF64GER      000001 11 1001 -- - - -------- .... ymsk:2 -- \
+                111011 ... -- ....0 ..... 00111011 ..-  @MMIRR_XX3_NO_P xa=%xx3_xa_pair
+PMXVF64GERPP    000001 11 1001 -- - - -------- .... ymsk:2 -- \
+                111011 ... -- ....0 ..... 00111010 ..-  @MMIRR_XX3_NO_P xa=%xx3_xa_pair
+PMXVF64GERPN    000001 11 1001 -- - - -------- .... ymsk:2 -- \
+                111011 ... -- ....0 ..... 10111010 ..-  @MMIRR_XX3_NO_P xa=%xx3_xa_pair
+PMXVF64GERNP    000001 11 1001 -- - - -------- .... ymsk:2 -- \
+                111011 ... -- ....0 ..... 01111010 ..-  @MMIRR_XX3_NO_P xa=%xx3_xa_pair
+PMXVF64GERNN    000001 11 1001 -- - - -------- .... ymsk:2 -- \
+                111011 ... -- ....0 ..... 11111010 ..-  @MMIRR_XX3_NO_P xa=%xx3_xa_pair
+
 ### Prefixed No-operation Instruction
 
 @PNOP           000001 11 0000-- 000000000000000000     \
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 01978a585a..e79752899a 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2916,6 +2916,24 @@ TRANS(XVF64GERPN, do_ger, gen_helper_XVF64GERPN)
 TRANS(XVF64GERNP, do_ger, gen_helper_XVF64GERNP)
 TRANS(XVF64GERNN, do_ger, gen_helper_XVF64GERNN)
 
+TRANS64(PMXVF16GER2, do_ger, gen_helper_XVF16GER2)
+TRANS64(PMXVF16GER2PP, do_ger, gen_helper_XVF16GER2PP)
+TRANS64(PMXVF16GER2PN, do_ger, gen_helper_XVF16GER2PN)
+TRANS64(PMXVF16GER2NP, do_ger, gen_helper_XVF16GER2NP)
+TRANS64(PMXVF16GER2NN, do_ger, gen_helper_XVF16GER2NN)
+
+TRANS64(PMXVF32GER, do_ger, gen_helper_XVF32GER)
+TRANS64(PMXVF32GERPP, do_ger, gen_helper_XVF32GERPP)
+TRANS64(PMXVF32GERPN, do_ger, gen_helper_XVF32GERPN)
+TRANS64(PMXVF32GERNP, do_ger, gen_helper_XVF32GERNP)
+TRANS64(PMXVF32GERNN, do_ger, gen_helper_XVF32GERNN)
+
+TRANS64(PMXVF64GER, do_ger, gen_helper_XVF64GER)
+TRANS64(PMXVF64GERPP, do_ger, gen_helper_XVF64GERPP)
+TRANS64(PMXVF64GERPN, do_ger, gen_helper_XVF64GERPN)
+TRANS64(PMXVF64GERNP, do_ger, gen_helper_XVF64GERNP)
+TRANS64(PMXVF64GERNN, do_ger, gen_helper_XVF64GERNN)
+
 #undef GEN_XX2FORM
 #undef GEN_XX3FORM
 #undef GEN_XX2IFORM
-- 
2.36.1


