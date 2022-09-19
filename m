Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE1B5BCD47
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 15:32:02 +0200 (CEST)
Received: from localhost ([::1]:37412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaGsS-00042J-Mi
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 09:32:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1oaGeL-0008OZ-6I
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 09:17:36 -0400
Received: from madras.collabora.co.uk
 ([2a00:1098:0:82:1000:25:2eeb:e5ab]:55404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1oaGeG-00067O-7z
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 09:17:23 -0400
Received: from dellino.fritz.box (host-82-49-101-130.retail.telecomitalia.it
 [82.49.101.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: fahien)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id DBD1E660036F;
 Mon, 19 Sep 2022 14:17:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663593436;
 bh=MBEe5c8ZUSca+qjPLMjWypprFXgHrcUHp4cB6i2knTo=;
 h=From:To:Cc:Subject:Date:From;
 b=YwpEIKCbT36mPDBPbViskPnUawrKARvA054WzTW3YYgyEzd9f0kY/WrJmVxrr5lyw
 a06Z7oEazJSFB3iQYXAziJJ59BUPTS7VJGSS4PcYU4UdjsaqKskBNZTlYvykFyz5r2
 FTKmO841FYqS0oDzTxm+3Nk7Z8Md4E4OnEmHR0yUX7x5mxFV5ZYT/jLcKG4vIZZLst
 Y/jo7bXY0FVB4fJFB+DAWi8LKmSiSVRMRbqeMsqu42Nc9I/yJGAmPo+hcJ6rtuHPG1
 1B9aQ3CcG5uqrm4lyxxbtBZiHlqaUbyLpiJ7BM+DSXgvEXFLdQR7PSLMn3jwx4Frmb
 GsezUH13wc9QA==
From: Antonio Caggiano <antonio.caggiano@collabora.com>
To: qemu-devel@nongnu.org
Cc: gert.wollny@collabora.com,
	dmitry.osipenko@collabora.com
Subject: [PATCH v3 0/4] virtio-gpu: Blob resources
Date: Mon, 19 Sep 2022 15:16:58 +0200
Message-Id: <20220919131702.94875-1-antonio.caggiano@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1098:0:82:1000:25:2eeb:e5ab;
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

Add shared memory and support blob resource creation, mapping and
unmapping through virglrenderer new stable APIs[0] when available.

[0] https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/891

Antonio Caggiano (1):
  virtio-gpu: Handle resource blob commands

Dmitry Osipenko (1):
  virtio-gpu: Don't require udmabuf when blob support is enabled

Dr. David Alan Gilbert (1):
  virtio: Add shared memory capability

Gerd Hoffmann (1):
  virtio-gpu: hostmem

 hw/display/virtio-gpu-pci.c          |  15 +++
 hw/display/virtio-gpu-virgl.c        | 171 +++++++++++++++++++++++++++
 hw/display/virtio-gpu.c              |  29 ++---
 hw/display/virtio-vga.c              |  33 ++++--
 hw/virtio/virtio-pci.c               |  18 +++
 include/hw/virtio/virtio-gpu-bswap.h |  18 +++
 include/hw/virtio/virtio-gpu.h       |  13 ++
 include/hw/virtio/virtio-pci.h       |   4 +
 meson.build                          |   5 +
 9 files changed, 283 insertions(+), 23 deletions(-)

-- 
2.34.1


