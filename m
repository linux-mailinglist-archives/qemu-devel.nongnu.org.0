Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1405D519DBD
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 13:16:18 +0200 (CEST)
Received: from localhost ([::1]:37638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmCzP-0000Hx-U4
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 07:16:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmBpL-0000jb-3b
 for qemu-devel@nongnu.org; Wed, 04 May 2022 06:01:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmBpI-0006Il-WA
 for qemu-devel@nongnu.org; Wed, 04 May 2022 06:01:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651658504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fGFLqz4GcWCyjhk8yzSNs5Qx91J3YajMXB6rSUu1Clk=;
 b=OKDQ+0nQQY3//JrKUv4h4G1URZUwWYmo4Qgdc28rY0z60a3dNCnO230sE0jjHOHByKmpZ0
 XMjZlwLBiZDcTxgQHmnYhPyt1KAex5OO7WfVlksTBS2mb8oUZ/7v9+NikWTEIES6RJcPOZ
 tlc+nAxpVb/6JODAg1TuT3cEM/KlTto=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-_Sn8_Cm4PuiOK8T_eeNkFA-1; Wed, 04 May 2022 06:01:39 -0400
X-MC-Unique: _Sn8_Cm4PuiOK8T_eeNkFA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6D7E3C01D90;
 Wed,  4 May 2022 10:01:38 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84E199E84;
 Wed,  4 May 2022 10:01:37 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 zhenwei pi <pizhenwei@bytedance.com>, Keith Busch <kbusch@kernel.org>
Subject: [PULL 7/7] qga: Introduce disk smart
Date: Wed,  4 May 2022 14:01:01 +0400
Message-Id: <20220504100101.564747-8-marcandre.lureau@redhat.com>
In-Reply-To: <20220504100101.564747-1-marcandre.lureau@redhat.com>
References: <20220504100101.564747-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: zhenwei pi <pizhenwei@bytedance.com>

After assigning a NVMe/SCSI controller to guest by VFIO, we lose
everything on the host side. A guest uses these devices exclusively,
we usually don't care the actions on these devices. But there is a
low probability that hitting physical hardware warning, we need a
chance to get the basic smart log info.

Introduce disk smart, and implement NVMe smart on linux.

Thanks to Keith and Marc-André.

CC: Keith Busch <kbusch@kernel.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
Message-Id: <20220420022610.418052-3-pizhenwei@bytedance.com>
---
 qga/qapi-schema.json | 53 +++++++++++++++++++++++++++++++-
 qga/commands-posix.c | 73 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 125 insertions(+), 1 deletion(-)

diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index 5ea76cfd1d73..4d8e506c9e86 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -888,6 +888,55 @@
            '*serial': 'str', '*dev': 'str',
            '*ccw-address': 'GuestCCWAddress'} }
 
+##
+# @GuestNVMeSmart:
+#
+# NVMe smart informations, based on NVMe specification,
+# section <SMART / Health Information (Log Identifier 02h)>
+#
+# Since: 7.1
+##
+{ 'struct': 'GuestNVMeSmart',
+  'data': {'critical-warning': 'int',
+           'temperature': 'int',
+           'available-spare': 'int',
+           'available-spare-threshold': 'int',
+           'percentage-used': 'int',
+           'data-units-read-lo': 'uint64',
+           'data-units-read-hi': 'uint64',
+           'data-units-written-lo': 'uint64',
+           'data-units-written-hi': 'uint64',
+           'host-read-commands-lo': 'uint64',
+           'host-read-commands-hi': 'uint64',
+           'host-write-commands-lo': 'uint64',
+           'host-write-commands-hi': 'uint64',
+           'controller-busy-time-lo': 'uint64',
+           'controller-busy-time-hi': 'uint64',
+           'power-cycles-lo': 'uint64',
+           'power-cycles-hi': 'uint64',
+           'power-on-hours-lo': 'uint64',
+           'power-on-hours-hi': 'uint64',
+           'unsafe-shutdowns-lo': 'uint64',
+           'unsafe-shutdowns-hi': 'uint64',
+           'media-errors-lo': 'uint64',
+           'media-errors-hi': 'uint64',
+           'number-of-error-log-entries-lo': 'uint64',
+           'number-of-error-log-entries-hi': 'uint64' } }
+
+##
+# @GuestDiskSmart:
+#
+# Disk type related smart information.
+#
+# - @nvme: NVMe disk smart
+#
+# Since: 7.1
+##
+{ 'union': 'GuestDiskSmart',
+  'base': { 'type': 'GuestDiskBusType' },
+  'discriminator': 'type',
+  'data': { 'nvme': 'GuestNVMeSmart' } }
+
 ##
 # @GuestDiskInfo:
 #
@@ -899,12 +948,14 @@
 # @address: disk address information (only for non-virtual devices)
 # @alias: optional alias assigned to the disk, on Linux this is a name assigned
 #         by device mapper
