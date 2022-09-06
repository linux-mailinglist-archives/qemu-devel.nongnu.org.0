Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D81E45AE6E1
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 13:50:09 +0200 (CEST)
Received: from localhost ([::1]:37856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVX5k-0007mS-Rp
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 07:50:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWk-0000GK-Dn
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:58 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWi-0003YD-9l
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:54 -0400
Received: by mail-wr1-x433.google.com with SMTP id bq9so1755360wrb.4
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=+Nxeige1gsl6QD9Ah+wLZGOyW7/vtIOclomTIADO4Ks=;
 b=UpR8njbHsrTe3pJcEhOkBMWN1N0j0+81p+iRgEmzPSwml9xRjOa70Tn/FboQCdBGGg
 O/yqU9pEyNtHfz6v39+A7xeOhrYqhzQ8MHwf0Uq6AwjvXn98UUodKIC2nJbr1ya1Q7eV
 mEn/7HIv7hP+fhRmz20x9GrXLa/h20ZcmzR0umvlLFVCK+Hf6FoRPtXpvb9RJQtQdyxp
 cVxIczdfmIsWKRmXEnDHVkiWYAYvwq/LipUR2wv+hfB4xEHAwCtGztEyHNDqAduuNbQ1
 JOCFJY4sbX31jSlDY+eDatQls3Ma1s459wvbioINW8KkHzh9Cl7dfAzPkJY4mqubDJJS
 kDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+Nxeige1gsl6QD9Ah+wLZGOyW7/vtIOclomTIADO4Ks=;
 b=xWTM4TuxRtTMlF7qGy7E9807H8RwJiqN02ruSb0FBRIwUlh5GegIG30TCKzoPejOos
 /NKfv6SxUZTaEKc/lYa+n5sCmFuC3N4mv4Hply9baSA6IkIo7Dg7xzrFElI6eH9/qcPU
 3vBlHfm80FeZsj3iGSlR/F3mqM3yHvRHDfPHbZBuAFEpNHlW/PQytObdsIF8PlnhAs4E
 B94bt88/fmgdRJ8jUQpCL1FWIxCkAmNCRhwcdtppcMb7yCfVbfA/QqDQC56OMLG9Aox7
 xv5ItEaxIWIdxSp9VDjTHh6QXgl1B3xf15b3pm0Ma+QBnXOO/twFnjPjAD4wZcDy3acw
 iatg==
X-Gm-Message-State: ACgBeo1wtNlm9kV7YS4EH9zu0FEjwts0E5KIBjnuJOmLOh5Apl7MdjnE
 AHdRsexHi0sdQjqD+illsgloGCce24nq+uPZ
X-Google-Smtp-Source: AA6agR7b+GPyK549a0B0XL6M3V478R0Bu+vqa9kacZ/jugvru8CTvBN//uysbYhNslAFoVRdbTytJQ==
X-Received: by 2002:a5d:62cc:0:b0:228:afe3:9fce with SMTP id
 o12-20020a5d62cc000000b00228afe39fcemr4150515wrv.618.1662458991597; 
 Tue, 06 Sep 2022 03:09:51 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a1c6a19000000b003a840690609sm23125014wmc.36.2022.09.06.03.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:09:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 18/23] target/i386: Use gen_jmp_rel for loop and jecxz insns
Date: Tue,  6 Sep 2022 11:09:27 +0100
Message-Id: <20220906100932.343523-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906100932.343523-1-richard.henderson@linaro.org>
References: <20220906100932.343523-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
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

With gen_jmp_rel, we may chain to the next tb
instead of merely writing to eip and exiting.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 07c7764649..fdd17c3cf3 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -7355,24 +7355,18 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0xe2: /* loop */
     case 0xe3: /* jecxz */
         {
-            TCGLabel *l1, *l2, *l3;
-
-            tval = (int8_t)insn_get(env, s, MO_8);
-            tval += s->pc - s->cs_base;
-            if (dflag == MO_16) {
-                tval &= 0xffff;
-            }
+            TCGLabel *l1, *l2;
+            int diff = (int8_t)insn_get(env, s, MO_8);
 
             l1 = gen_new_label();
             l2 = gen_new_label();
-            l3 = gen_new_label();
             gen_update_cc_op(s);
             b &= 3;
             switch(b) {
             case 0: /* loopnz */
             case 1: /* loopz */
                 gen_op_add_reg_im(s, s->aflag, R_ECX, -1);
-                gen_op_jz_ecx(s, s->aflag, l3);
+                gen_op_jz_ecx(s, s->aflag, l2);
                 gen_jcc1(s, (JCC_Z << 1) | (b ^ 1), l1);
                 break;
             case 2: /* loop */
@@ -7385,14 +7379,11 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             }
 
-            gen_set_label(l3);
-            gen_update_eip_next(s);
-            tcg_gen_br(l2);
+            gen_set_label(l2);
+            gen_jmp_rel(s, MO_32, 0, 1);
 
             gen_set_label(l1);
-            gen_jmp_im(s, tval);
-            gen_set_label(l2);
-            s->base.is_jmp = DISAS_EOB_ONLY;
+            gen_jmp_rel(s, dflag, diff, 0);
         }
         break;
     case 0x130: /* wrmsr */
-- 
2.34.1


