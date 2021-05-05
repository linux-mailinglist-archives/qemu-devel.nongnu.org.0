Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D22A373D02
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 16:05:51 +0200 (CEST)
Received: from localhost ([::1]:47952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leI9u-0007p2-65
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 10:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leI3K-00030D-JS; Wed, 05 May 2021 09:59:02 -0400
Received: from mail-db8eur05on2103.outbound.protection.outlook.com
 ([40.107.20.103]:55905 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leI3H-0005oK-JP; Wed, 05 May 2021 09:59:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evk+757OElaFf0xQCVHbbFP8WKMKyR77lObhLjpIB06n/C0l3Lo+zu8SA2VhScVx+eskqmbxyehDHxCHDdcp565qEWbx/4ImOBq5WBzrkj+YBTJx4K+GUegiSDbBz7Uzk15UCU03HboJRS+eXvBuwc8J6YT65iau3rIopPQ+jbL4hkqbLXw+zhvBAEqjb75JGz+nG1434KldkECW+lHPMi2+KSqcA86ncr1vPSJkMxRYcwktfzd7zhQNTDdooNiiCGqdSVOAsILZRFQRCZD6wRkqvv2LeTYaR3Cw8cjd1pN7OCg1bKYwwpnsfWQBIDpBkyIqJRxDKoiAW7/5om37hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GeSmp9IdnS99SxoqHutwshzeQfNsboNYpjAzxOkGkGA=;
 b=REcllEgqxnez15MrLIIxCXiTQNQ/HMupboilY6OWOFSsWr12gZPdx8eXZvLe7vFXcTsJmtM9wKoW68quRns5qbXAm0vG5X207DHSh1meg4SS9y5STMzlzAPVIzDyeYhYA28Cka1oDUXZBzyM3BsfVmEtLO54VSaKek72tJr5ZAcqdubOOgI2OV87dt+sA4c1LUUDM26Dqv3R2H6GNlWdC8bshqc4F5MwdaQzEdVxqhs6EuYehogCe7EQQMniOoPJpTwnSKr74fptfOnBGnVfftjjW5eLhSpZZzJIh+p930MwIzj1EUdf5HWvD1+D8Z6pveShGjfqSCEUgGcCo/X7pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GeSmp9IdnS99SxoqHutwshzeQfNsboNYpjAzxOkGkGA=;
 b=W9Z90SkbxsXieduPGnQJ3ySC0wmh+ceP1j1qpgmdVc11JgA0evKaDBprWyGok9i4xjR7B5PT4PgCJeJIEAbCBB+AUMEC1W5wRVj+f5jblK19MJSie7Ywkmr5qzDDSqGoAOVO+GR7/FKDVM0sdEKxgjr/80VLi5S5zFGDhoXTkmY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1780.eurprd08.prod.outlook.com (2603:10a6:203:39::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Wed, 5 May
 2021 13:58:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 13:58:56 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, libvir-list@redhat.com,
 jsnow@redhat.com, vsementsov@virtuozzo.com, eblake@redhat.com,
 xiechanglong.d@gmail.com, wencongyang2@huawei.com,
 nshirokovskiy@virtuozzo.com, pkrempa@redhat.com, den@openvz.org,
 yur@virtuozzo.com, dim@virtuozzo.com, berrange@redhat.com,
 kchamart@redhat.com
Subject: [PATCH v2 3/3] qapi: deprecate drive-backup
Date: Wed,  5 May 2021 16:58:03 +0300
Message-Id: <20210505135803.67896-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210505135803.67896-1-vsementsov@virtuozzo.com>
References: <20210505135803.67896-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: ZR0P278CA0150.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.236) by
 ZR0P278CA0150.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:41::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Wed, 5 May 2021 13:58:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40076bc1-f182-48c6-75ba-08d90fcdeca8
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1780:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1780185C4C0B519E5F2945EDC1599@AM5PR0801MB1780.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pdkJrDiCBPMPL4fpW3Pl8aXlPJnJPnjaoK4w9wFTzDU4Hny/Dv6nBaEfOp1O4502Xctm82D6/Ad+0LyPdGM3Y32K5y8VlilrsfWTXNxliMZo8Df4/cmxKTJq1A44qQq7eOtSYwhPws9HHLY6aRmxS3eMZw133yxp50xpX+XgTVGC6aeo77kNQR4xMr8pHzkfuzjY5+lPdw6dB7WDDqc/YYx/IQ4AjuVoa20V4ho35J8qgFX6axG7chhydEbp4b1XROpWzRlDSMthHDziq+HeuwedOqy/HgGzpmSenVJ5CtoesiUQxr8UXbdnuEqj/gdzzq/bgZTWvhB+YByLO/G+h8nSuCyPSnWHRsYkFvJPmTo2yGvJk4nTgRxyCbWSklHpNnLNFMyLNBdSCz/jVtccCcxct/COELWwLpwnyYaqF2yAHfORlC5xxChs5tm3l9eDyyBkMhrnszpjpyWw5YD+4usfXKVxL2v/NFaqt2FQhzpEFdPc/15GG1ZOj73pylhCAGXjjrM8CJDpyBy6frp0SGEIplw+XoSFGemGnKDkXJmez3bffq5jLmoDDNMSYcQhKgDI+0knatfMigND1zJ1QOEAEX0sxO153Bvq7BS4QzrnuOim1bWmsKItKnDGJkhzbYXi1556f+LFugHURZfojiwJ/PiuodL/niT+LltzeG4OMGy4+zwk3GOQCvQOUm0L
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(39830400003)(366004)(376002)(186003)(38100700002)(2906002)(26005)(1076003)(16526019)(6666004)(7416002)(8676002)(956004)(86362001)(38350700002)(36756003)(316002)(8936002)(2616005)(4326008)(5660300002)(83380400001)(6916009)(6486002)(478600001)(66946007)(6506007)(6512007)(66556008)(66476007)(52116002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?XGTLVi0k9J7v/7HxFL4jwOQKAyWmOlh815ts4IW2jNXX2XbswwOEXKB0xKrz?=
 =?us-ascii?Q?J/UOLAnxH8TPaL/y+bOf2y5+myHVTUfguDfB5tP/LlrBc/Zh/bG0QMvQ+6FB?=
 =?us-ascii?Q?AW66Bgp+7Z6qcnlWDCohwwTQMOF+ixyARFxOJnx/BzutQiuZwl03GXOA5Fdk?=
 =?us-ascii?Q?XZpSj81hlBoNK19mCF0Agk66nILGptjLFzVpogD6rGOjSD6oDdCF3CRXvqME?=
 =?us-ascii?Q?6NHbwoSL2iSHKxQX9Rbnx4WHIRRcNuouan780ufDWxOzhsDzXwdCn7tUKwSA?=
 =?us-ascii?Q?CtBdFchNCb9R4BidrpKLB+QAYk59eN/X8Z32Davqa2jQyPnR2d4p/c8aRJsu?=
 =?us-ascii?Q?BsZuh+8jU7ZlvTdxeWVeAQ1MeYFAfab3hfnVhvTxfdFzijbJ+joQBdxJ1BNj?=
 =?us-ascii?Q?S0//pAVXbR52RxD2ZviyENO05Cnxjs9HPhYOHvkjZZkWPTg7UHm7m7qhhj88?=
 =?us-ascii?Q?DTWWUSRtY9my73OfX1hVMWxZ9cJ1xqCp3aYv9RaEpzmV/qdE7d1GPi6koGXw?=
 =?us-ascii?Q?b5Ch8Ika1o/u8Xu6VAPEu/WADa72qxqiJKE0Yh74dvJqZMuzVsap/83MB3bg?=
 =?us-ascii?Q?iuvY22r8SohPBT+ND5D3tkorGnPx/nVpizwBYbrrqh33WzI8q0hF8Fc+8tj/?=
 =?us-ascii?Q?k2nl8uYq0M/qPNSdraBHA2uVJxf7z9KZNe5mIYujLUmAy164/++osh2sGQEg?=
 =?us-ascii?Q?+6kP+zCwGViaLXK1qXW8BBfzxv23r5C7n214tCQ8XfsxZRKUIv7CiE+sOiDl?=
 =?us-ascii?Q?DDqckbBxz8m+mA/fztaZRKhrFmrr6BXF+7c1wqXkrI614XuoGwl1e3Wi8TXk?=
 =?us-ascii?Q?VkdS2t7WUzYL8tlaMDIOJAbqfwdJdpk+zePLBvjzMsT8FkKkYldU6ntdIkiQ?=
 =?us-ascii?Q?SIqItRlmhxyfvldmx5AEctGZTU829u7LtQ2Y3aJYtR/ZwRmSz4/Rm6XanNzn?=
 =?us-ascii?Q?/PZ4vPWwj9kwhpz+MDBEDW1a1oaEio1w32pRw0CYA31znyl/U5l4XYcGde/k?=
 =?us-ascii?Q?Pnk4ypr0UVbRARkjcK0jThUtO9tq9CNPfEAc4GfQE6spc2u0m5bkKqqi3E38?=
 =?us-ascii?Q?lH7SJFwlIErewRBFfYRIz9QsEh+p0flogzjt/e0v2pDPQgSJh8xDkpc4H5Sz?=
 =?us-ascii?Q?ZG4yecHmDuDfbVb5BBMhvQ0Ntr/kakRXiaus7xQIAKb0tKINLSQiI86Su5C7?=
 =?us-ascii?Q?4Ney150bW4RmcsPYcg14HegWbPV3ah9/xL0OKy9+UpR0lE3J15S45YSIPq1K?=
 =?us-ascii?Q?qox3zeQi2tzQGi1SEsvxUNB1vrRLicZjdOhLW5AqMQbFiEE8P/pziJwGsvZs?=
 =?us-ascii?Q?fTzCHu0Vdv+gON+pfrls/GeA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40076bc1-f182-48c6-75ba-08d90fcdeca8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 13:58:56.4145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xcmPBAZaTv1MvHQLvIa3QKC+l09ik/WgNjaczBk3cXV/BGItTYXqPox2jQcYBUa4mfuYjNWnKJQu1GieXTj5V6mYz8V2gVna2sr1AL3GLsU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1780
Received-SPF: pass client-ip=40.107.20.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

Modern way is using blockdev-add + blockdev-backup, which provides a
lot more control on how target is opened.

As example of drive-backup problems consider the following:

User of drive-backup expects that target will be opened in the same
cache and aio mode as source. Corresponding logic is in
drive_backup_prepare(), where we take bs->open_flags of source.

It works rather bad if source was added by blockdev-add. Assume source
is qcow2 image. On blockdev-add we should specify aio and cache options
for file child of qcow2 node. What happens next:

drive_backup_prepare() looks at bs->open_flags of qcow2 source node.
But there no BDRV_O_NOCAHE neither BDRV_O_NATIVE_AIO: BDRV_O_NOCAHE is
places in bs->file->bs->open_flags, and BDRV_O_NATIVE_AIO is nowhere,
as file-posix parse options and simply set s->use_linux_aio.

The documentation is updated in a minimal way, so that drive-backup is
noted only as a deprecated command, and blockdev-backup used in most of
places.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

TODO: We also need to deprecate drive-backup transaction action..
But union members in QAPI doesn't support 'deprecated' feature. I tried
to dig a bit, but failed :/ Markus, could you please help with it? At
least by advice?

 docs/interop/live-block-operations.rst | 47 +++++++++++++++++---------
 docs/system/deprecated.rst             | 11 ++++++
 qapi/block-core.json                   |  5 ++-
 3 files changed, 46 insertions(+), 17 deletions(-)

diff --git a/docs/interop/live-block-operations.rst b/docs/interop/live-block-operations.rst
index 1073b930dc..f71f79ae2a 100644
--- a/docs/interop/live-block-operations.rst
+++ b/docs/interop/live-block-operations.rst
@@ -116,8 +116,8 @@ QEMU block layer supports.
 (3) ``drive-mirror`` (and ``blockdev-mirror``): Synchronize a running
     disk to another image.
 
-(4) ``drive-backup`` (and ``blockdev-backup``): Point-in-time (live) copy
-    of a block device to a destination.
+(4) ``blockdev-backup`` (and deprecated ``drive-backup``): Point-in-time
+    (live) copy of a block device to a destination.
 
 
 .. _`Interacting with a QEMU instance`:
@@ -553,13 +553,14 @@ Currently, there are four different kinds:
 
 (3) ``none`` -- Synchronize only the new writes from this point on.
 
-    .. note:: In the case of ``drive-backup`` (or ``blockdev-backup``),
-              the behavior of ``none`` synchronization mode is different.
-              Normally, a ``backup`` job consists of two parts: Anything
-              that is overwritten by the guest is first copied out to
-              the backup, and in the background the whole image is
-              copied from start to end. With ``sync=none``, it's only
-              the first part.
+    .. note:: In the case of ``blockdev-backup`` (or deprecated
+              ``drive-backup``), the behavior of ``none``
+              synchronization mode is different.  Normally, a
+              ``backup`` job consists of two parts: Anything that is
+              overwritten by the guest is first copied out to the
+              backup, and in the background the whole image is copied
+              from start to end. With ``sync=none``, it's only the
+              first part.
 
 (4) ``incremental`` -- Synchronize content that is described by the
     dirty bitmap
@@ -924,19 +925,22 @@ Shutdown the guest, by issuing the ``quit`` QMP command::
     }
 
 
-Live disk backup --- ``drive-backup`` and ``blockdev-backup``
--------------------------------------------------------------
+Live disk backup --- ``blockdev-backup`` and deprecated``drive-backup``
+-----------------------------------------------------------------------
 
-The ``drive-backup`` (and its newer equivalent ``blockdev-backup``) allows
+The ``blockdev-backup`` (and deprecated ``drive-backup``) allows
 you to create a point-in-time snapshot.
 
-In this case, the point-in-time is when you *start* the ``drive-backup``
-(or its newer equivalent ``blockdev-backup``) command.
+In this case, the point-in-time is when you *start* the
+``blockdev-backup`` (or deprecated ``drive-backup``) command.
 
 
 QMP invocation for ``drive-backup``
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
+Note that ``drive-backup`` command is deprecated since Qemu 6.1 and
+will be removed in future.
+
 Yet again, starting afresh with our example disk image chain::
 
     [A] <-- [B] <-- [C] <-- [D]
@@ -961,11 +965,22 @@ will be issued, indicating the live block device job operation has
 completed, and no further action is required.
 
 
+Moving from deprecated ``drive-backup`` to newer ``blockdev-backup``
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+``blockdev-backup`` differs in a way of specifying backup target.
+With ``blockdev-backup`` you can't specify filename as a target.
+Instead you use node-name of existing block node, which you may add
+by ``blockdev-add`` or ``blockdev-create`` commands. Correspondingly,
+``blockdev-backup`` doesn't have ``mode`` and  ``format`` arguments
+which don't apply to existing block node. See following sections for
+details and examples.
+
+
 Notes on ``blockdev-backup``
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-The ``blockdev-backup`` command is equivalent in functionality to
-``drive-backup``, except that it operates at node-level in a Block Driver
+The ``blockdev-backup`` operates at node-level in a Block Driver
 State (BDS) graph.
 
 E.g. the sequence of actions to create a point-in-time backup
diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 80cae86252..676d72a1ed 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -186,6 +186,17 @@ Use the more generic commands ``block-export-add`` and ``block-export-del``
 instead.  As part of this deprecation, where ``nbd-server-add`` used a
 single ``bitmap``, the new ``block-export-add`` uses a list of ``bitmaps``.
 
+``drive-backup`` (since 6.1)
+''''''''''''''''''''''''''''
+
+Use ``blockdev-backup`` in pair with ``blockdev-add`` instead.
+This change primarily separates the creation/opening process of the backup
+target with explicit, separate steps. ``blockdev-backup`` uses mostly the
+same arguments as ``drive-backup``, except the ``format`` and ``mode``
+options are removed in favor of using explicit ``blockdev-create`` and
+``blockdev-add`` calls. See :doc:`/interop/live-block-operations` for
+details.
+
 System accelerators
 -------------------
 
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 6d227924d0..8e2c6e1622 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1642,6 +1642,9 @@
 # The operation can be stopped before it has completed using the
 # block-job-cancel command.
 #
+# Features:
+# @deprecated: This command is deprecated. Use @blockdev-backup instead.
+#
 # Returns: - nothing on success
 #          - If @device is not a valid block device, GenericError
 #
@@ -1657,7 +1660,7 @@
 #
 ##
 { 'command': 'drive-backup', 'boxed': true,
-  'data': 'DriveBackup' }
+  'data': 'DriveBackup', 'features': ['deprecated'] }
 
 ##
 # @blockdev-backup:
-- 
2.29.2


