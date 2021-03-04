Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 967CC32D090
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 11:21:33 +0100 (CET)
Received: from localhost ([::1]:37252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHl6q-0008MF-Iu
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 05:21:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lHl3T-0004lf-Bt; Thu, 04 Mar 2021 05:18:03 -0500
Received: from mail-eopbgr20120.outbound.protection.outlook.com
 ([40.107.2.120]:19927 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lHl3Q-0002G5-1l; Thu, 04 Mar 2021 05:18:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F57uQqM9L2KbvEyQnSSjnXZanzEhQEHGhi4111YLOGExi5eFgNdZNuisNXUV5pZ39D+2X5q0+ilhcEA1XlJDiYeZTqrOt1rQoUsapuRAflQzxgoHY0mL+z/lFakba+9D4cAJUPfwxoqALt2JqtmvS/wkiX6rRylf/tKHHJqU7TH5tmCLlmM6FqCO4L+WLVbiwy8a6qymW8tLN2jksRuKoCoSoZ9Mw22/IfMemf1fek/kdI1grEbKLeiLdmIVX0dUrOvwZPOrWJ1Em0mNogzbmtAPmIPRyoJdT6LNryhM2Mn1fUHGj2bn0iTrGC8fuOZyABXLP9rgTGl0b8V32Fxl4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2Z0IJaxgXh4GdTDlxnqjWOlh0GLvjpLJVcVf8eGn6c=;
 b=NYbTkDT0PA9WP3ip2ZwgZP7vGMM2trm6ZilY4u8w/f50Jf+sVt7VI3A6WJjzOL7bO1w/Rt6yHF11yhIExdTySUSzNrTejCVzlRLoMUeZU2MioYUy7CacYEjzrcI1Na40z9oiNm63J0r4g0yH9WMl3WinYcqDXO4doWabmk35gX59kD7k19FkZKESR88EqvQIMp5vfRGVmcEIKMkf2HQMDRcIxw7kmPkT0jrbPZfoIiWU/udnT27JOb/MXYSOt9VRvNdFjrUTWwEfteAEAvzNWz0rVzWNJI1hXhByurwR7BEOc2A+RoYl1LBNOB0OUASQ3Ba3fgJf6H0r5RugPB5+dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2Z0IJaxgXh4GdTDlxnqjWOlh0GLvjpLJVcVf8eGn6c=;
 b=SlFd3d2u1A1dDEXqKdvlGwpST+OB82KTlIf/v709+ovMU0U/Ffc4yoBAIpwtX1LRHYDqryDJ7nqdcEWpzHkBKe8xC/UwX1nSotvg3LCVdCy0DvzecRalfJJhna/11WCVaI2n9kF2w2KbaALnz1rRYjVdpkFgcEB4aL/xn3/RsAM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4913.eurprd08.prod.outlook.com (2603:10a6:20b:ce::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 4 Mar
 2021 10:17:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.021; Thu, 4 Mar 2021
 10:17:56 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, vsementsov@virtuozzo.com,
 mreitz@redhat.com
Subject: [PATCH v2 0/8] simplebench improvements
Date: Thu,  4 Mar 2021 13:17:30 +0300
Message-Id: <20210304101738.20248-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.246]
X-ClientProxiedBy: HE1P189CA0032.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::45)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.246) by
 HE1P189CA0032.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Thu, 4 Mar 2021 10:17:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ee5e279-1812-40eb-6998-08d8def6c728
