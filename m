Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDE55F0CC3
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 15:51:35 +0200 (CEST)
Received: from localhost ([::1]:52930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeGQQ-0002od-Ca
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 09:51:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeGAo-0000GK-TY
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:35:26 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeGAk-0006Vw-G9
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:35:26 -0400
Received: by mail-wr1-x42c.google.com with SMTP id r6so6900918wru.8
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 06:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=c+FYVmj0JEyf0MfnmUSKTWHaE3vpV75V3WufrP8RknE=;
 b=y8U8iaSI72QCuJuIz1uL/WKFmpJDBIxQZxGn/MTH6byzgzaRH2AbkeTJ5XgbfrwFOE
 vzNB7yu5FZrnhiv1GlgAiqaNoVusgPdWyuc0koprKr5vcMPrqlmUqnPSuk9PlHg4Ndjn
 hHWYA9Ca6Rmy93WU8/Lm8TZ7NMjO2KA+7dgDgt3o8Whw1CjV9l8P/XLmLQ2HyHSENYq5
 6ofq4u9rCmWgG5tVnnnFQmNTYiNvG1WXfA4FTsU0qqWPixS/ulCzUAuGqFpIen/h0aqV
 5gUA7cFGdhSlBS3M6rLswYyuAJcFatpph+FjjcjYdkS57X+z58lQEhRAeadUlXN2+Ubj
 uWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=c+FYVmj0JEyf0MfnmUSKTWHaE3vpV75V3WufrP8RknE=;
 b=uELLOSafRW+YsR+aK+jHGkdYN5spXvC/eRULR1OAStE5UgIWTnLBMwh3O9X0vV/iHb
 4e/Adj7dhHVW0E9jl3li829XH96x/uNWJ/0tnliUrYpQxlVOKMRCYD/t8WpYdqFeW2Zm
 +Xu4ZXcJdD4cj0OLFlBqyDMjYOKPPllQ4vJsEr+T5imNLHBYJuKymO64FisXYHf8/fLd
 X+SxDVjsjUjaPMjNwB57yWh8xwa9mbUnYq+EcMUG1cRc5jiPwzMkHFF08CqYXjWEyTZh
 UfqhCGx5sTml2PTC/qsYveiTXwwBTumZ3PhdNnyg2S8/QeKd/mA9uLyQVCNKhPzUqpx4
 oQlw==
X-Gm-Message-State: ACrzQf2navrjfhDBfNT1zZzxKzFCsD/uXp/SUTlr/G/V1zBRQron2Ran
 R/Auu3By4VnWFa4XxYuKU0tjw5JznlHt6g==
X-Google-Smtp-Source: AMsMyM56qTEggK89qCCyuf8YkYyndoYp3HZwRL/3DUoeXpCKigQWmLrY3vU4AS714rFpG++M9k4eTQ==
X-Received: by 2002:a05:6000:69d:b0:22a:fa56:86b9 with SMTP id
 bo29-20020a056000069d00b0022afa5686b9mr5944894wrb.193.1664544921074; 
 Fri, 30 Sep 2022 06:35:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q12-20020adfcd8c000000b0021e4829d359sm1982551wrj.39.2022.09.30.06.35.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 06:35:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/10] hw/arm/virt: Fix devicetree warning about the SMMU node
Date: Fri, 30 Sep 2022 14:35:10 +0100
Message-Id: <20220930133511.2112734-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220930133511.2112734-1-peter.maydell@linaro.org>
References: <20220930133511.2112734-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

The SMMUv3 node isn't expected to have clock properties
(unlike the SMMUv2). Fix the corresponding dt-validate warning:

  smmuv3@9050000: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
  From schema: linux/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
[PMM: tweaked commit message as suggested by Eric]
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-id: 20220927100347.176606-7-jean-philippe@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b67ba0f2a10..cda9defe8f0 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1361,8 +1361,6 @@ static void create_smmu(const VirtMachineState *vms,
     qemu_fdt_setprop(ms->fdt, node, "interrupt-names", irq_names,
                      sizeof(irq_names));
 
-    qemu_fdt_setprop_cell(ms->fdt, node, "clocks", vms->clock_phandle);
-    qemu_fdt_setprop_string(ms->fdt, node, "clock-names", "apb_pclk");
     qemu_fdt_setprop(ms->fdt, node, "dma-coherent", NULL, 0);
 
     qemu_fdt_setprop_cell(ms->fdt, node, "#iommu-cells", 1);
-- 
2.25.1


