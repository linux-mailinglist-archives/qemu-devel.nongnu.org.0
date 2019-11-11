Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07508F742E
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Nov 2019 13:40:10 +0100 (CET)
Received: from localhost ([::1]:51942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iU8zI-0006dN-Vv
	for lists+qemu-devel@lfdr.de; Mon, 11 Nov 2019 07:40:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36964)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1iU8ll-0007hv-8O
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 07:26:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1iU8lf-0003RF-W6
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 07:26:09 -0500
Received: from charlie.dont.surf ([128.199.63.193]:52102)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1iU8la-0003N9-Oz; Mon, 11 Nov 2019 07:26:00 -0500
Received: from apples.localdomain (unknown [194.62.217.57])
 by charlie.dont.surf (Postfix) with ESMTPSA id 30419BF4E8;
 Mon, 11 Nov 2019 12:25:56 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v3 00/20] nvme: support NVMe v1.3d,
 SGLs and multiple namespaces
Date: Mon, 11 Nov 2019 13:25:24 +0100
Message-Id: <20191111122545.252478-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.24.0
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
Cc: Kevin Wolf <kwolf@redhat.com>, Javier Gonzalez <javier@javigon.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Keith Busch <kbusch@kernel.org>,
 Stephen Bates <sbates@raithlin.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

This v3 fixes a number of issues found doing v2[1]. Below is a list of
commits that changed for v3.

* In "nvme: add missing fields in the identify controller data
  structure", the size of the RTD3R field was incorrectly two instead of
  four bytes wide.

* Fix status code for an invalid NSID for the SMART/Health log page in
  "nvme: add support for the get log page command".

* The naming of reserved fields was changed in "nvme: bump supported
  specification version to 1.3" to align with existing convention.

* "nvme: support multiple namespaces" got a bunch of fixes. The nvme_ns
  function did not error out when the given nsid was above the number of
  valid namespace ids. As reported by Ross, the device did not correctly
  handle inactive namespaces. The controller should return a zeroed
  identify page in response to the Identify Namespace command for an
  inactive namespace.

  Previously, each namespace would contain all of the "common block
  parameters" such as "logical_block_size", "write-cache", etc. For the
  NVMe controller, the write cache is controller wide, so fix handling
  of this feature by removing all those parameters for the nvme-ns
  device and only keep the "drive" parameter. Setting the write-cache
  parameter on the nvme device will trickle down to the nvme-ns devices
  instead. Thus, sending a Set Feature command for the Volatile Write
  Cache feature will also enable/disable the write cache for all
  namespaces (as it should according to the specification).

* Fix a bunch of -Werror=3Dint-to-pointer-cast errors in the "nvme: handl=
e
  dma errors" patch.

After conversations with Michael S. Tsirkin, my patch for dma_memory_rw
("pci: pass along the return value of dma_memory_rw") is now included in
this series (with Reviewed-By by Philippe and Michael). The patch is
required for patch "nvme: handle dma errors" to actually do fix
anything.


  [1]: https://patchwork.kernel.org/cover/11190045/


Klaus Jensen (21):
  nvme: remove superfluous breaks
  nvme: move device parameters to separate struct
  nvme: add missing fields in the identify controller data structure
  nvme: populate the mandatory subnqn and ver fields
  nvme: allow completion queues in the cmb
  nvme: add support for the abort command
  nvme: refactor device realization
  nvme: add support for the get log page command
  nvme: add support for the asynchronous event request command
  nvme: add logging to error information log page
  nvme: add missing mandatory features
  nvme: bump supported specification version to 1.3
  nvme: refactor prp mapping
  nvme: allow multiple aios per command
  nvme: add support for scatter gather lists
  nvme: support multiple namespaces
  nvme: bump controller pci device id
  nvme: remove redundant NvmeCmd pointer parameter
  nvme: make lba data size configurable
  pci: pass along the return value of dma_memory_rw
  nvme: handle dma errors

 block/nvme.c           |   18 +-
 hw/block/Makefile.objs |    2 +-
 hw/block/nvme-ns.c     |  158 ++++
 hw/block/nvme-ns.h     |   62 ++
 hw/block/nvme.c        | 1867 +++++++++++++++++++++++++++++++++-------
 hw/block/nvme.h        |  230 ++++-
 hw/block/trace-events  |   38 +-
 include/block/nvme.h   |  130 ++-
 include/hw/pci/pci.h   |    3 +-
 9 files changed, 2126 insertions(+), 382 deletions(-)
 create mode 100644 hw/block/nvme-ns.c
 create mode 100644 hw/block/nvme-ns.h

--=20
2.24.0


