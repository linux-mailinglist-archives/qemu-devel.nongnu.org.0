Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E99052D2DF
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 14:47:06 +0200 (CEST)
Received: from localhost ([::1]:50112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrfYX-0006Ln-KE
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 08:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nrfQC-00063x-L1
 for qemu-devel@nongnu.org; Thu, 19 May 2022 08:38:32 -0400
Received: from mail-os0jpn01on20706.outbound.protection.outlook.com
 ([2a01:111:f403:700c::706]:11246
 helo=JPN01-OS0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nrfQ9-00054N-4H
 for qemu-devel@nongnu.org; Thu, 19 May 2022 08:38:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dC5MXJ7DB8btZ1Vc7Il7nTXJycODhKIZOT/57J4q7A8n7RMj0Mwz37O1bBEAzOpzpZvPu5VCP3QHfFVR91ZBLG/8yhRBg7eyNBpJh5pKoJf80CQuIPUC19TFMhGQrNFsLOzc/JAu2yU15BwlU5uY3wLBfOEhqIqEtedRNGaFiKVSBVhLQGCUpxn+PGKe/tzwG4q1Fs687wr/pZqIcjaeOlupwQtrtmnjzyykTXGV+6No0lYkgZ6pskUEv028nRApoNmkfdpvOjMu/cBZzRS9lXNJcwbFNhS/achVcvtJGdIiKiD+IVcNCDA12CbUyFLaNJq+aDMnf/fV4quQzvoq8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/nYA9TCGBF3bCrJvOG/Xxrf72cbKZDGM39yAMvR4bE=;
 b=lZ7OTIGMD5dIJQjIjk1QFzg6FIQ9bkpoOZXXxYojb1Ujx+b+lgGyMXfsl/FQ0IruinCC0X9WNPeZUTugjK5lzn5FCVW6gpjvnkmCFI+cdAvcZKDAqdsAA5IcKqkEsXeznOXmZ4PZy58DKBXbCwroBUXLWOxkynTiGzcSCKuCyAcvakd/7Z/3N89tB6JWGyBFiqf1hPt8WNgLZ7yZVjICGfoj/Qmm5kEb8m7woa57DKXRhVNN7czi+Hq9e/OATkiHdU8XZ/LdQ8M3MA+nWS14yluw0yGGZ1zZ8zybK7jeTdeSb/IWTlUkY517PgZQz+Ycyx563xrU/sNfKuWtu744TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/nYA9TCGBF3bCrJvOG/Xxrf72cbKZDGM39yAMvR4bE=;
 b=iSCakH3PcmWOX9yblXEU3A7TM+D9HXuaK6qcFFvPBTZ4xqA9YIWbqJQbMAOeeoaBCn4b47N3pfXv991sBXsrYRDFXrngE2MyWVNFksI5mRc3xueSnYvQICfMbspnfnUnipcS0WtH/k6RDqCq/SwOzQ8IRdJrfwLjNsm+I4ON49o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 TYCP286MB0941.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:9e::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14; Thu, 19 May 2022 12:38:17 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::bd99:5c83:e2dc:a8f7]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::bd99:5c83:e2dc:a8f7%7]) with mapi id 15.20.5273.015; Thu, 19 May 2022
 12:38:17 +0000
Date: Thu, 19 May 2022 20:38:10 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, contact@canokeys.org
Subject: [PATCH v5 1/6] hw/usb: Add CanoKey Implementation
Message-ID: <YoY6Mgph6f6Hc/zI@Sun>
References: <YoY5k0PQny8WtAHi@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YoY5k0PQny8WtAHi@Sun>
X-Operating-System: Linux Sun 5.15.26 
X-Mailer: Mutt 2.2.1 (2022-02-19)
X-ClientProxiedBy: BYAPR02CA0038.namprd02.prod.outlook.com
 (2603:10b6:a03:54::15) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4990aa1c-7e47-42c3-3cd1-08da399472d6
