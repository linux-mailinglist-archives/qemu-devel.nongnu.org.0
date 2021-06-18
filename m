Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AC83ACF4C
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 17:38:10 +0200 (CEST)
Received: from localhost ([::1]:53918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luGZN-0003H1-2R
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 11:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1luGWO-0005jx-BI
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:35:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1luGWL-0004Mu-Sl
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:35:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624030501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ejRfTn8OHHxfyK+9KULs55XRj5XtjP/OHRapM/1fQ6U=;
 b=V0sfLEO2hjfDtPWaWpw1naQAyprBjNtes9YyWs1oXjyR5WCiwMNgTs3bTElU5ZrFMLdyZE
 oGRY2cxI4889E1+IHwZTHknW3jRs7TE2ccwv7iSkJEmn1c23AEpJvNxBS7vqaiP4XzHs1U
 6BS4t1STLYhqWyNHsatIv1f14LdVYm8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-PwmIIHj_N9OxrII7Nvq3XQ-1; Fri, 18 Jun 2021 11:34:55 -0400
X-MC-Unique: PwmIIHj_N9OxrII7Nvq3XQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8FAC804143;
 Fri, 18 Jun 2021 15:34:54 +0000 (UTC)
Received: from [172.30.41.16] (ovpn-112-106.phx2.redhat.com [10.3.112.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BA9C5C225;
 Fri, 18 Jun 2021 15:34:54 +0000 (UTC)
Subject: [PULL 1/3] docs/devel: Add VFIO device migration documentation
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 18 Jun 2021 09:34:54 -0600
Message-ID: <162403049431.1793226.2362883307115162874.stgit@omen>
In-Reply-To: <162403041204.1793226.16018359908572247606.stgit@omen>
References: <162403041204.1793226.16018359908572247606.stgit@omen>
User-Agent: StGit/1.0-8-g6af9-dirty
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kirti Wankhede <kwankhede@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 alex.williamson@redhat.com, Tarun Gupta <targupta@nvidia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tarun Gupta <targupta@nvidia.com>

Document interfaces used for VFIO device migration. Added flow
of state changes during live migration with VFIO device.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Co-developed-by: Kirti Wankhede <kwankhede@nvidia.com>
Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
Signed-off-by: Tarun Gupta <targupta@nvidia.com>
Message-Id: <20210418122251.88809-1-targupta@nvidia.com>
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 MAINTAINERS                   |    1 
 docs/devel/index.rst          |    1 
 docs/devel/vfio-migration.rst |  150 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 152 insertions(+)
 create mode 100644 docs/devel/vfio-migration.rst

diff --git a/MAINTAINERS b/MAINTAINERS
index 4842cc26e5ce..f7e12ea2488d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1817,6 +1817,7 @@ S: Supported
 F: hw/vfio/*
 F: include/hw/vfio/
 F: docs/igd-assign.txt
+F: docs/devel/vfio-migration.rst
 
 vfio-ccw
 M: Cornelia Huck <cohuck@redhat.com>
diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index 791925dcda54..977c3893bdaf 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -44,3 +44,4 @@ Contents:
    block-coroutine-wrapper
    multi-process
    ebpf_rss
+   vfio-migration
diff --git a/docs/devel/vfio-migration.rst b/docs/devel/vfio-migration.rst
new file mode 100644
index 000000000000..9ff6163c8811
--- /dev/null
+++ b/docs/devel/vfio-migration.rst
@@ -0,0 +1,150 @@
+=====================
+VFIO device Migration
+=====================
+
+Migration of virtual machine involves saving the state for each device that
+the guest is running on source host and restoring this saved state on the
+destination host. This document details how saving and restoring of VFIO
+devices is done in QEMU.
+
+Migration of VFIO devices consists of two phases: the optional pre-copy phase,
+and the stop-and-copy phase. The pre-copy phase is iterative and allows to
+accommodate VFIO devices that have a large amount of data that needs to be
+transferred. The iterative pre-copy phase of migration allows for the guest to
+continue whilst the VFIO device state is transferred to the destination, this
+helps to reduce the total downtime of the VM. VFIO devices can choose to skip
+the pre-copy phase of migration by returning pending_bytes as zero during the
+pre-copy phase.
+
+A detailed description of the UAPI for VFIO device migration can be found in
+the comment for the ``vfio_device_migration_info`` structure in the header
+file linux-headers/linux/vfio.h.
+
+VFIO implements the device hooks for the iterative approach as follows:
+
+* A ``save_setup`` function that sets up the migration region and sets _SAVING
+  flag in the VFIO device state.
+
+* A ``load_setup`` function that sets up the migration region on the
+  destination and sets _RESUMING flag in the VFIO device state.
+
+* A ``save_live_pending`` function that reads pending_bytes from the vendor
+  driver, which indicates the amount of data that the vendor driver has yet to
+  save for the VFIO device.
+
+* A ``save_live_iterate`` function that reads the VFIO device's data from the
+  vendor driver through the migration region during iterative phase.
+
+* A ``save_state`` function to save the device config space if it is present.
+
+* A ``save_live_complete_precopy`` function that resets _RUNNING flag from the
+  VFIO device state and iteratively copies the remaining data for the VFIO
+  device until the vendor driver indicates that no data remains (pending bytes
+  is zero).
+
+* A ``load_state`` function that loads the config section and the data
+  sections that are generated by the save functions above
+
+* ``cleanup`` functions for both save and load that perform any migration
+  related cleanup, including unmapping the migration region
+
+
+The VFIO migration code uses a VM state change handler to change the VFIO
+device state when the VM state changes from running to not-running, and
+vice versa.
+
+Similarly, a migration state change handler is used to trigger a transition of
+the VFIO device state when certain changes of the migration state occur. For
+example, the VFIO device state is transitioned back to _RUNNING in case a
+migration failed or was canceled.
+
+System memory dirty pages tracking
+----------------------------------
+
+A ``log_global_start`` and ``log_global_stop`` memory listener callback informs
+the VFIO IOMMU module to start and stop dirty page tracking. A ``log_sync``
+memory listener callback marks those system memory pages as dirty which are
+used for DMA by the VFIO device. The dirty pages bitmap is queried per
+container. All pages pinned by the vendor driver through external APIs have to
+be marked as dirty during migration. When there are CPU writes, CPU dirty page
+tracking can identify dirtied pages, but any page pinned by the vendor driver
+can also be written by the device. There is currently no device or IOMMU
+support for dirty page tracking in hardware.
+
+By default, dirty pages are tracked when the device is in pre-copy as well as
+stop-and-copy phase. So, a page pinned by the vendor driver will be copied to
+the destination in both phases. Copying dirty pages in pre-copy phase helps
+QEMU to predict if it can achieve its downtime tolerances. If QEMU during
+pre-copy phase keeps finding dirty pages continuously, then it understands
+that even in stop-and-copy phase, it is likely to find dirty pages and can
+predict the downtime accordingly.
+
+QEMU also provides a per device opt-out option ``pre-copy-dirty-page-tracking``
+which disables querying the dirty bitmap during pre-copy phase. If it is set to
+off, all dirty pages will be copied to the destination in stop-and-copy phase
+only.
+
+System memory dirty pages tracking when vIOMMU is enabled
+---------------------------------------------------------
+
+With vIOMMU, an IO virtual address range can get unmapped while in pre-copy
+phase of migration. In that case, the unmap ioctl returns any dirty pages in
+that range and QEMU reports corresponding guest physical pages dirty. During
+stop-and-copy phase, an IOMMU notifier is used to get a callback for mapped
+pages and then dirty pages bitmap is fetched from VFIO IOMMU modules for those
+mapped ranges.
+
+Flow of state changes during Live migration
+===========================================
+
+Below is the flow of state change during live migration.
+The values in the brackets represent the VM state, the migration state, and
+the VFIO device state, respectively.
+
+Live migration save path
+------------------------
+
+::
+
+                        QEMU normal running state
+                        (RUNNING, _NONE, _RUNNING)
+                                  |
+                     migrate_init spawns migration_thread
+                Migration thread then calls each device's .save_setup()
+                    (RUNNING, _SETUP, _RUNNING|_SAVING)
+                                  |
+                    (RUNNING, _ACTIVE, _RUNNING|_SAVING)
+             If device is active, get pending_bytes by .save_live_pending()
+          If total pending_bytes >= threshold_size, call .save_live_iterate()
+                  Data of VFIO device for pre-copy phase is copied
+        Iterate till total pending bytes converge and are less than threshold
+                                  |
+  On migration completion, vCPU stops and calls .save_live_complete_precopy for
+   each active device. The VFIO device is then transitioned into _SAVING state
+                   (FINISH_MIGRATE, _DEVICE, _SAVING)
+                                  |
+     For the VFIO device, iterate in .save_live_complete_precopy until
+                         pending data is 0
+                   (FINISH_MIGRATE, _DEVICE, _STOPPED)
+                                  |
+                 (FINISH_MIGRATE, _COMPLETED, _STOPPED)
+             Migraton thread schedules cleanup bottom half and exits
+
+Live migration resume path
+--------------------------
+
+::
+
+              Incoming migration calls .load_setup for each device
+                       (RESTORE_VM, _ACTIVE, _STOPPED)
+                                 |
+       For each device, .load_state is called for that device section data
+                       (RESTORE_VM, _ACTIVE, _RESUMING)
+                                 |
+    At the end, .load_cleanup is called for each device and vCPUs are started
+                       (RUNNING, _NONE, _RUNNING)
+
+Postcopy
+========
+
+Postcopy migration is currently not supported for VFIO devices.



