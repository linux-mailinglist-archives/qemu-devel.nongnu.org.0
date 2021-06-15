Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DACD3A85B4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 17:56:28 +0200 (CEST)
Received: from localhost ([::1]:43976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBQR-0001cc-3z
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 11:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBFM-0006bu-8v
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:45:00 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:46682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBEn-00010A-9D
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:45:00 -0400
Received: by mail-wr1-x436.google.com with SMTP id a11so18852703wrt.13
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 08:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gmfa6QuGhqnYPIJbw9iaiqNwq7wBN009XaKddbtNFCk=;
 b=lhKcAingNmdVKh8IzHU2wqosm7ss226Qf/9o8z1BFQwQ3dHJ6+CZv8fXeiygxknF5i
 mBVmSoqp5S/QiQ/7b13iwye7JcBhgy7tOh4FZwP3A0SnRvDHhDoof7IlQ34V5g8oKoaM
 dt11yHKW3Mhi/QzZNizQyJjQKTJlDD1jqFLqV/6mEbCCgLK3Vk+jeu7e3HXOrv3Qj+Oc
 haxCHd5X1ODfxKp8Jo7x23A33B9Vs9QkMY3vXUINey73UPAVgCWKINZKQLTE27JxPbNg
 W9RdxCXyGpZw9qwgzk9ZE+YusvJPw24zgsC6GNcRKwiNnOvuDceM7jB69S44Yo0e0xLq
 j39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gmfa6QuGhqnYPIJbw9iaiqNwq7wBN009XaKddbtNFCk=;
 b=MBS6IxRbHQebq0ZrWGGHyqFUPPsgTQ7diOBkrwM9N7msjXfQrQxBtvr2mYCqSxKx2M
 kQhy6sxecffgFC0spYWhVNndJ46iHlcA7YYGv3aHiuaqVE1qvTw9kKnY10t0zCepjVkC
 K3r/tlm/GK//Qmedkx7XLuedtC50kHLX5j+hGIAcG6BK3PPHm1YJeUltqHVKXpIESCHi
 WcfevR534qSTCkJz7fxG5zX2gWaX5JUZhA44yf4m+ygoGCe6kjd1yX2pEMyN51SPEZGH
 ta7qLlJgkVNoUBPGzHah3/QQbbKSL74usUsOfuDuUTkjjKN1a7rWsUbyFvVtdl+Eh4n2
 dkBA==
X-Gm-Message-State: AOAM53374z0HNk44PtFk7IV+K/LRFoEwCZ9oEGzjW/zdZhsY+2sfppBI
 aJwY/GeIAFau4Xi7WNZDUDrr5JjF+MYQww==
X-Google-Smtp-Source: ABdhPJzy36yXws3ZJTABl+8yDIUtlcFTatmahmNm7oHOKzYSP7IXFp2U9iU+qxE67Lxyg2in5M5X3g==
X-Received: by 2002:a5d:540b:: with SMTP id g11mr26879466wrv.390.1623771863886; 
 Tue, 15 Jun 2021 08:44:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d15sm18985662wri.58.2021.06.15.08.44.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 08:44:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/28] target/arm: Implement MVE WLSTP insn
Date: Tue, 15 Jun 2021 16:43:59 +0100
Message-Id: <20210615154405.21399-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615154405.21399-1-peter.maydell@linaro.org>
References: <20210615154405.21399-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE WLSTP insn; this is like the existing WLS insn,
except that it specifies a size value which is used to set
FPSCR.LTPSIZE.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210614151007.4545-8-peter.maydell@linaro.org
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


