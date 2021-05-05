Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 133793735DF
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:54:43 +0200 (CEST)
Received: from localhost ([::1]:50950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leCMk-0002AC-3o
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leCIp-0005Vr-OU; Wed, 05 May 2021 03:50:39 -0400
Received: from mail-eopbgr80109.outbound.protection.outlook.com
 ([40.107.8.109]:41697 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leCIm-0002WS-1f; Wed, 05 May 2021 03:50:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BN7Q5NW055nlU6iyelPxJROkd4+bVOT+ex8fF324/2NlYCBkQ+IoOfPqM32HLLVZdeY25yhEqoPkhIpMDhsbjJdXi6Hw3VnpZ8VfxvlY5mQkqt3QrGrmqEuQ8jB6R0irEa+4yEaCCfu5BzzFaY3NsfRo2POWlwG/iDy/rAf2JHHba0TWNYDiMhAsQMzIoOufaEcEq60u96cHRpC6CGCFZWVlW04x/0HW2kxytX6JdHkJ5w3tYTndv9vKratSa8sg3nN6ipefITYI0c0+Wv81eYrNGLReqsP6j9hSOoqtNUb9DsqfkIE3v9Fnhkgwj6GoV6eR3cpesqX9ele77+Uo2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u7NdcYo4w6lLSC50j+iITY1+6MTyPOjkBp7L6iCU4yQ=;
 b=BeofKYeXxZkHkCmtbmnSEktCY7qNBx21G7SClmuapKvOR6363YBjDr796Ee9QEotUqbQBRzd5CEgvSvCZS0WhtDuBRMBpakxWcAVV6w6NyzbmlA+Ftn8ksBtshSUDIK2GKnX1cW4q30F3dOypj5r7zpqtAu3yw9usbhXrliqQd/HrvcHTg2A5LyID2vh7otOY3Nuq4mHy9ytVNFKrPrNAf7/NiSPT/aCBFvGACmOrv1bRskQh6V9slxaH1l1DIWld9R7F2F4ZK3vDKoI0qy+tLwxTztKbUpsCXDDbyC8QgOAxEzWik8bBU+/CjjyJyG9dsqVveAr6e0cLI14KyTo2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u7NdcYo4w6lLSC50j+iITY1+6MTyPOjkBp7L6iCU4yQ=;
 b=t6kVxKoQp5EL8k9Zi8zMqQSOMa2QjNKVOSla8dTdSllf3Sg63SaJgQvpP8qEq080p+FKoY7/KgqnPBkJsrS6g7FQMessYKAaPwpfHvcmZjJANwutdgNNTJaieB8Ylu+qsSYgMvORs8FO58ycpP/p6xRO7A3wdB+w54EmfFmmnLs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6839.eurprd08.prod.outlook.com (2603:10a6:20b:352::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.39; Wed, 5 May
 2021 07:50:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 07:50:28 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, stefanha@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, vsementsov@virtuozzo.com,
 John Snow <jsnow@redhat.com>, Ari Sundholm <ari@tuxera.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Peter Lieven <pl@kamp.de>, Fam Zheng <fam@euphon.net>,
 Alberto Garcia <berto@igalia.com>, Jason Dillaman <dillaman@redhat.com>
Subject: [PATCH v5 03/11] block: use int64_t instead of uint64_t in driver
 read handlers
Date: Wed,  5 May 2021 10:49:53 +0300
Message-Id: <20210505075001.45041-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210505075001.45041-1-vsementsov@virtuozzo.com>
References: <20210505075001.45041-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: HE1P195CA0024.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::34)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.236) by
 HE1P195CA0024.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Wed, 5 May 2021 07:50:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3cefccf7-451c-4f28-1635-08d90f9a733d
X-MS-TrafficTypeDiagnostic: AS8PR08MB6839:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB68391D50D1101CD96309A1AFC1599@AS8PR08MB6839.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:390;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EjQdBvDDBhYl1QX/PqsRuLvk//1JnqC4vqCHCP3gGs1th77ij1HAgNXdSR+crPDS7XcQdEdmkYH+d99gFMnn6xxwp1gmw1k6l4mJnBD2le5faxhmPkVmTKCnYCGCgXdoEd5MIrkDUdo16BLAVHIHFiCFoBF+puyGTjzm2xKwRhT5ulw1gKQH1Jh7aQrprrwpyOAwevc4JEWXfNytNm2ByT6I7GVTybdbzAPmlR74M0TFhBB/T8JuCEt7NTaB9PGKt2Xt8yoCPp8S30hfG2IVVfwrjHZVKrNaS9T00N8Uk0/2fcd1/JrKcL+MHy4E10mMshta2ViA9O8r5wCkLfUXMzLeNoKHk4ubujRi/NBk4LcENzEoo+VLSEFLp16fqRHrxRmQOPOVYpvCx2IgQ6jE0NHKhXijDpQ5KHMee7rqpKRIV4g2DNh6H4cq0uOt5jN+ujvYR3tUwLfxt79GSemo6tJGHTJlVPBqBccNaqulTzs3/jrwQFvFxPjttAikPBDENm3NMPiLGji7MMxofo5uxKu4gHv0emtCPiHDCwMyNrAQbi1OLl8GqyIYv+5ZPICo448gAsHOAWHheRyukK+TB7jBaPUGy4Rg7pTBNmFdPEVRf9OaEG1zZB/+CNV1MO0Vhr24MtHt7hHnzKvGP7lv0wkdYQLi9TD1+vaOC6GenC+f8a1G84gNVY9z/9HYDDRu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(346002)(396003)(366004)(136003)(38350700002)(38100700002)(66946007)(26005)(66556008)(6506007)(66476007)(86362001)(16526019)(30864003)(83380400001)(6666004)(7416002)(54906003)(6916009)(4326008)(36756003)(478600001)(316002)(8676002)(6512007)(2616005)(2906002)(186003)(52116002)(956004)(6486002)(8936002)(5660300002)(1076003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?LbL1MLJpKiwfOoO6suCqWOkRVKMeEIPEe8D07Gf0d/Y5LO0tUoUXH8X28dZD?=
 =?us-ascii?Q?mSR06T0XjQf69DlJayu83+C+YTm7OMXu05sI0sb4jxB6BbbIZtop0J6hoPP4?=
 =?us-ascii?Q?NL+zQTT53UR6VN7H6evcuRFk9WRE8vw44gpugkBM6avN9bJZSdLSMqMenOsF?=
 =?us-ascii?Q?jRL7af7HwoGCefGnsUO5WyavbhkYmxJ3tgpY3kTwCBmn5sDOhvGcwEUpat9F?=
 =?us-ascii?Q?RE9mvxy4Y4Inn3pqLgR3bRc0Hr9nxv4zo9zFpKjdwjoA22xdxvSzjMiuY/WS?=
 =?us-ascii?Q?hjfT99bub+6D39yH9puU0gWY8KMwEEynZU+ereWkwyR4YKeBJWeuduHtx9hY?=
 =?us-ascii?Q?FdL3AmyC24oVGOJJfY6bIcfLsM3ss+6A1n7fsqv83BW5m7nEiUqjBfBbiceG?=
 =?us-ascii?Q?mdD50/G/X6Y7O0WNAMyNtwDTQCSroI3PGQBWWpGpZjbxtvxzvDZr96Vt1wKH?=
 =?us-ascii?Q?EFBaOphgdab8UrvTH5XpNxOO2cwhTYhxEZwAS61CUKmlymMEhM5/BvBwmC5f?=
 =?us-ascii?Q?1LPc8xcDzTUwGgthcRK+CO1NgqsZ+5711sWTuGxVFoK0uQ7af4Z1ZT7lvjXW?=
 =?us-ascii?Q?OV5V9Tf+oaP0yI63D5uNv7dPZ8HP+TA8j+rnBtMqjigReGEHhSIGfl+ZwLWW?=
 =?us-ascii?Q?+R417vBlrYfLbZY63MOLlm8miKqFkF1+JACdKndGZT9fnGwPmVKPhn6gzJRk?=
 =?us-ascii?Q?b0mm23SdrqWQJeoxVDxLe3jesFMm5lHsODtY/sXByixjL/AJCpsM6Gx9/NJK?=
 =?us-ascii?Q?PQ2FogWW2pzAWQDD7PQpU6ehw3JfbLfPiTA4lWNBJDN7/FRlSRGNLfr9hL2M?=
 =?us-ascii?Q?+NOH5HR7vXGdfAKi0dlNA7Th8gGUJs+adx5kCGfymreK02Fx1lKNNB6t57Dn?=
 =?us-ascii?Q?YCS1cQKozXCZBNEWJezEyllhEIdH8vQ+je6cAkdggfBFpF00MiwJg3cAF7Ac?=
 =?us-ascii?Q?3vZ2K1o3xEMb3BgYDEZKEehS4Kas+M9OuB78Wq89EfQLhglqBuPIadw4AZoX?=
 =?us-ascii?Q?7aoaTTe7oUJHGL6NRBpNXnD6mcMw0rJBdTDSkT1JbIWPyaBNDr1DqP/SFdgg?=
 =?us-ascii?Q?Kmlx+lsLsxkv/fdqWfxKFqF4i7INNQIyRxRJLZj0+BvXmw0HIO+MuQPUeMVy?=
 =?us-ascii?Q?WvUuc+2x6CGZqMhPuuCpvRM+wnRUoYe80+FnX7scPohxs4uspjrgaYnDetj2?=
 =?us-ascii?Q?kJtp4A9qr7QlZ52jElz/Kkz+VKUCBZ+pvdMRI+BFHhJvghx9NJAwivZKaiz/?=
 =?us-ascii?Q?Iz1AbKlD8BfhyJz8s4ovxtTC9gUFIYCuBNfF5WdPAgtol0m0QYCTZmIidvAq?=
 =?us-ascii?Q?5ZWSEcnTherMdKoNPcxOtzBv?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cefccf7-451c-4f28-1635-08d90f9a733d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 07:50:28.4539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kJ7iP9qmDL9Pd9Xy3aqGWKJvNak6s737wkYV+iHk0FB1aRQBBkS1BrLCx9i1vKNiGSwTy7t9JokR4BUuENlQoSfn9x304c2RYJ4oE/oWBnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6839
Received-SPF: pass client-ip=40.107.8.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

We are going to convert .bdrv_co_preadv_part and .bdrv_co_pwritev_part
to int64_t type for offset and bytes parameters (as it's already done
for generic block/io.c layer).

In qcow2 .bdrv_co_preadv_part is used in some places, so let's add
corresponding checks and assertions.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

block: use int64_t instead of uint64_t in driver read handlers

We are generally moving to int64_t for both offset and bytes parameters
on all io paths.

Main motivation is realization of 64-bit write_zeroes operation for
fast zeroing large disk chunks, up to the whole disk.

We chose signed type, to be consistent with off_t (which is signed) and
with possibility for signed return type (where negative value means
error).

So, convert driver read handlers parameters which are already 64bit to
signed type.

While being here, convert also flags parameter to be BdrvRequestFlags.

Now let's consider all callers. Simple

  git grep '\->bdrv_\(aio\|co\)_preadv\(_part\)\?'

shows that's there three callers of driver function:

 bdrv_driver_preadv() in block/io.c, passes int64_t, checked by
   bdrv_check_qiov_request() to be non-negative.

 qcow2_load_vmstate() does bdrv_check_qiov_request().

 do_perform_cow_read() has uint64_t argument. And a lot of things in
 qcow2 driver are uint64_t, so converting it is big job. But we must
 not work with requests that doesn't satisfy bdrv_check_qiov_request(),
 so let's just assert it here.

Still, the functions may be called directly, not only by drv->...
Let's check:

git grep '\.bdrv_\(aio\|co\)_preadv\(_part\)\?\s*=' | \
awk '{print $4}' | sed 's/,//' | sed 's/&//' | sort | uniq | \
while read func; do git grep "$func(" | \
grep -v "$func(BlockDriverState"; done

The only one such caller:

    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, &data, 1);
    ...
    ret = bdrv_replace_test_co_preadv(bs, 0, 1, &qiov, 0);

