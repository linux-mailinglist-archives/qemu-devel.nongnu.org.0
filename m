Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3801B4C2E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Apr 2020 19:53:22 +0200 (CEST)
Received: from localhost ([::1]:55288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRJYn-0003Ct-O7
	for lists+qemu-devel@lfdr.de; Wed, 22 Apr 2020 13:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35592)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jonathan.derrick@intel.com>) id 1jRJCC-00076R-2r
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 13:30:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <jonathan.derrick@intel.com>) id 1jRJCB-0003K1-HL
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 13:29:59 -0400
Received: from mga12.intel.com ([192.55.52.136]:36972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.derrick@intel.com>)
 id 1jRJCA-0003HZ-Sr
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 13:29:59 -0400
IronPort-SDR: l73XXTj78eNpHra02Y8R7oNf/gm7MNYFnMRfXYA2YzLyF63wCsOLThyHThIb7R54bo1HppC8PP
 lI8+9umNb82A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 10:29:56 -0700
IronPort-SDR: EiEq+kTDM6tei4m+yriecOUR7/nl9gUyjwZa8YQ1eFsTnL1I1Aba9k3y0wferZufB6GAqnyARO
 kY7Gz/RrR2xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,304,1583222400"; d="scan'208";a="402622629"
Received: from unknown (HELO localhost.lm.intel.com) ([10.232.116.40])
 by orsmga004.jf.intel.com with ESMTP; 22 Apr 2020 10:29:56 -0700
From: Jon Derrick <jonathan.derrick@intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>,
	qemu-devel@nongnu.org
Subject: [PATCH 0/1] KVM support for VMD devices
Date: Wed, 22 Apr 2020 13:14:44 -0400
Message-Id: <20200422171444.10992-1-jonathan.derrick@intel.com>
X-Mailer: git-send-email 2.18.1
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=jonathan.derrick@intel.com; helo=mga12.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 13:29:57
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Received-From: 192.55.52.136
X-Mailman-Approved-At: Wed, 22 Apr 2020 13:49:16 -0400
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
Cc: linux-pci@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Andrzej Jakowski <andrzej.jakowski@intel.com>,
 Jon Derrick <jonathan.derrick@intel.com>,
 virtualization@lists.linux-foundation.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The two patches (Linux & QEMU) add support for passthrough VMD devices
in QEMU/KVM. VMD device 28C0 already supports passthrough natively by
providing the Host Physical Address in a shadow register to the guest
for correct bridge programming.

The QEMU patch emulates the 28C0 mode by creating a shadow register and
advertising its support by using QEMU's subsystem vendor/id.
The Linux patch matches the QEMU subsystem vendor/id to use the shadow
register.

Jon Derrick (1):
  pci: vmd: Use Shadow MEMBAR registers for QEMU/KVM guests

 drivers/pci/controller/vmd.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

-- 
2.18.1


