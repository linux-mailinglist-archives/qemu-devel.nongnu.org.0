Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F4577F88
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Jul 2019 15:16:14 +0200 (CEST)
Received: from localhost ([::1]:45250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hrj26-00087q-6K
	for lists+qemu-devel@lfdr.de; Sun, 28 Jul 2019 09:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59874)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hrj0a-0006Ho-0Q
 for qemu-devel@nongnu.org; Sun, 28 Jul 2019 09:14:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hrj0X-00043X-S2
 for qemu-devel@nongnu.org; Sun, 28 Jul 2019 09:14:39 -0400
Received: from mga02.intel.com ([134.134.136.20]:60147)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hrj0X-0002OG-KW
 for qemu-devel@nongnu.org; Sun, 28 Jul 2019 09:14:37 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jul 2019 06:13:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,318,1559545200"; d="scan'208";a="370141719"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga005.fm.intel.com with ESMTP; 28 Jul 2019 06:13:35 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Sun, 28 Jul 2019 21:13:04 +0800
Message-Id: <20190728131304.1282-4-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190728131304.1282-1-richardw.yang@linux.intel.com>
References: <20190728131304.1282-1-richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.20
Subject: [Qemu-devel] [PATCH 3/3] memory-device: break the loop if tmp
 exceed the hinted range
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
Cc: imammedo@redhat.com, david@redhat.com,
 Wei Yang <richardw.yang@linux.intel.com>, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The memory-device list built by memory_device_build_list is ordered by
its address, this means if the tmp range exceed the hinted range, all
the following range will not overlap with it.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 hw/mem/memory-device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
index 413b514586..aea47ab3e8 100644
--- a/hw/mem/memory-device.c
+++ b/hw/mem/memory-device.c
@@ -180,7 +180,7 @@ static uint64_t memory_device_get_free_addr(MachineState *ms,
                 range_make_empty(&new);
                 break;
             }
-        } else if (!hint) {
+        } else if (!hint || range_lob(&tmp) > range_upb(&new)) {
             break;
         }
     }
-- 
2.17.1


