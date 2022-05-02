Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A85E7516DAC
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 11:47:33 +0200 (CEST)
Received: from localhost ([::1]:54528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlSeS-00026F-I6
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 05:47:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1nlSZb-0007hs-U7
 for qemu-devel@nongnu.org; Mon, 02 May 2022 05:42:31 -0400
Received: from mga05.intel.com ([192.55.52.43]:48091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1nlSZZ-0007nw-Dt
 for qemu-devel@nongnu.org; Mon, 02 May 2022 05:42:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651484549; x=1683020549;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cNN+9mRfvpoMTVq8KKsRsnG0XEFIXnZx7cuYtA2TLJ4=;
 b=AkEVUDr+F/iyfaOPV/JeBVnO85hzYz9XvjwuaV7MNE54SZy5GzbakSEA
 610QHRG5HOIq6Ms8v9s+v7S1I0omID6O68AGst/hwSzefIWtKWXKGsXKu
 tov1Aa6/ikq+ys6pWbfOfxyTbCAgrN15n+bZsavkOLeoUuJloKOQUNUHD
 L0RlYEAdwaER9UpbZRL0eV71W8CqSCzjlimv+94/ZtwPjp+Qm7+Avc8R1
 cUY+ZLp8ipUFpmp8JGy+TO85LTv+qLGq0LrLJcrl9Cue7xHxlNRH26LyW
 YfCyS4dkwYFmEzGG9m/RzuHB3hoNQz2smbc1ED/JolaP22whWbKrFV4IG A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="353597173"
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; d="scan'208";a="353597173"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 02:42:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; d="scan'208";a="561649596"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga007.jf.intel.com with ESMTP; 02 May 2022 02:42:23 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	qemu-devel@nongnu.org
Subject: [Patch 1/3] hw/vfio/pci: fix vfio_pci_hot_reset_result trace point
Date: Mon,  2 May 2022 02:42:21 -0700
Message-Id: <20220502094223.36384-2-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220502094223.36384-1-yi.l.liu@intel.com>
References: <20220502094223.36384-1-yi.l.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=yi.l.liu@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eric.auger@redhat.com, kevin.tian@intel.com, yi.l.liu@intel.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

Properly output the errno string.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 hw/vfio/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 9fd9faee1d..4a66376be6 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2337,7 +2337,7 @@ static int vfio_pci_hot_reset(VFIOPCIDevice *vdev, bool single)
     g_free(reset);
 
     trace_vfio_pci_hot_reset_result(vdev->vbasedev.name,
-                                    ret ? "%m" : "Success");
+                                    ret ? strerror(errno) : "Success");
 
 out:
     /* Re-enable INTx on affected devices */
-- 
2.27.0


