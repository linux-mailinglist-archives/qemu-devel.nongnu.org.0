Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CE750B4C8
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:15:04 +0200 (CEST)
Received: from localhost ([::1]:41696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqJb-0005GY-Iq
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:15:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9i-0004Et-7P
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:50 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9g-0002bB-1M
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:49 -0400
Received: by mail-wr1-x42c.google.com with SMTP id u3so10335030wrg.3
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=OtRB/R8Eaisib9dHQMdldij6U8w9ALtuwnHTBkYALOQ=;
 b=FehyDWsEEgYSg5WIaq3bp0r9T9KKZcHTAsN+3XpOP69kHn61e3fXAR2x94KGTvAhf7
 soOGqUeKkGcGR4OuvM2flLk1rLKK0ct9DEq0bOfgOrwisv+6EHc8lXFLHKdU4jYt+0MF
 gQsC2BT0olgZO4iBWpznEIFOy+OIxr2FTbK93lcxyxwCqc7ulwP6S3TZhi57lK51XN5K
 CC2jPFfm74oa8sS9BYKAcNOd1tnWobiI9OVf4CsLf45zm19bR93gVbwEfKhweLTJJE5x
 gBojETDNyNxMasBwK5QxdkUlKW6uGei/pkmN4tupHAp54d9XgNvjWMOfuaqz2cIOxQf9
 xeSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OtRB/R8Eaisib9dHQMdldij6U8w9ALtuwnHTBkYALOQ=;
 b=jZ6Mk6C9mlq/v/iUDzF41hiPQZJ4m1oui1o5uHUAZR9X7fUpSESJ1sPuS+G6yDtYlK
 ylSCLAVp6PBIYLCA4NsJ9TMr8ocbuEIj8by/wBau0cTlhe6q34kJgXWKRmAxmA31SdDg
 FdeyvaYYbOcOiOOA4HVbI53gkkR8zD8nZNzm3tedhq4LMOccUtO0osMo/QdGrogNlfmq
 ZCCtEK3E0PXx/Iit+nwPU7q5zRIfvBqKyCz/ZAe72YLm+G3BoNtCLLhdiU9pE8UQv6uH
 S2fG5Nuae5SRsBFgzQ4nTOLRkQw6OY3hZuaGs9b22WQ0n+x6InLz6PpqdW2U3R1lMvLn
 K3dg==
X-Gm-Message-State: AOAM532vPYhUSHSB2BCe+H+J4QBLsKtElNYsiBOS/K8QtVe0GdKLykDQ
 XCRavX2Uf7+4MIlmQDuXcVUNwuZmLLp7uw==
X-Google-Smtp-Source: ABdhPJwRTBizb3d6IabYKrY92cJU8fUgkrzUJ0Fh6OGu/+EiiMVNMEizRRfUqAoQnm/hBixTxBv7ZQ==
X-Received: by 2002:adf:fb48:0:b0:203:f986:874a with SMTP id
 c8-20020adffb48000000b00203f986874amr3089835wrs.614.1650621886607; 
 Fri, 22 Apr 2022 03:04:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.04.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:04:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/61] hw/intc/arm_gicv3_its: Split out process_its_cmd()
 physical interrupt code
Date: Fri, 22 Apr 2022 11:03:44 +0100
Message-Id: <20220422100432.2288247-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

Split the part of process_its_cmd() which is specific to physical
interrupts into its own function.  This is the part which starts by
taking the ICID and looking it up in the collection table.  The
handling of virtual interrupts is significantly different (involving
a lookup in the vPE table) so structuring the code with one
sub-function for the physical interrupt case and one for the virtual
interrupt case will be clearer than putting both cases in one large
function.

The code for handling the "remove mapping from ITE" for the DISCARD
command remains in process_its_cmd() because it is common to both
virtual and physical interrupts.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-14-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_its.c | 51 ++++++++++++++++++++++++++---------------
 1 file changed, 33 insertions(+), 18 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index a2a4e3de56e..e7e1769fa41 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -397,6 +397,19 @@ static ItsCmdResult lookup_cte(GICv3ITSState *s, const char *who,
     return CMD_CONTINUE_OK;
 }
 
+static ItsCmdResult process_its_cmd_phys(GICv3ITSState *s, const ITEntry *ite,
+                                         int irqlevel)
+{
+    CTEntry cte;
+    ItsCmdResult cmdres;
+
+    cmdres = lookup_cte(s, __func__, ite->icid, &cte);
+    if (cmdres != CMD_CONTINUE_OK) {
+        return cmdres;
+    }
+    gicv3_redist_process_lpi(&s->gicv3->cpu[cte.rdbase], ite->intid, irqlevel);
+    return CMD_CONTINUE_OK;
+}
 
 /*
  * This function handles the processing of following commands based on
@@ -410,34 +423,36 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
                                        uint32_t eventid, ItsCmdType cmd)
 {
     DTEntry dte;
-    CTEntry cte;
     ITEntry ite;
     ItsCmdResult cmdres;
+    int irqlevel;
 
     cmdres = lookup_ite(s, __func__, devid, eventid, &ite, &dte);
     if (cmdres != CMD_CONTINUE_OK) {
         return cmdres;
     }
 
-    if (ite.inttype != ITE_INTTYPE_PHYSICAL) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: invalid ITE\n",
-                      __func__);
-        return CMD_CONTINUE;
+    irqlevel = (cmd == CLEAR || cmd == DISCARD) ? 0 : 1;
+
+    switch (ite.inttype) {
+    case ITE_INTTYPE_PHYSICAL:
+        cmdres = process_its_cmd_phys(s, &ite, irqlevel);
+        break;
+    case ITE_INTTYPE_VIRTUAL:
+        if (!its_feature_virtual(s)) {
+            /* Can't happen unless guest is illegally writing to table memory */
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: invalid type %d in ITE (table corrupted?)\n",
+                          __func__, ite.inttype);
+            return CMD_CONTINUE;
+        }
+        /* The GICv4 virtual interrupt handling will go here */
+        g_assert_not_reached();
+    default:
+        g_assert_not_reached();
     }
 
-    cmdres = lookup_cte(s, __func__, ite.icid, &cte);
-    if (cmdres != CMD_CONTINUE_OK) {
-        return cmdres;
-    }
-
-    if ((cmd == CLEAR) || (cmd == DISCARD)) {
-        gicv3_redist_process_lpi(&s->gicv3->cpu[cte.rdbase], ite.intid, 0);
-    } else {
-        gicv3_redist_process_lpi(&s->gicv3->cpu[cte.rdbase], ite.intid, 1);
-    }
-
-    if (cmd == DISCARD) {
+    if (cmdres == CMD_CONTINUE_OK && cmd == DISCARD) {
         ITEntry ite = {};
         /* remove mapping from interrupt translation table */
         ite.valid = false;
-- 
2.25.1


