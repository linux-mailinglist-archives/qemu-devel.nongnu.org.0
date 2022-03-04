Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A56E34CD095
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 09:59:43 +0100 (CET)
Received: from localhost ([::1]:44948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ3mo-0001EW-6J
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 03:59:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nQ3kN-0008K8-Pn
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 03:57:13 -0500
Received: from [2607:f8b0:4864:20::42c] (port=40540
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nQ3kI-00008z-G9
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 03:57:09 -0500
Received: by mail-pf1-x42c.google.com with SMTP id z15so7091317pfe.7
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 00:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cjNk5Yq2Z+OH0AoH68HBBHqDufbJkN58tYmMwsEhW4w=;
 b=JPqa5otzR9Vj82837eKCjKF9/qTXSF+gThKZs8qxcmwYvHjPollPsklffWxzv+2ni5
 wlmWWFFLWmYr5pLuC6QODm59HVTieTEhOI2In/yNRoUyNqB4zyEeS3z8S/+VYwVs9z7P
 DrfbOzTB98O+n5g+U8GFhUxXlNL4G6PuXh1HIMe/8y+mhT18P2Vgae02xcAXP1rgBbtS
 RiONQEovtCxFIfYo7Zc7ChHR+8LJVbLVtFa/vc+kcdcVhntwSnwDcinfst8tFpz4CWSf
 h+CFHge0tpcIEmEaLu4JWaJ7Da5/DVS56gV5yj6vGbDiXjPY1SKf+7+jy3fVT1eAHyoK
 NyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cjNk5Yq2Z+OH0AoH68HBBHqDufbJkN58tYmMwsEhW4w=;
 b=ypRdRUaVbMMJMFvs3/fEu1vn9IlVQErKutaOeeOeERbmplyjIbPzCIk2Q2ICWIzDlw
 TGMmHTi9Ucw1C6hD0ZIo7xPozYj3cJO8Kpw/vCrYy/qTyfxpaRyiOQlc04UOGSIc6iZv
 KOgwGGrfr7BhGFtBpj+nb+O0FqAA8DBKDZtluX74rciRDa6q6VFNPF3ih8Cepz6P8Sdv
 Bypc0m8CJ6t9RF/7zEcEdQ+8M+bleHUNfK3ELEIWW46QuuLvqovK5e5zUJglqBWRJs1W
 K+1U5zssFwsaKwy8uujselifmUHoWHnMJg1Jx1/8+jiKFQXKxvFvzSkRFkzm1liC+nKg
 j3Sg==
X-Gm-Message-State: AOAM533DEMwABl3xEKki2Irzn7aRBLao/W6IkubBIwIEJTiwGb1nFneJ
 igMKVmumQyBcrdxeiqqcvhTV4A==
X-Google-Smtp-Source: ABdhPJwP3HK6Go2XcMZ8hP5PJShuuLJrLCYI6w3IkSHNvDdpEn5XUSVRY97Em2p5nN+E7mWbtNOPmw==
X-Received: by 2002:a63:e52:0:b0:374:7b9f:1467 with SMTP id
 18-20020a630e52000000b003747b9f1467mr32788215pgo.178.1646384224494; 
 Fri, 04 Mar 2022 00:57:04 -0800 (PST)
Received: from always-x1.bytedance.net ([61.120.150.76])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a056a00004b00b004f6907b2cd3sm3598757pfk.122.2022.03.04.00.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 00:57:03 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: philippe.mathieu.daude@gmail.com,
	michael.roth@amd.com
Subject: [PATCH] qga: Introduce disk smart
Date: Fri,  4 Mar 2022 16:54:07 +0800
Message-Id: <20220304085407.1334358-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pf1-x42c.google.com
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
 qga/commands-posix.c | 77 ++++++++++++++++++++++++++++++++++++++++++++
 qga/qapi-schema.json | 50 +++++++++++++++++++++++++++-
 2 files changed, 126 insertions(+), 1 deletion(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 4ec83bbfbc..f08c9bea14 100644
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
@@ -1390,6 +1392,80 @@ static GuestDiskInfoList *get_disk_partitions(
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
+        smart->u.nvme.temperature = le16_to_cpu(log.temperature);
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
@@ -1463,6 +1539,7 @@ GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
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


