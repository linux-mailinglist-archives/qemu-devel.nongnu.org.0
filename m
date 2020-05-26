Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC241AA2CA
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 15:08:56 +0200 (CEST)
Received: from localhost ([::1]:49738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOhmg-0008II-KT
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 09:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33704)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jOhgU-0007DW-JQ
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 09:02:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1jOhgO-0004Bv-IA
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 09:02:30 -0400
Received: from charlie.dont.surf ([128.199.63.193]:48514)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1jOhgL-00044a-1P; Wed, 15 Apr 2020 09:02:21 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 5FB3FBF7AF;
 Wed, 15 Apr 2020 13:02:19 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v2 00/16] nvme: refactoring and cleanups
Date: Wed, 15 Apr 2020 15:01:43 +0200
Message-Id: <20200415130159.611361-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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

Changes since v1
~~~~~~~~~~~~~~~~
* nvme: fix pci doorbell size calculation
  - added some defines and a better comment (Philippe)

* nvme: rename trace events to pci_nvme
  - changed the prefix from nvme_dev to pci_nvme (Philippe)

* nvme: add max_ioqpairs device parameter
  - added a deprecation comment. I doubt this will go in until 5.1, so
    changed it to "deprecated from 5.1" (Philippe)

* nvme: factor out property/constraint checks
* nvme: factor out block backend setup
  - changed to return void and propagate errors in proper QEMU style
    (Philippe)

* nvme: add namespace helpers
  - use the helper immediately (Philippe)

* nvme: factor out pci setup
  - removed setting of vendor and device id which is already inherited
    from nvme_class_init() (Philippe)

* nvme: factor out cmb setup
  - add lost comment (Philippe)


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
  nvme: factor out cmb setup
  nvme: factor out controller identify setup

 hw/block/nvme.c       | 433 ++++++++++++++++++++++++------------------
 hw/block/nvme.h       |  36 +++-
 hw/block/trace-events | 172 ++++++++---------
 include/block/nvme.h  |   8 +
 4 files changed, 372 insertions(+), 277 deletions(-)

--=20
2.26.0


