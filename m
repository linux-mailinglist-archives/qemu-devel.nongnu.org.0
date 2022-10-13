Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F403C5FD71E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 11:33:57 +0200 (CEST)
Received: from localhost ([::1]:33392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiubE-0002hw-3P
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 05:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oiuRa-0002Ll-DD
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 05:23:59 -0400
Received: from mail-eopbgr140123.outbound.protection.outlook.com
 ([40.107.14.123]:28929 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oiuRX-0004g6-Tt
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 05:23:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JcciapBzLuNKsRW0JRlO6csm3SrZ9img6WyiseARORedqnsdDXxameDx2R/CyCoO/Q/s3Cm37a6qamS4Sp1iABdy6p4OenMp0KTOawxV9inQ1NEMg/0v1bBtkptgliT4zas9ga1c3WGxGCZbReg6JAFJAOKH9Ijz5qxPfMFS3bHVM1rlqwgNmrcP6cSr3A9tlNK/mFCXmJIOlWZckZnpOegr7U5idiMXNcr51pimYWcc2RyOsF4iu0BehexAe/5ZEpdLgp72iTYhDXt+KxbBKRWXIireTlqf+N5YScsgrnXHUX8mFocS49LLYRuxgz8eaxxppRZv8PZSy0D47oUpHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxxmbxAcZk965Xpx44CaaKqYjArE71BENpKHlF/1fPc=;
 b=Hbg6909E7NWtSNzcVF4PByKzN4ueHl55KxdFniyid1WF3upHJhJugNVwVSByhLVq8sWaSNQOf+Vs/klpFSm5tsXcxc8Uerouui2mH81Zhg5ylmBVBF04mso1JYJC9kUzaQHHezcbUxFER4aV+cO9GHs1AFDjxoRYKjvhtk3x4cOlcSoEL1kAoA1oSo47svP0VQftDlWVDwSx8BG+sNcu8fQHP+SWv6m7Avnw+RRJm95XJooy1sVx3YtbWkJDpOFsJXRF7ctBhuV37s4xALqlp3HZb38kIbN0f9HyDEHGqvBXFpeE/3SguwisyQZA7H+ax25soOMr3x39pyiFJxhcrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxxmbxAcZk965Xpx44CaaKqYjArE71BENpKHlF/1fPc=;
 b=EbueDlinO6p8g7IuOxDMc2REII/o1t7ikKgH7xZFKVrwkVyQVf7nr3SnignppVAPDc3GlrQF20kFjTqqD1De6X4I3HEnOcs/KUBW+bg06n49yIxVLal64+60z8EZJqwDfSKMZHywPGutEz42q6ODqgoXy8wd45ywuB1uvcCpMyJ7zXmkqksZVfjqNl3D5ktOGoan8IqXAnqmqnRQUTiNKMqHkVzJ9/fvCkzcVjLUBqOalUGdPmt+qB0YtK7aoOwT9lurnlmuYo6N61vwYN0d0i2PJSKqwgZr6hQed/LAAFZmue0A67YiKvKMuW4RNCXn8nbpF2qOrXl4eClcR0Mx5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM8PR08MB6466.eurprd08.prod.outlook.com (2603:10a6:20b:363::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Thu, 13 Oct
 2022 09:23:40 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.040; Thu, 13 Oct 2022
 09:23:40 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v4 7/7] qga: Add HW address getting for FreeBSD
Date: Thu, 13 Oct 2022 11:23:26 +0200
Message-Id: <20221013092326.2194646-8-alexander.ivanov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 09540233-3558-411c-1f58-08daacfc9d89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wbZLJNcSnhXIbLr9RHFKETFSr2YLqiHaj0Mlvy4NIGGUoWMJuHSmvArh33RIkvM/7K0CcvHVmRa1RWfFwDD0+wwxVur6siXUSH9M+P/WKq6bM6zpP+XcLqhBIfailztRDLWmtoleX1MKoRbV0G6ibC2AVPOQjRx/P5KeO4WwamcqqkdNa3vWG+j3ZZY5cIL2saMkAcxKridym7teprL6ZSvTa+9qoDRYPW/USMgdl+9xhvvHjR8T8mFw/kzhF7xjEo6Gn0MpRv29nBRvFDE+86mxyytvsu2A0wRlVBLBkn2suY+CM1g+LMgmqMhB2tiSg/GhmGeqXlcVEJNyAzNm2u+WNzCtnvbto7EkOSGMYqVmcuZOiLBD+2zHNIdA9f6jyr05rWf4HaCNqAwsCMe0Qac0yXVCQYqbKPxcg3Fw/XsQ5jeimjxeiYmCLRrbaBeVMQG0WK2UJi5fq8Li/TEpSPHX+CvItNYQ79xwKfWHY2ZjphWC0QxLcTvX3edT+aXbV0FAZ92Sp06+iXvHqYo1GHtPuetLw1o1BNg1wcVd5Tu4ao/l7gV8kDh5LfI9AtBsqZwJZ8mzCEU8bPh/huqm09Qhus1hXxMBwtIVW1DIo+lshef2IXTbx0jF9disH+bReeWYjGpqFBBA0/sS7LLC9QUf4Q3DvTKX5da3OUXUD+TZ0rcv8d/zLQJpGcFUHSW3YZCLFhxa9RfbVO70u+dN4zjOkko6de7C38TI4bjIk35qaDusFChS3rmod2p9x1PShBXuDANhU+SpHp5eRWGhjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(346002)(136003)(39850400004)(396003)(451199015)(36756003)(2906002)(44832011)(4326008)(6512007)(5660300002)(41300700001)(8676002)(66556008)(316002)(86362001)(6916009)(66946007)(66476007)(8936002)(38100700002)(478600001)(6486002)(6666004)(38350700002)(26005)(6506007)(52116002)(2616005)(186003)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXJzTUJibG05U3lORlBJeWNCZkhDMTYrTFBOeTFVTjAvKzlwSnBaWW1nVDc3?=
 =?utf-8?B?bVVPV1FZa2hVd2RTK0Q0V1VtRzY5Q01jaWxwenBqb25jYXNnVVR4eHoxQmJ4?=
 =?utf-8?B?Z293QXpCKytJV200VERHR25tSklMdFFEWjc3ZGtBYkQ3eWN6NG5pMWhneGtp?=
 =?utf-8?B?dHR3MzU1SnlKTkl0UzI4eUk2WUdwVjZUME95QW9RKzdSeHBvVVBTTjdmalJK?=
 =?utf-8?B?Smprand0dEVzbHFPTXYrVkprWXRlQzJaeEJ4amZYc0FhMXByK1VFTm9qK0h1?=
 =?utf-8?B?bk9RMUY3dEN6K0pWVUEzcGYvU1lCVlpwMEdRN01jeFRDdTFDaFUxSnA3MDkr?=
 =?utf-8?B?WitWWWV6Uk4xdDBoRWwwSFRtOXgvbTNlMVYrT1NRalREandYek05Z05yMUk1?=
 =?utf-8?B?MDcwbkVkUmUzMmxaN3lvdGZyb3BDL3k3cXVJTlp4MW5FS3FQL2kzK3pkMFRX?=
 =?utf-8?B?bDRYZGpRbHhWZm1uQWtIeUJ4LzA1V1FYQlh5YXBabnM3aFJYcnIvSzZ4Zzds?=
 =?utf-8?B?eVhFV0gwYzlTNFFxcUNYcDg0T3ZVa1NnUy9LR2F1ejF1MDRPL2h0bUxLbkdi?=
 =?utf-8?B?aFBZQkhyUHEzSlFKV3lsWDRzdlNNREdkRGszb3JwaEc4RXU2Q2ZCK0RkV0Rl?=
 =?utf-8?B?cnMwWllCMm0rRStNd1Mxak9nOVlhM0Y3ZlRwank1ZWc1SG9mZVg0RHRhSnA4?=
 =?utf-8?B?bDFLWENJL01JR0RDWkVRR0U0RGpLdmhQUHFrdWNKU1o4QXZkS0dlODdQclpU?=
 =?utf-8?B?dU1JcDJBSHRCZVZmTmEzaStVTkI3NmRhWGhOSzhZT3I2cXBmVmdPQXh3Y0dP?=
 =?utf-8?B?R3FwcmpMclp4QU93ZTN2Q1J5ZXFmT0U4NkZycnRDc2pqN2ZUMU1rL1NMbW1q?=
 =?utf-8?B?d1dORm1LaUUySkNEODhpSkpiNVlTLzJCSWJNV21UckFIc2N6NG9kbzQ1b2Vu?=
 =?utf-8?B?ZEZhVExMV2orbTFGQ05ScHRDVDI2RHZJcFJhZExRWENjMzdKb01XWUhIaFBj?=
 =?utf-8?B?a2xvVG1FcnJhUkJQTUVsTXJFRUJ3UDdVYnFvL0E1OHV3SzhLTFNhQ3dzUlFN?=
 =?utf-8?B?Y0ZZYTJHUDJId2I0c2tjY1pSVjdlbVZJVHJvTW0wRFYvczVOOGV3N0V3NC9H?=
 =?utf-8?B?SjJrcVdzeXlldndkNDBGMHYxYlV0SDhWWGZpYk1ScXBjbzRyZ1BXaWtOZGFD?=
 =?utf-8?B?QlFXTFRMYnBTRGE2R2loeCtlSE1YeEpCUFFocEdCZU9vTnBhZnllNTJCL2tP?=
 =?utf-8?B?K2dDaHdKMFZoay9tbW9RaUloZGZtci9YbmNGaVBTQkFzTDIzWmIzLytxTCtG?=
 =?utf-8?B?c2ErdTVmdURROHlTaVVhMHRIR3VqMEZER2Vhd1hzVkU5WGkwdWhUQjd4bXRn?=
 =?utf-8?B?Skl5cXA1eVhibHhUSVdIY0ZxU1BWeHlyWU9ZVXhoZzZVbkprSDdWeUxPdnJ5?=
 =?utf-8?B?eE9tSkpKQVVoN20ydkxnTzczL2tQL0tzUG0xVVVQYzI1NFA1akU3eXVaZ0VK?=
 =?utf-8?B?R0swUGV2ei9SNmtHMXV5YmMxSkFsL1UveEhKdTZhdkQyb2Q3SDhKR1hCZEI1?=
 =?utf-8?B?OUR4RWdjTWFHQlZmNE12eXJCQkZWMUliTC9ML2RJVGU0QXRmN3hpU01NbHNj?=
 =?utf-8?B?SWI5SG5QRlYxZ1JUc0pjNEluRkNpb3owdmprT3R1ci9oMzlkcG96NnpNVUM5?=
 =?utf-8?B?SlZrOG1xaC9QSGh4YmVueUI5YUVOUGlwbXIyQkFlU1UrL1grMGcyaFBYQ2ZT?=
 =?utf-8?B?NjBJd3M4K2Q2TWFJZFdMSTRqaUM4NnV4YWFBVXEvYXZ0SWxYWTRkWUFhNGVa?=
 =?utf-8?B?eCtkS2hXNXpXdjJBcGREMzZhZDJrVmNhaGNTTkd6bXU4OWhqU0UwdFZzL0NM?=
 =?utf-8?B?UGhEZTdNRzlqekJzTndIWDQrQ2lRYVUyME43QmtXZ0tXckUyUUNDaVJLY0g0?=
 =?utf-8?B?V3NWVmdGaHVrOW81S0xXSHVvY1U0NUwzTXBiaFJZVFFUbytVWS9xakttWXdV?=
 =?utf-8?B?NTNHVm0xdFJBVFNlNDI4YytDbmZSVnVQcEtES00yWW1pRGdVbk00cXY5djdv?=
 =?utf-8?B?eTYrS2xLek5mWXBmRkxMNXpsZzR0dVpRZ2RFVHhKRkJlMSs1U2ZHMFR4UTNM?=
 =?utf-8?B?UGNybHlzc2NHUDhpVzRsQUo4SjNMdFNWR0huRVNwU2N0eTA4STRLVWtlWEw5?=
 =?utf-8?B?YkE9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09540233-3558-411c-1f58-08daacfc9d89
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 09:23:40.2498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zWTjW3Akn9pXYo+onZHVA50YvGLNePnA4LX4nRkPODSk+CETakxqmpDBMZxwfRvL8QY746Mt19Ge7UGL6Qkey42ED0ly4VIk3OHGLsPYoA8=
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

Replace a dumb function in commands-bsd.c by the code of HW address
getting.

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 qga/commands-bsd.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c
index ebf0fb8b0f..15cade2d4c 100644
--- a/qga/commands-bsd.c
+++ b/qga/commands-bsd.c
@@ -20,6 +20,8 @@
 #include <sys/param.h>
 #include <sys/ucred.h>
 #include <sys/mount.h>
+#include <net/if_dl.h>
+#include <net/ethernet.h>
 #include <paths.h>
 
 #if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
@@ -179,7 +181,20 @@ GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
 bool guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf,
                        bool *obtained, Error **errp)
 {
+    struct sockaddr_dl *sdp;
+
     *obtained = false;
+
+    if (ifa->ifa_addr->sa_family != AF_LINK) {
+        /* We can get HW address only for AF_LINK family. */
+        g_debug("failed to get MAC address of %s", ifa->ifa_name);
+        return true;
+    }
+
+    sdp = (struct sockaddr_dl *)ifa->ifa_addr;
+    memcpy(buf, sdp->sdl_data + sdp->sdl_nlen, ETHER_ADDR_LEN);
+    *obtained = true;
+
     return true;
 }
 #endif /* HAVE_GETIFADDRS */
-- 
2.34.1


