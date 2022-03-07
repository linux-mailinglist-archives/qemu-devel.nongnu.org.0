Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 995444CF009
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 04:10:21 +0100 (CET)
Received: from localhost ([::1]:38964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR3lM-0006CC-7u
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 22:10:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nR3k3-0005Vm-2d
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 22:08:59 -0500
Received: from [2607:f8b0:4864:20::429] (port=37495
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nR3jy-0007D1-6K
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 22:08:56 -0500
Received: by mail-pf1-x429.google.com with SMTP id t5so12558571pfg.4
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 19:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p+SZ29/dJL+5AoiirdF+F0ttQXbOMPQjl254ulX2NHg=;
 b=53KZJkLm7KCR6XAUtHQd0jxCC8iFsgckGL0h7aNZBTFJVbhikosCLkh7OeyZlX6rqv
 7Xqfvv36GkaDuK0gYdPbmGzFWiQygNNN7P42DArlFD1ehyL/T3HMkdY5vyJDosLI9GQ8
 BFmc7pji3Roh6YFFMOqnBQiCq4oZAnZ8HcXfjKXzk+P6BFVO/3WGcduT+O10ADjoTZLp
 6hswsy6RSo6eR8tIBpfN/gA5qQNYDRfsRlBmXiWazaTRrsCR5vEOprRp/iEtTlUoC+hF
 dKNv3UArnzxr2Vwm/Fz7ABBzMUGHbv9rrBQqTpLqmZdTa/n+P2wPi5gcAH3hQhzH2Fo+
 /9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p+SZ29/dJL+5AoiirdF+F0ttQXbOMPQjl254ulX2NHg=;
 b=QuIyJ35rGMj8kH0cRWaPvUP2dh/pBh5jjkMOWjchktdvSt1TWJYW4VqptqusXBUldi
 upxJwWhsLGjPMFkZUTxRX+Jo5NvBvG3USnMf4CEqIMw2eA+gXAnWp7WoFz6KteDoi/Kf
 tLfXuBqztvnSNZDbbQ094/BMbS7KlUHoIn7KLZrVX3A3gHiYOyO3O+sucoXIfFRyJGF5
 e/bMBruPVha71ivffDFUneNMqI6VD5VfhMkjAT1roHhkPPKTeEa2UZXTW7qdrkkYNCJH
 Twfab78Hoz3zoTdMgGzuiogF9u7JgsQLbq1nqlfJVEtLI30Lks0JBbRwiejLQ1QON4t8
 4JgA==
X-Gm-Message-State: AOAM5304oB2NIY5/0k3IEGwNNlktGjDnC2OiqFljfHF0xK6GkG83VRZ9
 LEtFeb6DT9i53Htj0Fm8m5kjRQ==
X-Google-Smtp-Source: ABdhPJz0Kw20Nz603xiZD4bK7FUxNqBRwpsCAoUuZLH5BhFmr5HNchegso/FfHlAQhB87nKSjIXWig==
X-Received: by 2002:a62:7bc4:0:b0:4f6:aaa1:91f8 with SMTP id
 w187-20020a627bc4000000b004f6aaa191f8mr10693530pfc.48.1646622531560; 
 Sun, 06 Mar 2022 19:08:51 -0800 (PST)
Received: from always-x1.bytedance.net ([61.120.150.76])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a056a00194900b004e1583f88a2sm13334328pfk.0.2022.03.06.19.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 19:08:50 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: philippe.mathieu.daude@gmail.com,
	michael.roth@amd.com
Subject: [PATCH v2] qga: Introduce disk smart
Date: Mon,  7 Mar 2022 11:05:54 +0800
Message-Id: <20220307030554.1373672-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pf1-x429.google.com
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
Cc: Keith Busch <kbusch@kernel.org>, armbru@redhat.com,
 zhenwei pi <pizhenwei@bytedance.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After assigning a NVMe/SCSI controller to guest by VFIO, we lose
everything on the host side. A guest uses these devices exclusively,
we usually don't care the actions on these devices. But there is a
low probability that hitting physical hardware warning, we need a
chance to get the basic smart log info.

Introduce disk smart, and implement NVMe smart on linux.

CC: Keith Busch <kbusch@kernel.org>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 qga/commands-posix.c | 78 ++++++++++++++++++++++++++++++++++++++++++++
 qga/qapi-schema.json | 50 +++++++++++++++++++++++++++-
 2 files changed, 127 insertions(+), 1 deletion(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 4ec83bbfbc..2301bd43ca 100644
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
@@ -1390,6 +1392,81 @@ static GuestDiskInfoList *get_disk_partitions(
     return ret;
 }
 
+static void get_disk_smart(GuestDiskInfo *disk)
+{
+    if (disk->has_address
+        && (disk->address->bus_type == GUEST_DISK_BUS_TYPE_NVME)) {
+        int fd;
+        GuestDiskSmart *smart;
+        NvmeSmartLog log = {0};
+        struct nvme_admin_cmd cmd = {
+            .opcode = NVME_ADM_CMD_GET_LOG_PAGE,
+            .nsid = NVME_NSID_BROADCAST,
+            .addr = (uint64_t)&log,
+            .data_len = sizeof(log),
+            .cdw10 = NVME_LOG_SMART_INFO | (1 << 15) /* RAE bit */
+                     | (((sizeof(log) >> 2) - 1) << 16)
+        };
+
+        fd = qemu_open_old(disk->name, O_RDONLY);
+        if (fd == -1) {
+            g_debug("Failed to open device: %s", disk->name);
+            return;
+        }
+        if (ioctl(fd, NVME_IOCTL_ADMIN_CMD, &cmd)) {
+            g_debug("Failed to get smart: %s", disk->name);
+            close(fd);
+            return;
+        }
+
+        smart = g_new0(GuestDiskSmart, 1);
+        smart->type = GUEST_DISK_BUS_TYPE_NVME;
+        smart->u.nvme.critical_warning = log.critical_warning;
+        /* unaligned 'temperature' field */
+        stw_le_p(&smart->u.nvme.temperature, log.temperature);
+        smart->u.nvme.available_spare = log.available_spare;
+        smart->u.nvme.available_spare_threshold = log.available_spare_threshold;
+        smart->u.nvme.percentage_used = log.percentage_used;
+        smart->u.nvme.data_units_read_lo = le64_to_cpu(log.data_units_read[0]);
+        smart->u.nvme.data_units_read_hi = le64_to_cpu(log.data_units_read[1]);
+        smart->u.nvme.data_units_written_lo =
+            le64_to_cpu(log.data_units_written[0]);
+        smart->u.nvme.data_units_written_hi =
+            le64_to_cpu(log.data_units_written[1]);
+        smart->u.nvme.host_read_commands_lo =
+            le64_to_cpu(log.host_read_commands[0]);
+        smart->u.nvme.host_read_commands_hi =
+            le64_to_cpu(log.host_read_commands[1]);
+        smart->u.nvme.host_write_commands_lo =
+            le64_to_cpu(log.host_write_commands[0]);
+        smart->u.nvme.host_write_commands_hi =
+            le64_to_cpu(log.host_write_commands[1]);
+        smart->u.nvme.controller_busy_time_lo =
+            le64_to_cpu(log.controller_busy_time[0]);
+        smart->u.nvme.controller_busy_time_hi =
+            le64_to_cpu(log.controller_busy_time[1]);
+        smart->u.nvme.power_cycles_lo = le64_to_cpu(log.power_cycles[0]);
+        smart->u.nvme.power_cycles_hi = le64_to_cpu(log.power_cycles[1]);
+        smart->u.nvme.power_on_hours_lo = le64_to_cpu(log.power_on_hours[0]);
+        smart->u.nvme.power_on_hours_hi = le64_to_cpu(log.power_on_hours[1]);
+        smart->u.nvme.unsafe_shutdowns_lo =
+            le64_to_cpu(log.unsafe_shutdowns[0]);
+        smart->u.nvme.unsafe_shutdowns_hi =
+            le64_to_cpu(log.unsafe_shutdowns[1]);
+        smart->u.nvme.media_errors_lo = le64_to_cpu(log.media_errors[0]);
+        smart->u.nvme.media_errors_hi = le64_to_cpu(log.media_errors[1]);
+        smart->u.nvme.number_of_error_log_entries_lo =
+            le64_to_cpu(log.number_of_error_log_entries[0]);
+        smart->u.nvme.number_of_error_log_entries_hi =
+            le64_to_cpu(log.number_of_error_log_entries[1]);
+
+        disk->has_smart = true;
+        disk->smart = smart;
+
+        close(fd);
+    }
+}
+
 GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
 {
     GuestDiskInfoList *ret = NULL;
@@ -1463,6 +1540,7 @@ GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
         }
 
         get_disk_deps(disk_dir, disk);
+        get_disk_smart(disk);
         ret = get_disk_partitions(ret, de->d_name, disk_dir, dev_name);
     }
 
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index 8f73770210..8bb8731ce4 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -888,6 +888,53 @@
            '*serial': 'str', '*dev': 'str',
            '*ccw-address': 'GuestCCWAddress'} }
 
+##
+# @GuestNVMeSmart:
+#
+# NVMe smart informations, base on NVMe specification
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
+# Smart of disk
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
@@ -904,7 +951,8 @@
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


