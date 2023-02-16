Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D8D699AD4
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:12:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShnP-00005A-HG; Thu, 16 Feb 2023 12:11:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnM-0008MA-Uz
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:44 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnL-0007tG-6c
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:44 -0500
Received: by mail-wm1-x331.google.com with SMTP id n33so2119585wms.0
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nb5AAn5zyFKHHN1q+dOOj2I4towk0anX1Vqm7ObRW+M=;
 b=O0SuPXKp3pkuo21ByfCvHGxIJr/TGXLSdeC293hEpCd4wHrWHCfYmCxysQdRkDTZIk
 EZsfmTY6VnIX/lmSRca+U4d2VuFeZ5ITSDucW1z1SAHWGDZ8g5QOuzMVBye2e0zMuhs5
 zEJDbnjpZYml7UDAUpGB89xRlKs9VBG5iRTb525oDswNIitlgM08NpPezHouho7dqSzw
 yENAyyfU9pFWwi5cBXUjvtnxqTGFoPcIr3JRsl9M7gbbPpd8BW4V/sYDvTfL8AwwQIg2
 md7/N5duTSorhcgoFREMSrJE3/+JSDlyVweXF3dEVI0w7CWO13BcLrV3TPxt1sKuH1GL
 T4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nb5AAn5zyFKHHN1q+dOOj2I4towk0anX1Vqm7ObRW+M=;
 b=QwngrgTMLHpD38ZZtPz4CPEMrMy2MvsHAvdKoRmqHv/0BPEsLrSO6riSIII1WXt05p
 qbTlavrNJUF69jhozeML2wW64YVyE/x78ka7nY2GrRCuyoa2L+fT0ZTCepPsQAatj7Hl
 G7TcApqnvO5b7N2CyW0kboQyMZZvI87CWtzIM5FeLR/1Da97oObE5c4Fwhuz/iudlFTJ
 ljD1TbTutHMWTAlqpLCSSytdisZe5ph6PUhaCdNpVZdb+QR/MaS318rANf0Lke09htkW
 3gcBT6pBlU4MJGxvGbcZvLIaMl17aQpoOrB43o9sSladzlTLPVP0KZ9tRaV61kHf3SSh
 fLBQ==
X-Gm-Message-State: AO0yUKVdK7ecbepM/NG+ehubWu4kIb59UOxb4Gza0sNaHanxygQMUeIs
 uSaDVtz8q4zkgmA92g/d8YCrAMYoObpl0kbO
X-Google-Smtp-Source: AK7set8eZsEGmgM/UU2qwq0eXtUx0ZDOJJITFd7OKWlXWqGld/oRcTYYrbmHIHFgvTyBgu2Em/eXUQ==
X-Received: by 2002:a05:600c:4752:b0:3df:f7e7:5f01 with SMTP id
 w18-20020a05600c475200b003dff7e75f01mr5676085wmo.15.1676567502456; 
 Thu, 16 Feb 2023 09:11:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002c556a4f1casm2049107wru.42.2023.02.16.09.11.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:11:41 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/30] hw/arm/smmu-common: Fix TTB1 handling
Date: Thu, 16 Feb 2023 17:11:13 +0000
Message-Id: <20230216171123.2518285-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216171123.2518285-1-peter.maydell@linaro.org>
References: <20230216171123.2518285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Addresses targeting the second translation table (TTB1) in the SMMU have
all upper bits set (except for the top byte when TBI is enabled). Fix
the TTB1 check.

Reported-by: Ola Hugosson <ola.hugosson@arm.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Message-id: 20230214171921.1917916-3-jean-philippe@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/smmu-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 2b8c67b9a1d..0a5a60ca1e9 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -249,7 +249,7 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
         /* there is a ttbr0 region and we are in it (high bits all zero) */
         return &cfg->tt[0];
     } else if (cfg->tt[1].tsz &&
-           !extract64(iova, 64 - cfg->tt[1].tsz, cfg->tt[1].tsz - tbi_byte)) {
+        sextract64(iova, 64 - cfg->tt[1].tsz, cfg->tt[1].tsz - tbi_byte) == -1) {
         /* there is a ttbr1 region and we are in it (high bits all one) */
         return &cfg->tt[1];
     } else if (!cfg->tt[0].tsz) {
-- 
2.34.1


