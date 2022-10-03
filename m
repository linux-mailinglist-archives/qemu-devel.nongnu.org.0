Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0218A5F2E9A
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 12:06:25 +0200 (CEST)
Received: from localhost ([::1]:54480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofIKz-0001Lz-SZ
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 06:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1ofHvP-0006XP-OD
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 05:39:47 -0400
Received: from mail-eopbgr80119.outbound.protection.outlook.com
 ([40.107.8.119]:34208 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1ofHvN-0002U6-O9
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 05:39:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c3I6H2bOxjJiAko77L6vGk8zZnYh5Bnk9X6/dUQTVh7RFOr8nNgw2XpxDTOGexSfd3I5E9rAkdN2LMrraRwVtJwoU1xm0HR4sjjcE8UGoBuwVoOCQimfl03wvGNXssqAUY6N/dknGtfDIEcxrjNRVp8HauGTwmNwGI2zRaOKdVl160m1OuSsFNIpzEMbZdO2pTGgp4/75tTwD9qSozpNZKPColh2WvzVoBrZZcDdoaOXS2yrWhPd3WfQeFaDe9rhZglVYE6ewIUIMteDnVdnXdAkGbbqHQJ+n7tTw7rqJkPhTltz+utHmup9BOxaQxKmmq0fI4yZ/WmPhfLovGzTlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMmb0KLPqmWq8e9j4AHAUqbvFRHTz+zJGmVL75zIHYk=;
 b=ZA21u4YQcCgG95QEwSl5dOx32RWgpY0whfbEwTuf1VI/l2nF9zNhi+m9jUgp6/r+yHBbYVGobUURsCCGo8pMPsBRNBCG5jzvYyS7LbZsMEoUJznZDV3uRKd5WDH4jNoATImwBhkIgXxOgNnjXp9gBBmJBSOiXHYJgU7eLywzVjpazq7StG/JtM7cmF1wDn1MU7CEQZlgRmxNuvls3NWuCXqLJPoPXxkgSCRurqyI/h3cwzwkP3yBEPq/NuPyJJ/wtyFWjT24nudMaX6dDTFQJkG9bn7W4/HvyFozwiLzaRN8l1BAcTE7PBo7Tuaf1SKju+p3LpKfCq8x6VyEDDTzsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMmb0KLPqmWq8e9j4AHAUqbvFRHTz+zJGmVL75zIHYk=;
 b=EeAsdCifkrqDZ98buLhPcYooC5fVzpbRT5glxLffevqWFy1T/SNZxP7WHqIOIGo1d4PZTy2uX+T54lw6ByIxJ5WMuj9kxcek9Gk2sjP1E3okcJRoMGA5eiunUI+wm+2+CAmaZJPPkCpDIZkuOk3NYDG1MljHvaOGkahvdBeEIsianryC/v6WGIAv9Ua2JuVMEYDp3mwWz6sbjLBKHErWmidju+AtcWPlH7schtOmkwORXgr1MGElCkDFp2vGJUEXgV4axA1owoz1Gplr9v4324RqNcrQr6UIo9FEQtIysC37oY5Tk2q6FbRknpMB/9o/g3TGw6HOA5IlXlVUgU9ezA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DB9PR08MB8203.eurprd08.prod.outlook.com (2603:10a6:10:39e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Mon, 3 Oct
 2022 09:39:24 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.028; Mon, 3 Oct 2022
 09:39:24 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v3 6/7] qga: Move HW address getting to a separate function
Date: Mon,  3 Oct 2022 11:39:10 +0200
Message-Id: <20221003093911.1844031-7-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221003093911.1844031-1-alexander.ivanov@virtuozzo.com>
References: <20221003093911.1844031-1-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::8) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DB9PR08MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: f26864a1-b788-410e-6655-08daa523283c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z5uTOTTz5aZe0NFHJvLPQ/ZBFVLt4nJHJYdHFT+2Oo5fHwnWNLcXjX5L9pFkWHTdKUN95J02ruKuP7E3Or3UWwy/SrRSYgBvfLAZDXXVrS8xYsYOEPuQZ8Dzix6ynu/5bdWNPI8ejdUhP2aEfdsQKoRt04f+5dwtVITgcoMedzWXuKdlS/rpwdS316iXhGTge3cK2ayu/lYSsJt9jZEfEIak5VRUZKJg6yTfCxkHX6KV++Kpt1mcuTQqjaKAESgzmOQ052n39kP7UCNjfCk+ChFedtJKsd+oryGwTYK67YYFppoxHK3HW5aooHW5SmbNPRUYLt8DyiyLtAKgNYTsMjRcRO5Y6yMuR41NZBFuTGyhhIqZgv5C/oCtiNFKlHgapthB/y9QpUoxfHDtHwtLj03lJ8P+CIq1O9tNLAiiA5PZ1FB4rtEHMZJAQAuG/cNIVuQY3kP3xCqXhKCun5lFRk6itRszwe700DicKQUCy2GZRRXk5MQ8hSz8+KpbVnj/ENoT4hUwWJpem3V9IPH27A1yrb1I7l04OipgieigxSkT4a85tf24aWhfEVsq5hCC7Nn6bjDevspU72Wv2TCiA/xEopMExF5fAueqB/NKX95YTkFVlDOOc/+bGASDNju23ogoaevR6X7dirUtqILdr7XLhWrhCXp63e/vQmgeyXFiiD8O7jV/ffBpv/DZMz32GwJz/61WNJ1f+K/DrwUHYjetJIMx4FdhR3Dek5I1nfEF0u30l3DzuHFNKV9F1ERhRcmySDO7aj5qs3IHvj4PUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(346002)(39850400004)(376002)(396003)(451199015)(6666004)(316002)(66476007)(66556008)(26005)(4326008)(8676002)(6512007)(6506007)(52116002)(2616005)(6916009)(478600001)(6486002)(66946007)(36756003)(38350700002)(38100700002)(86362001)(186003)(83380400001)(1076003)(44832011)(41300700001)(8936002)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnFPbVVISllOQmJsQTJQc2J0Q1EvNUU4NXJQQzBLb2dzam1xOUtQL3hZcndN?=
 =?utf-8?B?bVA4VFQrS0tYVUFLRTRESjBTWWZwRFQyQjdhazhwWm1vcy9zcUdyZHcyNTlK?=
 =?utf-8?B?c2VPRko5RWxOZDdtWWpjajhPVmp2OHhNRTVwQVArWk1zOG4wdFIxZi94eUs1?=
 =?utf-8?B?TjN1RGl5OEtjWEwxVm5WQkV1ZkZkUFVHNVR0QVoxakhpY09KcDVIdXpucmNj?=
 =?utf-8?B?eHpYdy8wS1VrWFVoQXF4MEZkNTJRd3hGUjc1aUQzOFpya3F4YlJWWGNhV0Q5?=
 =?utf-8?B?R3Q5UVlVVm0vVXVKajdzcldRZGhyOEgwOGNHcjlEZlJpU1lGZ3JPN2pOWkUy?=
 =?utf-8?B?bXJkbno5R0RDMW1CMDFXS2tMclBOK0xic2hNWFhCS01PZ0FCMm5DZjUzQjk0?=
 =?utf-8?B?aHN0NnJZZVhkZVdDU3lIZW10alhGSXJjN2h0dmtLZ3hGVFJCTkxRc0FqWjJH?=
 =?utf-8?B?aXUwYnlGN0dJajdjWXFhKzkyZzBlUnlZekcyZ1JTVmlmTjdvUThxUHFEMU9G?=
 =?utf-8?B?WFZCY0tXVFUwUTVJVXhiMDB0SW1jQXhlak5WSEttUEZnUHNGRDZMMkRFQW54?=
 =?utf-8?B?Vko5UmlicU5MSFRjU0NoWWZ5TCtsK1hTeTN3ZEVZWTBnaUpjMGZTaFlram96?=
 =?utf-8?B?amt4ajZsdGF4b2pOSDNlOUV3WkF1RlRlTE0xMkxsVCtCaXp3cDJpWjBvM2U0?=
 =?utf-8?B?NVoxRjdLVDBaUHpEdmovMkoxUDVISERqcWZzWFlpSFBPeHB1WlJCdXI3dFhr?=
 =?utf-8?B?V0g0N1VpQWJLeHJNTTlXMGtQZGpqRkxZT1paYzNRN1VUTEsrUjRxSEhkaDRP?=
 =?utf-8?B?RmdDS0ZpWXozVExGc1hDUDI5NmRGY1hHbnc4ZzRaTERsaXA4Z0g1VFZEUDEw?=
 =?utf-8?B?aVQydzFuSnJnak0zU1o5U3JDRjBLcDJDTTlLWHR5enBxOWpvckJXKzg1MzJz?=
 =?utf-8?B?NDNTM2tCVlRuTTZySU1qL0RSYVJMTkcvZi9NdjMraitJaVdRckZnMDRlMWd4?=
 =?utf-8?B?SDM0bmFzTEFsRVdYVkFRSzlsS2ZhZHJ6cTA0K2hCME9mSlZGblFZWE1zem5r?=
 =?utf-8?B?S0c2MC91aDdrQ0NJeGFRU1doU3ZoQm8zMXJQNDBhaEhFdS9mcTdxQVcreWZ6?=
 =?utf-8?B?YXNtNzRUN2pPemNNVGZQM09iNVhNZm5pYStrOVNZd0p6c3VGbksvV0pWbE5R?=
 =?utf-8?B?M3lBN0pmKzBXTG1nZ0xoUkNVYjk3cUQyQnU3N0hQMXQ3aVhJRmhFS1lwQlFk?=
 =?utf-8?B?a3RIc0E4Mk5hK2hBMlRxd0RPOTgrUXBrNzMya2Z3b2FBWE1HcytEWm1ySXBm?=
 =?utf-8?B?a0RvV0x3M3pxTkdXZkNMaHlIZmNZVHJJb3VSc1d2WmpHNTNmNXBOT1UrVHdm?=
 =?utf-8?B?RHRkVE85WkdGNzFEMWVOd2VDMXhmSjJCd2FEbld3K2t6ZDNwZzA5ajZLVWNL?=
 =?utf-8?B?Q1RhRGU1Qk9tQktJV2xNZmZtcytROHBkYW9OMGhnUk40aHYvT0Z5SU9ROExx?=
 =?utf-8?B?TEFRd3VpcUhnS3FGV0xkTGlZcXRrUTBFRHJtdEdFRlR2ZkNKbnUxUFh3NVU0?=
 =?utf-8?B?SzJCVWc5R3UzeFZ3bG1BU3IzcDgwVjhWcER2ekJBb3FpMEx3Ly84UG04SUsv?=
 =?utf-8?B?MGVsY2duVzM1Q2hKWm9CV3dHWUJjM1dhQ2dpUzE5SHMvYXUraGdIc3B3QWJW?=
 =?utf-8?B?UGp6VHpTNnZFRGlsMWpPR3ViazYvTWJodVdvdElSQkZFdzRISlR5ZEVtdk9V?=
 =?utf-8?B?UTBDRUIwaDVhc0VlOHZOTXp1MmE0eDVXY2FDODBYbVZqc3BmK2VIN3BYZmI4?=
 =?utf-8?B?MVg0Z3ROZ0FNVVBESVhLbFZheXlud2VZNWRXdjRLVHlmUXErMEF0UmI1RzFt?=
 =?utf-8?B?RVVBVTBiTXFGeFdKNjA2SU1vSVBoTGlhSW5mSGdYQXdhRnc2MzlpT3o2dDB0?=
 =?utf-8?B?RkhieHRqZm9IRGhaOEtWbHNwaDFFeWZaa0laYk1VclJZNWdsMWJQSVcveW9R?=
 =?utf-8?B?YkhYMjZ6Z3ArekE3U3VQdTZvRnkwSmgxZWxLeGFVOFdmck1teEtwRnpHTDBK?=
 =?utf-8?B?REh3L2ZGb0htNzFjKzRlVzNuQ09yVitzMDZUWkMxNmxzNkJKbVIrRmJibGlD?=
 =?utf-8?B?SEMyWmp4M2J4eUhuK0U3S0tncXB3Ymw3TnVpcnhMTlFQUWJVRjduemtNVm9Q?=
 =?utf-8?B?NVE9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f26864a1-b788-410e-6655-08daa523283c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2022 09:39:24.5081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z0Tt1jQJO2sJIiPxBCEKBDBFrWeKnMacmKzFkX8GY0OMDjZGNwm6FBdo24za/N0tXqaVwEaqJ/9NN8+xzVKZiraBHubY6PYz9L/RPSEBv64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8203
Received-SPF: pass client-ip=40.107.8.119;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 qga/commands-bsd.c    |  16 +++++++
 qga/commands-common.h |   6 +++
 qga/commands-posix.c  | 100 ++++++++++++++++++++++++------------------
 3 files changed, 80 insertions(+), 42 deletions(-)

diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c
index ca06692179..40f7ec7600 100644
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
+ * Returns -1 in case of an error, otherwise 0. "obtained" arguument is
+ * true if a MAC address was obtained successful, otherwise false.
+ */
+int guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf,
+                      bool *obtained, Error **errp)
+{
+    *obtained = false;
+    return 0;
+}
+#endif /* HAVE_GETIFADDRS */
diff --git a/qga/commands-common.h b/qga/commands-common.h
index 2d9878a634..a9cdaf7278 100644
--- a/qga/commands-common.h
+++ b/qga/commands-common.h
@@ -56,6 +56,12 @@ int64_t qmp_guest_fsfreeze_do_freeze_list(bool has_mountpoints,
 int qmp_guest_fsfreeze_do_thaw(Error **errp);
 #endif /* CONFIG_FSFREEZE */
 
+#ifdef HAVE_GETIFADDRS
+#include <ifaddrs.h>
+int guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf,
+                      bool *obtained, Error **errp);
+#endif
+
 typedef struct GuestFileHandle GuestFileHandle;
 
 GuestFileHandle *guest_file_handle_find(int64_t id, Error **errp);
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index f5b9e5c530..2a172c6492 100644
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
+ * Returns -1 in case of an error, otherwise 0. "obtained" arguument is
+ * true if a MAC address was obtained successful, otherwise false.
+ */
+int guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf,
+                      bool *obtained, Error **errp)
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
+        return -1;
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
+    return 0;
+}
+#endif /* __FreeBSD__ */
+
 /*
  * Build information about guest interfaces
  */
@@ -2909,9 +2952,9 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
         GuestNetworkInterfaceStat *interface_stat = NULL;
         char addr4[INET_ADDRSTRLEN];
         char addr6[INET6_ADDRSTRLEN];
-        int sock;
-        struct ifreq ifr;
-        unsigned char *mac_addr;
+        unsigned char mac_addr[ETHER_ADDR_LEN];
+        int ret;
+        bool obtained;
         void *p;
 
         g_debug("Processing %s interface", ifa->ifa_name);
@@ -2926,45 +2969,18 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
         }
 
         if (!info->has_hardware_address) {
-            /* we haven't obtained HW address yet */
-            sock = socket(PF_INET, SOCK_STREAM, 0);
-            if (sock == -1) {
-                error_setg_errno(errp, errno, "failed to create socket");
+            ret = guest_get_hw_addr(ifa, mac_addr, &obtained, errp);
+            if (ret == -1) {
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


