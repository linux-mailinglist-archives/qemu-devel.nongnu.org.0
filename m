Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3D31D3FC1
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 23:12:34 +0200 (CEST)
Received: from localhost ([::1]:58748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZL9d-0005E4-24
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 17:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1jZL8K-00049G-Ub
 for qemu-devel@nongnu.org; Thu, 14 May 2020 17:11:13 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:11310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1jZL8J-0000l8-1X
 for qemu-devel@nongnu.org; Thu, 14 May 2020 17:11:12 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ebdb3a10000>; Thu, 14 May 2020 14:09:53 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 14 May 2020 14:11:09 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 14 May 2020 14:11:09 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 May
 2020 21:11:08 +0000
Received: from kwankhede-dev.nvidia.com (10.124.1.5) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 14 May 2020 21:11:02 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <cjia@nvidia.com>
Subject: [PATCH Kernel v20 1/8] vfio: UAPI for migration interface for device
 state
Date: Fri, 15 May 2020 02:07:40 +0530
Message-ID: <1589488667-9683-2-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1589488667-9683-1-git-send-email-kwankhede@nvidia.com>
References: <1589488667-9683-1-git-send-email-kwankhede@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1589490593; bh=s4Iv0GJDj+1bhl4jbE8YcxRvsfl81dyjXBeOzB1RdI0=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=Za9RhaWBJIEHPTDn3wz7Zxvugojxj3pLFj1+KscuUb6AvM9P49c6tb+f9c4u1KsM4
 vZb5z5IAbsdI4YvvC+YfFUpt+O3GksB3diqS7IS5byw7oRew3dYl7x3gEYNa9yMWZP
 yEin1+OGaEJJpUnGKFi1tVyW5vMh0PcVQPPYFAL7k8ctqXK+DagiS0PkvN+TLp/YK9
 EgealmlljN9tPWR6AbzXLclyuvE2xKXJQGm0t9oTBftMoUvLhur9iIv1FLMFVT6kSk
 bqcnx55EnM94vcJzEVA5KMwfg9MFAqHNp/O1YEh7YeCu4XpBHXsdUiAsG9VY9q5S/F
 RdWGRa2fpSUuw==
Received-SPF: pass client-ip=216.228.121.64; envelope-from=kwankhede@nvidia.com;
 helo=hqnvemgate25.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 17:11:09
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Zhengxiao.zx@Alibaba-inc.com, kevin.tian@intel.com, yi.l.liu@intel.com,
 yan.y.zhao@intel.com, kvm@vger.kernel.org, eskultet@redhat.com,
 ziye.yang@intel.com, qemu-devel@nongnu.org, cohuck@redhat.com,
 shuangtai.tst@alibaba-inc.com, dgilbert@redhat.com, zhi.a.wang@intel.com,
 mlevitsk@redhat.com, pasic@linux.ibm.com, aik@ozlabs.ru,
 Kirti Wankhede <kwankhede@nvidia.com>, eauger@redhat.com, felipe@nutanix.com,
 jonathan.davies@nutanix.com, changpeng.liu@intel.com, Ken.Xue@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

- Defined MIGRATION region type and sub-type.

- Defined vfio_device_migration_info structure which will be placed at the
  0th offset of migration region to get/set VFIO device related
  information. Defined members of structure and usage on read/write access.

- Defined device states and state transition details.

- Defined sequence to be followed while saving and resuming VFIO device.

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
Reviewed-by: Neo Jia <cjia@nvidia.com>
---
 include/uapi/linux/vfio.h | 228 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 228 insertions(+)

diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index 015516bcfaa3..ad9bb5af3463 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -305,6 +305,7 @@ struct vfio_region_info_cap_type {
 #define VFIO_REGION_TYPE_PCI_VENDOR_MASK	(0xffff)
 #define VFIO_REGION_TYPE_GFX                    (1)
 #define VFIO_REGION_TYPE_CCW			(2)
+#define VFIO_REGION_TYPE_MIGRATION              (3)
 
 /* sub-types for VFIO_REGION_TYPE_PCI_* */
 
@@ -379,6 +380,233 @@ struct vfio_region_gfx_edid {
 /* sub-types for VFIO_REGION_TYPE_CCW */
 #define VFIO_REGION_SUBTYPE_CCW_ASYNC_CMD	(1)
 
+/* sub-types for VFIO_REGION_TYPE_MIGRATION */
+#define VFIO_REGION_SUBTYPE_MIGRATION           (1)
+
+/*
+ * The structure vfio_device_migration_info is placed at the 0th offset of
+ * the VFIO_REGION_SUBTYPE_MIGRATION region to get and set VFIO device related
+ * migration information. Field accesses from this structure are only supported
+ * at their native width and alignment. Otherwise, the result is undefined and
+ * vendor drivers should return an error.
+ *
+ * device_state: (read/write)
+ *      - The user application writes to this field to inform the vendor driver
+ *        about the device state to be transitioned to.
+ *      - The vendor driver should take the necessary actions to change the
+ *        device state. After successful transition to a given state, the
+ *        vendor driver should return success on write(device_state, state)
+ *        system call. If the device state transition fails, the vendor driver
+ *        should return an appropriate -errno for the fault condition.
+ *      - On the user application side, if the device state transition fails,
+ *	  that is, if write(device_state, state) returns an error, read
+ *	  device_state again to determine the current state of the device from
+ *	  the vendor driver.
+ *      - The vendor driver should return previous state of the device unless
+ *        the vendor driver has encountered an internal error, in which case
+ *        the vendor driver may report the device_state VFIO_DEVICE_STATE_ERROR.
+ *      - The user application must use the device reset ioctl to recover the
+ *        device from VFIO_DEVICE_STATE_ERROR state. If the device is
+ *        indicated to be in a valid device state by reading device_state, the
+ *        user application may attempt to transition the device to any valid
+ *        state reachable from the current state or terminate itself.
+ *
+ *      device_state consists of 3 bits:
+ *      - If bit 0 is set, it indicates the _RUNNING state. If bit 0 is clear,
+ *        it indicates the _STOP state. When the device state is changed to
+ *        _STOP, driver should stop the device before write() returns.
+ *      - If bit 1 is set, it indicates the _SAVING state, which means that the
+ *        driver should start gathering device state information that will be
+ *        provided to the VFIO user application to save the device's state.
+ *      - If bit 2 is set, it indicates the _RESUMING state, which means that
+ *        the driver should prepare to resume the device. Data provided through
+ *        the migration region should be used to resume the device.
+ *      Bits 3 - 31 are reserved for future use. To preserve them, the user
+ *      application should perform a read-modify-write operation on this
+ *      field when modifying the specified bits.
+ *
+ *  +------- _RESUMING
+ *  |+------ _SAVING
+ *  ||+----- _RUNNING
+ *  |||
+ *  000b => Device Stopped, not saving or resuming
+ *  001b => Device running, which is the default state
+ *  010b => Stop the device & save the device state, stop-and-copy state
+ *  011b => Device running and save the device state, pre-copy state
+ *  100b => Device stopped and the device state is resuming
+ *  101b => Invalid state
+ *  110b => Error state
+ *  111b => Invalid state
+ *
+ * State transitions:
+ *
+ *              _RESUMING  _RUNNING    Pre-copy    Stop-and-copy   _STOP
+ *                (100b)     (001b)     (011b)        (010b)       (000b)
+ * 0. Running or default state
+ *                             |
+ *
+ * 1. Normal Shutdown (optional)
+ *                             |------------------------------------->|
+ *
+ * 2. Save the state or suspend
+ *                             |------------------------->|---------->|
+ *
+ * 3. Save the state during live migration
+ *                             |----------->|------------>|---------->|
+ *
+ * 4. Resuming
+ *                  |<---------|
+ *
+ * 5. Resumed
+ *                  |--------->|
+ *
+ * 0. Default state of VFIO device is _RUNNNG when the user application starts.
+ * 1. During normal shutdown of the user application, the user application may
+ *    optionally change the VFIO device state from _RUNNING to _STOP. This
+ *    transition is optional. The vendor driver must support this transition but
+ *    must not require it.
+ * 2. When the user application saves state or suspends the application, the
+ *    device state transitions from _RUNNING to stop-and-copy and then to _STOP.
+ *    On state transition from _RUNNING to stop-and-copy, driver must stop the
+ *    device, save the device state and send it to the application through the
+ *    migration region. The sequence to be followed for such transition is given
+ *    below.
+ * 3. In live migration of user application, the state transitions from _RUNNING
+ *    to pre-copy, to stop-and-copy, and to _STOP.
+ *    On state transition from _RUNNING to pre-copy, the driver should start
+ *    gathering the device state while the application is still running and send
+ *    the device state data to application through the migration region.
+ *    On state transition from pre-copy to stop-and-copy, the driver must stop
+ *    the device, save the device state and send it to the user application
+ *    through the migration region.
+ *    Vendor drivers must support the pre-copy state even for implementations
+ *    where no data is provided to the user before the stop-and-copy state. The
+ *    user must not be required to consume all migration data before the device
+ *    transitions to a new state, including the stop-and-copy state.
+ *    The sequence to be followed for above two transitions is given below.
+ * 4. To start the resuming phase, the device state should be transitioned from
+ *    the _RUNNING to the _RESUMING state.
+ *    In the _RESUMING state, the driver should use the device state data
+ *    received through the migration region to resume the device.
+ * 5. After providing saved device data to the driver, the application should
+ *    change the state from _RESUMING to _RUNNING.
+ *
+ * reserved:
+ *      Reads on this field return zero and writes are ignored.
+ *
+ * pending_bytes: (read only)
+ *      The number of pending bytes still to be migrated from the vendor driver.
+ *
+ * data_offset: (read only)
+ *      The user application should read data_offset field from the migration
+ *      region. The user application should read the device data from this
+ *      offset within the migration region during the _SAVING state or write
+ *      the device data during the _RESUMING state. See below for details of
+ *      sequence to be followed.
+ *
+ * data_size: (read/write)
+ *      The user application should read data_size to get the size in bytes of
+ *      the data copied in the migration region during the _SAVING state and
+ *      write the size in bytes of the data copied in the migration region
+ *      during the _RESUMING state.
+ *
+ * The format of the migration region is as follows:
+ *  ------------------------------------------------------------------
+ * |vfio_device_migration_info|    data section                      |
+ * |                          |     ///////////////////////////////  |
+ * ------------------------------------------------------------------
+ *   ^                              ^
+ *  offset 0-trapped part        data_offset
+ *
+ * The structure vfio_device_migration_info is always followed by the data
+ * section in the region, so data_offset will always be nonzero. The offset
+ * from where the data is copied is decided by the kernel driver. The data
+ * section can be trapped, mmapped, or partitioned, depending on how the kernel
+ * driver defines the data section. The data section partition can be defined
+ * as mapped by the sparse mmap capability. If mmapped, data_offset must be
+ * page aligned, whereas initial section which contains the
+ * vfio_device_migration_info structure, might not end at the offset, which is
+ * page aligned. The user is not required to access through mmap regardless
+ * of the capabilities of the region mmap.
+ * The vendor driver should determine whether and how to partition the data
+ * section. The vendor driver should return data_offset accordingly.
+ *
+ * The sequence to be followed while in pre-copy state and stop-and-copy state
+ * is as follows:
+ * a. Read pending_bytes, indicating the start of a new iteration to get device
+ *    data. Repeated read on pending_bytes at this stage should have no side
+ *    effects.
+ *    If pending_bytes == 0, the user application should not iterate to get data
+ *    for that device.
+ *    If pending_bytes > 0, perform the following steps.
+ * b. Read data_offset, indicating that the vendor driver should make data
+ *    available through the data section. The vendor driver should return this
+ *    read operation only after data is available from (region + data_offset)
+ *    to (region + data_offset + data_size).
+ * c. Read data_size, which is the amount of data in bytes available through
+ *    the migration region.
+ *    Read on data_offset and data_size should return the offset and size of
+ *    the current buffer if the user application reads data_offset and
+ *    data_size more than once here.
+ * d. Read data_size bytes of data from (region + data_offset) from the
+ *    migration region.
+ * e. Process the data.
+ * f. Read pending_bytes, which indicates that the data from the previous
+ *    iteration has been read. If pending_bytes > 0, go to step b.
+ *
+ * The user application can transition from the _SAVING|_RUNNING
+ * (pre-copy state) to the _SAVING (stop-and-copy) state regardless of the
+ * number of pending bytes. The user application should iterate in _SAVING
+ * (stop-and-copy) until pending_bytes is 0.
+ *
+ * The sequence to be followed while _RESUMING device state is as follows:
+ * While data for this device is available, repeat the following steps:
+ * a. Read data_offset from where the user application should write data.
+ * b. Write migration data starting at the migration region + data_offset for
+ *    the length determined by data_size from the migration source.
+ * c. Write data_size, which indicates to the vendor driver that data is
+ *    written in the migration region. Vendor driver must return this write
+ *    operations on consuming data. Vendor driver should apply the
+ *    user-provided migration region data to the device resume state.
+ *
+ * If an error occurs during the above sequences, the vendor driver can return
+ * an error code for next read() or write() operation, which will terminate the
+ * loop. The user application should then take the next necessary action, for
+ * example, failing migration or terminating the user application.
+ *
+ * For the user application, data is opaque. The user application should write
+ * data in the same order as the data is received and the data should be of
+ * same transaction size at the source.
+ */
+
+struct vfio_device_migration_info {
+	__u32 device_state;         /* VFIO device state */
+#define VFIO_DEVICE_STATE_STOP      (0)
+#define VFIO_DEVICE_STATE_RUNNING   (1 << 0)
+#define VFIO_DEVICE_STATE_SAVING    (1 << 1)
+#define VFIO_DEVICE_STATE_RESUMING  (1 << 2)
+#define VFIO_DEVICE_STATE_MASK      (VFIO_DEVICE_STATE_RUNNING | \
+				     VFIO_DEVICE_STATE_SAVING |  \
+				     VFIO_DEVICE_STATE_RESUMING)
+
+#define VFIO_DEVICE_STATE_VALID(state) \
+	(state & VFIO_DEVICE_STATE_RESUMING ? \
+	(state & VFIO_DEVICE_STATE_MASK) == VFIO_DEVICE_STATE_RESUMING : 1)
+
+#define VFIO_DEVICE_STATE_IS_ERROR(state) \
+	((state & VFIO_DEVICE_STATE_MASK) == (VFIO_DEVICE_STATE_SAVING | \
+					      VFIO_DEVICE_STATE_RESUMING))
+
+#define VFIO_DEVICE_STATE_SET_ERROR(state) \
+	((state & ~VFIO_DEVICE_STATE_MASK) | VFIO_DEVICE_SATE_SAVING | \
+					     VFIO_DEVICE_STATE_RESUMING)
+
+	__u32 reserved;
+	__u64 pending_bytes;
+	__u64 data_offset;
+	__u64 data_size;
+};
+
 /*
  * The MSIX mappable capability informs that MSIX data of a BAR can be mmapped
  * which allows direct access to non-MSIX registers which happened to be within
-- 
2.7.0


