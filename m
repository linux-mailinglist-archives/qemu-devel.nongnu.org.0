Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEE14E5040
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 11:26:11 +0100 (CET)
Received: from localhost ([::1]:38340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWyBt-0006b6-Or
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 06:26:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nWy9Q-0005G1-Gv
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 06:23:36 -0400
Received: from [2607:f8b0:4864:20::429] (port=39490
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nWy9K-0001CT-Gw
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 06:23:33 -0400
Received: by mail-pf1-x429.google.com with SMTP id u22so1157079pfg.6
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 03:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lNP74VzTy4Ut4laPr89cQYkBOjiSKGaavJx5ft/sk2U=;
 b=Jiv4dKsC6sZHJqAEvTCWGMQ3uyHgY0lGctIi4mN6yHw4Lg6+7rVr/dh/op/rq6LLza
 the5r+H3m52D76CpcBiWNWDHJwMKo0BIEn43G5ou/Us7lYL7cbKBnmZKXIrJl01iTNkt
 tz53Mmw7RSGkufNCSt9Js+768ivH5w0sTv9Pf/XY7V5YBrVPpekr8JLYHsIC2X0dm6JH
 Ew6Uo1Ii1V3pkoCIge66zU7de7GAVFdzzUL//7gm/wYNVk7NJ+wUCG8NVZCBQzWDalWu
 cmM910FrNzh13oqHNj8VFx4YJKn/3+ow2CXElehEiBvT8K+dk/8fmo28o1uNFIyxyUfb
 7HQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lNP74VzTy4Ut4laPr89cQYkBOjiSKGaavJx5ft/sk2U=;
 b=0aPh/ID7G3O8AGBV0qL9WbL6tdlDuU0wTLyS8Bm9qhYz2QD08nwOZ+8xakhw6c10+Q
 7eSUxOOunVFIbIcByS74eqQA6exZT4W1r62fdE5rKPqJWPDI0q67wXJa5u/fbmbtVOk0
 dk3acDERMNvKcitXsMpJPp0ZQOXF98+tEZd8iJ79PfAgUODdVOdUdVpx9OYovn3wrvJV
 8GyoOwuSYXaOn4b3QYc5XT/l0yxMKtB+pmvg8JPofw0E4WCGr+Elc2+bbwDA6teNJXbS
 IT31xv7X2iK58nPLp1gw3oTdI5MZpQ9puLmrnM2cOyspakSnZ/8QNjIy+TsXtEPR/wSE
 uhpg==
X-Gm-Message-State: AOAM531CqrBEzx88KSfs/9rO/566Px6qYwEjQ38/Ks1YELwMryjzN6Ey
 +M+xUyuNBS7VmGHAJDMge5vZ5WD8CwnPPRiH
X-Google-Smtp-Source: ABdhPJxnQt1EZHQlG8lph9rjq7ncT98/iD8QJF6BuJ6nEKuOg1B7obzPb4BitCO1HK/UdmG7ALyRzQ==
X-Received: by 2002:a63:7216:0:b0:382:3f32:cdb2 with SMTP id
 n22-20020a637216000000b003823f32cdb2mr18197322pgc.253.1648031008667; 
 Wed, 23 Mar 2022 03:23:28 -0700 (PDT)
Received: from always-x1.www.tendawifi.com ([139.177.225.224])
 by smtp.gmail.com with ESMTPSA id
 124-20020a621682000000b004f6a2e59a4dsm24778765pfw.121.2022.03.23.03.23.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 03:23:28 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: armbru@redhat.com,
	michael.roth@amd.com
Subject: [RESEND 1/2] qga: Introduce NVMe disk bus type
Date: Wed, 23 Mar 2022 18:19:57 +0800
Message-Id: <20220323101958.300848-2-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220323101958.300848-1-pizhenwei@bytedance.com>
References: <20220323101958.300848-1-pizhenwei@bytedance.com>
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
Cc: qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>
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
index 94e4aacdcc..4ea2a50228 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -827,13 +827,14 @@
 # @mmc: Win multimedia card (MMC) bus type
 # @virtual: Win virtual bus type
 # @file-backed-virtual: Win file-backed bus type
+# @nvme: NVMe disks (since 7.0)
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
2.25.1


