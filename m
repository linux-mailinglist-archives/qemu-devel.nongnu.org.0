Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AD834B0BD
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 21:46:11 +0100 (CET)
Received: from localhost ([::1]:38614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPtLO-0001VW-HZ
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 16:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPsdt-0000UZ-RY; Fri, 26 Mar 2021 16:01:14 -0400
Received: from mail-vi1eur05on2133.outbound.protection.outlook.com
 ([40.107.21.133]:54454 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPsdo-0006Yw-1m; Fri, 26 Mar 2021 16:01:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMPCrKuYJjUz3QMvCvUAQsmRQXQhO5Y0m/LRkZsKCzGpkRJG5NUH9OoyGbdWFvRo9xsxZckYzNQWmcXR7zHmkO7V4XOIPuPSj0+BokIzbeuod35M67aVJnb3NmXpL3RcywvtbO7/OyuySOAKuSz51az4/JEaRiJxgjpaWS3j3rWpkkuUmzmC8WZ173vQBFiWmhre6B/5UmaXH+WtNIWkQmi6G13kmTTPGtru7fyH96YOREEz4rcgefEZP0VFmGD7eAPoaYAV7IXFT+kyPDx6F6bur8I1mz6uxClmQyDooUrpYwCB7cz4giHFPIn1xUyz6Jr1yOK6AEpJv9zF34yBZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTWOLDCnR9hBKvyx0OtQ3cYgHYHriL/sANDfY+oO8Yc=;
 b=BygivPxo8W/JvjJGh79eFlv395wGbRVOwmjlH2FGl7XLX6sqB5o8kleafJPGp7MF6siiPaqmw5QyZNwWODhRz1mH39znM0o+GPdhICWmMEWFTJsk3TvbpcHOV3ErrqWEDutVhA3+DF2NalX2qeOhsyk2OXjVsOM6mTeSr9hhJ93hRPMx52cmzyWvMoHskjNPFeiZGPNJ5EM18izWdZ1J98V19vqt/ssG11YHT2epqunOuNFYFyFPve+mQT3W1tMPMT1sXZD0npHkEyLAXhZ9ex1Zo8s0mI3OmrY967EaRTbLB4WNDhYCqapMZMLCpyWJacGuUzc8aSCGevSW0ZvnAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTWOLDCnR9hBKvyx0OtQ3cYgHYHriL/sANDfY+oO8Yc=;
 b=sT0+cZp9iHQy4ApcrKmzBdFnBDtIzbeWJclG708Ni9IaxKKBJGCiHnohi3e08vUv9gE7MJKvVnmlq+v0emyE+SBfgGCf7Tq/jN0l8L0T+x552zddyiPAwtgLOyC0zz2e7GG8IIuR1iiZrbv6o63dqJcIwEgjFVgQnA93DGYQHIg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5877.eurprd08.prod.outlook.com (2603:10a6:20b:291::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Fri, 26 Mar
 2021 20:01:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%6]) with mapi id 15.20.3977.029; Fri, 26 Mar 2021
 20:01:01 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v5 0/6] qcow2: fix parallel rewrite and discard (lockless)