in tesTS/unit/test-bdrv-drain.c, and it's OK obviously.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h        | 11 ++++++-----
 block/backup-top.c               |  4 ++--
 block/blkdebug.c                 |  4 ++--
 block/blklogwrites.c             |  4 ++--
 block/blkreplay.c                |  2 +-
 block/blkverify.c                |  4 ++--
 block/bochs.c                    |  4 ++--
 block/cloop.c                    |  4 ++--
 block/commit.c                   |  2 +-
 block/copy-on-read.c             |  4 ++--
 block/crypto.c                   |  4 ++--
 block/curl.c                     |  3 ++-
 block/dmg.c                      |  4 ++--
 block/file-posix.c               |  6 +++---
 block/file-win32.c               |  4 ++--
 block/filter-compress.c          |  4 ++--
 block/mirror.c                   |  2 +-
 block/nbd.c                      |  5 +++--
 block/nfs.c                      |  6 +++---
 block/null.c                     |  9 +++++----
 block/nvme.c                     |  5 +++--
 block/preallocate.c              |  4 ++--
 block/qcow.c                     |  6 +++---
 block/qcow2-cluster.c            | 14 +++++++++++++-
 block/qcow2.c                    |  5 +++--
 block/quorum.c                   |  4 ++--
 block/raw-format.c               | 20 ++++++++++----------
 block/rbd.c                      |  5 +++--
 block/throttle.c                 |  5 +++--
 block/vdi.c                      |  4 ++--
 block/vmdk.c                     |  4 ++--
 block/vpc.c                      |  4 ++--
 block/vvfat.c                    |  4 ++--
 tests/unit/test-bdrv-drain.c     | 16 +++++++++-------
 tests/unit/test-block-iothread.c | 19 ++++++++++++++-----
 35 files changed, 120 insertions(+), 89 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index d2143eb40f..dc08f99e95 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -234,8 +234,8 @@ struct BlockDriver {
 
     /* aio */
     BlockAIOCB *(*bdrv_aio_preadv)(BlockDriverState *bs,
-        uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags,
-        BlockCompletionFunc *cb, void *opaque);
+        int64_t offset, int64_t bytes, QEMUIOVector *qiov,
+        BdrvRequestFlags flags, BlockCompletionFunc *cb, void *opaque);
     BlockAIOCB *(*bdrv_aio_pwritev)(BlockDriverState *bs,
         uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags,
         BlockCompletionFunc *cb, void *opaque);
