Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2F2348333
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 21:54:25 +0100 (CET)
Received: from localhost ([::1]:40050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPAWD-00085e-HD
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 16:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPATu-0006ER-9W; Wed, 24 Mar 2021 16:51:58 -0400
Received: from mail-vi1eur05on2116.outbound.protection.outlook.com
 ([40.107.21.116]:40416 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPATm-0005Ie-Pa; Wed, 24 Mar 2021 16:51:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrbneTNJPRjXyU9+zcXer4gAVGzLPo/Exopbl/Ga0SR18Nd4tgQPUeAqS7JeHTbDTWIyrOhS1md8rqPCtju+UzhKnbipTTu3FaPwEzGJgcCweetPud1Zco4WMe2jj9zFTufNfXPWhHBcjoQtfJcoBT5g25tCnG2xEsQFCH8Aa3ytG2xIdoUUIofXvaTfhlZij+STB1kDfZOuK6zP9WZJQ8qIRzfJOb/IJEQyurvKN0IXQddYsln1Cf0pPkDl38YSEt3IjIKVzhFN5cQh+Di5MgBbOBZnSDf9w0fyF1Kq5vTAwR+xyJ3RcUlkzY6pU0uF2cMwPk8MHpEfljJLKgGUHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=amZS/xaA5ZtEeqc/dejJqRO7HFVOI6jTJfjPpJdyM+Q=;
 b=ORWpgO14f4tzCpZXQuwOTG82kitDEDnn5SxouijhySKv2bJXgn8YlrhNJU3obnCy/1SJ9Tq2YPb9CUXuODviMBhIXHoBSJtDYw7wuP+L8n4nTGiJ+qjYrTW2YgnyvbuRjVg89FHGa0TBy131W0enp4t/PhXYWORjxEnjIXbQcCeY5Np22dD9zc+gLfGt9RlDooc3uoLPu3dFmDFX2oL81giE7I4fWNPNHZ5PiteRWoEJT6Ia3RLwsrbhQVHSfg2HlUTtcXpPuT98vU3kzRaP1w9zlxlpAG5BnG+SZ8pbhjUU8JPf74cpqD3GLLG5+iYuxX+qdDThsiwI2iVH+QIcXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=amZS/xaA5ZtEeqc/dejJqRO7HFVOI6jTJfjPpJdyM+Q=;
 b=LCXMGDc3BWTRbbIgLKV19A86AUcGarqBKjwOPHT42DkzvEQ7MA7JF3sphBI+a9YdkGqEuwg1sk+Ez5wG6cwaRFbKRCTdS9TuYOZ3FrkMCwvAuv4gWmFFMxihhNBq1G+9486TiA2sWtLkT/tCgc2wABtj1vwI6jY9xlImt43J6VM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5447.eurprd08.prod.outlook.com (2603:10a6:20b:10b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Wed, 24 Mar
 2021 20:51:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 20:51:47 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, integration@gluster.org, namei.unix@gmail.com,
 dillaman@redhat.com, berto@igalia.com, eblake@redhat.com, pl@kamp.de,
 ronniesahlberg@gmail.com, fam@euphon.net, sw@weilnetz.de,
 stefanha@redhat.com, pbonzini@redhat.com, pavel.dovgaluk@ispras.ru,
 ari@tuxera.com, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v4 00/11] 64bit block-layer: part II
Date: Wed, 24 Mar 2021 23:51:21 +0300
Message-Id: <20210324205132.464899-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR07CA0022.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 AM0PR07CA0022.eurprd07.prod.outlook.com (2603:10a6:208:ac::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.9 via Frontend Transport; Wed, 24 Mar 2021 20:51:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a95d530-6d09-4f1a-89bd-08d8ef06a3ab
X-MS-TrafficTypeDiagnostic: AM7PR08MB5447:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5447019ADD5CC92469FA574BC1639@AM7PR08MB5447.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:758;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AqpEBmpuSkGW6l2hA6dftE0UzEr2iIVVyy1lvL80VEERMBscd/WGfFdJU/mj8Bk02YfcMILHLX+RV+dCMKkE7SaFLFUHAD6MIPGH9kDdkudsGVbZTrupCgqaG5iTtfcN/xXHbBPwuV2GT6THrgySrgoRoCUEH+72PLHmKn6VbBCnWVryFPF+ldG9yzULjC5M39F5sdOU/H/+SkdR8sNizVTHK8lJWneijZo8VmsLzHMxfUg0up9tZFRAxi1pJ6HkoUZUKLcUDIE0zVWhIB8hXWRp/O6jIEIDcmNAGarPWFJ+iwAOQYLoYVJP5hdc87A47INlA1jtMgpYhoVxMRECSvBKujkw4h76nQ7mlrifB2Kj/gSeMdbedNhhnJ938zMSbMQ2AwvHaqxwzE4xGdnlTw/K00W7DRY5FRBqageMHk4ng5aX/E0VNxdf+B0ffm9412HpRzxlK4DdwRbIjvwfAp42g4lTOfWNKGAY8cCcJIfWJko2iyY3WcqCadEdrdHz7qDis+CLcoUdKrJdSNhYrwDjkYA/jB5BfXMK3S74LDp6l29A54kwUY7ukWQsyLnoXuwgGz0Cz1tzMOvLNld9x9VbQt70GQ+2z3CpeuUHjz73ZPUKyvVbzbjZ9fy5sYypePryR82tikK0Q9d95a4FmxVgbUPi3baniTTit9hJ/CX69EnRi2k7edbCeYjf/R+6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(136003)(376002)(396003)(366004)(2616005)(6916009)(478600001)(8936002)(66946007)(38100700001)(956004)(66556008)(6512007)(66476007)(6506007)(6486002)(52116002)(186003)(5660300002)(26005)(69590400012)(83380400001)(7416002)(6666004)(86362001)(2906002)(16526019)(316002)(1076003)(36756003)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?At2CUxw6swVddKJ3ZYg/LdfsgfLlxJVJk3XGtHAGJXCHIcFl+02RMi3pVx4F?=
 =?us-ascii?Q?uFlBvb5X7i9Ij8ROy01AIvHR17HUsihWW6Y6xaax0D1KPdpgfKHiNVH+q9OF?=
 =?us-ascii?Q?7REkMhH7ozwnBaEB+ZUs7NafdxENHNAGM9atjaS22n51apRJ28PWBLihj7te?=
 =?us-ascii?Q?aPfrSadjU5UJAp7X+5kkyNPwFF//S70m2+CTg1eCSvvcbii0l+HQVwbk/1DH?=
 =?us-ascii?Q?lE/LQEc+quDb9y42cRQckEJ3pTF0oi7zAoBJwnCkZ/omXXKqp7DMO891JN5n?=
 =?us-ascii?Q?DMI0JhbIaS0E5HXwLq8AND+10z1Vf5n7+5gjNiUE/zyLMKLJPssV9F3W8oOR?=
 =?us-ascii?Q?6Vxcq44GoH/U/QooreR4BLVrd/XiEuJjQRDhZIRPA0gB7ApjnYgJz85IlIqQ?=
 =?us-ascii?Q?KVVcJ3HYh3IdVP95LSJwn6sg8bvhGQv1gIAJHMZmS6KvLbpX3P/YvTQCYsxc?=
 =?us-ascii?Q?/lPcUG7WzNbgus4QmvooxKaWNsD+MI6NjpLiiZ2oWMArgL9UkutwZceh63CP?=
 =?us-ascii?Q?tWSZkUPUtTz3IDUsnkXSVH5fZ5jdvOX+H8mb3BQ44e2tfVVno2yY3RowYX1v?=
 =?us-ascii?Q?LK8I5rk25ebzWTpK47TPoGcW4zlPpOi0XL9gp7u/g5U/jaGH5BfFH9pPrkaA?=
 =?us-ascii?Q?4pDpewiDLzJ472obcZTqw1rujqHgaqR92miG5UPHKPhmfxXesvjfq5SmV1p9?=
 =?us-ascii?Q?xlIC08i153tPJmKcD0pRfEk4gPOtH7T0DTsqHn7XCIciB17Si7FQdYVghQcp?=
 =?us-ascii?Q?CZrjrrOmBHXbpc8rb+lZRY7jtZ5L3G0rgzEfKOzogCRNMPQXy3yO/mMjt7wp?=
 =?us-ascii?Q?seV8raidgXFolLDeMRN/Qw4cHodZA5rQPoyoARp1vkHq8nyKRBbiikaeUq9D?=
 =?us-ascii?Q?Je6sJC/5oumWKxpXBN4ZegOJV9H7Gnh75AvTdyt/engMyHRIazKn2L8r4Xii?=
 =?us-ascii?Q?Fb8D0qJXruXfZ35mhLVN9XBPIRvBxNGu+Lj5mRSnRNaqfvDFOZZ9D8/iFlir?=
 =?us-ascii?Q?U+FuSKoWR03DsrlvB3+Wf9ZUTTWw2ofRr6DwJTSJ3HaFPYlL7RqHS04OPnhA?=
 =?us-ascii?Q?5H80OUz4hBmqA0glwNivZnwy8yZmiHRHLD+eh/XyQmb+x/F+KaEuUNq8HSH3?=
 =?us-ascii?Q?OdfQGWwHEfjqty8OgGb3GuMJmEsvrzMonRnlIAMTbOYtuC0p+sPJA3t0bJ/H?=
 =?us-ascii?Q?zHxhFIR0QGCon/rjBp+FuflEIWgCos67oup7unQK/RkzZA/d0JPNB+KIfUgA?=
 =?us-ascii?Q?Pf+3D2IigTUF+ew+MGAk06U/LJSRl3nHDeqYTWKDRzH0upuTywW6Tzvb7EiS?=
 =?us-ascii?Q?+OEcrx/vZh/i2Aro/i4yOvfv?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a95d530-6d09-4f1a-89bd-08d8ef06a3ab
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 20:51:46.9427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yAuxWK4XhqUQFGMu2Cy0g16CQw0xSej8ZxesbRndMpN6z3MhCrxygBabu9BzQCa5KarEXuEuO8z4SairZEUSszqIX59GNj4KHfxUyZtTm2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5447
Received-SPF: pass client-ip=40.107.21.116;
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

Here is part II of 64bit block-layer, when part I already landed
 ([PATCH v4 00/16] 64bit block-layer: part I
  <20201211183934.169161-1-vsementsov@virtuozzo.com>)

This is called v4 too, because it follows old
 ([PATCH v3 00/17] 64bit block-layer
  <20200430111033.29980-1-vsementsov@virtuozzo.com>)

Make patchew consider the old series obsolete:
Supersedes: <20200430111033.29980-1-vsementsov@virtuozzo.com>
 (still actually, it is split into parts. And one more part that will
  update blk layer is still needed.)

The old series is so old that I don't want to compare :) I've changed a
lot of things and new patches added.

part II aims to update block drivers to int64_t.

I remind that main aim of this update of the whole block-layer to 64bit
is to implement 64bit write-zeroes NBD request.

Vladimir Sementsov-Ogievskiy (11):
  block/io: bring request check to bdrv_co_{read,write}v_vmstate
  qcow2: check request on vmstate save/load path
  block: use int64_t instead of uint64_t in driver read handlers
  block: use int64_t instead of uint64_t in driver write handlers
  block: use int64_t instead of uint64_t in copy_range driver handlers
  block: make BlockLimits::max_pwrite_zeroes 64bit
  block: use int64_t instead of int in driver write_zeroes handlers
  block/io: allow 64bit write-zeroes requests
  block: make BlockLimits::max_pdiscard 64bit
  block: use int64_t instead of int in driver discard handlers
  block/io: allow 64bit discard requests

 include/block/block_int.h        | 62 ++++++++++++++--------------
 block/backup-top.c               | 14 +++----
 block/blkdebug.c                 | 12 +++---
 block/blklogwrites.c             | 16 ++++----
 block/blkreplay.c                |  8 ++--
 block/blkverify.c                |  8 ++--
 block/bochs.c                    |  4 +-
 block/cloop.c                    |  4 +-
 block/commit.c                   |  2 +-
 block/copy-on-read.c             | 19 +++++----
 block/crypto.c                   |  8 ++--
 block/curl.c                     |  3 +-
 block/dmg.c                      |  4 +-
 block/file-posix.c               | 35 ++++++++--------
 block/file-win32.c               |  8 ++--
 block/filter-compress.c          | 15 +++----
 block/gluster.c                  | 13 +++---
 block/io.c                       | 44 +++++++++++++++-----
 block/iscsi.c                    | 53 ++++++++++++++----------
 block/mirror.c                   |  8 ++--
 block/nbd.c                      | 22 ++++++----
 block/nfs.c                      | 12 +++---
 block/null.c                     | 18 ++++----
 block/nvme.c                     | 47 +++++++++++++++++----
 block/preallocate.c              | 14 +++----
 block/qcow.c                     | 16 ++++----
 block/qcow2-cluster.c            | 14 ++++++-
 block/qcow2.c                    | 70 +++++++++++++++++++++++---------
 block/qed.c                      |  9 +++-
 block/quorum.c                   | 11 ++---
 block/raw-format.c               | 36 ++++++++--------
 block/rbd.c                      | 10 +++--
 block/sheepdog.c                 | 15 ++++++-
 block/throttle.c                 | 18 ++++----
 block/vdi.c                      |  8 ++--
 block/vmdk.c                     | 14 +++----
 block/vpc.c                      |  8 ++--
 block/vvfat.c                    | 12 +++---
 tests/unit/test-bdrv-drain.c     | 16 ++++----
 tests/unit/test-block-iothread.c | 21 +++++++---
 block/trace-events               | 10 ++---
 41 files changed, 451 insertions(+), 290 deletions(-)

-- 
2.29.2


