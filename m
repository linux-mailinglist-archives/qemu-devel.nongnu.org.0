Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F88600813
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 09:50:43 +0200 (CEST)
Received: from localhost ([::1]:60466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okKtW-0002LY-B9
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 03:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1okKYX-0004X1-Q2
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 03:29:01 -0400
Received: from mail-eopbgr00109.outbound.protection.outlook.com
 ([40.107.0.109]:35648 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1okKYT-0001HN-GO
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 03:29:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h8ChEJ/V/S9gCZf1D9s21HdTCAUepU76QDZy3Xnkcz08nHRA8ASmgGWSfDCo7nF8EmURoUWojad65MTrW4Tqxdu2Su+lR9H/3mf9drEcdkGa4gBRjIchG5x22wAku/ALmBqEqlZpnH9m2Z5fOKYNtcB0RA9YrRzo81WcSB1KS0wjGpBJvDCjfsTycPEMsGc4x6Zvdfff6pmpi4E6mtNeXRwG2547QU8yvmv2OIguK78fG6Yeiv4UwKprsQy/3fDxkUqhF6mJ4QSlDIa73JQ1vsWaG/ho6LnfsPvw1RfWCvpZPMoxcC9QEfS4DOl8JfRTcWrhBAfdLNrliJFtHzuoZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97GU8ZgrfrryHI07Vu27eApS8SJlI5utNtISknybh44=;
 b=DKfVDASIohZHeEI2Y1ikrzLkb3wZN0JBVTs3xY4qrJMDGCRjIFEU8ZVEu3EO1pGD0K/nTxk0hoyJw8OPo0zFL5Fwix0yZtryC+jFEOWakmEfhFM9xn0chVPctZO8TPqPhFog49AembTvUrPL5VTJo4seMgKS6WlYsNc3Wzd/pcnS2CnO/iQm56pcDbaLZ5Gy5b1mPP2U6k4XdDmrqOOK1s6UWvwksO2uOI3+AIw7c1XOs2xroujNrXcuIrZF9GJ1exKt30GZD9vZCr5g1HANIw222HmbO3ErzPV6KL0r1V6vVh5u03bPp77jo+WL//wk6OkqC7nuBUPpVu3TtofDTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97GU8ZgrfrryHI07Vu27eApS8SJlI5utNtISknybh44=;
 b=dh7LcoPy3NypZW2S++7naoDRqrxahc4Zn+dt34eJTzRL2+L2BDYFteoVE799T18WRIM287gZ4tn/IM6p+nWFTR4FfWwhh0hvf9mS1Vp6rSfEdYQhNbJl5GjR62GxZUcZDGciRyIceNZqISmwf/r0guKStgG1vH02fIvoEd9t84FRAxixJTXCBZojw7moujLc3X+N3rbE6JGFMu18XaYnEjsZS7rJwQca4ShU9b43x7jodZDZmLd8puxtBIvc6nz5xG9zo+iRDTqx6rMXYUbxFbfLm6Db6hgpXpz6cU1UCru5sSrEoVCO5u3d3R6YfhnBIyyY6Na81nzcyiV2qjFRlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by GV2PR08MB8653.eurprd08.prod.outlook.com (2603:10a6:150:b9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Mon, 17 Oct
 2022 07:28:40 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.040; Mon, 17 Oct 2022
 07:28:40 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v5 6/7] qga: Move HW address getting to a separate function
Date: Mon, 17 Oct 2022 09:28:24 +0200
Message-Id: <20221017072825.72867-7-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017072825.72867-1-alexander.ivanov@virtuozzo.com>
References: <20221017072825.72867-1-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::12) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|GV2PR08MB8653:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bdaf1c4-b980-4e93-610e-08dab011369f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J1KPBFfOgxiOvlwEzRJbqS6/+0mp0DhLod1WXU1Zt7+aDykS+aaFnuFzwyLXcHcv6j9TraWpcWCnx5SRBvhQXaUkHsmxmoS34Qz4yO/IBotbabZhNXrooHbHrxHY2FcCnX3qr+VHWw3uMNvbNtLDynCBHFkHiYO+RlA2fHjCdXV7+l9jmEoiaaGTBMfYfXGGJymOdyp29MtzFuxqXPcqCg6s0vji5ora4FYDTVU5nI9VNELT6HA6zubzvJr8FARnE7D44lxbjAmg5NEdy4W9S7TwA00MOP90HK5k5BJ2vU/K9NdtxmUZotHOuP3Y2RBt2lRymFNt6QLxn8kiHRoY/dZ18pu+DhOhKBapEs1c3pDTkxmNvCT4Vp88xPKMKfa1AnzQ6n7vbRWKk2TzUcAVDqLmsAcR/292H9rrsWBFvRiYjwNJx0Wl+Kwwwvb1nuoyE25jNRbdAX1xiY3XKOeEkqxZawUZQ7rkCgcm8/RHFLLarFJWEcnTogr33Qbuj/FPyaRefyS4Dbp3LA7nKm0i3aQWPjMfMd3pM/co28bHFLDAm+VAfXwVL1khZi1wubjYuJctmJWJoCPYaVFo5ILxAdV5QSLjRA6ktqncbbu4IXpQay0Cw9uWiytTJoChzS11YCn7thLmEM5ptxswtwaBFrpge5cmA1n4d6xtkVZ7smdBfUtPADKFJX8sdaz7+hoDLzINkXboTmJsYX70bURnGYdOYNu/JqnTmsOGRHpb77fvcRP+Hsdl6NVlKXldeoY3cAyR3poqZlSExysWI3gOJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(39850400004)(396003)(346002)(366004)(451199015)(36756003)(86362001)(5660300002)(44832011)(2906002)(38100700002)(38350700002)(1076003)(186003)(2616005)(83380400001)(52116002)(6506007)(316002)(26005)(478600001)(6512007)(6916009)(6486002)(66946007)(66556008)(66476007)(41300700001)(4326008)(8936002)(6666004)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zk9YSHZtb2tTTmQ0bzZ2dXczWnJZMFpLanBtaU9FWE1KcHlQVmh3TFpzeWt0?=
 =?utf-8?B?ZHZCVVpqaTVrUWYxZXFYcDFuUzMzcnJ5VGlDeEJZZ0FHWXdFOEJhbndhUjBa?=
 =?utf-8?B?aUtwbzhDRWliV3RCWU50bmRpSUcyTU9MajVyOGxwanBxVzZSYmJYcGVrZ0t4?=
 =?utf-8?B?alBWdzNZd2pzSklRM3pvVmVvZjVXenhsWDYzL1pZTm5mQ3dBK0ZiaW5SZXAr?=
 =?utf-8?B?VE90ZnVCaGFhVVczRG9ueDNMaVpYdDRDakFZL0hOTnBNeHFGZkN3QVR4dTRV?=
 =?utf-8?B?b0l3V0htVTAxTlZ0eXdsQ0hxWGo0Q24yT0RTTDQzWjVFNkUrSjhqYm1lZzYv?=
 =?utf-8?B?RjQ1REFObFRhUlpGU0lBWkFsbFhQOEozQWR1SmFHZUpBVnZyS2RnNXdiOFpt?=
 =?utf-8?B?WjluK25WU1o0TjNqdy9zN3E1U2t5MGs2eGtUYmUzVUpWTGZxMnQ1VENBQkxG?=
 =?utf-8?B?UXpEWnNXSGZqanNVTmh6bHVuRTBvbVlqNVpJc0kvREMyZ3ZTRE0vL0NLcWd5?=
 =?utf-8?B?S3hudk9Xdjc2a0YrTkRhb3RvbkJuMHFRYks4a2JrSExuT2VPSzVGWFJGanFq?=
 =?utf-8?B?eDBCZkYvY2loK0dEMi9FM0ZjZGRyV2lOK040UHVXTzBlTkV0MkV3VTgzQXcv?=
 =?utf-8?B?b2JqT1U2MzVZVHNMdmJmVFFaQ1J0SzNkOE8zUWpvQVRoVmV3cXE1OXVjVkFn?=
 =?utf-8?B?RzFPV0FkNnZ5OWdDSzNkSGFQMEhnUTBJSEE3L2FnL1ZndkFoVmluV1FsNGpY?=
 =?utf-8?B?a252dGduQzZ6aGFnTmM4ODJ5SDJDYUJFK2ozbk80ZzFDWEhVRXI3MzJvc1ox?=
 =?utf-8?B?R0xxTmgzcGo3bVBUWVNYTjZWWkpvcmluUWdta0YrU1ZFVUNIR3VDRXRlelo4?=
 =?utf-8?B?ajA5TXVPeU5QWlVjSGdHYzNGYkhYVmtyV2FSQTJOWDR5TjBLS2c3S3JsSEE4?=
 =?utf-8?B?YmQ5RFhhUHg3Y0NiaVB3NXlFd3ZSaFJhKzJwOVpxVHFSd09SMmNmMkJlWG4x?=
 =?utf-8?B?TkhKZGU0SGF2TlAvL3FxNnZwMkVaTXAvS24rdHJiaTZZencvQ1RBMFM1Y2Ji?=
 =?utf-8?B?Qml3aElOam84RmZTVDVIQkEzTFhuanBmR3dya0g4U21jaDk4UjdlRzMxU0dz?=
 =?utf-8?B?MWhuVGxWUkxvZHlyWXBaZ2hUbDdmZDhDdlozU05PNzVyRm5yZ0NVQlFucTBp?=
 =?utf-8?B?cTVqRkFrYnFPMFh5RmdvTkh5d3R2cGtMNnYyeU80bVRBclBmRVlIR3h5SnVz?=
 =?utf-8?B?cVFsc29KWU5mN0F6QUZKOVNDeTdJazBxSUlSYWl2WEcycFAyVHhHZ0FGZVJN?=
 =?utf-8?B?S0VUREdMdGwwM3ZabHk0MTJlVTRaUFFjOGNmaCtGNUZKTDU2WW1HZXcySGJZ?=
 =?utf-8?B?SFN0WUFnaGNyZVJpQVZXM0RCR2ltRDdObThNdjhFNFRZT0VVUGh1MHA3bUJY?=
 =?utf-8?B?aTlHZzVmUUd2T0lwSksxOHdyOTV0cEpGZGVHclhLbldWNDlzTGxwNnFhUzFD?=
 =?utf-8?B?OFQ2N3hCejV2ZnJMS3pXUnRqNjJ3UjdPU1hsV0N3MVdWZjFzUFNTelVGQURQ?=
 =?utf-8?B?MGpGZWd4WDhhcGhCVjMzem1KRGFrVHRhc2cyN1NhNWhONnJ4dGtXMFd1UkZz?=
 =?utf-8?B?SUlqcGEweE9rUWp0R0NIM0tzSE1weDNOdGFjeUUzVU9jdXlZQU9YL0FoUjU4?=
 =?utf-8?B?YVFRcTFXcnBUemxoNWQ5Z1NJaWlRWU9BeXZHVjlRMm1XbHpUWlBrUmVVM21I?=
 =?utf-8?B?TGZiS3RDdnU3czBlY2kyWFo4Tm5aVXlIcHI5c2E0cWwxL2JmTnVGTHJaVGNm?=
 =?utf-8?B?OEhqeVM2MmUxeExiOG1Kd3hpMHcxQk5Wei9CcXdGWEZWcVdqbHhjY3ZIYmZv?=
 =?utf-8?B?dVZoOGtudDdZbHBaaGJRa0lFcXpGV1J2b3Y2T3RlZHpwa25WcGZKa010ajBz?=
 =?utf-8?B?UHN6OTJLdW9NNG92QldLWTYrcVcrZ1JRQUpoQkxLV3hTN0d5NGs4NFdIUkdx?=
 =?utf-8?B?bndiQlYxYTh4T0plWSt5Zkt4VjVKczhLTWhSajQ5ZVBlRy9aTkx4aU1WWGo5?=
 =?utf-8?B?dUk3dTNsME1CbEVCTWZja3pMQzg3ZnI2OTBaWGR4NEJDTkY4QzliRnVSRmNm?=
 =?utf-8?B?OStVcUVnNEpRb3hWV1VBeWs4bUROdjlONXllMnM1dXRTazBBZGhlVTgxNXRh?=
 =?utf-8?B?REE9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bdaf1c4-b980-4e93-610e-08dab011369f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 07:28:40.4787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vCojPqbswj8PvAf9b9JQR4J/EfepunLP8LOd/xcOWs6gwJPwIXD7HqN6MikEzgUcxuqODvg3IvCOs02JW5QIHioMole1G3t4alGgu2qanG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8653
Received-SPF: pass client-ip=40.107.0.109;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the next patch FreeBSD support for guest-network-get-interfaces will be
added. Previously move Linux-specific code of HW address getting to a
separate functions and add a dumb function to commands-bsd.c.

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 qga/commands-bsd.c    | 16 +++++++
 qga/commands-common.h |  6 +++
 qga/commands-posix.c  | 98 ++++++++++++++++++++++++-------------------
 3 files changed, 78 insertions(+), 42 deletions(-)

diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c
index ca06692179..ebf0fb8b0f 100644
--- a/qga/commands-bsd.c
+++ b/qga/commands-bsd.c
@@ -167,3 +167,19 @@ GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
     return NULL;
 }
 #endif /* CONFIG_FSFREEZE */
