Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 851A339E514
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:15:58 +0200 (CEST)
Received: from localhost ([::1]:51204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqIqz-0002IA-Ij
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaC-0007Hi-GH
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:58:36 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIa7-0007tA-6Q
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:58:36 -0400
Received: by mail-wr1-x42f.google.com with SMTP id e11so8224865wrg.3
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qXvH1vi1pgLZA0WzTFhBoxaYbsc0kgsAP29TskDY8yA=;
 b=el2Ylv4+ZokDTvENqLinVNrcmlHyNM5+qdpwTk+SlKvOEehpu3N5nsIHJfrAOSIeHt
 q/VgSuwBe5/7pE8ZtAQ5LhEQh34AftGOHnU1j4OkzMgY08ljafCkT6fsx+hwDT2g5eqk
 BM4E9UDvqQ4J6XY+mpbJn1Z8qBZaj52FFOMo8rcGlzAsD4Kt3ZHyB5l3V3FCxadGz+AY
 LstDkr2Bx4bEdoTvUpjTxEEGuO3bTWBm3cTHHYTzmyXBJNs8Wd01QPG9UvadcJk9Yq5f
 wmFLgrac3yWvkdVTs7G+enMXYnMMVqz70S18qfB7/AergeKnmgyusrxtMjI+hxlB5PP+
 7ehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qXvH1vi1pgLZA0WzTFhBoxaYbsc0kgsAP29TskDY8yA=;
 b=NMp/v30FqvZ+lH7keEb1DrEY+Dx/8k3R+ieS9QW/SFgEbQ0s8k0uV8+8UM1rQR31B5
 Q/WO3QBfzloAdHaWFXfynYSohT+JTbCIcehXsdAeDnn8g3cp76xy2PZBh3uhHrvh2Bxn
 XUHcFZEUh+4VYuclEtfdqzLD6XiKbbbQ1XLTCzBch2Mod8XIT8INQIwQE1CIxeKCnLQU
 DmPu0tP6IY8V1FA1a15jGiC+KaHDW9ItvF2bMZdmUfGgaFxmkMrsRkiz/DRHU8lokFX5
 LfHTFZd7JCTEAqP+SnGVP54pLiWN0ZWAbuPPrNRUe3l9UqSiZ4ig/8Mq16kAPp887CYJ
 m0eg==
X-Gm-Message-State: AOAM530P+f31ncW4SgoUM4sIrwCBxUQn0g1jUjU0YzRDjr+hbJb+aqhW
 k6ybhPHnlFvD09OmHOXkx5wcQg==
X-Google-Smtp-Source: ABdhPJziFgT0s9iY2HaaXhtBmc03R5KI5CtaLHErMovBs9b6m2svMXH2TOrj3/SyKBBmTbOO4Qb1hg==
X-Received: by 2002:adf:e5c7:: with SMTP id a7mr17870285wrn.117.1623085109965; 
 Mon, 07 Jun 2021 09:58:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 07/55] target/arm: Implement MVE WLSTP insn
Date: Mon,  7 Jun 2021 17:57:33 +0100
Message-Id: <20210607165821.9892-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE WLSTP insn; this is like the existing WLS insn,
except that it specifies a size value which is used to set
FPSCR.LTPSIZE.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/t32.decode  |  8 ++++++--
 target/arm/translate.c | 36 +++++++++++++++++++++++++++++++++++-
 2 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 087e514e0ac..4f0c686a3c3 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -672,8 +672,12 @@ BL               1111 0. .......... 11.1 ............         @branch24
     %lob_imm 1:10 11:1 !function=times_2
 
     DLS          1111 0 0000 100     rn:4 1110 0000 0000 0001
-    WLS          1111 0 0000 100     rn:4 1100 . .......... 1 imm=%lob_imm
-    LE           1111 0 0000 0 f:1 0 1111 1100 . .......... 1 imm=%lob_imm
+    WLS          1111 0 0000 100     rn:4 1100 . .......... 1 imm=%lob_imm size=4
+    {
+      # This is WLSTP
+      WLS        1111 0 0000 0 size:2 rn:4 1100 . .......... 1 imm=%lob_imm
+      LE         1111 0 0000 0 f:1 0 1111 1100 . .......... 1 imm=%lob_imm
+    }
 
     LCTP         1111 0 0000 000     1111 1110 0000 0000 0001
   ]
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 2f6c012f672..79ec185dd83 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8135,7 +8135,11 @@ static bool trans_WLS(DisasContext *s, arg_WLS *a)
         return false;
     }
     if (a->rn == 13 || a->rn == 15) {
-        /* CONSTRAINED UNPREDICTABLE: we choose to UNDEF */
+        /*
+         * For WLSTP rn == 15 is a related encoding (LE); the
+         * other cases caught by this condition are all
+         * CONSTRAINED UNPREDICTABLE: we choose to UNDEF
+         */
         return false;
     }
     if (s->condexec_mask) {
@@ -8148,10 +8152,40 @@ static bool trans_WLS(DisasContext *s, arg_WLS *a)
          */
         return false;
     }
+    if (a->size != 4) {
+        /* WLSTP */
+        if (!dc_isar_feature(aa32_mve, s)) {
+            return false;
+        }
+        /*
+         * We need to check that the FPU is enabled here, but mustn't
+         * call vfp_access_check() to do that because we don't want to
+         * do the lazy state preservation in the "loop count is zero" case.
+         * Do the check-and-raise-exception by hand.
+         */
+        if (s->fp_excp_el) {
+            gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
+                               syn_uncategorized(), s->fp_excp_el);
+        }
+    }
+
     nextlabel = gen_new_label();
     tcg_gen_brcondi_i32(TCG_COND_EQ, cpu_R[a->rn], 0, nextlabel);
     tmp = load_reg(s, a->rn);
     store_reg(s, 14, tmp);
+    if (a->size != 4) {
+        /*
+         * WLSTP: set FPSCR.LTPSIZE. This requires that we do the
+         * lazy state preservation, new FP context creation, etc,
+         * that vfp_access_check() does. We know that the actual
+         * access check will succeed (ie it won't generate code that
+         * throws an exception) because we did that check by hand earlier.
+         */
+        bool ok = vfp_access_check(s);
+        assert(ok);
+        tmp = tcg_const_i32(a->size);
+        store_cpu_field(tmp, v7m.ltpsize);
+    }
     gen_jmp_tb(s, s->base.pc_next, 1);
 
     gen_set_label(nextlabel);
-- 
2.20.1


