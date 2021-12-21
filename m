Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7F247C1A8
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 15:39:05 +0100 (CET)
Received: from localhost ([::1]:38602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzgIC-0000q0-HF
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 09:39:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mzgE2-0000Jz-S3; Tue, 21 Dec 2021 09:34:46 -0500
Received: from mga17.intel.com ([192.55.52.151]:6387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mzgE1-0002Pf-8w; Tue, 21 Dec 2021 09:34:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640097285; x=1671633285;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OoGnbQJiyNi6BXKyueOCYC/2yOQs/i579OZsEcS/5gM=;
 b=AVpT1n+7YzDhTMCBl0M5EcJlbazGoKKJirRIgjVEiRm5hHYM7g6rNLNd
 d+7S4iBhosz07Fpumud0NPLJHcJbPgLLIB05TWwsyOr5pUJoF5NnbBXBg
 41tyHRUtqHHGqacQpju15A7sqJL3lMhxCh2rXx3vc0wM+/UARhCCdLrxS
 aAvv/WrSdihjhTlCaAE0AeOCwFlOKEPyXTW+/QpeGFRkzM5YKP5IxZKO+
 wTIqsUN6Lw8jNavTUCM4S6J/0rLbPrwG1cGV3RTjP81dZ5IJGYCgf0Oj9
 r87nf+lU1q1Ll3uIJaMXNggdDMNBQ7LF/gJCUryr15VgrcBxJ4sepDg6v g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="221079246"
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="221079246"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 06:34:41 -0800
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="484429238"
Received: from lmaniak-dev.igk.intel.com ([10.55.249.72])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 06:34:38 -0800
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/15] pcie: Add 1.2 version token for the Power Management
 Capability
Date: Tue, 21 Dec 2021 15:32:35 +0100
Message-Id: <20211221143246.2052050-5-lukasz.maniak@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221143246.2052050-1-lukasz.maniak@linux.intel.com>
References: <20211221143246.2052050-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga17.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
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