@@ -264,10 +264,11 @@ struct BlockDriver {
      * The buffer in @qiov may point directly to guest memory.
      */
     int coroutine_fn (*bdrv_co_preadv)(BlockDriverState *bs,
-        uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags);
+        int64_t offset, int64_t bytes, QEMUIOVector *qiov,
+        BdrvRequestFlags flags);
     int coroutine_fn (*bdrv_co_preadv_part)(BlockDriverState *bs,
-        uint64_t offset, uint64_t bytes,
-        QEMUIOVector *qiov, size_t qiov_offset, int flags);
+        int64_t offset, int64_t bytes,
+        QEMUIOVector *qiov, size_t qiov_offset, BdrvRequestFlags flags);
     int coroutine_fn (*bdrv_co_writev)(BlockDriverState *bs,
         int64_t sector_num, int nb_sectors, QEMUIOVector *qiov, int flags);
     /**
diff --git a/block/backup-top.c b/block/backup-top.c
index 425e3778be..fb32ac7b2b 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -41,8 +41,8 @@ typedef struct BDRVBackupTopState {
 } BDRVBackupTopState;
 
 static coroutine_fn int backup_top_co_preadv(
-        BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-        QEMUIOVector *qiov, int flags)
+        BlockDriverState *bs, int64_t offset, int64_t bytes,
+        QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     return bdrv_co_preadv(bs->backing, offset, bytes, qiov, flags);
 }
diff --git a/block/blkdebug.c b/block/blkdebug.c
index 2c0b9b0ee8..b26fecf222 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -614,8 +614,8 @@ static int rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
 }
 
 static int coroutine_fn
-blkdebug_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                   QEMUIOVector *qiov, int flags)
+blkdebug_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                   QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     int err;
 
diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index b7579370a3..de3d4ba2b6 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -301,8 +301,8 @@ static void blk_log_writes_refresh_limits(BlockDriverState *bs, Error **errp)
 }
 
 static int coroutine_fn
-blk_log_writes_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                         QEMUIOVector *qiov, int flags)
+blk_log_writes_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                         QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     return bdrv_co_preadv(bs->file, offset, bytes, qiov, flags);
 }
diff --git a/block/blkreplay.c b/block/blkreplay.c
index 4a247752fd..13ea2166bb 100644
--- a/block/blkreplay.c
+++ b/block/blkreplay.c
@@ -72,7 +72,7 @@ static void block_request_create(uint64_t reqid, BlockDriverState *bs,
 }
 
 static int coroutine_fn blkreplay_co_preadv(BlockDriverState *bs,
-    uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags)
+    int64_t offset, int64_t bytes, QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     uint64_t reqid = blkreplay_next_id();
     int ret = bdrv_co_preadv(bs->file, offset, bytes, qiov, flags);
diff --git a/block/blkverify.c b/block/blkverify.c
index 188d7632fa..5e35744b8a 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -221,8 +221,8 @@ blkverify_co_prwv(BlockDriverState *bs, BlkverifyRequest *r, uint64_t offset,
 }
 
 static int coroutine_fn
-blkverify_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                    QEMUIOVector *qiov, int flags)
+blkverify_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                    QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BlkverifyRequest r;
     QEMUIOVector raw_qiov;
diff --git a/block/bochs.c b/block/bochs.c
index 2f010ab40a..4d68658087 100644
--- a/block/bochs.c
+++ b/block/bochs.c
@@ -238,8 +238,8 @@ static int64_t seek_to_sector(BlockDriverState *bs, int64_t sector_num)
 }
 
 static int coroutine_fn
-bochs_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                QEMUIOVector *qiov, int flags)
+bochs_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVBochsState *s = bs->opaque;
     uint64_t sector_num = offset >> BDRV_SECTOR_BITS;
diff --git a/block/cloop.c b/block/cloop.c
index c99192a57f..b8c6d0eccd 100644
--- a/block/cloop.c
+++ b/block/cloop.c
@@ -245,8 +245,8 @@ static inline int cloop_read_block(BlockDriverState *bs, int block_num)
 }
 
 static int coroutine_fn
-cloop_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                QEMUIOVector *qiov, int flags)
+cloop_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVCloopState *s = bs->opaque;
     uint64_t sector_num = offset >> BDRV_SECTOR_BITS;
diff --git a/block/commit.c b/block/commit.c
index b89bb20b75..d9278d0192 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -212,7 +212,7 @@ static const BlockJobDriver commit_job_driver = {
 };
 
 static int coroutine_fn bdrv_commit_top_preadv(BlockDriverState *bs,
-    uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags)
+    int64_t offset, int64_t bytes, QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     return bdrv_co_preadv(bs->backing, offset, bytes, qiov, flags);
 }
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 9cad9e1b8c..afb2a77b08 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -141,10 +141,10 @@ static int64_t cor_getlength(BlockDriverState *bs)
 
 
 static int coroutine_fn cor_co_preadv_part(BlockDriverState *bs,
-                                           uint64_t offset, uint64_t bytes,
+                                           int64_t offset, int64_t bytes,
                                            QEMUIOVector *qiov,
                                            size_t qiov_offset,
-                                           int flags)
+                                           BdrvRequestFlags flags)
 {
     int64_t n;
     int local_flags;
diff --git a/block/crypto.c b/block/crypto.c
index 1d30fde38e..a732a36d10 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -397,8 +397,8 @@ static int block_crypto_reopen_prepare(BDRVReopenState *state,
 #define BLOCK_CRYPTO_MAX_IO_SIZE (1024 * 1024)
 
 static coroutine_fn int
-block_crypto_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                       QEMUIOVector *qiov, int flags)
+block_crypto_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                       QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BlockCrypto *crypto = bs->opaque;
     uint64_t cur_bytes; /* number of bytes in current iteration */
