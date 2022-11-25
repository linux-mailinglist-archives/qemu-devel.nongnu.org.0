Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE04638917
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 12:53:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyXGC-0005Ww-7R; Fri, 25 Nov 2022 06:52:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyXGA-0005Tp-10
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 06:52:46 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyXG8-00038j-8m
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 06:52:45 -0500
Received: by mail-wr1-x42a.google.com with SMTP id i12so6474496wrb.0
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 03:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3wVSKj22WPWLuBV0V8qhGLL0QjcpOsr6ra1XrF3WTQA=;
 b=dIZoOulGwVr5jmAdxx2BPnW77w5HbOCC1TT0rkDdMMCUNU+hczEDK75OfVJAkPTDe6
 nRd0cvkotgWpEywoutxznjb5GJH0zNOMmS3/ZcEFJumifVTTwfcD7LU/JCNwXDfKGK0d
 aY06xLLm5ebxNghimxiKtLPjsXbFYIJRZn4zTNHCS4AF6sCN+ele1vLTeYY/1UWGJNN5
 Imj9mnVMRyXRmSke5YrmyRZKxuQkb/05rBK0Va5rwWBmY/laD7jRqo8y0yCmQNgHR6Kf
 2qxPt0jeH75sxOKVLAADPrlPzPbg8WBBX6fX7nhX4PvZtVAhxvB4JhVcpqzDly2YHKAt
 NCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3wVSKj22WPWLuBV0V8qhGLL0QjcpOsr6ra1XrF3WTQA=;
 b=IkhxEBV3KpgDR48x+cQukrELVpL4xnUzpjmkyW80wlZsIW4sSfnCS2pIYP7I6P53/n
 iBAVSK20Jv9zzaemvSB+PFc9G4a6w4WjMKuwwR2OY3a/bFUU03WT7IbmktOO1VYQAlBh
 c4GYUzEelqIcE/cAQ27gnUreDC23zFReFkAcmZO+DCPCMNpr4WGAKsmZdtA/h0Xqg3mJ
 DudEfn+6flFlC2pbI9WjWz7iHv5KZFnliIeW8SNrU1gqMnJYzet8HZe+pz3mUGsFOw6P
 m9JFZQxrr6SYZoroQvqha9IPNAqezURoPhpO8n8dxaIaHrbrOo/No8ZqpKu9sjRUcaGo
 dgYA==
X-Gm-Message-State: ANoB5pk/AlCYPasIRJV07DFqfTmRo5WWXyLc5vR25fn1XBw3+Bg+SyFu
 Mj+FzJspCareJN/4TtlDIXD5V4u/ZLLY7w==
X-Google-Smtp-Source: AA0mqf4M0u64jwchPuCrpheHleuWqQnsONBcNmgc5Xx+dgZLTVJXNVytmqGtnYTYrWThb3f6g11Y2Q==
X-Received: by 2002:a05:6000:1108:b0:235:8867:50bf with SMTP id
 z8-20020a056000110800b00235886750bfmr13231090wrw.193.1669377162585; 
 Fri, 25 Nov 2022 03:52:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a05600c19d100b003c6f8d30e40sm9728258wmq.31.2022.11.25.03.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 03:52:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-ppc@nongnu.org
Subject: [PATCH for-8.0 0/7] virtio, pci, xics: 3-phase reset conversions
Date: Fri, 25 Nov 2022 11:52:33 +0000
Message-Id: <20221125115240.3005559-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patchset converts a miscellaneous collection of classes
to 3-phase reset. The common link, as with other series I've
sent out recently, is converting child classes that currently
use device_class_set_parent_reset() so that we can remove
that function. To do this we first need to convert the parent
class, and then the subclass.

The first two patches handle TYPE_VIRTIO_VGA_BASE, and its parent
TYPE_VIRTIO_PCI.

The second two handle the parent TYPE_PCIE_ROOT_PORT and its two
child classes TYPE_CXL_ROOT_PORT and TYPE_PNV_PHB_ROOT_PORT.

The last three deal with TYPE_PHB3_MSI and the parenT TYPE_ICS.

This is all 8.0 material.

thanks
-- PMM

Peter Maydell (7):
  hw/virtio: Convert TYPE_VIRTIO_PCI to 3-phase reset
  hw/display/virtio-vga: Convert TYPE_VIRTIO_VGA_BASE to 3-phase reset
  pci: Convert TYPE_PCIE_ROOT_PORT to 3-phase reset
  pci: Convert child classes of TYPE_PCIE_ROOT_PORT to 3-phase reset
  hw/intc/xics: Reset TYPE_ICS objects with device_cold_reset()
  hw/intc/xics: Convert TYPE_ICS to 3-phase reset
  hw/pci-host/pnv_phb3_msi: Convert TYPE_PHB3_MSI to 3-phase reset

 hw/display/virtio-vga.h        |  2 +-
 include/hw/pci/pcie_port.h     |  2 +-
 include/hw/ppc/xics.h          |  2 +-
 hw/display/virtio-vga.c        | 15 +++++++++------
 hw/intc/xics.c                 | 11 ++++++-----
 hw/pci-bridge/cxl_root_port.c  | 14 +++++++++-----
 hw/pci-bridge/pcie_root_port.c |  8 +++++---
 hw/pci-host/pnv_phb.c          | 18 ++++++++++--------
 hw/pci-host/pnv_phb3_msi.c     | 22 +++++++++-------------
 hw/virtio/virtio-pci.c         |  8 +++++---
 10 files changed, 56 insertions(+), 46 deletions(-)

-- 
2.25.1