X-MS-TrafficTypeDiagnostic: TYCP286MB0941:EE_
X-Microsoft-Antispam-PRVS: <TYCP286MB09418DAA90E107138000756DBCD09@TYCP286MB0941.JPNP286.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bhH8vh9i3IiyEozyARaEOdfxK2GA5P/67qfvj8c3NEWLCZkwQKQxaU3w7XcHMcjC3MtGKiAaMdTY2Orw5lp7gn7HST5QVvkZLrestq1dQnkeXXKaKe6dbO9r8pzXUUCGVfKvQIKSZ3P+yhCekAJEUpwBx0BDSFx+Ubu3mNtAbMAk9JB/CVxtBIdGGuF56cFIMKvAuSSArv4OkHWOlOvfafHmKponEZJeGGulgWkAkCGGY8TaeRGX6qP5XybYoA/VDg7uNpdk2SMz5sCW52W2sz+M5zCkk45dzzmBicDvAkbz2Sf3NS6DOgcokvXUIfUDY1ONXz6+Yt+Uc8YStQYbicxaU+GMRSX9t+73MnzpqbQX8mneUB/u+scSzrSOy76y2vLaKp6OPt7krFpuIYXPK5swPH9MhNMRbITjkz0bX4CTpRcCMPutWEDeC7+nvbTYYRv8VlH5obFMX0RoeDmwC5i4gzDPATLfWYi/eVN1YIusvh+/kKzHS3mubLYbqtoEDApB6z1WYSaZl6jin4ZZLMsA1lJX/z3xbkql5G2DE2ZUTGYnJbSEXaYFZT60+n3MygTUbwFYabEoiBGiTeyz8OxfzDqpAUQ/eHSPECHilZJ+7Lbd2oEua3HawxcCMqIDnKzG7mgDWw1rFAcme6/mZJr2uYj9XyY9oamd6ZPdmwGFrJEbJtrrdMCOaJCnRldQUVVKyIk0ckko/anhXWRJJHmK2b3CRId0M1l8d1DQ1yWC6sbrXPlm2QOXPD36D1FFZNZe9g/XD5KPoCMY+D9BYbg13U30h1wdLhGvlmVHrGY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(136003)(396003)(39830400003)(346002)(376002)(33716001)(2906002)(41300700001)(8676002)(508600001)(38100700002)(110136005)(4326008)(41320700001)(6486002)(966005)(316002)(786003)(6666004)(83380400001)(52116002)(9686003)(6512007)(6506007)(5660300002)(30864003)(66476007)(66946007)(66556008)(8936002)(86362001)(186003)(3714002)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KqCyDEdEIjyataOFnoId6ohiB2wpkXdPdDHVhowBf/tpX9+slgGIlMOtKehb?=
 =?us-ascii?Q?o5o34oH3VM8Ry1mP1dnk0BBdhP1CT/aaUAJi7/l2TMJpjEj4mrcUh3t3B8YE?=
 =?us-ascii?Q?XpTNY4DwhyJw/Qjp/zGtzhxauHReWwzuaIdWIsy/59VLciCkX7HwYObHCRu7?=
 =?us-ascii?Q?w27608c6wv7X83pCcyDesa6JRhA4x36aMGA9j4IcAuAvsKGMRl4EsTvX1WUd?=
 =?us-ascii?Q?FHc8dAmPvFvQR6RKG9M/u0PtCf3yhkuJtEboZoroGdpMK78VuX3IyM3EhtFX?=
 =?us-ascii?Q?O5qR0KsRXrkAvGm0t86Li39OZpkxJrH/bSKR0ICNumdGDHPklVrBvt93za27?=
 =?us-ascii?Q?P3UaDiLwqB/Jp8hmOml9Wd6r7f/iChrsGfEus6wYl/Mrrl2/GtkpyZwJUuw3?=
 =?us-ascii?Q?w92O3x8S9e+W0qe67HoqlRpGphjGDkGAM2mE6F/G1WJkO5Ciw6AYDQnNwXNk?=
 =?us-ascii?Q?kDD2UtiAn64QsV2/Qaityuh1NDbgBmEWvJt2QIEcFDrSJyAZE4JWtPBoJ+91?=
 =?us-ascii?Q?DIWXpW8/xAIs3hK6PBis5OEFYHZhmTK5mC9VW8QgL6JOsD+w91eNYEy2wq+0?=
 =?us-ascii?Q?O7L84EBhq5EibRkYLv5S4hXARLqAr60oCibfwz17IrZlUuPlBQITf13mx0zr?=
 =?us-ascii?Q?1mSqqJXBCGp2XVP2yCnPZ3ykTk6aPO/yifzQ2p8edA+wCsERuSFxkvU35+BT?=
 =?us-ascii?Q?iinQ/g12VugQvnouaBPdrzMJzCmWHxNR7Ac50sZ6LCiwn34jdiejh43b7YkW?=
 =?us-ascii?Q?zS6787XEE+8/i/pXDO8NYHUBCDpWTQK9FTUsropXY+kK0V8W8ei9ayBiJeah?=
 =?us-ascii?Q?/oBx4PC5fT6/SiPLrl8g63UCH8XnMRbOzWtMzoi53bPk+ZdEisobeSHcY5r7?=
 =?us-ascii?Q?vXdBX4vD7SeQy+UOmg6QRGvpHHzVzFQNHCVd25wdrE+B/44mSDsz2ti9X5cL?=
 =?us-ascii?Q?hYZ5IZXSgB+7vxskdxXEgSdfPuj8G619uQ1TcPMhDjtr5m2yk6O5pbi0fbza?=
 =?us-ascii?Q?fmXa7MMG+cyZcw72vED7eeBW2whcztm4nBWMRCTtIkpT7+NcbAZRQD0ekHZQ?=
 =?us-ascii?Q?eKs8AepK7IEXQ+81YwPvG4aS2cYwrFTE/nqfS9D5qmmFJEPpgWBd/Qig1sz6?=
 =?us-ascii?Q?MZWQdWd8hVn7as9ywsEyGAdsphicmicu/Y5Co6lNHaOzS1a45gnVnSQ1+uC8?=
 =?us-ascii?Q?n45dxqcf8VRiyU0XkLIWEPCHfydx4kbtFccEq8ZV8XHh7baye3UWrrGkKkYF?=
 =?us-ascii?Q?QhYrUYodXXuhavVBvan+lptIeuetPzPiDr6V9igNWqRcSf9BSSQoIfVTiBui?=
 =?us-ascii?Q?xPWhBWdfMEfFQNEZzfvNTYVReV9wGUJGIz/uYqLFQQMTAOGxtkF/W63ywJEs?=
 =?us-ascii?Q?2+MtZuT+1ul9dgC/i5CeWAPDpwW/XGNqSXO7OZ5ovAbvlxqJPp2SUcCSKxra?=
 =?us-ascii?Q?rY3Y2etq5pbcjnZotMs8TmIp5Tx+Eu7MXVajRbrAIcpqpYK9ZGUoPqVrRaFE?=
 =?us-ascii?Q?xyGyyVwTHkwAN6mUAbu20DLESHNF2aB1Kg+QjYQazVYN+s1UTvYi9nQK3HjW?=
 =?us-ascii?Q?OMce4zDaOiAsVbrB8lO/rn+QJmFjwND2ErLtTRipYXABuWrU9UMKGyZ8sexN?=
 =?us-ascii?Q?1TZDqo6O2zW2jB0mn3dpe/xDM1zv5/auOjC8HGp0IsPZDsDbltKeIUIjEHoJ?=
 =?us-ascii?Q?Z5c2y8EKl6SpgTGvP1bTgMmC3nAyMz5dGcmLN89lPhLigJwgx0ZXAwFbqDN4?=
 =?us-ascii?Q?qt0MdKXAFQ=3D=3D?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 4990aa1c-7e47-42c3-3cd1-08da399472d6
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 12:38:17.4212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Gdvt0w6BuI/JHbSjU0IQu9gZHaL2dQySmuEhkt43BjksGXcdEkul10GUufdrCFG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB0941
Received-SPF: pass client-ip=2a01:111:f403:700c::706;
 envelope-from=i@zenithal.me;
 helo=JPN01-OS0-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit added a new emulated device called CanoKey to QEMU.