X-MS-TrafficTypeDiagnostic: AM6PR08MB4913:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4913CDABD2FABB26D5BE9905C1979@AM6PR08MB4913.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HaOcADLHC+pXHrdIHN+SJQUHXxPJd6NCeGKhls26FX4w6yETXEgaeQ9TrQ+a+Nk9qib7DT+jkYxAC7Iqd66QyuGcF+T+GFvIzjZzG7r4vy2s5D/6axuvwJU2oaL0Tpc73FC86Oh5Z8dvm1tfwI30T3wTESCdxYb0gV0eEmFqprv000YOZc0uFQ8XTk6OKPJOZOgK/0x6EF2uQYbvJ0R284t9kIC/KnfFEBBVHMiwCRaYGWAgijKcE6c7iWlop7vf2DALMHU6inOCy6HCsQMGGD3EBOY47OKa1E7UePZK0JuUO/LGxS1SwKHws+K3e8rM/pIYxBSzE9RAeL95UhQI5hwNcxUz0TLe2ePz9rQ2i7SxIiqwbxK31SDKwc/C0lEZ5d8JdNRZdDrorOlSThUwy1V+A55gn5HihKh6YJlw2bhzdoz9VKlBW9p022ntrip35Vs2jiqugstfCdRufm2sspno+MfwaLQ8GltHtmW6485dkmvzwCs5ZCDn1We0lnrg+wj5yVgQ2VGsyNHjHX/+hMxm+5ePi/qDQyToIH6iu27lDpIra0Yl73Bf6eBWGvG+o/VYQjAUY2H1vbqc7MgePX9psgsEjjF6DHN88pcsArxDhMjd4gK6UaFI9aJ52koZgQUEZ2kqplptJcFnj3HJPJtz71U95mKfwlbSNhY2pE4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(376002)(396003)(366004)(346002)(186003)(26005)(5660300002)(4326008)(316002)(66476007)(8936002)(69590400012)(1076003)(8676002)(66946007)(66556008)(6916009)(52116002)(6506007)(6666004)(16526019)(956004)(36756003)(2616005)(6486002)(966005)(83380400001)(2906002)(86362001)(478600001)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?GmxQcxrg2yugV9LYmLSDWdVmgBAJNtokGZBTFBoYL3I7BPsCA6kwLVeWLvUg?=
 =?us-ascii?Q?nnccJ2GfryBO5P2bph6klJf/TAMNsZP7horWfDOvXAG4a7e9vOdgZ0XKNOgv?=
 =?us-ascii?Q?+aMNMEyhs6yjiJDZE1HlmHN2cXFlxzmSFSHQ72lzTNWtDJsEoMFySjYzmzGu?=
 =?us-ascii?Q?XigRWyCVyjgW+GElQnfKKWX4xUMRjtNdR6k17GRF7lNhQn5cB6Q7L5Ny6y7S?=
 =?us-ascii?Q?BwY/lJeHDkQn7EoMKcyUjxtHWxgJqog/R7hQeiUjdWTPJwcaR/9qCkfJOmaH?=
 =?us-ascii?Q?nnevo09rR3ER7/RxGwz7IWqVSkIjCag6+50RDvlaaRx55L62W8OJWtkUkcwY?=
 =?us-ascii?Q?QMNZ0ZzEYkyARcL9Fte4/GweTAYH+owdrPJ0NXSL68V+4YoST7N8VlZfjFXG?=
 =?us-ascii?Q?n+IzvKYnFvNJYZFvWEV568X9tJDGYTWj+4NX8N5RDUs4o15Um5Z5Nyc8M6I8?=
 =?us-ascii?Q?qUxTYnsKX3ghHtAGY6Ysg6FC+3N8aHN0LG4s+1U6dQtOt/D3LDR3d5nYbReL?=
 =?us-ascii?Q?bDL9BIFxlt0VOsdBvxUv2Wl/iyDE23aL5Y1nFM9cXntmH2QCV64rnkIWHYSK?=
 =?us-ascii?Q?eVgywP1AJhnBE0E0+2a7whLTx+0ePsCP6aX9GZgxaKUWYQzG6f8gpXsHZQnR?=
 =?us-ascii?Q?f7KgS3ipDxmWm11R1LNmVs+canHFix/hUoFaWv9n7YnrljVhKRqfaVMbdwes?=
 =?us-ascii?Q?I/AKAz0KZpXvGTOU79+dJnKeUhnoW6XaIyJqrkBC9tGc41zQ5idOMfAvc/Xt?=
 =?us-ascii?Q?oypM0aaBy4mAWoriEJVb5NzCrXnwywrfb0NteXm2pUo3xmKUfnlGRQm2IjpJ?=
 =?us-ascii?Q?xlwfTTtz7rUUfueKjz/jU3JQl7KHHyRe3cn7mmmyhsIqfMWmgJs5ffObps2/?=
 =?us-ascii?Q?LBH32XITu6mc6jr/ZUJOAvqALb7xSDhose0Zc337lAfaznouqXtW8+eD6W2e?=
 =?us-ascii?Q?08sZUymY9mg5mMKzlC1YLmAHZXkLLww1Nv8P6E49nP4vxsHWPRBWkDkqHvHo?=
 =?us-ascii?Q?daCzsXljTFRf3FH53QpTuMgyLmpOHmiIUhjeyQA0rKMl9N4nefWtsxWyvEvW?=
 =?us-ascii?Q?mkvyTiB/eD4IjeUVm86eOj1zYkgXsWTiHQxsynjsHx+zlNJAvim1BTlVFcof?=
 =?us-ascii?Q?jgCjg3NGHlRXya5DeL0kmUai/tVymMEn1X05VBEP2VPanc1GqkqWEOqZDwdd?=
 =?us-ascii?Q?nS+j7ZopJQFGRBomcGhNwUFTUnEzHZB9ORm5k2t+TlcGj0SZlq9Wea4r12ay?=
 =?us-ascii?Q?1RAGcMfc8YLQBU/ir3OQ6qgGYxJYlsU6o8290JlS+DFWP4mlMqx+mxFt3MPf?=
 =?us-ascii?Q?ykfY+qWYP3k6/PAxu107oFdC?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ee5e279-1812-40eb-6998-08d8def6c728
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 10:17:55.9532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d8Gv161iOPpESGYK3snFILe6ZPrMkTty8F6yPsVF8vJz/Ik3VDz0JqvqrZEi8ybKPacReQo1Je3AvYE76PicvgAcIVgHvUgxH9lRsIoscqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4913
Received-SPF: pass client-ip=40.107.2.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

Here are some improvements to simplebench lib, to support my
"qcow2: compressed write cache" series.

v1 was inside "[PATCH 0/7] qcow2: compressed write cache"
  <20210129165030.640169-1-vsementsov@virtuozzo.com>
  https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg07795.html
  https://patchew.org/QEMU/20210129165030.640169-1-vsementsov@virtuozzo.com/

v2: split out to be a separate series, which I can finally pull by
    myself.
01: fix s/50/slow_limit
05-08: new

Vladimir Sementsov-Ogievskiy (8):
  simplebench: bench_one(): add slow_limit argument
  simplebench: bench_one(): support count=1
  simplebench/bench-backup: add --compressed option
  simplebench/bench-backup: add target-cache argument
  simplebench/bench_block_job: handle error in BLOCK_JOB_COMPLETED
  simplebench/bench-backup: support qcow2 source files
  simplebench/bench-backup: add --count and --no-initial-run
  simplebench/bench_block_job: drop caches before test run

 scripts/simplebench/bench-backup.py    | 89 +++++++++++++++++++++-----
 scripts/simplebench/bench_block_job.py | 44 ++++++++++++-
 scripts/simplebench/simplebench.py     | 34 ++++++++--
 3 files changed, 142 insertions(+), 25 deletions(-)

-- 
2.29.2


