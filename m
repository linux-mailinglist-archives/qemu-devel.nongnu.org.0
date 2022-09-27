Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7A25EBF9C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:21:36 +0200 (CEST)
Received: from localhost ([::1]:49798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od7iZ-000529-K7
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1od7a9-0000u6-S9
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:12:53 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:55245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1od7a7-0002WR-Oi
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:12:53 -0400
Received: by mail-wm1-x332.google.com with SMTP id iv17so6196423wmb.4
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 03:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=8lc9+EAsDsNcRbit+l0khQ7LVOAu2tt4CiBZ5zrclyM=;
 b=Tbjugk8KSpIctutBfMXYi8TFdBbmuK4d0Wy0OQ32PaIag0RYgzNWHrZoH2YKlDCe0k
 A08ImKt/m5jtrFWg30h303n3mp93Z+MwAmxDc2OLK2HMiqizCe3seiIfYLwyj6KiAVfM
 a0CfJPLKlMjI63277JLybveeLAn5DcSEPLz0kzO1rihLe7c4Bm+PC1f6e9eLaw9rTp0F
 Tuc/4dK3xnYy4UZmPzi2p6hK1mBkeh0AcBma7Emnbh7zOhi434s3A22kbIfAkTLOe35b
 VzVNplNsfPe685ou5fecAyY/BwA13lJ2yjR3jh6shfQSLspDe8xGm7eTMsjt+vBBKYaJ
 7ilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8lc9+EAsDsNcRbit+l0khQ7LVOAu2tt4CiBZ5zrclyM=;
 b=Vhvb0V3hEahgmxyFEYZCd8Uu4KZwEOoTaMEXRFWZN2y85e+06fk5zY8hjSSmpJTXUj
 6n0uRK8bZES1ri3/Raf8b43SuQkrSwQObfj1bRwZX9kLGrXX8pz85LWbgPczOoD+FWf7
 R5aSC769ZeOQ2fVkSj9X1TzgQwP/4T26LUckJwqmeo52pclHCE8ZSvqbtikHpfpvxv46
 mBY7T5G3ypF7FlLXqLvIKN6XS32CTA6TS6S5l+hz/zs67+/Xgi7SCFZ/FCbFcfd+Hckg
 YApo2QkTwynZ3RQ/bF0oU5pgmVfgLPPS/rjLXylrMMlneaX4sEljN3+BSwRcqyMpxRr2
 SUsA==
X-Gm-Message-State: ACrzQf0G511pkcQlx6fHNV7sjSm3VnzCiQpkzLo1AuID0+Mp/hQceqok
 6Ug5yztAwh1zrwbi1iCNtJBefw==
X-Google-Smtp-Source: AMsMyM6rjaxVfLZTu3unHULjHKan7DnxRhiQKYQqop1EY2OeS6KwPVVfInCgSpylU7T7pf/6xqMpDg==
X-Received: by 2002:a05:600c:4f8e:b0:3b4:ab30:9af4 with SMTP id
 n14-20020a05600c4f8e00b003b4ab309af4mr2040707wmq.84.1664273570348; 
 Tue, 27 Sep 2022 03:12:50 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 w6-20020adfd4c6000000b00223b8168b15sm1398387wrk.66.2022.09.27.03.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 03:12:50 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 6/8] hw/arm/virt: Fix devicetree warning about the SMMU node
Date: Tue, 27 Sep 2022 11:03:47 +0100
Message-Id: <20220927100347.176606-7-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927100347.176606-1-jean-philippe@linaro.org>
References: <20220927100347.176606-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x332.google.com
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

The SMMUv3 node isn't expected to have clock properties. Fix the
corresponding dt-validate warning:

  smmuv3@9050000: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
  From schema: linux/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 10ce66c722..2de16f6324 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1362,8 +1362,6 @@ static void create_smmu(const VirtMachineState *vms,
     qemu_fdt_setprop(ms->fdt, node, "interrupt-names", irq_names,
                      sizeof(irq_names));
 
-    qemu_fdt_setprop_cell(ms->fdt, node, "clocks", vms->clock_phandle);
-    qemu_fdt_setprop_string(ms->fdt, node, "clock-names", "apb_pclk");
     qemu_fdt_setprop(ms->fdt, node, "dma-coherent", NULL, 0);
 
     qemu_fdt_setprop_cell(ms->fdt, node, "#iommu-cells", 1);
-- 
2.37.3


