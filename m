Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C70A04CBAEF
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 11:03:23 +0100 (CET)
Received: from localhost ([::1]:37148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPiIs-00064M-UI
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 05:03:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nPiHI-0004VB-BV
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 05:01:45 -0500
Received: from [2607:f8b0:4864:20::531] (port=35631
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nPiHE-0004vK-2y
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 05:01:41 -0500
Received: by mail-pg1-x531.google.com with SMTP id e6so4087231pgn.2
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 02:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NMb1xS8bGnsMk3XQXMqK8Rp9EF2+Kn+FjYw4Ki6L73s=;
 b=yTJ6d/Ii7xgkck+LqNPJoua78nqvWByCsXrwK1qW1h/gsKZoOFfy9RG8cHI9wMACmx
 79lHohp08sIjQWNvh/49MGkBxt8ajzSh4KWTiJLSurXepcxlTc9ZQtCPXNOeJF+9HeFP
 gcG97wgD/5o/3T33QK9UosnxOLVI7IQiiXtr58bxR7Ym9gH3UQ3gAnUKVd7geQeOUKBS
 +ZRxLhxRmIDAL73f8GZzMKyGGpbDkS3UbxFxRs2bAudM2jLIWQ0phlgsZH2P1iK3AjBR
 ny2YJXsBV+juEM/EmHLyLhq89Au+yc6podBXrk5vZwinIdhlBmfacuG8QLUodz9iqyQ8
 V+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NMb1xS8bGnsMk3XQXMqK8Rp9EF2+Kn+FjYw4Ki6L73s=;
 b=Eh70V/QcQpcodi7rqZLrT8g63GEYfESutpweLkigGu1EpLKI9dO6fs4MB0rfHtR3GD
 Ks10PyB1e/y1NXzJTH6OS3k4R7XmuA3iKY3gDsuIO/vHWmCYlG+ljLTN2fbSV/TmDu1G
 XroWxKAcrgHUfCCeg5VZ077mBxX3lLDWfRtSA0WkiKx0eEAJ4PTsryqJ4WsGV+XqGu9X
 8L9oJ8pRJAGV1/Nbrc7wQ1+OkTWvPM9HbSEEyj4bQZJsplwyKjTt9+/tqtnpcQuA3cQX
 gRB91qZSEunTEFxi9+7zU/yqmZbauQPR4wQBPxMp22vXwsBrXYTDKxlWg8kYY8dLk/l6
 jEhg==
X-Gm-Message-State: AOAM530IRk8CPkV0Z9rLXQ0/WEJ6p7rlY5wGDssZxE6XIzp2bAKcknO3
 rscpMCjII24fmklsb2eRfCE1QA==
X-Google-Smtp-Source: ABdhPJxQU4GdqnYNhTYvoiOtwaxLCvw8vpeTrWsNWr4SblK+YtNxVfKeok3VUnu/+lp16TcxPaCEmw==
X-Received: by 2002:a05:6a00:be5:b0:4e1:9050:1e16 with SMTP id
 x37-20020a056a000be500b004e190501e16mr37662235pfu.78.1646301696460; 
 Thu, 03 Mar 2022 02:01:36 -0800 (PST)
Received: from always-x1.bytedance.net ([61.120.150.76])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a056a00244300b004bc9397d3d0sm1885478pfj.103.2022.03.03.02.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 02:01:35 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: armbru@redhat.com
Subject: [PATCH v2] qga: Introduce NVMe disk bus type
Date: Thu,  3 Mar 2022 17:58:40 +0800
Message-Id: <20220303095840.1318239-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pg1-x531.google.com
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
Cc: michael.roth@amd.com, marcandre.lureau@gmail.com, qemu-devel@nongnu.org,
 zhenwei pi <pizhenwei@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Assigning a NVMe disk by VFIO or emulating a NVMe controller by QEMU,
a NVMe disk get exposed in guest side. Support NVMe disk bus type and
implement posix version.

Test PCI passthrough case:
~#virsh qemu-agent-command buster '{"execute":"guest-get-disks"}' | jq
  ...
    {
      "name": "/dev/nvme0n1",
      "dependencies": [],
      "partition": false,
      "address": {
        "serial": "SAMSUNG MZQL23T8HCLS-00A07_S64HNE0N500076",
        "bus-type": "nvme",
        "bus": 0,
        "unit": 0,
        "pci-controller": {
          "bus": 0,
          "slot": 22,
          "domain": 0,
          "function": 0
        },
        "dev": "/dev/nvme0n1",
        "target": 0
      }
  ...

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 qga/commands-posix.c | 5 ++++-
 qga/qapi-schema.json | 3 ++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 75dbaab68e..4ec83bbfbc 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -889,7 +889,8 @@ static bool build_guest_fsinfo_for_pci_dev(char const *syspath,
         if (driver && (g_str_equal(driver, "ata_piix") ||
                        g_str_equal(driver, "sym53c8xx") ||
                        g_str_equal(driver, "virtio-pci") ||
-                       g_str_equal(driver, "ahci"))) {
+                       g_str_equal(driver, "ahci") ||
+                       g_str_equal(driver, "nvme"))) {
             break;
         }
 
@@ -984,6 +985,8 @@ static bool build_guest_fsinfo_for_pci_dev(char const *syspath,
             g_debug("no host for '%s' (driver '%s')", syspath, driver);
             goto cleanup;
         }
+    } else if (strcmp(driver, "nvme") == 0) {
+        disk->bus_type = GUEST_DISK_BUS_TYPE_NVME;
     } else {
         g_debug("unknown driver '%s' (sysfs path '%s')", driver, syspath);
         goto cleanup;
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index 94e4aacdcc..8f73770210 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -827,13 +827,14 @@
 # @mmc: Win multimedia card (MMC) bus type
 # @virtual: Win virtual bus type
 # @file-backed-virtual: Win file-backed bus type
+# @nvme: NVMe disks (since 6.3)
 #
 # Since: 2.2; 'Unknown' and all entries below since 2.4
 ##
 { 'enum': 'GuestDiskBusType',
   'data': [ 'ide', 'fdc', 'scsi', 'virtio', 'xen', 'usb', 'uml', 'sata',
             'sd', 'unknown', 'ieee1394', 'ssa', 'fibre', 'raid', 'iscsi',
-            'sas', 'mmc', 'virtual', 'file-backed-virtual' ] }
+            'sas', 'mmc', 'virtual', 'file-backed-virtual', 'nvme' ] }
 
 
 ##
-- 
2.20.1


