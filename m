Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06142544909
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 12:38:31 +0200 (CEST)
Received: from localhost ([::1]:50288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzFYc-0004LO-1R
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 06:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7Y-0001d9-4O
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:28 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7W-00062j-Lu
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:27 -0400
Received: by mail-wr1-x431.google.com with SMTP id o8so3625311wro.3
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=mf8AdCDhGe88lxvbihB81XSJ6frI4E36LSXViphWNvA=;
 b=fhkawx0VuNJ92c0NYT4sqHx/3AXzhkL7Hbw0A1MglNgQ8isWqSEmJhaINdD6x7rub5
 mOj+N9+CgBavt8uNwB9c8hvRJhosjKKpx59/M8HPwCmWFlpnSMEveEH+Gkm4YznUOTVl
 gDmJ9YLUcsGjeTnW/Dx420CvYgOKuozhI1nFzhsHRmhJyWJDj4JKfcAnmksAJN4pGvk+
 e7E6DqGd5y3Y9BOzszfcduHFTes1YOI3PsGWBAdPoSNziupslK00tC2RCd01Nnr7t95N
 9s1wiAmNY+epPeUyQOGr5TxYnkrL+319uGtTnfz8u5+QdGDriy0XhyF31zkCgeUI6coz
 dEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mf8AdCDhGe88lxvbihB81XSJ6frI4E36LSXViphWNvA=;
 b=HTpt/jVwCtUhQuKdQ+mpKa8QLTwhMCzbjjWMZ4K/TNuotydz7cOsr5bJlqnilE4dfz
 0O3KwfNViTB3ztEWmnRguq37fp1HwihtSUf4x9klf+ga1Bx+cxDMpuc3rzoic0eLb8dt
 4R6H50cv2lo3IjlzpCFfBVz/l6QrxB+Aej6cn0eZAU03ArsFZ3Nx03s8XAdc4bjKSxOX
 LUg+3W4dyA0OjCEpextdxyscTLcwznRzbtG/XTIGc/bcKOWyos1IVpdVmm0MbLOSwG4K
 yaNXDdJQ2W/t0ZbqgRytY3Nb4kBIOIXv26Lhg01Gd7amG9+Z/HN1XwR5JVSihe0v2k2o
 haSw==
X-Gm-Message-State: AOAM5313zIwUxqb6g5yxg4S6kif9rQu9q8zM7lEDijooRwh+kkkkns19
 J8SpkckTnSdbQGDaRWN/LZYKZ9cs5vhV6A==
X-Google-Smtp-Source: ABdhPJxwx8+jezwyFCFrMbGIWNavaWtdRE7WKR4UxnujdsVZd8k36O8fWjAFngC4X/gHs+EI+vzdPg==
X-Received: by 2002:a5d:4344:0:b0:20c:cad4:9e9b with SMTP id
 u4-20020a5d4344000000b0020ccad49e9bmr36843473wrr.187.1654765585953; 
 Thu, 09 Jun 2022 02:06:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 43/55] target/arm: Hoist arm_is_el2_enabled check in
 sve_exception_el
Date: Thu,  9 Jun 2022 10:05:25 +0100
Message-Id: <20220609090537.1971756-44-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

This check is buried within arm_hcr_el2_eff(), but since we
have to have the explicit check for CPTR_EL2.TZ, we might as
well just check it once at the beginning of the block.

Once this is done, we can test HCR_EL2.{E2H,TGE} directly,
rather than going through arm_hcr_el2_eff().

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220607203306.657998-9-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 40b60b1eea2..61e8026d0e3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6183,15 +6183,12 @@ int sve_exception_el(CPUARMState *env, int el)
         }
     }
 
-    /*
-     * CPTR_EL2 changes format with HCR_EL2.E2H (regardless of TGE).
-     */
-    if (el <= 2) {
-        uint64_t hcr_el2 = arm_hcr_el2_eff(env);
-        if (hcr_el2 & HCR_E2H) {
+    if (el <= 2 && arm_is_el2_enabled(env)) {
+        /* CPTR_EL2 changes format with HCR_EL2.E2H (regardless of TGE). */
+        if (env->cp15.hcr_el2 & HCR_E2H) {
             switch (FIELD_EX64(env->cp15.cptr_el[2], CPTR_EL2, ZEN)) {
             case 1:
-                if (el != 0 || !(hcr_el2 & HCR_TGE)) {
+                if (el != 0 || !(env->cp15.hcr_el2 & HCR_TGE)) {
                     break;
                 }
                 /* fall through */
@@ -6199,7 +6196,7 @@ int sve_exception_el(CPUARMState *env, int el)
             case 2:
                 return 2;
             }
-        } else if (arm_is_el2_enabled(env)) {
+        } else {
             if (FIELD_EX64(env->cp15.cptr_el[2], CPTR_EL2, TZ)) {
                 return 2;
             }
-- 
2.25.1


