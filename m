Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB863A8612
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:07:45 +0200 (CEST)
Received: from localhost ([::1]:49626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBbM-0008MX-Re
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:07:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBFM-0006e5-VV
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:45:02 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBEo-00010Z-2N
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:45:00 -0400
Received: by mail-wr1-x435.google.com with SMTP id c5so18843349wrq.9
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 08:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=fMuKWHdkuM/4hkeCSU4QtVyaP/N9W3vegrM1ehuyoIo=;
 b=zQf9vrUINjtUmsIL88ISDn/VE4kpcg/doYy72HyI2jXHgbiBs6r4BjE1PNFHOgZU04
 R3E+tqPqaZPUMLPrdXcHdhQqSm43i3elT1d7W8quCEP2s5vtbaOx/UUy5j+JSA08mX4j
 lwEs17iAxprahoXnIUYaiNqdkix+vPX+QJsMh12TkKXKNQ3roO8O+GEhjXAgqJtLMQJg
 IeppPPuPXiVgk1q+996yrwRv03ThhbJt9S4kd9OdO+aaUFpVYhmmATgzkOc7OQMIf2CJ
 3tnyUpX2xP3On0ybVTviYFKPgc5OlKI20QSt1cRj4E/pYREzKqCcp6qXOcYdrFaQaUaT
 xMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fMuKWHdkuM/4hkeCSU4QtVyaP/N9W3vegrM1ehuyoIo=;
 b=A0OHkrh5KtIbfdsO0SfMMx3gcmHvBepu0s4TvoWFCqt3zZPJoIwAhjt5r7+5EhnggO
 beSrxWmwl24dG1ic7Su4jCW/fYR49c6++LE9hy7Vz1OKMrAzg1GTUhhkSxSX8Tu/RVtv
 rvE9TBEYbCJqdMTTISCUWRseD5ffruDErtkAoUgH7d4yShuvvhNy2y4C9tQa481pqOMs
 zpYvYwPRtN3QX78/26hE4bpfR3spWgbLRjU+wNaXct+i6jd3CuLMZoGFbYJpMuxuU0Zc
 f5VMbRd1nGGyMWfYUFVvhKFyluSxjOJBgm3272wANYYzXfIWojnfH9H1F50/4vCbNX+o
 dslw==
X-Gm-Message-State: AOAM5302xH1FVH1TMnHQOQs4YL/v4Gn12QpPthlHbj1CRoFm4oZ+Z+WV
 EzTpfb4TD/wfY2o7GTei1PFStZnvIhWkPQ==
X-Google-Smtp-Source: ABdhPJwDEAqnMpLkldVNM6pmfjHog3P8hmX9wldqdoOACnVeQXRhNwsjJ6lR2MA7xh3gC8jmPMFOWw==
X-Received: by 2002:adf:b34a:: with SMTP id k10mr26183409wrd.333.1623771864537; 
 Tue, 15 Jun 2021 08:44:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d15sm18985662wri.58.2021.06.15.08.44.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 08:44:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/28] target/arm: Implement MVE DLSTP
Date: Tue, 15 Jun 2021 16:44:00 +0100
Message-Id: <20210615154405.21399-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615154405.21399-1-peter.maydell@linaro.org>
References: <20210615154405.21399-1-peter.maydell@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE DLSTP insn; this is like the existing DLS
insn, except that it must do an FPU access check and it
sets LTPSIZE to the value specified in the insn.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210614151007.4545-9-peter.maydell@linaro.org
---
 target/arm/t32.decode  |  9 ++++++---
 target/arm/translate.c | 23 +++++++++++++++++++++--
 2 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 6906829265f..1b75db50658 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -671,14 +671,17 @@ BL               1111 0. .......... 11.1 ............         @branch24
     # LE and WLS immediate
     %lob_imm 1:10 11:1 !function=times_2
 
-    DLS          1111 0 0000 100     rn:4 1110 0000 0000 0001
+    DLS          1111 0 0000 100     rn:4 1110 0000 0000 0001 size=4
     WLS          1111 0 0000 100     rn:4 1100 . .......... 1 imm=%lob_imm size=4
     {
       LE         1111 0 0000 0 f:1 0 1111 1100 . .......... 1 imm=%lob_imm
       # This is WLSTP
       WLS        1111 0 0000 0 size:2 rn:4 1100 . .......... 1 imm=%lob_imm
     }
-
-    LCTP         1111 0 0000 000     1111 1110 0000 0000 0001
+    {
+      LCTP       1111 0 0000 000     1111 1110 0000 0000 0001
+      # This is DLSTP
+      DLS        1111 0 0000 0 size:2 rn:4 1110 0000 0000 0001
+    }
   ]
 }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 78878e9b194..1ad0e61fac6 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8114,13 +8114,32 @@ static bool trans_DLS(DisasContext *s, arg_DLS *a)
         return false;
     }
     if (a->rn == 13 || a->rn == 15) {
-        /* CONSTRAINED UNPREDICTABLE: we choose to UNDEF */
+        /*
+         * For DLSTP rn == 15 is a related encoding (LCTP); the
+         * other cases caught by this condition are all
+         * CONSTRAINED UNPREDICTABLE: we choose to UNDEF
+         */
         return false;
     }
 
-    /* Not a while loop, no tail predication: just set LR to the count */
+    if (a->size != 4) {
+        /* DLSTP */
+        if (!dc_isar_feature(aa32_mve, s)) {
+            return false;
+        }
+        if (!vfp_access_check(s)) {
+            return true;
+        }
+    }
+
+    /* Not a while loop: set LR to the count, and set LTPSIZE for DLSTP */
     tmp = load_reg(s, a->rn);
     store_reg(s, 14, tmp);
+    if (a->size != 4) {
+        /* DLSTP: set FPSCR.LTPSIZE */
+        tmp = tcg_const_i32(a->size);
+        store_cpu_field(tmp, v7m.ltpsize);
+    }
     return true;
 }
 
-- 
2.20.1


