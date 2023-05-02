Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C716F4396
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:20:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptovA-00047o-DC; Tue, 02 May 2023 08:15:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptoui-0003oD-6c
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:36 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouU-0003Bw-2S
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:16 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f1cfed93e2so36863625e9.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 05:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683029707; x=1685621707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=a/x/pKjjQ+LLdU/H1JDM3JqQV2lznwc+DzdZ8y/lNHo=;
 b=KKJMgcL1+tg96ke07hPnhNoppZZJy9lNb5p1uaYWBfCpQbqZNMHwjvjRjO0IATlTnL
 JzDjCm2h5MEhfWxi7ZeJthQeZ3xiyjYp2PkSZCNr9mWmM0LlJc3plWutTOXp+j3b+WXk
 vXfje+Psi5cvcCVxKOJ+fJJRWgMosR5DtT53plVASpZxUw1eyBasyEQkDwumB16qpP2d
 pTqInEM+PPHwyifQhmCR28gKstpuoqVUmrvbLLSXaC2P29qsIzpb4ij4C6/H5enSQNGj
 HzfNSQoG1ZLhuFAuE1UsnCpYN+Sec6xzRtJBY/hdo6WUhe5aatdSG0FAvWmNXvKuoUr8
 0XHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683029707; x=1685621707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a/x/pKjjQ+LLdU/H1JDM3JqQV2lznwc+DzdZ8y/lNHo=;
 b=VPfuyqbQwmcW5WO3z+l/UGs3r0hVpirVfVV8s6LSzEUVk5LVqJvtJ728WFTNZI+yKq
 lBQ4UIAgS1lLqT0F2sfT01+9MbFVQu0O8kwmdsSEnUtRK4cL2uxpypxmwFiPesvBau9y
 qllvQHFAGOnmjKLklewmaM7+Jz7E1KsgusdfnBAtxqmshb1V1GU9/dlJgdd3g5jIoEWJ
 WOkBHrfqBs4DiBneJ7H4qxPTFCGRq5nDbgOx24FHWC4iQh5hCrRCaXS+kfmUMr7wFUvB
 T8vqqveKamzkbiabcSvGAKjuvpwC9HTNkkcU4ba6FobeK4UOgqdXm7zQzyUmP+dWFNfC
 JbyQ==
X-Gm-Message-State: AC+VfDyx1CbbUtYjCico0XG4yvDWyUebN5Q39Y2WUX5ejD7qvmrl9PXL
 Ma7Ar+kY1Wa8fnpGIk1vn1OnjeXmFTf2BwXKibg=
X-Google-Smtp-Source: ACHHUZ6/oCgrPhR9F+88HTkX5u19Acp9NPjemdwVLphjakN5dSSwZ7GInfdyABd3R0/GLedz/89CGw==
X-Received: by 2002:a05:600c:213:b0:3f1:8223:6683 with SMTP id
 19-20020a05600c021300b003f182236683mr11304212wmi.40.1683029707675; 
 Tue, 02 May 2023 05:15:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm35040330wmk.20.2023.05.02.05.15.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:15:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/35] hw/net: npcm7xx_emc: set MAC in register space
Date: Tue,  2 May 2023 13:14:38 +0100
Message-Id: <20230502121459.2422303-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502121459.2422303-1-peter.maydell@linaro.org>
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Patrick Venture <venture@google.com>

The MAC address set from Qemu wasn't being saved into the register space.

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
[PMM: moved variable declaration to top of function]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/net/npcm7xx_emc.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c
index 7c86bb52e57..8156f701b07 100644
--- a/hw/net/npcm7xx_emc.c
+++ b/hw/net/npcm7xx_emc.c
@@ -98,6 +98,8 @@ static const char *emc_reg_name(int regno)
 
 static void emc_reset(NPCM7xxEMCState *emc)
 {
+    uint32_t value;
+
     trace_npcm7xx_emc_reset(emc->emc_num);
 
     memset(&emc->regs[0], 0, sizeof(emc->regs));
@@ -112,6 +114,16 @@ static void emc_reset(NPCM7xxEMCState *emc)
 
     emc->tx_active = false;
     emc->rx_active = false;
+
+    /* Set the MAC address in the register space. */
+    value = (emc->conf.macaddr.a[0] << 24) |
+        (emc->conf.macaddr.a[1] << 16) |
+        (emc->conf.macaddr.a[2] << 8) |
+        emc->conf.macaddr.a[3];
+    emc->regs[REG_CAMM_BASE] = value;
+
+    value = (emc->conf.macaddr.a[4] << 24) | (emc->conf.macaddr.a[5] << 16);
+    emc->regs[REG_CAML_BASE] = value;
 }
 
 static void npcm7xx_emc_reset(DeviceState *dev)
@@ -432,13 +444,25 @@ static bool emc_receive_filter1(NPCM7xxEMCState *emc, const uint8_t *buf,
         }
     case ETH_PKT_UCAST: {
         bool matches;
+        uint32_t value;
+        struct MACAddr mac;
         if (emc->regs[REG_CAMCMR] & REG_CAMCMR_AUP) {
             return true;
         }
+
+        value = emc->regs[REG_CAMM_BASE];
+        mac.a[0] = value >> 24;
+        mac.a[1] = value >> 16;
+        mac.a[2] = value >> 8;
+        mac.a[3] = value >> 0;
+        value = emc->regs[REG_CAML_BASE];
+        mac.a[4] = value >> 24;
+        mac.a[5] = value >> 16;
+
         matches = ((emc->regs[REG_CAMCMR] & REG_CAMCMR_ECMP) &&
                    /* We only support one CAM register, CAM0. */
                    (emc->regs[REG_CAMEN] & (1 << 0)) &&
-                   memcmp(buf, emc->conf.macaddr.a, ETH_ALEN) == 0);
+                   memcmp(buf, mac.a, ETH_ALEN) == 0);
         if (emc->regs[REG_CAMCMR] & REG_CAMCMR_CCAM) {
             *fail_reason = "MACADDR matched, comparison complemented";
             return !matches;
@@ -661,15 +685,9 @@ static void npcm7xx_emc_write(void *opaque, hwaddr offset,
         break;
     case REG_CAMM_BASE + 0:
         emc->regs[reg] = value;
-        emc->conf.macaddr.a[0] = value >> 24;
-        emc->conf.macaddr.a[1] = value >> 16;
-        emc->conf.macaddr.a[2] = value >> 8;
-        emc->conf.macaddr.a[3] = value >> 0;
         break;
     case REG_CAML_BASE + 0:
         emc->regs[reg] = value;
-        emc->conf.macaddr.a[4] = value >> 24;
-        emc->conf.macaddr.a[5] = value >> 16;
         break;
     case REG_MCMDR: {
         uint32_t prev;
-- 
2.34.1


