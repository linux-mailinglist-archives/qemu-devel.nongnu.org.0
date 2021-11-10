Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE6544C551
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 17:46:55 +0100 (CET)
Received: from localhost ([::1]:33018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkqkQ-0006Kd-Pn
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 11:46:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1mkqgN-00015S-6m
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:42:43 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:36776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1mkqgJ-0006xU-QB
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:42:42 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: fahien) with ESMTPSA id 605271F447A0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1636562555; bh=2hREvMTbNtU0TD8+avJAhHdqPhByNDMhgzV0XIc0N5c=;
 h=From:To:Subject:Date:From;
 b=GrEFrlLeQMKDpxmVzu8IS3Mnom9eBkdfp0j0S3a1jzCqMbqQDijszOsuFvC7YKVg6
 JQftqtvzb95iHpB8RfAvM40zvxfJCkpWZgMsQ/+WdJN2xaOC3u9Z8FNPxJWMQerMit
 IYteT1vEZLZwjSVr+2JVAxdVqNgJFG0bTujUDTb4rJ6hhRP2HF02B/iK+kpZLugD0V
 41qtaVYObkdcqkKlYszpV9zvlyBIdAXd0/o7wivQuFtLT1tYD/vNWkgKl8EIAvf51z
 nPuVqjO5SRrmHP+tiAbOcp7S01jljMy7nFFhATxGlxPjBPJM0EosPEtxEKOTnV73ls
 Y6x8HvQjlthLg==
From: Antonio Caggiano <antonio.caggiano@collabora.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] virtio-gpu: Shared memory capability
Date: Wed, 10 Nov 2021 17:42:18 +0100
Message-Id: <20211110164220.273641-1-antonio.caggiano@collabora.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=46.235.227.227;
 envelope-from=antonio.caggiano@collabora.com; helo=bhuna.collabora.co.uk
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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

Previously RFC [0] part of [0], now a patch series on its own.

This patch series cherry picks two commits from [1] and applies one fix
according to [2], which should answer Gerd's comment [3] on previous
patch.

[0] https://www.mail-archive.com/qemu-devel@nongnu.org/msg840405.html
[1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg826897.html
[2] https://gitlab.freedesktop.org/virgl/qemu/-/commits/virtio-gpu-next/
[3] https://github.com/torvalds/linux/commit/0dd4ff93f4c8dba016ad79384007da4938cd54a1
[4] https://www.mail-archive.com/qemu-devel@nongnu.org/msg827306.html

Dr. David Alan Gilbert (1):
  virtio: Add shared memory capability

Gerd Hoffmann (1):
  virtio-gpu: hostmem

 hw/display/virtio-gpu-pci.c    | 14 ++++++++++++++
 hw/display/virtio-gpu.c        |  1 +
 hw/display/virtio-vga.c        | 32 +++++++++++++++++++++++---------
 hw/virtio/virtio-pci.c         | 19 +++++++++++++++++++
 hw/virtio/virtio-pci.h         |  4 ++++
 include/hw/virtio/virtio-gpu.h |  5 +++++
 6 files changed, 66 insertions(+), 9 deletions(-)

-- 
2.32.0


