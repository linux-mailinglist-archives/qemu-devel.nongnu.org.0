Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5294CA2A4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:01:18 +0100 (CET)
Received: from localhost ([::1]:52638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPMjN-0002kg-Hm
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:01:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nPMhM-00021e-4O
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 05:59:12 -0500
Received: from [2607:f8b0:4864:20::42f] (port=35616
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nPMhH-0008N0-VF
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 05:59:09 -0500
Received: by mail-pf1-x42f.google.com with SMTP id k1so1626190pfu.2
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 02:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=39yhNF6sCXSK4Cn0/oV3HNd4S+Jmkrax5ScpTjlpFLA=;
 b=kisM+EZdH5g2A4EXCvU3r3orN95D9WgCEM37fR/OPkzNX5t7CLh+qFlNYYTVLfV2Zg
 sRFOZpgeM/sEmgts9MB7vefZLHGpqByv8rKo3WuAs1wCF6MH6hN/CLckj0F3PPE89W6b
 HZ5dlF5ftJBHW55WJPOrH21PssvrgIUFtVZtqRBmh2ndQAYPZmC2qR2JmL+tz6WgscTr
 zBu4h7joiFEMZBmdg0c33nutNjKp4hBp6xteAVgTDtJ2ED5x8+NEZO4m86AW+BOdJxmJ
 /aGmzmb9bEYiDLFAuvhsiL8V/ZYgju9xv6G4SP9AMZ8cO4q5ATnOMGLj2GEhFXCUaBl+
 gqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=39yhNF6sCXSK4Cn0/oV3HNd4S+Jmkrax5ScpTjlpFLA=;
 b=NU2BqSypCMrql1DqbpKs23rrePpS30v5vfp50ErTHcfMrBGxuhHrQWgt6PK9WTZDbv
 ZUG9VnWmyV4lmOZp1IPWYxXc4VZZ4Nk5+wiwzywcLy/qkfIv+JnSx6d8n+lz53QsWv8V
 UjA1PbYpRrSJbtBurHrl85FxMv6KAVN6SChRBb9ehDbKVcSQz2YTECN/TqI0MefbCIPE
 zS1cyefYGivBcfVvxrvDsIl9GcLJsF4/SQLv1Uc8Wn/ZcgQA81gyrY25RN7QZc39YPSr
 A7IlwIBnJJkpS6a4UfQ+N6liLXsAughD1o0fAvTj61ehSyNP70vmlYz7gjGYPTScuiIn
 JF2g==
X-Gm-Message-State: AOAM532X/KGTDFnjlifrpp0/PdBImIN1vah1UCAkv6lPbFGV+cEpKzN+
 yBgV/Koc1oFU+RCj5FQBunJiYw==
X-Google-Smtp-Source: ABdhPJz0RTObeSHwkTFGMPsLRvn0MoXDhJoKg2qMUUb0onm8v2XqgWJc/lAEGYOiOw0+zOSY5sXUHg==
X-Received: by 2002:a65:66ca:0:b0:363:d22a:29c4 with SMTP id
 c10-20020a6566ca000000b00363d22a29c4mr25687983pgw.398.1646218745560; 
 Wed, 02 Mar 2022 02:59:05 -0800 (PST)
Received: from always-x1.bytedance.net ([61.120.150.76])
 by smtp.gmail.com with ESMTPSA id
 8-20020a056a00070800b004e14ae3e8d7sm19918866pfl.164.2022.03.02.02.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 02:59:05 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: armbru@redhat.com
Subject: [RESEND] qga: Introduce NVMe disk bus type
Date: Wed,  2 Mar 2022 18:56:10 +0800
Message-Id: <20220302105610.1304166-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pf1-x42f.google.com
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
Cc: michael.roth@amd.com, qemu-devel@nongnu.org,
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
index 94e4aacdcc..1b5ea4c5f8 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -827,13 +827,14 @@
 # @mmc: Win multimedia card (MMC) bus type
 # @virtual: Win virtual bus type
 # @file-backed-virtual: Win file-backed bus type
+# @nvme: NVMe disks
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


