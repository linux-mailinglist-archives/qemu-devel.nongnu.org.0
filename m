Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 148382D354B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:34:55 +0100 (CET)
Received: from localhost ([::1]:34678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmkdK-0001JF-3c
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:34:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=604abd949=dmitry.fomichev@wdc.com>)
 id 1kmjDr-0002I0-RM; Tue, 08 Dec 2020 15:04:31 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:42896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=604abd949=dmitry.fomichev@wdc.com>)
 id 1kmjDn-000629-Ok; Tue, 08 Dec 2020 15:04:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607458837; x=1638994837;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QLRWE/uYF5Bv3tfdUUil+uRcZWEq9fSULmYhGcz7SoI=;
 b=V/tWJHqRa4/VhgUht3DJa4veOqaZfZgOKyDzz47Ma9DuAfWTJ87R3YDz
 VM/AttZh3Fhu4/oI7C17ZLCiG8Z9EmNzwEh5a3PKCeC1u4YrRO6CnxynM
 wOy34fbA6Z5cZG83FTP4dk5xggJAAkTHom1sD3+VI1oIesmzlTY0de/p5
 mYpnl48wrAvJmF+UiqOGobv7PNaR6OjAjDf6oLaCI0bnT8R/sPFRGMRyf
 yBFSCfqI/DPhgWbN8CM92QqziAYL8D4IvCUi2XYzxSzFrARPMOUCmEHJ8
 gBCjvgYnuop4tYn+ou/SqdTdu0mmHNHcPEWmDDBAu/vnLdVfFYlGU04pI A==;
IronPort-SDR: tYc7iJorAQldFZpkjVp+gSOWQAQTxSZd5lmCuI2giBs29R8bKeeu/hdoEyNHB3Mr88upq43FfD
 OLVcEwhjckxaeFGomJTHZAEwCFCpg1pHwctxVOUbQGUnvEpUvRRhGdXp1cVhsLoC2y5VjcyHcL
 VuoqJyx+6iEqjXsboTEeYfa5teUxqC/oqI+6aMDMvmuof9wiT9rG3x0Au2ErFBiGK0Af5v8Sqp
 s7W+vtIFnB1E33b0AKlQfd29Wnq09tbOstQPyMR27CVHP1snYX+aR9cy+7OysebZTGOKVJVoJr
 yno=
X-IronPort-AV: E=Sophos;i="5.78,403,1599494400"; d="scan'208";a="258433440"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 04:20:15 +0800
IronPort-SDR: EARwPvv3Z1Py6deHD8NabyfnskBXWdVxb1YFEjg5Do64eCkX1RytwvY/OCxTRMUiyh+DXEHNKQ
 Vvu/TZttn1meqHUcJvFRH+ti35Vf8Mwsw=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 11:48:13 -0800
IronPort-SDR: N5RfqZTOrADr17wx16DlJbuymijO8jMxfTmcBf/ah6zuF8at8B3jDJIAYyyrEanpuFbjojh6F1
 ac/6Z6UqSzKw==
WDCIronportException: Internal
Received: from unknown (HELO redsun50.ssa.fujisawa.hgst.com) ([10.149.66.24])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Dec 2020 12:04:12 -0800
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Fam Zheng <fam@euphon.net>
Subject: [PATCH v11 00/13] hw/block/nvme: Support Namespace Types and Zoned
 Namespace Command Set
Date: Wed,  9 Dec 2020 05:03:57 +0900
Message-Id: <20201208200410.27900-1-dmitry.fomichev@wdc.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=604abd949=dmitry.fomichev@wdc.com; helo=esa2.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, qemu-block@nongnu.org,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Matias Bjorling <matias.bjorling@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v10 -> v11:

 - Address review comments by Klaus.

 - Add a patch to separate the handling of controller reset
   and subsystem shutdown. Place the patch at the beginning
   of the series so it can be picked up separately.

 - Rebase on the current nvme-next branch.

v9 -> v10:

 - Correctly check for MDTS in Zone Management Receive handler.

 - Change Klaus' "Reviewed-by" email in UUID patch.

v8 -> v9:

 - Move the modifications to "include/block/nvme.h" made to
   introduce ZNS-related definitions to a separate patch.

 - Add a new struct, NvmeZonedResult, along the same lines as the
   existing NvmeAerResult, to carry Zone Append LBA returned to
   the host. Now, there is no need to modify NvmeCqe struct except
   renaming DW1 field from "rsvd" to "dw1".

 - Add check for MDTS in Zone Management Receive handler.

 - Remove checks for ns->attached since the value of this flag
   is always true for now.

 - Rebase to the current quemu-nvme/nvme-next branch.

