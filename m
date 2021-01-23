Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BE6301878
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 22:08:14 +0100 (CET)
Received: from localhost ([::1]:54794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3Q8j-0002I3-Lf
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 16:08:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l3Q5X-0000Zq-QT; Sat, 23 Jan 2021 16:04:55 -0500
Received: from mail-eopbgr150139.outbound.protection.outlook.com
 ([40.107.15.139]:30663 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l3Q5U-0001gI-4z; Sat, 23 Jan 2021 16:04:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRpAwDBoMwrIwhkr+Hdw6ISLwsrDV8jMsLHybqtl93rOIwymefa3WFdN6Dul6zRSFUZZZI0Zyjv+l15HxZWm34IvD16sxLv2RweLCiGd1r+AjQbO4gWnzXqunoyL1vVe1zI0jDbPXurhvIDI4f+MxkGrL8MuKUNGi2uJKB/sdLBldyP3VHhRW6NUXZRq+Qry1VRcXThZId27YFSh/VhM2E1rEPNf6CyZLjgGlrbc4KSBuyaDADILESsHeWKGgn2mM5CLS541gN0Sjdf1cUQeonuhBtoBp/mU5+HpsA9ysrDjHVLl8cDQq/JF1jCwQrILxNdvEmfGMutfi6vsBLRbXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7dmiW3EEWG8Jg4ac22/HauFEnVIcYv8a1QHIldbcM24=;
 b=OPL3PJm8jxfL4pogDD0L2kfSNw4aDLBKSsZDZwBTV2BI6PYbbcu06ixqX5agdjsr1Ocb1CUlABhkj6uvAFes+tdRQ9TkqnROjru+ByUuj+xib8jeqCHaYNUmCJhTISR8YC4spqZW1wciHA2DK0V7STtNMexMdyGbaeXSstZurrbIgTrq4pLZnJSRWZoTmuIJK1eDjx9p9z2Nz4iI/aSs/x1B4+eSWvH+DAFUcAmRp93JjFMo2P3abmBIyZBTve2UWlPY9y2ltny5Oz7qctMxA9oEN4Z2q+FBtX5xejx2/u9GWuCYcGWv+gzsJTQXEkX6urWlvZXgnpBRsJ37uS69FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7dmiW3EEWG8Jg4ac22/HauFEnVIcYv8a1QHIldbcM24=;
 b=K33yVNTPOPuBbfRX8VWN+1vA1gUK/SwancKhxGYaqOXoz0I9zhcBRptwtokT6AeoTXYxf5wXizt8lsW3TV9b5beYszMzsjSCHEhj+5NjGClQaE0gxhkte6Rw07PZBUoE2pPr4bprnInk04UKUcwxXgQldl8K5CHQmSjiEA4/hL4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6053.eurprd08.prod.outlook.com (2603:10a6:20b:292::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Sat, 23 Jan
 2021 21:04:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.015; Sat, 23 Jan 2021
 21:04:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 0/5] Rework iotests/check
Date: Sun, 24 Jan 2021 00:04:23 +0300
Message-Id: <20210123210428.27220-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [178.176.79.161]
X-ClientProxiedBy: HE1PR05CA0196.eurprd05.prod.outlook.com
 (2603:10a6:3:f9::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (178.176.79.161) by
 HE1PR05CA0196.eurprd05.prod.outlook.com (2603:10a6:3:f9::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Sat, 23 Jan 2021 21:04:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 425f2395-6d7d-42d2-d64c-08d8bfe282e4
X-MS-TrafficTypeDiagnostic: AS8PR08MB6053:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB60535D66CC929CB684F02661C1BF0@AS8PR08MB6053.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:202;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zqHK8M3PSqyOLJKns28TeNUfhc8dYpp+2HvJqRlPZ5nT/1X+Dz9J2vxmRkZzqZjR+TBOfMgJFhayyzbpMDp4ka61QC6BnO5P6Mm1h7BbUTdIWqy7XjwywexmrVAQu4mIBug71PP1hMTYqTn5YPGyKjSHJ8lnjSJwnH/D2Lkrwdqov2GTctHwPyajdtcCJ6RYtnQdUafsbPTmhT6M4XrwnIcoCGURwspLN6pBXpcQnDBLy3gopQLRnkn9AclKMXLnU5bJZmUMSgWFpLbmApqICM/kp5dii4J2n40sFip0wmL8ASjkFrfz+ZYP5n/MIww9WtuwPdSgV5YtsWzvV0RVBNNKt87QaxN3FwD205LCmUHd82KuoYUYO9NWKoag0ts7bVh9A35NRsKYgtv9KbidF2keXWiRtLwp8RqKdqvsKyL4gSg1yjAXcWmyEjZh+Mmnz6jhIxnvz2Hsk7zl86YImpKg4guj+K7grCc69A3VktXS1l1JTE/D+SsN833RNciHZjVF0JazQX4NVkuVztyz2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(956004)(107886003)(6486002)(186003)(66946007)(66476007)(4326008)(52116002)(5660300002)(1076003)(8936002)(26005)(2906002)(6916009)(6512007)(6666004)(36756003)(8676002)(6506007)(2616005)(498600001)(66556008)(16526019)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7jSoE4y/Meg9xxbU3HrAcMnvf+95czIbIyqKaue/5Ef2Pm8pfbc6oInaRp8H?=
 =?us-ascii?Q?qLwHXSSOGd3ybL6cvAS54Lcnqqs42c13dwJKnWhqzq8vJmdgn70VAQcjGiJc?=
 =?us-ascii?Q?WPm4F534e3XYG17zfCj7nq6YFYqFQB1LjtnRyEV7P/toXf/bsLuVmmpwfOBd?=
 =?us-ascii?Q?0rGJWqMNhYEwsdU8NdeuK/XEqfL4SRZvS1MGiMO4i4fx76dVKkaKTtZ6p+cg?=
 =?us-ascii?Q?376zxbxW08Fk3ZfQ6PqXdczPYgPBS0DqNijIWxXItLPFky6SC0g01R5YWuUm?=
 =?us-ascii?Q?sx3gCgOvgntVNwwjpsr98KkNFsZH/ZlcpgEy9n4psIo/Reibwsqlm9OsIbNp?=
 =?us-ascii?Q?4uOM2fszVbGNGw69I+34cGN4lyrjTdWTNFoBXPC7Zq7v0qctOJpnOuemVAxL?=
 =?us-ascii?Q?SLw8zE8cY0tsztAhxAuG0f0U3mraspOgYoC8R3N+enYlGwlQHIta9wgI9piT?=
 =?us-ascii?Q?GWfQkcZ2AUog6D/t1YQacR1W7ABbCwshqJBxKa53vc74a5Gb0ZB4aPglt4GF?=
 =?us-ascii?Q?40CTO4bjDsDqXOa1gS3mV0w1s8eKhnvD8/cUka2Xik8kOZTvKGM6z75draK9?=
 =?us-ascii?Q?xf2OOLjgkJLQ+EnxD+7bhml7EBvjpZQf4ikRCm0VISGSkSvhgGbcvnSNfP9S?=
 =?us-ascii?Q?omdkrQ+epSbWYwPk/2RP2qQWfQRVTlIWzL4SdtQ+fy10wMe1Tqd1mXfMrRSM?=
 =?us-ascii?Q?Czp9I5jFwBFpVTeXr24mwIyO7yQUTyN5RDSUnWSaer4KGibIMWtKTFCBfp66?=
 =?us-ascii?Q?6dDCj+eOmCtSYIgBshJak9mePeVznHMkkpyGfodbFZyaQbdcwYjKlq0l/Nad?=
 =?us-ascii?Q?bcDrxOhT4uF7Whlq+AXSwFqJpv/oNeYcAuMgAum7ZaJu+k5kPcDl6IVoC4wD?=
 =?us-ascii?Q?5mkv6eYfghNwIbVBTV0Q882cx0XvYQpsS7E6xrXoJf158wU63JiZ2JMS59vh?=
 =?us-ascii?Q?z3bcjoJGpX5AuW7JgxAgRpKBiCzOCZkRQuk/mdOHly/DEW+sjG2flHN2oRNW?=
 =?us-ascii?Q?xWh1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 425f2395-6d7d-42d2-d64c-08d8bfe282e4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2021 21:04:45.5451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tUTFRSBmJ6lc03NASnnGhRqXxwd9tbnuPzcFHA3Piq09LpoK6tFIhA/sFSBKkp/ESK7G5uoGzyw5hpXaFeIEuR/mJ1ovzI1OAXQK7VbOSMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6053
Received-SPF: pass client-ip=40.107.15.139;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v8:

about linters:

I didn't modify 297, as Max already staged 297 modifications to test all files.

Also, now I have two complains:
+************* Module testenv
+testenv.py:158:4: R0915: Too many statements (53/50) (too-many-statements)
+************* Module testrunner
+testrunner.py:222:4: R0911: Too many return statements (7/6) (too-many-return-statements)
 Success: no issues found in 5 source files

And I feel, I'm tired to refactor it now.. Probably we can ignore them in 297. Probably I can
do some refactoring as a follow-up.

findtests: grammar, wording, add Eric's r-b
testenv: commit msg adjusted
         wording, grammar
         missed env_variables added
         add logic for searching qemu-system-*, if
         qemu-system-{arch} is not exist
         handle valgrind and MALLOC_PERTURB_
         fix s/vmkd/vmdk/
testrunner: commit msg adjusted
            wording
            fix extra new lines in diff output
            s/0/fd/
            use class instead of namedtuple
            don't handle MALLOC_PERTURB_
            declare self._stack in __init__
            change thistime to be float
            handle KeyboardInterrupt
            casenotrun init to ''
            fix "output mismatch .. {f_bad}" to be f-string
            smarter terminal color handling
check: wording, grammar, sheepdoG, exClude_groups
       change valgrind to be simple boolean option and pass
          it to TestEnv
       handle group.local
       check virtio-blk in iotests.py
       add --color option

Vladimir Sementsov-Ogievskiy (5):
  iotests: add findtests.py
  iotests: add testenv.py
  iotests: add testrunner.py
  iotests: rewrite check into python
  iotests: rename and move 169 and 199 tests

 docs/devel/testing.rst                        |   50 +-
 Makefile                                      |    1 -
 tests/check-block.sh                          |    2 +-
 tests/qemu-iotests/check                      | 1095 ++---------------
 tests/qemu-iotests/common.env.in              |    3 -
 tests/qemu-iotests/findtests.py               |  159 +++
 tests/qemu-iotests/group                      |  321 -----
 tests/qemu-iotests/iotests.py                 |    8 +
 tests/qemu-iotests/meson.build                |    3 -
 tests/qemu-iotests/testenv.py                 |  278 +++++
 tests/qemu-iotests/testrunner.py              |  366 ++++++
 .../migrate-bitmaps-postcopy-test}            |    0
 .../migrate-bitmaps-postcopy-test.out}        |    0
 .../{169 => tests/migrate-bitmaps-test}       |    0
 .../migrate-bitmaps-test.out}                 |    0
 15 files changed, 990 insertions(+), 1296 deletions(-)
 delete mode 100644 tests/qemu-iotests/common.env.in
 create mode 100644 tests/qemu-iotests/findtests.py
 delete mode 100644 tests/qemu-iotests/group
 create mode 100644 tests/qemu-iotests/testenv.py
 create mode 100644 tests/qemu-iotests/testrunner.py
 rename tests/qemu-iotests/{199 => tests/migrate-bitmaps-postcopy-test} (100%)
 rename tests/qemu-iotests/{199.out => tests/migrate-bitmaps-postcopy-test.out} (100%)
 rename tests/qemu-iotests/{169 => tests/migrate-bitmaps-test} (100%)
 rename tests/qemu-iotests/{169.out => tests/migrate-bitmaps-test.out} (100%)

-- 
2.29.2


