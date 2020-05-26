Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12ED41AD2F4
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Apr 2020 00:54:34 +0200 (CEST)
Received: from localhost ([::1]:40092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jPDOy-0007HL-Sv
	for lists+qemu-devel@lfdr.de; Thu, 16 Apr 2020 18:54:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48314)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yan.y.zhao@intel.com>) id 1jPDO6-0006dw-GT
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 18:53:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yan.y.zhao@intel.com>) id 1jPDO4-0000L4-UE
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 18:53:37 -0400
Received: from mga02.intel.com ([134.134.136.20]:18219)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yan.y.zhao@intel.com>)
 id 1jPDO4-0000J9-Kx
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 18:53:36 -0400
IronPort-SDR: i7uqPKkSVJkuZqhsnDcRhnx3TIcipmGzYcHPqx1rZHy4kDzE8gLTvpf7Jbe13hpeP0GTEsEEvM
 e8g/m9YKOHFg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2020 15:53:28 -0700
IronPort-SDR: FIne49EMQxvGF+nmuUvuh7dQgRnHQhlSnJa3gPkSU+OF0caAT54Muf4BNxy3dMRzhPbjoxgFPt
 EZOYKLqUjW1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,392,1580803200"; d="scan'208";a="454510875"
Received: from dpdk-zhirun.sh.intel.com ([10.67.119.121])
 by fmsmga005.fm.intel.com with ESMTP; 16 Apr 2020 15:53:26 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: pbonzini@redhat.com,
	alex.williamson@redhat.com
Subject: [PATCH v4 0/3] drop writes to read-only ram device & vfio regions
Date: Fri, 17 Apr 2020 07:44:14 +0000
Message-Id: <20200417074414.28479-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 134.134.136.20
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
Cc: Yan Zhao <yan.y.zhao@intel.com>, xin.zeng@intel.com, philmd@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

patch 1 modifies handler of ram device memory regions to drop guest writes
to read-only ram device memory regions

patch 2 modifies handler of non-mmap'd read-only vfio regions to drop guest
writes to those regions 

patch 3 set read-only flag to mmap'd read-only vfio regions, so that guest
writes to those regions would be trapped.
without patch 1, host qemu would then crash on guest write to those
read-only regions.
with patch 1, host qemu would drop the writes.

Changelog:
v4:
-instead of modifying tracing log, added qemu_log_mask(LOG_GUEST_ERROR...)
to log guest writes to read-only regions (Philippe)

for
v3:
-refreshed and Cc Stefan for reviewing of tracing part

v2:
-split one big patches into smaller ones (Philippe)
-modify existing trace to record guest writes to read-only memory (Alex)
-modify vfio_region_write() to drop guest writes to non-mmap'd read-only
 region (Alex)


Yan Zhao (3):
  memory: drop guest writes to read-only ram device regions
  hw/vfio: drop guest writes to ro regions
  hw/vfio: let read-only flag take effect for mmap'd regions

 hw/vfio/common.c | 16 ++++++++++++++--
 memory.c         |  7 +++++++
 2 files changed, 21 insertions(+), 2 deletions(-)

-- 
2.17.1


