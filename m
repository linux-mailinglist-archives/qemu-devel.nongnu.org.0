Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F75910868D
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Nov 2019 03:42:17 +0100 (CET)
Received: from localhost ([::1]:39812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZ4KO-0007ZN-B9
	for lists+qemu-devel@lfdr.de; Sun, 24 Nov 2019 21:42:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46406)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yadong.qi@intel.com>) id 1iZ4IY-0006Iu-RA
 for qemu-devel@nongnu.org; Sun, 24 Nov 2019 21:40:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yadong.qi@intel.com>) id 1iZ4IW-0005p1-Jm
 for qemu-devel@nongnu.org; Sun, 24 Nov 2019 21:40:22 -0500
Received: from mga17.intel.com ([192.55.52.151]:43952)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yadong.qi@intel.com>) id 1iZ4IV-0005oV-2w
 for qemu-devel@nongnu.org; Sun, 24 Nov 2019 21:40:20 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Nov 2019 18:40:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,239,1571727600"; d="scan'208";a="220127210"
Received: from caas-nuc7i7dnhe.sh.intel.com ([10.239.158.159])
 by orsmga002.jf.intel.com with ESMTP; 24 Nov 2019 18:40:13 -0800
From: yadong.qi@intel.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] Refine Second-Level Paging Entries reserved fields
 checking
Date: Mon, 25 Nov 2019 08:33:19 +0800
Message-Id: <20191125003321.5669-1-yadong.qi@intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.151
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
Cc: qi1.zhang@intel.com, ehabkost@redhat.com, mst@redhat.com, peterx@redhat.com,
 pbonzini@redhat.com, yadong.qi@intel.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Qi, Yadong" <yadong.qi@intel.com>

The following patches are to refine/fix issues of reserved fields checking logic
of Second-Level Paging Entries of VT-d:
- split the resevred fields arrays into two ones,
- large page only effect for L2(2M) and L3(1G), so remove
  checking of L1 and L4 for large page,
- when dt is supported, TM filed should not be Reserved(0).

Changes in v3:
- large page only effect for L2(2M) and L3(1G), so remove
  checking of L1 and L4 for large page

Qi, Yadong (2):
  intel_iommu: refine SL-PEs reserved fields checking
  intel_iommu: TM field should not be in reserved bits

 hw/i386/intel_iommu.c          | 40 +++++++++++++++++++---------------
 hw/i386/intel_iommu_internal.h | 18 +++++++++------
 2 files changed, 34 insertions(+), 24 deletions(-)

-- 
2.17.1


