Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A540D323C43
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 13:53:13 +0100 (CET)
Received: from localhost ([::1]:48068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEtfE-0006K6-JF
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 07:53:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lEtct-0004c1-Ue; Wed, 24 Feb 2021 07:50:48 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:40717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lEtcm-0003gx-AR; Wed, 24 Feb 2021 07:50:47 -0500
Received: by mail-pl1-x629.google.com with SMTP id z7so1133259plk.7;
 Wed, 24 Feb 2021 04:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QN2BHa7Hdh5f1DDf4RnvvF8Snt8q4rFQmUGm330ary4=;
 b=u7BLOXbG3ZJ2Isv5a5jnnXl7OCrFpqUHB20yJ3ZVn1/cD+uCr7cvOnbiVkaCJYlBlZ
 7pwugzM3tBdT0EF/qSZPB/91u6onbnc1CS95M9Y5Fie2/F9tB9StZ0bWX7JYjY1390qT
 DFaBgv0XkaI7eQ4bbLViaFydriBy0mSX7kctRj/7Ru48gnWcoK5O6tYOIv0BbPelMPqM
 c73fsInkz1E6k0Zwgj/D+ZO+FlPNWACZywmP3EoNomd8g+P3behBivgKeu2oDCOFdQX3
 wat2gEdelvgV0bpch7jeFfDQufzV53r3j8eoSU2saqIHMafBCI4vv/MMym5My33fZCUA
 Vzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QN2BHa7Hdh5f1DDf4RnvvF8Snt8q4rFQmUGm330ary4=;
 b=bha+TAxUfUDePt+9GdaqFFaUomXGIhSAmXfJHh8X1+A+shObwAs8vRHHRWVWqZyaEk
 ZmppT6XY7J2k0KJWGy9S/zKE3vMXLx/JFMr0CNTk5ZXuxYTuosTe3WeYGKhB7axA4Xi2
 cCbVKGrLnlt6uDdcnlzU++NFPdVfozbaBDoyxS0ICpyqiaVZccmCoANDWFo+PGSpelx2
 16pcDc+oBG9JgozLSJioNbjg069mJSaYc+Fw1jxEO6ymBmMfL+ZLvExMLNPydAvzFkVu
 ckBERU7tL79e6Vt4/GUJ7dJeAKwuejAFiPSHf9QWDx6cEVrBzRhT8I7vuqFZssjoFeBJ
 22ag==
X-Gm-Message-State: AOAM531roAd4TBqhTcDsJUugpDHi23WHw4ih7Hp5JQvHlQmWhV0Limo7
 Zzz02bbaugyOkxt327UccK8=
X-Google-Smtp-Source: ABdhPJz2kjyQYgiiTkHc5ZDkF+0NfwmbDA/XQ6Dp1o5rTGh9J24QYJlbRKWB7Gy54WCcQcVXeOL2+Q==
X-Received: by 2002:a17:902:7897:b029:e2:c149:cbe6 with SMTP id
 q23-20020a1709027897b02900e2c149cbe6mr31503268pll.68.1614171038466; 
 Wed, 24 Feb 2021 04:50:38 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id e12sm2795661pjj.23.2021.02.24.04.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 04:50:38 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 0/5] hw/arm: zynqmp: Implement a CSU DMA model and connect
 it with GQSPI
Date: Wed, 24 Feb 2021 20:50:19 +0800
Message-Id: <20210224125024.4160-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x629.google.com
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
  hw/dma: xlnx_csu_dma: Implement a Xilinx CSU DMA model
  hw/arm: xlnx-zynqmp: Clean up coding convention issues
  hw/arm: xlnx-zynqmp: Connect a Xilinx CSU DMA module for QSPI
  hw/ssi: xilinx_spips: Clean up coding convention issues
  hw/ssi: xilinx_spips: Remove DMA related dead codes from zynqmp_spips

 include/hw/arm/xlnx-zynqmp.h  |   5 +-
 include/hw/dma/xlnx_csu_dma.h |  52 +++
 include/hw/ssi/xilinx_spips.h |   2 +-
 hw/arm/xlnx-zynqmp.c          |  21 +-
 hw/dma/xlnx_csu_dma.c         | 741 ++++++++++++++++++++++++++++++++++
 hw/ssi/xilinx_spips.c         |  33 +-
 hw/arm/Kconfig                |   1 +
 hw/dma/Kconfig                |   4 +
 hw/dma/meson.build            |   1 +
 9 files changed, 836 insertions(+), 24 deletions(-)
 create mode 100644 include/hw/dma/xlnx_csu_dma.h
 create mode 100644 hw/dma/xlnx_csu_dma.c

-- 
2.25.1


