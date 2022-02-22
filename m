Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EDF4BFF66
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 17:56:08 +0100 (CET)
Received: from localhost ([::1]:56830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMYSN-0002a1-Br
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 11:56:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nMY77-0007L5-S9; Tue, 22 Feb 2022 11:34:09 -0500
Received: from [2a01:111:f400:7e1b::71a] (port=19233
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nMY75-0008Ol-JM; Tue, 22 Feb 2022 11:34:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jvbVX6i1Wo17IG5WxFBn9qbMpWnybaWk84HpVyDoASY+h4j4vT6kq9CoWY3xykXXxYsND9l81nsOFDFTOv5DRCjNnYo7UgPuInm76ZUPSonODTdrKLObwrbjdTKpXhCklzAdigk3pQfTnKFtu7+oikgsiVRL715UO7tlQPZPMSv93Dyb/aUOQVheb3mvfIsx5QLDnpm49oayUMDNnJsAJ4vsPU4wp6kZE7a+50yy93naAIac0wV5UWOc6IrGCYCOlUCK/7g4McO3Vf1mSUEvdJJ37leDJZzzTAsZ/LNroxqajMvi9KrtC3h3nFYBif+3TDAwfQNoA6yd5sgMdU+JFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TquRkOIFT5YHgpN1jigsZYlb81z5lqpV6E7BneW/Ejg=;
 b=WMmHWJjWjU71ARREQCZxM3M1ratvdCNnUrd+9iUyLn+j0Q8tHwQe67n/ZhtJ0HJpBo3KIP+IZjNH9KBvBCi4+Uxwofe+FbdIB+QxkovrP9B5Pbwg5BNrCnIf84zw7ionv5ab6Dfh2R5fKKNmeeJn/n6fnHcLrVmGR0B/k6N86JCY5NLYkF4iKs9Y+aAuPcgbKsw1DjggtTXh/2bYTv5sBtGTsk8ky9EgXfU3+kcFmY67AHASLFyXWp2MJXAacw3EWBOwzUVJFvgr03ojFoid8Lkz87Q9NLy3/QFVhz76nNtZD6prCoYK7PK7br+evdDPwDdkI9M3aKEc9JsqExXkNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TquRkOIFT5YHgpN1jigsZYlb81z5lqpV6E7BneW/Ejg=;
 b=rS62Li9tOYykSgoiWZJLeL3Iqz1ZtpUIUIn8bJl73v/xLHnBoNhG2JTo8M0sA2drobU2j9G2xyt/0ic61yNR8VHv7pUN1xLPNX2jJZkPh8PipjYkdCPTsRQduO7Mkfhv0CV0UjvEE63kmh17c8LjHWhBq/9vjv7nr42b+FzYRvA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB6PR0801MB1669.eurprd08.prod.outlook.com (2603:10a6:4:30::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Tue, 22 Feb
 2022 16:18:48 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.021; Tue, 22 Feb 2022
 16:18:48 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, eblake@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v2 0/4] block/dirty-bitmaps: fix and improve bitmap merge
Date: Tue, 22 Feb 2022 17:18:29 +0100
Message-Id: <20220222161833.1453641-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0401CA0023.eurprd04.prod.outlook.com
 (2603:10a6:800:4a::33) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d744477-6b61-45c5-e07d-08d9f61f0172
X-MS-TrafficTypeDiagnostic: DB6PR0801MB1669:EE_
X-Microsoft-Antispam-PRVS: <DB6PR0801MB16696B02229C4DA4A7A6CDA5C13B9@DB6PR0801MB1669.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6M7CWU1fxWajoeVN8kEtAErxqt+9qlvwYBc/bMQB7DWDDWnfMJ8sH8ahtXGKRDXk594RLiSWboa7oCuoIBPQsyjx5S+reYrVgY055piB0Xj/QpnuTPS77PvRsdij5QajyMlR8Phm6TrKve74VDB8hBRQKaSemumwpvtD/CoWFFX7ectPqCQbXzJbjd5RbOmAad1MHk/yPwuOzWT/NCMyzeYvLWPT18cqiDMZIsrzVm9ba2xMo1ECqyqVon2pH6KdgPhIv7u9VpQVgFdA0eoVTe321Z3jWCDKal5Estxn81ZyrMRFvOn5Y+1D51gNPHqb7CIpX8xZ7b/NG8Ldqzu8rz3WXE4A9R6qvwfZC/kimSA8DljZAOqDmHN00hYt+mYVT3JUr9hSL68/LSAJuXaeWpwP0lC6BhTlgMBFm6HTw1c6pggAkiiOyxOfCOY9aPXn4Lkp1rug/0fg1cYamvlnpd2mT14xen9/SBFRAjH+cWPsdnn42DixD4G7iC/8o8k8xEMtDNpx6eY5QSh9Ka7s8agQRoG3Slkuklhm3VDOj2znPaFRX1Z/T1gBaBvJTCycGYvvxLOkQ2BCorAjTRQYbhmgTyD1X1iis68JRfgPlApUWZJzWqYPFD5UFhGM26/s8boQaNM1y9UgwXOrH611cOJRyQgtRtQ96QoVbpyG3rnfqXdXqMcl7jV+5cARKE3l5OcGCs4AzoPtJOZLAeTLAtiNrvQotho5E7RT+tJT2AQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(86362001)(6666004)(8936002)(52116002)(66946007)(6512007)(66476007)(66556008)(4744005)(8676002)(38100700002)(2906002)(4326008)(38350700002)(107886003)(36756003)(2616005)(26005)(6486002)(186003)(508600001)(83380400001)(1076003)(6916009)(5660300002)(316002)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5YxGMEW71V9CjPO4qFvH1siC3RR1eKaAOXHo3Hu6wbRcnj09NjtYNnJbh++j?=
 =?us-ascii?Q?52+r9lcTMgDu6a2aIpNooCv6AKjgHqZa7zscXakniiLc49B1hT6DGQLSZQg9?=
 =?us-ascii?Q?p7IcDj7+68C//Y52kqgtunKFeY7KWF/r8CwCUbjNKnI7ZCepppacFb+/xzW8?=
 =?us-ascii?Q?nz27nd+AO/CShyVxZH4lVQsHahO6n8ZmYp7GoQxvIuQYj8NT3N1/AQ6QrKjh?=
 =?us-ascii?Q?UImUWCa2b0pNfsE7Y742aqH+cja08W1z/MiGNgvJgcm2+Ui0RM1ZSw5Frfxg?=
 =?us-ascii?Q?uOhSKKztpD81XNLPbsKBjBbYyD7HgrDdvtPZKobSHT5yksWalD4F/yxy018A?=
 =?us-ascii?Q?0trNhtlv1m1rqFdzjJVmgUDcyWLDcZT3b52DZ5ivXro2/GFNl6Svp7GSm3Nf?=
 =?us-ascii?Q?FbrhatmXAp4Mz968wFYtOfRaFDP6hfvSOQxjpyOVvktrnxQmLZ238GalNGP8?=
 =?us-ascii?Q?p2xNumfHggrcJ8OMmpZsjrmocp+YSl09kG10ptO14eOHsCvpOUJFVNd8mPM4?=
 =?us-ascii?Q?ZqfAVMVv8iRX0kMMi+zPnl8GwFmzjpOh678IoG+yerK17kWgI6hhDxCRgyZv?=
 =?us-ascii?Q?C4abCpLjZr6EtSZSd0TUa6HuMEQ71Jf0tRC9k99Y9/4Q/fpDXpdxDIhebLs5?=
 =?us-ascii?Q?/htfHXK/c3CzY4F+RgaGEMUWjCJZ8Wgr1imXnFlEvka1pay/lvyWmud5+P9M?=
 =?us-ascii?Q?+4rQxx4XZf0R2yqT1LXP3xlxLUlOfA0B7L5odduk/zlhLLiiLP6IcNL2TsqI?=
 =?us-ascii?Q?Dk81Xx+KYX0rss0f72hFQRF9WDn0rVKI9YKfy412K9FbKkSySX8l9S3rRoAq?=
 =?us-ascii?Q?FztkmBa3EuEJ5n39Y/ERVGbrzsWedduKUB8mSgUI9sbps5fBpY/iXOp32NBz?=
 =?us-ascii?Q?1o2DEdM/xVuMdYR+fywdxVNQNORk3zzS0IM1zoCFv0veKS+enHkHGA3Ndr+W?=
 =?us-ascii?Q?G1Ju8ngye13wr1NFKJcaMlyo7H2U1uQdKsmGM8EhK7tBUBaKyOM4EKtc/UZx?=
 =?us-ascii?Q?lfjqZIUAC5jTTWNBkjb6KBH189p1h119vGZeJ7nHoArQYxmAWDPObyg5DJ++?=
 =?us-ascii?Q?//0L9NOWkaF98/1sWc40+55xkQnbfQHaAgrKKvZJMh5b43N5URBR82mjSe5i?=
 =?us-ascii?Q?eNg3CaW9yQjV41YTD4kdl5vZ9/VQ4SFoCB0cdOz5vUmtFDXu9OYTQZ9/NtC+?=
 =?us-ascii?Q?3uJOnKWC/TZTsGVgNKP7hiUQ+frK73dcz3y/dDdYOVs2AeDd9B7EATLRBklG?=
 =?us-ascii?Q?WVKLVSFUdwbwvjRfTcPFfSL1Rb/HVZ92dSB+6j/iAuX9ETtxJQRsN3JBMEq1?=
 =?us-ascii?Q?o3zH+zYs5gW4bz511Fhf3qoF0E6tZE0tLtlSTSDHDnikpFShqR8PW1WAVHw3?=
 =?us-ascii?Q?4YGm6GwS/6leN7OhPoPquaLA6UN8azBFzl5PHjDlpdFvwZWzr3Qtx4FWhGc1?=
 =?us-ascii?Q?OCifO+JXSDTR6a15Ko8aVQB91wbVOG5neMZxzfDJ2aKZgUZeWoGHBSdOhhBv?=
 =?us-ascii?Q?FKewdvTz7g/PXUcU4uU0VDuMxd40EYJCzwMxjD3qp4psPt413/dsbdNGup4R?=
 =?us-ascii?Q?mP7tXga+JbspgHmPYyir7ETrkwlkV+YttuaigskKQlIk8wFRgP5v1m3i+9T5?=
 =?us-ascii?Q?ZG2j2CfCIztBJx3R5sQfD23cCdOu0i39XK9FVTdXUvkD755b/SXPmxxDvv2w?=
 =?us-ascii?Q?XIDoVw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d744477-6b61-45c5-e07d-08d9f61f0172
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 16:18:48.1797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hzMlUGThuWOiT3g1ZByG6DJqhvrzTLj0X0KBq2Z1WmN3cg5CqmIdcN3ZOxbQBStx5X4mjRKARFgMCZgix12nkfkeHwBCo5d2FZWNyB1NaWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1669
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::71a
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::71a;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

v2:
01: take older patch which is better and has r-b
02: add Nikita's r-b
03: rewrite to keep original logic of no backup on failure path
04: fix comment, add missed "ret = true", keep Nikita's r-b

Vladimir Sementsov-Ogievskiy (4):
  block/dirty-bitmap: bdrv_merge_dirty_bitmap(): add return value
  block: block_dirty_bitmap_merge(): fix error path
  block: improve block_dirty_bitmap_merge(): don't allocate extra bitmap
  block: simplify handling of try to merge different sized bitmaps

 include/block/block_int.h       |  2 +-
 include/block/dirty-bitmap.h    |  2 +-
 include/qemu/hbitmap.h          | 15 ++----------
 block/backup.c                  |  6 ++---
 block/dirty-bitmap.c            | 36 ++++++++++++++---------------
 block/monitor/bitmap-qmp-cmds.c | 41 ++++++++++++++++-----------------
 util/hbitmap.c                  | 25 ++++++--------------
 7 files changed, 51 insertions(+), 76 deletions(-)

-- 
2.31.1


