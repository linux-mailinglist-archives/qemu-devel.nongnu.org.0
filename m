Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2B94E5042
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 11:26:22 +0100 (CET)
Received: from localhost ([::1]:38412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWyC3-0006dp-El
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 06:26:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nWy9Q-0005G8-U8
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 06:23:37 -0400
Received: from [2607:f8b0:4864:20::102d] (port=56130
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nWy9N-0001D6-Bg
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 06:23:34 -0400
Received: by mail-pj1-x102d.google.com with SMTP id jx9so1216351pjb.5
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 03:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gpuSROt/QpYl/pOGRvtl+SrlH38ZvQjd791fDET2MpA=;
 b=IXKFl3mVXNFHX1zo41E3dEmSDIaSyjpNoITHo8iv8AFEbJA/ChrBXZ22r3te6tmbGE
 XjPOkYf2Cir2CYgmy8IxR52CfN/NebRftgBsu2ybs7UPl0Ven2XJ8W2YtX3KkSvKSRo4
 MYg7MzHOMMhDe1ypnw5Hb9MKb6Y+lzqTMchESLqfMFcu/+vvNkhIgl2f9VCnMaCetVLs
 +PjxvNoAr2DNL22hWS0nw9G24kNKTXiH4f+WP+d52UcOlYwsURe5GxxOtDi+PPFQhcMH
 cpeCnf5p/Qw877pbM5TmqvEy9kyZY8PoOYkux3bXL3Hey8+YbAHwIG9xZ211TLb1t3US
 SyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gpuSROt/QpYl/pOGRvtl+SrlH38ZvQjd791fDET2MpA=;
 b=CHpI6+APqqW4dbFOBNA7waA55/77zi1DL4MRB77PM4gjD61Vyv1FPo1yHz0q5zqK9u
 97wguAdjKFFKhM7S3CVxhNsMrjbysYu+qGDdNdLcCvSbJyYqqcDMR2azuScNam8o3zUh
 fLJL3JLqO4w/YjUyJ5JG8ZSX2EEQ9SFP+QbpjDP5KcA7Re192JhHBZEhFXOH5hI47XFA
 Z6QBPG2XgndtaH4rGc0+AopRJAittEkPc7gCkMFq5IB9OnEhi20r3AAcTEweN35vPb3v
 Zm0colO3UtLVSIFn+dJaNz1AXHGfUT9HrVEJYr3P6AD04Iu2X9r5V2DIM9Mby5dx7qI0
 LDMg==
X-Gm-Message-State: AOAM531jy0gO/k49jhYV0wzo98wROEu4zsx0rNjDqWuXLLCMi6Bron1t
 8EyT4W/tI8cWw4XVe2RYTY16H63x95+eVqN+
X-Google-Smtp-Source: ABdhPJwzy55AHuptgi6IPYyWp8P4A5vSlpegeq/w6q0AsaGU9z9LBMiTC4UzAJYiBtRIejclu9A8gQ==
X-Received: by 2002:a17:902:ac88:b0:153:a34f:5648 with SMTP id
 h8-20020a170902ac8800b00153a34f5648mr23265530plr.121.1648031012013; 
 Wed, 23 Mar 2022 03:23:32 -0700 (PDT)
Received: from always-x1.www.tendawifi.com ([139.177.225.224])
 by smtp.gmail.com with ESMTPSA id
 124-20020a621682000000b004f6a2e59a4dsm24778765pfw.121.2022.03.23.03.23.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 03:23:31 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: armbru@redhat.com,
	michael.roth@amd.com
Subject: [RESEND 2/2] qga: Introduce disk smart
Date: Wed, 23 Mar 2022 18:19:58 +0800
Message-Id: <20220323101958.300848-3-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220323101958.300848-1-pizhenwei@bytedance.com>
References: <20220323101958.300848-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 qga/commands-posix.c | 73 ++++++++++++++++++++++++++++++++++++++++++++
 qga/qapi-schema.json | 53 +++++++++++++++++++++++++++++++-
 2 files changed, 125 insertions(+), 1 deletion(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 4ec83bbfbc..383bbebe42 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -27,6 +27,7 @@
 #include "qemu/base64.h"
 #include "qemu/cutils.h"
 #include "commands-common.h"
+#include "block/nvme.h"
 
 #ifdef HAVE_UTMPX
 #include <utmpx.h>
@@ -49,6 +50,7 @@ extern char **environ;
 #include <sys/socket.h>
 #include <net/if.h>
 #include <sys/statvfs.h>
+#include <linux/nvme_ioctl.h>
 
 #ifdef CONFIG_LIBUDEV
 #include <libudev.h>
@@ -1390,6 +1392,76 @@ static GuestDiskInfoList *get_disk_partitions(
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
+        .addr = (uint64_t)&log,
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
@@ -1463,6 +1535,7 @@ GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
         }
 
         get_disk_deps(disk_dir, disk);
+        get_disk_smart(disk);
         ret = get_disk_partitions(ret, de->d_name, disk_dir, dev_name);
     }
 
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index 4ea2a50228..228703f209 100644
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
+# Since: 7.0
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
+# Since: 7.0
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
+# @smart: disk smart information (Since 7.0)
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
-- 
2.25.1


