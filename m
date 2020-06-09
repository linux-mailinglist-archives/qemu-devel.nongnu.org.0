Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D40B1F3738
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 11:47:06 +0200 (CEST)
Received: from localhost ([::1]:52596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiaqX-00064w-J0
	for lists+qemu-devel@lfdr.de; Tue, 09 Jun 2020 05:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jiaov-0004uD-A3; Tue, 09 Jun 2020 05:45:25 -0400
Received: from charlie.dont.surf ([128.199.63.193]:39344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jiaot-0004DL-V7; Tue, 09 Jun 2020 05:45:24 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 48722BF5B8;
 Tue,  9 Jun 2020 09:45:18 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH 0/1] hw/block/nvme: fix assert on invalid irq vector
Date: Tue,  9 Jun 2020 11:45:06 +0200
Message-Id: <20200609094508.32412-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 05:45:20
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Javier Gonzalez <javier.gonz@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

I goofed up with commit c09794fe40e3 ("hw/block/nvme: allow use of any
valid msix vector").

This fixes the goof by adding a new msix_qsize parameter. As a nice
side-effect this allows a device with less interrupt vectors available
than supported queues. Also, improve the error handling in
nvme_init_pci().

Kevin, please consider picking this up for the block branch when
reviewed.

Cc: qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>
Cc: Max Reitz <mreitz@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Klaus Jensen <its@irrelevant.dk>
Cc: Javier Gonzalez <javier.gonz@samsung.com>
Cc: Maxim Levitsky <mlevitsk@redhat.com>
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>

Klaus Jensen (2):
  hw/block/nvme: add msix_qsize parameter
  hw/block/nvme: verify msix_init_exclusive_bar() return value

 hw/block/nvme.c | 28 ++++++++++++++++++++++------
 hw/block/nvme.h |  1 +
 2 files changed, 23 insertions(+), 6 deletions(-)

-- 
2.27.0


