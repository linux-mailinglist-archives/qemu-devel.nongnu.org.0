Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA254CA027
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 09:59:58 +0100 (CET)
Received: from localhost ([::1]:55946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPKpx-00022W-5g
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 03:59:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nPKnM-0000W6-BM
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 03:57:18 -0500
Received: from [2607:f8b0:4864:20::534] (port=35734
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nPKnJ-0005r7-Pp
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 03:57:15 -0500
Received: by mail-pg1-x534.google.com with SMTP id e6so1090193pgn.2
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 00:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=smjA2BopKFSF+8U0VmKgDkr13Go8vkgFph7WM9CciOA=;
 b=IR43Dwmy2nGzriO49J6jGTdcq84VVMmEJJ1akeMUa7PMdyKR5/2s+Dr/tO6DdQ4lc2
 Ule1PhId8plEyJbnJicYyJ0eEQD56s+48gJFsc51Bny8AFWg7aJCw/D8Z0wY+Po8Yesk
 vhXAann3DP2POYvS+q36vr4WdCcegTNt/4Pk2rcBt3hrVUFL09s13OpuuriH39ktmZiz
 zx/rmcBLYannF3/9HTQ94JBH7UsyeFbwTg7OB2XuW2EcrXoPNCFR/oESw/vC7sFEFk/S
 UGfGPnUsZ/oVXxp7BK7KApU4ObqKby/+vVVRsBKvS7WMf7y+KnrwaJYD1Y7DslPcOBWE
 RUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=smjA2BopKFSF+8U0VmKgDkr13Go8vkgFph7WM9CciOA=;
 b=ruDmqix4fdYOsZIO5oGXUetA/pEuUytYaR+wzBMbyiqoq4Yep8WiKvhf6sQFEPKvpT
 MDseBxI07J6loXwEJWjRx4+VmNywub0WqD92rWhwxl9cYSs8dfUshYDwb1eg6xTcIiQJ
 5yAFb+shflcYLYmZAok9quyP2wCOaHaBnmyPTJn2kTClGX5wKyuqgdhvXpwGaLPjlk5s
 Wu8nXWpaTUNHDr4F05QsI09NhsttNJiS/J0unpnszKF6VorTxKs6gt9MvkBSr0TWHujt
 8b8uVyVUF7MhuDFWmO8Brb4sVYk10e5ihqiO3wxDtzYJWpOXhJ0OLtC/+yUoaavw9VMC
 ysCw==
X-Gm-Message-State: AOAM532DQ9L1PT87AM9GyGJYV20Fp3P318DeWmOQmCgLbiigRVhDDntH
 ckFLLK9qA9TIrnPME+dQ23rtyg==
X-Google-Smtp-Source: ABdhPJxnGjUdp7Nh3dianBnLQ3d1TCOne1XAE1qiYt61pMdTUIx5lxyZxJ5yMxBLbItsVAT13YQLYQ==
X-Received: by 2002:a05:6a00:1744:b0:4c4:4bd:dc17 with SMTP id
 j4-20020a056a00174400b004c404bddc17mr32142767pfc.57.1646211432576; 
 Wed, 02 Mar 2022 00:57:12 -0800 (PST)
Received: from always-x1.bytedance.net ([61.120.150.76])
 by smtp.gmail.com with ESMTPSA id
 v21-20020a056a00149500b004e15a113300sm21075094pfu.198.2022.03.02.00.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 00:57:12 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: michael.roth@amd.com
Subject: [PATCH 2/2] qga/commands-posix: Support NVMe disk type
Date: Wed,  2 Mar 2022 16:54:10 +0800
Message-Id: <20220302085410.1302157-3-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220302085410.1302157-1-pizhenwei@bytedance.com>
References: <20220302085410.1302157-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pg1-x534.google.com
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

Support NVMe disk type, test PCI passthrough case:
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
 1 file changed, 4 insertions(+), 1 deletion(-)

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
-- 
2.20.1


