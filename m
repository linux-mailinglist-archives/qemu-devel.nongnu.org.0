Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D71716C2A38
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 07:09:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peVAo-0002Lr-IB; Tue, 21 Mar 2023 02:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dan.j.williams@intel.com>)
 id 1peVAl-0002G0-7p
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 02:08:39 -0400
Received: from mga09.intel.com ([134.134.136.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dan.j.williams@intel.com>)
 id 1peVAh-0002xC-PN
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 02:08:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679378915; x=1710914915;
 h=subject:from:to:cc:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AHa71GHGnrZ+xNas5r6VQ2b8MBSS4jouoz+ERx7f0NY=;
 b=bh0dSSUdM0sVhroaYUOkE8FWPzH+mF687ttK+7BWBDqO2ceAMsPJ7vUl
 Yjp2YZLflLFk9EW88mCsn6+maDmwRVhB1CtPXk+eWmG57eO/n3bv6i9ee
 twq1Th/2FU5kQgne5alssNe0wWi7ec+ahvj9AuXrprJL4z5rkFdgR+BvX
 esXqAluVGboJm5u5g0ZaQcHcb4q2XBS3Sl2feCjyFA/2k4oGfN6nrjvhb
 1g4oZZ9JZDHJtpqYWNStNg4z9F30y7ochr8IxcM3mAsF9ygC9TwcIN3//
 +bOMa+bgQMOcUlTlsfreE37d9tHpcT7FgMcYMzz0MiZbX1px9tvZvhBeD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="340401236"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="340401236"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 23:08:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="770494939"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="770494939"
Received: from gpshihat-mobl.amr.corp.intel.com (HELO
 dwillia2-xfh.jf.intel.com) ([10.209.93.231])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 23:08:31 -0700
Subject: [PATCH] hw/acpi/cxl: Drop device-memory support from CFMWS entries
From: Dan Williams <dan.j.williams@intel.com>
To: Jonathan.Cameron@huawei.com
Cc: qemu-devel@nongnu.org, linux-cxl@vger.kernel.org
Date: Mon, 20 Mar 2023 23:08:31 -0700
Message-ID: <167937891122.1510933.11055956062467467440.stgit@dwillia2-xfh.jf.intel.com>
User-Agent: StGit/0.18-3-g996c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.24;
 envelope-from=dan.j.williams@intel.com; helo=mga09.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

While it was a reasonable idea to specify no window restricitions at the
outset of the CXL emulation support, it turns out that in practice a
platform will never follow the QEMU example of specifying simultaneous
support for HDM-H and HDM-D[B] in a single window.

HDM-D mandates extra bus cycles for host/device bias protocol, and HDM-DB
mandates extra bus cycles for back-invalidate protocol, so hardware must
be explicitly prepared for device-memory unlike host-only memory
(HDM-H).

In preparation for the kernel dropping support for windows that do not
select between device and host-only memory, move QEMU exclusively to
declaring host-only windows.

Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 hw/acpi/cxl.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/cxl.c b/hw/acpi/cxl.c
index 2bf8c0799359..defb289e2fef 100644
--- a/hw/acpi/cxl.c
+++ b/hw/acpi/cxl.c
@@ -103,8 +103,8 @@ static void cedt_build_cfmws(GArray *table_data, CXLState *cxls)
         /* Host Bridge Interleave Granularity */
         build_append_int_noprefix(table_data, fw->enc_int_gran, 4);
 
-        /* Window Restrictions */
-        build_append_int_noprefix(table_data, 0x0f, 2); /* No restrictions */
+        /* Window Restrictions: Host-only ram and pmem */
+        build_append_int_noprefix(table_data, 0x0e, 2);
 
         /* QTG ID */
         build_append_int_noprefix(table_data, 0, 2);


