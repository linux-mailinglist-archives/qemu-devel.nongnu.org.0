Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6805FD73E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 11:44:56 +0200 (CEST)
Received: from localhost ([::1]:55034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiulr-00019s-UG
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 05:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oiuRW-0002KE-K3
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 05:23:55 -0400
Received: from mail-eopbgr140123.outbound.protection.outlook.com
 ([40.107.14.123]:28929 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oiuRU-0004g6-LY
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 05:23:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RybOU+TMjgRfyC0Fy4xt+sWgIZWj9ZFq5qH99Jm+CiMvmHTL/dXQ+DSDUH3JXagWjzj0DMNbC/KionrL03wmyHyqQrMy6YCdz8GgRSVx3ikZVy6CEmtvbuSFaeDck9YupodnQAMEelthylnbnp0gTDWpAfJT2+krh0e5PPHaHWESfnLDU2+/V6M7uR10sT4DNsgE8kZwNeYYX7/Tt5CxJO5XW6aYH2jQdDS8OqVAq/AlOy8WmdypCN9EKWfXbZf31k0ruoTXrEX85ZXBZV5XWSeMxE3RdJ9gRLqtJhOhq3C/ymx1c3EHm0spQmTsIZBZ6LfjwvkGDAZh0byB+K8noA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vH3fbWs6m5SwLq6wrkYI4EghiwTsdYD/b7xbrn6+BCc=;
 b=JP/ouK312SkW92j1BHPxgGIhEpPUhV1qWn2twpfM9iNfjOBnxvhdUGONQSvHfnqFBJxgrXAEsa4IQl0xL5cY6i0+NTvb5FSZDMrjcrBXmegDyn/HxI/igbFSgZ/i64LH1s+VhfKx/AdQa6GnhfujhtP5rm4lBVCyuMON5EQ6/Wt2lHK+DGry6MffEcgISWaz1UEOnp6iwxavqDNn9ySkgI68dQpY6eDk8Yw+NtXpVJDT7aGYJAzka46UtjLygYTVmGJsQ1kmv5wfZY+fS04ClL4nB3xLXFUIQ6VRincKTOQlkDIp/GSeEu/K+7rsN21xKHBNM0JwN48m5nqIUq2ZKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vH3fbWs6m5SwLq6wrkYI4EghiwTsdYD/b7xbrn6+BCc=;
 b=b19HqBMcbbf0d8gLqAIbawW75d0AUGZScDBtcMvexY6ssVgpd5Z2Q5WKBo/ms7WawomF9M7SFJpfCQ8mCKQctBRL1n88X+zv+RJJKBPbjK4RiOdOIAJckNX8CDtLt1ngLN54+ab09KnLmEfwPGeuIQU/U5Et5k9bawGzvyuEUauPARSqFSN+o4H8+I3Mpv8oba9Q74Gu8NN/BLuFHzycXEFfmDLrtC4ndI+TmfNZqKoZqg/hv3Dp0XMS9ftvAvLe4PYwOWdRJ5RdbHs7kFoX5X7VjafvqhhCNKYqHuNWFITgBksGqUQticigurt6Qw4jMh2gTckkad4MVUZV97G8lg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM8PR08MB6466.eurprd08.prod.outlook.com (2603:10a6:20b:363::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Thu, 13 Oct
 2022 09:23:39 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.040; Thu, 13 Oct 2022
 09:23:39 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v4 6/7] qga: Move HW address getting to a separate function
Date: Thu, 13 Oct 2022 11:23:25 +0200
Message-Id: <20221013092326.2194646-7-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221013092326.2194646-1-alexander.ivanov@virtuozzo.com>
References: <20221013092326.2194646-1-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::22) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|AM8PR08MB6466:EE_
X-MS-Office365-Filtering-Correlation-Id: b907b779-6266-43d4-6344-08daacfc9d27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eevKZ0K0itz/tRTCV6ecTqdwekw/hTntfPPMBj0Pe7mTb3jJy7C/O6KxZfgKsHVuFke+f0TyMXkv0LgaOUOSJSSi/O0zfx0phbPDU8mXCwklooXb3IVUAuSTHFX26GZ2ByjCI0H8dCD4jEUj5vM8cffPBqMgVeWMlqRXXiN9yFUElKLxf8Lzqnka/nd+Bwgjc1MNuigxRW+elwi7Sps1RBM5Pj3SmNf7gGYtPv3bXYmdsK0Qj+em32t0M9qx+/CgY5Zr+B4o6gD1i6CQbk9dO9FnshOCnjaI02Ec6XLsbGMiBzINxfEUqxP549jcry9rtREq2RMEClDuW0htnZPp/kVRLb1gQRbVWjcrB/dBrIZsdw+/IBHjsRy+8lY6GmnPrVZvNyi52PhqlYKqAnPER+XFI8u+G7sQGf8Xyk9EdKZeUajSxV7gcg6dlmJ7o4jLoOYT2Y6TCzW4JBBmq0sF1YmObohruhJksRIL+pf2PyUQP0B///cNfIHgmr68DSiEfAK5ZlGpyh/CNRrVO15iVjPj6uI+s2oM1SSoykwwAa75I5IQhnD+p5hdiPNnwtyP33bnnC1PCIhcR0W53VemQSXXlACvnxchPIJbpg44d95nolOTTdTLwmqvZfItXv4XnQZyCJ/5nBWqPhUz/cPMeKwURipOVxpEr7vQKQXG9mRlr+7rt+anBsCc4PAh96XXwOaEapFI6tCI2mCHBr9KY0vcLa7rkCVykFPFDfzLdijC36YlyoN5UyethCk/uOyg5KGQcVq4OuFiMToO8KdTyw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(346002)(136003)(39850400004)(396003)(451199015)(36756003)(2906002)(44832011)(4326008)(6512007)(5660300002)(41300700001)(8676002)(66556008)(316002)(86362001)(6916009)(66946007)(66476007)(8936002)(38100700002)(478600001)(6486002)(6666004)(38350700002)(83380400001)(26005)(6506007)(52116002)(2616005)(186003)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2g1ZGhkZXJ3ZElmREs1ak80RTNoY3FacmRoRS9wTi8wWVZEaUVEeUlERXNE?=
 =?utf-8?B?eTJseng5U0Y3VUdOQkxzUGFMOFQ3T0kwVFVjTTViT0pIeVo3bnhnZmVEbjNF?=
 =?utf-8?B?MnlINkhjVkE5SEM4U0FoZ3N3L0tzUVpmWWNFVHZVbDB5Y1V3Y0NiT2VMdE1o?=
 =?utf-8?B?a0xNOEtvSmFuS2JGQ3k0L2dzdFI3RGM3OGdkTkRaSGFraTBnaGRTbUR6L2tq?=
 =?utf-8?B?dnVFU0c1ODZ0Zit2SmFCVXozSGlZTVNKKzY2SkZwOHY2Ynd5T1hTU2ttQ1J3?=
 =?utf-8?B?Z1BuZERFNFBqaW00NDdTeFhBNHNyb3dmcGw2K0pkdTZBTFh1Q1V0UDVoV29S?=
 =?utf-8?B?cE9ZYTlBQW41a2tpNFN0MXJ5RE12TWMxbG5xazdOK2ZNUzc3TkQ5dUhoQWF6?=
 =?utf-8?B?RHAvbW92OFFyQUtJRjZ4NXFFempNNFk5RURObWRCRmE5Rmc2WE1BSzdMb1dJ?=
 =?utf-8?B?RHFwYytiL3IwWVZIRkRLMCtEUHN0bFZxWEZ4MkxheVdtUUZsVk9XL3QxSnVj?=
 =?utf-8?B?Z0tiRXVwNnRxUjZIZmpDcDBtd3R3b0FIMm91OTAxWldNN05FNTFrS3gxOFQv?=
 =?utf-8?B?WEdkSkk0YVVxNnJYWG04dkwrNEVsLzBqM2JxTmVob3p3WXNjby8xenVQNTlQ?=
 =?utf-8?B?a3BSN0lnVWFRZDhIelF1RlN1Z3FCakdPTUNxOGlZYjFtSEVrZ2xiWjZyRW9Q?=
 =?utf-8?B?MWFhY2N0VW5YNlk1ajRxTGU0Q0c3Y2Zzd3JXTXc1b3g3cUJpSWk4c0ZJeEtC?=
 =?utf-8?B?MWxsZHROY3JEMlVoTjZHU2pJcHFGQWtaamE0SVpsRHBxbGNBTE5LRTlsSXI2?=
 =?utf-8?B?TjZoNE5PUjhpZktrWjZ5QlRTVElIU1NVUDNTYytBR1FkYm5scVlhbTl5K3hp?=
 =?utf-8?B?b0ZGbDdtUUx4dnVuOGtRTFpKdjkzaXBzbHFiZFVCNGp0QkNaOUdadzNEVW8w?=
 =?utf-8?B?cXhEcGFxNHFTZllja1hYN2I1WWc1Nmw5S0x1YlNoVTJDSlc1bnpHV255R1ph?=
 =?utf-8?B?c0t0eGE3bDRnN1JRUWlNTDAvazNnUjIycFdrTnhMajBDZjdVTGowT1RCKzRR?=
 =?utf-8?B?eE1nWjBrSmppUC9jSVU3NTE5S3AvMWJ6QlpKWTY1UTBHSDE5MTR5WnhqZ3Ra?=
 =?utf-8?B?OE4rTnFLVjh3a1hSZjZubmh4V0xlMGI4dWF3Ky8ybkdoWFlhQW00SDFlR3pB?=
 =?utf-8?B?ckhWMmE3dThQNEp4ZG5CU0FBcVFyK0NsWTNDaytIR3lFM0JIelhVeWZTY2Ur?=
 =?utf-8?B?S0FSQzJuOUtSNCtoNGtWdHNiVVBBcDBPejRwekVwdFcvSVAvdzdxYzVCUzV0?=
 =?utf-8?B?NTBsNGtJZG9pcHJzbDQ0R2dLaEsrQWM5WHNBdVJBVnkwS1FEODcwczJMSGpJ?=
 =?utf-8?B?a2dFN3NvblJjYUZLeUpuZERWcmlDWE1rUzFKWmdJVHpaTG45RE1ielgyN2hu?=
 =?utf-8?B?anJDU1lnWE8wbFRsajRiSmNkcHp1TUgyYnhIMTJCYTJPeWNMUDFsOVMyeUFY?=
 =?utf-8?B?R2lpRkVrVjNjcjZrMnIybUdEcjRsY3R2aHgwbUI2ampEMHNWVEVxT0g1SW5J?=
 =?utf-8?B?QkYxL25UcXcrQmpDOFFBUm1mRUU5VkZaN1BtWnUyR0UvdlpZSkhBL000RUdz?=
 =?utf-8?B?S2VaVGNmZUx5akh3eXdZTFl1VmlYUmk0djN6Nks0WkZLSGRYQkVBMjZrekJM?=
 =?utf-8?B?VWhXWVRxaFpaTjNPdnJyeFE3R1AwdUVESTU3V1NQeGcxNEtJVG9lbVVHNFor?=
 =?utf-8?B?cCtiNHBzUXpkR2JlaFY0dXlabTVsZ0xoTUxUcWVsWWRHMkxGQXFuRlFhN0hE?=
 =?utf-8?B?TjNKcVQ1dnhHVXltSFVWUFZRZTVXbzVJUE05OUV3SGJ0SVl0TnpldzhvbTc4?=
 =?utf-8?B?Rld1UGg5cjdQTm1RbWpkMDlBSmNib2tmdDZEZFNEYnNyVmROYmFJeFpXeWlz?=
 =?utf-8?B?Z2E1QzlzSzVWNlh3Zk1hcGJNN05vYWlwTFV1cmhDOXEyYmdNTzlXVWxhbGVZ?=
 =?utf-8?B?OTBwb1RNb3p1cERSNGt1VUlkLzZia3lMOWhFU1VHa0l1WUs1S21uMFgydHZT?=
 =?utf-8?B?T0tJdkV3NS9xUkplNFQwdVVQeEdnODhEOThmbmQySEZhN25uVVM3VEJTU3Y4?=
 =?utf-8?B?QUVBcEJiYU4wdmMrR1A1ZUxUalRnWk9pa1dMd3VScHQyRlJQWDQwcHovbzlV?=
 =?utf-8?Q?sOKF1JMto7i2871lnnvRCcc=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b907b779-6266-43d4-6344-08daacfc9d27
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 09:23:39.5624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LwRR3iXNL/tGgDN2ogMxm34Ke4iCg+yrqPzLyDgSCDOBuHIDZsYr/kTLu1yUKbxMQ+Q2cvq9elktoFzceBGZIf8FAk4S1a1wQPSEyf22ueQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6466
Received-SPF: pass client-ip=40.107.14.123;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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
index 2d9878a634..05d1f7ccdd 100644
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
index f5b9e5c530..787ffb1562 100644
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


