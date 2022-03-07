Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 158C74CF3EC
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 09:47:45 +0100 (CET)
Received: from localhost ([::1]:52308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR91s-0004ye-63
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 03:47:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nR90Q-0004EM-7i
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 03:46:14 -0500
Received: from [2607:f8b0:4864:20::532] (port=35729
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nR90L-00082F-4c
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 03:46:11 -0500
Received: by mail-pg1-x532.google.com with SMTP id e6so12993838pgn.2
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 00:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kZjEb3rm/x8/PUOmaFhmx82rfY+NWT5FkkQxJ8bEnRY=;
 b=M9gCCJv5Uq8Y0BPdPWYa20h27UrC0bSJSC13+F+NuyJa51ntpDDCF37CNETXWqV4+w
 e10TBE0re+V6Hcol627xZ4kyLnuDYvv5OqO+RJi4fy9D2d2pLTtn6ziUdZ+WSU9RiWFj
 fRXEEACBOePz9+rZ+Us/EdAYCS7Dp1iKoOf+aHcO2yo+HiPhzjpBGPuyaw59VVfjPdcH
 q6BQ7Gsa22cTvKUXBaCrnKUf6W0lRhre4uvOnpqfGWJKT/in6BFtBjPsP5mBk6PLECum
 SU6hXdGLlqQVvkMfP4UE8vTKz2zy8x4eg9k3Xf11gMKR4DMuCpepz02p4p1oIA4k5jx7
 N4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kZjEb3rm/x8/PUOmaFhmx82rfY+NWT5FkkQxJ8bEnRY=;
 b=p/xuAHsXgmd1vCSE+GqK6fblDMdPHe2waF9rFH4idYuzx12Uo0pNbwTaF8k+Mq6hB3
 giQ2C5MJLgjMhISEe3tpxWFi3QgmLxmaPEUfGb3d7UxY2Cd6JJybAk/jz3Hq+b9/WWiC
 0EyGAKkgsSABC/dcw3Tz3G5PyCB1JOrBevE/lITEAVVo/ZnAGoaI0UcQGRQQB5q5qdn9
 XLe6Lv5wWLfP9impOkeXMwgsxPn2f35+Xm8GAjtELPs2uUm+yErbs99qNz91zBqYZTYE
 GutIlRN1JyzlkdeZtKaBrJVYao8Qy99SY/zXEmPQJCjg7Xx2HfBSPKznt6eXN+fZX4iE
 GREA==
X-Gm-Message-State: AOAM531FKKhItaaa5yWROahvaJHXpVVtR+taKjfQcrXpa+JU3w1oPQeF
 XIKRYC3PHNDeUmJCQ0N3NH0fZw==
X-Google-Smtp-Source: ABdhPJw5lDsjHwQt5zRFbo/THvPbPHwOqlFUOpG7dC5r/CDt0fuOhl12tif71FpWfpaw97Kb471sHg==
X-Received: by 2002:a65:4348:0:b0:375:9840:b064 with SMTP id
 k8-20020a654348000000b003759840b064mr9159976pgq.270.1646642767399; 
 Mon, 07 Mar 2022 00:46:07 -0800 (PST)
Received: from always-x1.bytedance.net ([61.120.150.76])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a056a000b8a00b004de9129eb80sm15973825pfj.85.2022.03.07.00.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 00:46:06 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: michael.roth@amd.com
Subject: [PATCH v3] qga: Introduce disk smart
Date: Mon,  7 Mar 2022 16:43:07 +0800
Message-Id: <20220307084307.1379107-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pg1-x532.google.com
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
Cc: armbru@redhat.com, zhenwei pi <pizhenwei@bytedance.com>,
 qemu-devel@nongnu.org, philippe.mathieu.daude@gmail.com,
 Keith Busch <kbusch@kernel.org>, marcandre.lureau@gmail.com
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
index 8f73770210..bbfb817347 100644
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
2.20.1


