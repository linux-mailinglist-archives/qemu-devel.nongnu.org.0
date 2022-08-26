Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE5F5A2A33
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:59:51 +0200 (CEST)
Received: from localhost ([::1]:59908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRaoI-0008GZ-Ok
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oRaJA-0005QA-En; Fri, 26 Aug 2022 10:27:40 -0400
Received: from mail-eopbgr140135.outbound.protection.outlook.com
 ([40.107.14.135]:34511 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oRaJ7-0006Ps-Qr; Fri, 26 Aug 2022 10:27:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PPLN8gFY42nQTFL6cpUZOMK4+TRv5KfmkvuezsluyEGpi6t3pZLf9G7BgRLV/GjQdS7uBBxVBgQNAl0nQ3jAM51rzLnmSSGAU8S7u4extjOIheNbpI5enOty1i5HXl6X3S5Kx1TQPvCEf0Oo2n/rjLA5SS1hihXkNXeEdl4wte3G+8GLZiu+qhMx2CNNQrKzx7GjGU2Rin2tHcF+KUWpQ3/qbP1QGNdJN4TicQG75c2mTp0IuYuIhIxZ79LwNcZkdamvVesPtYLXZ84GumFe4b8RTU7w6PouNP4lF2U5vPEcWuzAv3+8v3b20OS4p2yUhfQtFdN1IRtpCXM4SoGxpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ctzXVS0/9aST8COtaWSX/WPENtUU+qsaZgKC8zjk82A=;
 b=VKjVk3OXR7zss6akZ2PSPITX55GehkJEzvjWUnAiQswyNB66CMDiubbVus6Lw2ATHMIn9dCGuljqyhtrCFmLaKUZtXliH4K3GAuk3XArtaHrh1/hfuBauXZGH4E3Qr64WfT3U5N4eP0BM1dm7HRkSgOi6AmoT0iOt+A835miS/umt4mbhsqm1O3ILpntnknEMWVTJTB2OXpNrgTpDNtoPsBwQ5MfUbXj/9FpvziBitmBFtki8j+3RLwT393Ju+DBU8Ol0sf+RTJRjogd0zwY6LFf1+OZNAlQbKBbRcUNcuqS236g+wDoxNAR/iDcNa9gy5df7QvURFmeP285All3dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ctzXVS0/9aST8COtaWSX/WPENtUU+qsaZgKC8zjk82A=;
 b=C10r11IpDLRwKg78MkV6HYSNsPC1bSP/VfXMohDV9DFw+slmgl6n2MPPb5eiQYAzPzLK6nwQTAs1XwDQYbkS0eIMJ5EnJoiduyCpay0j4h+VOJXwWHDxSFsWH5QtMqoAK4QHqPFWQ7vFA9xsPHF2iXpXaAPrPVK4e+Iz9jFZeyqwE7f6FB8Z/s680XxrrDLl2LIyKf30dqx0l1Hgqso5CTir4qXLQdqqJF0Ry3RCSsbNTiQr9El4ktb8p41TSSazZYTHqOc2t32tz5YDdkdOcYYDpE1aA61GrMJO7H606idMNjVfAncd/qwQCC3vcDHdEBDWwQuWGw7HhmzNtMWJOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM6PR08MB5253.eurprd08.prod.outlook.com (2603:10a6:20b:ec::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Fri, 26 Aug
 2022 14:27:30 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.015; Fri, 26 Aug 2022
 14:27:30 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v6 11/10] parallels: Incorrect condition in out-of-image check
Date: Fri, 26 Aug 2022 16:27:23 +0200
Message-Id: <20220826142723.235636-1-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
References: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::17) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e703075-10f0-4d43-c8fb-08da876f1ba1
X-MS-TrafficTypeDiagnostic: AM6PR08MB5253:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sw9VSAz7pNfWRDY+2cwphbpDIRsfi/LPyAvKf4+BkDUHTcyQvCqmTyAsYuYBlMmlQIYcL1NtJ7tCz6NlQUwT0iW97s903RheHjF1GurHZgixyysqdnCEKFpQJSRIwj5yYZG12CqM+k9qqaKtV0FsqyY3euhjw/ztGVmat5zGe1X0bAPoGGB+R/5MruOInwBHyGinE4fwDSSG1n7OmqKxnEnlKzzkuM0Xv1picjnUjcO/Vcq5l9AzR6Ru24DUNL+6lN9MNjbCRzdpXg9zFnP5+CXIuctDPgcOvCezA26zrWTvkLPQIzCLPhivFVqAjzVjLRrAEOiiMEeFDB9JB/NkU7M7uavjrdPEeVPR8/pqpN1havMMBR3vvb1P31Uv4vvSlORhhq4qxtINfBKYOJN+ohtsCLMWA7P/0BSr+4pRhfjj8Q4XLiq4zRbASO/UTJoZIOYugM1UfKFQutdPYiImgKj2ecWUD8sG+edGLhtQdJ7sgr1mhdAVSg4j0adIIZ3XLIAPHiL1uQOKwkErsBHSUJT44eJmsvaD3xh5EdMAMNajc3e65IhIqBdJ5+iRiOKg19barrU7xtEtQ1jdM/ZhKiRTwZ16dKjtaI2sw15LX6MKLcLjaB3KSqLkLx1xp+URf/qtCBJeHStHy/RB26y40f+eyY9RCNbxnzhZqvfFvla+sY/Z3Dka53zXZ2tJsABVBn8mXRj4C1fdMDeXxIkFDnuGXluaMRCxxcz1dvtUyHeKELU6kFk1mjMVKCoe/GAV0Fe+KkP+/fp1Q2Tap4cmnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(366004)(376002)(396003)(39850400004)(346002)(4744005)(8676002)(66476007)(5660300002)(66946007)(2906002)(44832011)(4326008)(66556008)(6486002)(36756003)(2616005)(186003)(26005)(1076003)(8936002)(52116002)(41300700001)(478600001)(6666004)(6512007)(83380400001)(38350700002)(316002)(38100700002)(86362001)(6506007)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lmFMNXagaAUVxlIHY/naD3YA+ShVVO+Sku9Ur6nlC5QFojMDxm9FTjreBVb7?=
 =?us-ascii?Q?ux1m5S0hdJ5r5M5Nv+O0T23/L5bjlaF+8i+aIEpmohTszdnRSnQKByrEVmtn?=
 =?us-ascii?Q?HwRF47tqXbhgPZk0Kqd9ftuqHGiD0apwuBC+kwt1XJYh0XzRODIoITgnww9i?=
 =?us-ascii?Q?HlYqNSQgo52jra5cpwPkKszhsFr35sXqzhIAkvecqQ89yXVQeu5Oy3GgF0Jm?=
 =?us-ascii?Q?kbxQW6CC8p/8IvJpYX9B7g9UgUtJCqVnv/Fim7GkK5JPfwP0kWMk6HvYE7k0?=
 =?us-ascii?Q?4oYe0oZEZfn6uujiHAPjGm7oH4azP1rKI/9fcJs4NmaCaiuMJeozaxM2ZtW7?=
 =?us-ascii?Q?aHrnl9lQsxLQxlN5bPV/DUMP9DVO5o1i//xcBEgWOdjDrX+7aF/7pf3b/DPB?=
 =?us-ascii?Q?VQZ8tB2f8SrgkN52jGUEvWRWHfuvKD1hNYmf8EX5uA8B5IicEGpH4nwcrnRs?=
 =?us-ascii?Q?vDVsxqyRN1WUR2WKqLYzOliryk6KaA6p8/zb2cWilFr+bAQupgcFzpHMZqm0?=
 =?us-ascii?Q?vkSd0dKgAhcEG6YsZP+RDWpSAbZw+QFF0vLxTr5UttYCSXmqlib33q3CgvF0?=
 =?us-ascii?Q?aDRmCAsEOOh5hu8qlUDpoZ5RbwmfM/kktW4r3yyhTUzEbZXk2GlF1B9bkxtJ?=
 =?us-ascii?Q?bZBcsc9+6enTJRfUKQ0mSdTuw18miWLmeWA1SFXm8hUdibZ/OAKtwkeOGJFe?=
 =?us-ascii?Q?A5ABu6+/2AzH6mOq8/3vds5f6Ydxls/TpYzpd2ROQSsvj96aWi0RdyV38bnZ?=
 =?us-ascii?Q?fqDOyS1cKWjdMU3fUHheiQVzz/1+xNEnBBBHDgnsstvqJOimrlCk4eTh+3k3?=
 =?us-ascii?Q?s5fuCNr5z47iMFph6Z9Yq5WHeMUd8rIVqjODAPwteBbrrCfUL0bLvpqJmD09?=
 =?us-ascii?Q?raYLaD7ZoEcUXvadm32mAgKTMQuJft09Mc/YlJbWLJYpa8diRm49XZsuf//z?=
 =?us-ascii?Q?Cgq5S3bIE6rQ9DapTQNSa11LkfuyfY5x2Ex00yBKaQjIHHz12sWuzq4/BXtp?=
 =?us-ascii?Q?oqzM807w5Z0wieRxJD6IIDJHbQ2mPouy5ziU6NPeLfR2JROjJDThbexnqios?=
 =?us-ascii?Q?lRQ0HRbG/KCKUXmWNNdTuTInACUH70h3Zzxw2lKHAeXkVOY6/HNsUQ6ze452?=
 =?us-ascii?Q?Pv0OtuwargAdTjkuZqTW7BBMtiZSihcM2h2hSlVMjlj375WkBjkIiiYAzhDL?=
 =?us-ascii?Q?uGigl4dY0rbQGuFhuaPr2WyPGMl0AHvCS5h3oPSblCw4SFQA2eMfu1FqRwdK?=
 =?us-ascii?Q?JmawqrIp7QubotUv+tH17z9c2nxv6aSyXwWdhCNc0NhXbDoOsC0ZYag/8btE?=
 =?us-ascii?Q?5ZiT1bF+JhS71Oouv5ETjzgJdrWRoZ6J0kWRlujcpRVnqxEThMI4ksPRL7YK?=
 =?us-ascii?Q?QsXleG4lV/oId5BMjF2n5l7/E3aDtsLAhMOcrWBC92inEgQ6zlWrXz4bFvIW?=
 =?us-ascii?Q?d3fKPBX5bktCMSKnTAfPLFNfZtvAdsZ0bSSneU1IRNIXwvIQpoBNx/YJyDD0?=
 =?us-ascii?Q?IF0qosSo1cpyuJB+qKHnODTHrsCLz04TaRo0ObRwM+HRS1IyZLjzDh0aqQsR?=
 =?us-ascii?Q?JWc3GFGCyTjZ6LG/YeRLkd+y+RxgZV2O9BjRZnoHC6R6Bnfz8tbb2qFuO4v0?=
 =?us-ascii?Q?G5IhZ5jQvLk/l6GM+f/fWvw=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e703075-10f0-4d43-c8fb-08da876f1ba1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 14:27:30.2615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pBrZ69HuWrKkFOFVrB+hDEBVlJuv1GPZY9bCqJEcBFOdtrKd2jnrMy+p9LclPWM69kkYPeOUygCPSX6/TeXNbgDiSZ+lJqq+Mjn56Ky0fWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5253
Received-SPF: pass client-ip=40.107.14.135;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

All the offsets in the BAT must be lower than the file size.
Fix the check condition for correct check.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/parallels.c b/block/parallels.c
index 8943eccbf5..e6e8b9e369 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -455,7 +455,7 @@ static int parallels_check_outside_image(BlockDriverState *bs,
     high_off = 0;
     for (i = 0; i < s->bat_size; i++) {
         off = bat2sect(s, i) << BDRV_SECTOR_BITS;
-        if (off > size) {
+        if (off >= size) {
             fprintf(stderr, "%s cluster %u is outside image\n",
                     fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
             res->corruptions++;
-- 
2.34.1