diff --git a/block/curl.c b/block/curl.c
index 50e741a0d7..4a8ae2b269 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -896,7 +896,8 @@ out:
 }
 
 static int coroutine_fn curl_co_preadv(BlockDriverState *bs,
-        uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags)
+        int64_t offset, int64_t bytes, QEMUIOVector *qiov,
+        BdrvRequestFlags flags)
 {
     CURLAIOCB acb = {
         .co = qemu_coroutine_self(),
diff --git a/block/dmg.c b/block/dmg.c
index ef35a505f2..447901fbb8 100644
--- a/block/dmg.c
+++ b/block/dmg.c
@@ -689,8 +689,8 @@ static inline int dmg_read_chunk(BlockDriverState *bs, uint64_t sector_num)
 }
 
 static int coroutine_fn
-dmg_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-              QEMUIOVector *qiov, int flags)
+dmg_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+              QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVDMGState *s = bs->opaque;
     uint64_t sector_num = offset >> BDRV_SECTOR_BITS;
diff --git a/block/file-posix.c b/block/file-posix.c
index 10b71d9a13..e0e758e446 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2009,9 +2009,9 @@ static int coroutine_fn raw_co_prw(BlockDriverState *bs, uint64_t offset,
     return raw_thread_pool_submit(bs, handle_aiocb_rw, &acb);
 }
 