Date: Fri, 26 Mar 2021 23:00:39 +0300
Message-Id: <20210326200045.363290-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR05CA0166.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR05CA0166.eurprd05.prod.outlook.com (2603:10a6:3:f8::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Fri, 26 Mar 2021 20:01:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 839aaf83-e38c-4192-2eeb-08d8f091e176
X-MS-TrafficTypeDiagnostic: AS8PR08MB5877:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB587722B58CFD1D7FF12E437EC1619@AS8PR08MB5877.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bFVFKbBQad9B8dmJATpT5g3IzH9vP31oU5SBbBIOEuDC5tEN4Uu83UohdBWiT/1V4u+YZ2DF8I3eLcYNUVNKiVl2TN0CZTVUURZkHQrwl7DBLkjPmkjTVHb1e5+v6zn3K6MJ0UYnbAFNRfMyqwF5qM1fP6PRhCKNjMCt5uF75DZINNh2FyI3gRYLcv5zw8ng7hVvfCvVw1/3gZekgWLE/uXw+mJjsQfc62XNp2Jr/Yv4ma895aX5dSvgpqQ9EBKyC8iBlFodyFfAscnjudGZZm3naovDK9y8lPYpqGyS0rSjnwXfeyEJ1LqiODYVMgI3z0fKmAiKWaLU3wkJm+OpReqCGO7XDDQI4nRgtGa7jO7MPJEHnep2bzdHnHcQQYMl2ylUny6/sZy+JmCyjyYKVB8cm++halAR8keZSvnsMh7YnMz/spuz7jyBvPxtR/Gk0P1MemANcyMoqTlV+jTdUQs2MiDeYt7cXv2+fVUzUOvlhpOlR2GbnhxuE8fiztT+Q+AiMwQJPTKWR5UxC3QHh97wuJbDeSREeHHzI5FxFbomb+LPWEWBI/phWgpqKueR34wq9qWMlInPcJFJZXapu1V+nSBCTwn+H2Ozn2w3Z9S7dhyFy8zyFGqA2au7FrnswqUFu05R26A3fhoa9CtfHesd+TEnplCJyyHZ2iu5L8YE8uxarxLtiury3LLyD579
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39830400003)(366004)(376002)(136003)(396003)(1076003)(316002)(6486002)(52116002)(36756003)(6916009)(86362001)(8936002)(956004)(107886003)(5660300002)(2616005)(4326008)(26005)(16526019)(186003)(83380400001)(38100700001)(6506007)(6666004)(69590400012)(478600001)(66946007)(2906002)(66556008)(66476007)(8676002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?MXmh0poRAgBux1YvaZ7Yovj42Bj2/nSurNsu76TDoqH2wqVagWJZqgVjocqL?=
 =?us-ascii?Q?3Da6lqm7uWTWCdWU2d+f6Q+u+X3laqpz4q1ulP/SBJVSbYh6cy+I1cWW1l6Q?=
 =?us-ascii?Q?1LLYv/0ynM9BPjoqQwx1XnACjZSyrxhfOaa5XDDrO21RFI4h1G7CtCR26jkT?=
 =?us-ascii?Q?TGWuhoqznwToKp8IVetiNuZ8Otu5fW6uwBl9yz92YDvu6N481Dx0On0AydxO?=
 =?us-ascii?Q?GcigVAL58Vw6WNW175oxt0fnHBuZNSPPvmNEfNAIQpFbIef615fBuGxdJp00?=
 =?us-ascii?Q?1N62zxt+TbpRMEqRWRzfTja8Hbe0XSaLExBjB7eAiVdQQlLJW+1bBPATw7Gi?=
 =?us-ascii?Q?51ZwJWgvZW9pG0CmIDOgC5tqokDU9Gl7zOLwCc2Y26sF2GRpdaHS/cO7hFgV?=
 =?us-ascii?Q?nQ1wo9Bllf5VJ048/WBTxpzdA89VMbHzDunUZU5p31pPqbzGEry18Dr4iHJL?=
 =?us-ascii?Q?4bzS4hZjEL2MkdilPjx5pxrZOpwoPxpDIC1zE5r5EMk0hrFvOKz/e6AVTTmo?=
 =?us-ascii?Q?k+N6Vc85iLOofASgocGQ8cbTkMc36frrncfAiYTcbDNSO/AOgthydHDGQ87b?=
 =?us-ascii?Q?vKssUNy2uOI5MAPnywyAlMBwU/WyW40j98Ev2sD8CqQLn1HQMAq41K7mwy/Y?=
 =?us-ascii?Q?n40K5a4px+gh7BfKNjLMhBzFfwwUiGed+T/RTaO2LwIcVXJHU/xprHTjbz94?=
 =?us-ascii?Q?2rVGf4PjUdXfTcFhiVxBtF7hmt0iT6Ou5OavbaHgmiplkRqf3QmUBlBKgJyq?=
 =?us-ascii?Q?OI90TOetr5jCoQg0Jougptbn5XkYfTohwKo4lnWRKKsDDolcxrKs1/kuScFo?=
 =?us-ascii?Q?eOYcC3fMIJhZCTyphR4jTBYqWwLdgdmazuVau6jvlvzdaGSE06BQJlbCLTSZ?=
 =?us-ascii?Q?9su7odVrsfEOCWrUox9ef/jznavE1EPiBQPxhJ1IGVk4DFrH20Yuc3Xir1BM?=
 =?us-ascii?Q?NwZmfV/HvPSEQrXI1QT03ZeVacUqYt43VBqXqig3fzJNz48HSq9xMq60IuLw?=
 =?us-ascii?Q?xmMJd/n1cvjARvsmfYH74SvCxJzOiWZd+qw8qarh/ZecgH/BL7LiPOTl+FLM?=
 =?us-ascii?Q?IS9xs/n3cUCNrG+va0YmeiF9CcZJoF8E3+8I32583AU+pnxABnO59Yc76nzG?=
 =?us-ascii?Q?Hj4t/w//VSjv+xGDkIR8s5ySY83+O4yO+zi/0X7mSAq51Ezkwj3VNEFJpT1h?=
 =?us-ascii?Q?v7rMLdHU5M/Q6FtOFHvJZkJyC/09eMriBckwjIw+e0zzcEBISasTFUBEW11h?=
 =?us-ascii?Q?CNNDRHsuXkZkcifg7cdJ2+U0og7oWhWn+h8+NN1xVLBf9KlrP7X+64RT7A8C?=
 =?us-ascii?Q?QefVG95yDjjJ5AIL6TU8NlMU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 839aaf83-e38c-4192-2eeb-08d8f091e176
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 20:01:01.8120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pE+90VdPNn0ofiylWguo+ErxPPi0nXq76x0J+HBSLeFIThSFN6pv+aEZN/kR3TFEYnyczuFxrpk4lODs9aR60z1lcOiPIQqMgz2s7Ttwfks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5877
Received-SPF: pass client-ip=40.107.21.133;
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

It's an alternative lock-less solution to
  [PATCH v4 0/3] qcow2: fix parallel rewrite and discard (rw-lock)

It's an updated version of what was don in
  [PATCH v3 0/6] qcow2: compressed write cache

I've split the logic into several patches, add a lot more comments and
documentation, I hope it's all now a lot more clean. 

Main change from v3 is careful handling "freeing" the cluster. The
concept of "free cluster" is established. And good thing: now updating
inflight-counters it lock-less: we don't need the lock for discard
operation, instead we consider this discard as the last one inflight
write!

The solution is still more complicated then co-rw-lock based one. But it
is cool and I hope someone like it.

RFC: should we protect reads as well of intersecting with discarding
host clusters? I think yes. Reads are not as critical, as they can't
corrupt the metadata or data (due to use-after-free like writes), but
with reads it's possible that guest reads some metadata cluster. It's a
kind of security violation I think.

Vladimir Sementsov-Ogievskiy (6):
  iotests: add qcow2-discard-during-rewrite
  qcow2: fix cache discarding in update_refcount()
  qcow2: introduce is_cluster_free() helper
  qcow2: introduce inflight-write-counters
  qcow2: consider in-flight-writes when freeing clusters
  qcow2: do not discard host clusters during in-flight writes

 block/qcow2.h                                 |  16 ++
 block/qcow2-refcount.c                        | 184 +++++++++++++++++-
 block/qcow2.c                                 |  26 ++-
 .../tests/qcow2-discard-during-rewrite        |  72 +++++++
 .../tests/qcow2-discard-during-rewrite.out    |  21 ++
 5 files changed, 308 insertions(+), 11 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/qcow2-discard-during-rewrite
 create mode 100644 tests/qemu-iotests/tests/qcow2-discard-during-rewrite.out

-- 
2.29.2