v7 -> v8:

 - Move refactoring commits to the front of the series.

 - Remove "attached" and "fill_pattern" device properties.

 - Only close open zones upon subsystem shutdown, not when CC.EN flag
   is set to 0. Avoid looping through all zones by iterating through
   lists of open and closed zones.

 - Improve bulk processing of zones aka zoned operations with "all"
   flag set. Avoid looping through the entire zone array for all zone
   operations except Offline Zone.

 - Prefix ZNS-related property names with "zoned.". The "zoned" Boolean
   property is retained to turn on zoned command set as it is much more
   intuitive and user-friendly compared to setting a magic number value
   to csi property.

 - Address review comments.

 - Remove unused trace events.

v6 -> v7:

 - Introduce ns->iocs initialization function earlier in the series,
   in CSE Log patch.

 - Set NVM iocs for zoned namespaces when CC.CSS is set to
   NVME_CC_CSS_NVM.

 - Clean up code in CSE log handler.
 
v5 -> v6:

 - Remove zoned state persistence code. Replace position-independent
   zone lists with QTAILQs.

 - Close all open zones upon clearing of the controller. This is
   a similar procedure to the one previously performed upon powering
   up with zone persistence. 

 - Squash NS Types and ZNS triplets of commits to keep definitions
   and trace event definitions together with the implementation code.

 - Move namespace UUID generation to a separate patch. Add the new
   "uuid" property as suggested by Klaus.

 - Rework Commands and Effects patch to make sure that the log is
   always in sync with the actual set of commands supported.

 - Add two refactoring commits at the end of the series to
   optimize read and write i/o path.

- Incorporate feedback from Keith, Klaus and Niklas:

  * fix rebase errors in nvme_identify_ns_descr_list()
  * remove unnecessary code from nvme_write_bar()
  * move csi to NvmeNamespace and use it from the beginning in NSTypes
    patch
  * change zone read processing to cover all corner cases with RAZB=1
  * sync w_ptr and d.wp in case of a i/o error at the preceding zone
  * reword the commit message in active/inactive patch with the new
    text from Niklas
  * correct dlfeat reporting depending on the fill pattern set
  * add more checks for "attached" n/s parameter to prevent i/o and
    get/set features on inactive namespaces
  * Use DEFINE_PROP_SIZE and DEFINE_PROP_SIZE32 for zone size/capacity
    and ZASL respectively
  * Improve zone size and capacity validation
  * Correctly report NSZE

v4 -> v5:

 - Rebase to the current qemu-nvme.

 - Use HostMemoryBackendFile as the backing storage for persistent
   zone metadata.

 - Fix the issue with filling the valid data in the next zone if RAZB
   is enabled.

v3 -> v4:

 - Fix bugs introduced in v2/v3 for QD > 1 operation. Now, all writes
   to a zone happen at the new write pointer variable, zone->w_ptr,
   that is advanced right after submitting the backend i/o. The existing
   zone->d.wp variable is updated upon the successful write completion
   and it is used for zone reporting. Some code has been split from
   nvme_finalize_zoned_write() function to a new function,
   nvme_advance_zone_wp().

 - Make the code compile under mingw. Switch to using QEMU API for
   mmap/msync, i.e. memory_region...(). Since mmap is not available in
   mingw (even though there is mman-win32 library available on Github),
   conditional compilation is added around these calls to avoid
   undefined symbols under mingw. A better fix would be to add stub
   functions to softmmu/memory.c for the case when CONFIG_POSIX is not
   defined, but such change is beyond the scope of this patchset and it
   can be made in a separate patch.

 - Correct permission mask used to open zone metadata file.

 - Fold "Define 64 bit cqe.result" patch into ZNS commit.

 - Use clz64/clz32 instead of defining nvme_ilog2() function.

 - Simplify rpt_empty_id_struct() code, move nvme_fill_data() back
   to ZNS patch.

 - Fix a power-on processing bug.

 - Rename NVME_CMD_ZONE_APND to NVME_CMD_ZONE_APPEND.

 - Make the list of review comments addressed in v2 of the series
   (see below).

