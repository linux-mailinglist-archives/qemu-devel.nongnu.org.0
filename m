Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A012D5A509A
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 17:49:00 +0200 (CEST)
Received: from localhost ([::1]:33366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSh0V-0003D0-Lf
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 11:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1oSgt1-0002d8-Oq
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 11:41:15 -0400
Received: from madras.collabora.co.uk
 ([2a00:1098:0:82:1000:25:2eeb:e5ab]:52566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1oSgsy-0004de-Lu
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 11:41:15 -0400
Received: from dellino.fritz.box (host-95-235-60-93.retail.telecomitalia.it
 [95.235.60.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: fahien)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A03B56601E7E;
 Mon, 29 Aug 2022 16:41:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1661787668;
 bh=R2tFqz8RM2Rm+/prWUuIW47hDImWGlMBY35DEiXqzGI=;
 h=From:To:Cc:Subject:Date:From;
 b=CRArWFQS/nFBq0jOaiUjFCpEFZrYPVnKasdzmlEXHXx8p9E3Movuvt9pGs6CERYeA
 ZadZaDLxZyOc8EGSzUixqIHBHzs2M3roKVVSGjvhXAK4QztgXmw9I82m9Bg7uzv5cl
 mXwadACcw8GK0ht22x8dtauTL0GDOnNZyQhS4QCYp8JpOW2/b/KbH6k2koetiPejVo
 5OFTen5HezypxCRkCwJVqQPASM0bx2nTUQ3/d3g6mlyfGO98HNJemJ3JEOJoQ87Nir
 KJ6Cgbv5xuVmwXqq6w/9vKYS1M2feJAZl/0+EAOTx108cnTS7GLxKDN+vQNzZLc8+f
 vmDJ8Ql0SZWNg==
From: Antonio Caggiano <antonio.caggiano@collabora.com>
To: qemu-devel@nongnu.org
Cc: gert.wollny@collabora.com,
	dmitry.osipenko@collabora.com
Subject: [PATCH 0/5] virtio-gpu: Blob resources
Date: Mon, 29 Aug 2022 17:40:53 +0200
Message-Id: <20220829154058.524413-1-antonio.caggiano@collabora.com>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Richard Henderson (1):
  Update version for v7.1.0-rc4 release

 VERSION                              |   2 +-
 hw/display/virtio-gpu-pci.c          |  15 +++
 hw/display/virtio-gpu-virgl.c        | 169 +++++++++++++++++++++++++++
 hw/display/virtio-gpu.c              |  25 ++--
 hw/display/virtio-vga.c              |  33 ++++--
 hw/virtio/virtio-pci.c               |  18 +++
 include/hw/virtio/virtio-gpu-bswap.h |  18 +++
 include/hw/virtio/virtio-gpu.h       |  11 ++
 include/hw/virtio/virtio-pci.h       |   4 +
 meson.build                          |   5 +
 10 files changed, 276 insertions(+), 24 deletions(-)

-- 
2.34.1


