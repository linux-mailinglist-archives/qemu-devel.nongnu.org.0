Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AF547C7B0
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 20:44:20 +0100 (CET)
Received: from localhost ([::1]:44390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzl3b-00080G-7h
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 14:44:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mzkzk-00043a-L0
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 14:40:26 -0500
Received: from mail-db8eur05on2093.outbound.protection.outlook.com
 ([40.107.20.93]:33889 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mzkzh-0004Yk-Iu
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 14:40:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MKFODI77V4F+wB51kfp+6lzSIEZtP8SuQ53XBHWoUZ1fAhdVNI6MfJS6uwBo4RvefvgSBPz+rnCXrWKl3GD3IKT8dXtOtTsB8ahDD7yBbHAR2xKipfxV12Aws4lErLh8dMsrJy19wdd+jmf9F2DpNEGtPTHamgPSppdz1rqV4ct7PYFGA+1sJAbY6FDPkHY/gS/sbfee78m0nFwXWWZH7xq2vc0JD1KCNyyRygi3s/SV14+0Or4GpHPIb6dayoKkEmK3ZEHBsjn3TpGZDJyaxl0eK3d0eDL2W4KbdfQK8TrB9GdJzFJQLCq0kqGdKnJio1z0IvyK8Ukdq97qNeA7lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ouw/D0+Kt9uFotZW3dNcaqs0/6hXduURO9TiTVBUFZs=;
 b=QcPe9TdB4w0N6nBUW3RGHwSIulTuBjJ78DvbJ7MwMuN5doHl9yVt+7NL8wVjeB82duhh4gOcxRCwIeAY4nkIWrG/ekR7wDFJxJrUD88vbbMLcBTO4Way8KBjcw9HZvinpdl/hV8+UGCxpUQR+LJYDSq/+uP8pR60W3gRvrSnwjoSs26rDUGJF5cAc99a37smhgqN1jZuDo9WNRLZu9X/wEc4ZTMouIu99Rl21lCATchcLjUFhaxMND/VBCH81JsBSQZeKWl7p0EkbcjdMrOHEpSX2djx3S1tYqAn2/3OKhqLikh49V4otmMfuhXlR6ryK5LnzR2/k6/vMT2MthQlPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ouw/D0+Kt9uFotZW3dNcaqs0/6hXduURO9TiTVBUFZs=;
 b=M/vvL9QNbasCYgkG6u/PKIrB52ZH3LQ1jj6BIrzKWqv2Qi+AEZON/foWumbKLWhUH+6JEEPe75nFbnyBgEZ2Rv5S21+C/zryGWBPxbDrRH68yVIysOnPSw7VfV91jr0op1lSyrq9m4gMLCzy8Ue+yVr61PJsFI0jVY64NcTuYtQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM8PR08MB6401.eurprd08.prod.outlook.com (2603:10a6:20b:361::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Tue, 21 Dec
 2021 19:35:12 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.016; Tue, 21 Dec 2021
 19:35:12 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, michael.roth@amd.com, armbru@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com
Subject: [PATCH RFC 0/3] trace qmp commands
Date: Tue, 21 Dec 2021 20:34:59 +0100
Message-Id: <20211221193502.114296-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0402CA0014.eurprd04.prod.outlook.com
 (2603:10a6:203:90::24) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbffc20d-eca5-41f6-8657-08d9c4b90164
X-MS-TrafficTypeDiagnostic: AM8PR08MB6401:EE_
X-Microsoft-Antispam-PRVS: <AM8PR08MB6401A86D2E234A40E82E35D5C17C9@AM8PR08MB6401.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8A2BCdlrD/Tf5Mxrp1tT85AFe6lhU1e4LyL9QWi7SJWgJRdyYPaBYqhwZsgLDbdMTkF2G+QpCUZv+JlL+mUrkspbO7S8UppeXQHbCwS9omgz4USWGPvQPsMIuZGpqa0H245RewGOoNdSJlyJstrDhPUVmH0Xe8EJ1zY4njlfoc+nE77e7jdxDamg/XUAdYilkxE5P3lM/ZsJMihhE2WQP/yDlFFGvmhY0LceIX9JKyEBxuW49EEHMKQqo7dpFyMymkOI1JEJ0XFYd3vc9PXCTC02ddutqhqm8ZqVvuVPiRU3f1rlCk80sPSsUbIeXyRlf+3tE4awM92Sph5o7MgPumUxGbucQIiI1S+MUwq5wg6pT/lSk7sTTq20fy/+Epyjhrxm3DGiJ+9V2RfeuTbPJzSLXneM87oF69VKvxirXpJcsAqrzFm3jMRlrXYJ3X2kqkznABMSmde3VEa46Kg0GNTjkmhTIOBugEf/DTp64SAxu3jAYF7e/9zXw9sn6Ff83868TdTl/yFQI1QxhVmDXhSDttUGTBfTcoAB4RcJDzqP64439Ct0PRA+wcdAQzgb1tv9W2DxVW80FUOG0SgNbpIo0hOUBTA9TVjBeFCisWO7F238RewsjXF6YpysQuLT/HQKwoElmBfZdpCbo4F6US98W1cT3DegFvNLbUk/0vs/4IwhPVsxgyDAdviVUiffTGSs0V7NXYsZBPKN1OLGvQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38350700002)(8936002)(38100700002)(66556008)(2616005)(8676002)(6916009)(508600001)(2906002)(186003)(52116002)(6506007)(86362001)(83380400001)(26005)(1076003)(4326008)(66946007)(6512007)(107886003)(36756003)(316002)(5660300002)(6486002)(6666004)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9dVexw6oIKdpt/2mMPxW6E5hye3aQtNyfPBl7dq7Ts03PQLSjghBZGD7JO8g?=
 =?us-ascii?Q?BqLhJ1lL3FSizzb8yEm84pl3KpuTfrKgc33oeVGj6KFpON+cw4B6RF0z0AdV?=
 =?us-ascii?Q?PV14+50zbYj++OQqHPrqFjXJ/tuty1DFp9Ow934UtPDya8oIWDpzW77p7H/U?=
 =?us-ascii?Q?2DNNEHjvyWwQ44+BwU/QDgxkLinBQHiuqd9rHh4uvtmLDyC0q8g57h/dnv1j?=
 =?us-ascii?Q?p0ouIBSTvFaMxcn+Ao6ABduuwH4ha78PcEpAFglrHjTXAeLEuaj0UHWcoRas?=
 =?us-ascii?Q?cfmSFyAJVkkXyMSmPCXB+yeVmRqENHqynbU9p/4Qx1qe3+IkjrjwpphvZyfn?=
 =?us-ascii?Q?rqy5/u/xfXqrSzXaJzymNcjyLrZedMQ62kUDJmD1G+JmgCeTB1NMDbOtGUp5?=
 =?us-ascii?Q?pJXjUT2xKX7WtiUy3VcynvpmF9G9wuZojR7HosqiONvzkgIrfPdRaDaonwOL?=
 =?us-ascii?Q?GZfj9M2FoGF1+E3EOeWQhPU7yBomgxOG5rhy+y+hcGriyzVcZk0fpwu9Byyy?=
 =?us-ascii?Q?QCCTyVGMJKElEYZYiIshoOubOK1Sn1AEFfy72/gFSVdDduk4g9bBfpm0f+cb?=
 =?us-ascii?Q?xnY2RP1tEm5Qf+tcd2CSUvdR6X3T3lL/kosUqw6zXp+6O42mpE5WuIXlj//j?=
 =?us-ascii?Q?riaC9/EAG0WD7TVspNZh7Sbcgl9P0U7BkHiVwocdTMGKT8ugFUQV0BZjM7IO?=
 =?us-ascii?Q?XC7QD509nAnQoueh/YweBH7iSYCWiZbtMD8QANVqXXDGt7j/nv+86Iam1bNp?=
 =?us-ascii?Q?J62cYh9XSE8fqoXZ3xZ0xwmWSoc68Yp+1q4KCka63l7XbSg/bWQilSuax51D?=
 =?us-ascii?Q?tLVl0SOdj+dnx2WBp6Uf+B6dHkVYL/EkTrF7aAoQRLWmdyHx4VPLq8EUEIny?=
 =?us-ascii?Q?oVjGOMN3sgvOpv6U6+Gz7FRIh9mAyd6H49MrhV1n+rWMjiA+n+hrIoh+YmdX?=
 =?us-ascii?Q?TtBehL23m+MSWbgH/ePue9aosT06qjstYFviLyUHROqre2WDaEs+tQo/tkfV?=
 =?us-ascii?Q?vLiqXGtKEioB5uugUJFiZxloaDi1tvu3AbN2xVaScqVvF/zZWYPus/YrRDfg?=
 =?us-ascii?Q?f/pDlUywvvmLKcxgOO1JPG7UdowQaZFMx1LtealrJue1L9LQxf7L5ZxiUBhC?=
 =?us-ascii?Q?FVuOypTKWl9tvM+u133hBpqO4A7P+YyVG7PDM760XP7DgaeQ/BDX8bzgvyC+?=
 =?us-ascii?Q?Agdp/x8+AnYAFcsWOfaMOHOU0FiSd31EBgtSAdpPIJ4bX1yMXhwa9yKh4MeI?=
 =?us-ascii?Q?FY3WN02BQUwgdQR/Eh4wZNhsJOWG4ajEVs6kQwKXjFdexhI6idZyR0Z/7XyZ?=
 =?us-ascii?Q?M7t9Kdo+LSaR7yrEebAhtQqtL4y9vvWc9uHCqMEoJRgxfe2aJeyCddKUvQKH?=
 =?us-ascii?Q?6DzpGv+4iHmEJFdiWzAcziMqqnKL5JgeLRdeXotROX5p4LWcxS7DL2+AKRWD?=
 =?us-ascii?Q?pBctz96GxDDxce7qJZtIc7NZqQxp3LaN+wk9CcI08QJiFuV/w6FiBamWqRZy?=
 =?us-ascii?Q?xuyZ5uPflThLw4QMKF+FVh5+7NJ3TKcW23wVfKeDrMM8RAg2QMH5lwtnjrnf?=
 =?us-ascii?Q?djUi5rziD24He/wt+rLIXdQPox5dTEVWPLVeerzFQjicYxTd6ZHm0XMLa7Vf?=
 =?us-ascii?Q?+plsUYcMtdR20fmzJt2wcdvtUIFHNb2hsI9+h+pARCkgP5vVf86iicSPcuhk?=
 =?us-ascii?Q?qEkR/A=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbffc20d-eca5-41f6-8657-08d9c4b90164
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 19:35:12.7087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ep3qMqhpJI6NzIHbmeX+frNiq7U1TBac0A9A0N+U5dcwjhn7FU1HNtwfk/xNwgbQ4cGySlw3H6K20rJ39vSORvCk22efPGQupD6QM6GgUFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6401
Received-SPF: pass client-ip=40.107.20.93;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

Hi all!

This series aims to add trace points for each qmp command with help of
qapi code generator.

That's a replacement for my
"[PATCH 0/5] trace: inroduce qmp: trace namespace"
Supersedes: <20210923195451.714796-1-vsementsov@virtuozzo.com>


There are some problems, so that's an RFC.

1. Main problem is that I failed to teach meson how to build trace
points for generated trace-events files. I can build it, but.. See
commit 03 for the description.

2. I added --add-trace-points option to qapi-gen, to generate trace
points optionally. Probably that would be better to do it without an
option, but I failed to fix build for qmp commands in qga and in tests

Vladimir Sementsov-Ogievskiy (3):
  scripts/qapi/commands: gen_commands(): add add_trace_points argument
  scripts/qapi-gen.py: add --add-trace-points option
  meson: generate trace points for qmp commands

 meson.build              |  1 +
 qapi/meson.build         |  4 +-
 scripts/qapi/commands.py | 84 ++++++++++++++++++++++++++++++++++------
 scripts/qapi/gen.py      | 13 +++++--
 scripts/qapi/main.py     | 10 +++--
 trace/meson.build        | 10 +++--
 6 files changed, 101 insertions(+), 21 deletions(-)

-- 
2.31.1


