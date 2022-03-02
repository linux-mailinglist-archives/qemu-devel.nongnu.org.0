Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 218074CAA1F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 17:27:33 +0100 (CET)
Received: from localhost ([::1]:58118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPRp6-0006Yx-6G
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 11:27:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPRmg-0003kI-I7; Wed, 02 Mar 2022 11:25:02 -0500
Received: from [2a01:111:f400:fe06::70c] (port=37767
 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPRme-0007je-1E; Wed, 02 Mar 2022 11:25:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQaFou2Ic4wlkTjyhXUFIT6fBEmaiV5lM5bwO6CgnzM0Zhfl73JrhT/t1B4sCx1wETOhZUjUXVukuBjS41liSO/qWFDdT1FfsXv+SLLq8waju09VHJgRmyMa3uEIJnLVhhj+Lz/zQ709SmCWHqwrtee2KzwH/cB92oOftVERUXVt5q6eyN0p/v+n9m8cXGIWUk1aEtGEBU7jHN5KB9j4ZqFkx5rjv1BJJxecmHcT5dfSI2eTtlUCB85VfYoRNLgUfdqWNsiRkYB3LvNZZ3m3WhdIHesTYA1jRoX8Z+NTi3BEfV9L7kewHW83AnoDGY/yZa8YrXN/oWFDezjD9BxzNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ohk6sIDzL9FElUV++YyMYv6XVGrK+FJHt6AK4T20aXA=;
 b=h8q3vzhArUFRjYTM1lprbfAsUYCRMjQMUkVQpqKzGYzckF1JJWUP/8dF32hnCMm6lY6v/G39VeFc7AwYsgUESFFY8FH/85dB4mkiIIZB70sk/4k83ry3toTbQ7TtpmnvEqGoO9SIK1BYNbOUcNKbZnQPHviTpebvMaLOr4QQ3lUM1xr7mx2l6CGqPq5o8TvAPr81VZoURNJkN1laK7t5UHBFwVc3bJrJJfIVnT1omYDDVRuTVKoOFuXp0Lw6yo/G/phs6zOu1rWpniwzBz3JtW+0KXWgOMb63hU9HJyXLMkdY1EUrTQvRVCPBLSYMQLqX/ixpAbGA9LlsDjQpgJ6YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ohk6sIDzL9FElUV++YyMYv6XVGrK+FJHt6AK4T20aXA=;
 b=lVThgZrpQgXsTmG1X9wKFYRXvIHvPXVgY//ML/jCuEMeduJSkj7XEBmdM1JS7T6j1ia8StG+rFp32Oasf8Zbjl7yUFUMBIL+/Ya5xHGBwS12MQRafJNYzYAJxyOgRc0CYdOo0eEZxHAV4nLF85p6p4ld3eGprdee2HKIl4fqJNA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM6PR08MB3206.eurprd08.prod.outlook.com (2603:10a6:209:46::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Wed, 2 Mar
 2022 16:24:56 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d%5]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 16:24:56 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 stefanha@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH 0/4] block: copy-before-write: cbw-timeout
