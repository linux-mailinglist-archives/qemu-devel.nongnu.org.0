Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93397595730
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 11:56:26 +0200 (CEST)
Received: from localhost ([::1]:50138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNtJB-0002Bm-Lp
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 05:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1oNt6P-0006ca-DH
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 05:43:13 -0400
Received: from madras.collabora.co.uk ([46.235.227.172]:37364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1oNt6J-0006TH-TC
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 05:43:09 -0400
Received: from dellino.fritz.box (host-82-49-100-203.retail.telecomitalia.it
 [82.49.100.203])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: fahien)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AC0936600377
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 10:43:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1660642984;
 bh=h8mb8Lt1s55Q1zxRIzpWeHIzViEKby3Gik4zINFLNfU=;
 h=From:To:Subject:Date:From;
 b=XoVY1G5ImX2SrDD6o+rJtBxb/o4uIP+oZSNCgQ2G8ZgWyEw5/PkvJ5xSw+IMJxvYi
 WzilOoj9fREYkYODlv8sfCMyi1icNuV/DgFNX3ONiHz44vgiekODMVB99lHXYa7f4O
 fKJYn3XLr1uR9KsbiZ8gyM3hZZ+9EBU2k59ic/LjoW3e+MRRyHcV6N/yvStbvuNF9k
 Ac9hiZ33d17lGzanvmBIpqxUR9/iOpO5aktaJSnEHZTWd0XjMmcTMRvhn2F8gCx+4H
 mWW6jy/3CD7qPyfcSHIuDaJu/NM61ysoiVpdCOToexFNRFIekLvwmJ+4z7rWfc+uX1
 64mDtyyt2Hh4A==
From: Antonio Caggiano <antonio.caggiano@collabora.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] virtio-gpu: Shared memory capability
Date: Tue, 16 Aug 2022 11:42:43 +0200
Message-Id: <20220816094245.64153-1-antonio.caggiano@collabora.com>
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

Previously part of [0], now a patch series on its own.

This patch series cherry picks two commits from [1] and applies one fix
according to [2], which should answer Gerd's comment [3] on previous
patch.

v2: Squash patch #3 into patch #2, and formatting fixes to patch #1.
v3: Reverse commits order.

[0] https://www.mail-archive.com/qemu-devel@nongnu.org/msg826897.html
[1] https://gitlab.freedesktop.org/virgl/qemu/-/commits/virtio-gpu-next/
[2] https://github.com/torvalds/linux/commit/0dd4ff93f4c8dba016ad79384007da4938cd54a1
[3] https://www.mail-archive.com/qemu-devel@nongnu.org/msg827306.html


Dr. David Alan Gilbert (1):
  virtio: Add shared memory capability

Gerd Hoffmann (1):
  virtio-gpu: hostmem

 hw/display/virtio-gpu-pci.c    | 15 +++++++++++++++
 hw/display/virtio-gpu.c        |  1 +
 hw/display/virtio-vga.c        | 33 ++++++++++++++++++++++++---------
 hw/virtio/virtio-pci.c         | 18 ++++++++++++++++++
 include/hw/virtio/virtio-gpu.h |  5 +++++
 include/hw/virtio/virtio-pci.h |  4 ++++
 6 files changed, 67 insertions(+), 9 deletions(-)

-- 
2.34.1


