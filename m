Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4760E53230B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 08:23:32 +0200 (CEST)
Received: from localhost ([::1]:39936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntNx4-0001wA-Rt
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 02:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ntNsy-0007j5-LR
 for qemu-devel@nongnu.org; Tue, 24 May 2022 02:19:16 -0400
Received: from mga17.intel.com ([192.55.52.151]:41945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ntNsr-0000EA-4K
 for qemu-devel@nongnu.org; Tue, 24 May 2022 02:19:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653373149; x=1684909149;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=05nkXmjDWjVDIsuhPNnXULjBc/R+6HEy5I2WA06OJ0s=;
 b=Q5tKA8rxwpf13ueRnORbKqroFRVmhoBAFUs/dI4h2KUxjAnz3LoHItiM
 +z+/PL7SB5C0w2mC+G+1s7cPi6EfVsGp+OLEEoOUYZtOQqGfwxeS6MiKE
 duMTVVIHkI0emIB9nuIECd6/mNfm6nLzVL5M0BOmHVZN3wVYCiXn5p85f
 DrzkbmAyUsrv5KWhVbUSh3g9YWY9a02S4HzSiCJ4wr1acyisPG3NaMavG
 9BsvTdkMLZ23Sfs0h1MVzLfdRxQ7ohYR9jfuuEmt+TJ0tgnHkIkVRARXb
 vzwyBypqstnUntNoY9OtjN/J/uFTdqsp2OZLz7MGpwamz5Nw1YFtNzctb Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="253943131"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="253943131"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 23:19:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="601059563"
Received: from leirao-pc.bj.intel.com ([10.238.156.102])
 by orsmga008.jf.intel.com with ESMTP; 23 May 2022 23:18:58 -0700
From: Lei Rao <lei.rao@intel.com>
To: alex.williamson@redhat.com, kevin.tian@intel.com, eddie.dong@intel.com,
 jason.zeng@intel.com, quintela@redhat.com, dgilbert@redhat.com,
 yadong.li@intel.com, yi.l.liu@intel.com
Cc: qemu-devel@nongnu.org,
	Lei Rao <lei.rao@intel.com>
Subject: [RFC PATCH 00/13] Add a plugin to support out-of-band live migration
 for VFIO pass-through device
Date: Tue, 24 May 2022 14:18:35 +0800
Message-Id: <20220524061848.1615706-1-lei.rao@intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=lei.rao@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Migration of a VFIO passthrough device can be supported by using a device 
specific kernel driver to save/restore the device state thru device specific 
interfaces. But this approach doesn't work for devices that lack a state 
migration interface, e.g. NVMe.

On the other hand, Infrastructure Process Unit (IPU) or Data Processing Unit 
(DPU) vendors may choose to implement an out-of-band interface from the SoC to 
help manage the state of such non-migratable devices e.g. via gRPC or JSON-RPC 
protocols.

This RFC attempts to support such out-of-band migration interface by introducing
the concept of migration backends in vfio. The existing logic around vfio 
migration uAPI is now called the 'local' backend while a new 'out-of-band' 
backend is further introduced allowing vfio to redirect VMState ops to an 
external plugin.

Currently, the backend migration Ops is defined close to SaveVMHandlers. We also
considered whether there is value of abstracting it in a lower level e.g. close 
to vfio migration uAPI but no clear conclusion. Hence this is one part which 
we'd like to hear suggestions.

This proposal adopts a plugin mechanism (an example can be found in [1]) given 
that IPU/DPU vendors usually implement proprietary migration interfaces without
a standard. But we are also open if an alternative option makes better sense,
e.g. via loadable modules (with Qemu supporting gRPC or JSON-RPC support) or an
IPC mechanism similar to vhost-user.

The following graph describes the overall component relationship:

 +----------------------------------------------------+
 | QEMU                                               |
 | +------------------------------------------------+ |
 | |        VFIO Live Migration Framework           | |
 | |    +--------------------------------------+    | |
 | |    |         VFIOMigrationOps             |    | |
 | |    +-------^---------------------^--------+    | |
 | |            |                     |             | |
 | |    +-------v-------+     +-------v--------+    | |
 | |    | LM Backend Via|     | LM Backend Via |    | |
 | |    |   Device Fd   |     |    Plugins     |    | |
 | |    +-------^-------+     |     +----------+    | |
 | |            |             |     |Plugin Ops+----+-+------------+
 | |            |             +-----+----------+    | |            |
 | |            |                                   | |  +---------v----------+
 | +------------+-----------------------------------+ |  |  Vendor Specific   |
 |              |                                     |  |    Plugins(.so)    |
 +--------------+-------------------------------------+  +----------+---------+
  UserSpace     |                                                   |
----------------+---------------------------------------------      |
  Kernel        |                                                   |
                |                                                   |
     +----------v----------------------+                            |
     |        Kernel VFIO Driver       |                            |
     |    +-------------------------+  |                            |
     |    |                         |  |                            | Network
     |    | Vendor-Specific Driver  |  |                            |
     |    |                         |  |                            |
     |    +----------^--------------+  |                            |
     |               |                 |                            |
     +---------------+-----------------+                            |
                     |                                              |
                     |                                              |
---------------------+-----------------------------------------     |
  Hardware           |                                              |
                     |            +-----+-----+-----+----+-----+    |
          +----------v------+     | VF0 | VF1 | VF2 | ...| VFn |    |
          |   Traditional   |     +-----+-----+-----+----+-----+    |
          |  PCIe Devices   |     |                            |    |
          +-----------------+     |   +--------+------------+  |    |
                                  |   |        |   Agent    |<-+----+
                                  |   |        +------------+  |
                                  |   |                     |  |
                                  |   | SOC                 |  |
                                  |   +---------------------+  |
                                  | IPU                        |
                                  +----------------------------+

Two command-line parameters (x-plugin-path and x-plugin-arg) are introduced to 
enable the out-of-band backend. If specified, vfio will attempt to use the 
out-of-band backend.

The following is an example of VFIO command-line parameters for OOB-Approach:

  -device vfio-pci,id=$ID,host=$bdf,x-enable-migration,x-plugin-path=$plugin_path,x-plugin-arg=$plugin_arg

[1] https://github.com/raolei-intel/vfio-lm-plugin-example.git

Lei Rao (13):
  vfio/migration: put together checks of migration initialization
    conditions
  vfio/migration: move migration struct allocation out of
    vfio_migration_init
  vfio/migration: move vfio_get_dev_region_info out of
    vfio_migration_probe
  vfio/migration: Separated functions that relate to the In-Band
    approach
  vfio/migration: rename functions that relate to the In-Band approach
  vfio/migration: introduce VFIOMigrationOps layer in VFIO live
    migration framework
  vfio/migration: move the statistics of bytes_transferred to generic
    VFIO migration layer
  vfio/migration: split migration handler registering from
    vfio_migration_init
  vfio/migration: move the functions of In-Band approach to a new file
  vfio/pci: introduce command-line parameters to specify migration
    method
  vfio/migration: add a plugin layer to support out-of-band live
    migration
  vfio/migration: add some trace-events for vfio migration plugin
  vfio/migration: make the region and plugin member of struct
    VFIOMigration to be a union

 docs/devel/vfio-migration-plugin.rst    | 165 +++++++
 hw/vfio/meson.build                     |   2 +
 hw/vfio/migration-local.c               | 456 +++++++++++++++++++
 hw/vfio/migration-plugin.c              | 266 +++++++++++
 hw/vfio/migration.c                     | 577 ++++++------------------
 hw/vfio/pci.c                           |   2 +
 hw/vfio/trace-events                    |   9 +-
 include/hw/vfio/vfio-common.h           |  37 +-
 include/hw/vfio/vfio-migration-plugin.h |  21 +
 9 files changed, 1096 insertions(+), 439 deletions(-)
 create mode 100644 docs/devel/vfio-migration-plugin.rst
 create mode 100644 hw/vfio/migration-local.c
 create mode 100644 hw/vfio/migration-plugin.c
 create mode 100644 include/hw/vfio/vfio-migration-plugin.h

-- 
2.32.0


