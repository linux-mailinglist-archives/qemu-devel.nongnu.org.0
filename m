Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0737E444270
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 14:33:35 +0100 (CET)
Received: from localhost ([::1]:49190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miGOT-0002Un-L0
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 09:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1miGKo-0007VM-Tk; Wed, 03 Nov 2021 09:29:46 -0400
Received: from mail-db8eur05on2117.outbound.protection.outlook.com
 ([40.107.20.117]:3553 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1miGKl-00076y-O6; Wed, 03 Nov 2021 09:29:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XZYa4sG51PzUgYjScAb0cKOC3iNhNBal1HmS6CcKgwtuXvyAr4fpttdZw0r7H1BVhou057V0zrMRv0PgXj4ESxYyFrCW6s/yp85Se4Uovlt/gNH/hvpq+5M4PApPgZactBj+qhG632EFjmz+Eu35evXLoKYw6KJzei2yOL41/1osj6QqExv4kxCf4cu1cTS5E9k3Dqum3GxoKfM/t26ouyV7NtAFAQS66+5QWCCfKALmRRJjgTo8Fr0RVkSeyCQtucNvHGNukNnvlhjwyRxB0ASXGUJruwSg3UHwOY4Si+llF78dgYqGyfjZwHunK9tpV1M/ND5mDrLDn+f/Djiffw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9JeR1xN9cce6P/AsOfeQhAmRGK9j6gJWdokclE5hn4=;
 b=CwUIfYIJYpY4oZdh1E2M8gsEdAxA1gbloon9r8iX4sIyobBLbHMHhyCZuXl56yfUqgAUAFCd8CjBFZd3dZ4YYfhbSmOAOOXJrkr103ObLvaIfHOuCa1Q+D+e7ZmlFpb1Vu07JOx6K7zvwyBZYFOpHVL9wbEVnjMOPWNS3HfgEoQpKDBS/XNCW2RjBoc4SCPQvjiFhfg29baQjOSFNYGT9dHKDE7fwWZSADO67e2ubuVOgkU3M70XvjsNwobLB8lqYWWpIom/r9y31TGsKsmYEl9XwCFWiRi3pj+iZ0C8Ep6eg8OCm4qFYBUlwyJlX+AXoRzy7LYrLwECbMms8ljh3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9JeR1xN9cce6P/AsOfeQhAmRGK9j6gJWdokclE5hn4=;
 b=Sj/sV9eY1eZakTrEECugnm1pIFkTRaPnwQtuHb+pQcTA/xND9TPoQDntrIgNEh/SqB4AfyBM+KD/5joCpPjn+6lMAInZRmjsbNG00q/YH3PLiLpGjQjLzlFHblsbSupH5/bBvjayyGy4ajxeUbDAOzLZuuWuBgCFIp4jTrJXJtE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5256.eurprd08.prod.outlook.com (2603:10a6:20b:e7::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 13:29:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 13:29:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, libvir-list@redhat.com, kchamart@redhat.com
Subject: [PATCH v3 1/3] docs/block-replication: use blockdev-backup
Date: Wed,  3 Nov 2021 14:29:10 +0100
Message-Id: <20211103132912.1977438-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211103132912.1977438-1-vsementsov@virtuozzo.com>
References: <20211103132912.1977438-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR0301CA0015.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AS9PR0301CA0015.eurprd03.prod.outlook.com (2603:10a6:20b:468::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Wed, 3 Nov 2021 13:29:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01f0e1d8-7258-486f-6b47-08d99ecdfbdf
X-MS-TrafficTypeDiagnostic: AM6PR08MB5256:
X-Microsoft-Antispam-PRVS: <AM6PR08MB5256F2A2C7582AF63A2C354DC18C9@AM6PR08MB5256.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hyy6cczWOOgVakbw4YYKFYOwUmJ7pkqAXWSR4xpm8lHnG/FwQQUq3qQakHhBhB0PsYc0DR86x0xtIU+86ZyBxfrxsx2kxnsxS9mvfXrFWNATxUQ/AZ7jGVioG1POWb/DHaY6jjSreJAKramNk40ozH/Es+NB9K4Lgo8Rs8zwc9gFF5hpX96IarUIGfq6BNMfEaqYjrU6MmAxw+AEKheqcWENsqZcfeR4eWx/yEMJyCt+UFOGzSGgHCprgqcArBvaM+QdoGjwH51QxnbUFXVCTPofX3C/ZHYd0TVyXhtWR3yeRdvLKmJjFVvuewYYQKelb2JR6KWFoGSoWJfxw3Q4Zu3jp29eaOhAPiHM8+u5V29q1Fl5r342Ur/QJN3FU1pPOUYIaKGpldwSFotQm2BgK35twFYaKmmr/EXaLv5aoBGx3Xvvw9DvSGZ7XN5LygE/wSan2Bb34wtiybqosOE3NNQcUW3vxcU1l2/LvAqOtDJAqPpXIbS/ww56HoTVBPju6d4WyUrPhat3vCzRCUj/qHXAyY0o/Y79UNh4hQogAm7G3yx+dE2/F0ZUYqSiH7qYz3Op/1wj+bF5VtmHqoGcd25cEtnApHxlepButqWwWuBIjyQ/WRexWzNYF4GGLM8jXKWGqJZ8NL/VJliolPx68CsxT4CZ5Bv1AA1a22bNyiYbhVHFp8wX/suT3e1YaYahK4OPHM/jEKJYwLyP6gBlKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(1076003)(8676002)(52116002)(6486002)(6506007)(508600001)(6666004)(186003)(8936002)(2906002)(83380400001)(956004)(2616005)(36756003)(66946007)(5660300002)(38100700002)(66476007)(86362001)(6916009)(38350700002)(4326008)(6512007)(66556008)(316002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GbwJgDaWz2qhHSUKds9fUzgZtmpjhpnRRZLEWhGt3WupNkGaIifa15eELZri?=
 =?us-ascii?Q?PggJE6brAPYkbkkSL8pbas965U5wKfEP7xXvae+42QZDUbuQyDw/3X9u8wZa?=
 =?us-ascii?Q?jTzqwKay3lR0v5gJJaPNwanU7msZsZnWvtg2971qbilj1FOGF5MK2TW122O9?=
 =?us-ascii?Q?8IbuFgIqQicIJnymc3U6zCK0cW3GnoOenh/C2ECryIEHQMEDsvXqWdIT/AfR?=
 =?us-ascii?Q?ycztKyJUzIjy+EEd1TlPHWF7ylE2smrlTVZ1tTqm+Az1l0DPEIN95swZMwDK?=
 =?us-ascii?Q?qZOSzNKeo2jpjj5ceamCfD/1fARj+i+qJuJebBD4kRpcgy/AXwniHvlyI1rH?=
 =?us-ascii?Q?ILZEHGnAIqHUHEmkF5hlW73wFl8dvSkB8K3t1UXVRbSiskzgCfSUsxt2DAIZ?=
 =?us-ascii?Q?bM1HvYoDMNRiQPKJ5cybejuDQsqR66cZs0Br4va/pz4aOUdsX0b51cEDkP2S?=
 =?us-ascii?Q?afqIWfaiXvzuUmnL/0sXsiCL6Pk/X5kb5dYhIJGzv0qgcjj6muVxf2Quo6Mh?=
 =?us-ascii?Q?jW0WN0NTStcCViDWZ+MALMnuCSnw21byVzedplO3D3FLTLKZg3MYqCITd6rY?=
 =?us-ascii?Q?Bi0Nj+nbpjkFw7Ty2QOceljbLTMtSgi3psNySdNaH/zD6pTdKgj5RlbyN7uX?=
 =?us-ascii?Q?6X3uadvnYProtqAJG/YLsECNG2nGbVJrccgEJunsgWxKEK4opypiP397XaGo?=
 =?us-ascii?Q?CZ4r6cBRgVA627MvLpiMIoTAZc7BFm6RFOyQAUr/EhDoTP6mfPq1i8Bbn8gH?=
 =?us-ascii?Q?qLBds1W/CZYr2YoaEJO5DBkVl5qzdqLGDxQGOmbSgRs1PXCeJs9/+5lG2HR/?=
 =?us-ascii?Q?NZPi1Qnj6BiOJCBTlULpc/cxsrXNJ+z6nlqTnh+Jc9hK7KKBxi7e8NYNCwNC?=
 =?us-ascii?Q?5cI34l88IGomuvmGYxedauu9RfozIkIcsIiWQ1fwFDKbQ2twwPeq7nEx9xdj?=
 =?us-ascii?Q?UO+nvH7Skr6nJ/nKDWdXe4YlY7zv3LyFXmymwkjVn9o6RZV/25qE1y88rZl0?=
 =?us-ascii?Q?auR1fwwOzlF9byAfc/vJbhc9tqRIKeRddKe2dE0eGwS4eITmSeJHb10UeJaX?=
 =?us-ascii?Q?093JVKQ30oTQ46A72BS497jdbnANGqqIH4anOQ5YYIc5CEi6HZI7EyEHxwMu?=
 =?us-ascii?Q?cQG9mk3Bf8yD+WOMUXOhQVlcPl4jZprNfyKHEdKCAT9NKUesWWGzR0OktgwV?=
 =?us-ascii?Q?BLwXq455A1C33wup1AMs4fWOgVF0X6PssW2BwbWExWmA1BvmTMmKsKJFuI41?=
 =?us-ascii?Q?hUriSDlBTuGLac0whJOHsSzuWzpx0SkZSflGgSLadF4Z7d63VUo6IlZG6FXq?=
 =?us-ascii?Q?i7RuijwX7OJYv/crj1wRfLVqnge2HOPWjzITC5LCcDsAPs9JF8G/0+lDBADk?=
 =?us-ascii?Q?TfmcfgJS1QrzW6BKqgr1c2Q+/nDF9LqXwUVXPgYoWu/N+36UdW7CBX8SGZS0?=
 =?us-ascii?Q?sod23cVcthMGFylrLyIxGCtEggWzRJMsoIqXXqE9hK5vCk+2z6IOQvPeSCuA?=
 =?us-ascii?Q?LSVUSd2j0S0aiEnbHswxT65NA43FpkvaQU2nnewjbBisV1xZNweZoyAL7TPa?=
 =?us-ascii?Q?sxz8Um5h5yiQKFkXQMoa9fACac42FeBz1RBc0L4aSpbM5PVKFfoAlRDJ+KT4?=
 =?us-ascii?Q?pmFDCKAGfGiiztFXHqUk3iFDGnPYuI1EtUdLwVJaa3vGc8oskPPB/fuAJq1r?=
 =?us-ascii?Q?GNX1ug=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01f0e1d8-7258-486f-6b47-08d99ecdfbdf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 13:29:38.1938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uagPa2C7qH1wSAYv7tLyMVbsJtIZXVT1JF8jPdFQstK6xv3WLCPk0ZuRhCdDIfMXUS8XSeU9YU5PlYiNEA6d8GDmL9qHKjqLQPCFQJRr4vY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5256
Received-SPF: pass client-ip=40.107.20.117;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

We are going to deprecate drive-backup, so don't mention it here.
Moreover, blockdev-backup seems more correct in the context.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 docs/block-replication.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/block-replication.txt b/docs/block-replication.txt
index 108e9166a8..59eb2b33b3 100644
--- a/docs/block-replication.txt
+++ b/docs/block-replication.txt
@@ -79,7 +79,7 @@ Primary |                 ||  Secondary disk <--------- hidden-disk 5 <---------
                           ||        |                         |
                           ||        |                         |
                           ||        '-------------------------'
-                          ||           drive-backup sync=none 6
+                          ||         blockdev-backup sync=none 6
 
 1) The disk on the primary is represented by a block device with two
 children, providing replication between a primary disk and the host that
@@ -101,7 +101,7 @@ should support bdrv_make_empty() and backing file.
 that is modified by the primary VM. It should also start as an empty disk,
 and the driver supports bdrv_make_empty() and backing file.
 
-6) The drive-backup job (sync=none) is run to allow hidden-disk to buffer
+6) The blockdev-backup job (sync=none) is run to allow hidden-disk to buffer
 any state that would otherwise be lost by the speculative write-through
 of the NBD server into the secondary disk. So before block replication,
 the primary disk and secondary disk should contain the same data.
-- 
2.31.1


