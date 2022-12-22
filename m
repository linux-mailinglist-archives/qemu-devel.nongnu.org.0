Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A80654355
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 15:46:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8Mp7-0008BP-Pk; Thu, 22 Dec 2022 09:45:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1p8JzH-00005E-P1
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 06:43:47 -0500
Received: from mail-db5eur01on2135.outbound.protection.outlook.com
 ([40.107.15.135] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1p8JzG-0007nu-5H
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 06:43:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDC9A3bVpuxjz6lFg7NWAVrB5STC3c4atJ+kfs186eNKI7aCLHD777L1ErLCsucdCpWcUAPDYwYZoIUPtWzuphtaAhZ+/JY6p11kL71YxH63bIvkj9zeH3Uodi5g8EZ81TegMij3Uo00I6rGhzrgBZ3zBtoVj45pOG4NSCVGq8ezsR0hRS+4sqqaND1OZNSTBCLIVPEvy3SSSFAx6ob4WWHOL6GggXXegg8bT36Z66ZuPK0XZhohQKHRae1VMfbAlx0z3oLkzNE1jKXzkZV3RznsOLK/G8UKQ1CUYpgRWufrLMdxt3P9xMEGWs/NyDk9qmCC576GRxjs/5o/ZcqVEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ueVTWV6t58/qTuyVZFPfOyeertc95jE8D2/j1PGPmdg=;
 b=DUyVS3SEHscjFyCMEAKUDSOnP+z3zWARsBKabNNBTSgpILQ0sEEDaLd5DGyVPX4cMYjtH2EczgJ+TRKsmDzlqHMJXPsBIpHDHYdG5wrfZvnHgoCOJWCteh75QhM0+LP9rO7G1BnOHKHjdUUbZMsnhZDxTTZr9Eqs7EfKnFEdcNy0xjsnBWmuQW/Je1O5Mk4klaq1QidpVjJ0qJc7HzRsCRm3likIUliGbFNCYxu4wtzkC+UMCOpAP/+sckLbU+GaMVkAm0PoFWBTSiMAIf51CxwUXRtWqfI7iTxOct+/+s3wolcBDMMAmCS7t5IhjMN6afjb/HPpvF7aAvCYMt/auw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ueVTWV6t58/qTuyVZFPfOyeertc95jE8D2/j1PGPmdg=;
 b=fWnE7EDG9VaTyfwK6QsUloLHw0tSHghA3C5eR/DdG03Q9+TAOGOn59ZQ9pjDhtMSAyz4HpZ7Fsfofsfrx4YAKKkCSEqlQXuCFMXWbe+/iWzh7PFeZFjMaZhTs/uAHOUZTVDQUL9UNc3YYnJzYPaObK+uUGpHHJ2aM2KU1F4NMCQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by GVXP189MB2055.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:6a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.6; Thu, 22 Dec
 2022 11:43:10 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%3]) with mapi id 15.20.5944.006; Thu, 22 Dec 2022
 11:43:10 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH 5/5] hw/net/igb: build support for igb/igbvf devices
