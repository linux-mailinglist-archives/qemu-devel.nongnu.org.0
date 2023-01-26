Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6A667C458
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 06:38:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKuxC-0003v7-PM; Thu, 26 Jan 2023 00:37:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1pKuxA-0003um-VN
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 00:37:41 -0500
Received: from mga18.intel.com ([134.134.136.126])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1pKux8-00066H-6n
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 00:37:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674711458; x=1706247458;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=3pLT6cnZImwRDptO85gOUw4tEX3x33aoYAisv7ppXro=;
 b=VlpDD7eMsMGLqM4jR49RwivSW/E+Bvk54RRl3cTS+L4yzgSRfwjDmw9R
 TYzM9qcq/HkWbwzVqvg1C3cOpKcXBSOkhmi3tMg1Skc2ftcG/gbEIlN8z
 mA03AQN4ZOC53FLqCmOJs8YE6H9rG46+6kkK4Bq+GoiqfB3GPiMh6eKa5
 RWcKUneOLmR3SPeMC03Ew4JxWeUExD2cPg2IgEmApveXbFN42TjaEvWmm
 O7gQwC3W/8sBRJ5ntnrtfhaaHl8TubkmRxbmIDAT8ACjDybbzfgQFejYQ
 YQ1WlnjKV9SWy2FC3Z1f0tN2xuiexHflKI4ytbU5cAQAJxXRBsOcndhu0 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="310328959"
X-IronPort-AV: E=Sophos;i="5.97,247,1669104000"; d="scan'208";a="310328959"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 21:37:30 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="786704001"
X-IronPort-AV: E=Sophos;i="5.97,247,1669104000"; d="scan'208";a="786704001"
Received: from iweiny-mobl.amr.corp.intel.com (HELO localhost)
 ([10.212.115.122])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 21:37:29 -0800
From: Ira Weiny <ira.weiny@intel.com>
Subject: [PATCH 0/2] hw/cxl: CXL Event processing fixups
Date: Wed, 25 Jan 2023 21:37:27 -0800
Message-Id: <20230125-ira-cxl-events-fixups-2023-01-11-v1-0-1931378515f5@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJcR0mMC/x2NSwrDMAxErxK0rsAfTNpepXThOEojMGqwmhAIu
 XvVLt8M8+YApcakcO8OaLSx8lsM/KWDMmd5EfJoDMGF6HxIyC1j2SvSRvJRnHhfF8Vfjc6j9xhj
 f0uRrv2URjDNkJVwaFnKbCJZa7VwaWTL/+/jeZ5fVn/dGYcAAAA=
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Michael Tsirkin <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>
X-Mailer: b4 0.12-dev-cc11a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674711449; l=1246;
 i=ira.weiny@intel.com; s=20221211; h=from:subject:message-id;
 bh=3pLT6cnZImwRDptO85gOUw4tEX3x33aoYAisv7ppXro=;
 b=mGx9oQox9Po489OmHsWlMI6Vj8QO8GxdVuOZeG6l6wwpdyg9mRifirA7QcpuNINevLucah1epm1d
 OKPO0TTiDoi3y2eEK5Xho+SFy8prh78TQ8GX7rkvz70Zhgw6/aKU
X-Developer-Key: i=ira.weiny@intel.com; a=ed25519;
 pk=noldbkG+Wp1qXRrrkfY1QJpDf7QsOEthbOT7vm0PqsE=
Received-SPF: pass client-ip=134.134.136.126; envelope-from=ira.weiny@intel.com;
 helo=mga18.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

During review of the CXL Event processing series[1] these minor fixes were caught
but I did not have time to respin before Jonathan picked them up.

Make the fixes now.

These are based on Jonathan's latest branch:

        https://gitlab.com/jic23/qemu/-/tree/cxl-2023-01-20

[1] https://lore.kernel.org/all/20221221-ira-cxl-events-2022-11-17-v2-0-2ce2ecc06219@intel.com/

To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Michael Tsirkin <mst@redhat.com>
Cc: Ben Widawsky <bwidawsk@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: <qemu-devel@nongnu.org>
Cc: <linux-cxl@vger.kernel.org>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>

---
Ira Weiny (2):
      hw/cxl: Fix event log time stamp fields
      hw/cxl: Remove check for g_new0() failure

 hw/cxl/cxl-device-utils.c   | 15 +++++++++++++++
 hw/cxl/cxl-events.c         | 10 +++-------
 hw/cxl/cxl-mailbox-utils.c  | 11 +----------
 hw/mem/cxl_type3.c          |  1 -
 include/hw/cxl/cxl_device.h |  2 ++
 5 files changed, 21 insertions(+), 18 deletions(-)
---
base-commit: bb3f9b2853f9723c11a38c6b7bca7368677f2b43
change-id: 20230125-ira-cxl-events-fixups-2023-01-11-337953e87f5d

Best regards,
-- 
Ira Weiny <ira.weiny@intel.com>

