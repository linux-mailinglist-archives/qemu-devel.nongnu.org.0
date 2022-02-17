Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA414BA7A0
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 19:01:47 +0100 (CET)
Received: from localhost ([::1]:50996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKl6A-000890-Ma
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 13:01:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nKksB-0001vR-FX; Thu, 17 Feb 2022 12:47:19 -0500
Received: from mga12.intel.com ([192.55.52.136]:31716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nKks9-0007He-In; Thu, 17 Feb 2022 12:47:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645120037; x=1676656037;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=thPEL9rW2E/LFV6vWF7fjgL11HbHmZjaZmNLwbLfV9Y=;
 b=oChLe7IYRaivvtOZbdRBu07wpX3LdN4mDb6bgG7lxJhI5MY0PCU8PS2T
 GBr31augx9O7rt0Lv1jRdjwsHSkukhCff9y3qmRKO9PyiU6iFSHLzN4Qa
 sO9BgSfmv8QPpgWEbFDDh2G0k5CJGOUzmtziDZR0x5my1kqMx3G0GMIr4
 J2Ec8GgW6URAmfKo51avxeMe1HY4qepaAY3TK5TWxIP3JW1iKNGmSrNSW
 /Z0yb7CU3gIrH4VxduZv05ZcOtTJsMxHvSEjn2MZ+bEqQOuYhb91PKVL0
 CrUyKAyKvOR9Fuf6hgu7slw1kjR2f6udNtKri2RofSOC6rPDQNM3F7qYn w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="230894057"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="230894057"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 09:46:55 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="545746052"
Received: from lmaniak-dev.igk.intel.com ([10.55.249.72])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 09:46:53 -0800
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/15] pcie: Add 1.2 version token for the Power Management
 Capability
Date: Thu, 17 Feb 2022 18:44:53 +0100
Message-Id: <20220217174504.1051716-5-lukasz.maniak@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217174504.1051716-1-lukasz.maniak@linux.intel.com>
References: <20220217174504.1051716-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
index 77ba64b9314..a5901409622 100644
--- a/include/hw/pci/pci_regs.h
+++ b/include/hw/pci/pci_regs.h
@@ -4,5 +4,6 @@
 #include "standard-headers/linux/pci_regs.h"
 
 #define  PCI_PM_CAP_VER_1_1     0x0002  /* PCI PM spec ver. 1.1 */
+#define  PCI_PM_CAP_VER_1_2     0x0003  /* PCI PM spec ver. 1.2 */
 
 #endif
-- 
2.25.1


