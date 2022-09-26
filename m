Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7885EA863
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 16:28:40 +0200 (CEST)
Received: from localhost ([::1]:56230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocp67-0000sr-MU
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 10:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1ocp2C-0003j6-Ig
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 10:24:36 -0400
Received: from madras.collabora.co.uk ([46.235.227.172]:55420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1ocp2A-00043W-Ot
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 10:24:36 -0400
Received: from dellino.fritz.box (host-79-27-165-192.retail.telecomitalia.it
 [79.27.165.192])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: fahien)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C70A2660224E;
 Mon, 26 Sep 2022 15:24:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1664202271;
 bh=3uGFGBzWzvN33h3LBYd189EgPydbg5z27fZa2/W/HHo=;
 h=From:To:Cc:Subject:Date:From;
 b=QOQwb95rke/oXMlWtcZ8L8sFJ2CTPge/0gNsxomwRoK2LX0JUh8IwD+SPG3BAZoDw
 a/TmDhfMrP25eTebPKKnVS+0nXQTkz15K/q9Tj9voFmKUzdazEOTPkwS2vYh/npqvI
 G12nwGG1k+pip0w/8c2dRIRDWDlxTphcfFk41JKnAcAs2g6tpnoeT1dU0vbzZGpqTW
 8ZgHoRzcnEl4YnXqJTGLGmw/qpi2GvzwUr3WmZ9mtvMVHvSIBjoQEZGdMrQCsSPOaV
 CEnA3zHL/V+OtnuSNpUJjRlEPsR8j5pSuLBjyTl0CRqZdhYibv6P/kIluKbPSNcPo1
 Rz4jK+B4/NqUg==
From: Antonio Caggiano <antonio.caggiano@collabora.com>
To: qemu-devel@nongnu.org
Cc: gert.wollny@collabora.com,
	dmitry.osipenko@collabora.com
Subject: [PATCH v3 0/9] virtio-gpu: Support Venus Vulkan driver
Date: Mon, 26 Sep 2022 16:24:13 +0200
Message-Id: <20220926142422.22325-1-antonio.caggiano@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=46.235.227.172;
 envelope-from=antonio.caggiano@collabora.com; helo=madras.collabora.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

This series of patches enables support for the Venus VirtIO-GPU Vulkan
driver by adding some features required by the driver:

- CONTEXT_INIT
- HOSTMEM
- RESOURCE_UUID
- BLOB_RESOURCES

In addition to these features, Venus capset support was required
together with the implementation for Virgl blob resource commands.

Antonio Caggiano (7):
  virtio-gpu: Handle resource blob commands
  virtio-gpu: CONTEXT_INIT feature
  virtio-gpu: Unrealize
  virtio-gpu: Resource UUID
  virtio-gpu: Support Venus capset
  virtio-gpu: Initialize Venus
  virtio-gpu: Get EGL Display callback

Dr. David Alan Gilbert (1):
  virtio: Add shared memory capability

Gerd Hoffmann (1):
  virtio-gpu: hostmem

 hw/display/trace-events                     |   1 +
 hw/display/virtio-gpu-base.c                |   7 +-
 hw/display/virtio-gpu-pci.c                 |  15 ++
 hw/display/virtio-gpu-virgl.c               | 230 +++++++++++++++++++-
 hw/display/virtio-gpu.c                     |  67 +++++-
 hw/display/virtio-vga.c                     |  33 ++-
 hw/virtio/virtio-pci.c                      |  18 ++
 include/hw/virtio/virtio-gpu-bswap.h        |  18 ++
 include/hw/virtio/virtio-gpu.h              |  21 ++
 include/hw/virtio/virtio-pci.h              |   4 +
 include/standard-headers/linux/virtio_gpu.h |   2 +
 meson.build                                 |   9 +
 12 files changed, 403 insertions(+), 22 deletions(-)

-- 
2.34.1


