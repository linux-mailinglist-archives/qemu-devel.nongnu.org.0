Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EEA32B865
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 14:56:15 +0100 (CET)
Received: from localhost ([::1]:42104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHRz4-00079F-21
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 08:56:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHRwH-0005EY-OD; Wed, 03 Mar 2021 08:53:21 -0500
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:33356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHRwF-00029Q-Q8; Wed, 03 Mar 2021 08:53:21 -0500
Received: by mail-qv1-xf34.google.com with SMTP id 2so11701246qvd.0;
 Wed, 03 Mar 2021 05:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n8LvI7/QFRHaNFkpyDKwU/YnQTmXDw8yJUlBSftNgD4=;
 b=fIc2+osJXFoF/k+A1qRbTjtnKYzyeAJDRicV227t9ZDPndbwu/dP2W+AWY0QjKi5DZ
 89GySmOwA1mmYvKD2nBjqWc9iV2QPkG/GhWTpNNN63r7SNLe1RrbfFPVt85AK54M4i6C
 tyKcQvTkYDye3hx7xYTbeXJYcB7AwkIJqeczNuNkQnniUsa8SM2BLQquHOX2RdvNNNPd
 2WnkMZFjtJojl8cG1YAVBUcei7WnM+d3NbRlyiCjg+xqrt4pATrKQJu1UiyN8WC5UuMb
 rvLQ8DERKjRjf7GftChdTFOUC+m8qpnYk8XDxz7sR9JH2bIsa56BJ9nWLsBeyq+gubpZ
 k9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n8LvI7/QFRHaNFkpyDKwU/YnQTmXDw8yJUlBSftNgD4=;
 b=RFHpgYDfTl/E1MsnWE+yoS0908q1wKwhqV633s+hJpj+9AboZg8AwTe0lI8jV+fG0w
 Jno9EKGR01/aXa/Jzn42z5M5JNKZoOzEpNCDvxMq2GaGbJaQzBtBMjQp0rh9EDufRjHJ
 zNN0Pphsdqj5soy9pzya+u+5V7EV1Xzwp5Or9bIHqi2ZQd2IF5Nv0iOsLrkT8bUKCpNk
 ncrI/aPDR2ioFQuUis24rMi5qRBoXXcrksVUSSct3/skHaSMtyfuJxnAju7ff3h0R5z2
 6/PtvujrKoDSSAl+EgnOOSZh8+JY6QCOGKbiNSTFzLBdKMV8AYd8IKDlyN2VU6eFIIww
 IWoA==
X-Gm-Message-State: AOAM530Bw4Ex0k5yJgE13R0kpI6tFRLuzhTDTTe20yQaOCbEnkzeicQv
 jo2K4+NAUhwTowzW09H0tus=
X-Google-Smtp-Source: ABdhPJyK22ZQzHxEih9ntOzRch4mMshj3HNaTtfvntnPHH7FFcqrpi43VY0QFc6eBYXAnhgOWguF6A==
X-Received: by 2002:a0c:c2c5:: with SMTP id c5mr2709272qvi.4.1614779598427;
 Wed, 03 Mar 2021 05:53:18 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id x187sm17425500qkd.83.2021.03.03.05.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:53:17 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v7 0/5] hw/arm: zynqmp: Implement a CSU DMA model and connect
 it with GQSPI
Date: Wed,  3 Mar 2021 21:52:49 +0800
Message-Id: <20210303135254.3970-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf34.google.com
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

The DST part of the model is verified along with ZynqMP GQSPI model.

Changes in v7:
- merge the diffs from Edgar

Changes in v6:
- int_enable and int_disable do not have its own state
- return 0 in int_enable_pre_write() and int_disable_pre_write()
- remove XLNX_CSU_DMA_INT_R_MASK in int_status_pre_write()

Changes in v5:
- int_enable and int_disable do not affect each other
- do not modify int_status int_disable_pre_write
- set MEM_DONE in xlnx_csu_dma_done if it's SRC

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
  hw/dma: Implement a Xilinx CSU DMA model
  hw/arm: xlnx-zynqmp: Clean up coding convention issues
  hw/arm: xlnx-zynqmp: Connect a Xilinx CSU DMA module for QSPI
  hw/ssi: xilinx_spips: Clean up coding convention issues
  hw/ssi: xilinx_spips: Remove DMA related dead codes from zynqmp_spips

 include/hw/arm/xlnx-zynqmp.h  |   5 +-
 include/hw/dma/xlnx_csu_dma.h |  52 +++
 include/hw/ssi/xilinx_spips.h |   2 +-
 hw/arm/xlnx-zynqmp.c          |  21 +-
 hw/dma/xlnx_csu_dma.c         | 745 ++++++++++++++++++++++++++++++++++
 hw/ssi/xilinx_spips.c         |  33 +-
 hw/arm/Kconfig                |   1 +
 hw/dma/Kconfig                |   4 +
 hw/dma/meson.build            |   1 +
 9 files changed, 840 insertions(+), 24 deletions(-)
 create mode 100644 include/hw/dma/xlnx_csu_dma.h
 create mode 100644 hw/dma/xlnx_csu_dma.c

-- 
2.25.1


