Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B73715F0CBA
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 15:49:05 +0200 (CEST)
Received: from localhost ([::1]:35446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeGO0-0000Z6-Ml
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 09:49:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeGAo-0000E4-BZ
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:35:26 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:42859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeGAj-0006V9-Ua
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:35:26 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 o20-20020a05600c4fd400b003b4a516c479so2263401wmq.1
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 06:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=bEjgbbis8HDtfHwdnQyjjDEk0rJVjNDHCCAMGdaHTE8=;
 b=pbWqfiwyqiwpF2/TnGMRK6K7nAUpBXcKchoqsTB2Y0mnyi+3QFjt3+m/q6pgBua+1S
 seMWYZ3WEW0ZZkSjy17ODk9ji2EREtvwgR9QX0PANl+Ekz/0mEVZMoxV9TK/5+2c1l4j
 I2obtGv37uUo3q9qo2eKt+Ea+6fKqGcWCyCRh9Dng9f2Y3CDLmjJx6D9HdEpP/2Y5YD+
 qjA6SmKxRNki3nANACjD8XXxfvdE8MIIIbiuhf59wet4qvbfDIuZ4hsebjapK53DqNEm
 XIKH/0ZYho7VEgYlrluf8kvB3KWUjpkLQ6v0qQEmBTf3wsqiTpxij4f6Z2SLFIG83dyC
 AYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=bEjgbbis8HDtfHwdnQyjjDEk0rJVjNDHCCAMGdaHTE8=;
 b=rDXarXTGwWrNsEhOYDOJUC0ZrhK3kPNknT3nMwK4umYliua7m3qFwG0PlP+GGj1MXY
 oFpzmabkJmDAbIpN3hqDUcTo8I9ELymvnJY0clbA7tvAEUlCoY0Frx5GhJH5PozwpdyH
 aq83+k4rXdRrVHBP2+Jfj2p3GYILD2ybxoTEV+VuM1oqHYAdHQagCRx0V1kBdmXN3Lko
 zoITb/eydxYf/Jm22V++KZLSox12jGfhIToc5o0cbSbRF6zK3JlLous4GjXM9l58fxAF
 cm8i/tgckRTVGYNUBMPIen2qWyFICjmvIEfjtSo8Xuae5fB5Cy91JZcxOiiaLRcYUjPL
 EUKQ==
X-Gm-Message-State: ACrzQf2+oYuAEiizw5eRGXDEX2YDCS94+1bdcd+tIjtsIZsAFat1057F
 AI+IOcLO6Z2gS9/5V+GXmU7MLwSPUHeIlA==
X-Google-Smtp-Source: AMsMyM59HDri5LXbEVthLjoV3l9itESVP2pmGUTcNJs6mMpcUmS33b+EziMALF6weGTcQglkAEPWFA==
X-Received: by 2002:a7b:c392:0:b0:3b4:acef:3523 with SMTP id
 s18-20020a7bc392000000b003b4acef3523mr6027973wmj.37.1664544920490; 
 Fri, 30 Sep 2022 06:35:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q12-20020adfcd8c000000b0021e4829d359sm1982551wrj.39.2022.09.30.06.35.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 06:35:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/10] hw/arm/virt: Use "msi-map" devicetree property for PCI
Date: Fri, 30 Sep 2022 14:35:09 +0100
Message-Id: <20220930133511.2112734-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220930133511.2112734-1-peter.maydell@linaro.org>
References: <20220930133511.2112734-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

The "msi-parent" property can be used on the PCI node when MSIs do not
contain sideband data (device IDs) [1]. In QEMU, MSI transactions
contain the requester ID, so the PCI node should use the "msi-map"
property instead of "msi-parent". In our case the property describes an
identity map between requester ID and sideband data.

This fixes a warning when passing the DTB generated by QEMU to dtc,
following a recent change to the GICv3 node:

  Warning (msi_parent_property): /pcie@10000000:msi-parent: property size (4) too small for cell size 1

[1] linux/Documentation/devicetree/bindings/pci/pci-msi.txt

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-id: 20220927100347.176606-4-jean-philippe@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 41b88dd1444..b67ba0f2a10 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1490,8 +1490,8 @@ static void create_pcie(VirtMachineState *vms)
     qemu_fdt_setprop(ms->fdt, nodename, "dma-coherent", NULL, 0);
 
     if (vms->msi_phandle) {
-        qemu_fdt_setprop_cells(ms->fdt, nodename, "msi-parent",
-                               vms->msi_phandle);
+        qemu_fdt_setprop_cells(ms->fdt, nodename, "msi-map",
+                               0, vms->msi_phandle, 0, 0x10000);
     }
 
     qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
-- 
2.25.1


