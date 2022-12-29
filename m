Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3926590C3
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 20:10:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAyGo-0006ay-Dz; Thu, 29 Dec 2022 14:08:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pAyGl-0006aH-NI
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 14:08:47 -0500
Received: from mail-vi1eur03on2137.outbound.protection.outlook.com
 ([40.107.103.137] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pAyGj-000721-QY
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 14:08:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E98qSWtLYmr7fWor+HbuldbfXL3e8iivUyprpA8fpg0eOSalBTa3mdTsI7M82PpKSyVxpOAaMfHt0utIhzQ+Ch8AlxjXGFjd1vPJC7MwZfYxi2tDkbcNn3jJ8E0tGga0zSXogcqbOqCAoRmcW2x8Ug7wSi2FaIflB8TkdoOK+4nJephTpJk+fTyBsAWvICO7+JdqFJJhKMFC85FyiG22D7o2AvoYm4agpBrOvROLhG/0d9vqCp/NXnjTMEDfvei5NgUVG5TtBIg+rnkJZatIXyl/YiStcKQnPzISlWYa5YXBByFRFOetad47gXiYVkL0df+j6Azd33GQKlmNSmLdBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ueVTWV6t58/qTuyVZFPfOyeertc95jE8D2/j1PGPmdg=;
 b=GFKeIpcRt4e23DNQLZQ0uQoquKvN8h7i0dCUvl0qYLI0MX9iPsv04ngw7N/Fuafp+dUzMiH8ay6Kgmw1FrfP1rFjME33QnNrhROIbX9/w/MJq/43XE2qdoz9bb87JHiwVeqqauwX9+GtsYYPfbDgeDviGC3iqXWeT/PeHWTrPRry8aHuw1dJKH3rXMiwUSm4Mgm/hRn+ueF+dwBZMc3f17YwPh+lYgY+o7Nb6ud+Y/0s2nCfqe+GZA+QMJMtOw+zbUBuhK4ZTOk2b61epJQtdtk2c0dO8RTLC+uZ2GRgm0EjLKHwBrs85Nf/Vsw48FvK3C3ABdcT5F+Tzl7fLO5SLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ueVTWV6t58/qTuyVZFPfOyeertc95jE8D2/j1PGPmdg=;
 b=jyW/HY2AoYn/b6jKfrdieYOmUsQg+hz5BO6dmz+xBvEt0VmSnciHvCkKLXLubeBK/ma5cMDqi1Tc3/3388xuvs36EGOTtUVXYxBYp1c9AVzhnR9OdM80G05E2l2KN6eDeXcC/dtpDbFnFGG63A+5665wMhpLa+RpRJbHiwd5KQU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AS4P189MB2134.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:519::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.17; Thu, 29 Dec
 2022 19:08:41 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%4]) with mapi id 15.20.5966.017; Thu, 29 Dec 2022
 19:08:40 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v2 5/6] hw/net/igb: build support for igb/igbvf devices
