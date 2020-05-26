Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7721A9A6C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 12:28:44 +0200 (CEST)
Received: from localhost ([::1]:47290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOfHf-0000V6-Lk
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 06:28:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42872)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jOfE4-0003Qo-30
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 06:25:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1jOfE2-0004uo-Uo
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 06:25:00 -0400
Received: from charlie.dont.surf ([128.199.63.193]:48086)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1jOfE0-0004tB-JS; Wed, 15 Apr 2020 06:24:56 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id B89C2BF7AF;
 Wed, 15 Apr 2020 10:24:53 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH 00/16] nvme: refactoring and cleanups
Date: Wed, 15 Apr 2020 12:24:29 +0200
Message-Id: <20200415102445.564803-1-its@irrelevant.dk>
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

Philippe suggested that I split up this already way too huge series
(more than 50 patches now), so here goes.

The first patch in this series fixes a small bug in the pci doorbell
size calculation. Please consider cherry-picking this.

The rest are refactorings. The "nvme: add max_ioqpairs device parameter"
introduces the 'max_ioqpairs' device parameter, the meaning of which
should be more intuitive than the existing 'num_queues' parameter.


Klaus Jensen (16):
  nvme: fix pci doorbell size calculation
  nvme: rename trace events to nvme_dev
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

 hw/block/nvme.c       | 436 ++++++++++++++++++++++++------------------
 hw/block/nvme.h       |  36 +++-
 hw/block/trace-events | 172 ++++++++---------
 include/block/nvme.h  |   8 +
 4 files changed, 373 insertions(+), 279 deletions(-)

--=20
2.26.0


