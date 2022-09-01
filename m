Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D53E5A8BF4
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 05:35:23 +0200 (CEST)
Received: from localhost ([::1]:39514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTazC-0007Yi-5j
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 23:35:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1oTarr-0008Sp-Ec
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 23:27:50 -0400
Received: from mga12.intel.com ([192.55.52.136]:17693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1oTaro-0007uj-KS
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 23:27:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662002864; x=1693538864;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HjBvEXpRDSUmainUOejjqublh4jt3/bIcS6XL2P8Pck=;
 b=gYC0RyY/fOWxYfLtsWkrFJBN5BTQ3Kqj4nSZrYRtX3j4p0diWXHldjWn
 L4mLwMEovhvIqcm6liJFqKzY1D0OufXQ0Ul02v+V0UoQHsFOqYR8jc1Yn
 uWYIcTKmqdh3jbv/frmBzhubsVQxvDj5BYbLpZ74QZ2PyyIOoAyJuTQc1
 BSWJfo/AsWe50u4A9IK16tCX5i3eyIx/zVtzPV4dZxhvtF8WuMZkWknPr
 Ubw1+A/lBr0ruAIRoiALqfD8kHKdh04aWSTGUjs8WDWze447YFewE7WDk
 Xy84AmFWKtAy8zfiOyoDKyLawkgNtJ5aFxERQ2lD7fWUYravf3QQ8242m g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="275354020"
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="275354020"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 20:27:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="642142700"
Received: from sqa-gate.sh.intel.com (HELO robert-clx2.tsp.org)
 ([10.239.48.212])
 by orsmga008.jf.intel.com with ESMTP; 31 Aug 2022 20:27:33 -0700
From: Robert Hoo <robert.hu@linux.intel.com>
To: imammedo@redhat.com, mst@redhat.com, xiaoguangrong.eric@gmail.com,
 ani@anisinha.ca, dan.j.williams@intel.com, jingqi.liu@intel.com
Cc: qemu-devel@nongnu.org, robert.hu@intel.com,
 Robert Hoo <robert.hu@linux.intel.com>
Subject: [PATCH v3 3/5] acpi/nvdimm: define macro for NVDIMM Device _DSM
Date: Thu,  1 Sep 2022 11:27:19 +0800
Message-Id: <20220901032721.1392482-4-robert.hu@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220901032721.1392482-1-robert.hu@linux.intel.com>
References: <20220901032721.1392482-1-robert.hu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=robert.hu@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001,
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

Since it will be heavily used in next patch, define macro
NVDIMM_DEVICE_DSM_UUID for "4309AC30-0D11-11E4-9191-0800200C9A66", which is
NVDIMM device specific method uuid defined in NVDIMM _DSM interface spec,
Section 3. [1]

No functional changes in this patch.

[1] https://pmem.io/documents/IntelOptanePMem_DSM_Interface-V2.0.pdf

Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>
---
 hw/acpi/nvdimm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index 201317c611..afff911c1e 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -922,6 +922,7 @@ void nvdimm_init_acpi_state(NVDIMMState *state, MemoryRegion *io,
 #define NVDIMM_DSM_RFIT_STATUS  "RSTA"
 
 #define NVDIMM_QEMU_RSVD_UUID   "648B9CF2-CDA1-4312-8AD9-49C4AF32BD62"
+#define NVDIMM_DEVICE_DSM_UUID  "4309AC30-0D11-11E4-9191-0800200C9A66"
 
 static void nvdimm_build_common_dsm(Aml *dev,
                                     NVDIMMState *nvdimm_state)
@@ -1029,8 +1030,7 @@ static void nvdimm_build_common_dsm(Aml *dev,
                /* UUID for QEMU internal use */), expected_uuid));
     aml_append(elsectx, ifctx);
     elsectx2 = aml_else();
-    aml_append(elsectx2, aml_store(
-               aml_touuid("4309AC30-0D11-11E4-9191-0800200C9A66")
+    aml_append(elsectx2, aml_store(aml_touuid(NVDIMM_DEVICE_DSM_UUID)
                /* UUID for NVDIMM Devices */, expected_uuid));
     aml_append(elsectx, elsectx2);
     aml_append(method, elsectx);
-- 
2.31.1


