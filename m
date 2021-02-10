Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C96C231635F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 11:13:07 +0100 (CET)
Received: from localhost ([::1]:48346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9mUc-0001kg-Re
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 05:13:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9mS2-0008Um-3O; Wed, 10 Feb 2021 05:10:26 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:46128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9mRz-0002vp-Nj; Wed, 10 Feb 2021 05:10:25 -0500
Received: by mail-ej1-x62f.google.com with SMTP id w2so3000010ejk.13;
 Wed, 10 Feb 2021 02:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZtKdh8VZbLR/0yCVGno7ItAhU6fDoFuGP3xBsxj0cBo=;
 b=aDRklWFOhA8uo7zfmLdtDhqB+Q36yrZjbcpMebcGmQ9ECdRBTttBdqrYjWNP0RqBOX
 4bFWVLP3f2kTBRBYRxz44wBqj0BJO9OMlgAdWUFHTFfEekAgZOxsi9enZ7SdzghBCi3q
 6j0wP/SU3vYxKlBMt24MpsS/aNxRF/DcQSU75FzQqRlJ+m+UvA71dywur5zt3pIa/qxD
 W3w7NvcPK5cKHC6S27zmEuulEEGp3TxwoRbplVxWYWMJDkrbjyeMEIHQmItrhmwZDAh1
 32nr0raSVMJjhpY+FHkl2y5q4+lsQtO79dVg/eTGLfwwWfdegqeAmf3iloGAcFKJEkEO
 2Zpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZtKdh8VZbLR/0yCVGno7ItAhU6fDoFuGP3xBsxj0cBo=;
 b=TwHGLNeFQ6GEV8A5UXhl+108vhU/vSD0OInhN5GQAVYNxAPJeNean8iq65tAe0VC8U
 VKBA04PhJu8P5J/C7JfRQnjja04oIgAhPs/oAWsq111zdKR7+3Ep3/Y8lSiIyUtjttGz
 Ols9A+d7L6OYyqxmDZcrqU/Y0hvsXhqQlHkWD6KvhkyxK+dGOuD2Z6471X3Cu+Objybd
 YhpPFtGfBBcIj1M/OdqoKkrlOjGdPqzN6HVGNvPBSatDRpA/oL2+6WEfFmW8JC4Kuy/L
 J+CwEabygGqQxxYUwlsiaY2qgkpcAvKz/x0gDhH5PIo3Npm7ktg9r1ZUEvGRdVUWzwu1
 hEXw==
X-Gm-Message-State: AOAM5316pfxQNoKLoErEVE/vUnW1bGxR+q/JbTKWEGad3vs9ABw5mZnC
 2lwXYNxK2P5CL3A3ypganTA=
X-Google-Smtp-Source: ABdhPJxZIA6W3Dla1vrpQbKltMhfZErUD0ssKtbsXf9NkFwIZuXjK11ih9rLctlXcgKzehQMoCTDJQ==
X-Received: by 2002:a17:906:cc5d:: with SMTP id
 mm29mr2242158ejb.183.1612951821890; 
 Wed, 10 Feb 2021 02:10:21 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id y11sm785418ejd.72.2021.02.10.02.10.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Feb 2021 02:10:21 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 0/5] hw/arm: zynqmp: Implement a CSU DMA model and connect
 it with GQSPI
Date: Wed, 10 Feb 2021 18:10:08 +0800
Message-Id: <1612951813-50542-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62f.google.com
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

We added a basic CSU DMA model and the implementation is based on
https://github.com/Xilinx/qemu/blob/master/hw/dma/csu_stream_dma.c

Unfortunately the Xilinx fork of QEMU does not boot VxWorks. It looks
like the fork has quite a lot of difference from the upstream QEMU.

The CSU DMA model in the Xilinx fork seems to be quite complicated
and has lots of functionalities. However right now our goal is to
implement a minimum model that could be used to work with the GQSPI
model to make the QSPI DMA functionality work.

The model implements only the basic DMA transfer function of the DST
part, verified along with ZynqMP GQSPI model. Other advanced features
are not implemented.

Changes in v3:
- Implement DMA as a separate CSU DMA model
- new patch: xlnx-zynqmp: Clean up coding convention issues
- new patch: xlnx-zynqmp: Add XLNX CSU DMA module
- new patch: xilinx_spips: Remove DMA related code from zynqmp_qspips

Changes in v2:
- Remove unconnected TYPE_STREAM_SINK link property
- Add a TYPE_MEMORY_REGION link property, to allow board codes to tell
  the device what its view of the world that it is doing DMA to is
- Replace cpu_physical_memory_write() with address_space_write()

Xuzhou Cheng (5):
  hw/dma: xlnx_csu_dma: Implement a basic XLNX CSU DMA model
  hw/arm: xlnx-zynqmp: Clean up coding convention issues
  hw/arm: xlnx-zynqmp: Add XLNX CSU DMA module
  hw/ssi: xilinx_spips: Clean up coding convention issues
  hw/ssi: xilinx_spips: Remove DMA related code from zynqmp_qspips

 include/hw/arm/xlnx-zynqmp.h  |   5 +-
 include/hw/dma/xlnx_csu_dma.h |  39 ++++
 hw/arm/xlnx-zynqmp.c          |  25 ++-
 hw/dma/xlnx_csu_dma.c         | 444 ++++++++++++++++++++++++++++++++++++++++++
 hw/ssi/xilinx_spips.c         |  33 ++--
 hw/arm/Kconfig                |   1 +
 hw/dma/Kconfig                |   4 +
 hw/dma/meson.build            |   1 +
 8 files changed, 528 insertions(+), 24 deletions(-)
 create mode 100644 include/hw/dma/xlnx_csu_dma.h
 create mode 100644 hw/dma/xlnx_csu_dma.c

-- 
2.7.4


