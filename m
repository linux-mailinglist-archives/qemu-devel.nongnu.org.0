Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AB8400C1C
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 18:29:32 +0200 (CEST)
Received: from localhost ([::1]:42466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMYXr-0001BE-R5
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 12:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mMYTV-0002K6-Vs; Sat, 04 Sep 2021 12:25:02 -0400
Received: from mail-vi1eur05on2095.outbound.protection.outlook.com
 ([40.107.21.95]:18546 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mMYTS-0007GP-78; Sat, 04 Sep 2021 12:25:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PuVd5iVoebXAi6A6HSpz0eLQf3cEGoX7x8ZbV7UBixqZmFpJiKoxpLWMSMy9TfCuPQ1cDTDxZ0/xJFeGKh6yYAybNZTwVWtJ+ic5mXU4+wvalT1i+kdul/1T8F523BFMoumots7LrcHGYVqmE4z68C30tQXE7RaKgYXxbIhUzEDvgMFTNujdLkCeeqivy/V8ORT37c9LsQaCdd56pk2v3/O67RyoxDPULNxwpcvoGL/xUEAWIXaEpuLljmY6Ym7tlC5ztJ3IMuYAn+eyY2CVhsJHO+DNOJr4LSJ9GzVsjjd6W+QkFaG2cEfFlE4VAx9kQiIoZGsYfSb9koDaf0upWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=OB3VisS6yjo3kojPrd91CtVsGeBSwycTSrh8jN/qw+Y=;
 b=e1gZ5vOXeR2bHTJtPLj7c5kt27DUYpabwVBKGClm/tone2QT7hohizjxP6GG0GK0jOvrS888FCaEOv1vPO54Pbz/qpdJggerSfP8pxnXNpQsczcK6RQ4jTg+hETFqiPgPk3XwSaovw4eWcKkTV6MpRX4Rf05nuevudGn5jCOnTwB7k1WYp6Qupggvwj3kEcFXvy6dMDAwxvQKJI4uSr2o1wZO8Ahv9/h11Gp//eb7qL4AXfRbs6pJKMIrD/hbzUJT2oOm4CbPzaFKxbTRyiy+1LwM7PC3bVtIGMnlmz0XqMUdnPCixQpUkJzg+vlwLsnPbBsZ93729ursFyuB/tZeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OB3VisS6yjo3kojPrd91CtVsGeBSwycTSrh8jN/qw+Y=;
 b=VZ1SPZ6vkM4AUujkIgvFBgnCACKFgCUu2BDf/VJ4kZQd0JuBjpaydIBnqBrJhAH+VqiOZAAhLnD7XqMMvJs88eD4lrsyKq0VQaFcJNugaydtklvgm8zRL0jcFPd9EC98JaHbAVA9X6uSapSymerAgyEkOzafs8pw/s9WCfSsdMw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6904.eurprd08.prod.outlook.com (2603:10a6:20b:394::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Sat, 4 Sep
 2021 16:24:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.024; Sat, 4 Sep 2021
 16:24:52 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, hreitz@redhat.com,
 kwolf@redhat.com
Subject: [PATCH v7 00/11] qcow2: fix parallel rewrite and discard (reqlist)
Date: Sat,  4 Sep 2021 19:24:17 +0300
Message-Id: <20210904162428.222008-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0275.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR05CA0275.eurprd05.prod.outlook.com (2603:10a6:3:fc::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Sat, 4 Sep 2021 16:24:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e79c25ec-6879-4c90-2eb3-08d96fc08605
X-MS-TrafficTypeDiagnostic: AS8PR08MB6904:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6904205D669B415FACCCDAA9C1D09@AS8PR08MB6904.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W06y1G4AL8VC/zsQsUDs4mrwmRMpKlsIh6hVrV5vVwYiitbAWuSLtdV4NjKAgsYbxc0VqEYih+2+zvjDu4TZx2ovRiC0J6eEm4k2/hiJZNWcAFuwBIqfc7TFF492FFl6x9F5K8oL21T1RF7iJPbMJfHLr2d2wwITTSbkk12IbmjEbGZJMtgmo4wTNY1QWUKiZs5e8AWsWquv2Ligc2tlOzHITcVVHiuSPvnaBJ+pvtXSgm2UN1FGg7bsj5m0eWwFzwrV4kK7Ay72rwKEepQJRLWqKaZa+x3aFlblAK6tyy+1X0Bk8p6xrawWjhYByG3UTTWvW77Re8OQ9DkoA/HSXJ4T7BtxqKpOWFx1iygtzTbit3a+eOSSkECRc7UDcuxSKOZzt1k97zDm9bue2hH/S8HDP43jbl04JiApb1BnU89Wgi6OIRSe2FrQO0TrnH+hJq471YR4ey8ZBkkeL7VttaXkrkZfNmlyu1sKMfcu7dOAmR0hctYMPK/Nk1+k8TFh0sTs9UwlsaAh2ff5zTSBBVxDzMUxb2DtVxbhD334OQgue/6AT2bKG8v/vR+pbLtnD3e86ZxpqWBhitPY8ByCVmg5hziLX4udgW/q/BFtKyeHY3NS1rlNY4VNAGWJDW1rZhWRfwSRyRvjxZhZCRTHSz2yd2KZTgbBt9fpsDeGfih7GSve1XHndT/ZiNe01pdBIhRu+mbE6Veq6XKKR3F2aw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39840400004)(396003)(366004)(6486002)(66946007)(8936002)(52116002)(6666004)(83380400001)(478600001)(4326008)(38350700002)(186003)(38100700002)(5660300002)(2906002)(1076003)(8676002)(6506007)(86362001)(6916009)(6512007)(66556008)(36756003)(26005)(2616005)(956004)(316002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zlAvru6SdPx07cX5o80hLy9rlsorHk6kAxD/F1bDcryC/RUVqAo243ZWV2Ps?=
 =?us-ascii?Q?Vn1Afuycr5F16OxVW9Bn7ZObK8Jny9lZH0udd2bELRRmBAyEu1z/YgZYk+CV?=
 =?us-ascii?Q?/KVsO5YaMxUF0WwSk036059P7gXSJFA+tOWNXhy5s4JEuAzuFdD07FcK1//n?=
 =?us-ascii?Q?PnmoDKLXompSMULFjExdkHqNuBvtJz7V+JVrT0AlHXUAAbRomRy0Rza27Qju?=
 =?us-ascii?Q?L0p2w047lrko7JhhogPtPafpZW0M25Et1lxGq5Zei4VCeudpuxirxBkpDHKz?=
 =?us-ascii?Q?drGsyXqAVNT2LqhAuNGELyqR7hgAABzQyBBM8rPHcOX3+LMnXDIXPLxCK03s?=
 =?us-ascii?Q?XZ9+Kb35HbJzYSC2+UF5uvVQJaX50ZuFh5yqwYubVs4rBDO/sp2gZEICaph8?=
 =?us-ascii?Q?fnr6cmV35uM9GqK4LB+YlhEAwNwOR4kluOHBCRqCx4GLyX68Vo6NFwdJpq2P?=
 =?us-ascii?Q?V3XzLYE5CYzFJsfW3zA8WFlbO7knUsUkkdhLjZRmn+XmmdbkQCMm3F6F0ipA?=
 =?us-ascii?Q?vC5hXiB1kN6PkCntyM08jtlFCqAiJg7MZitMGdQyRdnW4fK/g0MxBoiENfS8?=
 =?us-ascii?Q?Go/htasUtoxEefdyy6OJUtu3PxTtWNC/FiyY8S2/pr4tchcCByTRYChx8I+d?=
 =?us-ascii?Q?shrFK899/5vF+dLB95rHSssI0gcTb+xZs0ajUM6JA4mkpT3pXhu/tjZ8nz1q?=
 =?us-ascii?Q?bB9/F4LIX2mKzmuEplvBVjFndEkPRxcGc7Cd7DmUC9gwNbHL5hJe3Ny6yr41?=
 =?us-ascii?Q?8jsxLXCen+PmHpemP94eHhQPpWX6IxWLEvfdYYI6HDE2ewxB1221KqAQekGM?=
 =?us-ascii?Q?YvcSMz5IjrrjbATqQRZUnIoar3M8PtNNOBKnYwTy0AA++bQ9xvYNQlkOSZlB?=
 =?us-ascii?Q?wKQPa0OBY7pbnFLJriRsvCmhiRnd2hoh6wuCrLIu8XYCgfAayybIJh4hwRpm?=
 =?us-ascii?Q?ZfsegkxmLbAXt+ORNSG8yaE607Dqq6WzD4mUIHTSKA60oowX4UL9QSRXdgGn?=
 =?us-ascii?Q?vir7ZK2IdTTvWsskCAbMJHzaWOC2RlM/6lUe97l5KlzjrYFBGf0hw+Tvka3m?=
 =?us-ascii?Q?7x+G3SrCEtxiBtJI8flCJrSMjf02Ahz1RT8CcmtJV38AwBPIdaqd5y8BO904?=
 =?us-ascii?Q?Ugspic9YCYTWHeOlgWLRZrKywKWDRwPBIZXWUcGcZtW1mBcyBmMILsp62Jzf?=
 =?us-ascii?Q?ZfXKdi3wRC5J5TWJHwIGIdrGVW4vackjMwL4qVx9tXogyU2yOgY2Z2/sB70n?=
 =?us-ascii?Q?5NsUfzdfML+xBbhQxmqqozhb4bjyjwYhSM480wVSaiWKohcSjn7uVY93+6+L?=
 =?us-ascii?Q?hCmNaa4uBGsXYeIeC0RCWh3r?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e79c25ec-6879-4c90-2eb3-08d96fc08605
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2021 16:24:52.8231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: agNoNnk4agaxDuZMTzvIJeoISdBxWdx9mtmKMKPeNTy3wPUwaOWKZBbJgYJkSByxOy4xkz2nKZUKeKSKc5uwO03RPDAZ6zHAsEJ58rtOm14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6904
Received-SPF: pass client-ip=40.107.21.95;
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

This is a new (third :)) variant of solving the problem in qcow2 that we
lack synchronisation in reallocating host clusters with refcount=0 and
guest reads/writes that may still be in progress on these clusters.

Previous version was
"[PATCH v6 00/12] qcow2: fix parallel rewrite and discard (lockless)"
Supersedes: <20210422163046.442932-1-vsementsov@virtuozzo.com>

Key features of new solution:

1. Simpler data structure: requests list instead of "dynamic refcount"
   concept. What is good is that request list data structure is
   implemented and used in other my series. So we can improve and reuse
   it.

2. Don't care about discrads: my previous attempts were complicated by
   trying to postpone discards when we have in-flight operations on
   cluster which refcounts becomes 0. Don't bother with it anymore.
   Nothing bad in discard: it similar as when guest does simultaneous
   writes into same cluster: we don't care to serialize these writes.
   So keep discards as is.

So now the whole fix may be described in one sentence: don't consider a
host cluster "free" (for allocation) if there are still some in-flight
guest operations on it.

What patches are:

1-2: simple additions to reqlist (see also *)

3: test. It's unchanged since previous solution

4-5: simpler refactorings

6-7: implement guest requests tracking in qcow2

8: refactoring for [9]
9: BUG FIX: use request tracking to avoid reallocating clusters under
   guest operation

10-11: improvement if request tracking to avoid extra small critical
sections that were added in [7]

[*]:
For this series to work we also need
 "[PATCH v2 06/19] block: intoduce reqlist":
Based-on: <20210827181808.311670-7-vsementsov@virtuozzo.com>

Still, note that we use only simple core of reqlist and don't use its
coroutine-related features. That probably means that I should split a
kind of BlockReqListBase data structure out of BlockReqList, and then
will have separate

CoBlockReqList for "[PATCH v2 00/19] Make image fleecing more usable"
series and Qcow2ReqList for this series..

But that a side question.

Vladimir Sementsov-Ogievskiy (11):
  block/reqlist: drop extra assertion
  block/reqlist: add reqlist_new_req() and reqlist_free_req()
  iotests: add qcow2-discard-during-rewrite
  qcow2: introduce qcow2_parse_compressed_cluster_descriptor()
  qcow2: refactor qcow2_co_preadv_task() to have one return
  qcow2: prepare for tracking guest io requests in data_file
  qcow2: track guest io requests in data_file
  qcow2: introduce is_cluster_free() helper
  qcow2: don't reallocate host clusters under guest operation
  block/reqlist: implement reqlist_mark_req_invalid()
  qcow2: use reqlist_mark_req_invalid()

 block/qcow2.h                                 |  15 ++-
 include/block/reqlist.h                       |  33 ++++++
 block/qcow2-cluster.c                         |  45 ++++++-
 block/qcow2-refcount.c                        |  34 +++++-
 block/qcow2.c                                 | 112 +++++++++++++-----
 block/reqlist.c                               |  25 +++-
 .../tests/qcow2-discard-during-rewrite        |  72 +++++++++++
 .../tests/qcow2-discard-during-rewrite.out    |  21 ++++
 8 files changed, 310 insertions(+), 47 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/qcow2-discard-during-rewrite
 create mode 100644 tests/qemu-iotests/tests/qcow2-discard-during-rewrite.out

-- 
2.29.2


