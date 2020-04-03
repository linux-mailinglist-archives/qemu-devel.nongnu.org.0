Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C965A19D1E7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Apr 2020 10:14:11 +0200 (CEST)
Received: from localhost ([::1]:51856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jKHSs-0008L5-SI
	for lists+qemu-devel@lfdr.de; Fri, 03 Apr 2020 04:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42781)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yan.y.zhao@intel.com>) id 1jKHLX-0003f6-OZ
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 04:06:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yan.y.zhao@intel.com>) id 1jKHLW-00025V-3B
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 04:06:35 -0400
Received: from mga01.intel.com ([192.55.52.88]:20879)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yan.y.zhao@intel.com>)
 id 1jKHLV-000210-QX
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 04:06:34 -0400
IronPort-SDR: q0QoLRdJP6apxulI68mfBondVJm/3UJ5PJzkhPQnxxzhi+DxotkMAhUPC5kQh5eW5OPzT/nHO5
 f/fv8vKCluoQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2020 01:06:23 -0700
IronPort-SDR: NISk3zbcXuFDbGuX/wE17VrJQMqChUvarIaDscMcItoXfGWfyfSjIAhcvJ8navQcHs+aS4iHoI
 GkJADR3OEfMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,339,1580803200"; d="scan'208";a="273862777"
Received: from dpdk-zhirun.sh.intel.com ([10.67.119.121])
 by fmsmga004.fm.intel.com with ESMTP; 03 Apr 2020 01:06:21 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] drop writes to read-only ram device & vfio regions
Date: Fri,  3 Apr 2020 16:56:57 +0000
Message-Id: <20200403165657.20566-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 192.55.52.88
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
Cc: Yan Zhao <yan.y.zhao@intel.com>, pbonzini@redhat.com,
 alex.williamson@redhat.com, philmd@redhat.com, xin.zeng@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

patch 1 modifies handler of ram device memory regions to drop guest writes
to read-only ram device memory regions

patch 2 modifies handler of non-mmap'd read-only vfio regions to drop guest
writes to those regions 

patch 3 let mmap'd read-only vfio regions be able to generate vmexit for
guest write. so, without patch 1, host qemu would crash on guest write to
this read-only region. with patch 1, host qemu would drop the writes.

Yan Zhao (3):
  memory: drop guest writes to read-only ram device regions
  hw/vfio: drop guest writes to ro regions
  hw/vfio: let read-only flag take effect for mmap'd regions

 hw/vfio/common.c     | 12 +++++++++++-
 hw/vfio/trace-events |  2 +-
 memory.c             |  6 +++++-
 trace-events         |  2 +-
 4 files changed, 18 insertions(+), 4 deletions(-)

-- 
2.17.1


