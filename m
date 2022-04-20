Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7088507ED7
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 04:33:07 +0200 (CEST)
Received: from localhost ([::1]:52530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh09S-0000y9-Nd
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 22:33:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nh06T-0007J1-FP
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 22:30:01 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:54975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nh06R-0000bR-Vb
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 22:30:01 -0400
Received: by mail-pj1-x1031.google.com with SMTP id md4so571589pjb.4
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 19:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IZq204ud6fBz5lkG0Ev/lsOEGRkv42FQMj7Tl2ZsDWY=;
 b=Q6D4nhcq+rSi6LRl93ZU/0QdQGInTEdPHKn2tr1Ex4+2BaZIoDdcpqnELMqP1wzmo7
 Z9h1LQyCBy+p8eJq6jq7E5fYbtdz1RMJnQj2xOMvVmsv6EwIIeMARUJcG8Zw3Ez/wd4f
 VmefRHhd1rzLGvtaITIM8AYGm8j56vIOCobm14YOSY1zdzya1nab67rlcIbTvFFCMLRu
 wpdFbB49qMFHdwe+uHZBn4//iwK0RtVArfoo9at6PoVBhHyx13GoQuGWND237iOuZwQ1
 MuWWw+INIbtpitAQF1ut3tOTur/rpoqECLbHjIGWniThc18+yMUgvhXLEjPByQFZqCVA
 3UEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IZq204ud6fBz5lkG0Ev/lsOEGRkv42FQMj7Tl2ZsDWY=;
 b=1XeDFijGcq5uAn2RIv9NaNbK3M6GNjdjIPOl2gGUTf+RrWDJCnBLjsDae8tiGIeEck
 EqLt4T9OFMWq9/jqF201ZyKs+qfe7UHhsQwS++4tXS7y5wiZQDCOcy8pxF6zBlJM8CNU
 GVnnU3IbXAIiYOP5N8a4BnEDpkAGdRyhlAyy0bsB9CbXrtuvNKpKZ1KPhDDitpG6Ix3W
 aY2BFXCwGnWTzfbkAZMG3kpYewIF+M4IWJ8b9LWLqW2ehcwTgY5R82dQMTmc7vWbGewq
 0EnheeBXLq2r1LgyINM2RyGzthL4dBJ/3CF4K0c+ZT+GKQvjUcMhvTYmdpkn2E25+VUd
 mRVw==
X-Gm-Message-State: AOAM533DXrbu0IHC1TFxaLIm2Rb0rxpxBDXHJs6yfK9qCD4RooM9dBWS
 BWUeCrcOExWrRDmvw6J8WZrr5zTdJrjhBg==
X-Google-Smtp-Source: ABdhPJyldmYL59CuYo+b9BHexAap2m14JjBvatpFhz7St7EfqsxUE++Tc/CsjMKPUXrNWMNqiEfbXw==
X-Received: by 2002:a17:90a:d0c5:b0:1c9:ec78:18e5 with SMTP id
 y5-20020a17090ad0c500b001c9ec7818e5mr1807066pjw.53.1650421798717; 
 Tue, 19 Apr 2022 19:29:58 -0700 (PDT)
Received: from always-x1.bytedance.net ([61.120.150.70])
 by smtp.gmail.com with ESMTPSA id
 c64-20020a624e43000000b005081ec7d679sm17629625pfb.1.2022.04.19.19.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 19:29:58 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: michael.roth@amd.com,
	armbru@redhat.com
Subject: [PATCH v2 1/2] qga: Introduce NVMe disk bus type
Date: Wed, 20 Apr 2022 10:26:09 +0800
Message-Id: <20220420022610.418052-2-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220420022610.418052-1-pizhenwei@bytedance.com>
References: <20220420022610.418052-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1031.google.com
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
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 zhenwei pi <pizhenwei@bytedance.com>, f4bug@amsat.org
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

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index 94e4aacdcc..5ea76cfd1d 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -827,13 +827,14 @@
 # @mmc: Win multimedia card (MMC) bus type
 # @virtual: Win virtual bus type
 # @file-backed-virtual: Win file-backed bus type
+# @nvme: NVMe disks (since 7.1)
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