Date: Thu, 22 Dec 2022 12:41:20 +0100
Message-Id: <20221222114120.8790-6-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221222114120.8790-1-sriram.yagnaraman@est.tech>
References: <20221222114120.8790-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF000013EA.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1::1e) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|GVXP189MB2055:EE_
X-MS-Office365-Filtering-Correlation-Id: c391f2ef-f624-48cf-e013-08dae411b329
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9wLHa1tNt02xJxtQ6r65it/HiXnlij1zsSb9RWCoNBmBSLux2wwUovBhGiLgv8EYqKTQFuEBdgIYJ/B4xE1RYHQTSMA8Jv3I8JAnNnPft2QvptflXdh7RNW5qpaUmifQSJG4LzV4M2CQ4tkJIviD79PVlnOXOZEtJSdF3Gcg6ehvq8fM0+8dmfVkJkf/FjqM4x/kgTyFbrFX6Ds4gBnqoCUmGa9WgzJHuiUFkCEih0o1evf1jyGZJyiYpo40+54xH6iAuu26uh9EjUYqvu79Nnht3HeUzX8cbOWpOuHMgF2581GqCHUuylO2ugu46+9Oms0qgdS3EzY+I41gc8tNx0WyyN4hBykILnHwfHeaz2irF/y1tSWmeSpQiChwuv4yNoxp2RvGth8f7gjeOIcbWVB2sCStJy/cUXp+7IxJ44oPu/XdA0ZcL5WEibtPrd8ci5I2JYQS7OV5qQkSteiPD20+0DXYbmPGDRRZo3t3mDdmmH340wlZlSGjCwPsxQxfEIWQQuvbpXKB0JFkx1hmvcyntAU47oV+2IhHr75hnRO8Cg5f9+cx12EaiGv94irav9Jg5NHzg87yuWJ3a5mfA4YSALRvLC9suJvtL8HrmxW9aK2+Dh0OBHS9YDxSna10FYytxzJYC3ZqGCPXsXNfXlmtJqnlJ1xD9udTC4uqsdIqPJ+OyVAagyyfd7dpRSPA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(136003)(39830400003)(376002)(396003)(451199015)(36756003)(316002)(478600001)(86362001)(5660300002)(26005)(70586007)(44832011)(38100700002)(8936002)(66946007)(66556008)(2616005)(110136005)(186003)(4326008)(6486002)(1076003)(2906002)(66476007)(41300700001)(8676002)(6512007)(6506007)(6666004)(83380400001)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p0Gw7PTJky984V9Rs5QXh0FSOtL8MJK0k+DHizwLvngJda+bPHf9A1ypooBH?=
 =?us-ascii?Q?HltmqZW+pA2sxGEGa1actC6UF+YHVXtQQlGiVorX7p9URgz0EK/DM7Jm+VU/?=
 =?us-ascii?Q?GHxLVPFWHMur0Tt69o0t/4p88IfPMMJgElTY/OMI5LrFc0CJdpwFlJcg4B/f?=
 =?us-ascii?Q?kj1m7OGowpPmPz+6QpV47DX5bQx5CRzaWFta9DXbk8a7vvaNe3PnSeFDeezm?=
 =?us-ascii?Q?zuKdRwm2erln9IZRMfGX8LrDbjJiMRfmYsMd6caG26hBEIWFA3B/GCaUu1ZP?=
 =?us-ascii?Q?Q364nj97l0nTb9hSEXaWTZW6M2lu+Tv3qXHEtHZd9fWIFT4EfoQI22c1V6xR?=
 =?us-ascii?Q?ao89jiJDthdDWExQsbrdmTNy1MgebDQmB0nvzEun187esTZ7V2EyWOkgxf2y?=
 =?us-ascii?Q?GXjex/Jui5X0nByKL67KP4AeKArvlVY8JCP718sU2C4oqgMjiLWBBVT0gopU?=
 =?us-ascii?Q?XtJFAj4lzEgR2ljdl5Fk5J6eAt/ounYrpOUCK/MlNUhmJ01vVSGI9kiHvMwE?=
 =?us-ascii?Q?Fq1JUzoddcVwKERG8S9aJtKgHdHbsxUhnIBb93UU30VBOGChUiu/vgIyU3nb?=
 =?us-ascii?Q?McwLjoFFRhsgcyEht6hzyvVExElxX6uq7EeUjK9t4QJdDRg5HCfMVLkvJ3ZH?=
 =?us-ascii?Q?1re1//e0bLc9aGCpke54d5S3OKCvk56VC24vUF5SJdUPON3lU6bdjjCtPqaU?=
 =?us-ascii?Q?rC0vQ3usXtqessSzfAn79jccKc/EdkOVmHB5A5uyypwo5Ajedf3I45E/oqmp?=
 =?us-ascii?Q?buJ4mdmcsZV5rnoKxVYEZVfFqYQShEhklOPPuRr30W4PzAyJH+wjaBiYeCFM?=
 =?us-ascii?Q?e1fKX+K2qTr+tkJbjG6HZg/NAE+Hs6Zewnb1bAtHmw5nMztQBLgY5yfKodAy?=
 =?us-ascii?Q?PhnXQm41vYMnE0CQfdXDUVRzvaNNiGcELsO3s4t5O6hrdDmwx1kYOtkaqJkU?=
 =?us-ascii?Q?YtVCxw75OVjXbtI5lFIK0zZ6dRjMIKC1JZfB744Htv+Rwd0b/DBSl7KEwEkn?=
 =?us-ascii?Q?xK7WmWJXCkHqaOKZsg5GlkWjQzh5EHh+WW9D3hhZ/I9BAtusruUr4hv2T9Mz?=
 =?us-ascii?Q?qLt10INRsxFL+JFbmjS/kLfDzCzXoUUou9zXuGByK0cG0BHOKJdrQUEEO7Jt?=
 =?us-ascii?Q?jjxIepydNdqUm0nbcJIWBXBiuO3YVK15WfLKJWFJR9SYMnSkHnDXIQtwGAdx?=
 =?us-ascii?Q?YjFMLWWh9B8y15H7qVL8C44h5UBMvarCh8VWNh7JE5VRxhwQAknwLe/z7lZr?=
 =?us-ascii?Q?BW0PTQCzCM9sZAnMgXj5rTCOgUfPHCG3KMiH2W6ZYR8P/0TsaykVL4s+0A5c?=
 =?us-ascii?Q?l2NBVqqZPN2oyK82CN9KomEJ9uP+rxz914sOQwrl5ogtQc7wyfykA4HhjT82?=
 =?us-ascii?Q?BOndEjxyGQoSHQlKnLKuVDZrUrBy06BWm/qM2Ymk6EDVy8xvasNYy+yQY0GL?=
 =?us-ascii?Q?PMNEF/9iGhYf0yVwiTRhw4dltyEQGmrF9POZd3gAqF2KcsROuDl9AvzaxfG0?=
 =?us-ascii?Q?cp8A3EOGpPfEPbxDwi0BxSy1G5M3D+xJgmJT6CRWqu6nufyvXdWrX8nNl8Ci?=
 =?us-ascii?Q?Ql191uFVFMU0O8zN20417qONvJBYa1pLQeYV4873vZs6LjmumfK+gIdprRuy?=
 =?us-ascii?Q?oA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c391f2ef-f624-48cf-e013-08dae411b329
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 11:43:09.9507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DbpZNjsSX0a8vuRK8QGbKW5Sl4nuh8cZXuTGsyxmRdRDZh3IM/Q7/IA5PTfV+WSyFhLJ63ka1lgWWZLkFPV4kwPYrBkGrk1oC3TFYbqheoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB2055
Received-SPF: pass client-ip=40.107.15.135;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 22 Dec 2022 09:45:21 -0500
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/i386/Kconfig    | 1 +
 hw/net/Kconfig     | 5 +++++
 hw/net/igb_core.c  | 4 +---
 hw/net/meson.build | 2 ++
 4 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index d22ac4a4b9..97a0b08842 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -94,6 +94,7 @@ config Q35
     imply VTD
     imply AMD_IOMMU
     imply E1000E_PCI_EXPRESS
