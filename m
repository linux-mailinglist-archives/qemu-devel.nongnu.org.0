Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E19733217FE
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 14:08:07 +0100 (CET)
Received: from localhost ([::1]:44314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEAwY-0006nv-DU
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 08:08:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lEAu1-00059U-Us; Mon, 22 Feb 2021 08:05:29 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:55133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lEAtz-0004s5-Ho; Mon, 22 Feb 2021 08:05:29 -0500
Received: by mail-pj1-x1030.google.com with SMTP id cx11so6364154pjb.4;
 Mon, 22 Feb 2021 05:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DnNGWABZCAAbsEvsjfx7EeGaFKqK66Vb507BqlIKgsI=;
 b=CHLL9t1uXzZZuIWZMXjSnSBPjw07D55meRoxqBPF0cYF+Wo4CpbU72qaoyF9AVcCq7
 KRohYk6UPY5/fFu0BgLDXYWuOlnFHGhAzGbNcEaF/1IeqdO6cLw+0eiZw98FYV+2707d
 3ytyX+NFx3giQX60tpMYTfqlIHOO40m76HD5eJoOi+LG7zvM8VN3CreNE4rN4WL0gTC2
 qcdfWUu7WQV0uzcUWnytRD9sEqrELd27/FzYDdm8VST7Dy+fP4vmikmy0po2lTIIIjVG
 d95WWHeRxs2SjGaHTGnAepniKMEjC6p1yjiZIDQRQtn0daxoL+glSWUwoS4zh1p+/v6j
 THIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DnNGWABZCAAbsEvsjfx7EeGaFKqK66Vb507BqlIKgsI=;
 b=AwdL/k/qm3bLd+FFSULyDPXXPb1mIToVzauBUUGisoJEpheLJnK8a2rGFimKf2ckGs
 G115VN9+HUGPU7kHuDGPfLBU2wiVykPNoqZvZouozE4T3W6j06wQsOLXLO3bxT3ykr26
 MO4Q8PC/T9R/wRVkmSik83fXYuYXbW2URgeap19nCM8DCMUC1ohR8M+HhgaQRvOLgb+Z
 CfGGK46byOJsTjW/IR6ftOkpBFRHJ4OxntQdtRbh6HiFXz7xAYvkF4sa11Z8A5MsVaji
 cwyWlpuw/3P/TSIF4m8PgqxV8tOcKc+1kN9nUhDhGQoUCwrjb+gM/CdXy4hYvIoPBkRq
 U49g==
X-Gm-Message-State: AOAM531CS7HitsVtYRnV+EUK4WKSp3mGbByWdUr1Ujx6aZyEGONPwkDG
 hzGFW77l08KqoWbBLS8EHd4=
X-Google-Smtp-Source: ABdhPJzY0AjhEzvKJ6c+LnGN/0lw2JpBABrfOyBSNht2jOK0wBS7WgDOBugX0yznMckQFeU2siGnlA==
X-Received: by 2002:a17:90a:8906:: with SMTP id
 u6mr23593119pjn.223.1613999125353; 
 Mon, 22 Feb 2021 05:05:25 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id q126sm19170171pfb.111.2021.02.22.05.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 05:05:24 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 0/5] hw/arm: zynqmp: Implement a CSU DMA model and connect
 it with GQSPI
Date: Mon, 22 Feb 2021 21:05:09 +0800
Message-Id: <20210222130514.2167-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

ZynqMP QSPI supports SPI transfer using DMA mode, but currently this
is unimplemented. When QSPI is programmed to use DMA mode, QEMU will
crash. This is observed when testing VxWorks 7.

We added a Xilinx CSU DMA model and the implementation is based on
https://github.com/Xilinx/qemu/blob/master/hw/dma/csu_stream_dma.c
and the one in Edgar's branch.

Differences with Edgar's branch:
1. Match the registers' FIELD to UG1807.
2. Remove "byte-align" property. Per UG1807, SIZE and ADDR registers
   must be word aligned.
3. Make the values of int_enable and int_disable mutually exclusive
   otherwise IRQ cannot be delivered.
4. Clear int_status after int_disable is set.
5. Coding convention issues clean-up

The DST part of the model is verified along with ZynqMP GQSPI model.

Changes in v4:
- Add complete CSU DMA model based on Edgar's branch
- Differences with Edgar's branch:
  1. Match the registers' FIELD to UG1807.
  2. Remove "byte-align" property. Per UG1807, SIZE and ADDR registers
     must be word aligned.
  3. Make the values of int_enable and int_disable mutually exclusive
     otherwise IRQ cannot be delivered.
  4. Clear int_status after int_disable is set.
  5. Coding convention issues clean-up
- remove one change that is not a checkpatch warning
- Rename "csu_dma" to "qspi_dma"
- Modify XLNX_ZYNQMP_SPIPS_R_MAX

Changes in v3:
- Implement DMA as a separate CSU DMA model
- new patch: xlnx-zynqmp: Add XLNX CSU DMA module
- new patch: xilinx_spips: Remove DMA related code from zynqmp_qspips

Changes in v2:
- Remove unconnected TYPE_STREAM_SINK link property
- Add a TYPE_MEMORY_REGION link property, to allow board codes to tell
  the device what its view of the world that it is doing DMA to is
- Replace cpu_physical_memory_write() with address_space_write()

Xuzhou Cheng (5):
  hw/dma: xlnx_csu_dma: Implement a Xilinx CSU DMA model
  hw/arm: xlnx-zynqmp: Clean up coding convention issues
  hw/arm: xlnx-zynqmp: Connect a Xilinx CSU DMA module for QSPI
  hw/ssi: xilinx_spips: Clean up coding convention issues
  hw/ssi: xilinx_spips: Remove DMA related dead codes from zynqmp_spips

 include/hw/arm/xlnx-zynqmp.h  |   5 +-
 include/hw/dma/xlnx_csu_dma.h |  52 +++
 include/hw/ssi/xilinx_spips.h |   2 +-
 hw/arm/xlnx-zynqmp.c          |  23 +-
 hw/dma/xlnx_csu_dma.c         | 747 ++++++++++++++++++++++++++++++++++
 hw/ssi/xilinx_spips.c         |  33 +-
 hw/arm/Kconfig                |   1 +
 hw/dma/Kconfig                |   4 +
 hw/dma/meson.build            |   1 +
 9 files changed, 844 insertions(+), 24 deletions(-)
 create mode 100644 include/hw/dma/xlnx_csu_dma.h
 create mode 100644 hw/dma/xlnx_csu_dma.c

-- 
2.25.1