v2 -> v3:

 - Moved nvme_fill_data() function to the NSTypes patch as it is
   now used there to output empty namespace identify structs.
 - Fixed typo in Maxim's email address.

v1 -> v2:

 - Rebased on top of qemu-nvme/next branch.
 - Incorporated feedback from Klaus and Alistair.
    * Allow a subset of CSE log to be read, not the entire log
    * Assign admin command entries in CSE log to ACS fields
    * Set LPA bit 1 to indicate support of CSE log page
    * Rename CC.CSS value CSS_ALL_NSTYPES (110b) to CSS_CSI
    * Move the code to assign lbaf.ds to a separate patch
    * Remove the change in firmware revision
    * Change "driver" to "device" in comments and annotations
    * Rename ZAMDS to ZASL
    * Correct a few format expressions and some wording in
      trace event definitions
    * Remove validation code to return NVME_CAP_EXCEEDED error
    * Make ZASL to be equal to MDTS if "zone_append_size_limit"
      module parameter is not set
    * Clean up nvme_zoned_init_ctrl() to make size calculations
      less confusing
    * Avoid changing module parameters, use separate n/s variables
      if additional calculations are necessary to convert parameters
      to running values
    * Use NVME_DEFAULT_ZONE_SIZE to assign the default zone size value
    * Use default 0 for zone capacity meaning that zone capacity will
      be equal to zone size by default
    * Issue warnings if user MAR/MOR values are too large and have
      to be adjusted
    * Use unsigned values for MAR/MOR
 - Dropped "Simulate Zone Active excursions" patch.
   Excursion behavior may depend on the internal controller
   architecture and therefore be vendor-specific.
 - Dropped support for Zone Attributes and zoned AENs for now.
   These features can be added in a future series.
 - NS Types support is extended to handle active/inactive namespaces.
 - Update the write pointer after backing storage I/O completion, not
   before. This makes the emulation to run correctly in case of
   backing device failures.
 - Avoid division in the I/O path if the device zone size is
   a power of two (the most common case). Zone index then can be
   calculated by using bit shift.
 - A few reported bugs have been fixed.
 - Indentation in function definitions has been changed to make it
   the same as the rest of the code.


Zoned Namespace (ZNS) Command Set is a newly introduced command set
published by the NVM Express, Inc. organization as TP 4053. The main
design goals of ZNS are to provide hardware designers the means to
reduce NVMe controller complexity and to allow achieving a better I/O
latency and throughput. SSDs that implement this interface are
commonly known as ZNS SSDs.

This command set is implementing a zoned storage model, similarly to
ZAC/ZBC. As such, there is already support in Linux, allowing one to
perform the majority of tasks needed for managing ZNS SSDs.

The Zoned Namespace Command Set relies on another TP, known as
Namespace Types (NVMe TP 4056), which introduces support for having
multiple command sets per namespace.

Both ZNS and Namespace Types specifications can be downloaded by
visiting the following link -

https://nvmexpress.org/wp-content/uploads/NVM-Express-1.4-Ratified-TPs.zip

This patch series adds Namespace Types support and zoned namespace
emulation capability to the existing NVMe PCI device.


Based-on: <20201104102248.32168-1-its@irrelevant.dk>
Dmitry Fomichev (11):
  hw/block/nvme: Process controller reset and shutdown differently
  hw/block/nvme: Generate namespace UUIDs
  hw/block/nvme: Separate read and write handlers
  hw/block/nvme: Combine nvme_write_zeroes() and nvme_write()
  hw/block/nvme: Add Commands Supported and Effects log
  block/nvme: Make ZNS-related definitions
  hw/block/nvme: Support Zoned Namespace Command Set
  hw/block/nvme: Introduce max active and open zone limits
  hw/block/nvme: Support Zone Descriptor Extensions
  hw/block/nvme: Add injection of Offline/Read-Only zones
  hw/block/nvme: Document zoned parameters in usage text

Niklas Cassel (2):
  hw/block/nvme: Add support for Namespace Types
  hw/block/nvme: Support allocated CNS command variants

 hw/block/nvme-ns.h    |  108 +++-
 hw/block/nvme.h       |    6 +
 include/block/nvme.h  |  201 +++++-
 hw/block/nvme-ns.c    |  271 +++++++-
 hw/block/nvme.c       | 1432 ++++++++++++++++++++++++++++++++++++++---
 hw/block/trace-events |   32 +-
 6 files changed, 1927 insertions(+), 123 deletions(-)

-- 
2.28.0


