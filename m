Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1E43D10E2
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 16:10:43 +0200 (CEST)
Received: from localhost ([::1]:41574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Cvq-0002Q4-TA
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 10:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m6Cq7-00020l-HU; Wed, 21 Jul 2021 10:04:48 -0400
Received: from mail-vi1eur05on2113.outbound.protection.outlook.com
 ([40.107.21.113]:55649 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m6Cq4-0007Bd-F5; Wed, 21 Jul 2021 10:04:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V0Ci9gLYbcrUDC8sTav4+M/XFBFVuOI5hZGZAOCmmoY+7ZBENS1V0XDyv92rVHTBIm7gbj2TFhyfO8yaOOjXpehG83vNSSBSr61IPQ/b38Cli9lBcLntiU4eMc3MEbnOfqHSFmMoTjOq9AQitG8sK8kEOI5xpa2evyjyOJuJfjeTO1AJjgmdWWq1rQjjVl/AFzujV3uAIh/4QfPF9bWUcW2onVe938cLOYl6O6gRMtJFbrTWv9spzn/m9VZuPl8oMG2UpdOygOlkE2L0cTxw9aWdc9OIDXE6WBF6YBzWhXtfG4YBj/AGS5XMdQrb/gZqRBOJVEvym0VFeJUfOXF6Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XF20iF7tYjrORWbQxb3H7AjQcAbiE1BNSUMjpR3tzU0=;
 b=WoJ/q9bDn0bBx2L3KTTzP+VHL43olV76bXNqVkX9z6rHPF6rGnST0YS8REOUyjDZRPQN+JzHLKWqke+7GVZUYjCjuP/A4fYKTyNFiDG/vTQ5+3bN+jzyS3wee7r73pHuJ7jSmlrrIfat44e9Gqv87W+uWAhtTs+OxB3qFSm+PRrT/+ZfmmY2hvtBwV9wa9DJgSgIEYJCauUqrFeoMdjaavk+FX4mgn0+MdLWLXGRjHCxmFvYhHcnfLRvsJUHzeff1cFyZeCyW9PMYmDpqEzDhVZkG2lRo4vvICQsBsUHpkjJ95oOiSDURaISE3uXz1tpZevoQP944pFmNI3MXHArRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XF20iF7tYjrORWbQxb3H7AjQcAbiE1BNSUMjpR3tzU0=;
 b=YUNlCq8xPuGg1ARW8sGxm6FaFLRzkUrqw1Y3y0NjXOmD8moKq1VM0ln69R0xesNjI20t9+U8EKTsTwQgYW5b7kbotzAm7JroCU7EYXH396jl/jkW50eUwaaLOoKWsBNJq2RyYjmfrJzOcnS5q5/+iQ4FzwYBie0FuDjtVPuPA5c=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4214.eurprd08.prod.outlook.com (2603:10a6:20b:8d::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Wed, 21 Jul
 2021 14:04:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 14:04:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 xiechanglong.d@gmail.com, wencongyang2@huawei.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com
Subject: [PATCH v2 for-6.2 0/6] push backup with fleecing
Date: Wed, 21 Jul 2021 17:04:18 +0300
Message-Id: <20210721140424.163701-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P195CA0016.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::26)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P195CA0016.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Wed, 21 Jul 2021 14:04:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40d956a9-240b-4887-b496-08d94c507ad5
X-MS-TrafficTypeDiagnostic: AM6PR08MB4214:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4214DC10FA67519667604230C1E39@AM6PR08MB4214.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xs3lB786yhu2xnWmrz4/OJT8NuZci4dJhoJJd4TMXx9rxIyy2RDCcjqzd09zR3jkLEGPC1G415HgktWYhmAWRGfEfHvNwhBmZLN2ms0Nnu9lp35vz3aZrBALaIVTMzVsFXQUO38elb85JW8ZPVnmgAHIsT41iDKRIIOGI5UeaL4FmHRhS2DmDm/Q+LtEufL0yUjNodr4TwXo45BmpW/r7sgsG+5rnLYNhXKMVtUKoN5WuQBpyzNV0NocMRSn2tF9pvFqrsDx5i8zRq7RR/0H9ppEddBBzA13zcBT4QOTO0hd/RZ8k0Ayq0Q2FNhFSSkq8wlU/7erRUkyTtlWzTnfKr1NXfmN74QPGeDHfkXZBj2kA/6hlcyx7On1ITUsaBrg1Vcj8xOgVV6oP/02X//kyrs/dksFt/a3C6Ca5tx0VdkRgdbCpuo+/+TPSpCt1uNXYGdT4bLCZqK1eC1LEPvwcuaDBgbyoi99GHrrHlMeGh5abOL2m3lVzsZSziG/eC2XehM9X0odLSoiy30yDWwVBthrN698UjMNgxI+fhbOzBl+BV7IruqRPD4LZ4CZCcJZZn+r//vCMXonqb5tIrVD1n/BFpTe9pbUH+WpNaH+0cOtO7duUZB4maxYC/qX1+GqXQzSGAhzksatIClCEeGqn0fqaYDL6gYp0JWDR/fqbqS+ZEPV29X9FYjfdrFeWKoL/BpijzyaOk0CChG2Fe3X4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(346002)(136003)(376002)(396003)(186003)(5660300002)(8936002)(26005)(66476007)(6486002)(38100700002)(66556008)(956004)(52116002)(6506007)(2616005)(6512007)(316002)(6916009)(8676002)(2906002)(86362001)(4326008)(1076003)(83380400001)(36756003)(6666004)(478600001)(38350700002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l85ykY4mJIJMWRf2lZFy2W6RBlFtUJe3PaVSawUeDxihH3VLYmTCFQECsQBv?=
 =?us-ascii?Q?Bjfh3RUWPV2J1nB7wxEm8gw968btymEvPMb2GbqtXUjDUC7QOfhWmlKeux6X?=
 =?us-ascii?Q?dbtjz9y65rRyR9Sv3l6gPZDiHzK25a2m+pw60XOYUa6ApanBkYg7Vqed0ltv?=
 =?us-ascii?Q?qXaRZPM/jKRjBl7mYFFtO9KxJ3Q+XyKlp9nFDap+V+68pnYCd2Nig1Kc9UrO?=
 =?us-ascii?Q?C76WBXl2a5ExvD9+ihGcjvCHj2AKw+Hn27bSsi7wbNLD69vxOtlveTeCsLbH?=
 =?us-ascii?Q?YxO3VEfzRWltj3nbry7Uk3lzP2zlUyh8SaWxCyJfOqIf/KQEaDfCSG0JrjkZ?=
 =?us-ascii?Q?FnG9BiN5vGyYVBD/UIM5E6JYydvaXCwcH8T90Fc+myqCIlsCAdomDmbdl/pt?=
 =?us-ascii?Q?KmYi/Ql8HSfrWo8xh09WbUi7fzh1WkFpIByP+rCtP3u+VriLHvzqB/5GeclH?=
 =?us-ascii?Q?8pyVF6iJPoTIs2VslrQ2N6Xbnyp6U8+/r6vwcCTbwbEiYuZsi5jesVQbZmm5?=
 =?us-ascii?Q?FSFLq/i1cYidHf5lS9xHGSNwa6ltmQrqUv5cS+F36JoRhGbL8I4x0GusLPim?=
 =?us-ascii?Q?6O77y4fRubXU4LpXjurty60IXWQFbMTgWnVu93c8d8cq3ScdEatXxIMf23/k?=
 =?us-ascii?Q?ToqLf5uMJgsivuYuSjmOpz7HxSmspVoZ6loh7vTpYhF+JErJ90etwfn1eq89?=
 =?us-ascii?Q?EZIEcXcqTFyS1Qkqnh2zE2sQVRwWekSalGiqhd64EKjznzT2ropRadgx/FAY?=
 =?us-ascii?Q?vCer+yx2QXgt54O8F1Tn1A9CNPgnPW269FNX76ZBEaTG7CjlgMjCbw4mcPEr?=
 =?us-ascii?Q?eNLHvMmoEChxviBXiiO9F1CtvGJ+nMARD93QUMvlbwTLs74JQvpVQp8aUNDZ?=
 =?us-ascii?Q?CGPQXemrQsok+BTWEmK1rzB64FRQH8RfeHuZ2c0AhfnLXvWl6CEiZdRjboIP?=
 =?us-ascii?Q?Tq6KwMrNCDmAzmJ6gNJ2YaOO+3RLyfSw16xMoZAlNl+AUpMaGU5eCsm+N9tM?=
 =?us-ascii?Q?sTUGkF08KCJ+T8g8hL88MvhlNIv5S71yjwN49LOixIfjuRWUEyfWt5ZVQtJ+?=
 =?us-ascii?Q?cIBhPFtfkC/Aq9kjAsZnlLd9Kmhx1xMQ36JlZB+I0Gj+DgnfWCjUflHB8cND?=
 =?us-ascii?Q?Iz4fxD/vGsWYw7aA2LuP15I9DIUnoOxQ0r/LHUKPxiWYkVkeNR/OXGVrAaO9?=
 =?us-ascii?Q?n1o+JVuIkzwPNg8PRNCEhhSoYnMhnlxbPtKC0rbORJeIAHoH29pf/Z8TMv9F?=
 =?us-ascii?Q?qnJYvHIaykDXMk7CK0WixL+c9+uUJAI9G455Wx2PVnE6RV/n3Ds78J4F6j6l?=
 =?us-ascii?Q?MdLzRz8och9bWyf6mz5vuLpV?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d956a9-240b-4887-b496-08d94c507ad5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 14:04:39.3816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PG2gotrTtiRlR1rZhZikdh3M1WRCzI7lI/ZMATjenwnQtACItrA1ujCk1S2QQXV2nCuLoGziUXmVFUnhFr3iZ24XRoCSDK0tQWNP+7oCZXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4214
Received-SPF: pass client-ip=40.107.21.113;
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

Here is push-backup with fleecing. What is it:

1. Make fleecing scheme

guest blk
  |
  |root
  v
copy-before-write filter  -------> temp qcow2
  |                                  |
  |file                              | backing
  V                                  |
active disk <-------------------------

2. Start backup job from temp qcow2 to final remote target (NBD or
   something)

Benefit in comparison with simple backup job: for remote final target
write operations are not very fast. And guest have to wait for
copy-before-write operations. With fleecing scheme target for
copy-before-write operations is local qcow2 file with faster access than
actual backup target. So, guest is less disturbed by copy-before-write
operations.

Based-on: <20210721100555.45594-1-vsementsov@virtuozzo.com>
   ([PATCH v6 00/33] block: publish backup-top filter)

v2:
01: changed to simply check s->target->perm
06: make explicit immutable-source parameter instead of auto-detecting

Vladimir Sementsov-Ogievskiy (6):
  block/block-copy: use write-unchanged for fleecing scheme
  block/copy-before-write: require BLK_PERM_WRITE_UNCHANGED for fleecing
  block: share writes on backing child of fleecing node
  block: blk_root(): return non-const pointer
  qapi: backup: add immutable-source paramter
  iotests/image-fleecing: test push backup with fleecing

 qapi/block-core.json                        |  12 ++-
 block/copy-before-write.h                   |   1 +
 include/block/block_int.h                   |   1 +
 include/sysemu/block-backend.h              |   2 +-
 block.c                                     |   3 +-
 block/backup.c                              |  71 ++++++++++++-
 block/block-backend.c                       |   2 +-
 block/block-copy.c                          |  18 +++-
 block/copy-before-write.c                   |  48 ++++++++-
 block/replication.c                         |   2 +-
 blockdev.c                                  |   1 +
 tests/qemu-iotests/tests/image-fleecing     | 105 +++++++++++++++-----
 tests/qemu-iotests/tests/image-fleecing.out |  61 ++++++++++++
 13 files changed, 287 insertions(+), 40 deletions(-)

-- 
2.29.2