Date: Thu, 29 Dec 2022 20:08:16 +0100
Message-Id: <20221229190817.25500-6-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229190817.25500-1-sriram.yagnaraman@est.tech>
References: <20221229190817.25500-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0074.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::34) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|AS4P189MB2134:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d7a638e-6d63-4443-47ff-08dae9d018e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T9zW/1AmxI9+suGjg7SyVgejxbWDXT1mHlVY4Ods0y3nhofYjPDqG3PrcCVmmRWoFRCPcQ16pguazIeMFn0gTzx78T/ac1QNtJOx1pboNytn+I6D1oBgebkjNeOToF1/dGA1SDXutigltob8CvuSx3pWbPfiBwRYyTLFnxpZSiDucLk5yKGtkvLj/qPOdVmJ/X2E/xODK2Cs49mWfePX0zBDZpISDhWj8Lga+H9++bcdUiATR1WFDcO8lBCnCGMrcNKxOIWyY32JHdwkor4m6Gm+SNOi2yDs+yG4QR5tp/eHKfktOoMb2yUx/YkG0GGFvg2QH67KZNWiIhSqheUsdUHkR2WaCgk+Ev/6AWPuNl0oI7vPgEIxo+YuV3mRzCxJ1oOmJOg2oU3QlNfnhKWI8OfhDO2aH6/Ozdpi6iOd82ACuqTGu0rHwgIUcoEPDoa4sQHppzbcfP5PWKusiRWNkfUQoS7xHlfQFbhvcADG7rSnuIejNunPg445sTTHhoqwkvY3Fq3+k+1xVU4UR72o2+MHO93nrNMr+lMY6wq+oLlpWy7TcgY95mul8u03XRwmaBWzvz0x1g7z65oVC8uj33yVB8gI5Z9QUgela1sQiF+Q/uK9FlfDexn0DtLcf/BZtzeXhLbf6OihaXOQVTrlm2V7MxReQ1OSlcarXgcx2xvEKBReeC6NoVc8p5Hld8dv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(346002)(396003)(39830400003)(376002)(451199015)(6666004)(110136005)(44832011)(6506007)(478600001)(6486002)(6512007)(38100700002)(41300700001)(26005)(86362001)(36756003)(186003)(2906002)(1076003)(83380400001)(8936002)(8676002)(5660300002)(4326008)(2616005)(66556008)(66476007)(66946007)(316002)(70586007)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i9JyA5wxJ16I5/5AM7kROnuFHMW5ReQC3+deagbkbHyjsane6/JCBRAXOPo3?=
 =?us-ascii?Q?KmB7sJk9xegjMB+KUCkEvtmEfs/iYYO9c8D3Fx1bW/SyoLWZwEK1FPNH5xzz?=
 =?us-ascii?Q?v1uSbUzlpcfDRD6/zQX7xSM0lMGXSb88ikOHwMOORNTpK1Cuaq2rig2zMhzC?=
 =?us-ascii?Q?d2DfT7DKG4z4GUYz/QTI16n73dfPmTqVcqdeS4QKQ7laQDb95WWrsVqM9Y3n?=
 =?us-ascii?Q?HuBRXuvDiaJRJ6lNvEC1iYc5i0fTmFZt1vrbKhXUU4Z2dVN4iYADWzO95yie?=
 =?us-ascii?Q?eU+vsREdqQDcq6lKtt6EpTz4+EKOZF1vUXlLQuYhoTlPk6YG69dNs7BoWECA?=
 =?us-ascii?Q?G6L37GABWL0kUJb2mz/pP1J68iNxAxhFk1BIgTkauIfa8e3lD5F3pxZfwW0v?=
 =?us-ascii?Q?iQDgT8VwYh8IcX7ogtiyQArH8OkRwYjIuAH/St+Gg+bMboW++ByqDmnHRjHm?=
 =?us-ascii?Q?qCX6R9OWlka5mm96Wzb7iW6IuGFB8swVZAAM/A5ZlVnHGQrRPOgILHZ1Z6Gc?=
 =?us-ascii?Q?iXBL77S9jXejTQpw/ieEbStwvxuNtsQmGRyVNHxWmBR0jMKpasSCvB3ArB9R?=
 =?us-ascii?Q?lIfcVFkhkxFd33dX3RrEy22IIJDBcjyoEmw6kR+tZmoO6m1cvGpeZktlDyOl?=
 =?us-ascii?Q?BKhT18fRPKv89tqy/8J/4AklUAv6FbM69EWycAqz6B8X/y+3fxrNbX1EV3+O?=
 =?us-ascii?Q?Fmj6cmMp28TkA7E0rFaTFbaMnGQdjk+lEdPPwNfFXpkBsozXZijkA5gcXu4g?=
 =?us-ascii?Q?nMPsYxAbzM0FVB6/oaRrNJj8POGmzPnQNSDPQWCnj0/OwFemF92KbtDed8nF?=
 =?us-ascii?Q?Ib5lF81kLfYKBpuS1kuBLxfmWOfjwNrRROe9JJZ1IF3Jq0/TWJObtme6nA26?=
 =?us-ascii?Q?Rie9/uPobeRHI6BDPz+02vFMKakcgm17EH5F5rudX2MXS4PIaCg+rCyjO7Sg?=
 =?us-ascii?Q?hOyIrYVv33RHiFkSGxTapXR+8sH95Cp8MVazg1KNKZV4ppi77ESyvYL9Nvhz?=
 =?us-ascii?Q?2X70PzQx+MHEYZS6vWo+BkbwxTEjpW1fMoWYMaRZPN5O2M2dQ07JnNDRiOwq?=
 =?us-ascii?Q?46AFN6qUBwXJ9gsQkkwM6a1iTTY/SxC1/YdJ5K0iCcLb5rE68R5+t7a2FbsQ?=
 =?us-ascii?Q?GdZX6CyjH9cfSDOiLZoEvpcjaeHXx3vYBlZ/QddN9g5+m/z8raUUugJqzQO8?=
 =?us-ascii?Q?ZB1EJQhI4JDRkpjom91WoyyMkMQG9DjAlLs2CdzVx5TvbRbfYLsvQMLGDjDW?=
 =?us-ascii?Q?HbPIY+963lvjtZ/R6uLejmZDPkVBzYWt6S2cses3XdBJdjVi/NUsD4wFiOMn?=
 =?us-ascii?Q?AK1mkZ5exE2hIPsi8O+aiU346MXMBrjX64KFkzAOiNIsPOBW2t28o+fyrwPN?=
 =?us-ascii?Q?HdzSJ0Lgb5GSUc++j7HsaxJSya25Q43SZXsbyFX/Rdbx2+9C3mlmRvHs6r4l?=
 =?us-ascii?Q?EL3AfangbUztGXZYEP6uYSfSs9y2HcdqIfCUFkIVTQsbyBYvbRdat529/K4g?=
 =?us-ascii?Q?wy/YoAxQY71dV+sREDVZayGRylYt0503PkXRJOTHEK2mYEoCCFy/h5nY6Wmo?=
 =?us-ascii?Q?cAloC01XYsvh2AMsYVMVD8E1ye7Zyq06392ba75KG1HTM3Upd8XDiXPwFrBK?=
 =?us-ascii?Q?AQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7a638e-6d63-4443-47ff-08dae9d018e6
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2022 19:08:40.7966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A6AkErWaVOWsyuyYbdyIYzhy0vNAUo7GyqFVzhCrRfLSjYDfPiSJ8Og68m/Jjoi3QmTau0TiEUj/Yg8FDbSMk6s8QgkJkb3SmYbwXoW6luc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB2134
Received-SPF: pass client-ip=40.107.103.137;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR03-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