Date: Wed,  2 Mar 2022 17:24:38 +0100
Message-Id: <20220302162442.2052461-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0064.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::15) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 636bcb7d-2dae-4af1-631b-08d9fc69302c
X-MS-TrafficTypeDiagnostic: AM6PR08MB3206:EE_
X-Microsoft-Antispam-PRVS: <AM6PR08MB3206F874AD70858C745A290AC1039@AM6PR08MB3206.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GnLvFjj1Xp3OmKVxu+F1EkL//I4yfMXO+Rt2a4V0kNHacQ5rEuKoFqF649a0c1o1fZnSkKWrB49RwJbsZcUn35u5KsopOoKl/tJAsBq0Lu2XFTODTiWp2AUmphg/pzyAvtQ6LQ4jObgEyhe7GK81xCiR5bqKY4g5wnAadt/wz7K6SZg6Sxnq626pevZ0YxKpHS4wOxK0ellSvmtNQSTidkkISIVjTQ9VBBpqO7WXv1LXTwvgDRNIWbkYXsb+8KNRUJsT59gsHazo4qvCk54ppznQPbzRUOAci0Mkkk2+mLe9aGd29ydH0XUf/9nycTwcNIT/PjSEM0XA+o8itjjoCRve6P/PXNGRT6EYNxQt0+4ilVjpzupSoc3bg8arCiSecewDe7u6M+uAWytZ8UJXobSuK46Wr6S/myP5cyI9cQazVZh3VFyEELWMxBEld2ED9ySgcS2Hwxr96oIh7wwnBV8V6fQbZIs70pHGPjHUxws1QtbutKMec8opDE7jeDJqnKWLDXmC3lg5hYS4J/UgPZ4hY8byGz3QXB2xwEeuVjPJPsi8DBCn1SGMUnC773bT+u6+YYOf5CH0espo5tvSMUpPyv66Rmzg6DZ04xeIep6WKCNDJBUv6he3m7vHQog5J57MXmKUttABUpvs2W7fiuG351x2MdrdvHMcEbNGPcdC+uABy+ZADOpTKiU/dVWvugunXTfGX4bR9uIR5bPP1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66556008)(8936002)(66946007)(66476007)(4326008)(86362001)(83380400001)(38350700002)(316002)(6916009)(186003)(38100700002)(1076003)(2616005)(26005)(2906002)(52116002)(6506007)(6512007)(6666004)(8676002)(5660300002)(508600001)(36756003)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hqKSq46oKs4wD459wfDLcCubPLO830E7rFFko1alIqey6Ecgz2edhCPz6S+/?=
 =?us-ascii?Q?8/l1GAiTatSFOwIzQOdyRODVCZ/7N/uG2KlHO6Gi4XBLoaFSmBWFAfvXRgam?=
 =?us-ascii?Q?nk4OEy7K/rqISbQ2DRO/xP2cMXnqx6C/yJ8kZyVopNOdk+cKbyd4TqGMVaDt?=
 =?us-ascii?Q?Z0C2LbXbrcLm23hFRijqhyV2Bwnq7NdzFKknLQt6CiD5tnsBFSK8Xy3NK87O?=
 =?us-ascii?Q?mvhNu2qfr62cFNop+7+DHp/WRz7RMWZEcgypGg65quvTLL7Rhf5FgQotQ4ve?=
 =?us-ascii?Q?FKcoP8BOD7Kwo8yKTB6/Qq2tFIWCJprM6Ui1AW2msSrUxy4fBPG2ZcCwau6d?=
 =?us-ascii?Q?Hj7WY46afLb4EKxeGYnE8ovz8iSUpzb4I+tVLnYHzoJj21p6a7SW5eQ3eXEr?=
 =?us-ascii?Q?pZSrM7lwDCT/y9nn9XBOK3oHjrBdRQ1lhwm1gQ6cwLKg5pdYw9M1TtzsQf+x?=
 =?us-ascii?Q?oWF+b3rtbHq4wA6cvqQg54gaN5rZ0Q2UwABYe8GHM7qXuT5gBe3b+/fB/OS4?=
 =?us-ascii?Q?qQR7v1fU9EXJBNGdvbA4XUxV9mDheFRWayb0WHJImGsb+7KAEk3bHRaG47tW?=
 =?us-ascii?Q?7Nz/uiZtR5jb+mtYnUY4Lp3Etk8QwXtXdyDNtPCaO3WaO+rsTNd8Qrq1nagE?=
 =?us-ascii?Q?GCm8WST/4avcArDktAfM2WQPYj9fO/tgWm43aYj0jm3TE4ovYD52JjDA1dIg?=
 =?us-ascii?Q?Kyg4jl/wEqwvBaXp1qrmsZBp//MXjTroFG+HcCVMOzOUPUmBM3B0jIdmw21S?=
 =?us-ascii?Q?Al8UsgSTeBTJgaTQIIqzUkA+zdd8DIL0GbO2ZC+vHHOGo/2g8uFM+g6/EhKT?=
 =?us-ascii?Q?13xgzgmHpmj08Z2/gFz8Yu9+/nQMw8xL/kBPg2HpaXNSH8UR3KgKQBqoN/SE?=
 =?us-ascii?Q?MkgMk6V0vNFv+5NA095QPms4cHhVa2KAfDOSj3SvNfBbTH7S98+FojDMHPnT?=
 =?us-ascii?Q?iELhzjeNA7XD95QoguNyxjXZuJXqOS2mC9hyjqN93rk73GbSFqoxIgKP/56D?=
 =?us-ascii?Q?E9TOKwGSueUoeXdLJPi7Bpi/ERIl93XweBcVxaYwy9Guli0HCWVY7X/Kn2Vo?=
 =?us-ascii?Q?9MjBb4aOy03RA36YksU1N8uU9xq7003Vw5CqNJh3/fWsZ1O4+mq5lOPNeIk4?=
 =?us-ascii?Q?r223MSkeULXoFhel7x5qVSgXoWesKHXfw37uzmnlBCK9anb6q+XlkO32GUj9?=
 =?us-ascii?Q?9VP4vqnlt52m9OzKhzl2ceAeawW6cjDmSTJ/Ok4J2SUwfcR8amWYRhuTgZbO?=
 =?us-ascii?Q?w2EyVXTWKpooV81/63ftXsIqbOjZVp4tn3gjMjT8ufX0xaYb3LFOByuBKKpW?=
 =?us-ascii?Q?ywY0j191r+mVAa7CuwlZ3BZu5vTBCUxWYXRVlBPJIL5uqrE5A9x9ROcU+gzY?=
 =?us-ascii?Q?TWlt0uOTpM65eDCnHtWwjq+hvPsfGffdsm3IhsYLCXorOpOaexBCuSS2jtTt?=
 =?us-ascii?Q?zHyJCkPqdd0LSIyTEt5F6tuqfVRub7FZCDHl5qcDJ3nwmlmkiFEUItz5IOLH?=
 =?us-ascii?Q?zSS+9pP5/uvXGxSHpJXH1IB1mbLLCfEDHE/BE2f6t8s/7mBQdhM7Ju12xbeH?=
 =?us-ascii?Q?umOc5DIylLNN6AafIBTMK2cLclidgu3EDpZQSGdWfpHooWDdKbzfcJ/aur4Q?=
 =?us-ascii?Q?c0Xrqv1h2bOBqK6bhlxMf6lUcJS83Yt+8qK/gHocVHP71xUUwiGnBCvM8Bj8?=
 =?us-ascii?Q?8Yq0Qw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 636bcb7d-2dae-4af1-631b-08d9fc69302c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 16:24:56.4315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQ1mM155xQ3tu3hYGs9kdik+txlzN1B/PzPS0oHTVpKTFHKCp6Uc/1cYOi78HuSwglD5OkdEWudXe36JETbscA8y9MKrF+yflXpw3B/xBqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3206
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe06::70c
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe06::70c;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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

