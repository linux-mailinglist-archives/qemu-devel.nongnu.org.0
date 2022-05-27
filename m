Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6764E536649
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 19:02:33 +0200 (CEST)
Received: from localhost ([::1]:38474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nudM8-0004b4-Gf
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 13:02:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nud8S-0001hr-9M
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:48:24 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:39775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nud8Q-0005Pc-LX
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:48:23 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 x2-20020a17090a1f8200b001e07a64c461so7571492pja.4
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 09:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0nKCx0fk9E4IrZSh0Ih9XJaTHZRzsP+YmI+UgWL7HrA=;
 b=DgW6dNT6ejMGMaiKUrtE4zQR4nx+i492nbfaXaNeMc37cDq1NcMnvhtlhxvgVY8O/f
 z4waFga2DBngKhq1zQBAQQRHztHp+gNj9X2RgE2nSN+evK625S4sRZJGHCyKwe7fwMBe
 hCvc0RPvtbTHBHfmsU8HnTE2gaaC9NAcKHGYstcgE5Yo03BfLhPKs6tCnVMyOkgdNXjS
 vSpNyDnVIW07Em+2D0X+7D9jWNz1B7ZSGoAFsWGNvGXLZ+nMZljtfBrbjAFgQUMaMEOC
 kOg0/pJYAvQOX5Pqc4gZO70LHAlzEdV7qBbbO4b0litvWgbM53vwUS1yaRzhL3bNIFyA
 YclQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0nKCx0fk9E4IrZSh0Ih9XJaTHZRzsP+YmI+UgWL7HrA=;
 b=rSlojUAnrUB+UtpZ4nwRJES3/KixfG82DuCIXh6mFoOuD6o8Q/fMWKDjAp8vExamxT
 KxE/OANoGrMzWwSaqWqN8pIlUcL/siKn/fONSCw2DdEmCrKeG8PAKGiknqi8Y1ts7i42
 pAkgheZUQ3L+1vK/5KUJYScQ2udnGE3e8rz136yV8R2jUAKDJilGbsnvlicEO3IJAE9+
 rXtJcwHzipcaFn6fTpAENZBo+LX1XKQlLnxIwwE+fNp44RZGxqQzAK0dQLde581EEpoh
 1UWfiGikDLdjUTRhjhCJ5qaPYDyv5l9EQCw+bBAWCddaJsqoD8ReuuHTAxjPL6FlB3FY
 6KuQ==
X-Gm-Message-State: AOAM531iDuwWixcrOfv25eeJOCHBJDT175X5/a+BAisyhlRTH5vgIR8B
 L+UkX1xUwQ2JNYKfy8RV5MYuzZlq++cSAQ==
X-Google-Smtp-Source: ABdhPJy5z22d1xb8wjdtmRaSazqjlNQSR4yZjCnXWjgb8H/3BIxrBZCYwGJsXlHvwV0KwSP8WlMqSw==
X-Received: by 2002:a17:903:11c7:b0:151:7290:ccc with SMTP id
 q7-20020a17090311c700b0015172900cccmr44332716plh.95.1653670101358; 
 Fri, 27 May 2022 09:48:21 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 j11-20020aa7928b000000b0050dc7628133sm3861420pfa.13.2022.05.27.09.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 09:48:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v5 12/17] target/m68k: Implement TRAPV
Date: Fri, 27 May 2022 09:48:02 -0700
Message-Id: <20220527164807.135038-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527164807.135038-1-richard.henderson@linaro.org>
References: <20220527164807.135038-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index bb5ed1b7b1..0cd7ef89e3 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -4911,6 +4911,14 @@ DISAS_INSN(trapcc)
     do_trapcc(s, &c);
 }
 
+DISAS_INSN(trapv)
+{
+    DisasCompare c;
+
+    gen_cc_cond(&c, s, 9); /* V set */
+    do_trapcc(s, &c);
+}
+
 static void gen_load_fcr(DisasContext *s, TCGv res, int reg)
 {
     switch (reg) {
@@ -6074,6 +6082,7 @@ void register_m68k_insns (CPUM68KState *env)
     BASE(nop,       4e71, ffff);
     INSN(rtd,       4e74, ffff, RTD);
     BASE(rts,       4e75, ffff);
+    INSN(trapv,     4e76, ffff, M68000);
     INSN(rtr,       4e77, ffff, M68000);
     BASE(jump,      4e80, ffc0);
     BASE(jump,      4ec0, ffc0);
-- 
2.34.1


