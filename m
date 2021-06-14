Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 170923A69EA
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:18:39 +0200 (CEST)
Received: from localhost ([::1]:57506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsoMI-0007Sx-2M
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoER-0000aI-MI
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:31 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEG-0000B1-8z
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:31 -0400
Received: by mail-wr1-x42b.google.com with SMTP id c9so14928014wrt.5
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZYZmZ6K4YIcfkUOlRx3KM4viUKJePuISMqyhbUGc/bw=;
 b=Q9HGlxlcL6SjoifneaV4+jmr6l6FpWsMiJV8fbSCPEc6qot98DGWhIWsfBwhYwg2Gs
 MHq7UPxySFi5D6gcsYnuLpO8SBrqmQdd8Y0GmgV4jBRouxanLo+1RF6fwnyJF2adUp1Y
 W1jRQ/aeaVyOyjmtkkRchAixgWq1D3iwy9/4qsRYY8tu9iLyI22iuW69WjOQWvGBbxUl
 OMYhieHDLbvdZerwnBRkl/ZPXZyg5XwfA4KzoTyre3mZvI0JBN3Q5MujRXGrlM+QDtaS
 6IDeDMw5dnK2B+R4tcDb7EzoWijow8ReOv54sUdX/KDvNDJKAY9sSf4TA/rieP6qmZnK
 HGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZYZmZ6K4YIcfkUOlRx3KM4viUKJePuISMqyhbUGc/bw=;
 b=f6M4RnhyX/c1IybA7y0kd4ltq+76KUD+FkmHuNJU9hRqHVSqNSYN+q3iDj+YUR8fIE
 o393WxS0DieCBUjHTjW713eTB1GgzOSPLl/CJS5zsV4W7jj/2gTlCw7vJaivak32mxvG
 fZlfyYRRwpVIIaThYFysFuQQlW9TvQ1LoCiJ8DWzW8CNtFqbyqCGaaYeV7hBAEUnoLLq
 X7n0FsLTGPn39QK2nQfdNkd3eyc9cF67uJHtIxkHj8VOeDQ1FqCLCDSXQorb0nAcMHSU
 T2FZngsG8+lkP3Wubixj0Y9BuRzfllIAPINbGGf85wY9wRDzCGFELKdFjPYQ/bsqMmq6
 qr7g==
X-Gm-Message-State: AOAM530sttVGaBPNGa/0xpifqrKqFshUVk3M7fysWfoi9WvcmT/6vpnf
 Li/l83xJlq7kSCTuh9OADuNnVQ==
X-Google-Smtp-Source: ABdhPJzNq/LOx3+NGxYltSYL5EZcZJRM/PAEeUv4rYc5TtmrqguylhlRNY/729dKLHLUkD6RZoMMrg==
X-Received: by 2002:adf:eac3:: with SMTP id o3mr19258475wrn.157.1623683418105; 
 Mon, 14 Jun 2021 08:10:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 08/57] target/arm: Implement MVE DLSTP
Date: Mon, 14 Jun 2021 16:09:18 +0100
Message-Id: <20210614151007.4545-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

Implement the MVE DLSTP insn; this is like the existing DLS
insn, except that it must do an FPU access check and it
sets LTPSIZE to the value specified in the insn.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


