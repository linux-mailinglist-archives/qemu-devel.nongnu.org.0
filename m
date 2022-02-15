Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 550614B7438
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 18:56:33 +0100 (CET)
Received: from localhost ([::1]:34992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK240-0000RJ-20
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 12:56:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nK211-0006CI-G7; Tue, 15 Feb 2022 12:53:27 -0500
Received: from [2a01:111:f400:fe0c::71d] (port=64834
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nK20x-0007aW-VX; Tue, 15 Feb 2022 12:53:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d3ha/TRVtF+i4S9Si9xC7xb4F28/Sfgp0a3XvlB3/d3o7wltgCf7jrufgSayWXSIC1vyOcRLGHUbWY5cgIF2l2H+eJ2Wy2Prn5wkTOwsnVxuAAIWto1gGqRLnb7gHHM/7+MS5EUNWle9dJYlqcIDsFIYSC1LSAtWawzjeIfuW9Knl9tUEa1mNtYEdUXwL1JlAQ6f/wfw6rF0bQ56k2sUc3TtmUZYA8rvYZ1iDKi+K/hmNiLpITzMI5Bdzm2qT++4+HB5IR4FMIBCsXXAUbRHhZMkxBGfLEPQgkEoZPCAKE1CDw2BWS/Y2qGUeGVwBeMIgfjtLA9WdGCxhIcLxdHriQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOwLAYqQNe85JoMfiL7NYIJLchpX4l9h9julmeJPf5Q=;
 b=BGyMXp0hfdnaEWC9eJQELmDZDlDxVWesf5Hp55d6Pa51ESAl77XXxLsjA9JnNQTaDSmcMa8ur7eKsNVQGJAuTCZ8H6zBRqVJGr1Hs1rvsV2pWacUh4y/R8uigdLJDq2bvjwNa9SV6b16nS9qRIOAyzWanM+H5fXj+OUcsZHrN+Ww+Da0IAawWLw2aZwuo7hmukQw4hczPFBYvRfvvauJF3CCyOBnbVsLdxDoYOcPur2hIJjLsXAln3DGuICFNcC0S3myofqkOJS4xlSz4iiq5P1ooYmIREqURvbB7EqwjQoWjaEJJBa9q80wycbayS1bHsN1MJrGK5uQaCrUR41U4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOwLAYqQNe85JoMfiL7NYIJLchpX4l9h9julmeJPf5Q=;
 b=IEsVl3Ydkzyl04ezuVl7MpdHUKiWe39rcfUEnOqTjXA7TI0KOLPUDWZ+NvfJHtc/jFKQVnkiLIoeyfhhnBF478e/Y3Y5KlVtIO5cN/wD2BzQ/ijPXMwHmCZ2lVlMlL8d8Z/BJKEoA4BXfU9AE/87XDMVdgLGaFzdrE7RaUBRomc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by HE1PR0802MB2235.eurprd08.prod.outlook.com (2603:10a6:3:c3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Tue, 15 Feb
 2022 17:53:20 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4995.014; Tue, 15 Feb 2022
 17:53:19 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH 0/4] block/dirty-bitmaps: fix and improve bitmap merge
Date: Tue, 15 Feb 2022 18:53:06 +0100
Message-Id: <20220215175310.68058-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6PR08CA0013.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::25) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e53e4db-c144-4a66-41b5-08d9f0ac0d26
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2235:EE_
X-Microsoft-Antispam-PRVS: <HE1PR0802MB2235E83849127333321380B5C1349@HE1PR0802MB2235.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:374;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TNYJBc9+lT9kPoQHEL8TCaabpW/2h2BiEt3c6pX4gs9desLVOwrK8rVKMz3gNQ9e3iipVJBApKgXg05hQkmZA0xmhbZ8RVAWHq3AhFn2/E2IYYdZPADBorRM0ho8cWnTBzWA/47MIGA/WtwYMROTye9wYDHAiCDrMCwxDA+R2pesH2toGY9lm3QDmKvLGdkqHm0b1GjOoGobuTVmzqlhQEJ5HlhOrxVDo4b4qAygGCrrRt2frz1xN1xCOxobfrEFF14j2EEhrzNERq0M7RE95cZgmIxUcIm5nfYQ7Uao44aKYTMpGYEw4f6LFYtXZpDru60F+oZi1ukQlxbinJwPx57uASaJGZ3xgsHjQn57EGIMq3u461EjdNO3HpSfvNUGrUj1kiFaQFxxWG4uZCWrKY+bASMchqlW7nj+bH1Vx8K7j63wGqdmgPnRN/2LjKw4F1ztetZ3jkzd+aLF/X66dxGTxxdPyaNHrL2Ekp4/fxZpHH20UhV3IpjXcE003Kqs5PuTmhi/Oqfk1E3HiouwFG5UCozYe8PygFC/hlz+h2ZWEG/+vtcfuqg0flRGYGm2jcbcnOrmzhrjgU/RnqiKoWf0vSVGJJqFGdRIOY4sWzU7A2Ib11qhJCAwlR+ym4atcolVbSNHpe8bNZ5540ZZUI+XMNkmydkl1wDH9BW65xyqnprCOZBF4WbbUo7X4bJP/mTdRibh6qDrfksaerUBg67LXYxclKeQpCe9zrzzoLo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(83380400001)(6512007)(66946007)(4326008)(8676002)(66476007)(6666004)(6916009)(66556008)(38350700002)(86362001)(38100700002)(26005)(1076003)(36756003)(5660300002)(4744005)(6486002)(316002)(508600001)(52116002)(6506007)(8936002)(186003)(2906002)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DcW9CNlOiiFPTroZ6rRTh12vw3WE4dDuLwNKp975CGbrqwW4YyenTGXtsiKQ?=
 =?us-ascii?Q?Xp5EfhP0RZmZywIS9QoWH0jc6IeciplKAn0FjzSk+OqAw+UsfBoRQYFTLJ47?=
 =?us-ascii?Q?RdVxhUyGJviXFd3FGTQD9ZgQt0U8hYSWDwMGOFlViPyxnhrUd3NintIeOA54?=
 =?us-ascii?Q?a/na6bpXsJ6Bi55IU/forCmr1ur3pfS5oA2ye2/SjvF+xNSoavQS6QpnWin5?=
 =?us-ascii?Q?OQugVlW3WQZG4t0GIxdJjLoNljwreCYMq5v7SRmsNNeVw+somcYHdKCTcceW?=
 =?us-ascii?Q?qcb7g/cdQP0QHshxcQTY7USHkjZhWHlveSxVfj+4pqA/cX3Xs5ehXoKqlcQh?=
 =?us-ascii?Q?bCZM4wZL1XNhqAi818u1wilxWcddo8/sEeqPNUhESiF59e90u9fOtL4GWiP5?=
 =?us-ascii?Q?P69s73qoJGa1tgr7Q7x1M+4i13lXp+DKiM3lKFWP15GuYVItfnSlNpofb9dE?=
 =?us-ascii?Q?zSUUQbRIq/rORsIFIEv/i/683V0LkQzmy6ycXqQcOMEQ3PaMRQ304bKlMvWY?=
 =?us-ascii?Q?K0cWWs5x/ndHxz8RwDOsC2dN5i9gZX4yBNLk2UnqOvHL/pvb+ZGRvjh68N0h?=
 =?us-ascii?Q?jfv/jHWPHxw4sDuEZlZaHYYsCf1mTSEekrW7c+Kl4jGEgbfhKguKKHCy24vy?=
 =?us-ascii?Q?7n5SVjIS/ofPL0SycwoaB9qa1AlwjQIpTmEDVrYLsZiHHGCXuY4IbhBlNrq6?=
 =?us-ascii?Q?CjqYamck4brEOoJllSART4IaZXV9O/YeRrP34OjgIQxYVYOrenNzD9sfQd35?=
 =?us-ascii?Q?nUeOt112tCmUwrtbFIy0O60hHVdit6AJBkLqIJktUc2t6yl+w9YzQcpD3LvW?=
 =?us-ascii?Q?h/BrIh/9JiW8zO3kYpoZz7cKoeuwpUGZVLqqrE6+tgVW65//5ikTqEKHdvLm?=
 =?us-ascii?Q?68Tt4YHCo5BNtNghKfO0WDjNqmknRO9mdiwM6UwHaKqEIHkwVSlzpVpnn/V2?=
 =?us-ascii?Q?w5guxGiQY4NtoqcjAhNLij3Y6/fXuEIeuRPVmcobxK4WGZJ8XYDLo1H+Ozm4?=
 =?us-ascii?Q?V6KB+1r71QiGCDCDOXCCddSmWhCb9gGWLQmkOulyW72DQTLZc3DhWWfw5dkO?=
 =?us-ascii?Q?lbAzykeOLdA0AMbwLAJWngkZjUOEQTf5QEuBadpKwKg51GAxcWZL88S0jafh?=
 =?us-ascii?Q?ylC4hML1weTRemH0y7wsjHpGJoJTfdC9yqDVuC+uQKDW960dx7o89IBSLNZ3?=
 =?us-ascii?Q?SjEWLcUmVV/ES/i4W0gFW3mHy80k2sXzMjiyE8GA8VKMBjuOn8q3R/lYs4q/?=
 =?us-ascii?Q?NWwjBfxGsm3+AsoKIZZrUBFyH25Timi5SSGS20d90yNinPUxLYQpJ1o6Ffcl?=
 =?us-ascii?Q?mvp0rqmjF5FxpSUt4muy9ZdkY/qekkeCku4rlUJASduAAArtv7YZLWSVXlTF?=
 =?us-ascii?Q?FmGo4BafYcnQjp4cdd++hgjft9gtV9ny2YEPsgI8k8mIf0bH7wFDJVa+Sg3r?=
 =?us-ascii?Q?aTBpP49fl8yCSmjtqDT1IE3mwUBq/CoNR02Pr9AsYogKyITJU5CTgQiycuA8?=
 =?us-ascii?Q?C8f8LGhbvgVQG2wMzPWKLXlS/IcU1wRLw7ktXXxnlPX4JDAWqB4vpzuD6kq7?=
 =?us-ascii?Q?HexQ1H/858MKAGRimKsOb1lZ79tJX4md4lqYgcp0vssxj52NvPOr3Z+RuAdv?=
 =?us-ascii?Q?ioGZnUmvevmFDS31GB+LGukBWuEiSSovmCEh4X9KMuYXmsaQTvqKHGOgZIGI?=
 =?us-ascii?Q?d+TqMw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e53e4db-c144-4a66-41b5-08d9f0ac0d26
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 17:53:19.7800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pluohjjzoegFaFzxG/7PTuMfVHb5HUEudWWZO9oH3aomETvA6mM2ONMZCKRYiSv5MCHS3mSWBq6c+YgHX8a2roX4wXVTgMkDDjGZzrqlIgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2235
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0c::71d
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0c::71d;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Hi all!

Here are some good refactoring and fix of bitmap merge paths.

Vladimir Sementsov-Ogievskiy (4):
  block: bdrv_merge_dirty_bitmap: add return value
  block: block_dirty_bitmap_merge(): fix error path
  block: improve block_dirty_bitmap_merge(): don't allocate extra bitmap
  block: simplify handling of try to merge different sized bitmaps

 include/block/block_int.h       |  2 +-
 include/block/dirty-bitmap.h    |  2 +-
 include/qemu/hbitmap.h          | 15 ++-------------
 block/backup.c                  |  6 ++----
 block/dirty-bitmap.c            | 31 ++++++++++++++-----------------
 block/monitor/bitmap-qmp-cmds.c | 31 +++++++++----------------------
 util/hbitmap.c                  | 25 +++++++------------------
 7 files changed, 36 insertions(+), 76 deletions(-)

-- 
2.31.1


