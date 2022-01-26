Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 468E349D0E4
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 18:37:35 +0100 (CET)
Received: from localhost ([::1]:59500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCmEg-0001Q1-7v
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 12:37:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nClsf-0006TW-OO; Wed, 26 Jan 2022 12:14:52 -0500
Received: from mga11.intel.com ([192.55.52.93]:54197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nClsd-0001ek-7r; Wed, 26 Jan 2022 12:14:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643217287; x=1674753287;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OoGnbQJiyNi6BXKyueOCYC/2yOQs/i579OZsEcS/5gM=;
 b=AlPqF7SpUu9V+7Z4lL2tkJSrrpigypz+NOnVH7QVEoV+dHMpIut2C+fD
 Gh9uq625H4ZJTbXZe7+DhrQnpU0fRXLz9vx6Zez3pGn3M9pgNlJCIhqtI
 9JA8iLYTCb8TEX1Xwn7tvBSeC2J9yvByEAPTas3weKwkgMXjWk1+MbKAV
 afkz4OGuE5UmK+A4+xaX0J3c0A7OS+h0sADi65JcAMnFx2s8LItF3BsYd
 WyoDb3Dtxg1ezgsKw3bWJUGzvo1rg8i3Dt2XnEcsbGxZbfOFD4rvmmYXy
 tmp+wpgFbWbMdpmecepuUlxlRYf67HC3f6w6h2FslUzPAiwTXT3RhGqxg A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="244199247"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="244199247"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 09:13:08 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="535254174"
Received: from lmaniak-dev.igk.intel.com ([10.55.249.72])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 09:13:04 -0800
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/15] pcie: Add 1.2 version token for the Power Management
 Capability
Date: Wed, 26 Jan 2022 18:11:09 +0100
Message-Id: <20220126171120.2939152-5-lukasz.maniak@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220126171120.2939152-1-lukasz.maniak@linux.intel.com>
References: <20220126171120.2939152-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga11.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>

Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
---
 include/hw/pci/pci_regs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/pci/pci_regs.h b/include/hw/pci/pci_regs.h
index 77ba64b931..a590140962 100644
--- a/include/hw/pci/pci_regs.h
+++ b/include/hw/pci/pci_regs.h
@@ -4,5 +4,6 @@
 #include "standard-headers/linux/pci_regs.h"
 
 #define  PCI_PM_CAP_VER_1_1     0x0002  /* PCI PM spec ver. 1.1 */
+#define  PCI_PM_CAP_VER_1_2     0x0003  /* PCI PM spec ver. 1.2 */
 
 #endif
-- 
2.25.1


