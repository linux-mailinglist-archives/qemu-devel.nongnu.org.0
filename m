Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 529273D47E9
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Jul 2021 15:40:49 +0200 (CEST)
Received: from localhost ([::1]:49066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7HtX-0004n2-TU
	for lists+qemu-devel@lfdr.de; Sat, 24 Jul 2021 09:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m7Hs4-0002iw-Ti; Sat, 24 Jul 2021 09:39:17 -0400
Received: from mail-vi1eur05on2132.outbound.protection.outlook.com
 ([40.107.21.132]:24064 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m7Hs2-0004Sk-Q0; Sat, 24 Jul 2021 09:39:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftMkflIE/lQBC80R2A2gT6E3I+jiRImy8FWaTh3Q9Cz68bvogeZ052erFHRd7MkFdLQZMsXx3ModCif1TeseMJCYzdpc04hfNSmGPUVzqOYNHtXyawMJQwLASNm6ooGebK3aH1tp6NBWVA+G0zBq2IhU9eLzsbfNtCt1UZWFBAQy87cfCXxOlqsRWXmWVWL5GlDKo0p4VtRrsQY/de1QAsSENOOWFQqSvytltuS3upip+hk3v68s2TiBKXwVgh3HJeMXUOAwHCZLihm1O+dnKIwaQbPha18LjODh6Z5Q3QMPl2pge/1PT4RcgFg1PZhxgwyZRyaHSx5tfyXHsjKM/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uwss4VCHQfW+gcHM5dV3FT+dK+d+Q0v01sd6CXn0kqA=;
 b=jLiYesAWsWEC1+cc6br1desalUKZtosoIovUNsMPoDGLvX5Ps9O6AqXxSowL8qyqaO9gkxeCi1S29AwUCFh4d2pguBw77Ot5IKg/FeugCp5x2SaoHUi4aGio/JpbvqPJ3SKeMP9xgGw0vwU28Kat7D3uKUJPfSPXe2sGf7YQFRieL4qLXMd3MMmaPww69jXi/FPBWe16haC2abjJhEgOFOWRmniZIqDjtmvzW2aCGcLo0khNGpNvhwKG3kdfk5rAowB9vDsenOI5kLaWYPEGupwWn170GgJHThi7LDjaImwQe/gDeomJh6qFEF4loep73aaodX3KBl4S1Se0AdcFCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uwss4VCHQfW+gcHM5dV3FT+dK+d+Q0v01sd6CXn0kqA=;
 b=gK1NLHDfv3yNqtdVki+ElXFIv9psxlx3PKZmh96drF7iqBYIKbMutYG/zz5n84q16khXD9Mlp/XYZyoJtNVsGGHyYDBUN+7l7JWi+dsA5V4KyxkkBYbqYxHIKlddmN+WRh08mC3IfCi7IZ5KXoBcOfrZHqqdbYZH2XDqYuYLyZ0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6805.eurprd08.prod.outlook.com (2603:10a6:20b:396::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Sat, 24 Jul
 2021 13:39:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%7]) with mapi id 15.20.4352.029; Sat, 24 Jul 2021
 13:39:08 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
Subject: [PATCH 0/3] qcow2: relax subclusters allocation dependencies
Date: Sat, 24 Jul 2021 16:38:43 +0300
Message-Id: <20210724133846.64614-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR05CA0200.eurprd05.prod.outlook.com
 (2603:10a6:3:f9::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR05CA0200.eurprd05.prod.outlook.com (2603:10a6:3:f9::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.26 via Frontend Transport; Sat, 24 Jul 2021 13:39:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3099d375-38ab-4db9-aaa4-08d94ea869b3
X-MS-TrafficTypeDiagnostic: AS8PR08MB6805:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB68053C4955DE1F3ABE4F40F3C1E69@AS8PR08MB6805.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: loTBCHrLBEvZP5k9SQ4jUQK9D7H9Is7/hyXDHbw43Ho4yc5BJEo3Kcldhui8V6N+ZgPVJWTC6/VX3J2BTm1D3f8VMBV196Du+eVc/I4G1zs54clsGNJ0rI8+xf4NfGyHwybVzICkBLuid2r37I/Uln081a4z1nGjac8ZAHnVhB83UpsqnGwkvAvBagv5NiPMQsncfJVdBLzosEYYEuwH0mB68GPPyXgCjS6h4V7Dq95dGEQBA4AFg0eSXxw8M7AHnhFOr3KLStwVzNbMcCrCvbX9crLaJHSKj/G5IVzFKHIeFauOilL/NIUu0H7m63to5TVyZyvlI65hEp7/8FVgEQjYaNwR/VN7Lw6s9rfr1PRKOBdwdoIfWaq+c8g/7PFR1nKe8BHpTapBlP21vJ5+y6tblQsaPqIqlopoigIYlqtOf0sWq85HmGq8Tkqsfx3q+/RpGJKIaitEWKUTUsRuRZweCbhF6gCblop3zxFIrJKgbw3mvdwdZlVYB1juM83rdsF8UEiAAuWbOXBMOfjDZRoLd9Q6eZKa0dBq2kC8hdQnsOk9ogd/o1yTP+ruMvaEBkUeq5Zg7RjX4NlUXoWBrv4EeVqXU5iohE7oy3qFv6EbFs3r9ao1Eb9pwUyyiqjnVpLtuR962XjjNrhIAtdwInlXnMT1qgAuGHUmg3D3nPLxrU3CYcs7D8e6NKDAzrbuscA4wtwQhXbvPhPxg3d3Rg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(136003)(39830400003)(376002)(478600001)(186003)(6486002)(66946007)(8676002)(6506007)(5660300002)(956004)(2616005)(66556008)(8936002)(66476007)(6666004)(36756003)(2906002)(6512007)(6916009)(26005)(86362001)(4326008)(1076003)(316002)(52116002)(107886003)(83380400001)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVAwVWJsY3NIb1BHRTQwcTZ0clVpU0YvTjFlOFd0WnBnMnphOGI0M2xMa3ZU?=
 =?utf-8?B?Y3BlTjVYaXlqakVPeGUvOVl3ajg0d3J4bERqbzdUdXh1UHAzMDJockorV0pX?=
 =?utf-8?B?eTN1a1BKRWU2dlM3b2VLRnZ3RDh2UC94TExUVS9EY28rQU8yMnZvNWQvVTZo?=
 =?utf-8?B?anBRc3RjRytqc3RHd2pqRGJsdzAvTUFEUUcyZC8yeS93WmRXT25TRDlqbUZC?=
 =?utf-8?B?TGFRSHVhKzdkNEpUU21GdWdPZ21BbEE4NDdweS9CQlZGQy9LL3VpcjVmYWpW?=
 =?utf-8?B?cENEanNlMHBUQ2d0ZFFUdTRnQmVuaTduN0s1alU3MlNybHg4WU93S05pVWVv?=
 =?utf-8?B?REhBRmRmR3lPVWJndkJzbjV1TmZOWkg5dVhGK1ZteGd0c2J6TndoSE5WMG1x?=
 =?utf-8?B?Zi8vK0pWVWcwNmdpaDVEMGRzUTdRRGJRUmRCK3BvSUlDL1ZycENleHRmZFBK?=
 =?utf-8?B?NHh6NUk5QkZLa1lSaGV4ZkJhcWZNdTByN0hvRzBqUyswK2F0RHR3emViTnhl?=
 =?utf-8?B?MGhjeDc5TVBZRkw3ZTh3UkRnYS8rQ0U5cVEvVXRnaUVWZUh0MzBpbGg5a1U4?=
 =?utf-8?B?S0hsRFZxOE9FSktxTkFHbXVZOUxVVW9wZUs3Mk00OW5kR1VYN0YxbmlUc1dx?=
 =?utf-8?B?UG5xSU1OczJub0FBREN6dHNLaUF0eS9GQk4xRUVYbmF1OHQxS3ZqVlZWVW92?=
 =?utf-8?B?ZlBGVnRHb3Y1MUlaQm5HSDZEcUwwcnFTVk1Jd0E1aVJLcW9wcytrZ2F2L1E5?=
 =?utf-8?B?RWgraGFCc0NlUWhXM2FIUnZ5WTBzbG1BNHdxWU9ZQXF2ZHVSSjN5Y2lXSm9Y?=
 =?utf-8?B?alUrcytFbmpGelhBVW96bmpPS2JCWmdHcXNnQnNOS0RoaU9kTk55QVJGWWRG?=
 =?utf-8?B?bWVJVjI0RXAyS0FscC8ySEE3aHVicXUvQ3ZyK1ZuU1d4d2IyUzRpUFB1VGds?=
 =?utf-8?B?VitUUWl4Qm4xYUdobWxXUTcxYlNPa1MzZzdQSGZXdURQVE0wY3ozbUJSMGd0?=
 =?utf-8?B?TnZhR1Z6TEZIVkxvMlFqNzF1aXJnNXpxdDgvWWNNM0hqVFpsanRWVVNyTVN3?=
 =?utf-8?B?R0l4T2RZdXFnelhKL1lzaE5MS0NZYmRtSVdrdXA3RmF6MEhIR0lyK1VnNC9S?=
 =?utf-8?B?U2RHU0hPT3hpWHh4L25QMlJwYTJtMG9VTGFsR0V4QzZUWHUrbnh0QVdHb0VV?=
 =?utf-8?B?R3ZXL3Urb1k0Z2lZYzZaTXZJM3R5K0YyTHZtem5tcTZaQ1UrQ1pLOTdQZndi?=
 =?utf-8?B?U0U5QTlqQmpoUjEycUZPYTBuemFuWGdXZkJwTGRtRUtrLy9TSWtwR0lGcTk0?=
 =?utf-8?B?dkN3Q0Zlc0cyVmhEOVJmczdjVFVZL20zVlF6NXpzR2NhellRK2hoWkxiUENQ?=
 =?utf-8?B?UWtzaHllaXorTCt0TVFJekh4dWU5a0VjSEVCQTlKQXRPOVhwYXB1cS9pZm5E?=
 =?utf-8?B?aXM4b2tzOUI3OVF3L2dqajhVT20wZWdaeEZTREJwWFpLM2NybkE2UjJtdVhL?=
 =?utf-8?B?WWJndjhvN0JoRUwxNXFsbm5EUkFHSnZmL0JmZER6RXljbzJGTGxFV05jRWpr?=
 =?utf-8?B?Y2NkdmFoamZQckQwV0RjMEhqMkxIZXc2VS9aaUZqR2hVci84MXYvYlFacU5t?=
 =?utf-8?B?SmgzMmJoUndkMmxxeEc5cVJOZlVoUHd5S3JIUXRxUENoeHdNYnRUc3IwMXBP?=
 =?utf-8?B?dDV5YUZJM1lMOE5IbTRMdEp3UnVRTVE0bVhtMVQrMHM0NEVvMjhhTnQxK3I5?=
 =?utf-8?Q?HvpKDA0QuyZUkdPghslzoutGzyCzVb6h5CH8Qnb?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3099d375-38ab-4db9-aaa4-08d94ea869b3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2021 13:39:08.6182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +oaLyiUf7wRnsC7jV2q+qO5GM8KwJnRel7I8Mz5DjbgLo7qjyuDTtWr0S19r76bRNeb9sRscaQ+rxNtN1FapKcggnySQXub0BUoyn6cW7eo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6805
Received-SPF: pass client-ip=40.107.21.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

Parallel small writes to unallocated cluster works bad when subclusters
enabled.

Look, without subclusters, one of write requests will allocate the whole
cluster, and all other writes to this cluster will be independent of
each other, they depend only on the first one that does allocation.

With subclusters, each write to unallocated subcluster will block the
whole cluster for parallel writing.

So, assume we write 8 consecutive 4k chunks in parallel:

Without subclusters, one of the chunks will block all the cluster and
write L2 entry. The remaining 7 chunks are written in parallel.

With subclusters, each of the chunks will allocate new subcluster and
block the whole cluster. All the chunks are dependent on each other and
queue depth becomes 1. That's not good.

Let's improve the situation.

Vladimir Sementsov-Ogievskiy (3):
  simplebench: add img_bench_templater.py
  qcow2: refactor handle_dependencies() loop body
  qcow2: handle_dependencies(): relax conflict detection

 block/qcow2-cluster.c                      | 60 +++++++++------
 scripts/simplebench/img_bench_templater.py | 85 ++++++++++++++++++++++
 scripts/simplebench/table_templater.py     | 62 ++++++++++++++++
 tests/qemu-iotests/271                     |  4 +-
 tests/qemu-iotests/271.out                 |  2 -
 5 files changed, 187 insertions(+), 26 deletions(-)
 create mode 100755 scripts/simplebench/img_bench_templater.py
 create mode 100644 scripts/simplebench/table_templater.py

-- 
2.29.2