-static int coroutine_fn raw_co_preadv(BlockDriverState *bs, uint64_t offset,
-                                      uint64_t bytes, QEMUIOVector *qiov,
-                                      int flags)
+static int coroutine_fn raw_co_preadv(BlockDriverState *bs, int64_t offset,
+                                      int64_t bytes, QEMUIOVector *qiov,
+                                      BdrvRequestFlags flags)
 {
     return raw_co_prw(bs, offset, bytes, qiov, QEMU_AIO_READ);
 }
diff --git a/block/file-win32.c b/block/file-win32.c
index 2642088bd6..15076350f2 100644
--- a/block/file-win32.c
+++ b/block/file-win32.c
@@ -436,8 +436,8 @@ fail:
 }
 
 static BlockAIOCB *raw_aio_preadv(BlockDriverState *bs,
-                                  uint64_t offset, uint64_t bytes,
-                                  QEMUIOVector *qiov, int flags,
+                                  int64_t offset, int64_t bytes,
+                                  QEMUIOVector *qiov, BdrvRequestFlags flags,
                                   BlockCompletionFunc *cb, void *opaque)
 {
     BDRVRawState *s = bs->opaque;
diff --git a/block/filter-compress.c b/block/filter-compress.c
index 5136371bf8..54a16c6c64 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -63,10 +63,10 @@ static int64_t compress_getlength(BlockDriverState *bs)
 
 
 static int coroutine_fn compress_co_preadv_part(BlockDriverState *bs,
-                                                uint64_t offset, uint64_t bytes,
+                                                int64_t offset, int64_t bytes,
                                                 QEMUIOVector *qiov,
                                                 size_t qiov_offset,
-                                                int flags)
+                                                BdrvRequestFlags flags)
 {
     return bdrv_co_preadv_part(bs->file, offset, bytes, qiov, qiov_offset,
                                flags);
diff --git a/block/mirror.c b/block/mirror.c
index 840b8e8c15..684652092a 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1380,7 +1380,7 @@ static void coroutine_fn active_write_settle(MirrorOp *op)
 }
 
 static int coroutine_fn bdrv_mirror_top_preadv(BlockDriverState *bs,
-    uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags)
+    int64_t offset, int64_t bytes, QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     return bdrv_co_preadv(bs->backing, offset, bytes, qiov, flags);
 }
diff --git a/block/nbd.c b/block/nbd.c
index 1d4668d42d..f1aac282e4 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1545,8 +1545,9 @@ static int nbd_co_request(BlockDriverState *bs, NBDRequest *request,
     return ret ? ret : request_ret;
 }
 
-static int nbd_client_co_preadv(BlockDriverState *bs, uint64_t offset,
-                                uint64_t bytes, QEMUIOVector *qiov, int flags)
+static int nbd_client_co_preadv(BlockDriverState *bs, int64_t offset,
+                                int64_t bytes, QEMUIOVector *qiov,
+                                BdrvRequestFlags flags)
 {
     int ret, request_ret;
     Error *local_err = NULL;
diff --git a/block/nfs.c b/block/nfs.c
index 8c1968bb41..eee8f706ba 100644
--- a/block/nfs.c
+++ b/block/nfs.c
@@ -265,9 +265,9 @@ nfs_co_generic_cb(int ret, struct nfs_context *nfs, void *data,
                                      nfs_co_generic_bh_cb, task);
 }
 
