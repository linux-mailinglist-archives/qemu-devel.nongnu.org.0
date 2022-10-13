Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CDD5FD7C0
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 12:17:22 +0200 (CEST)
Received: from localhost ([::1]:58366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oivHF-0000MS-GM
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 06:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oiuRR-0002GB-NX
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 05:23:49 -0400
Received: from mail-eopbgr140123.outbound.protection.outlook.com
 ([40.107.14.123]:28929 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oiuRP-0004g6-Ly
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 05:23:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W3BnmwIx9HFbpUEQRZe3GId4OEf1n3usGhIX4vu6lKc8sbxIqEEIao9FcylpNOSyG4XzVkzzlPTFH5XdGjITdScAklpzsgigt50XSYmYkkmJBV2BMZGlYufsJBzCEIuL/LJjtjLvMSBKDUmX/JqKZpdDziQCpcys0eau8Js7v/CIpV7VdeOFq5dRo6NTIUxgX9As5Msx4eMlet5oS1BRPe35ov83pTT5Dw85eqSffX+Q1g/BfgC8LDYelGgEuUwP9wOQkQAjV2dbNIdzf02fLj3SfFDsxcln1GYYGNJGnUYK/u83tEBmhsHUt+CrLEShvsN4gNE2Jl/ZdP8xJANosA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rkK0u43PU85jFfHhbme9ZUTebOFAr5bhhPIK+wC4mG8=;
 b=KwU8Zots78kDaIRjlFrn06RQeAUksxmm5FCwkHjsFGqBmAY+DP6M5wv1fox9GUCOmJ8Y6vk8z1Brez5PJucM7QHxZS2xIiK6sWot641y0xqyT/2ZtY+PA2pKD2/o6NmksBaYdx8KtbNiKlCvzJUIrjjGhW0JDClPstH1FvolHwTK7MCp/B7ZcDx3fx6Ac4yMhShx7GdxCDaw28YuLOzX27KLS2xTaw5GPzjdB1YKp3nqsC97Ddl68g9LVGgOAwZ97h7ELrMYi/gLMSRXOILY2wfGnWCVjlRUrutvjJsFjlr4nymjoTgXbvGatgGEogUuJme8zxXXrKt18v+cD16Niw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rkK0u43PU85jFfHhbme9ZUTebOFAr5bhhPIK+wC4mG8=;
 b=r9VS2HvYio6DOOvP5Xq1QKGA2qnzRPiWujSUrnsKeOWTPKN8dif5CwPJ0AsROCf3MI+s6VAEmNZc/uAvo7oa4lhO1WOGvmFpklYjYV9N43XQw4kIMv1tS969TzVfOzix0E8kbwZmL9jxlozyduC5tD3y36kpZK8GDCejBLbToiS/S40JKBiuUn4fLLe0pXEVG95eeQwAyxNwi2IkjeeI1pCLjazWdIlCmmfqJXXan355/1Zz10JGYSYGC7kuZkk3UrR81LpqkdzzYF/xa0t0nvZRjjgzrHSYI5GWQm0YoEhyfzxuUN/H6jCzBDtV+5CgW7+d/JZ4PlI3ZH8U9EsvMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM8PR08MB6466.eurprd08.prod.outlook.com (2603:10a6:20b:363::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Thu, 13 Oct
 2022 09:23:38 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.040; Thu, 13 Oct 2022
 09:23:38 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v4 4/7] qga: Add shutdown/halt/reboot support for FreeBSD
Date: Thu, 13 Oct 2022 11:23:23 +0200
Message-Id: <20221013092326.2194646-5-alexander.ivanov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: f4d2ef11-21fd-4582-671a-08daacfc9c36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e3TfhCsooQhUULGDwKmks1iZvbOkyC8UZi1jyidmMOLTB/CIH75YoGhiS7vG0VsmR+HouShJ6c8ZIV9fpQCXr0pPloHPQm3dqQ465OPhTWPuPcC6tQCVAy8zQ4orPJog9vaV01VUNLNFFJYt4V1L5szEB0eTNmtH4VOK9V5zVv061xZj8BdpqLBCWNx4TPzLWCeqTLhuxUMih5M94LrxCO9B8IAn3mfp0KMIAcUpOk21QqOVmDJE62wVEAalGZt/DQuhI1WEbQKgAN8ZSvi9GoHlBw6Gan/mXXk5XPVTfyhfphG6d3eShtpCV1tK63mZQZx4IyYWCfeT3dFoNsJCBE8HSxOvkJ3EBqrIIPNG801/IU6Mpaz7M3HdF32e8pllOxcsFhbj66EhojEAFDubuN8p1pkYc6Z1LrIUFVuDSyDCTkbrDznFXAROslZdhGRbcSg14V8RJQ58ot9xEPEM1oxM88D40qOpIlpluqH/H2CVYjMsV6awBgT2wA0nhxkkLjqNhOvvET36s9oKfWgfXHUsvXLwU3Ilkr4OK7qWNNcz8xeK57H6hm1uPxkWBg5nusvEHanunlO6ytsxQvYAvCYqyWyLceYrJCja+NRumyKHo9qNT3arRbaQzRIoY0texrVL7ehtudjqWqJT+TxsAs//lVng4wcRy+ustPmBZcE1SOZt/aBmE8amqI4Pxz4EWCAHHN5+mlj6DybQZfzq+JBbZ3iveo4Dy5sjnxmuqHVNDRCAwicQl0jSlOo4P26USvzRnEZ5p+JlQ1pdA4PqiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(346002)(136003)(39850400004)(396003)(451199015)(36756003)(2906002)(44832011)(4326008)(6512007)(5660300002)(41300700001)(8676002)(66556008)(316002)(86362001)(6916009)(66946007)(66476007)(8936002)(38100700002)(478600001)(6486002)(6666004)(38350700002)(26005)(6506007)(52116002)(2616005)(186003)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckVlTnF3bkFXTEhOWVlxTlRocEIzVytZN0QzL3kxTUgvUCtWL2xBZ1pLYWRN?=
 =?utf-8?B?ZXF3Vk40VDViRlRmMEpla01ickVxVEFsa2w5bDVidytzL1FibWZpM0dHUE0w?=
 =?utf-8?B?cVNqTmVleTdiY3Rvb0ZlYnlqY3pFcUZ2SzF6ZFdSTFNUVmpRNERTS2tQM0lJ?=
 =?utf-8?B?bUVreWhTZU1wRUVvaURYbUZ0eStJeG83QzlzdU5xLzMwUFZlaUNxS2k1NXl6?=
 =?utf-8?B?ZnFIN3NmbkgzVU5rSEZObUs1VlE0azh2d0lIQW5tV1lxckZvdEIxU0tJdDF3?=
 =?utf-8?B?UWxHbWErMHdFL3ZQcjBtU0F4b1R0b0RzZVNHb2NGOE9od3hDQWt1Yi9PN0hh?=
 =?utf-8?B?eGUvMzREWFBpWDNjL1BSNG1tTnBRMk1JenhYNGd3OC9Yd3Z1eGgvVk1JWFhC?=
 =?utf-8?B?NElHWGl5TnpoTGNkbW9IZE5CR05XUWF0TWtEbVZFamFkWWRLZjMyS3h1azVC?=
 =?utf-8?B?cVNmbEdRTXFmTkdnLzRoMmhtb1pOS2ppNDlsOW9rNlBuSG9NbkpvejlRSUlI?=
 =?utf-8?B?dEdkNGplb0JnSkZidTF2RU53aDNWV29iRGNJVHg2eVl4emNBV25La21kTUts?=
 =?utf-8?B?N1hJUmhvd1hnbnVVNXJNU1A3SGJDZXYwZ2NhSlNPTXNVTE83OEZCL2M5Ukk1?=
 =?utf-8?B?cUtaV2Ewak1DbUlVRTFXdlpkMWpEVGF6alJLYUYwK0hGVVVhVlFuMjg3QzhE?=
 =?utf-8?B?UlIxdXJxWkJiOTVqT0NCSGpmMlZobFRhVDJLYk1BYWJhVG5jRjBNbFNkK3lk?=
 =?utf-8?B?bTR6WjZ3akM4Z3NmK3p1aDNpcUFZR04zOEJOUzlhREJKOTl2eGxqRUNWd3pl?=
 =?utf-8?B?QWs1MTZpUEtGdnJtTUdYelE4NWExakNmT1hiTmhVQm50dEtZWGpOMzlRaTJ4?=
 =?utf-8?B?VE1EUkdFRlpQL1cxdzN3UHRZazA1bGFvNnJZQzJMV3o5cHJESENPamtsYlpi?=
 =?utf-8?B?VEx0dWFLb2d2WXg1WWJodlFZQmlkN3c3bUhIQjRrUzFNTmJTMXFYUzZPNVpJ?=
 =?utf-8?B?d0k1blFZNUFKcnQzcy9wVEt2S2VuK0lEZ3lIS0QrVExWdGRBaWZWZ2RXc0pH?=
 =?utf-8?B?UFpqamdMMlhOV0NHZmcxc2NSY0UvK3p3SGtiMURFdTQzYnBQK2pzSld6QXlT?=
 =?utf-8?B?Uy9VeHRLOE9OVTV1a1VRays4VndLTFZFcnRCc2plNFR3S0YyVFZoY1N5S0c1?=
 =?utf-8?B?WEpqbXh1Z3lBeStrSEp3WU1zd1BuK0l0RXhjTnhJR0xBYU1EUmxnV2RDQ2N3?=
 =?utf-8?B?N0tEZm9qd2lIbU5kSVd4N1NpOFhxdnlXMEZuTC92Q3hnYlAxMlhNSHdIOHlI?=
 =?utf-8?B?TUszZkQrc0tzSUpKUjhya0szM3YzcjRHK3pvMFk5c2xqMUlRU0x0aHpBL2s0?=
 =?utf-8?B?c3JmQnhFejdDSXRrNmM1VHVOVU9Xa1BzODZiWjRCSVVPV0F1NFdIbTRmMVgr?=
 =?utf-8?B?bnl2OHVvTXpyQUJrMERjd3VNM2NHSnFUQ0ZhRDFVTU9OM1llcjUrcyt1VW9o?=
 =?utf-8?B?M2tLbTE4aHpmdFFQZXlmM1NNOWRyV3BVall0SU51UWZJQ0FTVENycXBHOVlS?=
 =?utf-8?B?ZVRvZGt5ZlpEd2RIaEtKOHgra2M1TnNab3A5Y3ZTTmNyWktaQlp5WW83R2Vi?=
 =?utf-8?B?elUrZXc5VnNFZ3FicDlTaGZleGhPN1V1Y0NYSDNxMk9ncThtbVhwWEpuUnRZ?=
 =?utf-8?B?dnFxK1U4MXFwVzVGUWV4R2NjUGtVeTZmYlZrNDY5S0YzZklZa1loMkJvVHRt?=
 =?utf-8?B?YTdWSWpLb1JUc2tMdE1kUTJHTHZJZHZQQ1RvVlZyYUZ6aDRONFZkbkkwVnB2?=
 =?utf-8?B?V21IQnFBeWhPeC9ENkUwU3dFL1JSYlFoK1J2NEdMSVlQRFQvUVZFNFMzeC8x?=
 =?utf-8?B?QnBaMit5OHo0bS9rNG93UXNhU1JNRXdVRFA1SEVUVkZRenpRTjZkWS9ORGJo?=
 =?utf-8?B?QjVUZ0NjRXpydStVVlQ1dDdldStPWXZCOGQ5OWlHS1FWTDVxbnd4TmxmNnZn?=
 =?utf-8?B?SEs4YS9qSGdWVFJRcUJ4azlLVGJCenpYeUM2QzBWREFOenA1aXVHWlRHUkFm?=
 =?utf-8?B?RkJHVUd6QzJGS29EU0tDcEdkVjVjeUNxRWs4c1BsWmEyc01kd05PRGNlb0hJ?=
 =?utf-8?B?QmVWMzhmSHhEeDZVaVo1S0xMZVRNaUxVWTYrZ2k2NTlIdzdsTktORFN5QjRu?=
 =?utf-8?B?a1E9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4d2ef11-21fd-4582-671a-08daacfc9c36
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 09:23:38.1393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KkrFMOwW9lAQ4BZfi3eO2Td8Pq1HrFX3+GUMjo1fbkZTXBS1yITdXR3668fMs/gU+rbvhNY/6pFpQ3GbWF15qU9Q29HMfVtoZTRjb069qXA=
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

Add appropriate shutdown command arguments to qmp_guest_shutdown()
for FreeBSD.

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
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


