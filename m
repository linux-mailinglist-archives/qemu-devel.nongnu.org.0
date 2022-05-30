Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E6D5373C0
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 05:43:39 +0200 (CEST)
Received: from localhost ([::1]:53114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvWJe-0007is-GO
	for lists+qemu-devel@lfdr.de; Sun, 29 May 2022 23:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1nvWH5-000521-Md
 for qemu-devel@nongnu.org; Sun, 29 May 2022 23:40:59 -0400
Received: from mga14.intel.com ([192.55.52.115]:36558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1nvWH3-0006wX-Gw
 for qemu-devel@nongnu.org; Sun, 29 May 2022 23:40:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653882057; x=1685418057;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mKqNvHjGeoxS+aXxDCIjDV9OBVOE1uvThYOFAHUogmo=;
 b=SpcnV8cwcm+MLdRBARl6UgHqSkvDve7DS+Vf42oMiB910Ki279neRBZ+
 s8PyKOU3VdnC8S5fmiEeG5zRbt3jHU9i0de3hC+Zm7PvvMbAJVVkHo43z
 E7gjmHwWR8qh2BtOxr3Oi3usv0Y2xfbmeviYfhNXS5pQy0UZxDum8am/H
 BP5S7Vw9/c+9VHf+9qCS9O8pqDS6B0r3DFo11c+dzh7GlUVOsKvDb6CMh
 dqfuc/o12Zv5WCpHedX2b7rE1DXTJH4SeMOmn4TJ2zShlrasKt0F8HK14
 bVv/Yue/NgVLCd3e47EdJbAOIpH72doAVduxuFI5UWTYHk4QoR65wPWgQ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="274974840"
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600"; d="scan'208";a="274974840"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2022 20:40:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600"; d="scan'208";a="528993796"
Received: from sqa-gate.sh.intel.com (HELO robert-clx2.tsp.org)
 ([10.239.48.212])
 by orsmga003.jf.intel.com with ESMTP; 29 May 2022 20:40:54 -0700
From: Robert Hoo <robert.hu@linux.intel.com>
To: imammedo@redhat.com, mst@redhat.com, xiaoguangrong.eric@gmail.com,
 ani@anisinha.ca, dan.j.williams@intel.com, jingqi.liu@intel.com
Cc: qemu-devel@nongnu.org,
	robert.hu@intel.com
Subject: [QEMU PATCH v2 3/6] acpi/nvdimm: NVDIMM _DSM Spec supports revision 2
Date: Mon, 30 May 2022 11:40:44 +0800
Message-Id: <20220530034047.730356-4-robert.hu@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220530034047.730356-1-robert.hu@linux.intel.com>
References: <20220530034047.730356-1-robert.hu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.115;
 envelope-from=robert.hu@linux.intel.com; helo=mga14.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Intel Optane PMem DSM Interface, Version 2.0 [1], is the up-to-date
spec for NVDIMM _DSM definition, which supports revision_id == 2.

Nevertheless, Rev.2 of NVDIMM _DSM has no functional change on those Label
Data _DSM Functions, which are the only ones implemented for vNVDIMM.
So, simple change to support this revision_id == 2 case.

[1] https://pmem.io/documents/IntelOptanePMem_DSM_Interface-V2.0.pdf

Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>
---
 hw/acpi/nvdimm.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index 0ab247a870..59b42afcf1 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -849,9 +849,13 @@ nvdimm_dsm_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
     nvdimm_debug("Revision 0x%x Handler 0x%x Function 0x%x.\n", in->revision,
                  in->handle, in->function);
 
-    if (in->revision != 0x1 /* Currently we only support DSM Spec Rev1. */) {
-        nvdimm_debug("Revision 0x%x is not supported, expect 0x%x.\n",
-                     in->revision, 0x1);
+    /*
+     * Current NVDIMM _DSM Spec supports Rev1 and Rev2
+     * Intel® OptanePersistent Memory Module DSM Interface, Revision 2.0
+     */
+    if (in->revision != 0x1 && in->revision != 0x2) {
+        nvdimm_debug("Revision 0x%x is not supported, expect 0x1 or 0x2.\n",
+                     in->revision);
         nvdimm_dsm_no_payload(NVDIMM_DSM_RET_STATUS_UNSUPPORT, dsm_mem_addr);
         goto exit;
     }
-- 
2.31.1