+# @smart: disk smart information (Since 7.1)
 #
 # Since 5.2
 ##
 { 'struct': 'GuestDiskInfo',
   'data': {'name': 'str', 'partition': 'bool', '*dependencies': ['str'],
-           '*address': 'GuestDiskAddress', '*alias': 'str'} }
+           '*address': 'GuestDiskAddress', '*alias': 'str',
+           '*smart': 'GuestDiskSmart'} }
 
 ##
 # @guest-get-disks:
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index a5fbae00e90c..69f209af87e6 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -26,6 +26,7 @@
 #include "qemu/base64.h"
 #include "qemu/cutils.h"
 #include "commands-common.h"
+#include "block/nvme.h"
 
 #ifdef HAVE_UTMPX
 #include <utmpx.h>
@@ -35,6 +36,7 @@
 #include <mntent.h>
 #include <linux/fs.h>
 #include <sys/statvfs.h>
+#include <linux/nvme_ioctl.h>
 
 #ifdef CONFIG_LIBUDEV
 #include <libudev.h>
@@ -1391,6 +1393,76 @@ static GuestDiskInfoList *get_disk_partitions(
     return ret;
 }
 
+static void get_nvme_smart(GuestDiskInfo *disk)
+{
+    int fd;
+    GuestNVMeSmart *smart;
+    NvmeSmartLog log = {0};
+    struct nvme_admin_cmd cmd = {
+        .opcode = NVME_ADM_CMD_GET_LOG_PAGE,
+        .nsid = NVME_NSID_BROADCAST,
+        .addr = (uintptr_t)&log,
+        .data_len = sizeof(log),
+        .cdw10 = NVME_LOG_SMART_INFO | (1 << 15) /* RAE bit */
+                 | (((sizeof(log) >> 2) - 1) << 16)
+    };
+
+    fd = qemu_open_old(disk->name, O_RDONLY);
+    if (fd == -1) {
+        g_debug("Failed to open device: %s: %s", disk->name, g_strerror(errno));
+        return;
+    }
+
+    if (ioctl(fd, NVME_IOCTL_ADMIN_CMD, &cmd)) {
+        g_debug("Failed to get smart: %s: %s", disk->name, g_strerror(errno));
+        close(fd);
+        return;
+    }
+
+    disk->has_smart = true;
+    disk->smart = g_new0(GuestDiskSmart, 1);
+    disk->smart->type = GUEST_DISK_BUS_TYPE_NVME;
+
+    smart = &disk->smart->u.nvme;
+    smart->critical_warning = log.critical_warning;
+    smart->temperature = lduw_le_p(&log.temperature); /* unaligned field */
+    smart->available_spare = log.available_spare;
+    smart->available_spare_threshold = log.available_spare_threshold;
+    smart->percentage_used = log.percentage_used;
+    smart->data_units_read_lo = le64_to_cpu(log.data_units_read[0]);
+    smart->data_units_read_hi = le64_to_cpu(log.data_units_read[1]);
+    smart->data_units_written_lo = le64_to_cpu(log.data_units_written[0]);
+    smart->data_units_written_hi = le64_to_cpu(log.data_units_written[1]);
+    smart->host_read_commands_lo = le64_to_cpu(log.host_read_commands[0]);
+    smart->host_read_commands_hi = le64_to_cpu(log.host_read_commands[1]);
+    smart->host_write_commands_lo = le64_to_cpu(log.host_write_commands[0]);
+    smart->host_write_commands_hi = le64_to_cpu(log.host_write_commands[1]);
+    smart->controller_busy_time_lo = le64_to_cpu(log.controller_busy_time[0]);
+    smart->controller_busy_time_hi = le64_to_cpu(log.controller_busy_time[1]);
+    smart->power_cycles_lo = le64_to_cpu(log.power_cycles[0]);
+    smart->power_cycles_hi = le64_to_cpu(log.power_cycles[1]);
+    smart->power_on_hours_lo = le64_to_cpu(log.power_on_hours[0]);
+    smart->power_on_hours_hi = le64_to_cpu(log.power_on_hours[1]);
+    smart->unsafe_shutdowns_lo = le64_to_cpu(log.unsafe_shutdowns[0]);
+    smart->unsafe_shutdowns_hi = le64_to_cpu(log.unsafe_shutdowns[1]);
+    smart->media_errors_lo = le64_to_cpu(log.media_errors[0]);
+    smart->media_errors_hi = le64_to_cpu(log.media_errors[1]);
+    smart->number_of_error_log_entries_lo =
+        le64_to_cpu(log.number_of_error_log_entries[0]);
+    smart->number_of_error_log_entries_hi =
+        le64_to_cpu(log.number_of_error_log_entries[1]);
+
+    close(fd);
+}
+
+static void get_disk_smart(GuestDiskInfo *disk)
+{
+    if (disk->has_address
+        && (disk->address->bus_type == GUEST_DISK_BUS_TYPE_NVME)) {
+        get_nvme_smart(disk);
+    }
+}
+
 GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
 {
     GuestDiskInfoList *ret = NULL;
@@ -1464,6 +1536,7 @@ GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
         }
 
         get_disk_deps(disk_dir, disk);
+        get_disk_smart(disk);
         ret = get_disk_partitions(ret, de->d_name, disk_dir, dev_name);
     }
 
-- 
2.36.0.44.g0f828332d5ac