CanoKey implements platform independent features in canokey-core
https://github.com/canokeys/canokey-core, and leaves the USB implementation
to the platform.

In this commit the USB part was implemented in QEMU using QEMU's USB APIs,
therefore the emulated CanoKey can communicate with the guest OS using USB.

Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
---
 hw/usb/canokey.c | 300 +++++++++++++++++++++++++++++++++++++++++++++++
 hw/usb/canokey.h |  69 +++++++++++
 2 files changed, 369 insertions(+)
 create mode 100644 hw/usb/canokey.c
 create mode 100644 hw/usb/canokey.h

diff --git a/hw/usb/canokey.c b/hw/usb/canokey.c
new file mode 100644
index 0000000000..6cb8b7cdb0
--- /dev/null
+++ b/hw/usb/canokey.c
@@ -0,0 +1,300 @@
+/*
+ * CanoKey QEMU device implementation.
+ *
+ * Copyright (c) 2021-2022 Canokeys.org <contact@canokeys.org>
+ * Written by Hongren (Zenithal) Zheng <i@zenithal.me>
+ *
+ * This code is licensed under the Apache-2.0.
+ */
+
+#include "qemu/osdep.h"
+#include <canokey-qemu.h>
+
+#include "qemu/module.h"
+#include "qapi/error.h"
+#include "hw/usb.h"
+#include "hw/qdev-properties.h"
+#include "desc.h"
+#include "canokey.h"
+
+#define CANOKEY_EP_IN(ep) ((ep) & 0x7F)
+
+#define CANOKEY_VENDOR_NUM     0x20a0
+#define CANOKEY_PRODUCT_NUM    0x42d2
+
+/*
+ * placeholder, canokey-qemu implements its own usb desc
+ * Namely we do not use usb_desc_handle_contorl
+ */
+enum {
+    STR_MANUFACTURER = 1,
+    STR_PRODUCT,
+    STR_SERIALNUMBER
+};
+
+static const USBDescStrings desc_strings = {
+    [STR_MANUFACTURER]     = "canokeys.org",
+    [STR_PRODUCT]          = "CanoKey QEMU",
+    [STR_SERIALNUMBER]     = "0"
+};
+
+static const USBDescDevice desc_device_canokey = {
+    .bcdUSB                        = 0x0,
+    .bMaxPacketSize0               = 16,
+    .bNumConfigurations            = 0,
+    .confs = NULL,
+};
+
+static const USBDesc desc_canokey = {
+    .id = {
+        .idVendor          = CANOKEY_VENDOR_NUM,
+        .idProduct         = CANOKEY_PRODUCT_NUM,
+        .bcdDevice         = 0x0100,
+        .iManufacturer     = STR_MANUFACTURER,
+        .iProduct          = STR_PRODUCT,
+        .iSerialNumber     = STR_SERIALNUMBER,
+    },
+    .full = &desc_device_canokey,
+    .high = &desc_device_canokey,
+    .str  = desc_strings,
+};
+
+
+/*
+ * libcanokey-qemu.so side functions
+ * All functions are called from canokey_emu_device_loop
+ */
+int canokey_emu_stall_ep(void *base, uint8_t ep)
+{
+    CanoKeyState *key = base;
+    uint8_t ep_in = CANOKEY_EP_IN(ep); /* INTR IN has ep 129 */
+    key->ep_in_size[ep_in] = 0;
+    key->ep_in_state[ep_in] = CANOKEY_EP_IN_STALL;
+    return 0;
+}
+
+int canokey_emu_set_address(void *base, uint8_t addr)
+{
+    CanoKeyState *key = base;
+    key->dev.addr = addr;
+    return 0;
+}
+
+int canokey_emu_prepare_receive(
+        void *base, uint8_t ep, uint8_t *pbuf, uint16_t size)
+{
+    CanoKeyState *key = base;
+    key->ep_out[ep] = pbuf;
+    key->ep_out_size[ep] = size;
+    return 0;
+}
+
+int canokey_emu_transmit(
+        void *base, uint8_t ep, const uint8_t *pbuf, uint16_t size)
+{
+    CanoKeyState *key = base;
+    uint8_t ep_in = CANOKEY_EP_IN(ep); /* INTR IN has ep 129 */
+    memcpy(key->ep_in[ep_in] + key->ep_in_size[ep_in],
+            pbuf, size);
+    key->ep_in_size[ep_in] += size;
+    key->ep_in_state[ep_in] = CANOKEY_EP_IN_READY;
+    /*
+     * ready for more data in device loop
+     *
+     * Note: this is a quirk for CanoKey CTAPHID
+     * because it calls multiple emu_transmit in one device_loop
+     * but w/o data_in it would stuck in device_loop
+     * This has no side effect for CCID as it is strictly
+     * OUT then IN transfer
+     * However it has side effect for Control transfer
+     */
+    if (ep_in != 0) {
+        canokey_emu_data_in(ep_in);
+    }
+    return 0;
+}
+
+uint32_t canokey_emu_get_rx_data_size(void *base, uint8_t ep)
+{
+    CanoKeyState *key = base;
+    return key->ep_out_size[ep];
+}
+
+/*
+ * QEMU side functions
+ */
+static void canokey_handle_reset(USBDevice *dev)
+{
+    CanoKeyState *key = CANOKEY(dev);
+    for (int i = 0; i != CANOKEY_EP_NUM; ++i) {
+        key->ep_in_state[i] = CANOKEY_EP_IN_WAIT;
+        key->ep_in_pos[i] = 0;
+        key->ep_in_size[i] = 0;
+    }
+    canokey_emu_reset();
+}
+
+static void canokey_handle_control(USBDevice *dev, USBPacket *p,
+               int request, int value, int index, int length, uint8_t *data)
+{
+    CanoKeyState *key = CANOKEY(dev);
+
+    canokey_emu_setup(request, value, index, length);
+
+    uint32_t dir_in = request & DeviceRequest;
+    if (!dir_in) {
+        /* OUT */
+        if (key->ep_out[0] != NULL) {
+            memcpy(key->ep_out[0], data, length);
+        }
+        canokey_emu_data_out(p->ep->nr, data);
+    }
+
+    canokey_emu_device_loop();
+
+    /* IN */
+    switch (key->ep_in_state[0]) {
+    case CANOKEY_EP_IN_WAIT:
+        p->status = USB_RET_NAK;
+        break;
+    case CANOKEY_EP_IN_STALL:
+        p->status = USB_RET_STALL;
+        break;
+    case CANOKEY_EP_IN_READY:
+        memcpy(data, key->ep_in[0], key->ep_in_size[0]);
+        p->actual_length = key->ep_in_size[0];
+        /* reset state */
+        key->ep_in_state[0] = CANOKEY_EP_IN_WAIT;
+        key->ep_in_size[0] = 0;
+        key->ep_in_pos[0] = 0;
+        break;
+    }
+}
+
+static void canokey_handle_data(USBDevice *dev, USBPacket *p)
+{
+    CanoKeyState *key = CANOKEY(dev);
+
+    uint8_t ep_in = CANOKEY_EP_IN(p->ep->nr);
+    uint8_t ep_out = p->ep->nr;
+    uint32_t in_len;
+    uint32_t out_pos;
+    uint32_t out_len;
+    switch (p->pid) {
+    case USB_TOKEN_OUT:
+        usb_packet_copy(p, key->ep_out_buffer[ep_out], p->iov.size);
+        out_pos = 0;
+        while (out_pos != p->iov.size) {
+            /*
+             * key->ep_out[ep_out] set by prepare_receive
+             * to be a buffer inside libcanokey-qemu.so
+             * key->ep_out_size[ep_out] set by prepare_receive
+             * to be the buffer length
+             */
+            out_len = MIN(p->iov.size - out_pos, key->ep_out_size[ep_out]);
+            memcpy(key->ep_out[ep_out],
+                    key->ep_out_buffer[ep_out] + out_pos, out_len);
+            out_pos += out_len;
+            /* update ep_out_size to actual len */
+            key->ep_out_size[ep_out] = out_len;
+            canokey_emu_data_out(ep_out, NULL);
+        }
+        break;
+    case USB_TOKEN_IN:
+        if (key->ep_in_pos[ep_in] == 0) { /* first time IN */
+            canokey_emu_data_in(ep_in);
+            canokey_emu_device_loop(); /* may call transmit multiple times */
+        }
+        switch (key->ep_in_state[ep_in]) {
+        case CANOKEY_EP_IN_WAIT:
+            /* NAK for early INTR IN */
+            p->status = USB_RET_NAK;
+            break;
+        case CANOKEY_EP_IN_STALL:
+            p->status = USB_RET_STALL;
+            break;
+        case CANOKEY_EP_IN_READY:
+            /* submit part of ep_in buffer to USBPacket */
+            in_len = MIN(key->ep_in_size[ep_in] - key->ep_in_pos[ep_in],
+                    p->iov.size);
+            usb_packet_copy(p,
+                    key->ep_in[ep_in] + key->ep_in_pos[ep_in], in_len);
+            key->ep_in_pos[ep_in] += in_len;
+            /* reset state if all data submitted */
+            if (key->ep_in_pos[ep_in] == key->ep_in_size[ep_in]) {
+                key->ep_in_state[ep_in] = CANOKEY_EP_IN_WAIT;
+                key->ep_in_size[ep_in] = 0;
+                key->ep_in_pos[ep_in] = 0;
+            }
+            break;
+        }
+        break;
+    default:
+        p->status = USB_RET_STALL;
+        break;
+    }
+}
+
+static void canokey_realize(USBDevice *base, Error **errp)
+{
+    CanoKeyState *key = CANOKEY(base);
+
+    if (key->file == NULL) {
+        error_setg(errp, "You must provide file=/path/to/canokey-file");
+        return;
+    }
+
+    usb_desc_init(base);
+
+    for (int i = 0; i != CANOKEY_EP_NUM; ++i) {
+        key->ep_in_state[i] = CANOKEY_EP_IN_WAIT;
+        key->ep_in_size[i] = 0;
+        key->ep_in_pos[i] = 0;
+    }
+
+    if (canokey_emu_init(key, key->file)) {
+        error_setg(errp, "canokey can not create or read %s", key->file);
+        return;
+    }
+}
+
+static void canokey_unrealize(USBDevice *base)
+{
+}
+
+static Property canokey_properties[] = {
+    DEFINE_PROP_STRING("file", CanoKeyState, file),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void canokey_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    USBDeviceClass *uc = USB_DEVICE_CLASS(klass);
+
+    uc->product_desc   = "CanoKey QEMU";
+    uc->usb_desc       = &desc_canokey;
+    uc->handle_reset   = canokey_handle_reset;
+    uc->handle_control = canokey_handle_control;
+    uc->handle_data    = canokey_handle_data;
+    uc->handle_attach  = usb_desc_attach;
+    uc->realize        = canokey_realize;
+    uc->unrealize      = canokey_unrealize;
+    dc->desc           = "CanoKey QEMU";
+    device_class_set_props(dc, canokey_properties);
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+}
+
+static const TypeInfo canokey_info = {
+    .name = TYPE_CANOKEY,
+    .parent = TYPE_USB_DEVICE,
+    .instance_size = sizeof(CanoKeyState),
+    .class_init = canokey_class_init
+};
+
+static void canokey_register_types(void)
+{
+    type_register_static(&canokey_info);
+}
+
+type_init(canokey_register_types)
diff --git a/hw/usb/canokey.h b/hw/usb/canokey.h
new file mode 100644
index 0000000000..24cf304203
--- /dev/null
+++ b/hw/usb/canokey.h
@@ -0,0 +1,69 @@
+/*
+ * CanoKey QEMU device header.
+ *
+ * Copyright (c) 2021-2022 Canokeys.org <contact@canokeys.org>
+ * Written by Hongren (Zenithal) Zheng <i@zenithal.me>
+ *
+ * This code is licensed under the Apache-2.0.
+ */
+
+#ifndef CANOKEY_H
+#define CANOKEY_H
+
+#include "hw/qdev-core.h"
+
+#define TYPE_CANOKEY "canokey"
+#define CANOKEY(obj) \
+    OBJECT_CHECK(CanoKeyState, (obj), TYPE_CANOKEY)
+
+/*
+ * State of Canokey (i.e. hw/canokey.c)
+ */
+
+/* CTRL INTR BULK */
+#define CANOKEY_EP_NUM 3
+/* BULK/INTR IN can be up to 1352 bytes, e.g. get key info */
+#define CANOKEY_EP_IN_BUFFER_SIZE 2048
+/* BULK OUT can be up to 270 bytes, e.g. PIV import cert */
+#define CANOKEY_EP_OUT_BUFFER_SIZE 512
+
+typedef enum {
+    CANOKEY_EP_IN_WAIT,
+    CANOKEY_EP_IN_READY,
+    CANOKEY_EP_IN_STALL
+} CanoKeyEPState;
+
+typedef struct CanoKeyState {
+    USBDevice dev;
+
+    /* IN packets from canokey device loop */
+    uint8_t ep_in[CANOKEY_EP_NUM][CANOKEY_EP_IN_BUFFER_SIZE];
+    /*
+     * See canokey_emu_transmit
+     *
+     * For large INTR IN, receive multiple data from canokey device loop
+     * in this case ep_in_size would increase with every call
+     */
+    uint32_t ep_in_size[CANOKEY_EP_NUM];
+    /*
+     * Used in canokey_handle_data
+     * for IN larger than p->iov.size, we would do multiple handle_data()
+     *
+     * The difference between ep_in_pos and ep_in_size:
+     * We first increase ep_in_size to fill ep_in buffer in device_loop,
+     * then use ep_in_pos to submit data from ep_in buffer in handle_data
+     */
+    uint32_t ep_in_pos[CANOKEY_EP_NUM];
+    CanoKeyEPState ep_in_state[CANOKEY_EP_NUM];
+
+    /* OUT pointer to canokey recv buffer */
+    uint8_t *ep_out[CANOKEY_EP_NUM];
+    uint32_t ep_out_size[CANOKEY_EP_NUM];
+    /* For large BULK OUT, multiple write to ep_out is needed */
+    uint8_t ep_out_buffer[CANOKEY_EP_NUM][CANOKEY_EP_OUT_BUFFER_SIZE];
+
+    /* Properties */
+    char *file; /* canokey-file */
+} CanoKeyState;
+
+#endif /* CANOKEY_H */
-- 
2.35.1


