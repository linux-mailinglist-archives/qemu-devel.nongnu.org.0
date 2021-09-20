Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B094113DC
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 13:58:27 +0200 (CEST)
Received: from localhost ([::1]:48776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSHwI-0001l7-9S
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 07:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSHu6-0007Q5-PI; Mon, 20 Sep 2021 07:56:10 -0400
Received: from mail-am6eur05on2112.outbound.protection.outlook.com
 ([40.107.22.112]:8080 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSHu3-0005GQ-Cw; Mon, 20 Sep 2021 07:56:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJJx2N+FTV7hQPyES5BTABldxS+Rx3mreL//RvYNRrxDqlA6Hpff0G6ZRQiqEdL7eLVmwYH9b6THnuZgqLbS/sWS/9tMogxjS+ZsBhYLxHCKW7gkAT6SraUHWY/VeJ3THosEmobBzPL4XD7Sb3vuz0XajUSqeva5y5t8y4YyLLn2QNfT12QT5zDGknZPxexRs26zCxquRE9G/nETYZX4EQy973IB1TsWgzCSYrHFBrKJS7+p95i0dWK4AGtKpguHk+DbGgqfqM7cXtzp+YDLF6GhFu1MY15WsKWKLJZNqM8eAdj/UWLzwO73hM78/Mdl+pDtAw3HACevIFRn8UB3gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=EoXEbqm0QHhOitVAKrW7roHS7PU7H5OiGGsuNBPMapY=;
 b=OGHqy3J9+B+zdPnQd6ZPzaqZD+Cja6U7FByJnhG3IwVh9uYwPsZVzw25dpdshx6BOmK2ppbfEcPKEikTuXCjK/EEtMZS0Lsn5zggBW/MEOafEHn7tazDpshWA5bjXwc+T2hm3vFFy4hgL/bdwIHU6hWYqKfHWZjP1WO26Uw1AJHk8hZMCcXlWBuj5KYD8kOyHc7/85iN/Tc96z9Qvei/ysTCBSItBu2sKsgFL4JnkTLl6C+yz5YL2vctNYOtWeerWMhVfIvZ5tyMK0VkA14G912ywLLqXKt1jUY1688q7oEsW98SYOokoJaKRfQpwyfoDLh6z65njj5DFIpD07rB+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EoXEbqm0QHhOitVAKrW7roHS7PU7H5OiGGsuNBPMapY=;
 b=U9Ol68Og7DYhiAuzAreMb57k522gTbAtawVvHt8kqe1ah7IQ/zS+lx50hdKsp8YWumsovj9fhIlp61d+ioQhnyWNMGqdcU3CUvo0TCY2X5Bgc/q3tLiTTz2MvaQFbvCpUqgRvfH23DixTqu2DLKs7IFKAXStaXmgZebTxd6VFl0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6631.eurprd08.prod.outlook.com (2603:10a6:20b:339::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Mon, 20 Sep
 2021 11:55:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 11:55:55 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com
Subject: [PATCH 0/5] Fix not white-listed copy-before-write
Date: Mon, 20 Sep 2021 14:55:33 +0300
Message-Id: <20210920115538.264372-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR09CA0082.eurprd09.prod.outlook.com
 (2603:10a6:7:3d::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.205) by
 HE1PR09CA0082.eurprd09.prod.outlook.com (2603:10a6:7:3d::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Mon, 20 Sep 2021 11:55:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4233fc37-363c-4487-9863-08d97c2d9a5c
X-MS-TrafficTypeDiagnostic: AS8PR08MB6631:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6631521546A539181BF3E424C1A09@AS8PR08MB6631.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2iFZacX9MU8FA6JozKnU4MLgomCFUO4N+PCYwDzGMAmGLvBjFAnpDG9lfefnglD/pMKvv32HLyhN3OKQtVcAJGWTt1trtOlQG9klWXqMSeMjAZyTgRBsDUiOv89+k7oq8GNDLkhCc4gWk0vCc5psNgQtJKjttf5STbkkNVbRpjvcxe8aGR2z0KGtW01FKcL99lDrrRkkWoihq2T1QlKE3/5YkltMcEw9gaeZulaSJikfl/N5+5LSdW8VEDWXK3IH8nZRAaOtRll8W4t6drS5aUBJYBEqEpYPamn01083RBjxtuFrrB6DougZmOwK29QF9TkTReNNBvdDFNpCu4kIFZlXW/gbmcPYP7YPOIvP5+GRsq8x+G3OphXBXdpHGdAHWiq2pf3C+TQMdAFPLN5HiwSDto9WsoCUAMTPSwqHHIb+cJ7undW0x/DC5OvPOSYsdLUbf+hcuGALiqPiHY+VkqEbuxPjK/343vHrPjy1rxexxiY+PB0Wp+HPj7rHEgGHJcGb1SNZfVEFALmdS2I0YeioqYAIpcGSQUIoR5fy3wmSTEw6F7w4Z43kzsERag+wQgncCrHOr9KhjnnY0ajIADKT8aXgdshUI102ZRkWso116mjXraYlwbpHO+DCdsxjXvPX8STtqekAMyVwQM5H5utX99aGBeHLj17qeiHw3qQnytAw5+loOMuZ+OO6r2q1TDtS9W+47+RwnvSOKMIf4NVs7gt+Aj1l13GlW/Y32HuFsA7HSKVOTPUQZtHqInnL4Hw2WpCrLmmb847l9cL10LNPZd3sjjjUhwg9UvNyADA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(396003)(136003)(346002)(366004)(2616005)(956004)(66476007)(478600001)(66946007)(4326008)(83380400001)(66556008)(36756003)(107886003)(8676002)(8936002)(6506007)(316002)(6666004)(5660300002)(2906002)(52116002)(1076003)(38100700002)(86362001)(186003)(966005)(38350700002)(6486002)(6916009)(6512007)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iKfoGN/C1OSlL2hWibN2qzEvlwRZ/jYmeVAUkPPSmxyXjLoGSc+D33l9YqmT?=
 =?us-ascii?Q?rum6+OPid0bx35C9CrSCh6AyqOstSL2aOqCvF35JC8mthb3aPeLeeQU8bUHG?=
 =?us-ascii?Q?7KtaO/hihA4HR3j5u3FvBpqHfufBGpU5wytRKJE5sZzUZSRupyG1sngkWaUT?=
 =?us-ascii?Q?jZ5LPE8mG/wCEO27OGMXj78Am4ENHiYVmA0al5/dpRZWz7MdToiCePZGhD16?=
 =?us-ascii?Q?2i9HQuklrZaLllCTlxLGZ2EmNr+v8/v9aL2T4IIlfUzDGqpMKbH9xrOkBkWx?=
 =?us-ascii?Q?yGEb/aTyMoGjWkADu3rH1DRnxUL5WKulXySCFEHMAKE11aLRwQnV4vnvWujh?=
 =?us-ascii?Q?0falgQeJcszBkVwZgpD44Wjd9bzeEvGdI1raDImlK/7sKDJWwdIpzurJ+5Dq?=
 =?us-ascii?Q?v3+7ECgWKwoAG0SKgQRVFFlIIY9+Oa8RohuUwUHADsKIf/Kl1DxoeqL2SNxj?=
 =?us-ascii?Q?1Uzs7NapBXniUToIRsrXIE5YMUVM+j/lfTsgHlH/LjDESAfvxnChHkVgWT+w?=
 =?us-ascii?Q?id5gX8oZ+lK3qToV2QzFA7ODV0G3f8yJvM/NNxhfDzZvHSwilJ/wjInZd4Qf?=
 =?us-ascii?Q?oQeGwEcjrvZOwoQ1MsAjmGegyRJyeyt8I8LCOm9b5RktzgsnI7NxZda9TN6z?=
 =?us-ascii?Q?0IFbtAxxAWrQ/M4M/aaE84EXVZUfxYLEK3viEcYNOd05v+436NluPz+aRobT?=
 =?us-ascii?Q?uHPQ14hw9zNiPHVdQi2pRvdEWPosJuT2RkuH+W6KcGnJRhEPPBsvE1jLO930?=
 =?us-ascii?Q?vjyV5+oeKssRjqwXnumtVLGIYorB0yANj51iNdxN0/0sO6MK+AfPH6rZKSfi?=
 =?us-ascii?Q?FhRQUfSWHT3hPjfyNWnVqB1SI3TL1A5kQ5SMOsx1pw+/m9+Uj88ZAJ1DzQJa?=
 =?us-ascii?Q?krP4bQ/t7HKv5f08AgOohtIJ+bWLHOhXm3/jgEDMTCzCVZeg29/6+38c7d9q?=
 =?us-ascii?Q?B1QIendF7VejSqLBgM9fDJZE6g7fw9hRmKn7U5h06ltUI/71mYt+d83nGSkG?=
 =?us-ascii?Q?wqaVgt2ypSjEUMgm2/DbE6H1mzrylSJiAK2f4D9FfLc9dVYJVyrG9Hs3M+v2?=
 =?us-ascii?Q?6NgyKmmPiS3Y+59XG+a5gEv7Z5ihS9zQ5WLnCByOXsnl29IuhOzTjfNFwS3L?=
 =?us-ascii?Q?+C9MZritqHmTS+8fRv1Ko357sTgauA4zWivZTZjEw+we7eJUFDmupmT29xg0?=
 =?us-ascii?Q?QD2SSgYbpnWgSMWhMLnSMWkjAVYYKTzAE2SwjH9zbGvYSm7kXOYsA2rxL5ln?=
 =?us-ascii?Q?1vspYSFG0FNKzUMWA+wNH1Ko+AAyqIJYAnLRDblxgY2VlFxnvf06BxSfUP86?=
 =?us-ascii?Q?MFzXHykLwvdObZzY1ItR2tMQ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4233fc37-363c-4487-9863-08d97c2d9a5c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 11:55:55.7192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yXNtm2+l44ePUA5m9EgiiDM1e92B6iHjEYei8nh6nrJ3O506GJugUPN/T2SlR/M0uXr0xsBhxbJaCr/l+2Dn6tonAMvmhjTsh7bwkSRZri0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6631
Received-SPF: pass client-ip=40.107.22.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

As reported in https://bugzilla.redhat.com/show_bug.cgi?id=2004812
backup don't work when copy-before-write is not white-listed.

Yes, we do need copy-before-write filter for backup to work (like we
always use copy-on-read filter in block-stream).
The problem is that in bdrv_insert_node() (called to insert filters
internally) we use bdrv_open(), which does a lot of things we don't need
for internal node creation and among them check the white-list.

Backup job should of course work when copy-before-write is not
white-listed. As well, block-stream should work with not-white-listed
copy-on-read. White-list is for user, not for internal implementation.

Following Kevin's suggestion fix the problem by implementing a version
of bdrv_new_open_driver() that supports QDict of options, and use it
instead of bdrv_open().

Vladimir Sementsov-Ogievskiy (5):
  block: implement bdrv_new_open_driver_opts()
  block: bdrv_insert_node(): fix and improve error handling
  block: bdrv_insert_node(): doc and style
  block: bdrv_insert_node(): don't use bdrv_open()
  iotests/image-fleecing: declare requirement of copy-before-write

 include/block/block.h                   |  4 ++
 block.c                                 | 77 ++++++++++++++++++++-----
 tests/qemu-iotests/tests/image-fleecing |  1 +
 3 files changed, 68 insertions(+), 14 deletions(-)

-- 
2.29.2


