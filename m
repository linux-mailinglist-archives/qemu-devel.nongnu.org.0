Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CE216892F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 22:24:33 +0100 (CET)
Received: from localhost ([::1]:36332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5Fmh-0004uP-In
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 16:24:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32864)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrzej.jakowski@linux.intel.com>)
 id 1j5Fle-0003wK-K0
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 16:23:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrzej.jakowski@linux.intel.com>)
 id 1j5Fld-00058H-Je
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 16:23:26 -0500
Received: from mga07.intel.com ([134.134.136.100]:27825)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrzej.jakowski@linux.intel.com>)
 id 1j5Flb-00053m-5a; Fri, 21 Feb 2020 16:23:23 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Feb 2020 13:23:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,469,1574150400"; d="scan'208";a="240446392"
Received: from unknown (HELO localhost.ch.intel.com) ([10.2.28.117])
 by orsmga006.jf.intel.com with ESMTP; 21 Feb 2020 13:23:19 -0800
From: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>
To: keith.busch@intel.com,
	kwolf@redhat.com,
	mreitz@redhat.com
Subject: [PATCH v2 0/1] Enable PMR feature from NVMe 1.4 spec to NVMe driver
Date: Fri, 21 Feb 2020 14:23:26 -0700
Message-Id: <20200221212327.24616-1-andrzej.jakowski@linux.intel.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.100
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
Cc: haozhong.zhang@intel.com,
 Andrzej Jakowski <andrzej.jakowski@linux.intel.com>, qemu-block@nongnu.org,
 stefanha@gmail.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 yi.z.zhang@linux.intel.com, junyan.he@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes since v1:
 - provided support for Bit 1 from PMRWBM register instead of Bit 0 to ensure
   improved performance in virtualized environment [1] (Stefan)

 - added check if pmr size is power of two in size (David)

 - addressed cross compilation build problems reported by CI environment

[1]: https://nvmexpress.org/wp-content/uploads/NVM-Express-1_4-2019.06.10-Ratified.pdf
[2]: https://lore.kernel.org/qemu-devel/20200218224811.30050-1-andrzej.jakowski@linux.intel.com/
 
---

Persistent Memory Region (PMR) is a new optional feature provided in NVMe 1.4
specification. This patch implements initial support for it in NVMe driver.

Andrzej Jakowski (1):
  block/nvme: introduce PMR support from NVMe 1.4 spec

 hw/block/nvme.c       | 165 +++++++++++++++++++++++++++++++++++++++-
 hw/block/nvme.h       |   5 ++
 hw/block/trace-events |   5 ++
 include/block/nvme.h  | 172 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 346 insertions(+), 1 deletion(-)

-- 
2.21.1


