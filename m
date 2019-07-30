Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C6F79D6D
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 02:39:11 +0200 (CEST)
Received: from localhost ([::1]:57210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsGAY-0001No-7i
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 20:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59648)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hsG9f-0000VY-8S
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 20:38:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hsG9e-0000IN-9S
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 20:38:15 -0400
Received: from mga04.intel.com ([192.55.52.120]:22833)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hsG9e-0000Fv-28
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 20:38:14 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jul 2019 17:38:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,324,1559545200"; d="scan'208";a="182952575"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga002.jf.intel.com with ESMTP; 29 Jul 2019 17:38:07 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Tue, 30 Jul 2019 08:37:40 +0800
Message-Id: <20190730003740.20694-3-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190730003740.20694-1-richardw.yang@linux.intel.com>
References: <20190730003740.20694-1-richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.120
Subject: [Qemu-devel] [PATCH v2 2/2] memory-device: break the loop if tmp
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

And this won't change default pc-dimm mapping and address assignment stay
the same as before this change.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 hw/mem/memory-device.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
index df3261b32a..df4e338b83 100644
--- a/hw/mem/memory-device.c
+++ b/hw/mem/memory-device.c
@@ -180,6 +180,8 @@ static uint64_t memory_device_get_free_addr(MachineState *ms,
                 range_make_empty(&new);
                 break;
             }
+        } else if (range_lob(&tmp) > range_upb(&new)) {
+            break;
         }
     }
 
-- 
2.17.1


