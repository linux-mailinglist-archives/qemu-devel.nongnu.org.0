Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F36341991
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 11:11:01 +0100 (CET)
Received: from localhost ([::1]:37388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNC5s-0006VU-6I
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 06:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lNC3W-00056W-GU; Fri, 19 Mar 2021 06:08:34 -0400
Received: from mail-db8eur05on2125.outbound.protection.outlook.com
 ([40.107.20.125]:53216 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lNC3T-0005Ve-SU; Fri, 19 Mar 2021 06:08:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCgAwKuVZqRfWyJ05RDDjBlUkQndqQARggoSsiL+/yx8UqRlzdiy25xfb9oWDUb86h1tAwwtHJ7Y9lapQM5rW60Ba52A2LRcforAJfC9C5g47tiuRiCayI06HMM0Rauq56S+U9HVVxWBDrj1pJsEdwGyRJHZqauN1c+6xgMV5pFI3tMQVhgKvbJZ4a29Sy++H4nwql2SkXGr0uDxQxARFQR2nOivu30mRsGMZW/FdtPtFwAAEf8k76TnYnQAuBIwEzVOXNyLsU3LEQLajLhM0HrwV3IItD+2CjUO0X/2eWIB1OTPYSwYh1jn466UgaG07FyOqHwoyyZa5ALGLYHCYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i6eLYF3zk7Io/Olr0TofsP2HFwNFdzGf18Bd43VPdwQ=;
 b=UsWK6/Drh9TzI7PgEzhmMkJFY8s9k6FDjkytMtIdIsbRnHMZeQunWlUe+RByJKpRyEwThhJTCr1x1/gtC6SRzTvew55Diihh7KjNl9xClq+cDbDoXK9eowpJ6MsJy1UoAeX8MrOPCPTcxzTYtJpXZCWvS0O6aBnBJbdEwvOJlfSjL0XJ2ZN/9v8bYY7plLfIVUS8OHA+PW5/vP2nuzdpdO9f/8yJiLI08x8C2v5UudLPcxdLGrtMqKay57tcJIpXnNSifDycligRPICFOKeuf81kunSxEUoqt8keZSRgqm7jFq0Xraa8rl1M920tNgdVHliqOeuc6feKrA1lFv0otg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i6eLYF3zk7Io/Olr0TofsP2HFwNFdzGf18Bd43VPdwQ=;
 b=Rk8n53/aV0QEoqHnlw395VbFLahHQ+09s1aTQ+p5sgi+uADk21cmblrUQ5QmjQ+vBeqcMByR+6SlVCxZcAJX70lJVRJL7Wd1H8ZnB5Gjq7E2s4/kEOUXcY6+KkL9v/QyJsoBY25qf789LraiBwwi/UoTWx1ckdwJova6pvQ1huE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3720.eurprd08.prod.outlook.com (2603:10a6:20b:8f::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 10:08:26 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 10:08:26 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v4 0/3] qcow2: fix parallel rewrite and discard (rw-lock)
Date: Fri, 19 Mar 2021 13:08:08 +0300
Message-Id: <20210319100811.342464-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR01CA0082.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 AM0PR01CA0082.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Fri, 19 Mar 2021 10:08:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b286e9ee-fa24-4804-5b06-08d8eabeeffc
X-MS-TrafficTypeDiagnostic: AM6PR08MB3720:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3720CDFF311540821D00C41BC1689@AM6PR08MB3720.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4HXnA6BO2J9riDgFjxzqzk4cYCvrouxsidUpIMo24d+SCmUYXa+pBuCU02pnCTd5w+1kWU2xFWzzR+UIB9na9YaBkQpYwVOitRUE99uOICdoFqimnuNnxWABSbtMY2emW1ErMt8agmVG1ZXV7DGJ8564vdV9ZZ0FhHY9EcI8Z/n72tBkobepKcmCWa5V+a64AWucR0RwGxp+gPCAlChQS+kZS+fuaDtOhdzRv6gdU4su8qLfrxFpqz6v0UyaJ9vjlhq0ckAHVgw3kGNK5YKRmFwszqnk9JEvfkI4wzW2kk5hftNj6FxVCoUQMeixqLWrjEHukB8LRJJ7tiYLf9i0I/q6AtVhT/a69UdOfqs1AXS/LByaK8A65HOp9joqgnA4pA889sLL1CWmPoKlrhywIKKMffWJEOTN2mPeyrSZAG64NPHgjq6Mvl+zML83UxwI3aDBmWRYZkslnO1YN2KWU4U4gUas9i4hkrM8hgKabLjS5yqEKeyl/IH1Du8k79WilmSgwh1KTrLJ5/FjvSiW2SBdfb3kw2aeg3wFY1G/g/d7XXJVWAVb8dY0mz5D5pt4CH5OTfC03BEYIPSvJHUBJs68KyCheaNWr07/GzJh9kgSMGvLQjRd4Hou6qFvp0s8bJhK8+SE9H+ZhaA+raSmtTnpUXWDGzQE7BYDsL+ujwX1CacsgLRhv0JMBluuUZb1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(39840400004)(346002)(136003)(186003)(956004)(69590400012)(2616005)(83380400001)(16526019)(107886003)(66556008)(6506007)(38100700001)(66946007)(316002)(2906002)(86362001)(6512007)(5660300002)(8936002)(1076003)(6916009)(8676002)(36756003)(6666004)(478600001)(26005)(4326008)(66476007)(6486002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?q8xEvMuU8B15+lTG2lxXzA7gupMAkxqqZ7ofUhu9cPRZZPjgMYsLwZlKkAsm?=
 =?us-ascii?Q?lc6UHj1bhYKFgAPTUEp/Kb3zkLklamtc7BKNQ7khVdvjpm1+qfIQN3JM5h7T?=
 =?us-ascii?Q?wlOQjCKQ07NAWoZzMdNch67ouQaZ3a9iC4wJD7DJ8DHfbaRJMx3AmqQmtzzp?=
 =?us-ascii?Q?M3LLYxuo9Y6qFaNdz9wIVh731eQLT0JFLWRdjaBiMjgu1EDTHeJ9yDYeZ/00?=
 =?us-ascii?Q?8FaPyspgkPPoWKUTSSH4S52azeDdV4ykPMPl0pOGbKVULJacSBOLxCQA7Zon?=
 =?us-ascii?Q?dg3zSO3PY+mTlckTW/6LY9hM7MUIWc6tA6tZ51CgbYd7q9kXQRR94v/HGAx5?=
 =?us-ascii?Q?B3LuiU4KVB3VjyTmSrsKE1UcZPX5uzwt4+hdCNUq2z8rJy9JGr2m8InZlSuu?=
 =?us-ascii?Q?OJSlBcAZ+BhSwYmwL+wrooaOGmYBlHvaeWscddxN1Cx7y4TnNVcuVhDG8mvh?=
 =?us-ascii?Q?aQ6dgegO4WTH3x3WAEmwfS91z++IF8/JHwxCnN9l6vB5F3CeO+7UdC7sDbHH?=
 =?us-ascii?Q?+B018s0a6SVIYTho/lXpLEYc1brVu8U6Pim1H+v3fihOVt7RRlwAAU6v+btB?=
 =?us-ascii?Q?dTK2zS6EgiBLb7IZaLceL94B36QxJZAzJPlPoV1FXMZ4cca63HgXPyCR6KdJ?=
 =?us-ascii?Q?6yH2WKkWtaDgL0q9i87JgHcho5/UgokrHB0OKzWZ3fXzjbbZVyaS3d+XBtvV?=
 =?us-ascii?Q?H5k3Buq0JyMaFxCjnP+w2uvMCaResGNDRRWZoD/JH50kdZrit6rfr+pIW8L5?=
 =?us-ascii?Q?Lo0fcbOpVwaeByzmP+EymzkxHla720N74s5NQueRtH2Q6sMxkDQZ4yPJaEw2?=
 =?us-ascii?Q?9dvV1CM00ksytoAJ3hSSiXxVI8gabJhbhWyzFfSP1RxhCnDPUrrwQSSoyCWx?=
 =?us-ascii?Q?iWOxEpKGb3rNSBf9ozB5l4lylge9vsrDVmn0cwGPvOgh9eNRf/6Es8Qdy0Mm?=
 =?us-ascii?Q?mA4jPuUMC+mdpsM8DnCcrKm6kXr/A7XsE+14V2mZACfIGwsQtjkK0bUy8yGl?=
 =?us-ascii?Q?cavaCXIWuvwdDZRv43Ab9nyRfNkIccIuDFkQpVeM1a8W7pVBocGZ6/xvOrCI?=
 =?us-ascii?Q?qQn0UZjBR7/ZR+Lf1tKEPy0sYNJeFpquFqn/aDyq6WkJauAcwjIrf9U4adS5?=
 =?us-ascii?Q?Zr0p81tR4AZu5YylxOca6oRC3/hjJwSVI0R30Sd8bOhNT8WvZ0eGDt7grNiu?=
 =?us-ascii?Q?Q8Rwo1p8en5vRsQia7THkYlMZqmDd1LYM03LIUs/GYm97t81tIrwc/ZthaRl?=
 =?us-ascii?Q?pDgXHZnIZ2Ry8kTdgGLjut0CmBRhjGSQBuYfxR2kt/9eDugxIL6nlsJw+LVf?=
 =?us-ascii?Q?dPTQxkj7w2S4xuTKiOgjY5sA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b286e9ee-fa24-4804-5b06-08d8eabeeffc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 10:08:26.7229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TbPE3SEdXYLhTgOO/JJytQKZNiTSUjlHe8cneg2f5o8mKhHPJ+AO5nnU0SZzr5ftdDGuHgkHyj4ILxvnWrEMtJQDHMT8bnKc0M4sYcXWL98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3720
Received-SPF: pass client-ip=40.107.20.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

Look at 03 for the problem and fix. 01 is preparation and 02 is the
test.

Actually previous version of this thing is 
   [PATCH v2(RFC) 0/3] qcow2: fix parallel rewrite and discard

Still
   [PATCH v3 0/6] qcow2: compressed write cache
includes another fix (more complicated) for the bug, so this is called
v4.

So, what's new:

It's still a CoRwlock based solution as suggested by Kevin.

Now I think that "writer" of the lock should be code in
update_refcount() which wants to set refcount to zero. If we consider
only guest discard request as "writer" we may miss other sources of
discarding host clusters (like rewriting compressed cluster to normal,
maybe some snapshot operations, who knows what's more).

And this means that we want to take rw-lock under qcow2 s->lock. And
this brings ordering restriction for the two locks: if we want both
locks taken, we should always take s->lock first, and never take s->lock
when rw-lock is already taken (otherwise we get classic deadlock).

This leads us to taking rd-lock for in-flight writes under s->lock in
same critical section where cluster is allocated (or just got from
metadata) and releasing after data writing completion.

This in turn leads to a bit tricky logic around transferring rd-lock to
task coroutine on normal write path (see 03).. But this is still simpler
than inflight-write-counters solution in v3..

Vladimir Sementsov-Ogievskiy (3):
  qemu-io: add aio_discard
  iotests: add qcow2-discard-during-rewrite
  block/qcow2: introduce discard_rw_lock: fix discarding host clusters

 block/qcow2.h                                 |  20 +++
 block/qcow2-refcount.c                        |  22 ++++
 block/qcow2.c                                 |  73 +++++++++--
 qemu-io-cmds.c                                | 117 ++++++++++++++++++
 .../tests/qcow2-discard-during-rewrite        |  99 +++++++++++++++
 .../tests/qcow2-discard-during-rewrite.out    |  17 +++
 6 files changed, 341 insertions(+), 7 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/qcow2-discard-during-rewrite
 create mode 100644 tests/qemu-iotests/tests/qcow2-discard-during-rewrite.out

-- 
2.29.2


