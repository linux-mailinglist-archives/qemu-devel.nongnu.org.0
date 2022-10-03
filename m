Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 886085F2E8C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 11:58:40 +0200 (CEST)
Received: from localhost ([::1]:56878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofIDf-00053w-LZ
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 05:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1ofHvL-0006Rs-9t
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 05:39:43 -0400
Received: from mail-eopbgr80119.outbound.protection.outlook.com
 ([40.107.8.119]:34208 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1ofHvJ-0002U6-O1
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 05:39:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iptPtbUwQPAN96G85M8VdqwMf7HG3OG3p84P4sRL2uYXwo5lgUOiPN1hDVS0HfQG+imDUo1xIdI2Y4MzRXxGv/Vm9QipS2q1MNAGqstTQKHcug0k07e6V5IMRlJon/9vZ88dy3oHmdqkrdBWTPqQ2UQ5qmtDpvT7DB5ErImTNqDQ3bpbJjhFCwaFaEMCY5FkzFl6H7K6Ky5FZNGpdC+/zMfCbdLgnNgIy1tWXVGk2+q2a6JEFRnjRfJsx0fpl7iux5475t5oaDGt75+5qobPEupguQPPM81vAzBCv5H3NrFjAnw+/PlKfRsJpTbjGkMxOwOqe1dyaXOE0pLcVF/V4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gwi7mqwrkktrvF2e3NWIDyzILu4okqwx7LzXpwqJwjI=;
 b=l7Wsv4/5xIx+n3QPu9zPkUgroglc59APGcVobePYavkiQ/jeYww7JXbAMw+vUus9bIzIoAj6VxyEmG4UqGl6q3nZGHAPiU5SiNwjqkoHdQLILGNVouJTwAJFFuv88ShDRHcevYjMyDpKlgFba2ZLUrGPab+ORw/l9UsyR+EusUbjJ2Sdrw9g6I1LnV2TvyCp6Wpn5/rvWSxjaaMfhQhVp7nyrfufuOILOMjqg0H+627Qon2BjFGwBaZQie39VF+NUxb4e1jO4uSswQB2XdnsGU/HWYrJ/pTAurWmOfNKyTgXAlEV7x8SZ74bvcUXBVmYZ2sw/53AS+3eVA3yKozTqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gwi7mqwrkktrvF2e3NWIDyzILu4okqwx7LzXpwqJwjI=;
 b=n4zBocGPmjwCdBdDYy5NIXYwqq+gd6/WbILttJx1L6/MhbDqRNaTdnx3Vkx7aDEZycijRzNLStP3MEj8YPpLl4CLZO7hKAK8gEPMQ+PHgXuUImI9gbSCqJ27KHT8a2Obszqv5jCr0v0Z5XWGEPAclvDMl3DL+zHIye6bTxx3Qn5xAWtM1sGjLlgn/NSBzrZL8dz0UHhNHkILJgpAy9g1ZCai+oqp5QXRImwl0yZTuMHfF0yK4d112XVzKpPzkjBChsKKquksk8q5DXICRnK7hn85tgQijaKCbShWL9C0eFDbWIEJqABMbf7x+He86qjm18ddztz5wCnyDnOAvhJCpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DB9PR08MB8203.eurprd08.prod.outlook.com (2603:10a6:10:39e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Mon, 3 Oct
 2022 09:39:23 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.028; Mon, 3 Oct 2022
 09:39:23 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v3 4/7] qga: Add shutdown/halt/reboot support for FreeBSD
Date: Mon,  3 Oct 2022 11:39:08 +0200
Message-Id: <20221003093911.1844031-5-alexander.ivanov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7edd238b-0eb3-455f-bf97-08daa5232782
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sUWuf/1bt9Fon3Ro5rkgi7NOXDIsIw14dZnsxXkeq8/ik8QXNhXUFoT5m5ImDvoDHyuusvy3piPmUnqB7W0ZNPzGdBNfuLciJD39QA8W929vVqTOUA1RzFBCIQ2GjOBy1YkmLK7+U5zVjy4mmDFqjCsqJBTahiSVzx0mvdjy8GKSpYZkCec1edd35cHVA9ZgevZ1W+IUXC4hip8MOqk6evaN8CshyErfIQMtGz6OIzGstq9fEOkPFntljQsayldEixIUoysfwOwMkKLW+h5+f9qPxH1Z30ZtBn3a9mhPTJO7gsyDcd2ctfD8WyOik5+eOcRbjoN58l9CAgi3EOjdW/PhI1sxhcfiaZmaOa1D6XpznvF4BBLKqaIhvVOiTUeVHzbdfbQHG+/pV4G6UHSVTLuKCQjgaMd2ehC9nctB9qPOS3O0mpNSYZBw8SwqeEX6xLQLDDbD24N3hb7HfNCrLza2FeTsH64C2w662pvIuBjLYj8pSi18JkmDafZ+J1Ruqpa64sN6+8NoQ7egsXzAXTRxMNc7xuMT0jbghlvBewnDXk0GVNx1OHn1lyaX2AwNR18P4O7UeBK2OuFSnrX75i+Lc/oOaPcpDcJ7LbqZSv12rftLALYxFNUkMvGjtAU/8p6BZucZq39xA8+FfJ+Sc9HIluXLtIW8GP+1IJJIAvFFr9rZeU+g2DWY7kDgFumv4CZscGgsuSciu1pF+Gfb9eCJ7LM8fTorquE2H8/PrVMsuGKnaGtaw0vwjHgEh4wzgDWtkPFzCIF6kwBEb7vmuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(346002)(39850400004)(376002)(396003)(451199015)(6666004)(316002)(66476007)(66556008)(26005)(4326008)(8676002)(6512007)(6506007)(52116002)(2616005)(6916009)(478600001)(6486002)(66946007)(36756003)(38350700002)(38100700002)(86362001)(186003)(1076003)(44832011)(41300700001)(8936002)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0dZelpvU3gwOThTWmZCOXMwU0dkbjdGY3hUc200eHFCV3c1dUw1MXBETmJk?=
 =?utf-8?B?Y3J0bkUrYUFJcnp3c2tUUXc2Vml1T0tUN09kOXpxa2VGL0I4ZkZ3NTlvWW10?=
 =?utf-8?B?ZE9qMEVTZVhEc2thbmxzVDJ0dElqeDVFbHZkNng1b3RmS3gwK0FxRzJHM1l6?=
 =?utf-8?B?RmJoVjNzQ1pPVkZiV2V2bGxtVjRCeVdiSWZRZTU4OEpiWVBCM28yUHQ3SDZH?=
 =?utf-8?B?N1Fia2dYbzNhdDVXSGpRRlQxRW1ONmdCOGoxT0VTLzNmaGxROW9IMjhmbC9X?=
 =?utf-8?B?ZUR4VXE5WTJRZSt5ZUkwTTFqR203NFB2Ym42RVRlcFRhSllqM3FWWUN6QVJn?=
 =?utf-8?B?blNlS3pWN2ttSGJLSWV4MHdZbkZqdCtxZDgrZFAzdHFrejhodVhvR2hESU95?=
 =?utf-8?B?YjdraFFKaWhIaWpKWTZncklYb1VGUy9TbGUySmVoaHFjTmlqWnN0elRVRDBt?=
 =?utf-8?B?OFdPSUFwOU10Sk5ONFVzd2RrVENDRUh3UDJzd3h6NmgvS01SRDFtMGlHOFlD?=
 =?utf-8?B?YnA5SUUyODh2eHNyc2dxVWl3MkhyN1l3enYxZ1ROYk1zS0Uyc3NyN3NTUXBI?=
 =?utf-8?B?SU9GQjNsNGxhTzY3Zzg1TGFuUVA5U0M4K2FLTXUzWmNyTEVleWxkOEpBVDVS?=
 =?utf-8?B?OGdrN0dFTTJaTElJSm9tMUpHRzNuRC9Uak9GQlZyMVAxQTJadHJ3Um9xZEwv?=
 =?utf-8?B?WFQ3a1FEeE1zT0h6RkkwaEhKMXFVaHZTaTNUWEQxVUNjdUllZCtPbGtEaDlC?=
 =?utf-8?B?Tm43eHhSTXFnbWwvZUx3NEs1M20rS21XUTRjMjdrQk0xMlc3Zm1uaFVYQ08y?=
 =?utf-8?B?OUVpRUU0bC9kdWxUeXVyUDVrR25KZHdLQ2c3YUJuM2ZNSUttM3Y4dDBuMVQv?=
 =?utf-8?B?TGxTZ3dRMkVBWFJqQ0doVGdEQkJmekJJeFpJY0hLOW5BRXJPc2ZqZ3RpRDEw?=
 =?utf-8?B?bWozNGUvTFdWQzBNeFNqMVN5RmtJOWIrOVBMUFlNUUsxK2cyZitZMXlXeTNM?=
 =?utf-8?B?OWFUWHFKWDQybG5UVFQ1UG9HY3c3MmNFbUU1Sy9POTFYbXJDTEdrQjd2Ry9G?=
 =?utf-8?B?RFYxRXp0dUdLQzI5SlcxY0lTMGVrNWtySXo1Qld6ZmNKZ0MwYmlVUG52N1B6?=
 =?utf-8?B?OGU5czhPVy9wZko1eXRYbkNLVitiNDB2YW5ETWNrT2RPQ2NSNHYvOGI1SkdJ?=
 =?utf-8?B?bk1NUUpoWm9VdXpJMzZHaW42UmQzRVRNcm9oZ2tOWSsyQ0V0OHlWazhCUmpu?=
 =?utf-8?B?ZngxTFJwWDhHT3RBemtYQU5nck40WUFkeFJ2RlByaU55Y1U3MVFxbG9CVCth?=
 =?utf-8?B?NU1KcVc2U1pLU1N0d0lzZkszRTl4K2VNSldOaHNzUERpai9OYnhiREtab0VW?=
 =?utf-8?B?czBsM2s5MWE0cnlYYlJDanozMlFYRGtuejhRcGpHQ2xXU1NoTDdoZktqVk5z?=
 =?utf-8?B?N0FiRmU4UjRTR0VUMlZFa0U0S3FERHdteWN4dEN6REgxdVJBUDU1NEthSFZD?=
 =?utf-8?B?bDllV04rOXVBQytSb0szdmdhaGVZR3pRYVZlOXM2OEpHNm5BWmY0QjBvSUdF?=
 =?utf-8?B?S2lkR3pvako3SXBkWkhackpvYStWRVh5TVJrWGh4VTZ5UlErYk5WUVl3aVR2?=
 =?utf-8?B?NU5mOE8yMnQvUVFtTGQycVB4S0FNQTllZXhnUzRxOGt1NGVuZDZuVUJWTzV2?=
 =?utf-8?B?ak93bW9Uc3V1REFoU1BLWlRKaUhxV2YzN1RMN3RkK01DQVM4alJQMjc3ajVy?=
 =?utf-8?B?RHMycEdHZS9FbEhZd2c5MUtQTXNBOWFXZFdRVXEvVzRXbFN4U0VON2d6cVA4?=
 =?utf-8?B?dk1uVnVldFFENE5tQ205ajRCUG45ZE9YbEhsdVc3dUNVZ05hSE83OC9HMm1M?=
 =?utf-8?B?ZjNSK3MzVkZDdzNWMkhWVCtZUlNIbVg3QVpqSlJUN20vRHhyd0N6MVp1L2RQ?=
 =?utf-8?B?YVZxU1RMMEJPMVpIQ2dqWlZBQk5KeUh1QjlIVTVUb3MramlyRmVZNVpzcVpL?=
 =?utf-8?B?QThwZTd0K3NYdDZHV2dnUFhFak40SisrVDJaMkM1MzVORk9qWUtrcUNwNzNy?=
 =?utf-8?B?YldjUnRVMnJwSElubXptRHVTQVA1WnkrMXJzTXV0dDNWWjZ4K05NY3V4d3dl?=
 =?utf-8?B?T3Z6QmtDZmErbWJLNzkvVlFZMCs4a2svMy9DR2FpTldGYWNTNmdXOTAzSzVP?=
 =?utf-8?B?R2c9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7edd238b-0eb3-455f-bf97-08daa5232782
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2022 09:39:23.2914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5XF4tj7J2DEOZEeUuIfhtJfAT84nKrECXY19fmGedWoAh/Z2YuWibZgjRmq82OHpE2/ZWGFGWvNcvRTDqTiimoVFsGnePfxMQ2EtVjVbmQY=
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

Add appropriate shutdown command arguments to qmp_guest_shutdown()
for FreeBSD.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 qga/commands-posix.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 49f9996a9c..88e0d0fe24 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -90,6 +90,10 @@ void qmp_guest_shutdown(bool has_mode, const char *mode, Error **errp)
     const char *powerdown_flag = "-i5";
     const char *halt_flag = "-i0";
     const char *reboot_flag = "-i6";
+#elif defined(CONFIG_BSD)
+    const char *powerdown_flag = "-p";
+    const char *halt_flag = "-h";
+    const char *reboot_flag = "-r";
 #else
     const char *powerdown_flag = "-P";
     const char *halt_flag = "-H";
@@ -120,6 +124,9 @@ void qmp_guest_shutdown(bool has_mode, const char *mode, Error **errp)
 #ifdef CONFIG_SOLARIS
         execl("/sbin/shutdown", "shutdown", shutdown_flag, "-g0", "-y",
               "hypervisor initiated shutdown", (char *)NULL);
+#elif defined(CONFIG_BSD)
+        execl("/sbin/shutdown", "shutdown", shutdown_flag, "+0",
+               "hypervisor initiated shutdown", (char *)NULL);
 #else
         execl("/sbin/shutdown", "shutdown", "-h", shutdown_flag, "+0",
                "hypervisor initiated shutdown", (char *)NULL);
-- 
2.34.1


