Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B865A8618
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 20:54:17 +0200 (CEST)
Received: from localhost ([::1]:55614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTSqt-0007tr-S3
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 14:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSnm-0001lf-NH; Wed, 31 Aug 2022 14:51:02 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32]:46815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSnk-0007yo-OD; Wed, 31 Aug 2022 14:51:02 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-11f4e634072so12014406fac.13; 
 Wed, 31 Aug 2022 11:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=EvI+U5slaofXi2edeQoO5f8LAMilLYGiVRxxTqnE+nE=;
 b=nQTi1GpWHhMHosdMEBlMyABnXht7Jzk/tDwzdwZjpxloUk/HWfpJsfXSaFTWzXm1tO
 /zWRbc5dfbDvvX6gf575OIn5VdekIAjWYf5UjAJ58vZkTwcoJQ6Zy9VeNUqWtS+dG3A9
 +wvZiUO0gBEAJXbrGwuGzcxO/hEDekzTUUPNny2NO5Yq5Tkvl8L+bx5A9PpeTcGS1bsP
 F8t12LaamWW59n1ep3h7u/lb8UzrxI7UTmCtHv5X+GXa3b7Wh5126NMofYCLxgDwFT7O
 /mlKji2gkXpdB0h7niFnVoRLyYilZGsvpj8RQ+c9DLCH41HryHOSfse8R8bTAOr08sIy
 V+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=EvI+U5slaofXi2edeQoO5f8LAMilLYGiVRxxTqnE+nE=;
 b=ypW5OGTItGGy6Vw19lKae3rcA9vAWFDXYBI8hbf4Sx7xrqEwDGOvtzgUIkY80upsiZ
 quVNZTf91PZtKaHrOHbb7PDY6HIjbYRHgvREusWBSPdP6SruxHAvrkpDAKvpSns+G2zS
 aRNO5NzZaOH4aFjLUL2sZhp8ZiMXAkv3w91uoUi/B16a4P99cOFjcd2IdkdRgVfhMa+y
 TF3b2ZtRj6EiF/AlezbMn0uMwpnH4EWRLhgnmsZXd5Hjf7MkrNLULaIHLvUgGvs2BptQ
 9WnEhK1Jsv/L8HcawGOFdgQnNo/6h4kvpVj4PhesyIAaAms8d5smIWUG4QznhQc60snt
 3MAg==
X-Gm-Message-State: ACgBeo26DqkNrOMT4yDY58hQemClVu6CcyD6VIzQtJV5+Z4upCXlusDy
 Ezu7JnRMXpnyIuGpmnuNwJM9sfG17nQ=
X-Google-Smtp-Source: AA6agR7hgb9MXYADGAYo94vbeFobjWGEocfow2sOpOYrPNU8UOOXpy/xqwAlX5XUrVFdXS2Nop9+Ag==
X-Received: by 2002:a05:6870:5804:b0:11c:b6d0:b844 with SMTP id
 r4-20020a056870580400b0011cb6d0b844mr2216523oap.184.1661971859130; 
 Wed, 31 Aug 2022 11:50:59 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:50:58 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: [PULL 04/60] fpu: Add rebias bool, value and operation
Date: Wed, 31 Aug 2022 15:49:38 -0300
Message-Id: <20220831185034.23240-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x32.google.com
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

Added the possibility of recalculating a result if it overflows or
underflows, if the result overflow and the rebias bool is true then the
intermediate result should have 3/4 of the total range subtracted from
the exponent. The same for underflow but it should be added to the
exponent of the intermediate number instead.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220805141522.412864-2-lucas.araujo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 fpu/softfloat-parts.c.inc     | 21 +++++++++++++++++++--
 fpu/softfloat.c               |  2 ++
 include/fpu/softfloat-types.h |  4 ++++
 3 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index bbeadaa189..a9f268fcab 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -214,18 +214,35 @@ static void partsN(uncanon_normal)(FloatPartsN *p, float_status *s,
                 p->frac_lo &= ~round_mask;
             }
         } else if (unlikely(exp >= exp_max)) {
-            flags |= float_flag_overflow | float_flag_inexact;
-            if (overflow_norm) {
+            flags |= float_flag_overflow;
+            if (s->rebias_overflow) {
+                exp -= fmt->exp_re_bias;
+            } else if (overflow_norm) {
+                flags |= float_flag_inexact;
                 exp = exp_max - 1;
                 frac_allones(p);
                 p->frac_lo &= ~round_mask;
             } else {
+                flags |= float_flag_inexact;
                 p->cls = float_class_inf;
                 exp = exp_max;
                 frac_clear(p);
             }
         }
         frac_shr(p, frac_shift);
+    } else if (unlikely(s->rebias_underflow)) {
+        flags |= float_flag_underflow;
+        exp += fmt->exp_re_bias;
+        if (p->frac_lo & round_mask) {
+            flags |= float_flag_inexact;
+            if (frac_addi(p, p, inc)) {
+                frac_shr(p, 1);
+                p->frac_hi |= DECOMPOSED_IMPLICIT_BIT;
+                exp++;
+            }
+            p->frac_lo &= ~round_mask;
+        }
+        frac_shr(p, frac_shift);
     } else if (s->flush_to_zero) {
         flags |= float_flag_output_denormal;
         p->cls = float_class_zero;
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 4a871ef2a1..c7454c3eb1 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -521,6 +521,7 @@ typedef struct {
 typedef struct {
     int exp_size;
     int exp_bias;
+    int exp_re_bias;
     int exp_max;
     int frac_size;
     int frac_shift;
@@ -532,6 +533,7 @@ typedef struct {
 #define FLOAT_PARAMS_(E)                                \
     .exp_size       = E,                                \
     .exp_bias       = ((1 << E) - 1) >> 1,              \
+    .exp_re_bias    = (1 << (E - 1)) + (1 << (E - 2)),  \
     .exp_max        = (1 << E) - 1
 
 #define FLOAT_PARAMS(E, F)                              \
diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.h
index 7a6ea881d8..0884ec4ef7 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -195,6 +195,10 @@ typedef struct float_status {
     bool snan_bit_is_one;
     bool use_first_nan;
     bool no_signaling_nans;
+    /* should overflowed results subtract re_bias to its exponent? */
+    bool rebias_overflow;
+    /* should underflowed results add re_bias to its exponent? */
+    bool rebias_underflow;
 } float_status;
 
 #endif /* SOFTFLOAT_TYPES_H */
-- 
2.37.2


