Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C642EFFBB
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 14:08:02 +0100 (CET)
Received: from localhost ([::1]:35170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyDyL-0007Of-1w
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 08:08:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDpY-0006Cl-L3; Sat, 09 Jan 2021 07:58:56 -0500
Received: from mail-am6eur05on2129.outbound.protection.outlook.com
 ([40.107.22.129]:46432 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDpX-0003fN-1R; Sat, 09 Jan 2021 07:58:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AhxNeB6HtQ9i1SUIuI9PN06E66gYomqQXIDUJHw0m9YY0mcp0vdUpuUJvLg1zGFiTpHqoojpXhMlotlauBnmD48ipvmd06WWPJUkrvNqmT9CvpAwUHL6TTZHn/Fuuwy/BcUvmyoLHDwVDaDbJnNJlsrY2pgelPKMkgHLI6TUuueF37R75OrAInNZdp6q7Wkfbk8z+3qo5xDE6Lt+MMfjj+ECskA+uDMUaJDDmToopJBPmJ4sksZErF6hhkuFz6U/VFBlx80IQWyA0UKhUN/DhJbPS/FtJmzLJuuWoM1lFfWIvkSzcW8sjW4r22rR9o4xyw17Kcanc4FZ1PeiBMNnTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHnm0nzmIwn+sgo8rhgq9lMJ3jmOf1G9O/f4rw2SwiU=;
 b=RAV3q9cNK6PnRlHDhTQ1jV1xjvGHTUzhwmJNJ7tFDas8SZeHPMh/7Zc/s+lORJAavxqGDGGIVPxbEEcyZITRGColeg+j3LfaLQwzYYKd4GzpKyL9KK5Tkox3316qQTcWf3Khh9lGY2zo7ciMJtzBrlUIBd8pH3iCEzPEiKquvD23gL+SmyLLpPMnX5wauDcP2CopYO8mqXV/KGDmBoUQ6MohAMiAnMdPsDIT1fStDUmwwXhLGDuBAKqSBy/xuCsEp6w4nmAPhYE3+CF9PjJG4M5MBMSwoBS/1OPGQqNjrZDFAMkn7KBPm4nx0qMpg6np2djIIG1zt6FWD9ZM6jT0vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHnm0nzmIwn+sgo8rhgq9lMJ3jmOf1G9O/f4rw2SwiU=;
 b=d88hNszvbrzUkJ/k2hINQVb7lkEhaY12Bb8OrKcWkr4cNqzJML7EnZyxK2dJaIvzBifRlhf2UrypKEoEujvihPmr4g3iXiGB5VP6ARmJwquvDc+zgzZHpaBNdJHF0uTJV2ggWw6e7a9sRDbI4fzdFS8WiDKa/z04i49lENWmHYo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2418.eurprd08.prod.outlook.com (2603:10a6:203:9f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sat, 9 Jan
 2021 12:58:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.011; Sat, 9 Jan 2021
 12:58:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 04/14] blockdev: fix drive_backup_prepare() missed error
Date: Sat,  9 Jan 2021 15:58:01 +0300
Message-Id: <20210109125811.209870-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109125811.209870-1-vsementsov@virtuozzo.com>
References: <20210109125811.209870-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.119]
X-ClientProxiedBy: AM0PR04CA0053.eurprd04.prod.outlook.com
 (2603:10a6:208:1::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.119) by
 AM0PR04CA0053.eurprd04.prod.outlook.com (2603:10a6:208:1::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Sat, 9 Jan 2021 12:58:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7495fcbc-1c0b-43f3-3b77-08d8b49e4c7b
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2418:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB24183EA5EEBF0535FFEA19C9C1AD0@AM5PR0802MB2418.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ed+pA+bQ38TCVu+eR+cdzji64KBjduUJJ6eQasQp/ngpjzlWo7ivUz2H4IhXeYIEiaDCQYW/Xy4YXBTAciowmQOANMoKhaO1r2rP8KLhkUO1KTOiM89kT2MDBL0wm6fJCFLKs3tV6u0C0W0vtWTTJDcZM0NGu9uQQvzcbeMMkVQU8HDLSG36rSq77o/Uie5AkAZFoF/T2JhtiBh3f56kyGjncVWea5nbsa3cRnUSZbBF50QLdGouADV2vjAophNE0pR0jduauLl9jBWfM7wruaQz6w3ti7JNKuBr3TLjB4VqhjAP0CXme5tFUEnaLzf1aZhjoZvcYvmPB0ZMOt4YV7KqmVwxFiaN7r3lCGyf6lssvW7Ii5znJkfT1Sa4ccJbFmP9W49mFNZHjD0AJlSLEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(396003)(376002)(39840400004)(956004)(2616005)(66946007)(478600001)(8676002)(5660300002)(66476007)(66556008)(6916009)(83380400001)(52116002)(2906002)(6666004)(8936002)(1076003)(4744005)(6506007)(316002)(26005)(4326008)(186003)(16526019)(7416002)(36756003)(6512007)(6486002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hU1ZvIK05vXC3/VsfNRSgwwAkf1Ez/Ho3IrthVbztjpXWGKs73lWjeD1CHGM?=
 =?us-ascii?Q?QGhVUIfE9gWXmurFmmu5dqXgDmlUSBhzx+7vSu8z2nqPwpT9JOqzoWBkImIA?=
 =?us-ascii?Q?dMBz2NZdpLzREVGRPK4EpBj+jb3pIv8kqXfr74hQ/4Bn+W61W4r7slNwfTZ2?=
 =?us-ascii?Q?81qzwny26WBnrRx4LIIP2x3omXHfxzj2GF70PpJCs6Xzpr6bpQUfkKNPMePu?=
 =?us-ascii?Q?QNl5Zmxdv7i5bir/MP7u32/kkBAoQk2HK1Iy49+qEeZjFY6TRZT3to69dCwJ?=
 =?us-ascii?Q?+ftW9uSvIG+SMVEVQATjLDr3BBJmU2SRDxNxm2/Z1azLCBdIlGS7iPaawOwJ?=
 =?us-ascii?Q?fFbDOhQFyDw4745Vnu2lL/m/Q3Lq6aMjbRvfPlst8SmE3bn6gEQx+8nuwply?=
 =?us-ascii?Q?UBaPNtKMBjLWidjKvfkZYUQdA5IBvr3v9NHsgpNCOomcNt3Tcb8o5bhE//uD?=
 =?us-ascii?Q?rim9mvLJW0qb5HTEMTWV0FPo0l1MQw2UE34kMjLnFYpEZy7qzMnV8fW28pl/?=
 =?us-ascii?Q?jq7buHGnt+ZFA/3vxBpMyLwOYalv+OpNl/8HV7NV4ttjWdThJRxVYr/k9n/E?=
 =?us-ascii?Q?9NxChhgRXaKhtxGsdbTuxU8A3kuSxVbC2LsJIubBRI4UWP2E3RL7XaDRaMkP?=
 =?us-ascii?Q?fQ30k28RHSulOTpyrkRwT6hnQJPXYgwJySgv21cF44pt7ti9qE79enq/TjkV?=
 =?us-ascii?Q?52l+SnWMQ8fYtOL/w/B6PZ1Krw0ivlp2h4tAZ91HnkNXL6AKnfnZ4pl+ajrV?=
 =?us-ascii?Q?IN4z4LCCyoLWpZxKLQRITO8ZDmdLRJdMxmhNuD+X6jkSqgacWYFqks6KVfnL?=
 =?us-ascii?Q?Ea2yeJGSamd0Su4U7W0VRZEGaZiFRE9C4sQh+vLcSd//E+V7BUr9gSDNJlE/?=
 =?us-ascii?Q?Jv59vAD6IPYlZfDrAWSXn2bAtWKYQEmAha7N3ilpxHh8oQkAk9Y4Lw/f7Lvq?=
 =?us-ascii?Q?v2BDXUT9pGuntsGbWQQEZZZhdkK8eh8R2aj8MbcT5b2V1BPXdhpOnCx1rY53?=
 =?us-ascii?Q?pFNe?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 12:58:45.2836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 7495fcbc-1c0b-43f3-3b77-08d8b49e4c7b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 05PyxEZG0AQpmv1O9QGVwCKtqW61yYjsA6JrfYwr+aBwxnTq8EfGw7TnqghS4DjlCn/O1xUkcAaS3G8LZjpznBRz3PlwnLyS76W/DdQZTjU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2418
Received-SPF: pass client-ip=40.107.22.129;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 pavel.dovgaluk@ispras.ru, qemu-devel@nongnu.org, armbru@redhat.com,
 Greg Kurz <groug@kaod.org>, stefanha@redhat.com, pbonzini@redhat.com,
 mreitz@redhat.com, jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We leak local_err and don't report failure to the caller. It's
definitely wrong, let's fix.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 blockdev.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 84c5cde07c..753fb90c16 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1825,9 +1825,7 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
     aio_context_acquire(aio_context);
 
     if (set_backing_hd) {
-        bdrv_set_backing_hd(target_bs, source, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        if (bdrv_set_backing_hd(target_bs, source, errp) < 0) {
             goto unref;
         }
     }
-- 
2.29.2