-static int coroutine_fn nfs_co_preadv(BlockDriverState *bs, uint64_t offset,
-                                      uint64_t bytes, QEMUIOVector *iov,
-                                      int flags)
+static int coroutine_fn nfs_co_preadv(BlockDriverState *bs, int64_t offset,
+                                      int64_t bytes, QEMUIOVector *iov,
+                                      BdrvRequestFlags flags)
 {
     NFSClient *client = bs->opaque;
     NFSRPC task;
diff --git a/block/null.c b/block/null.c
index cc9b1d4ea7..343dbb580d 100644
--- a/block/null.c
+++ b/block/null.c
@@ -116,8 +116,9 @@ static coroutine_fn int null_co_common(BlockDriverState *bs)
 }
 
 static coroutine_fn int null_co_preadv(BlockDriverState *bs,
-                                       uint64_t offset, uint64_t bytes,
-                                       QEMUIOVector *qiov, int flags)
+                                       int64_t offset, int64_t bytes,
+                                       QEMUIOVector *qiov,
+                                       BdrvRequestFlags flags)
 {
     BDRVNullState *s = bs->opaque;
 
@@ -187,8 +188,8 @@ static inline BlockAIOCB *null_aio_common(BlockDriverState *bs,
 }
 
 static BlockAIOCB *null_aio_preadv(BlockDriverState *bs,
-                                   uint64_t offset, uint64_t bytes,
-                                   QEMUIOVector *qiov, int flags,
+                                   int64_t offset, int64_t bytes,
+                                   QEMUIOVector *qiov, BdrvRequestFlags flags,
                                    BlockCompletionFunc *cb,
                                    void *opaque)
 {
diff --git a/block/nvme.c b/block/nvme.c
index 2b5421e7aa..58342c6409 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1221,8 +1221,9 @@ static int nvme_co_prw(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
 }
 
 static coroutine_fn int nvme_co_preadv(BlockDriverState *bs,
-                                       uint64_t offset, uint64_t bytes,
-                                       QEMUIOVector *qiov, int flags)
+                                       int64_t offset, int64_t bytes,
+                                       QEMUIOVector *qiov,
+                                       BdrvRequestFlags flags)
 {
     return nvme_co_prw(bs, offset, bytes, qiov, false, flags);
 }
diff --git a/block/preallocate.c b/block/preallocate.c
index b619206304..5709443612 100644
--- a/block/preallocate.c
+++ b/block/preallocate.c
@@ -227,8 +227,8 @@ static void preallocate_reopen_abort(BDRVReopenState *state)
 }
 
 static coroutine_fn int preallocate_co_preadv_part(
-        BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-        QEMUIOVector *qiov, size_t qiov_offset, int flags)
+        BlockDriverState *bs, int64_t offset, int64_t bytes,
+        QEMUIOVector *qiov, size_t qiov_offset, BdrvRequestFlags flags)
 {
     return bdrv_co_preadv_part(bs->file, offset, bytes, qiov, qiov_offset,
                                flags);
diff --git a/block/qcow.c b/block/qcow.c
index f8919a44d1..1151b8d79b 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -617,9 +617,9 @@ static void qcow_refresh_limits(BlockDriverState *bs, Error **errp)
     bs->bl.request_alignment = BDRV_SECTOR_SIZE;
 }
 
-static coroutine_fn int qcow_co_preadv(BlockDriverState *bs, uint64_t offset,
-                                       uint64_t bytes, QEMUIOVector *qiov,
-                                       int flags)
+static coroutine_fn int qcow_co_preadv(BlockDriverState *bs, int64_t offset,
+                                       int64_t bytes, QEMUIOVector *qiov,
+                                       BdrvRequestFlags flags)
 {
     BDRVQcowState *s = bs->opaque;
     int offset_in_cluster;
diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index bd0597842f..70adea9f59 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -505,7 +505,19 @@ static int coroutine_fn do_perform_cow_read(BlockDriverState *bs,
         return -ENOMEDIUM;
     }
 
-    /* Call .bdrv_co_readv() directly instead of using the public block-layer
+    /*
+     * We never deal with requests that doesn't satisfy
+     * bdrv_check_qiov_request(), and aligning requests to clusters never break
+     * this condition. So, do some assertions before calling
+     * bs->drv->bdrv_co_preadv_part() which has int64_t arguments.
+     */
+    assert(src_cluster_offset <= INT64_MAX);
+    assert(src_cluster_offset + offset_in_cluster <= INT64_MAX);
+    assert(qiov->size <= INT64_MAX);
+    bdrv_check_qiov_request(src_cluster_offset + offset_in_cluster, qiov->size,
+                            qiov, 0, &error_abort);
+    /*
+     * Call .bdrv_co_readv() directly instead of using the public block-layer
      * interface.  This avoids double I/O throttling and request tracking,
      * which can lead to deadlock when block layer copy-on-read is enabled.
      */
diff --git a/block/qcow2.c b/block/qcow2.c
index 227885620d..35844beb46 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2282,9 +2282,10 @@ static coroutine_fn int qcow2_co_preadv_task_entry(AioTask *task)
 }
 
 static coroutine_fn int qcow2_co_preadv_part(BlockDriverState *bs,
-                                             uint64_t offset, uint64_t bytes,
+                                             int64_t offset, int64_t bytes,
                                              QEMUIOVector *qiov,
-                                             size_t qiov_offset, int flags)
+                                             size_t qiov_offset,
+                                             BdrvRequestFlags flags)
 {
     BDRVQcow2State *s = bs->opaque;
     int ret = 0;
diff --git a/block/quorum.c b/block/quorum.c
index cfc1436abb..1eba2ce7ff 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -663,8 +663,8 @@ static int read_fifo_child(QuorumAIOCB *acb)
     return ret;
 }
 
