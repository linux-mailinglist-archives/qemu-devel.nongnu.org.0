Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CA014370D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 07:21:30 +0100 (CET)
Received: from localhost ([::1]:48938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itmun-0008PH-Q2
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 01:21:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41938)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jing2.liu@linux.intel.com>) id 1itmt2-0007Bi-LJ
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 01:19:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jing2.liu@linux.intel.com>) id 1itmt1-0006MT-EJ
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 01:19:40 -0500
Received: from mga11.intel.com ([192.55.52.93]:39448)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jing2.liu@linux.intel.com>)
 id 1itmt1-0006GD-6Q
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 01:19:39 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jan 2020 22:19:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,344,1574150400"; d="scan'208";a="278301056"
Received: from hyperv-sh3.bj.intel.com ([10.240.193.95])
 by fmsmga001.fm.intel.com with ESMTP; 20 Jan 2020 22:19:27 -0800
From: Jing Liu <jing2.liu@linux.intel.com>
To: virtio-dev@lists.oasis-open.org
Subject: [virtio-dev] [PATCH v2 0/5] virtio-mmio enhancement
Date: Tue, 21 Jan 2020 21:54:28 +0800
Message-Id: <1579614873-21907-1-git-send-email-jing2.liu@linux.intel.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.93
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
Cc: Jing Liu <jing2.liu@linux.intel.com>, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current virtio over MMIO has some limitations that impact the performance.
It only supports single legacy, dedicated interrupt and one virtqueue
notification register for all virtqueues which cause performance penalties.

To address such limitations, we proposed to update virtio-mmio spec with
two new feature bits to support MSI interrupt and enhancing notification mechanism.

For keeping virtio-mmio simple as it was, and considering practical usages, this
provides two kinds of mapping mode for device: MSI non-sharing mode and MSI sharing mode.
MSI non-sharng mode indicates a fixed static vector and event relationship specified
in spec, which can simplify the setup process and reduce vmexit, fitting for
a high interrupt rate request.
MSI sharing mode indicates a dynamic mapping, which is more like PCI does, fitting
for a non-high interrupt rate request.

Change Log:
v1->v2:
* Change version update to feature bit
* Add mask/unmask support
* Add two MSI sharing/non-sharing modes
* Change MSI registers layout and bits

Jing Liu (5):
  virtio-mmio: Add feature bit for MMIO notification
  virtio-mmio: Enhance queue notification support
  virtio-mmio: Add feature bit for MMIO MSI
  virtio-mmio: Introduce MSI details
  virtio-mmio: MSI vector and event mapping

 content.tex | 286 ++++++++++++++++++++++++++++++++++++++++++++++++++++++------
 msi-state.c |   5 ++
 2 files changed, 262 insertions(+), 29 deletions(-)
 create mode 100644 msi-state.c

-- 
2.7.4


