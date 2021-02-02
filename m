Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9ECF30C93E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 19:15:45 +0100 (CET)
Received: from localhost ([::1]:56212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l70DH-0001Zj-QF
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 13:15:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6zu2-0005c2-5M
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:50 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6zts-0002HY-3B
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:49 -0500
Received: by mail-wr1-x42b.google.com with SMTP id m13so21435496wro.12
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 09:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=f5MJPyJyH7FWjkGihdnK5D3TBgKTnXMtO9zeIWq+XYA=;
 b=B6d0VWYqHFY35qHdvtyGOvopV9Rkbpw2t6vcVG1FizkaBDdI6auxUaSxDSY6rV6OGU
 NTKm3hxH2L2iJAkxVXb+bW6gJ3g7J1v+Uy7pttjgS2YQBlYUitPRUr6bfeXvK9zV3ISX
 gn768TA4eSS1y5K9uqOUylthN7ZFn7YllMXj96lxDiBjWzWLxx+xmIdyRqlDHAfFhk38
 xGwTpW6tEQ5vkTv5lkNfbRx+S8MSiI680ein+8SeLP8oV6xyjcBQtLLA7vXQQyxNiJjB
 R246VlDDgw4XdEHLfkh8f0PtwVniBSle3LjElyE6hgWkoWKbqV5DqBTqXI1NwpDtr/wr
 O5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f5MJPyJyH7FWjkGihdnK5D3TBgKTnXMtO9zeIWq+XYA=;
 b=CyUpynr9EjBgi7e8dIx21Oiyj/paFvdsU2gHNlShAQ6m04MVObc14OABmDP29qlE6w
 pT56t4sbdu9hcxyAQYHiFs/FILMmJ54THCYipbvBaqgt8zt6yRPocpUgUcP1fOBZpPJJ
 +1mJhBVvgo3qMUBoiGSZgmTXPMy6yXNrO6aj5pwADUa/AY/yzJkHkd9zNClHNP5Sa+NX
 AUfjenD+/jy3TMV7RpT5IwEBVELYdcWbJyUldWxpMAzdaTFR+dor+5TPlE9KmBJpJ9/k
 dUlva2M6cghatIxWECGLbmzWrqsmXjBrpHaH/HtrmN4CaQGSOr2JQNbmp35P8CemUYwN
 k9Rw==
X-Gm-Message-State: AOAM532SsSRI5gIsW0GYCryZ+kVCqjCUMZ3vB+BGdz+WWOl6TS/U4UdH
 SRESxhumEpD+RrRgaym4XptoSDVynKpJgQ==
X-Google-Smtp-Source: ABdhPJxPMN8ANSvgNgcS5u136r8QmZuSmHTv/pLwIdhcvPjN0RGfC4CW/Qj7fhbZA8zlKdZWNREzUQ==
X-Received: by 2002:adf:f90d:: with SMTP id b13mr18513232wrr.198.1612288537062; 
 Tue, 02 Feb 2021 09:55:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q6sm4142283wmj.32.2021.02.02.09.55.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 09:55:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/21] hw/arm/xlnx-versal: Versal SoC requires ZDMA
Date: Tue,  2 Feb 2021 17:55:14 +0000
Message-Id: <20210202175517.28729-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202175517.28729-1-peter.maydell@linaro.org>
References: <20210202175517.28729-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The Versal SoC instantiates the TYPE_XLNX_ZDMA object in
versal_create_admas(). Introduce the XLNX_ZDMA configuration
and select it to fix:

  $ qemu-system-aarch64 -M xlnx-versal-virt ...
  qemu-system-aarch64: missing object type 'xlnx.zdma'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210131184449.382425-4-f4bug@amsat.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/Kconfig     | 2 ++
 hw/dma/Kconfig     | 3 +++
 hw/dma/meson.build | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 223016bb4e8..09298881f2f 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -354,6 +354,7 @@ config XLNX_ZYNQMP_ARM
     select XILINX_AXI
     select XILINX_SPIPS
     select XLNX_ZYNQMP
+    select XLNX_ZDMA
 
 config XLNX_VERSAL
     bool
@@ -362,6 +363,7 @@ config XLNX_VERSAL
     select CADENCE
     select VIRTIO_MMIO
     select UNIMP
+    select XLNX_ZDMA
 
 config NPCM7XX
     bool
diff --git a/hw/dma/Kconfig b/hw/dma/Kconfig
index d67492d36c1..5d6be1a7a7a 100644
--- a/hw/dma/Kconfig
+++ b/hw/dma/Kconfig
@@ -18,6 +18,9 @@ config ZYNQ_DEVCFG
     bool
     select REGISTER
 
+config XLNX_ZDMA
+    bool
+
 config STP2000
     bool
 
diff --git a/hw/dma/meson.build b/hw/dma/meson.build
index b991d7698c7..47b4a7cb47b 100644
--- a/hw/dma/meson.build
+++ b/hw/dma/meson.build
@@ -9,7 +9,7 @@ softmmu_ss.add(when: 'CONFIG_ZYNQ_DEVCFG', if_true: files('xlnx-zynq-devcfg.c'))
 softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_dma.c'))
 softmmu_ss.add(when: 'CONFIG_STP2000', if_true: files('sparc32_dma.c'))
 softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx_dpdma.c'))
-softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zdma.c'))
+softmmu_ss.add(when: 'CONFIG_XLNX_ZDMA', if_true: files('xlnx-zdma.c'))
 softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_dma.c', 'soc_dma.c'))
 softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_dma.c'))
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_dma.c'))
-- 
2.20.1


