Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E6C2D7F02
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 20:05:05 +0100 (CET)
Received: from localhost ([::1]:46450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knniy-0006uS-EB
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 14:05:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnL2-0006gx-63; Fri, 11 Dec 2020 13:40:21 -0500
Received: from mail-eopbgr70097.outbound.protection.outlook.com
 ([40.107.7.97]:21414 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnKp-0008BO-Fd; Fri, 11 Dec 2020 13:40:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dUc+wAu7TqJ9tB5MkiDxQHpheUTzFCqbb4RHGfE2c5D3B87aJyY2fDigghXol3QplP4BvzJGKBmKVFUCQz+sMkrGiibcsW/x7sfKn2+yKh75jzeywnIuprp3/PPtf000WJujuzhL2ngQlta/QC8qU19iZealWqHXuC+p95PzFwpghbxTETy4YEBWMA4iVSXKsKCwKr2rQMlXn5wkx/f+lY5QaApEinYW6T665NXJDxwufMM2Cqt3IwFKk/uEmBcAs+bUhmNWF5WAObEf81afDgN7tp2CsoLnmVWBD7i2JCzv09QnbNXCfEOyLCgVVoZwzz1AjheHTn9otALZfWDRpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5y9b5ZSfYfjBLXDRRTfJnjXBs2Zy/1fc9BA33mvrKPU=;
 b=CbR5B74FKgbeQY6kGhnB+H9DJAPubCLoNFcKUrBsaLhIuK99tzKBzCb+ps13EmOIuXJH29dOje9doEt92U9zuuqewlQVAXmUBgvQGBFsfcRSknbG5hZgB6PIp13nvoZY6Di5woFUSNWDo8hQkHliUy85SBXziBQcnjGqpLEkjSEg/lWKsaxl1jPgKQCSpI5ZRMhFAOKxcuA25C8S4t2ej4VGvhfdcPMWDCZ9inaU/BWSqUU1A/o2XfJVH6KDHgVvTfcItClzg/TusSM2ZeKvm69WY42pgg2J4EMt/zQH5FOzDVUpUUSw6nbVxKyOdrHFmq0Oec4w63hGZSsBQWBnqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5y9b5ZSfYfjBLXDRRTfJnjXBs2Zy/1fc9BA33mvrKPU=;
 b=DDx4l0fMjMOWxXO5BYuKtNcNZjveI7FfLgtHmpTVXgZORIUHgMFTNWqvANtbC06YwIuIS2WIWyh6t/Km2/cdk7E4Xr/Ow7fZth8dogCMp4iSEkr+uGz+lOTL3Lln9oP6DdLGye0oR4ylpTvVf/XYi/qngF0egYPoM4EFiWxJtr4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4915.eurprd08.prod.outlook.com (2603:10a6:20b:d1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Fri, 11 Dec
 2020 18:39:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.016; Fri, 11 Dec 2020
 18:39:52 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 06/16] block/throttle-groups:
 throttle_group_co_io_limits_intercept(): 64bit bytes
Date: Fri, 11 Dec 2020 21:39:24 +0300
Message-Id: <20201211183934.169161-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201211183934.169161-1-vsementsov@virtuozzo.com>
References: <20201211183934.169161-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR04CA0050.eurprd04.prod.outlook.com
 (2603:10a6:208:1::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM0PR04CA0050.eurprd04.prod.outlook.com (2603:10a6:208:1::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 18:39:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2dc80c02-cfb0-4396-cd9e-08d89e042608
X-MS-TrafficTypeDiagnostic: AM6PR08MB4915:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4915994F4E12BB18DCB16F09C1CA0@AM6PR08MB4915.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VK/rbujgC+WXOoUMbco/QEhLx5QtTUhSiGMNvlyWzlY89vgX8B/GSbYHoCVR4aD4JilKfgzL+FwGK/a4JlsguW4A7N36Z+YN2nH2eAO/jo72Fj+QDEnVEle1FzyoKTNpO0AocFJzYrLOXrq1D6oifPpHgRTk1qHieeov8GCGEzQK7EbS3Y+/FuNoNX/Bf5GghMGQJWRjgF6zpdl7zwU620AXGEnnXf1BxgXvdzMHlOmXPKvpZ1ezqppLPNcFgvMcVLWbXvp5WE07Nlt/4fVe548VJLtons4jGSyk60qaC3UvnalT2DrDbfJU15cp23DWbDEZBsZbDSU5GdDopctpKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39840400004)(136003)(396003)(376002)(66476007)(6506007)(66946007)(956004)(6486002)(86362001)(4326008)(66556008)(6916009)(6512007)(2616005)(6666004)(83380400001)(1076003)(26005)(316002)(16526019)(5660300002)(8676002)(186003)(478600001)(8936002)(2906002)(36756003)(107886003)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qn2mYsntRjXNe4DJgvPoYB1cnn4E5pzYEhKpKp/bcMB8dZ+xRmlT1osBPCse?=
 =?us-ascii?Q?FDkQSk0PsPeNTHhGIFfUlYvqzh80Sj5Hjjt5pDJOP89F8dzyF3GZNBWPC0Tv?=
 =?us-ascii?Q?jiyZKMzmwuHqjz1pNxaQnTiNdgITlbGX5UMelx5P3PxSPwk4wKKS8KduiMnT?=
 =?us-ascii?Q?f+Qg34L7NvOu3rST150KidPUutseXgKwoJLC41D0zC8JSXcTLaAxaqisKcrg?=
 =?us-ascii?Q?fQKiq9po2OTIERhOBzUAOa6Fh8cta6BhuATd4+SFmeaONvC5d9A5ZRhOhvuU?=
 =?us-ascii?Q?oEyNEvKuiRQ4tbs7VqxKVaVEklLrc6FPRy79VWsgSagF9wBo32Ss98C2pI06?=
 =?us-ascii?Q?R3l2OFoN6N7wTvY+XRUO0fLsGLFCIAVFKWSiw2AGN0E+1euEvB/Yj21RQdHd?=
 =?us-ascii?Q?7UHG7YSq2drfpTPKH4z5IPyTm8mpRqcE/W3gqChMUthib2Xqy/z4veExgGK/?=
 =?us-ascii?Q?dCMHXnxUu5Hxa/wgLu9e4nMMEa0p3judBAd4CiBzKxEAO74se/Sax6W8FMio?=
 =?us-ascii?Q?02oTsyytTYyeEkG1sZjm93pjw0gcAOLFMUh4VYR0D6Ioi71e1mSO5eRdjqPQ?=
 =?us-ascii?Q?sbuc3TqK+P7hK1Vr+2bmkWJ43osueFQ1Z7lGOiz+D1XCd5GF/7OkO8vGk5IZ?=
 =?us-ascii?Q?kqDbUZBpCFEGBNyG8dU5XBnX0dh0QIS/WKo3xHKSm3vpBsAzbcRAkkub3AbC?=
 =?us-ascii?Q?GU1Qb821OzWDrnefdX/GuZMN2/QcEWJONMlVkPeFZxMznYS+patq6pzrViNI?=
 =?us-ascii?Q?mPFdWi16PjNUFgHgqZBZs6jAXUmJ8yN9cfPCgkfw1iMPDh/YLqNKpZVcYZVl?=
 =?us-ascii?Q?nRdeVpiae89gpG/VEC7Hm1iTDV4aG7mZWmM8IQxRSFHAlHgpXq0svjynLpDm?=
 =?us-ascii?Q?VXjG1fMbdoovONalpfwL8mdVGAnJE21bJXoqTyMZV248/8/qWsmro5/ee7vY?=
 =?us-ascii?Q?/vBfFZq+oZD3UtGBiH8LaSuOB6DgFPhfuJzM2vUURagp7B2UMYPETlPgrL/x?=
 =?us-ascii?Q?KnHJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 18:39:52.7606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dc80c02-cfb0-4396-cd9e-08d89e042608
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 730b3p9qeWMMM3ZlWB0Y/TLMZqfUQRoVGSQYiZ6e7QZk3E3ncCt9EePE8n4chg5vGhSn8rQ7I2u1CUlll14pTZ2r0N9gC5XVi9cWYU+urAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4915
Received-SPF: pass client-ip=40.107.7.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 berto@igalia.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function is called from 64bit io handlers, and bytes is just passed
to throttle_account() which is 64bit too (unsigned though). So, let's
convert intermediate argument to 64bit too.

This patch is a first in the 64-bit-blocklayer series, so we are
generally moving to int64_t for both offset and bytes parameters on all
io paths. Main motivation is realization of 64-bit write_zeroes
operation for fast zeroing large disk chunks, up to the whole disk.

We chose signed type, to be consistent with off_t (which is signed) and
with possibility for signed return type (where negative value means
error).

Patch-correctness audit by Eric Blake:

  Caller has 32-bit, this patch now causes widening which is safe:
  block/block-backend.c: blk_do_preadv() passes 'unsigned int'
  block/block-backend.c: blk_do_pwritev_part() passes 'unsigned int'
  block/throttle.c: throttle_co_pwrite_zeroes() passes 'int'
  block/throttle.c: throttle_co_pdiscard() passes 'int'

  Caller has 64-bit, this patch fixes potential bug where pre-patch
  could narrow, except it's easy enough to trace that callers are still
  capped at 2G actions:
  block/throttle.c: throttle_co_preadv() passes 'uint64_t'
  block/throttle.c: throttle_co_pwritev() passes 'uint64_t'

  Implementation in question: block/throttle-groups.c
  throttle_group_co_io_limits_intercept() takes 'unsigned int bytes'
  and uses it: argument to util/throttle.c throttle_account(uint64_t)

  All safe: it patches a latent bug, and does not introduce any 64-bit
  gotchas once throttle_co_p{read,write}v are relaxed, and assuming
  throttle_account() is not buggy.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 include/block/throttle-groups.h | 2 +-
 block/throttle-groups.c         | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/block/throttle-groups.h b/include/block/throttle-groups.h
index 8bf7d233fa..9541b32432 100644
--- a/include/block/throttle-groups.h
+++ b/include/block/throttle-groups.h
@@ -77,7 +77,7 @@ void throttle_group_unregister_tgm(ThrottleGroupMember *tgm);
 void throttle_group_restart_tgm(ThrottleGroupMember *tgm);
 
 void coroutine_fn throttle_group_co_io_limits_intercept(ThrottleGroupMember *tgm,
-                                                        unsigned int bytes,
+                                                        int64_t bytes,
                                                         bool is_write);
 void throttle_group_attach_aio_context(ThrottleGroupMember *tgm,
                                        AioContext *new_context);
diff --git a/block/throttle-groups.c b/block/throttle-groups.c
index abd16ed9db..fb203c3ced 100644
--- a/block/throttle-groups.c
+++ b/block/throttle-groups.c
@@ -358,12 +358,15 @@ static void schedule_next_request(ThrottleGroupMember *tgm, bool is_write)
  * @is_write:  the type of operation (read/write)
  */
 void coroutine_fn throttle_group_co_io_limits_intercept(ThrottleGroupMember *tgm,
-                                                        unsigned int bytes,
+                                                        int64_t bytes,
                                                         bool is_write)
 {
     bool must_wait;
     ThrottleGroupMember *token;
     ThrottleGroup *tg = container_of(tgm->throttle_state, ThrottleGroup, ts);
+
+    assert(bytes >= 0);
+
     qemu_mutex_lock(&tg->lock);
 
     /* First we check if this I/O has to be throttled. */
-- 
2.25.4


