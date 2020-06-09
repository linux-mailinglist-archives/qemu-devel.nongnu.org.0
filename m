Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1E71F46C9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 21:08:38 +0200 (CEST)
Received: from localhost ([::1]:35526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jijbw-0003Dk-Uz
	for lists+qemu-devel@lfdr.de; Tue, 09 Jun 2020 15:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jijXF-0005xi-67; Tue, 09 Jun 2020 15:03:45 -0400
Received: from charlie.dont.surf ([128.199.63.193]:40178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jijXD-0006eQ-Dc; Tue, 09 Jun 2020 15:03:44 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 0A619BF533;
 Tue,  9 Jun 2020 19:03:39 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v7 00/22] nvme: small fixes, refactoring and cleanups
Date: Tue,  9 Jun 2020 21:03:11 +0200
Message-Id: <20200609190333.59390-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 14:38:46
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

Hi all,

As per our discussion about how to amend the bug I introduced in
"hw/block/nvme: allow use of any valid msix vector", this is a respin
without that patch.

Kevin, it applies cleanly on top of your block tree with all current
hw/block/bnvme patches removed.


Changes since v6
~~~~~~~~~~~~~~~~
* Dropped the goofed "hw/block/nvme: allow use of any valid msix vector"
  patch.

* Included Philippe's "hw/block/nvme: Verify msix_vector_use() returned
  value" patch for posterity.

* Added two patches (requesting reviews):

    1. hw/block/nvme: add msix_qsize parameter
    2. hw/block/nvme: verify msix_init_exclusive_bar() return value

  Kevin, it's up to you if you want to wait for reviews on these two or
  just pick up the rest of the series. But let's see if we can get a
  quick review on them.


Klaus Jensen (21):
  hw/block/nvme: fix pci doorbell size calculation
  hw/block/nvme: rename trace events to pci_nvme
  hw/block/nvme: remove superfluous breaks
  hw/block/nvme: move device parameters to separate struct
  hw/block/nvme: use constants in identify
  hw/block/nvme: refactor nvme_addr_read
  hw/block/nvme: fix pin-based interrupt behavior
  hw/block/nvme: add max_ioqpairs device parameter
  hw/block/nvme: remove redundant cmbloc/cmbsz members
  hw/block/nvme: factor out property/constraint checks
  hw/block/nvme: factor out device state setup
  hw/block/nvme: factor out block backend setup
  hw/block/nvme: add namespace helpers
  hw/block/nvme: factor out namespace setup
  hw/block/nvme: factor out pci setup
  hw/block/nvme: factor out cmb setup
  hw/block/nvme: factor out pmr setup
  hw/block/nvme: do cmb/pmr init as part of pci init
  hw/block/nvme: factor out controller identify setup
  hw/block/nvme: add msix_qsize parameter
  hw/block/nvme: verify msix_init_exclusive_bar() return value

Philippe Mathieu-Daudé (1):
  hw/block/nvme: Verify msix_vector_use() returned value

 hw/block/nvme.c       | 576 ++++++++++++++++++++++++------------------
 hw/block/nvme.h       |  34 ++-
 hw/block/trace-events | 180 ++++++-------
 include/block/nvme.h  |   8 +
 4 files changed, 459 insertions(+), 339 deletions(-)

-- 
2.27.0


