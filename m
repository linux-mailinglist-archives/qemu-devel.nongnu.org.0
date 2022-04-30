Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F2A515FC1
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 20:06:57 +0200 (CEST)
Received: from localhost ([::1]:60890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkrUe-0006Gj-TI
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 14:06:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkrI6-0004gq-If
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:53:58 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:36735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkrI4-00083c-Rz
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:53:58 -0400
Received: by mail-pl1-x635.google.com with SMTP id n14so2721606plf.3
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 10:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8VjWHa4+EEAsb2rxF9krBBAxcFamsv8YuijfZ6HxZ44=;
 b=yuurYXXgMZ3znhmT+9XI7ISihB5SlP784UloyulyQCAL7Xcf4lRpLH5nErKZApL/CZ
 8SNOyFC33PzQFjgODNBDMv6ZmMs7sVhAel/zjvq5Yv9Z96Lad3x0NXylkTguPFEvgE2u
 rnfi0A0UMNxnb+4g2svLct+lHA5HIruxg0HXtE/h7JZ9pCrtk2fK5YOXI6bZZqvUiDH1
 Gjqq2sPUbAE60MmSCuSG3P4l8G2ubdQ61bx4Mwbhlf7QmtBUleL+dyA/+X7GqzFyDDs2
 vHCHb0t+Jii68HpfQtYkL7MOshc3CuoPCPy5p6bZX0Cu7ShLCRQeVVfzy8IaM4zb2H5E
 vavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8VjWHa4+EEAsb2rxF9krBBAxcFamsv8YuijfZ6HxZ44=;
 b=yOdOsxjpJr0E+uquCbPMzcUXLVoypl73pX80i5KYomMcaENHne1DMP6lPHzz1SqF+A
 TMD+gXwC/3pcoW6TDEOGrKUfdE46wwryKt+uuvmu5W+PTbLF9er0CRsQUl/vrQLUfZGx
 1i/dqGtH6TmvxpA0vpl1XQ+5CnPPBxhBHLjquyVtku7+LR6Ccaupy6Nppg/gwHE+JLbj
 FhzKyyMfY+h3v6TF+wT+zPuQii1VA+GKqloMReBS7G524H1KR7ZdFmRkOtKs2Ex+C3MO
 Jro/THGjl3WDV6a3gWRCZcMe3/F1156gtcP5gquOLjLT6lxsIZfVL9u6YBit5I8LEayf
 TOcA==
X-Gm-Message-State: AOAM532r4ronrjUyCvA/2AsZi4a0WYOPJ3PiFKvfQ/DeaYNmZXvkPaT/
 pQpHj6UDQDtkMS91TfVwkcb9VkXI/R6RFA==
X-Google-Smtp-Source: ABdhPJxjZyySX5fwYcAXNTCF9wcbj4Dd64cppDWyvJWPAOmapNLLp5/miMVuTETEOZ0dreimK7uwug==
X-Received: by 2002:a17:902:c941:b0:15d:37b0:2d26 with SMTP id
 i1-20020a170902c94100b0015d37b02d26mr4565192pla.67.1651341234865; 
 Sat, 30 Apr 2022 10:53:54 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 5-20020a170902c20500b0015e8d4eb282sm1740910pll.204.2022.04.30.10.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 10:53:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/17] target/m68k: Implement TRAPV
Date: Sat, 30 Apr 2022 10:53:37 -0700
Message-Id: <20220430175342.370628-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430175342.370628-1-richard.henderson@linaro.org>
References: <20220430175342.370628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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


