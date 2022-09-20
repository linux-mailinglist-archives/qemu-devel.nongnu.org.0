Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B665BF170
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 01:43:57 +0200 (CEST)
Received: from localhost ([::1]:42596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oamuC-00051Q-I8
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 19:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj8x-0001Sk-UI; Tue, 20 Sep 2022 15:42:58 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:39492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj8s-0001s2-5x; Tue, 20 Sep 2022 15:42:54 -0400
Received: by mail-oi1-x229.google.com with SMTP id m130so5107633oif.6;
 Tue, 20 Sep 2022 12:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=AKCd8svD5kLZzI6UHx5xLgyBjSzwgjIkL2QVeHIKiyU=;
 b=hHRUmN8ii5GnhZXlDg85q+LHZ/awFq7u9xycFcdoppKGlTJHdSlADZ5z23ptpXQ3Ng
 BiplWRg/ORaVS0h2ccNrpi1dEb5UIFOgcEwUr5VhRCTRpaEZtuEnKigeQNyrGhEqiAQ4
 mxg6C0iSPRqQJF3osAyFDEMDw+NhWwn3ArWzaR3uGQHMwdsnJi0fSBaCAh7fNSXu2WoC
 08zLe57iMXG7bKWZvgAuQn3tcrlBTlGgs2Z427fk3nzALO1hYmWXwSj2uqErTSIO47P3
 FaYszc5OyqZApqOAF4sIsuGHMXC2+5H5meY59pRucPzh+UlgkXTW6sIm4syKNG6BrFlt
 +bCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=AKCd8svD5kLZzI6UHx5xLgyBjSzwgjIkL2QVeHIKiyU=;
 b=X+VY4u2SuUKm3Tq7wRfCeQj3wKctZnZzPxgjwJ22CW6g365+j5C+xym4o9kppnFAM3
 lLBBeq1ju3kBqdbmqE41ggsS2681gfu4VQRqpTlwuY3jDJmtFyZf6uNbq0+qxojlOBR0
 jGVNDVG4+sIuwaOyUL3WkaEBRHeP5xRR+a18FfCGtwIRI/cgCYPWVsSlzE8BI0apWwja
 UcN4Xm8hVAQa9YKVjFC0HmYSFjSKbjQgep59YSX4WCZRNTakUEzO+RTxSOWmz6eXAB2c
 yfUeOyVsXfbk55yBRoak2f6sMEbqzC8r//2+VJ8umsgTDOoD7AWxhhs1cw1iAbeEzEVU
 W9lw==
X-Gm-Message-State: ACrzQf3TgdaUhkkmpCmGaxN/gDmiv2CnBBJ7F2TIcV5D1+8feXSJMFjm
 yeHYw9gJKrN8bQ43e2EjNboWNyibZ94=
X-Google-Smtp-Source: AMsMyM7NjcRz9ZfaKCDFe3hVaia56Y590sZA8SJ81EFHChmsAWEkFBVn2LpH8rJbA2W2T6LDMMwXrQ==
X-Received: by 2002:aca:180e:0:b0:345:16a5:fd29 with SMTP id
 h14-20020aca180e000000b0034516a5fd29mr2399936oih.116.1663702956574; 
 Tue, 20 Sep 2022 12:42:36 -0700 (PDT)
Received: from balboa.COMFAST ([191.193.2.69])
 by smtp.gmail.com with ESMTPSA id
 e33-20020a05687023a100b0012763819bcasm333808oap.50.2022.09.20.12.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 12:42:36 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 10/17] target/ppc: Set result to QNaN for DENBCD when VXCVI
 occurs
Date: Tue, 20 Sep 2022 16:41:55 -0300
Message-Id: <20220920194202.82615-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920194202.82615-1-danielhb413@gmail.com>
References: <20220920194202.82615-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Víctor Colombo <victor.colombo@eldorado.org.br>

According to the ISA, for instruction DENBCD:
"If an invalid BCD digit or sign code is detected in the source
operand, an invalid-operation exception (VXCVI) occurs."

In the Invalid Operation Exception section, there is the situation:
"When Invalid Operation Exception is disabled (VE=0) and Invalid
Operation occurs (...) If the operation is an (...) or format the
target FPR is set to a Quiet NaN". This was not being done in
QEMU.

This patch sets the result to QNaN when the instruction DENBCD causes
an Invalid Operation Exception.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220906125523.38765-5-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/dfp_helper.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index be7aa5357a..cc024316d5 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -1147,6 +1147,26 @@ static inline uint8_t dfp_get_bcd_digit_128(ppc_vsr_t *t, unsigned n)
     return t->VsrD((n & 0x10) ? 0 : 1) >> ((n << 2) & 63) & 15;
 }
 
+static inline void dfp_invalid_op_vxcvi_64(struct PPC_DFP *dfp)
+{
+    /* TODO: fpscr is incorrectly not being saved to env */
+    dfp_set_FPSCR_flag(dfp, FP_VX | FP_VXCVI, FPSCR_VE);
+    if ((dfp->env->fpscr & FP_VE) == 0) {
+        dfp->vt.VsrD(1) = 0x7c00000000000000; /* QNaN */
+    }
+}
+
+
+static inline void dfp_invalid_op_vxcvi_128(struct PPC_DFP *dfp)
+{
+    /* TODO: fpscr is incorrectly not being saved to env */
+    dfp_set_FPSCR_flag(dfp, FP_VX | FP_VXCVI, FPSCR_VE);
+    if ((dfp->env->fpscr & FP_VE) == 0) {
+        dfp->vt.VsrD(0) = 0x7c00000000000000; /* QNaN */
+        dfp->vt.VsrD(1) = 0x0;
+    }
+}
+
 #define DFP_HELPER_ENBCD(op, size)                                           \
 void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b,             \
                  uint32_t s)                                                 \
@@ -1173,7 +1193,8 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b,             \
             sgn = 0;                                                         \
             break;                                                           \
         default:                                                             \
-            dfp_set_FPSCR_flag(&dfp, FP_VX | FP_VXCVI, FPSCR_VE);            \
+            dfp_invalid_op_vxcvi_##size(&dfp);                               \
+            set_dfp##size(t, &dfp.vt);                                       \
             return;                                                          \
         }                                                                    \
         }                                                                    \
@@ -1183,7 +1204,8 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b,             \
         digits[(size) / 4 - n] = dfp_get_bcd_digit_##size(&dfp.vb,           \
                                                           offset++);         \
         if (digits[(size) / 4 - n] > 10) {                                   \
-            dfp_set_FPSCR_flag(&dfp, FP_VX | FP_VXCVI, FPSCR_VE);            \
+            dfp_invalid_op_vxcvi_##size(&dfp);                               \
+            set_dfp##size(t, &dfp.vt);                                       \
             return;                                                          \
         } else {                                                             \
             nonzero |= (digits[(size) / 4 - n] > 0);                         \
-- 
2.37.3


