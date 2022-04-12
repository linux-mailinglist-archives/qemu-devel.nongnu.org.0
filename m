Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7684FD210
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 09:08:58 +0200 (CEST)
Received: from localhost ([::1]:49964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neAe1-00033I-7e
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 03:08:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1neATc-0004aE-Oz
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 02:58:13 -0400
Received: from mga09.intel.com ([134.134.136.24]:30160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1neATb-0002mc-6G
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 02:58:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649746691; x=1681282691;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hkxnDA8FEK0Rd1Yql1ZYoyY4noxU3Ohmeu06nJdK03I=;
 b=fsyoaLQ6e78TTiAFulEtTDxvnTBX3MK9imuL/saOhTPS26dXbsslehpl
 MNxDuQhM/yzKIJal5CXIHqiHbHTAMM6m4YZG2IxO7Dbh8looaalpVgYeC
 92CUQFTOaKMPPj+ohSa8bibLLL98cu4ZzvXSqyRe1Zt5qFHchk0Odzafe
 8gnOiOdtAlH8wD5C1+aXbl2JcVmjcyLOJnJ2oSQcmaSGv/6Iaue0Pcr2N
 /AEWQeKxjOTEyFkYLwtRLD52EOhckSV9yUm6jQAp6122H2nOYFqMKlLFe
 xEFQUsDDejJ1DWPhrYD0D9ADfYKSZRR2JBOARAcGykZjn+KGfFWvOVYm9 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="261731609"
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="261731609"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 23:58:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="660365052"
Received: from sqa-gate.sh.intel.com (HELO robert-clx2.tsp.org)
 ([10.239.48.212])
 by orsmga004.jf.intel.com with ESMTP; 11 Apr 2022 23:58:07 -0700
From: Robert Hoo <robert.hu@linux.intel.com>
To: xiaoguangrong.eric@gmail.com, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, qemu-devel@nongnu.org
Subject: [PATCH 2/2] acpi/nvdimm: Fix aml_or() and aml_and() in if clause
Date: Tue, 12 Apr 2022 14:57:53 +0800
Message-Id: <20220412065753.3216538-3-robert.hu@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220412065753.3216538-1-robert.hu@linux.intel.com>
References: <20220412065753.3216538-1-robert.hu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.24;
 envelope-from=robert.hu@linux.intel.com; helo=mga09.intel.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: jingqi.liu@intel.com, dan.j.williams@intel.com,
 Robert Hoo <robert.hu@linux.intel.com>, robert.hu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It should be some typo originally, where in If condition, using bitwise
and/or, rather than logical and/or.

The resulting change in AML code:

If (((Local6 == Zero) | (Arg0 != Local0)))
==>
If (((Local6 == Zero) || (Arg0 != Local0)))

If (((ObjectType (Arg3) == 0x04) & (SizeOf (Arg3) == One)))
==>
If (((ObjectType (Arg3) == 0x04) && (SizeOf (Arg3) == One)))

Fixes: 90623ebf603 ("nvdimm acpi: check UUID")
Fixes: 4568c948066 ("nvdimm acpi: save arg3 of _DSM method")
Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>
---
 hw/acpi/nvdimm.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index 7cc419401b..2cd26bb9e9 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -1040,7 +1040,7 @@ static void nvdimm_build_common_dsm(Aml *dev,
 
     uuid_invalid = aml_lnot(aml_equal(uuid, expected_uuid));
 
-    unsupport = aml_if(aml_or(unpatched, uuid_invalid, NULL));
+    unsupport = aml_if(aml_lor(unpatched, uuid_invalid));
 
     /*
      * function 0 is called to inquire what functions are supported by
@@ -1072,10 +1072,9 @@ static void nvdimm_build_common_dsm(Aml *dev,
      * in the DSM Spec.
      */
     pckg = aml_arg(3);
-    ifctx = aml_if(aml_and(aml_equal(aml_object_type(pckg),
+    ifctx = aml_if(aml_land(aml_equal(aml_object_type(pckg),
                    aml_int(4 /* Package */)) /* It is a Package? */,
-                   aml_equal(aml_sizeof(pckg), aml_int(1)) /* 1 element? */,
-                   NULL));
+                   aml_equal(aml_sizeof(pckg), aml_int(1)) /* 1 element? */));
 
     pckg_index = aml_local(2);
     pckg_buf = aml_local(3);
-- 
2.31.1