+
+#ifdef HAVE_GETIFADDRS
+/*
+ * Fill "buf" with MAC address by ifaddrs. Pointer buf must point to a
+ * buffer with ETHER_ADDR_LEN length at least.
+ *
+ * Returns false in case of an error, otherwise true. "obtained" arguument
+ * is true if a MAC address was obtained successful, otherwise false.
+ */
+bool guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf,
+                       bool *obtained, Error **errp)
+{
+    *obtained = false;
+    return true;
+}
+#endif /* HAVE_GETIFADDRS */
diff --git a/qga/commands-common.h b/qga/commands-common.h
index d0583c6ddb..8c1c56aac9 100644
--- a/qga/commands-common.h
+++ b/qga/commands-common.h
@@ -56,6 +56,12 @@ int64_t qmp_guest_fsfreeze_do_freeze_list(bool has_mountpoints,
 int qmp_guest_fsfreeze_do_thaw(Error **errp);
 #endif /* CONFIG_FSFREEZE */
 
+#ifdef HAVE_GETIFADDRS
+#include <ifaddrs.h>
+bool guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf,
+                       bool *obtained, Error **errp);
+#endif
+
 typedef struct GuestFileHandle GuestFileHandle;
 
 GuestFileHandle *guest_file_handle_find(int64_t id, Error **errp);
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index e0ee0bea00..32493d6383 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -41,20 +41,12 @@
 #endif
 #endif
 
