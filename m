Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA9A3BF384
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 03:22:40 +0200 (CEST)
Received: from localhost ([::1]:38124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1IkR-0000ib-Sd
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 21:22:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1ILO-00033s-TI
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:46 -0400
Received: from mga06.intel.com ([134.134.136.31]:36379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1ILN-0007L4-8l
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:46 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="270534909"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="270534909"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:57 -0700
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="423770069"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:57 -0700
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com, erdemaktas@google.com
Subject: [RFC PATCH v2 25/44] q35: Move PCIe BAR check above PAM check in
 mch_write_config()
Date: Wed,  7 Jul 2021 17:54:55 -0700
Message-Id: <caa101c6aead2deddb67e52dd5a7d22670ca774c.1625704981.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625704980.git.isaku.yamahata@intel.com>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=isaku.yamahata@intel.com; helo=mga06.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NML_ADSP_CUSTOM_MED=0.9,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: isaku.yamahata@intel.com,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 isaku.yamahata@gmail.com, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

Process PCIe BAR before PAM so that a future patch can skip all the SMM
related crud with a single check-and-return.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 hw/pci-host/q35.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 2eb729dff5..9a2be237d7 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -468,16 +468,16 @@ static void mch_write_config(PCIDevice *d,
 
     pci_default_write_config(d, address, val, len);
 
-    if (ranges_overlap(address, len, MCH_HOST_BRIDGE_PAM0,
-                       MCH_HOST_BRIDGE_PAM_SIZE)) {
-        mch_update_pam(mch);
-    }
-
     if (ranges_overlap(address, len, MCH_HOST_BRIDGE_PCIEXBAR,
                        MCH_HOST_BRIDGE_PCIEXBAR_SIZE)) {
         mch_update_pciexbar(mch);
     }
 
+    if (ranges_overlap(address, len, MCH_HOST_BRIDGE_PAM0,
+                       MCH_HOST_BRIDGE_PAM_SIZE)) {
+        mch_update_pam(mch);
+    }
+
     if (ranges_overlap(address, len, MCH_HOST_BRIDGE_SMRAM,
                        MCH_HOST_BRIDGE_SMRAM_SIZE)) {
         mch_update_smram(mch);
-- 
2.25.1


