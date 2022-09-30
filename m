Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 452E55F0C9E
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 15:43:18 +0200 (CEST)
Received: from localhost ([::1]:38222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeGIP-0008Fu-6o
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 09:43:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeGAn-0000Ac-2r
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:35:25 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeGAi-0006Ue-LC
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:35:24 -0400
Received: by mail-wr1-x434.google.com with SMTP id r6so6900783wru.8
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 06:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=jr87nJMzzfca3E2PzEslVhn0XLR18CLB+4vwfpurK38=;
 b=cF5+Faz5d8rlFmIeCb+0Tx2JpPPnghhgNtpBS0AqSyGdkbWTW0XPyXRKyfagp6ulTQ
 Q2RWgLFjFTSMK9j6RTffS01Oy+DD6sCQfiLqouj5GzPLmpRRjtGJ6uQN5An1YpnOuUnc
 LwhoXF5IyMhytiCpIfpN5lmeBiTx7aar6Zvuyp9peysRtjwuTdobaIA4cgbzyhp280cJ
 HoKLoa2G029Dax0iqHILi6JDg/FVv2D1ijAYj41kCwPp7IItAk8kzEyrlTazwv1ywYbo
 3yms5LpF7Tt53vJjELEmAZIoY1GPdcUCAM58YvKabfXrpTt5ySrphLvrKZNR2oyW+69X
 mmPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=jr87nJMzzfca3E2PzEslVhn0XLR18CLB+4vwfpurK38=;
 b=PcN28Y57H5DY38mfnWovinoOg+tdF4pD5VcCFfUfYbKSgMgVhY0rhZsS0AdJNHHEln
 JczPuPpbpNjPFalIalSgClVSDqJ8XnRMOEUkuVlQUTEGm2ietvxc9ZXvUYCdSbldNWHs
 Mgam/r9Rg1oBr9KyoEZeI1++eBardBPeYpRlb9UKSgAIykFs3L8IVaAM2gvwKXXOc1nH
 bbR2RR2cFLCVT1abvnf/pd3WAYS6obk8sxi3IeG1OzjcjmnKUX4Kplft+z0X9vrv2H4H
 MFL8s+3d9UuGuf4txVstuGnSXpXGDFZrn6avi+GWwlq1sIHIJuSAWx/e62NOUQvr+xCt
 WDdw==
X-Gm-Message-State: ACrzQf36kKuXgIQ7+K6z3mBJ/6+9LXHBXHWfax1WHwwrjFPbldYDKNWL
 1Q/Y/pDvyscx4CQfTxK4LiUoWCpbQLSFnA==
X-Google-Smtp-Source: AMsMyM5pZ4vALLTiUEWNtKe+xb0PXB5Z9kpccZ26yU2bcQINi+ULlkgMsN/JAJwGAa4MZPO6NG3G9A==
X-Received: by 2002:a5d:620b:0:b0:22c:9eb4:d6ed with SMTP id
 y11-20020a5d620b000000b0022c9eb4d6edmr6118525wru.530.1664544919170; 
 Fri, 30 Sep 2022 06:35:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q12-20020adfcd8c000000b0021e4829d359sm1982551wrj.39.2022.09.30.06.35.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 06:35:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/10] hw/arm/virt: Fix devicetree warning about the root node
Date: Fri, 30 Sep 2022 14:35:07 +0100
Message-Id: <20220930133511.2112734-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220930133511.2112734-1-peter.maydell@linaro.org>
References: <20220930133511.2112734-1-peter.maydell@linaro.org>
MIME-Version: 1.0
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

The devicetree specification requires a 'model' property in the root
node. Fix the corresponding dt-validate warning:

  /: 'model' is a required property
  From schema: dtschema/schemas/root-node.yaml

Use the same name for model as for compatible. The specification
recommends that 'compatible' follows the format 'manufacturer,model' and
'model' follows the format 'manufacturer,model-number'. Since our
'compatible' doesn't observe this, 'model' doesn't really need to
either.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-id: 20220927100347.176606-2-jean-philippe@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0961e053e5d..f4ee71cda18 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -253,6 +253,7 @@ static void create_fdt(VirtMachineState *vms)
     qemu_fdt_setprop_string(fdt, "/", "compatible", "linux,dummy-virt");
     qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
     qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
+    qemu_fdt_setprop_string(fdt, "/", "model", "linux,dummy-virt");
 
     /* /chosen must exist for load_dtb to fill in necessary properties later */
     qemu_fdt_add_subnode(fdt, "/chosen");
-- 
2.25.1