+    imply IGB_PCI_EXPRESS
     imply VMPORT
     imply VMMOUSE
     select PC_PCI
diff --git a/hw/net/Kconfig b/hw/net/Kconfig
index 1cc1c5775e..18c7851efe 100644
--- a/hw/net/Kconfig
+++ b/hw/net/Kconfig
@@ -44,6 +44,11 @@ config E1000E_PCI_EXPRESS
     default y if PCI_DEVICES
     depends on PCI_EXPRESS && MSI_NONBROKEN
 
+config IGB_PCI_EXPRESS
+    bool
+    default y if PCI_DEVICES
+    depends on PCI_EXPRESS && MSI_NONBROKEN
+
 config RTL8139_PCI
     bool
     default y if PCI_DEVICES
diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index c6b2ed9d3e..f9745f9b26 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -993,14 +993,12 @@ igb_start_recv(IGBCore *core)
 bool
 igb_can_receive(IGBCore *core)
 {
-    int i;
-
     if (!e1000x_rx_ready(core->owner, core->mac)) {
         trace_igb_rx_disabled();
         return false;
     }
 
-    for (i = 0; i < IGB_NUM_QUEUES; i++) {
+    for (int i = 0; i < IGB_NUM_QUEUES; i++) {
         IGBRingInfo *rxi = &core->rx_ring_info[i];
         if (igb_ring_enabled(core, rxi) &&
                 igb_has_rxbufs(core, rxi, 1) &&
diff --git a/hw/net/meson.build b/hw/net/meson.build
index ebac261542..a5b56452f5 100644
--- a/hw/net/meson.build
+++ b/hw/net/meson.build
@@ -10,6 +10,8 @@ softmmu_ss.add(when: 'CONFIG_PCNET_COMMON', if_true: files('pcnet.c'))
 softmmu_ss.add(when: 'CONFIG_E1000_PCI', if_true: files('e1000.c', 'e1000x_common.c'))
 softmmu_ss.add(when: 'CONFIG_E1000E_PCI_EXPRESS', if_true: files('net_tx_pkt.c', 'net_rx_pkt.c'))
 softmmu_ss.add(when: 'CONFIG_E1000E_PCI_EXPRESS', if_true: files('e1000e.c', 'e1000e_core.c', 'e1000x_common.c'))
+softmmu_ss.add(when: 'CONFIG_IGB_PCI_EXPRESS', if_true: files('net_tx_pkt.c', 'net_rx_pkt.c'))
+softmmu_ss.add(when: 'CONFIG_IGB_PCI_EXPRESS', if_true: files('igb.c', 'igb_core.c', 'igbvf.c', 'e1000x_common.c'))
 softmmu_ss.add(when: 'CONFIG_RTL8139_PCI', if_true: files('rtl8139.c'))
 softmmu_ss.add(when: 'CONFIG_TULIP', if_true: files('tulip.c'))
 softmmu_ss.add(when: 'CONFIG_VMXNET3_PCI', if_true: files('net_tx_pkt.c', 'net_rx_pkt.c'))
-- 
2.34.1