-static int quorum_co_preadv(BlockDriverState *bs, uint64_t offset,
-                            uint64_t bytes, QEMUIOVector *qiov, int flags)
+static int quorum_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                            QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVQuorumState *s = bs->opaque;
     QuorumAIOCB *acb = quorum_aio_get(bs, qiov, offset, bytes, flags);
diff --git a/block/raw-format.c b/block/raw-format.c
index 7717578ed6..e3f459b2cb 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -181,8 +181,8 @@ static void raw_reopen_abort(BDRVReopenState *state)
 }
 
 /* Check and adjust the offset, against 'offset' and 'size' options. */
-static inline int raw_adjust_offset(BlockDriverState *bs, uint64_t *offset,
-                                    uint64_t bytes, bool is_write)
+static inline int raw_adjust_offset(BlockDriverState *bs, int64_t *offset,
+                                    int64_t bytes, bool is_write)
 {
     BDRVRawState *s = bs->opaque;
 
@@ -201,9 +201,9 @@ static inline int raw_adjust_offset(BlockDriverState *bs, uint64_t *offset,
     return 0;
 }
 
-static int coroutine_fn raw_co_preadv(BlockDriverState *bs, uint64_t offset,
-                                      uint64_t bytes, QEMUIOVector *qiov,
-                                      int flags)
+static int coroutine_fn raw_co_preadv(BlockDriverState *bs, int64_t offset,
+                                      int64_t bytes, QEMUIOVector *qiov,
+                                      BdrvRequestFlags flags)
 {
     int ret;
 
@@ -259,7 +259,7 @@ static int coroutine_fn raw_co_pwritev(BlockDriverState *bs, uint64_t offset,
         qiov = &local_qiov;
     }
 
-    ret = raw_adjust_offset(bs, &offset, bytes, true);
+    ret = raw_adjust_offset(bs, (int64_t *)&offset, bytes, true);
     if (ret) {
         goto fail;
     }
@@ -294,7 +294,7 @@ static int coroutine_fn raw_co_pwrite_zeroes(BlockDriverState *bs,
 {
     int ret;
 
-    ret = raw_adjust_offset(bs, (uint64_t *)&offset, bytes, true);
+    ret = raw_adjust_offset(bs, (int64_t *)&offset, bytes, true);
     if (ret) {
         return ret;
     }
@@ -306,7 +306,7 @@ static int coroutine_fn raw_co_pdiscard(BlockDriverState *bs,
 {
     int ret;
 
-    ret = raw_adjust_offset(bs, (uint64_t *)&offset, bytes, true);
+    ret = raw_adjust_offset(bs, &offset, bytes, true);
     if (ret) {
         return ret;
     }
@@ -541,7 +541,7 @@ static int coroutine_fn raw_co_copy_range_from(BlockDriverState *bs,
 {
     int ret;
 
-    ret = raw_adjust_offset(bs, &src_offset, bytes, false);
+    ret = raw_adjust_offset(bs, (int64_t *)&src_offset, bytes, false);
     if (ret) {
         return ret;
     }
@@ -560,7 +560,7 @@ static int coroutine_fn raw_co_copy_range_to(BlockDriverState *bs,
 {
     int ret;
 
-    ret = raw_adjust_offset(bs, &dst_offset, bytes, true);
+    ret = raw_adjust_offset(bs, (int64_t *)&dst_offset, bytes, true);
     if (ret) {
         return ret;
     }
diff --git a/block/rbd.c b/block/rbd.c
index f098a89c7b..6a937723f4 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -994,8 +994,9 @@ failed:
 }
 
 static BlockAIOCB *qemu_rbd_aio_preadv(BlockDriverState *bs,
-                                       uint64_t offset, uint64_t bytes,
-                                       QEMUIOVector *qiov, int flags,
+                                       int64_t offset, int64_t bytes,
+                                       QEMUIOVector *qiov,
+                                       BdrvRequestFlags flags,
                                        BlockCompletionFunc *cb,
                                        void *opaque)
 {
diff --git a/block/throttle.c b/block/throttle.c
index b685166ad4..20362b5fe5 100644
--- a/block/throttle.c
+++ b/block/throttle.c
@@ -112,8 +112,9 @@ static int64_t throttle_getlength(BlockDriverState *bs)
 }
 
 static int coroutine_fn throttle_co_preadv(BlockDriverState *bs,
-                                           uint64_t offset, uint64_t bytes,
-                                           QEMUIOVector *qiov, int flags)
+                                           int64_t offset, int64_t bytes,
+                                           QEMUIOVector *qiov,
+                                           BdrvRequestFlags flags)
 {
 
     ThrottleGroupMember *tgm = bs->opaque;
diff --git a/block/vdi.c b/block/vdi.c
index 548f8a057b..b394cf6ca6 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -544,8 +544,8 @@ static int coroutine_fn vdi_co_block_status(BlockDriverState *bs,
 }
 
 static int coroutine_fn
-vdi_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-              QEMUIOVector *qiov, int flags)
+vdi_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+              QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVVdiState *s = bs->opaque;
     QEMUIOVector local_qiov;
diff --git a/block/vmdk.c b/block/vmdk.c
index 4499f136bd..78592160d0 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -1888,8 +1888,8 @@ static int vmdk_read_extent(VmdkExtent *extent, int64_t cluster_offset,
 }
 
 static int coroutine_fn
-vmdk_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-               QEMUIOVector *qiov, int flags)
+vmdk_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+               QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVVmdkState *s = bs->opaque;
     int ret;
diff --git a/block/vpc.c b/block/vpc.c
index 17a705b482..29c8517ff8 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -608,8 +608,8 @@ static int vpc_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
 }
 
 static int coroutine_fn
-vpc_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-              QEMUIOVector *qiov, int flags)
+vpc_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+              QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVVPCState *s = bs->opaque;
     int ret;
diff --git a/block/vvfat.c b/block/vvfat.c
index 54807f82ca..8ac90166c5 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -1522,8 +1522,8 @@ static int vvfat_read(BlockDriverState *bs, int64_t sector_num,
 }
 
 static int coroutine_fn
-vvfat_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                QEMUIOVector *qiov, int flags)
+vvfat_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     int ret;
     BDRVVVFATState *s = bs->opaque;
diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 892f7f47d8..e3fc9ced3e 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -65,8 +65,9 @@ static void co_reenter_bh(void *opaque)
 }
 
 static int coroutine_fn bdrv_test_co_preadv(BlockDriverState *bs,
-                                            uint64_t offset, uint64_t bytes,
-                                            QEMUIOVector *qiov, int flags)
+                                            int64_t offset, int64_t bytes,
+                                            QEMUIOVector *qiov,
+                                            BdrvRequestFlags flags)
 {
     BDRVTestState *s = bs->opaque;
 
@@ -1105,8 +1106,9 @@ static void bdrv_test_top_close(BlockDriverState *bs)
 }
 
 static int coroutine_fn bdrv_test_top_co_preadv(BlockDriverState *bs,
-                                                uint64_t offset, uint64_t bytes,
-                                                QEMUIOVector *qiov, int flags)
+                                                int64_t offset, int64_t bytes,
+                                                QEMUIOVector *qiov,
+                                                BdrvRequestFlags flags)
 {
     BDRVTestTopState *tts = bs->opaque;
     return bdrv_co_preadv(tts->wait_child, offset, bytes, qiov, flags);
@@ -1854,10 +1856,10 @@ static void bdrv_replace_test_close(BlockDriverState *bs)
  *   Set .has_read to true and return success.
  */
 static int coroutine_fn bdrv_replace_test_co_preadv(BlockDriverState *bs,
-                                                    uint64_t offset,
-                                                    uint64_t bytes,
+                                                    int64_t offset,
+                                                    int64_t bytes,
                                                     QEMUIOVector *qiov,
-                                                    int flags)
+                                                    BdrvRequestFlags flags)
 {
     BDRVReplaceTestState *s = bs->opaque;
 
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 8cf172cb7a..b3f8f3ff8e 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -31,9 +31,18 @@
 #include "qemu/main-loop.h"
 #include "iothread.h"
 
-static int coroutine_fn bdrv_test_co_prwv(BlockDriverState *bs,
-                                          uint64_t offset, uint64_t bytes,
-                                          QEMUIOVector *qiov, int flags)
+static int coroutine_fn bdrv_test_co_preadv(BlockDriverState *bs,
+                                            int64_t offset, int64_t bytes,
+                                            QEMUIOVector *qiov,
+                                            BdrvRequestFlags flags)
+{
+    return 0;
+}
+
+static int coroutine_fn bdrv_test_co_pwritev(BlockDriverState *bs,
+                                             uint64_t offset, uint64_t bytes,
+                                             QEMUIOVector *qiov,
+                                             int flags)
 {
     return 0;
 }
@@ -66,8 +75,8 @@ static BlockDriver bdrv_test = {
     .format_name            = "test",
     .instance_size          = 1,
 
-    .bdrv_co_preadv         = bdrv_test_co_prwv,
-    .bdrv_co_pwritev        = bdrv_test_co_prwv,
+    .bdrv_co_preadv         = bdrv_test_co_preadv,
+    .bdrv_co_pwritev        = bdrv_test_co_pwritev,
     .bdrv_co_pdiscard       = bdrv_test_co_pdiscard,
     .bdrv_co_truncate       = bdrv_test_co_truncate,
     .bdrv_co_block_status   = bdrv_test_co_block_status,
-- 
2.29.2


