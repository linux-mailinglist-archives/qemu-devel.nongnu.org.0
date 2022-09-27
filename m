Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A634D5EBF8A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:16:46 +0200 (CEST)
Received: from localhost ([::1]:39452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od7dp-0007PP-5H
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:16:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1od7a6-0000rp-Fd
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:12:51 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:35470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1od7a4-0002TF-7D
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:12:50 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 r10-20020a1c440a000000b003b494ffc00bso988745wma.0
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 03:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=FZVURgbUnRRhotNrDUDDUBNjYAeyYxTRL1IZC5Y1/m0=;
 b=DEq+p1GyBNjWroAIyKqiE5Hw8iNuJqx01h3lFf6+8NvzEMJ9wKzUj4FtaHrBHumtjR
 Szj25vT3ecIlZgYfG+831FLeYSStdbjV1hZymL9EENKy+X913xgBI9TQEcAKb7f37L9l
 PLpafXNeeTu7I4YN1MG+oYC8iRmElRfggpKLNwCB3w9PzGIRaPyCCTfxUxXhR+J6C4N7
 WcnuTGWtD1dh9sivjbt9f/C0sqONu2inD5oU3/eWOcXps+wK9p0duwG4M992o7nIKusE
 qnHFnpd1Xt55HXjkIcs+gyEuJJCV00x6Etr5HKWG5J4UEYrnu4DxlqGYL20UT+AhxcqQ
 X2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=FZVURgbUnRRhotNrDUDDUBNjYAeyYxTRL1IZC5Y1/m0=;
 b=x8YCeFQM8A4Zx6qRJA3Q0iM8lwpT/s39dfCrwfUiYujon8zccGJKW46hFmflVcYCTG
 pByt9Fw9ormelc2JtfX9lHjD8RboqyQxokOfxgNGFuNuxmd5DNVhj+aGPlVQ6m/6Iv/b
 YrnnxE2jw94TX8XkjWUcnZ+8zolg0a0/vKQeXvd9FFmY2J9wMMv0dOOmSenOZNGBTLLV
 xNQx8zX2MJEE+kq3kVDNqJhj9A61pd5fUwhRrkVfPOtqadIi3egyXQBlPh36hZPwERIW
 rVx+OJZ5PYTlFB/tlUrIMhdfXG1fqxpqaocyKsEHiQIb6d1C/P4oNlUgyNRfV88k47nI
 sEJg==
X-Gm-Message-State: ACrzQf2/O0rqkPeNsD/L8JtmzjqPF6FV2QosXTtsCuNMMQtBF7I6Sn2J
 3bJgEra3rpXs/TbR6ngrSEflFw==
X-Google-Smtp-Source: AMsMyM4EunmTj4g95rjYUPTAs+9TkiICd1T5myCsqDqC1A8/B9NWyfRCEbselXoTlc1SGPMhtHXlww==
X-Received: by 2002:a05:600c:2241:b0:3b4:88aa:dcba with SMTP id
 a1-20020a05600c224100b003b488aadcbamr2008622wmm.203.1664273565993; 
 Tue, 27 Sep 2022 03:12:45 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 w6-20020adfd4c6000000b00223b8168b15sm1398387wrk.66.2022.09.27.03.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 03:12:45 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 0/8] hw/arm/virt: Fix dt-schema warnings
Date: Tue, 27 Sep 2022 11:03:41 +0100
Message-Id: <20220927100347.176606-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32e.google.com
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

Fix some warnings thrown by dt-validate for the aarch64 virt devicetree.

Since v1 [1]:
* Submitted more DT bindings changes where appropriate [2]. All of them
  applied for Linux v6.1 so I dropped the related QEMU changes.
* Grouped all node name changes into patch 8
* Improved commit messages

I'm testing by running various virt machine configurations with -M
dumpdtb=qemu.dtb, then running dt-validate [3] and dtc:

  dt-validate -s linux/Documentation/devicetree/bindings/ qemu.dtb
  dtc -O dts qemu.dtb -o qemu.dts

[1] https://lore.kernel.org/all/20220824155113.286730-1-jean-philippe@linaro.org/
[2] SMMU interrupt order https://lore.kernel.org/all/20220916133145.1910549-1-jean-philippe@linaro.org/
    arch-timer compatible https://lore.kernel.org/all/20220922161149.371565-1-jean-philippe@linaro.org/
    virtio-iommu https://lore.kernel.org/all/20220923074435.420531-1-jean-philippe@linaro.org/
[3] https://github.com/devicetree-org/dt-schema

Jean-Philippe Brucker (8):
  hw/arm/virt: Fix devicetree warning about the root node
  hw/arm/virt: Fix devicetree warning about the GIC node
  hw/arm/virt: Use "msi-map" devicetree property for PCI
  hw/arm/virt: Fix devicetree warning about the gpio-key node
  hw/arm/virt: Fix devicetree warnings about the GPIO node
  hw/arm/virt: Fix devicetree warning about the SMMU node
  hw/arm/virt: Fix devicetree warnings about the virtio-iommu node
  hw/arm/virt: Fix devicetree warnings about node names

 hw/arm/virt.c | 39 +++++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 18 deletions(-)

-- 
2.37.3


