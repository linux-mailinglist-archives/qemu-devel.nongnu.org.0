Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9E0509EDF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:45:00 +0200 (CEST)
Received: from localhost ([::1]:51832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhVF5-0006Fh-CZ
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUq6-0003Ba-VG
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:10 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUq5-0003WQ-5E
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:10 -0400
Received: by mail-wr1-x42d.google.com with SMTP id w4so6175948wrg.12
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=d+s9Ayr2MToy3NwUrcI6rbLNGvw59lNw6jFaFEZj0pg=;
 b=trl0v42oRATPMLSLwQnyQsz1N3yV0jiv33fUxMzqUe0cApeqCAkDL/2nV64QYsMapZ
 nvl4ifx70k/aUeGDr/BmLqlUvn3qJj+eDz+rSwSaLG3oOyw+wmJaJhwTOMDA4uL+vtyY
 a3aCNl+iMZnYoZ4N4rUAsfom8SpG3CANlbW+zia1I7RYjVzotWkBZn3uWnPqe8iA4X1Z
 ahhmoGJu8Bd76EB80UmkEDzdD3LbRQp+Vga/yv6XkzqpGpy7E9Aid7s3Pp+JA4gGjOlN
 Lk7cH89wqWxi+a5ehDhUrj7gdpJbRso9VIQDpT9vJVGHgRymH5O2FpwoKtDFdbOMD9MO
 ewwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d+s9Ayr2MToy3NwUrcI6rbLNGvw59lNw6jFaFEZj0pg=;
 b=4oSpbQBLah1NeM/HNNHl0ikff+LZyou8b/drI6iTWfxChWEOPqwZrsVgH1b3Ct3q1O
 iKuAho5160kJRJZ9hLlZOdTe1k9ERHsaaue1oEbADUFYW4xS+5l2HCT6u+t0KWBh/MYT
 MAWwskE6l4GQGyvdkF8zb/tN2fosvb1kKq7zX36MqAybL34juvCyaLgR7ZNaW0bTmsqu
 1y/c5AabKCYtpg4gbSHBc5BKu8un2ZdDe2kbfYMTg78PgLzjlRxfXDqXUqM59/dljWX5
 aGrf7lHpcLoRvNEhm8n1xNlCoRMbkKe41RyiKsb6odzcs3mwxvFBtMizmjWR4t0twtt4
 8Lhg==
X-Gm-Message-State: AOAM5322/jNupzocea3rHSMN9waj9v+sdTWOOn7NfkTXO7TbU/PcE+WK
 YT4WSHMd3t9p04lPDx4MCi5fd9Haq+UA9Q==
X-Google-Smtp-Source: ABdhPJyT6kGMBhGk/dBkYKaG9DXMT8buMB++lfA+lDqbESdhmHi3u0/94k7vhMPqZNO3ltIyLRMTkA==
X-Received: by 2002:a5d:4348:0:b0:206:1c79:fd57 with SMTP id
 u8-20020a5d4348000000b002061c79fd57mr19555430wrr.344.1650539947766; 
 Thu, 21 Apr 2022 04:19:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b0020a8bbbb72bsm2597694wrq.97.2022.04.21.04.19.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 04:19:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/31] hw/arm/exynos4210: Don't connect multiple lines to
 external GIC inputs
Date: Thu, 21 Apr 2022 12:18:37 +0100
Message-Id: <20220421111846.2011565-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421111846.2011565-1-peter.maydell@linaro.org>
References: <20220421111846.2011565-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

The combiner_grp_to_gic_id[] array includes the EXT_GIC_ID_MCT_G0
and EXT_GIC_ID_MCT_G1 multiple times. This means that we will
connect multiple IRQs up to the same external GIC input, which
is not permitted. We do the same thing in the code in
exynos4210_init_board_irqs() because the conditionals selecting
an irq_id in the first loop match multiple interrupt IDs.

