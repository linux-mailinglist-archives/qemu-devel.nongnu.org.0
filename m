Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40073535600
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 00:10:57 +0200 (CEST)
Received: from localhost ([::1]:48416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuLh2-0000Db-9G
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 18:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCz-0002hr-Fu; Thu, 26 May 2022 17:39:53 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:37588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCx-0008EV-Pz; Thu, 26 May 2022 17:39:53 -0400
Received: by mail-oi1-x233.google.com with SMTP id s188so3669807oie.4;
 Thu, 26 May 2022 14:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zHoTlC9Rx6JUWRtuk/zqQzOEx6QR6LaBGedjohvUC8k=;
 b=YyC51EA+sxXDmO26PJOMztVMHIrAVsCIcF4AUwZ/00OBTHIPDC9y18YX+eCMSilSMG
 EkOOqMqlB6xfLFx7MAmYfAYRp5P9LnZWViSmUAbkVqnMHjivkjcFhA4s0jnSVkQyq27R
 WvR1446H5IvF4A7+QKOXe+zQm+keGuYt4ceWaix1nJpBYJHQTOefQQf7UVi/XAhNuNI4
 3+v9wOfOyj2/zIJs+A9Tr+r8fxWf7I16k9qdtv+PW+LC3WyMfQj6g7it1KESJu6gMdgd
 TgP0Cn4kBNCGAm5lZF8Xv7TbdqZBgkJDbslBhE5vfa3VdDUpxhpuLlGZZgpjPBkAmVqt
 7AXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zHoTlC9Rx6JUWRtuk/zqQzOEx6QR6LaBGedjohvUC8k=;
 b=hJ4wDHSPNU0NbVYZ9dLNM4drTgdzgriAjOmn9ORet7OQNXb144omABbtHSpwTx7LYp
 LSJZ6YllntzGfDLGMZihC8U+2pl+p5j83zj2ka936l5qqJ9y6sHWlpfELS02GPBCHTtH
 r/j7A4QmSkRZxL8VaXouR3iu9Zufgnhj6w2jIwEUWrRUi9hMGgSeEdbyRB2pNGaFANt4
 onTBA6jffCCVwhRx/OvLH9DZUsh+YroG36aA3D2hBU+F+GJELEjyyRHKP9s4xe/dUdF+
 /GCnB+1CgyO4wwcd8qm9GuGd9qMpamw0QiGyCenyMdIR/Ei8a/ps3RXt7igZvYdZfBOy
 qj6A==
X-Gm-Message-State: AOAM531pd3pVAHIBL7zcsrG4u0IoAmVn51jj/Vs4cg327ZzK1PoC3Qfl
 9Aniuw8GLtqI3TGXcVdFzv9GyXbPRBs=
X-Google-Smtp-Source: ABdhPJw7u24JfhgBMXjM9z73ps/otdOfUNT3AM5vbOHmQ8mKGvNu/kBFqfykeZi8YUJ45OVzvPObUg==
X-Received: by 2002:a05:6808:b04:b0:32b:8fc2:46e4 with SMTP id
 s4-20020a0568080b0400b0032b8fc246e4mr2245766oij.54.1653601190616; 
 Thu, 26 May 2022 14:39:50 -0700 (PDT)
Received: from balboa.COMFAST (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 l43-20020a0568302b2b00b00606ad72bdcbsm1066999otv.38.2022.05.26.14.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 14:39:50 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: [PULL 29/34] target/ppc: Implemented pmxvi*ger* instructions
Date: Thu, 26 May 2022 18:38:10 -0300
Message-Id: <20220526213815.92701-30-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220526213815.92701-1-danielhb413@gmail.com>
References: <20220526213815.92701-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x233.google.com
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
pmxvi4ger8:     Prefixed Masked VSX Vector 8-bit Signed/Unsigned Integer
GER (rank-4 update)
pmxvi4ger8pp:   Prefixed Masked VSX Vector 8-bit Signed/Unsigned Integer
GER (rank-4 update) Positive multiply, Positive accumulate
pmxvi8ger4:     Prefixed Masked VSX Vector 4-bit Signed Integer GER
(rank-8 update)
pmxvi8ger4pp:   Prefixed Masked VSX Vector 4-bit Signed Integer GER
(rank-8 update) Positive multiply, Positive accumulate
pmxvi8ger4spp:  Prefixed Masked VSX Vector 8-bit Signed/Unsigned Integer
GER (rank-4 update) with Saturate Positive multiply, Positive accumulate
pmxvi16ger2:    Prefixed Masked VSX Vector 16-bit Signed Integer GER
(rank-2 update)
pmxvi16ger2pp:  Prefixed Masked VSX Vector 16-bit Signed Integer GER
(rank-2 update) Positive multiply, Positive accumulate
pmxvi16ger2s:   Prefixed Masked VSX Vector 16-bit Signed Integer GER
(rank-2 update) with Saturation
pmxvi16ger2spp: Prefixed Masked VSX Vector 16-bit Signed Integer GER
(rank-2 update) with Saturation Positive multiply, Positive accumulate

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220524140537.27451-4-lucas.araujo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/insn64.decode            | 30 +++++++++++++++++++++++++++++
 target/ppc/translate/vsx-impl.c.inc | 10 ++++++++++
 2 files changed, 40 insertions(+)

diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 691e8fe6c0..0eed35c8cd 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -68,6 +68,15 @@
                 ...... ..... ..... ..... ..... .. ....   \
                 &8RR_XX4_uim3 xt=%8rr_xx_xt xa=%8rr_xx_xa xb=%8rr_xx_xb xc=%8rr_xx_xc
 
+# Format MMIRR:XX3
+&MMIRR_XX3      !extern xa xb xt pmsk xmsk ymsk
+%xx3_xa         2:1 16:5
+%xx3_xb         1:1 11:5
+%xx3_at         23:3
+@MMIRR_XX3      ...... .. .... .. . . ........ xmsk:4 ymsk:4  \
+                ...... ... .. ..... ..... ........ ...  \
+                &MMIRR_XX3 xa=%xx3_xa xb=%xx3_xb xt=%xx3_at
+
 ### Fixed-Point Load Instructions
 
 PLBZ            000001 10 0--.-- .................. \
@@ -115,6 +124,27 @@ PSTFS           000001 10 0--.-- .................. \
 PSTFD           000001 10 0--.-- .................. \
                 110110 ..... ..... ................     @PLS_D
 
+## VSX GER instruction
+
+PMXVI4GER8      000001 11 1001 -- - - pmsk:8 ........              \
+                111011 ... -- ..... ..... 00100011 ..-  @MMIRR_XX3
+PMXVI4GER8PP    000001 11 1001 -- - - pmsk:8 ........              \
+                111011 ... -- ..... ..... 00100010 ..-  @MMIRR_XX3
+PMXVI8GER4      000001 11 1001 -- - - pmsk:4 ---- ........         \
+                111011 ... -- ..... ..... 00000011 ..-  @MMIRR_XX3
+PMXVI8GER4PP    000001 11 1001 -- - - pmsk:4 ---- ........         \
+                111011 ... -- ..... ..... 00000010 ..-  @MMIRR_XX3
+PMXVI16GER2     000001 11 1001 -- - - pmsk:2 ------ ........       \
+                111011 ... -- ..... ..... 01001011 ..-  @MMIRR_XX3
+PMXVI16GER2PP   000001 11 1001 -- - - pmsk:2 ------ ........       \
+                111011 ... -- ..... ..... 01101011 ..-  @MMIRR_XX3
+PMXVI8GER4SPP   000001 11 1001 -- - - pmsk:4 ---- ........         \
+                111011 ... -- ..... ..... 01100011 ..-  @MMIRR_XX3
+PMXVI16GER2S    000001 11 1001 -- - - pmsk:2 ------ ........       \
+                111011 ... -- ..... ..... 00101011 ..-  @MMIRR_XX3
+PMXVI16GER2SPP  000001 11 1001 -- - - pmsk:2 ------ ........       \
+                111011 ... -- ..... ..... 00101010 ..-  @MMIRR_XX3
+
 ### Prefixed No-operation Instruction
 
 @PNOP           000001 11 0000-- 000000000000000000     \
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 6026b203e0..b10eded1da 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2888,6 +2888,16 @@ TRANS(XVI16GER2PP, do_ger, gen_helper_XVI16GER2PP)
 TRANS(XVI16GER2S, do_ger, gen_helper_XVI16GER2S)
 TRANS(XVI16GER2SPP, do_ger, gen_helper_XVI16GER2SPP)
 
+TRANS64(PMXVI4GER8, do_ger, gen_helper_XVI4GER8)
+TRANS64(PMXVI4GER8PP, do_ger, gen_helper_XVI4GER8PP)
+TRANS64(PMXVI8GER4, do_ger, gen_helper_XVI8GER4)
+TRANS64(PMXVI8GER4PP, do_ger, gen_helper_XVI8GER4PP)
+TRANS64(PMXVI8GER4SPP, do_ger, gen_helper_XVI8GER4SPP)
+TRANS64(PMXVI16GER2, do_ger, gen_helper_XVI16GER2)
+TRANS64(PMXVI16GER2PP, do_ger, gen_helper_XVI16GER2PP)
+TRANS64(PMXVI16GER2S, do_ger, gen_helper_XVI16GER2S)
+TRANS64(PMXVI16GER2SPP, do_ger, gen_helper_XVI16GER2SPP)
+
 #undef GEN_XX2FORM
 #undef GEN_XX3FORM
 #undef GEN_XX2IFORM
-- 
2.36.1


