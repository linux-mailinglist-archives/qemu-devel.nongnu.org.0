Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4802C301EA6
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 21:14:33 +0100 (CET)
Received: from localhost ([::1]:42826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3lmK-0006Gc-BQ
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 15:14:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3ljg-0002ly-2r; Sun, 24 Jan 2021 15:11:49 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:36486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3ljc-00088w-B8; Sun, 24 Jan 2021 15:11:47 -0500
Received: by mail-wm1-x333.google.com with SMTP id i9so2445924wmq.1;
 Sun, 24 Jan 2021 12:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pR8RIRikWmMM4mIlnRJBEZUYigNw7whrBQqm3cZ/N6c=;
 b=j36P9siOi40WYv3UEWAAlhqr+z143duUla2hc6EKVfgGmkx1Y6IjoBlBRHzzSQOAWH
 7+oBfJke8lCDrIOXrEdlhKwhAEzEQjaJ+CmmSCrfd2DMVJ3La11Rd+CzWAgUcXDfV1hC
 FBbbFNjLkb3zY3Pv1fhwEbm0AZ+wdRbDPMRZg5TQdSjW+lfgSXlpgfv5nb08xkOsXSlP
 wa2DBd6TaWnvYnYi32sYyuGRpBhPLPEuDo6lOKu99j0z4knR8C3+lkMlUMfksns7dbIB
 SqWbCyECjkvetD1lxMbAQwSbtToIX12hBYxFYN3Yejjr009nkjaI/uBz8FpAsdBuoqf6
 w3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pR8RIRikWmMM4mIlnRJBEZUYigNw7whrBQqm3cZ/N6c=;
 b=NpJzoHMi6rSaaPOBQDCDsMAigbBKPqpo4MeOE1scQ4ec/sgMRiyjQXiF2ntKJNTI+G
 hV1owVKEmSi1MQ6kI9eAf/+plLSbN4+Jh1ayt0r05RZwYy9Cfgl4EPGFeX0FnpgaPPRk
 MsA0OVnzPxFZGozToh6Zopnlw2W+mmahSuF1STLpFUct8xjdFal3IBts1z/MaGrhaaU7
 WYg83glTi15UgwihbXLaIiJLlMi8wPJOGtWSWfJVFNxWfo1eGp4uViFMRpEyvop3gn2c
 PtGjxy3I3KcvmMv79E4J/UVIyLOySZoJyTRE130jDTxVRGEmYSQIBAZVZSW1kELhsRXJ
 Oo0A==
X-Gm-Message-State: AOAM532Zs33rVumcrkSiU2JQwT22712ItmRWce3CnzvVu6Fs6sf8YOhz
 uiZUsDOuQilKIbHwNxvYdVI9Qnm+KZw=
X-Google-Smtp-Source: ABdhPJwPLK53We6ngm+2hPCb3ZPsXtFvZlL1GMgfN34eTqOkq306GrtBkoqK5WU/7NDjjaizsAqZgw==
X-Received: by 2002:a1c:6802:: with SMTP id d2mr12631028wmc.32.1611519102375; 
 Sun, 24 Jan 2021 12:11:42 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id m11sm11589758wmc.15.2021.01.24.12.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 12:11:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 7/9] hw/sd: ssi-sd: Fix the wrong command index for
 STOP_TRANSMISSION
Date: Sun, 24 Jan 2021 21:11:04 +0100
Message-Id: <20210124201106.2602238-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210124201106.2602238-1-f4bug@amsat.org>
References: <20210124201106.2602238-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

This fixes the wrong command index for STOP_TRANSMISSION, the
required command to interrupt the multiple block read command,
in the old codes. It should be CMD12 (0x4c), not CMD13 (0x4d).

Fixes: 775616c3ae8c ("Partial SD card SPI mode support")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210123104016.17485-10-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/ssi-sd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 1cdaf73c292..12dffb6f55e 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -83,7 +83,7 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
     ssi_sd_state *s = SSI_SD(dev);
 
     /* Special case: allow CMD12 (STOP TRANSMISSION) while reading data.  */
-    if (s->mode == SSI_SD_DATA_READ && val == 0x4d) {
+    if (s->mode == SSI_SD_DATA_READ && val == 0x4c) {
         s->mode = SSI_SD_CMD;
         /* There must be at least one byte delay before the card responds.  */
         s->stopping = 1;
-- 
2.26.2