Overall we do this for interrupt IDs
(1, 4), (12, 4), (35, 4), (51, 4), (53, 4) for EXT_GIC_ID_MCT_G0
and
(1, 5), (12, 5), (35, 5), (51, 5), (53, 5) for EXT_GIC_ID_MCT_G1

These correspond to the cases for the multi-core timer that we are
wiring up to multiple inputs on the combiner in
exynos4210_combiner_get_gpioin().  That code already deals with all
these interrupt IDs being the same input source, so we don't need to
connect the external GIC interrupt for any of them except the first
(1, 4) and (1, 5). Remove the array entries and conditionals which
were incorrectly causing us to wire up extra lines.

This bug didn't cause any visible effects, because we only connect
up a device to the "primary" ID values (1, 4) and (1, 5), so the
extra lines would never be set to a level.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220404154658.565020-16-peter.maydell@linaro.org
---
 include/hw/arm/exynos4210.h |  2 +-
 hw/arm/exynos4210.c         | 12 +++++-------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index f58ee0f2686..7da3eddea5f 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -77,7 +77,7 @@
  * one for every non-zero entry in combiner_grp_to_gic_id[].
  * We'll assert in exynos4210_init_board_irqs() if this is wrong.
  */
-#define EXYNOS4210_NUM_SPLITTERS (EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ + 60)
+#define EXYNOS4210_NUM_SPLITTERS (EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ + 54)
 
 typedef struct Exynos4210Irq {
     qemu_irq int_combiner_irq[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 962d6d0ac2a..39e334e0773 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -231,7 +231,7 @@ combiner_grp_to_gic_id[64 - EXYNOS4210_MAX_EXT_COMBINER_OUT_IRQ][8] = {
     /* int combiner group 34 */
     { EXT_GIC_ID_ONENAND_AUDI, EXT_GIC_ID_NFC },
     /* int combiner group 35 */
-    { 0, 0, 0, EXT_GIC_ID_MCT_L1, EXT_GIC_ID_MCT_G0, EXT_GIC_ID_MCT_G1 },
+    { 0, 0, 0, EXT_GIC_ID_MCT_L1 },
     /* int combiner group 36 */
     { EXT_GIC_ID_MIXER },
     /* int combiner group 37 */
@@ -240,11 +240,11 @@ combiner_grp_to_gic_id[64 - EXYNOS4210_MAX_EXT_COMBINER_OUT_IRQ][8] = {
     /* groups 38-50 */
     { }, { }, { }, { }, { }, { }, { }, { }, { }, { }, { }, { }, { },
     /* int combiner group 51 */
-    { EXT_GIC_ID_MCT_L0, 0, 0, 0, EXT_GIC_ID_MCT_G0, EXT_GIC_ID_MCT_G1 },
+    { EXT_GIC_ID_MCT_L0 },
     /* group 52 */
     { },
     /* int combiner group 53 */
-    { EXT_GIC_ID_WDT, 0, 0, 0, EXT_GIC_ID_MCT_G0, EXT_GIC_ID_MCT_G1 },
+    { EXT_GIC_ID_WDT },
     /* groups 54-63 */
     { }, { }, { }, { }, { }, { }, { }, { }, { }, { }
 };
@@ -268,13 +268,11 @@ static void exynos4210_init_board_irqs(Exynos4210State *s)
 
     for (n = 0; n < EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ; n++) {
         irq_id = 0;
-        if (n == EXYNOS4210_COMBINER_GET_IRQ_NUM(1, 4) ||
-                n == EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 4)) {
+        if (n == EXYNOS4210_COMBINER_GET_IRQ_NUM(1, 4)) {
             /* MCT_G0 is passed to External GIC */
             irq_id = EXT_GIC_ID_MCT_G0;
         }
-        if (n == EXYNOS4210_COMBINER_GET_IRQ_NUM(1, 5) ||
-                n == EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 5)) {
+        if (n == EXYNOS4210_COMBINER_GET_IRQ_NUM(1, 5)) {
             /* MCT_G1 is passed to External and GIC */
             irq_id = EXT_GIC_ID_MCT_G1;
         }
-- 
2.25.1


