Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4E933189B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 21:31:12 +0100 (CET)
Received: from localhost ([::1]:51924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJMX1-0002QQ-7o
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 15:31:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lJMVA-0001fA-N5
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 15:29:16 -0500
Received: from mail-dm6nam11on2098.outbound.protection.outlook.com
 ([40.107.223.98]:54208 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lJMV8-0007as-EU
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 15:29:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nu4KWUg0BkiMe6GVWsNq8KidopMoMsrG0E6SZpNaSJLfPYrcRpV0FGoZJzNhcT8VKx+gBQZQSljl6Dlo2cAwVReYqVa9fnxY3Aar0Kv2O/Qpbazi53Uc1a7joJe6LSreeDP0WQbakpSpdO5nAdIuskSd7COFZhg6cREcFL+K7DrZ1/XyWjPTcFscb+f8v+UHU0R/CTOF0XNGoqw5GUPphoOpl1WpfPUIsPBB7Ng5rceCUrStPcgZrCYrtSzpzjtdexhr+GVpS/itH56oF3jUo4aCbhND18gzoG1trmS5jjG0WDRbHTjFEAjnJ97v3UPIhvEBu4QgDFFILZoT9Y39hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xv8FkhvQpJZDgisvkvBL9yfbDObKtyo8uAQlOUVR4I=;
 b=KNTKD7jwSXss7HRbp3CiIVLkgQwM65P5KqzkwRMQM/377GRUrascpcJhUx89u2sqJXeFv/tiDwSV++IrqQHPeA8uQ3reRg++23uXcju0w6Cez9U29wRyzTBh68YYpK2HsMhXvJCrO2xabTpQ8uVrDQiVrUtlZ892mXXS1CXryWNNcGkq9ovqEk2cQtvt08cBVoFffi7x517EV4Rxfjc7/Jwd85W9nxATaIL0W3gnLPEvP+na8GtX1RtQvUfQ03MvTvl+GsNJtZxSzHphewpNueBauMr+crd7WyOrAT/jnJIaEtGUZP31sChYtGFHRtr5/KchpJbM0gYww4KpR2pysA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xv8FkhvQpJZDgisvkvBL9yfbDObKtyo8uAQlOUVR4I=;
 b=M20pCSK0MEVnHAlkqR1ExEgVxlF9Z2+cx3f/J/BNnuAqIdKuyeESAYO5qIvCzmWnOzQc8uVDC35+5WZBXcKh/IZ/OBEdRi4hYQkp9dxfoezFLpICDDLZ/NslFfbWGNN6/LYcLUoCX52CIKcph92vd6cCMYJ2mgmbrIT60rhe4WM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SA0PR01MB6425.prod.exchangelabs.com (2603:10b6:806:ea::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17; Mon, 8 Mar 2021 20:14:09 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403%7]) with mapi id 15.20.3912.027; Mon, 8 Mar 2021
 20:14:09 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: cota@braap.org, richard.henderson@linaro.org,
 Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: [PATCH] plugins: Expose physical addresses instead of device offsets
Date: Mon,  8 Mar 2021 15:14:06 -0500
Message-Id: <20210308201406.1240023-1-aaron@os.amperecomputing.com>
X-Mailer: git-send-email 2.30.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: BL1PR13CA0304.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::9) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 BL1PR13CA0304.namprd13.prod.outlook.com (2603:10b6:208:2c1::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.13 via Frontend Transport; Mon, 8 Mar 2021 20:14:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a240e265-65cb-4727-e0b9-08d8e26ebb99
X-MS-TrafficTypeDiagnostic: SA0PR01MB6425:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR01MB642582374CD610B491DC545F8A939@SA0PR01MB6425.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QTp8/HRESLYG2HlmWkOEAt6BoEM/UejsEZIIONeS0WuU72JW9l5wM8iV4FBikOkrMZMIl0eMxQ19NvsnsRuXW3uF92lKDxJYwmY3+iCfzSZQcwF5fX5lJXpjnliCdHwaZmEwIGAb2GszUQj5IYB+lPTKwcX+E9VyEZLVxxUp5BNH/G6UgW+tGnY9NDlYEOIPPjSzwJfwhPYBTWlNYdKyJWiFd+fPYfK/VRI1fhZfjtGyzrsYfLAts0YD4ByN1Tf/Oswd42HaegxrozVCbk5P5ObndNoyclW5XfDo/wq1HHNoUFL7Tl5Z8nT9khJATgGjdJ9durDSlbXSlx87dtuiAhKTsl0E3AVGUxY3rdCZTcUR5pVKzygWw8SLPGT5WGBumGNisynbMnC2Hi8K0pAjY9kShVl+BeLHtA9lJ4kn8Mh+QubsUWrUFItn1DTYiASTORsKV4VJjVD/IVlL0kIY7oKo3uXAz0Q0eK5KRxN2s7IBEE5KOXwjiFjQewmSXIgt2p0am+Facj6WFDJXlb2XCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(136003)(366004)(376002)(346002)(26005)(6506007)(5660300002)(1076003)(86362001)(186003)(52116002)(83380400001)(16526019)(107886003)(66476007)(6512007)(4326008)(66556008)(2616005)(66946007)(6486002)(6666004)(956004)(2906002)(8936002)(316002)(478600001)(110136005)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Ov/yeZNv6XXj6vk9DwKXr8CsFUetRxR046RPlRHQcOSsWdocpRYhtL/GC/7h?=
 =?us-ascii?Q?Ve5aR0HdcyP+bSIpBc3VK8iGaZ5BFxKivZ/TUkbK8eRiE2+QXzAksNzFNa9d?=
 =?us-ascii?Q?Yz1BeWltKv3L4HQmLzYttWmvHD78R/BxUVAH4gAEYLt3nja5roZwuA75U732?=
 =?us-ascii?Q?Q9KqiRCrN4Ak2t+SatIcJmqThbyc//DSJVnp6lseXBCr05HyGRywDPSR0JoK?=
 =?us-ascii?Q?h7VhlyNm1CIg5msKPFfSXnj62FiZijzLaEVGrTxMmEVIS0Pj8ErJNu7uCHNW?=
 =?us-ascii?Q?NXC1CFlaEVHWihkUhnNP1/IWGX9qhAW7h3VoJ6d1K7OrIcS08xeU82tTO11n?=
 =?us-ascii?Q?dhS/mIPBJDaeBrQURd9kUKJuLDUQaZfrUl8Gw5rOsNW5YyBAeUUfeINzdkhD?=
 =?us-ascii?Q?YG3H6waFst/UrKl5iYAkgjcVA4O1zD+Pj1DCMDW0qGsSQTrYTp91Gor3tAHr?=
 =?us-ascii?Q?E9lq4CUmucpAV/J7rniQF/QDfLJKlD0kmu1oj+JQRnVU0+UerUF1ITRj0i73?=
 =?us-ascii?Q?rqEnAvJIfpQp7YdmdYuuLMahW1RwHfna/NrvpMTA0JiDHPRx4kh/TXuPReo6?=
 =?us-ascii?Q?UTqIMkrV3CSQ62Z9SgP2GTXp3RwnRyCn9UgdukebwUe4bY7WifLHQDDMMsr6?=
 =?us-ascii?Q?dVyE5Mja6xPXtL2UnNKDaUAqQDZY4L3Rf5p8Zx8VtF3yJpxyJYO/gOswg7rK?=
 =?us-ascii?Q?kukCwmmA0GLcWsJOQIAO5ABXfaJM49bF4hI/toD1gKAQ/o7NrdeK+YoQaCys?=
 =?us-ascii?Q?F1u57j+Zyf56z4nSaJEeNrX7b04x7xvCrmaq/FOw9K7A7zFaFjMGxhDwI90X?=
 =?us-ascii?Q?VSgr2v+uQTFCQcG+eee3h2vZGEJzBcEC5CFXo9t35HCj3Qg97ALcYt2dKk3g?=
 =?us-ascii?Q?+b72WaAL+OY38/9m9TejLncVPVN8IEE5i4bqR5Pcy5M3mZHb7ff4+NVjiCXz?=
 =?us-ascii?Q?UaUPPU24746WAwD2Sc9yzMdtBW7LBavc66k0rhU6d6pn7QeFHg91qvO4vbyu?=
 =?us-ascii?Q?+P50szx3GYaYGTbPCkeax2JYwN/jl1g2OnULV10msh+ro66Mk94wbCxh1cuf?=
 =?us-ascii?Q?nY7e7QYjBVlH5BCYfgCfwzoUaKskQEQ5NaT1QOEGpDt1SK7tHotE15bO8Ql5?=
 =?us-ascii?Q?H5YjMhRoxnNU0byxMujyV1aIXdHQorxZLxzRVJDfLd30yugjCieRAiQckKAH?=
 =?us-ascii?Q?t2ZCG6nx4EKD+1+w2N9QE600CsSBEyOj8UukTNycqBgDkRxlWNuWKc/4sc0G?=
 =?us-ascii?Q?nvcUPcVqVpUEW8IZ8BRS8Wf2wOnKti9ilEon33lzgMTL+x8ZP27Q2iy8x71O?=
 =?us-ascii?Q?mmWIvyPsJ6eFDKJ84PURCnam?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a240e265-65cb-4727-e0b9-08d8e26ebb99
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 20:14:09.6228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mzgAuOrfX6p1/Pn+cLmfdYo1A2MrGLw/fiUpw+K5xkez2bWkIBCvGxnK6dapOecbjATvCX7PYCEcJDH4QnWxo9C4IgkXGP6F+LcneizHvFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR01MB6425
Received-SPF: pass client-ip=40.107.223.98;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

This allows plugins to query for full virtual-to-physical address
translation for a given `qemu_plugin_hwaddr` and stops exposing the
offset within the device itself. As this change breaks the API,
QEMU_PLUGIN_VERSION is incremented.

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
---
 contrib/plugins/hotpages.c  |  2 +-
 contrib/plugins/hwprofile.c |  2 +-
 include/qemu/qemu-plugin.h  |  4 ++--
 plugins/api.c               | 16 +++++++++++-----
 4 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/contrib/plugins/hotpages.c b/contrib/plugins/hotpages.c
index eacc678eac..bf53267532 100644
--- a/contrib/plugins/hotpages.c
+++ b/contrib/plugins/hotpages.c
@@ -122,7 +122,7 @@ static void vcpu_haddr(unsigned int cpu_index, qemu_plugin_meminfo_t meminfo,
         }
     } else {
         if (hwaddr && !qemu_plugin_hwaddr_is_io(hwaddr)) {
-            page = (uint64_t) qemu_plugin_hwaddr_device_offset(hwaddr);
+            page = (uint64_t) qemu_plugin_hwaddr_phys_addr(hwaddr);
         } else {
             page = vaddr;
         }
diff --git a/contrib/plugins/hwprofile.c b/contrib/plugins/hwprofile.c
index 6dac1d5f85..faf216ac00 100644
--- a/contrib/plugins/hwprofile.c
+++ b/contrib/plugins/hwprofile.c
@@ -201,7 +201,7 @@ static void vcpu_haddr(unsigned int cpu_index, qemu_plugin_meminfo_t meminfo,
         return;
     } else {
         const char *name = qemu_plugin_hwaddr_device_name(hwaddr);
-        uint64_t off = qemu_plugin_hwaddr_device_offset(hwaddr);
+        uint64_t off = qemu_plugin_hwaddr_phys_addr(hwaddr);
         bool is_write = qemu_plugin_mem_is_store(meminfo);
         DeviceCounts *counts;
 
diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index c66507fe8f..2252ecf2f0 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -47,7 +47,7 @@ typedef uint64_t qemu_plugin_id_t;
 
 extern QEMU_PLUGIN_EXPORT int qemu_plugin_version;
 
-#define QEMU_PLUGIN_VERSION 0
+#define QEMU_PLUGIN_VERSION 1
 
 typedef struct {
     /* string describing architecture */
@@ -328,7 +328,7 @@ struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
  * offset will be into the appropriate block of RAM.
  */
 bool qemu_plugin_hwaddr_is_io(const struct qemu_plugin_hwaddr *haddr);
-uint64_t qemu_plugin_hwaddr_device_offset(const struct qemu_plugin_hwaddr *haddr);
+uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr *haddr);
 
 /*
  * Returns a string representing the device. The string is valid for
diff --git a/plugins/api.c b/plugins/api.c
index 0b04380d57..e7352df3e3 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -40,6 +40,7 @@
 #include "sysemu/sysemu.h"
 #include "tcg/tcg.h"
 #include "exec/exec-all.h"
+#include "exec/ram_addr.h"
 #include "disas/disas.h"
 #include "plugin.h"
 #ifndef CONFIG_USER_ONLY
@@ -298,19 +299,24 @@ bool qemu_plugin_hwaddr_is_io(const struct qemu_plugin_hwaddr *haddr)
 #endif
 }
 
-uint64_t qemu_plugin_hwaddr_device_offset(const struct qemu_plugin_hwaddr *haddr)
+uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr *haddr)
 {
 #ifdef CONFIG_SOFTMMU
     if (haddr) {
         if (!haddr->is_io) {
-            ram_addr_t ram_addr = qemu_ram_addr_from_host((void *) haddr->v.ram.hostaddr);
-            if (ram_addr == RAM_ADDR_INVALID) {
+            RAMBlock *block;
+            ram_addr_t offset;
+
+            block = qemu_ram_block_from_host((void *) haddr->v.ram.hostaddr, false, &offset);
+            if (!block) {
                 error_report("Bad ram pointer %"PRIx64"", haddr->v.ram.hostaddr);
                 abort();
             }
-            return ram_addr;
+
+            return block->offset + offset + block->mr->addr;
         } else {
-            return haddr->v.io.offset;
+            MemoryRegionSection *mrs = haddr->v.io.section;
+            return haddr->v.io.offset + mrs->mr->addr;
         }
     }
 #endif
-- 
2.17.1


