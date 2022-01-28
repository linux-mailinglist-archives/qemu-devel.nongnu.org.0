Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D0B49FDC0
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 17:13:45 +0100 (CET)
Received: from localhost ([::1]:56756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDTse-0005z7-L8
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 11:13:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDJ-0002De-NK
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:31:03 -0500
Received: from [2a00:1450:4864:20::435] (port=40811
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDB-0006RL-Kj
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:58 -0500
Received: by mail-wr1-x435.google.com with SMTP id s18so11561831wrv.7
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 07:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SmcQS5N83uze4IvwHy2cA3voYK/E+OCh44VoG8TqeA4=;
 b=zlD9l3ktJZrUN5nx99rgsjFdoRNl8TIeNSMS58+uLdBMTXKchTyJMEHVCsc7Q3DPbi
 06DCZKqEYz43TSJbCIHR8o5IAsfut6KMZIbyuVuB1e8D6CoNNjhgKZD5PIlwACCRSp0S
 mq9ndDDOB5i2mcPGkiaPTsWOtPmrfp6CVRWUpMftMdJvqhF7f21CGr6UW1+nGc51TntE
 eEJlrEw/D8Y3cfzJH8JsW+PwaAZkHq22Qp4QjMFRFvaPrG753oAG7OSnt+2yIXYI9AWu
 2jY8Kko89QQD6gkRw6SkbQP2u9Eoe6SFldgwo1d7kJ8YpeqYDgyOV6qPWqgWweUa8zBn
 Z+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SmcQS5N83uze4IvwHy2cA3voYK/E+OCh44VoG8TqeA4=;
 b=SrLCc9cb/y3SR0vTiRZQO8mOKWwd6vjgtjAQev0r4pyDhosue5swR+GTHa43rNA7tC
 XSIAPK/L0jVGuMY8SMRzyEXa38d0g/SS4Iep2O/2XeHR5c8cPJ7ZW1WULk2M2QfIGtdZ
 xsTbrrAAH84GQMfa5MS6QbIRIy5VBV67ed5yfNinWT2B98u3hz0ODufW0WdFueW+ioux
 5qJegqlV+QTpJg8xGMyTr3ZkD5gdNBIJjvCeMLyoTEfyO9vrC6eVLN7uTBKvREXJqcjA
 sOKovPnVMGPpSVYOaKnEDDIS85QYs0+rWbZL0IBQq1elc60O+fKk6+gLLVOdGyudlF2p
 stSg==
X-Gm-Message-State: AOAM530gVoyNauEzWbWZHs/Is7uZ18P50/YclpLfYCMNhkx2MqWOCDye
 IxF23STW9fwtGkhuXNQW/nih8EqlyZxGmQ==
X-Google-Smtp-Source: ABdhPJyHIMBHlUoIihk8Y1vZozhmh/zWlIjedvieQ+Q0TSpmiYxCplpT8XHW+M6hfn+7ztrDZU5uQQ==
X-Received: by 2002:a5d:5001:: with SMTP id e1mr7593695wrt.415.1643383842433; 
 Fri, 28 Jan 2022 07:30:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j3sm4749485wrb.57.2022.01.28.07.30.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 07:30:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/32] hw/arm: ast2600: Fix address mapping of second SPI
 controller
Date: Fri, 28 Jan 2022 15:30:08 +0000
Message-Id: <20220128153009.2467560-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128153009.2467560-1-peter.maydell@linaro.org>
References: <20220128153009.2467560-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Cédric Le Goater <clg@kaod.org>

Address should be 0x1E631000 and not 0x1E641000 as initially introduced.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/838
Fixes: f25c0ae1079d ("aspeed/soc: Add AST2600 support")
Suggested-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20220126083520.4135713-1-clg@kaod.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/aspeed_ast2600.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 8f37bdb1d87..12f6edc081f 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -29,7 +29,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
     [ASPEED_DEV_PWM]       = 0x1E610000,
     [ASPEED_DEV_FMC]       = 0x1E620000,
     [ASPEED_DEV_SPI1]      = 0x1E630000,
-    [ASPEED_DEV_SPI2]      = 0x1E641000,
+    [ASPEED_DEV_SPI2]      = 0x1E631000,
     [ASPEED_DEV_EHCI1]     = 0x1E6A1000,
     [ASPEED_DEV_EHCI2]     = 0x1E6A3000,
     [ASPEED_DEV_MII1]      = 0x1E650000,
-- 
2.25.1


