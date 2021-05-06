Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C57A37514B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 11:10:28 +0200 (CEST)
Received: from localhost ([::1]:58312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lea1b-0005QI-DW
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 05:10:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leZy6-0002AS-2f; Thu, 06 May 2021 05:06:50 -0400
Received: from mail-eopbgr60134.outbound.protection.outlook.com
 ([40.107.6.134]:38452 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leZy0-0002qw-LP; Thu, 06 May 2021 05:06:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TkgxbtkliVW4Da+WdZ055xbcjFdg9K+0J5Cfzfjwe6WczSjqqtjAcKS9HtPD7FX8AKp4ohCH/DIURsQ0MFyVh52z5Ph10Jivt/eS0Jnj1TisvQqWsmE9zaHqspCRQerzvYH+Fp0PUBxX2j4uhPHbMugatltTsoj1NJLxtMOXDKoPqUdH+wljIO+Is/3nlHTZP6ii6h9ktFRsvEEBB38M1cNxA9ijZVKFq0S4cR0MnaoXeUF9S85CcU/ZBZD94DkAhYQe9kzJSO5ckzhaIJPoX8YhX4xXWBMUxFtZYEWyZ2sKDS6vXr8K8dz/kdg/MUg8YM4vptvXvwYyCWD8jwQVPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0qdFEj30+4usJB94ChzDxcVOdDAPGG80qhx2jnH+T+c=;
 b=h74YrmHS1UJ4YRC+js+5VOjaUsqAoMAVHrcOTx+wjVE1rTEPZoU0MoJaym+LSGf371vpDbP1b/SmvgZ2GbgK+ga8yGfTik/tVbYDcrnQmVfVkjpnShY9737IlAseqanfT672k8z/WznB0r6QNa8jc5SAeTmfwWH2L476tY/2tfoJBQM8OKqVrwDzoi09mHS9klsIM5dUSvrAukrbiUXiaZnaYhy+IRQY9eO32Ir7zE6thAgV7ZzzvvtdWb+TP7YMs60yKqJ0hH0JatVdHQMOrdj6LUa8QPFTTU6i8LsfeD+uBViIV260v+vsg+W47enGOraXs/WD7FyG0l1tHmEXlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0qdFEj30+4usJB94ChzDxcVOdDAPGG80qhx2jnH+T+c=;
 b=bSqZR44DkRoTYpk/nzPzXMKSojJbfhx+m/Xe9d0oixLWdDBSGfXvD6fJcPqWfOyTcinMx/5ub23GDKdmdqByCroNeB7Qif3TJzCRJFN5zO3xohd9e4NnTsOzS+uceA/z5A1j9MtYBb9jewpwc86/x/tZCcFq2P4WUHiYIiKvodI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6807.eurprd08.prod.outlook.com (2603:10a6:20b:395::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Thu, 6 May
 2021 09:06:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Thu, 6 May 2021
 09:06:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 eesposit@redhat.com, pbonzini@redhat.com
Subject: [PATCH v3 0/8] block: refactor write threshold
Date: Thu,  6 May 2021 12:06:13 +0300
Message-Id: <20210506090621.11848-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: HE1P195CA0011.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.236) by
 HE1P195CA0011.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 09:06:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 003ad4b9-d15c-46c6-438d-08d9106e41d8
X-MS-TrafficTypeDiagnostic: AS8PR08MB6807:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6807E6B5AB1411E1614F6154C1589@AS8PR08MB6807.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r1GzRdZEj6fBK6YZVi6e0F52Pj3fGYW/CsJvHjvkWoORhMUB2gMX9s0LqF/FMIhS+/VqqLVG93peJzhe+f++RPysbKwmjzVUlWvjAF/b3QrHLBdGZb13CLolagnDpe/xxbYvjnVyYucwforZMKjfJiZvltldYUNk+M0V+S++UYLmWTaEmR3aNts60KndH8R7hvZ8NMt9VuyfgHEO0TQ+991U98YQbq516NQujGdRTdfl0mt8JCjGMujIA7mEdFQK4pLHwYRXnNooeAHonrMRi/n5oHDUMoOMk4lMMVy01vJNEqzU6Hod3KIT5C+75VV7/uX5a3JrwOIPTqE6xZHjqREx2+PhcwEi4SI4/L0xo8x2fprh6GXz4o2aXJCrznDAAfgq0YBnm1UncVHhkWQ5E18gystueXvI6SuOTYvIxoGj8obxgo1nhsygACG5UB5SyU5oNmC00wIq9EUK0ivrF78ENFSfyM4+64TY4+RvBUqxvR3V02+0LVrmxllRxFyTdlreKKF9DUd2/g2cTrxYGrE3uONqWoyor+vpA0B8EKdJkVsEHj8RjxwmynE//0Up9Eb8JU0jPsJUPe1CuSLTuHbmfcLj85mXWpxj8kgQuzbmj20UCfNDeA4qPT4d7QFhDxbvcTSc4zGLLyPMTE0WGZhbmW6DwsTZrR2ALlqb6ezG/tvAXCyoOLkAJmNpWTxY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(376002)(39830400003)(396003)(6486002)(38100700002)(6506007)(956004)(2616005)(66946007)(83380400001)(66476007)(38350700002)(4326008)(26005)(66556008)(86362001)(4744005)(36756003)(1076003)(6666004)(478600001)(6916009)(5660300002)(2906002)(316002)(6512007)(8936002)(8676002)(186003)(16526019)(52116002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?mbUfFlcdIo4AO7AN80lRip8MheyzPqx+HKc1/r1IbPXHLntf4VBwNF8B9BoO?=
 =?us-ascii?Q?3k4ucA9gteFq63oF23grcMHz6BsPeQDTBBJAr6lCUyHT3Uy29bXac0voUqlq?=
 =?us-ascii?Q?1qOZBAb9CDS++8bqq8pACepSkdHVvgBwASXSzSOV3IGEpbeyW0YxPcX/TDKB?=
 =?us-ascii?Q?oVjOXFUrs8opwT4ZxUwGHNzuEfMW8blRLR3WL2DSRsjT8B8lsoylJQydEMoG?=
 =?us-ascii?Q?0U7UCjCGk0GUBCLFQq1Nq3qA2Auomt44RaEM6AK5DvC6FI2o3p+hypVwsIT7?=
 =?us-ascii?Q?LVKgosx5hZGO3DUPUwgYWpYnfrRuDjT7cx3co1/KkFRaM2/lMtgvMl6YmJjv?=
 =?us-ascii?Q?WgIIr85s0sLg1Uya65jMrbqwe5v9ok3+YRd0yB8jwfZjOtMuXqofeWi4dhSB?=
 =?us-ascii?Q?rvB8u3ccL73MmZ1uuvbLFhcsFAXNAS3oSfDKKUfMtz5jl+pU7xvz3SwW9v5I?=
 =?us-ascii?Q?3Pjqy+FcF5mWhx2jPg4IR4lFoP8xDgzbA9oat51QUahJaUX+15TiaB6yMQ8q?=
 =?us-ascii?Q?NJjtPnt8mHcyt0m03j8thhKz6Uaub3WC84J6wFur5mSODaLg7nAGCXLfsziF?=
 =?us-ascii?Q?loxmkGsShGJoYDMVBNPKd3hIgz4I6Dv1PBL4TPZUWHRa4TZEX7ucGuHkVNYt?=
 =?us-ascii?Q?RKYR1HFTKMvYtbIEx2OytwzfmypRQAqv4HFDUfCLWyOBDQrpEbAtIHvnoWYt?=
 =?us-ascii?Q?MZeDd4fCb+kL+5Zg1CtZ95cQiItTm9DMkcmVdGWan43mUYT4XEX3C6PtlEUP?=
 =?us-ascii?Q?cLvMFmRlf0Mx5JnAAJQUQN75f4bTx1/M7mPKzD9OO7Cv+9qtjkwLrN7XOrqw?=
 =?us-ascii?Q?+GqTxzUXjvRH29f8NsG6mrS4k4DlfQzOO00A6FFqWBXs6ADi7VtL5qj2I3x+?=
 =?us-ascii?Q?7GMzxI6UdL63dwBJ2vdy4rNJR3s8CBxyHty6IrKccWdEyqY4+avvHUO1POKx?=
 =?us-ascii?Q?wxC+uUJ85G8ig/aBKYyrEfdM9UmqHQR0JKi0f5xAoAxfub225wnO8sNioQ1J?=
 =?us-ascii?Q?ejR2DcobCeeo9skgNQd8wFO73JrZJCxaJHbgzohF46s4bXFF8FrGtDAk3Ytm?=
 =?us-ascii?Q?7aMIvpDBjlEwzJOoSKrox7uj0+t0BkPXeEiGnzrdD6SElmQ8BXJP2BQt7AgM?=
 =?us-ascii?Q?ws18k+F9Vla6ZgMPC9g2ty28JTIDkLhz0wRTi1PCibUPcXG7VdQH8tCSfCBe?=
 =?us-ascii?Q?jYGwVKHrRWgszzaoa/Oo+bUn5Nv8mtVsrTs5IiD+dyQ8992g8Y3BW34O41qA?=
 =?us-ascii?Q?nnvvorXHtcczMZF7GwS3KxV0i4yLJm21rs+TudoCeGc2WFkDa9ac/xk8n1IW?=
 =?us-ascii?Q?kV21JdXQCPgY0yspm3Q/+P7j?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 003ad4b9-d15c-46c6-438d-08d9106e41d8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 09:06:38.8557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HxOSbn4bRRuSmoSb1C50dX54gO1GM+NtoQBE74Jsy1Fv7hyl07swXTii8qwZ62bxIftA9lW+Ze0u3ZQIhyyWiVafWVslGU7PT9JLfOegzI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6807
Received-SPF: pass client-ip=40.107.6.134;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

v3:
01-04,06,07: add Max's r-b.
01: improve commit msg and comments
03: improve commit msg
05: add more comments and qemu/atomic.h include
08: new, replacement for v2:08,09

Vladimir Sementsov-Ogievskiy (8):
  block/write-threshold: don't use write notifiers
  block: drop write notifiers
  test-write-threshold: rewrite test_threshold_(not_)trigger tests
  block/write-threshold: drop extra APIs
  block/write-threshold: don't use aio context lock
  test-write-threshold: drop extra tests
  test-write-threshold: drop extra TestStruct structure
  write-threshold: deal with includes

 include/block/block_int.h         |  19 ++---
 include/block/write-threshold.h   |  31 +++------
 block.c                           |   1 -
 block/io.c                        |  11 +--
 block/write-threshold.c           | 111 +++++++-----------------------
 tests/unit/test-write-threshold.c |  90 ++----------------------
 6 files changed, 52 insertions(+), 211 deletions(-)

-- 
2.29.2