-#ifdef __FreeBSD__
-/*
- * The code under HAVE_GETIFADDRS condition can't be compiled in FreeBSD.
- * Fix it in one of the following patches.
- */
-#undef HAVE_GETIFADDRS
-#endif
-
 #ifdef HAVE_GETIFADDRS
 #include <arpa/inet.h>
 #include <sys/socket.h>
 #include <net/if.h>
+#include <net/ethernet.h>
 #include <sys/types.h>
-#include <ifaddrs.h>
 #ifdef CONFIG_SOLARIS
 #include <sys/sockio.h>
 #endif
@@ -2889,6 +2881,57 @@ static int guest_get_network_stats(const char *name,
     return -1;
 }
 
+#ifndef __FreeBSD__
+/*
+ * Fill "buf" with MAC address by ifaddrs. Pointer buf must point to a
+ * buffer with ETHER_ADDR_LEN length at least.
+ *
+ * Returns false in case of an error, otherwise true. "obtained" argument
+ * is true if a MAC address was obtained successful, otherwise false.
+ */
+bool guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf,
+                       bool *obtained, Error **errp)
+{
+    struct ifreq ifr;
+    int sock;
+
+    *obtained = false;
+
+    /* we haven't obtained HW address yet */
+    sock = socket(PF_INET, SOCK_STREAM, 0);
+    if (sock == -1) {
+        error_setg_errno(errp, errno, "failed to create socket");
+        return false;
+    }
+
+    memset(&ifr, 0, sizeof(ifr));
+    pstrcpy(ifr.ifr_name, IF_NAMESIZE, ifa->ifa_name);
+    if (ioctl(sock, SIOCGIFHWADDR, &ifr) == -1) {
+        /*
+         * We can't get the hw addr of this interface, but that's not a
+         * fatal error.
+         */
+        if (errno == EADDRNOTAVAIL) {
+            /* The interface doesn't have a hw addr (e.g. loopback). */
+            g_debug("failed to get MAC address of %s: %s",
+                    ifa->ifa_name, strerror(errno));
+        } else{
+            g_warning("failed to get MAC address of %s: %s",
+                      ifa->ifa_name, strerror(errno));
+        }
+    } else {
+#ifdef CONFIG_SOLARIS
+        memcpy(buf, &ifr.ifr_addr.sa_data, ETHER_ADDR_LEN);
+#else
+        memcpy(buf, &ifr.ifr_hwaddr.sa_data, ETHER_ADDR_LEN);
+#endif
+        *obtained = true;
+    }
+    close(sock);
+    return true;
+}
+#endif /* __FreeBSD__ */
+
 /*
  * Build information about guest interfaces
  */
