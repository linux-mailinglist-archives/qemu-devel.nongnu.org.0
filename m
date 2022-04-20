Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8195507ED8
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 04:33:18 +0200 (CEST)
Received: from localhost ([::1]:53026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh09d-0001Ir-UM
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 22:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nh06c-0007U6-Vs
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 22:30:11 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:33306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nh06Y-0000oh-WB
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 22:30:08 -0400
Received: by mail-pf1-x433.google.com with SMTP id n22so646160pfa.0
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 19:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jUctx0Qvv4r3a5AvkhZ9HX88SyBEmkboL1xu34kADiE=;
 b=XbDCXMiW16tRkA3jW8NtQo26OqmJh9nE3i5UvFjFSn28E+ROOAgs4zU1bIzBeLT59e
 TV4EdP+9p+kwgE6daPxBGhutfxJNTXMT8ZftNSxBA4kQuVdZAQ/krdkbvFCwTjxk2SGG
 S8vp9tRItxUQ8hHwoEqUr0XvzxomSMtl2wABPddGJ9LCc+0p+UM84VFg2z1aE/vMn8Q1
 6eTIRS/WuXYFHSabCYN/VQDf8mFR5UaTR5bJpVLyR7iUROUEze1KEd81TxJZoiD8+2Xv
 xQrA08NUfcRbV5axUJycviDfA3TXbKYg1ozDU+QcXKKfvgL71MmK3DQSlLJCT/zO9iTI
 gJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jUctx0Qvv4r3a5AvkhZ9HX88SyBEmkboL1xu34kADiE=;
 b=5YXFzxk7OyRN3yVFJeHxugj4/FCaKRMRi3cV43Dm/vIOZnSkSGvxyKe+lydljp14nJ
 2C2z5g14kDRiwMh/G6+macgIiHNTV25+IyrH2VWH7fOnEWNPvZyTVXzRIjzgFIasMT0a
 sJtDew/0DzGYeKY21fe4hZ9fQPHLBnAhjCeeTt+pOPHZW9xHToX7CIc4aI79TwQZOXeE
 A6BOR2TtERgNpD++pRaJGnxGBxl5GLU0NHLbXL/5ZCIOZI4lDxwFyeoiV5tJ+iu1aXSW
 5LmqNYvQJt+LTsDPAKa8wUpNomFXjoM+fvKdnZLSrjl9CP0eMsKzXd952PuDViPXn/1e
 pFdw==
X-Gm-Message-State: AOAM530XVS6rz8UNWgvAeM3O7ZPHuMkMllgnnF4YSorHEbjlci1pcZBC
 ywCnu4MhJOmyHmagjazF5O5p7g==
X-Google-Smtp-Source: ABdhPJxkfbhUolBi25YeZxBsBDYdI3AeaU9qdfc09l6vl/jXCllcspylqiD3m48fyr5BDOsjwtlzow==
X-Received: by 2002:a05:6a00:338a:b0:50a:b6b4:8a21 with SMTP id
 cm10-20020a056a00338a00b0050ab6b48a21mr3545216pfb.66.1650421805436; 
 Tue, 19 Apr 2022 19:30:05 -0700 (PDT)
Received: from always-x1.bytedance.net ([61.120.150.70])
 by smtp.gmail.com with ESMTPSA id
 c64-20020a624e43000000b005081ec7d679sm17629625pfb.1.2022.04.19.19.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 19:30:04 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: michael.roth@amd.com,
	armbru@redhat.com
Subject: [PATCH v2 2/2] qga: Introduce disk smart
Date: Wed, 20 Apr 2022 10:26:10 +0800
Message-Id: <20220420022610.418052-3-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220420022610.418052-1-pizhenwei@bytedance.com>
References: <20220420022610.418052-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Keith Busch <kbusch@kernel.org>, marcandre.lureau@redhat.com,
 qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>, f4bug@amsat.org
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
index 5ea76cfd1d..4d8e506c9e 100644
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
-- 
2.20.1