There is another new option, that allows to limit cbw operation by some
timeout.

So, for example, using cbw-timeout=60 and on-cbw-error=break-snapshot
you can be sure that guest write will not stuck for more than 60
seconds.

Based-on: <20220301205929.2006041-1-vsementsov@virtuozzo.com>
   ([PATCH 0/3] block: copy-before-write: on-cbw-error behavior)

Vladimir Sementsov-Ogievskiy (4):
  util: add qemu-co-timeout
  block/block-copy: block_copy(): add timeout_ns parameter
  block/copy-before-write: implement cbw-timeout option
  iotests: copy-before-write: add cases for cbw-timeout option

 qapi/block-core.json                          |  5 +-
 include/block/block-copy.h                    |  2 +-
 include/qemu/coroutine.h                      | 13 +++
 block/block-copy.c                            | 28 ++++--
 block/copy-before-write.c                     |  6 +-
 util/qemu-co-timeout.c                        | 89 +++++++++++++++++++
 tests/qemu-iotests/tests/copy-before-write    | 78 ++++++++++++++++
 .../qemu-iotests/tests/copy-before-write.out  |  4 +-
 util/meson.build                              |  1 +
 9 files changed, 213 insertions(+), 13 deletions(-)
 create mode 100644 util/qemu-co-timeout.c

-- 
2.31.1


