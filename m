Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C14BB41DD3F
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:19:29 +0200 (CEST)
Received: from localhost ([::1]:38438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVxqK-0001bl-NW
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:19:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjE-0008WS-Nj
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:10 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjC-0003sq-BZ
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:08 -0400
Received: by mail-wr1-x434.google.com with SMTP id w29so10651914wra.8
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 08:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GM2JxCRaBytatr1OYZoPy0AOg6Otwsdfxo/5ZWRKoz0=;
 b=xY/HKGGf3T8nrKMXw3W5mRRRmX0Uiv3gxCZrDe9nsDaNkrI1ppe6Wdlh1BY1BmILRF
 gOtnWss4MZUquj7CMtC3W/1YXd5zFNbXZSAdNHhLutlUMiX19xgs5QEXnETSviuQYDXX
 L5Y2GIRE8A1hccOrtvOtSmC/YUVlNrvsFRNFSquFcn1vj1LbRQ409TL6yygTK8YJ9mf7
 3dd3ZCx6yuGyYu719uYmTZXTLYASJHXyyitLVHE569x+7MFHHsUTQwrlTg46Tbjh9SHI
 RFkmEhO82EW9COgMEjcHJN90EyH1zDTm4Bo30UsPMctVwuQv0gTq5bq11XSM0y/hOLdV
 VkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GM2JxCRaBytatr1OYZoPy0AOg6Otwsdfxo/5ZWRKoz0=;
 b=O8c7nXw5q5PXGtIQvqyGi4EuL0zeVEAcUnjPcwY+XjS23NAK0cROhFFqddm1UdFuJ/
 vOUl5yPCOru/IwGvm5BaWtMUVbOgXu06SdUpqse81lm2ouTV0k8sMYA7h5ekRTcs8dnJ
 016CyK9etmxtMbhYbEqvOHaAVduFgLqcgfj9Uq6APXxi8WseZhEY4YejHcRpyiqaQz7M
 L8Y3bISNY93fo3Zrq9yHQCw78/8ZJe+TB/24KW1hDhAlmdwnNiuQbFXLxlD/3mV5sec5
 vZA21yoR9JeG/Wxv21YunueqE0DMJV9zrbWZAhEJ+1gtbDrJoGn8twSy/itRQoucEP67
 gPPw==
X-Gm-Message-State: AOAM532tDVpvV5my4Rd6+JL/7ua/G8SZrqCibkI17qMoaCAju0YPZbTX
 KOGN+FDaoqkPVelmCw7ZX857cTIb2Mw9UA==
X-Google-Smtp-Source: ABdhPJxp+vCfYp4Jk1cD8Nal8Dcn8aOHo7GmL4CF7E6gAZh2cEotxzMUqZHo1m/pstIOEqKZZcisxA==
X-Received: by 2002:adf:fe89:: with SMTP id l9mr6867795wrr.0.1633014724350;
 Thu, 30 Sep 2021 08:12:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g8sm1952098wrm.46.2021.09.30.08.12.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 08:12:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/22] allwinner-h3: Switch to SMC as PSCI conduit
Date: Thu, 30 Sep 2021 16:11:40 +0100
Message-Id: <20210930151201.9407-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210930151201.9407-1-peter.maydell@linaro.org>
References: <20210930151201.9407-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

From: Alexander Graf <agraf@csgraf.de>

The Allwinner H3 SoC uses Cortex-A7 cores which support virtualization.
However, today we are configuring QEMU to use HVC as PSCI conduit.

That means HVC calls get trapped into QEMU instead of the guest's own
emulated CPU and thus break the guest's ability to execute virtualization.

Fix this by moving to SMC as conduit, freeing up HYP completely to the VM.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Message-id: 20210920203931.66527-1-agraf@csgraf.de
Fixes: 740dafc0ba0 ("hw/arm: add Allwinner H3 System-on-Chip")
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/allwinner-h3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index 27f10701453..f9b7ed18711 100644
--- a/hw/arm/allwinner-h3.c
+++ b/hw/arm/allwinner-h3.c
@@ -237,7 +237,7 @@ static void allwinner_h3_realize(DeviceState *dev, Error **errp)
 
         /* Provide Power State Coordination Interface */
         qdev_prop_set_int32(DEVICE(&s->cpus[i]), "psci-conduit",
-                            QEMU_PSCI_CONDUIT_HVC);
+                            QEMU_PSCI_CONDUIT_SMC);
 
         /* Disable secondary CPUs */
         qdev_prop_set_bit(DEVICE(&s->cpus[i]), "start-powered-off",
-- 
2.20.1


