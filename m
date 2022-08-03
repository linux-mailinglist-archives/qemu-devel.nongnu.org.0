Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A98D1589016
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 18:22:12 +0200 (CEST)
Received: from localhost ([::1]:47254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJH8N-0002pf-A9
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 12:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1oJGC2-0007eb-7w
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 11:21:54 -0400
Received: from madras.collabora.co.uk
 ([2a00:1098:0:82:1000:25:2eeb:e5ab]:60414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1oJGBw-0004Nc-01
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 11:21:53 -0400
Received: from dellino.fritz.box (host-95-249-131-109.retail.telecomitalia.it
 [95.249.131.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: fahien)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9382866015B8
 for <qemu-devel@nongnu.org>; Wed,  3 Aug 2022 16:21:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1659540103;
 bh=Lo9S88xjqFTe5C5H0BYTMtdh0Gub0KkxH3YZZy+gzYM=;
 h=From:To:Subject:Date:From;
 b=lZwrGTo2tUCogkeLuRS+sRN6M4hemBzCRkpCpTYOAyDBOasqcZds8QBQDB/czjZ+g
 UEFRpJqalcB8jmNe6f4jX1UjUA88Vu6LfR7FJyQNZCjJ0gmDVsh3MoHczxNAF8QSx5
 wCGuftqhBOapZoSfu+hnWGmtwm6jMsjXWJ+FdvCpQ8x4d5BnABD3TStc8xUfGZbh4g
 SYXCMc1huW8KHNP0x5XeQCy7Hs/LnmXOzUL0/vcRVJCkMYnLj/gZFqFs7J1sQZ4Ljx
 uuMpqo8bwPy5Z/+zVHiBvXVo6plo6fKjZO0FQuInOGduDT4qdGMf+qhAVoaU4Fx0Vf
 7tBKpwF6vb30g==
From: Antonio Caggiano <antonio.caggiano@collabora.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] virtio-gpu: Shared memory capability
Date: Wed,  3 Aug 2022 17:21:33 +0200
Message-Id: <20220803152135.118298-1-antonio.caggiano@collabora.com>
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
X-Mailman-Approved-At: Wed, 03 Aug 2022 12:19:02 -0400
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

I guess RFC has been waiting long enough [0].

v2: Squash patch #3 into patch #2, and formatting fixes to patch #1.

[0] https://www.mail-archive.com/qemu-devel@nongnu.org/msg840405.html

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


