Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 787EE5B6C0C
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 12:57:07 +0200 (CEST)
Received: from localhost ([::1]:59562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY3bG-0003Tj-D1
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 06:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1oY3Ux-0006EJ-4e
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 06:50:36 -0400
Received: from madras.collabora.co.uk ([46.235.227.172]:47280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1oY3Uv-00019P-2h
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 06:50:34 -0400
Received: from dellino.fritz.box (host-79-51-37-159.retail.telecomitalia.it
 [79.51.37.159])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: fahien)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 000F7660201C;
 Tue, 13 Sep 2022 11:50:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663066229;
 bh=MBEe5c8ZUSca+qjPLMjWypprFXgHrcUHp4cB6i2knTo=;
 h=From:To:Cc:Subject:Date:From;
 b=REs1ghHdjUWWHgpctRcdSqSqyW9RYuy/hXPD+WwKIatyY96WAJwEcha+aTWYj3D1c
 dfzh1nzL6HaIxmDglz501yZfguY9mcsAJrbki5R8ZDBKJtE5QLd99cjq954tWyVoR4
 gydGuqs4DtFTimXh26jjM/S8QxoYFH7Z+iyRIwx2rhRRx1m61BMvl0OBkuhJjnGgKD
 ikEhf9Xu0PFbZtyrQMG1WTs77R6NS5LGSnnVcJpdbn/I5EpyQ/O3gOxKor6TUjAPoj
 qtOWZuDGCLrDbQsk3yI/Cfho2Wf1Oi0mW3hvopSmAg5Xq3fVMUYn5QYCtjYWyRIQ2/
 avCbRQYmq/9jw==
From: Antonio Caggiano <antonio.caggiano@collabora.com>
To: qemu-devel@nongnu.org
Cc: gert.wollny@collabora.com,
	dmitry.osipenko@collabora.com
Subject: [PATCH v2 0/4] virtio-gpu: Blob resources
Date: Tue, 13 Sep 2022 12:50:18 +0200
Message-Id: <20220913105022.81953-1-antonio.caggiano@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=46.235.227.172;
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


