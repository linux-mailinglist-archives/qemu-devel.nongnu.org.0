Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E654920DCF1
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 22:45:45 +0200 (CEST)
Received: from localhost ([::1]:49034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jq0eu-0004Ox-P2
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 16:45:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jq0ct-0002ks-9j; Mon, 29 Jun 2020 16:43:39 -0400
Received: from charlie.dont.surf ([128.199.63.193]:46374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jq0cr-000632-4F; Mon, 29 Jun 2020 16:43:39 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 3D175BF450;
 Mon, 29 Jun 2020 20:43:34 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH 0/4] hw/block/nvme: support multiple namespaces
Date: Mon, 29 Jun 2020 22:43:23 +0200
Message-Id: <20200629204327.1239520-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 14:26:53
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

This adds a new 'nvme-ns' device that attaches to the nvme device
through a bus. This decouples the nvme controller and nvme namespaces
such that multiple namespaces may be attached to the controller.

With this in place, we can allocate a fresh pci vendor/device id and get
rid of the Intel id pair that causes the Linux kernel to apply a bunch
of quirks that the device no longer has.

Based-on: <20200629203155.1236860-1-its@irrelevant.dk>
("[PATCH 0/3] hw/block/nvme: support scatter gather lists")

Klaus Jensen (4):
  hw/block/nvme: refactor identify active namespace id list
  hw/block/nvme: support multiple namespaces
  pci: allocate pci id for nvme
  hw/block/nvme: change controller pci id

 MAINTAINERS            |   1 +
 docs/specs/nvme.txt    |  23 ++++
 docs/specs/pci-ids.txt |   1 +
 hw/block/Makefile.objs |   2 +-
 hw/block/nvme-ns.c     | 172 ++++++++++++++++++++++++++
 hw/block/nvme-ns.h     |  66 ++++++++++
 hw/block/nvme.c        | 273 +++++++++++++++++++++++++++--------------
 hw/block/nvme.h        |  45 +++----
 hw/block/trace-events  |   8 +-
 hw/core/machine.c      |   1 +
 include/hw/pci/pci.h   |   1 +
 11 files changed, 472 insertions(+), 121 deletions(-)
 create mode 100644 docs/specs/nvme.txt
 create mode 100644 hw/block/nvme-ns.c
 create mode 100644 hw/block/nvme-ns.h

-- 
2.27.0


