Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 543373A69DC
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:15:38 +0200 (CEST)
Received: from localhost ([::1]:49022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsoJN-0001lD-Ap
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:15:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEP-0000Qg-3B
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:29 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoED-00008x-WD
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:27 -0400
Received: by mail-wr1-x435.google.com with SMTP id q5so14962102wrm.1
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wLKWOfdh8MVGMCYkZ8MMRjxOVKgXTKW3dsNyETHielg=;
 b=E1gYWnEdmHtw5uefagJ5cnQlfvVhm5zOHnqabNOUZixaspyitsE7UB0Kl4PKQPpnHM
 Kx6Z3JbcIRHKnkZDvpAblV8qu3kyJLaquzdg04B/Tuy5tuQEnSXQOY1XwodSWs8UjQHY
 R+iM/OB1t96JFKgscAGRtH/5soL0e7DoyOtF6Rlu7hjkz+okB05QKEjf1lUtIhoezTYu
 w9EYHBR/YMEjuGRX/Jg6L7jHcu6QN7NtKmH01n9hw4Rkv1jtV32OT+h/O5q77KpTUp7o
 dizOtzRVDGP9pu07LbfRJeeHsnag/j/+It1V2alrw+vWQyOscyomxU2Q/lrPKcxgRh7b
 fPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wLKWOfdh8MVGMCYkZ8MMRjxOVKgXTKW3dsNyETHielg=;
 b=qntF814EPFm6ogJZLTWLRN0PC6d/K49tLlCoMQFFmlgdTh+MNg/kZq7GmHrbAGLvQj
 GvC3LuAVJ9O2trV0JJS07m25mhf8UEcPRdjmaIn7yyXQOevzqmGnYVzOdThflZaP2CHk
 KhUQnrXUbxVMx7g6RZmTV1cJZGrGroVreCiw6YwIZ81S9YtFzPq75t2pj+9L8aJB7+c8
 1QhOm+ixsDxKqVATY5apAQ1Llqj/lTL+SIfq+RqMKaNfLdgd9/X3GN4f8RhWJbIwnhj2
 dHECFgJneHlm1fXicEiu06+KkKnip2+l6FXBicMqH6L0B7TVZVwaRX8fwFWijgokP5ez
 9Nng==
X-Gm-Message-State: AOAM533wrgYyXeznsx8STq5M4u/0YlS1OgydCgcScXqEAwi6jqTiz7rE
 MLEtt0YqmKJBpkKO8v7TMsTbXGySsqP/2w==
X-Google-Smtp-Source: ABdhPJy9EtHeFeVzvDq80kUPsp1HXSzQi0U8LUMHh2uD4oEAi8N7OBB/ds3hBiZaEgD+wR+nHUcbpQ==
X-Received: by 2002:adf:e8cb:: with SMTP id k11mr18840595wrn.127.1623683416555; 
 Mon, 14 Jun 2021 08:10:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 07/57] target/arm: Implement MVE WLSTP insn
Date: Mon, 14 Jun 2021 16:09:17 +0100
Message-Id: <20210614151007.4545-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
v1->v2: swapped LE/WLS lines in t32.decode; added missing return
---
 target/arm/t32.decode  |  8 ++++++--
 target/arm/translate.c | 37 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 087e514e0ac..6906829265f 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -672,8 +672,12 @@ BL               1111 0. .......... 11.1 ............         @branch24
     %lob_imm 1:10 11:1 !function=times_2
 
     DLS          1111 0 0000 100     rn:4 1110 0000 0000 0001
-    WLS          1111 0 0000 100     rn:4 1100 . .......... 1 imm=%lob_imm
-    LE           1111 0 0000 0 f:1 0 1111 1100 . .......... 1 imm=%lob_imm
+    WLS          1111 0 0000 100     rn:4 1100 . .......... 1 imm=%lob_imm size=4
+    {
+      LE         1111 0 0000 0 f:1 0 1111 1100 . .......... 1 imm=%lob_imm
+      # This is WLSTP
+      WLS        1111 0 0000 0 size:2 rn:4 1100 . .......... 1 imm=%lob_imm
+    }
 
     LCTP         1111 0 0000 000     1111 1110 0000 0000 0001
   ]
diff --git a/target/arm/translate.c b/target/arm/translate.c
index c49561590c9..78878e9b194 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8134,7 +8134,11 @@ static bool trans_WLS(DisasContext *s, arg_WLS *a)
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
@@ -8147,10 +8151,41 @@ static bool trans_WLS(DisasContext *s, arg_WLS *a)
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
+            return true;
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


