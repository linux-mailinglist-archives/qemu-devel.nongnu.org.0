Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DAD54C076
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 05:55:32 +0200 (CEST)
Received: from localhost ([::1]:49726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1K7v-0002x3-1g
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 23:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1o1K4d-0002Ff-8a
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 23:52:07 -0400
Received: from mga09.intel.com ([134.134.136.24]:55414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1o1K4Z-0001xg-C3
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 23:52:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655265123; x=1686801123;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FspUsQIrx6b0MyOb0TO3s5vfVl71UDr4jFWg9dAe8Yw=;
 b=V4AkTR/pDeEBAdnq/lUf/Qlx/QkgTWPbnNNvEWcLcBRw0WbD08LQbpj8
 yDLPNvPL/lwnnCzDSDoxJq1wL0gF7KA65i+iSqY+0oLl/VRy4njd4rNWl
 tlQ5fS9Sbx1KCni4mBANGPX9jAUDsOhZAQQ92ZH5oWp07eeiq7jdAnApZ
 b7y1oM6k7r+m/wOBnm65Ps+ElqnoPeB+43yrpjQzXfA6KwOGgzRWOlfMp
 okIHkvSmPxCUiSi5IGRH+8TjgcZVi8rHjaC9EZeFg/S3n5KmtzGgJl0BP
 6Pwm3dgWdlyyu9ex9FsQraYb3lKuOYnIP8PEuxg0MuIF2yCoQcQc6qE+c w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="279542037"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="279542037"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 20:51:55 -0700
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="640757100"
Received: from duan-server-s2600bt.bj.intel.com ([10.240.192.123])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 20:51:53 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, lersek@redhat.com,
 imammedo@redhat.com, kraxel@redhat.com
Subject: [PATCH] =?UTF-8?q?q35=EF=BC=9AEnable=20TSEG=20only=20when=20G=5FS?=
 =?UTF-8?q?MRAME=20and=20TSEG=5FEN=20both=20enabled?=
Date: Wed, 15 Jun 2022 11:45:01 +0800
Message-Id: <20220615034501.2733802-1-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.24;
 envelope-from=zhenzhong.duan@intel.com; helo=mga09.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

According to spec:
"TSEG Enable (T_EN): Enabling of SMRAM memory for Extended SMRAM space
only. When G_SMRAME = 1 and TSEG_EN = 1, the TSEG is enabled to appear
in the appropriate physical address space. Note that once D_LCK is set,
this bit becomes read only."

Changed to match the spec description.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 hw/pci-host/q35.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index ab5a47aff560..20da1213747c 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -379,7 +379,8 @@ static void mch_update_smram(MCHPCIState *mch)
         memory_region_set_enabled(&mch->high_smram, false);
     }
 
-    if (pd->config[MCH_HOST_BRIDGE_ESMRAMC] & MCH_HOST_BRIDGE_ESMRAMC_T_EN) {
+    if ((pd->config[MCH_HOST_BRIDGE_ESMRAMC] & MCH_HOST_BRIDGE_ESMRAMC_T_EN) &&
+        (pd->config[MCH_HOST_BRIDGE_SMRAM] & SMRAM_G_SMRAME)) {
         switch (pd->config[MCH_HOST_BRIDGE_ESMRAMC] &
                 MCH_HOST_BRIDGE_ESMRAMC_TSEG_SZ_MASK) {
         case MCH_HOST_BRIDGE_ESMRAMC_TSEG_SZ_1MB:
-- 
2.25.1