@@ -2909,9 +2952,8 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
         GuestNetworkInterfaceStat *interface_stat = NULL;
         char addr4[INET_ADDRSTRLEN];
         char addr6[INET6_ADDRSTRLEN];
-        int sock;
-        struct ifreq ifr;
-        unsigned char *mac_addr;
+        unsigned char mac_addr[ETHER_ADDR_LEN];
+        bool obtained;
         void *p;
 
         g_debug("Processing %s interface", ifa->ifa_name);
@@ -2926,45 +2968,17 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
         }
 
         if (!info->has_hardware_address) {
-            /* we haven't obtained HW address yet */
-            sock = socket(PF_INET, SOCK_STREAM, 0);
-            if (sock == -1) {
-                error_setg_errno(errp, errno, "failed to create socket");
+            if (!guest_get_hw_addr(ifa, mac_addr, &obtained, errp)) {
                 goto error;
             }
-
-            memset(&ifr, 0, sizeof(ifr));
-            pstrcpy(ifr.ifr_name, IF_NAMESIZE, info->name);
-            if (ioctl(sock, SIOCGIFHWADDR, &ifr) == -1) {
-                /*
-                 * We can't get the hw addr of this interface, but that's not a
-                 * fatal error. Don't set info->hardware_address, but keep
-                 * going.
-                 */
-                if (errno == EADDRNOTAVAIL) {
-                    /* The interface doesn't have a hw addr (e.g. loopback). */
-                    g_debug("failed to get MAC address of %s: %s",
-                            ifa->ifa_name, strerror(errno));
-                } else{
-                    g_warning("failed to get MAC address of %s: %s",
-                              ifa->ifa_name, strerror(errno));
-                }
-
-            } else {
-#ifdef CONFIG_SOLARIS
-                mac_addr = (unsigned char *) &ifr.ifr_addr.sa_data;
-#else
-                mac_addr = (unsigned char *) &ifr.ifr_hwaddr.sa_data;
-#endif
+            if (obtained) {
                 info->hardware_address =
                     g_strdup_printf("%02x:%02x:%02x:%02x:%02x:%02x",
                                     (int) mac_addr[0], (int) mac_addr[1],
                                     (int) mac_addr[2], (int) mac_addr[3],
                                     (int) mac_addr[4], (int) mac_addr[5]);
-
                 info->has_hardware_address = true;
             }
-            close(sock);
         }
 
         if (ifa->ifa_addr &&
-- 
2.34.1


