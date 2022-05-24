Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 414B0532377
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 08:48:57 +0200 (CEST)
Received: from localhost ([::1]:37820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntOLg-0004Sf-By
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 02:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ntNtZ-0008WA-3w
 for qemu-devel@nongnu.org; Tue, 24 May 2022 02:19:53 -0400
Received: from mga17.intel.com ([192.55.52.151]:42013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ntNtW-0000MN-1L
 for qemu-devel@nongnu.org; Tue, 24 May 2022 02:19:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653373190; x=1684909190;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LeOqX7h2dQ6e5+PbZ6OqSdcvsKT7TR0ojCs3G20PDkk=;
 b=Lf5E59ej40ia2bF8WFafXbakvVtoHZ0z4/9g7J+vCEPSdWv8MkGFa7Ac
 pmS1YCIQlV55C077uT7CSvjkxt77DZ6WEFqwcvCbqhbk/nJpyuvFJw4Kk
 0BrdvF0bytI75XhqdybuIE+ONs5GD4VafV8vXUXVle27gS0DkkzFWk//W
 Mk0SWun0I6FSBtLIwccRXAfTfypFtxvAiPbTy/Zd7ixuYFF/n8wPudMmc
 VO84ZLXal2LvVJoPrOaxYo4ud65Zw3+KMP1kUsu9QBOEmsjeKNC9lt3pm
 NHTGgnIBBN/HM1nS0n3WoWKVf1Yqyj0P8Jom2ucL41E4XOAD94NAFUp8p w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="253943269"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="253943269"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 23:19:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="601059869"
Received: from leirao-pc.bj.intel.com ([10.238.156.102])
 by orsmga008.jf.intel.com with ESMTP; 23 May 2022 23:19:41 -0700
From: Lei Rao <lei.rao@intel.com>
To: alex.williamson@redhat.com, kevin.tian@intel.com, eddie.dong@intel.com,
 jason.zeng@intel.com, quintela@redhat.com, dgilbert@redhat.com,
 yadong.li@intel.com, yi.l.liu@intel.com
Cc: qemu-devel@nongnu.org,
	Lei Rao <lei.rao@intel.com>
Subject: [RFC PATCH 10/13] vfio/pci: introduce command-line parameters to
 specify migration method
Date: Tue, 24 May 2022 14:18:45 +0800
Message-Id: <20220524061848.1615706-11-lei.rao@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220524061848.1615706-1-lei.rao@intel.com>
References: <20220524061848.1615706-1-lei.rao@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=lei.rao@intel.com;
 helo=mga17.intel.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add command-line parameters (x-plugin-path and x-plugin-arg) of migration plugin
for VFIO PCI functions. x-plugin-path indicates the path of a dynamic load
library and x-plugin-arg is the necessary parameter to load and use it.
A typical example is, if the plugin communicates with the agent running on
IPU/DPU backend SOC through network, the argument should be the IP and Port of
agent. The usage as follows:

-device vfio-pci,id=$ID,host=$bdf,x-enable-migration,\
x-plugin-path=$plugin_path,x-plugin-arg=<IP:Port>

Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Eddie Dong <eddie.dong@intel.com>
---
 hw/vfio/pci.c                 | 2 ++
 include/hw/vfio/vfio-common.h | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 939dcc3d4a..1553ba7116 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3309,6 +3309,8 @@ static Property vfio_pci_dev_properties[] = {
                                    qdev_prop_nv_gpudirect_clique, uint8_t),
     DEFINE_PROP_OFF_AUTO_PCIBAR("x-msix-relocation", VFIOPCIDevice, msix_relo,
                                 OFF_AUTOPCIBAR_OFF),
+    DEFINE_PROP_STRING("x-plugin-path", VFIOPCIDevice, vbasedev.desc.path),
+    DEFINE_PROP_STRING("x-plugin-arg", VFIOPCIDevice, vbasedev.desc.arg),
     /*
      * TODO - support passed fds... is this necessary?
      * DEFINE_PROP_STRING("vfiofd", VFIOPCIDevice, vfiofd_name),
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index be8adf890f..45d6d75284 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -58,6 +58,11 @@ typedef struct VFIORegion {
     uint8_t nr; /* cache the region number for debug */
 } VFIORegion;
 
+struct vfio_migration_plugin_desc {
+    char *path;
+    char *arg;
+};
+
 typedef struct VFIOMigrationOps VFIOMigrationOps;
 
 typedef struct VFIOMigration {
@@ -144,6 +149,7 @@ typedef struct VFIODevice {
     unsigned int num_regions;
     unsigned int flags;
     VFIOMigration *migration;
+    struct vfio_migration_plugin_desc desc;
     Error *migration_blocker;
     OnOffAuto pre_copy_dirty_page_tracking;
 } VFIODevice;
-- 
2.32.0


