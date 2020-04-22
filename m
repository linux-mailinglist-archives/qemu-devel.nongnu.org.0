Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E98D1B3894
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Apr 2020 09:12:52 +0200 (CEST)
Received: from localhost ([::1]:45268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jR9Yx-0006Ga-DK
	for lists+qemu-devel@lfdr.de; Wed, 22 Apr 2020 03:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39562)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jR9Vw-0000gr-AJ
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 03:09:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jR9Vu-0007KU-O4
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 03:09:43 -0400
Received: from charlie.dont.surf ([128.199.63.193]:60182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jR9Vo-00077Q-Oo; Wed, 22 Apr 2020 03:09:36 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id D0490BF5D9;
 Wed, 22 Apr 2020 07:09:32 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v3 00/16] nvme: refactoring and cleanups
Date: Wed, 22 Apr 2020 09:09:11 +0200
Message-Id: <20200422070927.373048-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 02:19:11
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Received-From: 128.199.63.193
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beata Michalska <beata.michalska@linaro.org>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>, Javier Gonzalez <javier.gonz@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Changes since v2
~~~~~~~~~~~~~~~~
* Rebased on block-next (Kevin)
  This caused "nvme: move device parameters to separate struct" and
  "nvme: factor out cmb/pmr setup" to change a bit too much for me to
  feel its fair to keep the Reviewed-by's, so please re-review.

* Changed *err to *local_err (Philippe/Maxim)

* Added comment for nvme_ns_nlbas (Maxim)


Klaus Jensen (16):
  nvme: fix pci doorbell size calculation
  nvme: rename trace events to pci_nvme
  nvme: remove superfluous breaks
  nvme: move device parameters to separate struct
  nvme: use constants in identify
  nvme: refactor nvme_addr_read
  nvme: add max_ioqpairs device parameter
  nvme: remove redundant cmbloc/cmbsz members
  nvme: factor out property/constraint checks
  nvme: factor out device state setup
  nvme: factor out block backend setup
  nvme: add namespace helpers
  nvme: factor out namespace setup
  nvme: factor out pci setup
  nvme: factor out cmb/pmr setup
  nvme: factor out controller identify setup

 hw/block/nvme.c       | 543 +++++++++++++++++++++++-------------------
 hw/block/nvme.h       |  39 ++-
 hw/block/trace-events | 180 +++++++-------
 include/block/nvme.h  |   8 +
 4 files changed, 435 insertions(+), 335 deletions(-)

-- 
2.26.2


