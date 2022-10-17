Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D4860081A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 09:52:05 +0200 (CEST)
Received: from localhost ([::1]:41330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okKuq-0004HD-9x
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 03:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1okKYZ-0004cF-3s
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 03:29:03 -0400
Received: from mail-eopbgr00109.outbound.protection.outlook.com
 ([40.107.0.109]:35648 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1okKYX-0001HN-Eg
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 03:29:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NUopEGLYtu4G1EHg2EXTR8hoHihG3cmga5/kyC9Tk73SHH7VkVc+8a9I3P0miKw0NE+jhtAvfAho63WmibojUm/iEGEpaYD+jkDqlmkv633ZQZt5sczqIciLFMRdhxnVwZmGVxB+vsmtyKNbgC5uobLWfsc+dk6gW5iWfxbCL6DejWNcVQzqINfI6/vc8IR3LKcNgk6zuv3I6/vu9LZNIqbNGcGVyWtL0kXaPpfO6kTun+jaMfW+PwwosG81b62qomzeQggA1yJ+xcIPs/efVRLg9jaqDPX1XHIrWlkYuJmjXaiVGVXAraC3wuNXI60w9W7y2+lfNxwyTeDthhnLdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxxmbxAcZk965Xpx44CaaKqYjArE71BENpKHlF/1fPc=;
 b=V3Mx2EqfRc9oeboLAmpMnogS7QgWa/LcbDHfOxhZ284zivR23m5G60iqm9fG5Spt4acIJK8Nwij8N6tSylXpz9FGJ4IZ1ExsGiHU58Rxc6eONVW+6W9AmX/lt8aieZzxqG8acBmgo9g5l57uOVuq9U+/6reW1LsPcFa80vjpUOKn2jV0uypx1IZQJgQ/bvNAr2qUbJIC6Seo2SxHgAOfnn9leUJVzrjGnvnBlqyZexLVQQsXfACSfMnwaI7dACqRf4qcg7tJ8SeZP98eh8rR0loGF5PUwaONiV//gVCOzNzSDWUIU3yivB/17Xt8Pa7/ukOpLD7/lH5G2FYMokXfFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxxmbxAcZk965Xpx44CaaKqYjArE71BENpKHlF/1fPc=;
 b=TyMm27s3TjLZ/lqnQU6xxmLO3uqKBSfN8yo3/dxJxn+Ftnso+xsdrPQ2bV0ZzjlTZKZrd/KGDkWCYa/Bi6f9Ct/vsskw8OFfj9IIVrVhVcMaLLjLpoKcYk+y8wgxnwZbBVZQgJl6+ukA1NgTRCGw24su+3BrZsswbEcH3JsnNx2SLjfFiZSWo9ORpZha1kMN3G2Xev3/QkzfAbFt+M6BzezDslGlxp66skQRfz93p/DFIKY4ShBLmjzpM3zyzAM8vpkIVQj+LlBbHlV/F38hvPExwFuRHlhMQP8NZRg1IT+OuQJcRGfyi4ydNFd8DTe3bBZlBFirR9QNwAZzJ+Bgkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by GV2PR08MB8653.eurprd08.prod.outlook.com (2603:10a6:150:b9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Mon, 17 Oct
 2022 07:28:41 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.040; Mon, 17 Oct 2022
 07:28:41 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v5 7/7] qga: Add HW address getting for FreeBSD
Date: Mon, 17 Oct 2022 09:28:25 +0200
Message-Id: <20221017072825.72867-8-alexander.ivanov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 409558ea-1e7c-4368-cf84-08dab01136f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wA8kvoViXqK7n5cAKlQ0GgM4Ke/xl7psWb5aSBfCCVZYSMEojNdsQiPRVGuUNn60s4v9eK+YV8a5fu1SlVAP9CtZOhke03V5hpXoylWK6TbGc+67RIctHj7vzwYx8ucScp0RbttFJnmJPJo+891e83apXlPyGOMIhia2x/LvMDah713WKPl3Mg4VvVoXz27lnlWiQ5rQr75dy4hKbMh2CMTRpLa0Q01jrKXihpZ0zEfvgOaGjJa1SODFCr/lED6SGs8JK0c3mrfY6D7CYCjUtTS6Gk2y1LfBZiX6e0PtQhPAaYZq1kbIKmFunXcP3NiEgvmcX3MccE+bT9SI65foUDUBtsvLf/yKmyk7qaH+9plJLRP42cGLyBTGYIHjCjvg31dwgjFAcEUaaogkxgTZzx4KAJah2LKjwgn0a/nFkEDJaFqjNv/PugfoDypfDjpDD50OYTnO/TW3wWO30CFFZ+lIhJ46r+zX1T9rrQTAA1Wg/3xBwqBoyuK9cOG+qhA1okJ4STuHO5tudbJXJczxQHkM6fyx3xO+bC5M3K6k85fpM2FMe2SH5NiXBXSCxWFtafz4OfkAZW65qpM7m3WDZmeM+GSwPMdPhP+VhOdMEn9u6Iven6ELq9xU3rFSabBXNRtxNvdhRdU+yX+hGz2M9PjAIAHj0SItjfN4ZxY9e2QQMlK6XxYN9TB+lUAIqy3cYpmgJT0oSNKbQ5U+gIOaVY1PHX0CoeByuepEg/ix0yROnD1Bp22TwEUo8i7K+BF4n2Ii9/QwdoyXyAstfKRo1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(39850400004)(396003)(346002)(366004)(451199015)(36756003)(86362001)(5660300002)(44832011)(2906002)(38100700002)(38350700002)(1076003)(186003)(2616005)(52116002)(6506007)(316002)(26005)(478600001)(6512007)(6916009)(6486002)(66946007)(66556008)(66476007)(41300700001)(4326008)(8936002)(6666004)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0pWRXpseDhjb3FMSXJQTXJyMStXY2IvT3lqZzdFRm5HVityWTNEb1c1YUx2?=
 =?utf-8?B?bE9ubTdvdVp3cnpML1MvU1k1c1hNdk1uRlFFd3pCbVpRZHpsWlJ1NEpXVnNn?=
 =?utf-8?B?MjZtM0haSG1UVldKeDB1MFE0QWY1d3ZqM213Q0JxVU1vSzREeThQTnVxS3BS?=
 =?utf-8?B?WnRURVdGSnlsTXB1UUpHVEoybnFTclZ1blIwc2MrV2VyT1dIa2RqRWt5MVlX?=
 =?utf-8?B?a1p6Q2V5VTFSdXo0azQxV05VU1UrSWpvME10eGNVanpVRjE1T2xIcXdTNmV3?=
 =?utf-8?B?Y2FIN3QyQVppODM4SkxUTlZObmF1OGFxb2MzclFJTy9SSWN2K1I1Rmkxbk5M?=
 =?utf-8?B?azgyU3g0b3ZqcVNEQXlkays4dUlrajBCMisyWVJaRitPT1pDUTdrbzJtTWEx?=
 =?utf-8?B?c2RpNGhiZGhlVi9IYlBUNzYyNHNrMnpCZVBpRzdsWUxvVjNXTzhSODNvNmV2?=
 =?utf-8?B?aVQvaUR1QkJlOGJ3eHVuK295OUIwK3VPQVcxcTFDZWY4WWRBdDV1bHhQbWE4?=
 =?utf-8?B?ODdQTCt3b0NSR1MzaGtKa1ExNHVvY0JVRGs0M0NSalZzSEhwa3NlT2RudnlZ?=
 =?utf-8?B?bmQzQzQ2cFJWSmV2bHpGWURmcXh2MzE3UFV1VGVYTlVVTTR3ZGhpMFpNaEJE?=
 =?utf-8?B?QkxVUm9GbmlLYjNKNnNtR2tpV3lLUDJnM0U2dWl6VThqRG43RVc2ZnZIQUg1?=
 =?utf-8?B?TkNHam9maUhtQXhvSk4rdEhxSnd6WXVnVlkwQ2twZE03WDU0ZmRlT2ZwbWdE?=
 =?utf-8?B?T0UxZzNVUUZhK3E0ekVJSXJRcjFZVXNqMjVyT1AyU3pOdkthU1kzNXpMM3hl?=
 =?utf-8?B?VnFCNUdDcnVkY09ha2pnYlA0NytQeFZENTJTWGtzM0thTDRnd1BPWjJMNVo0?=
 =?utf-8?B?akJBWHgyWG96OVVzNmFxZHFOd0J2SEtRbWVUdytmN1QxTXd1MGtPOUtRU2ZJ?=
 =?utf-8?B?TGNyZEtYOExLeW9oNnJ5RGpYSy9HWWExWGxhNGsvV3FKYXVJWUlaTEFoRjZn?=
 =?utf-8?B?VkRSSG5WbVNmTWRSb3F6aFZJekp6WllUWTFINmxPdjZZaERWZW0zU0ZCa0pj?=
 =?utf-8?B?MTBqOVJ2d0hiSHh5N0dLUnEvUE82QnJUbHhZcGNmL2xzUWpYbjRqRlAvOEty?=
 =?utf-8?B?Si9DWmRqN2craC9ia3AraWtIUlBpUHBpNFNtV3pPVVRGM2N0NUx2SFlmbm5z?=
 =?utf-8?B?WUhXUDcvcWg5T0ZOUUs5eVBmSFlFcko0bnBOS25RRHROaCtLZ0I0ekk2OE5V?=
 =?utf-8?B?cUYvclhHZEFKbzJhckNtRmpoZEc4Y3M0bktteHdpdG0zc29DL2pUd0Q2WTZX?=
 =?utf-8?B?YTZsdW9Mb2lDYnlqYnZpQ0ZnNndZMkh6VnRiYytJUk9BOC82T0htZm5MbjRl?=
 =?utf-8?B?NlRYSjdFN1MvQ2ZMZ0huakw1SE5qc1ZXRVBDM3paYnF2aHdoeElyb3ZiRk5Z?=
 =?utf-8?B?bHZCQ2hDN2ZpWFdtT1R0TGsxUDcwc2xyZ3hMN2hVUXB3ZWQ3SXlBdFhMUFRr?=
 =?utf-8?B?S3VzVmdLZ2oyR29wV2hYNzMzd2NTVFhBc0w5WUUrNmEvcUxKb1pRNDB0M0pF?=
 =?utf-8?B?akxLUk01YXdWYi9mRE5tWlFnaUY3VEJBYytPemtqUFVxYzVhMmV6MVJUU043?=
 =?utf-8?B?R2ZITk1mTHNkd3V3SVdsVzdMZFovbHVWWlg4eWhLTDRyYW0wWm03eHJkQ1lh?=
 =?utf-8?B?RkNwNk9rRW5UWWNRTmFrM2RCcUxvN3MzL2J0bHdYQ3lGYy9xMGFuR253T29m?=
 =?utf-8?B?UHA2U2N2bllNY0lJYmtvVDllSlpUc1dUUGw0bUw5S1Rib3JWdm5qc25qNzQx?=
 =?utf-8?B?QzBHV1pNbkhUN0FudXBuekxUN2ZCVEwzMk1SM29ERGwrMjJlUVY1dnc2VEhu?=
 =?utf-8?B?NVI5UmhlaDI4U2kxSDZMZ1VtQlFMZlVtOUJwSU43SlM1TTBDYUNlZzNaVU5l?=
 =?utf-8?B?S3I3WXQ3TTYxcGNmbE4xTVNzZS9Yakd4SEhRRmVzb0s1UXlZYkJPZCtlVVJI?=
 =?utf-8?B?ZFF4SzR0bUQ0YXhsUTZoSzllVVJTbVJqWk5SbnlaVjhoWGJuWTI0OGlldS92?=
 =?utf-8?B?dkJaTjl3d1pvelh0dXhZeEZDMjFYVGJ0SDVEak1kdnE4cVNTcUd6NDgyTTN0?=
 =?utf-8?B?azczU0l2Nm55M3ZWQXljTkZVYS9BODlPL0t3OUxVd1ZpVmg1bzQvbHV6YkNi?=
 =?utf-8?B?UUE9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 409558ea-1e7c-4368-cf84-08dab01136f2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 07:28:41.3079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9RvBeajlmyWEb4hmSPA0R2DBAs+l+0EifiWSOA4iG3F243EHztnDttpE1clVqmnLBuHzoVRYEJu7DtmrxUyenBv1Z1MCBM4XRx/m+GvftDk=
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


