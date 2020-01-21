Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0425B14370E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 07:21:44 +0100 (CET)
Received: from localhost ([::1]:48942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itmv0-0000Hm-Q8
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 01:21:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41969)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jing2.liu@linux.intel.com>) id 1itmtE-0007Ho-9Q
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 01:19:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jing2.liu@linux.intel.com>) id 1itmtD-0006Tm-6g
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 01:19:52 -0500
Received: from mga03.intel.com ([134.134.136.65]:35723)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jing2.liu@linux.intel.com>)
 id 1itmtC-0006Rf-UP
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 01:19:51 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jan 2020 22:19:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,344,1574150400"; d="scan'208";a="278302031"
Received: from hyperv-sh3.bj.intel.com ([10.240.193.95])
 by fmsmga001.fm.intel.com with ESMTP; 20 Jan 2020 22:19:49 -0800
From: Jing Liu <jing2.liu@linux.intel.com>
To: virtio-dev@lists.oasis-open.org
Subject: [virtio-dev] [PATCH v2 3/5] virtio-mmio: Add feature bit for MMIO MSI
Date: Tue, 21 Jan 2020 21:54:31 +0800
Message-Id: <1579614873-21907-4-git-send-email-jing2.liu@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579614873-21907-1-git-send-email-jing2.liu@linux.intel.com>
References: <1579614873-21907-1-git-send-email-jing2.liu@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.65
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
Cc: Zha Bin <zhabin@linux.alibaba.com>, kvm@vger.kernel.org,
 Jing Liu <jing2.liu@linux.intel.com>, linux-kernel@vger.kernel.org,
 qemu-devel@nongnu.org, Chao Peng <chao.p.peng@linux.intel.com>,
 Liu Jiang <gerry@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current MMIO transport layer uses a single, dedicated interrupt
signal, which brings performance penalty. Add a feature bit (40)
for introducing MSI capability.

Co-developed-by: Chao Peng <chao.p.peng@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
Co-developed-by: Liu Jiang <gerry@linux.alibaba.com>
Signed-off-by: Liu Jiang <gerry@linux.alibaba.com>
Co-developed-by: Zha Bin <zhabin@linux.alibaba.com>
Signed-off-by: Zha Bin <zhabin@linux.alibaba.com>
Signed-off-by: Jing Liu <jing2.liu@linux.intel.com>
---
 content.tex | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/content.tex b/content.tex
index 5881253..ff151ba 100644
--- a/content.tex
+++ b/content.tex
@@ -5840,6 +5840,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
   \item[VIRTIO_F_MMIO_NOTIFICATION(39)] This feature indicates
   that the device supports enhanced notification mechanism on
   MMIO transport layer.
+  \item[VIRTIO_F_MMIO_MSI(40)] This feature indicates that the
+  device supports Message Signal Interrupts (MSI) mechanism on
+  MMIO transport layer.
 
 \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
 
@@ -5875,6 +5878,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 
 A driver SHOULD accept VIRTIO_F_MMIO_NOTIFICATION if it is offered.
 
+A driver SHOULD accept VIRTIO_F_MMIO_MSI if it is offered.
+If VIRTIO_F_MMIO_MSI has been negotiated, a driver MUST try to
+set up MSI at first priority.
+
 \devicenormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
 
 A device MUST offer VIRTIO_F_VERSION_1.  A device MAY fail to operate further
-- 
2.7.4


