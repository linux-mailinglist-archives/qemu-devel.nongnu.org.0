Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 975A33FFE39
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 12:31:40 +0200 (CEST)
Received: from localhost ([::1]:37350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM6Tz-00067O-LD
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 06:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mM6Qx-0002s7-S7; Fri, 03 Sep 2021 06:28:33 -0400
Received: from mail-am6eur05on2109.outbound.protection.outlook.com
 ([40.107.22.109]:20065 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mM6Qt-00024h-Nk; Fri, 03 Sep 2021 06:28:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f2DfoFmGLlaUOFqNjVG8cWbinBFHabQsU3cF5OJ1pJgJGcCQH017FbyVkRRi6JXe4+kmIMspZZz86HxzVWKXpiOguK3d5kWmIOO/skxIm9XIqgOu8GOF998ReNCvsmcFikRMFDQqPPTiG7r03PVKFn4M0xqtO1mIbhWeHfDdyg/1BMOsFbGRBrIDu0nNgWRPyuChzYV79yY3mJgvNhtyiry6eQwA56OMpYTOwQneeXT4AQ0lnuBYdz1wUgC5ubRL2sCuqvznXMMMIUx6BtYL1rIHaov2DNKvFSJ+y2UN+golpS1++RutSSADDcV/D6jDHHFUmOLiQtjtzAOatbvcZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=YLGNwmF3L7A8XZl6pVM+7BO6Xi5W3uynsLBid4fyxcw=;
 b=F+S0SgQmnFRZd2mPyyPsO3CN2sg41yRG6Wib++Smb1UhPuswpRllw3kEftKkcTh62e8rxh6FPklYGaIzoK1TmfJCitrmehCS0xYNxQTxTrfF7ymsR+Vnh6JH9ibfSJZTqyd2gQ+hJax5Zoqz8s2cUJrdnS6aX/7/PBD3xVfrnpHIu6Bl+T44H/Qru1cnD5uGBn3Z35+nC0sL552eqijnsOUP+yE8t6pkNEOVK42eXs8UzCoet3ZN5bY+I6AKoKMAmCkn5y6nlf8vdyMCVR9K7CFH+vguyhZPbQtIUEMqeFW+zETcxu6azBP2Dv/bEYWLFM/mtwPFH8j1mgPn2fVnuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLGNwmF3L7A8XZl6pVM+7BO6Xi5W3uynsLBid4fyxcw=;
 b=qegobFne29IW9SYc0OmgeuRZl2BWB2Pkcu6YNPs+GRFtX8LDFvEwVBnTibW+yFGE8CwrdBJORGu5onuefVrGloSRfQ5vIYh9vQrD3H/ojbFIn7kntldpYVfEm4pKVzL7IJBlNup9W8HTyluCOs1niR9/1Q1ADaHYvHBGoYnS5Ww=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4913.eurprd08.prod.outlook.com (2603:10a6:20b:ce::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Fri, 3 Sep
 2021 10:28:22 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.022; Fri, 3 Sep 2021
 10:28:22 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, integration@gluster.org, kraxel@redhat.com,
 idryomov@gmail.com, berto@igalia.com, philmd@redhat.com, eblake@redhat.com,
 pl@kamp.de, ronniesahlberg@gmail.com, fam@euphon.net, sw@weilnetz.de,
 vsementsov@virtuozzo.com, jsnow@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, pavel.dovgaluk@ispras.ru, ari@tuxera.com,
 hreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 00/11] 64bit block-layer: part II
Date: Fri,  3 Sep 2021 13:27:56 +0300
Message-Id: <20210903102807.27127-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0163.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR05CA0163.eurprd05.prod.outlook.com (2603:10a6:3:f8::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Fri, 3 Sep 2021 10:28:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b60bb04-4204-4503-a1ee-08d96ec58e2e
X-MS-TrafficTypeDiagnostic: AM6PR08MB4913:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB49138D1B03712D77DC3417F0C1CF9@AM6PR08MB4913.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +dakUyragxlubYGdez/J+8oYXSQhUG16fNe2S/o6Tfd1Fg6him252XnV6+k9g6DSWMImqAe8tFdpFo2hsAckAErrqx0N28/n6V+XxKvDZhLnKY5nswGuwvC10rgQZ4nz3a8vgdL1Mg+VDMF4LhYBvJvzMqHdiH8XHxz9bdbrSk8JYf52Sku0CXeI7cZi0JJCC16a+p5zfsBjdCSYDcl9pAJHZmD1t1hjjjHr3wT0QMCUwma28LvU13bbIYn5SxEdCxM5P4XYQv2Ex30GbGbUeexCuxsOI+Mi7FEn947LGTHLTt3fyBcbI1RMw6UdtzmUbIuje7Y+xVLrOORjbqTS30a5goxJn8B5YYPnt/zHSlHmh8gZn+pH2Pg3MqKAcBGPVHAbB7FhuLeajkb61Wo1EwUgyRxZbAEuqVhLkSg4k854xwibbqVirZIWFz/4GkmayQJqw0mon0vzYj+zkVBGH7AqTaRrRtpZmen04ZOtWMNB4k3u2chv1SM6NQnBUbixjnREb5hoZy0e9q4sYeuz9QW06QNOdy42JmpwPV6euJm1Np2M8HtehWv9DciElmk5JiS+FQNPUd6v1QBjfxx/1z+Fcl58lAdriHV7LoIn+CUjcdp3Eh/1b1ynpMylgkiUd+OKyQygkH/PNdOOs+QZ43lsVyWZ6jXwTpKLWZVqqD95kjp8WQA2S36XeH8BmxCm/5tmqxLcqlp+Bam6EowEZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39850400004)(396003)(346002)(376002)(366004)(186003)(26005)(6506007)(478600001)(7416002)(6666004)(52116002)(83380400001)(1076003)(6486002)(86362001)(956004)(8676002)(2616005)(38350700002)(38100700002)(2906002)(6916009)(5660300002)(66556008)(66476007)(66946007)(36756003)(316002)(6512007)(4326008)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dN6qRJWLLPDyAxoZdjWK2lcxLOF+BQEr7E5nBEZHf5x9/AOFTCqOQSzJLW4b?=
 =?us-ascii?Q?RwIqv4dEz6WY/IScZ8sHIE3M5D0xtXhbZmFwq2wzEI69jci+lwkTi0BKuD6a?=
 =?us-ascii?Q?SmdCDU5zaUk9FcmYTk34ea7C5A+EIw6i9GzigZJuz06WmbZEQfSQrZI5GNyd?=
 =?us-ascii?Q?/ik7NumEIyD1I+m7AUx5gHNzeJGhirIy2o5qptxZhxzbDIQ4mLxcEtq1kSYz?=
 =?us-ascii?Q?a6LPjOOPCTWoSEDw775kiabYVRTah8Km+jbQIcDfRaOnpYPEgrL1S8fVpwXC?=
 =?us-ascii?Q?4Cjv8m+VKZe8ORJ39Gb4QnFXxNWDBoUQHiWar9vuhyFoV9QV+m66PNRy4H2e?=
 =?us-ascii?Q?KEIPmvT4RHgD6+RBEymyTwzTak7FjyCxNinDRmaS+5Oekm1FNtJ8SaOKywc3?=
 =?us-ascii?Q?7BBzQuohvQMxx09eHIaFBUGZzlFl8kBwcAhCRGC+JkB9MKHgnh3lR37eP4Oo?=
 =?us-ascii?Q?HTu7kikV9lUbZ47dPN2wM/61PkezjjYy5VhleHYhcl2D/xsZ9cWZHWkKrBbJ?=
 =?us-ascii?Q?U0KLRk5s7vCdCH6G7ULfc7v3mQM17pjNU162Wz6szK+CZWcaLAFfRiJptnWw?=
 =?us-ascii?Q?WgSA1xQ5A8NqZL+XWcnfJU80CV29OGf8xdJaG4xc2fpybV99XhW29pU4iaYt?=
 =?us-ascii?Q?aCAxYORM5bcBbH/7dQSOiEhcFtH95dxiaGLJcry6HmYlUtNs7jbZYihktaiv?=
 =?us-ascii?Q?nTus7mzSdPjuO1b7pRcpHXYYC+tUiTOv+IbcVrwZzTP4Qgy7OJLlZ0nnMYby?=
 =?us-ascii?Q?eM5OxCOPxlpaTs36BqGegvusUuXa/nG7SxykME/5UJlM30RCSqWkg2i8Y6yF?=
 =?us-ascii?Q?vN38WWFh2cZ4ZBjkkBFxI08SqWe7+LKnmUS2TXQjClASDIe+bFUTtLuHsZXU?=
 =?us-ascii?Q?XXWq8yyA8spU2PdmGeZL47NncEPiRvQrnbQ91FX23ytVkLFC5b3HDL9dLesW?=
 =?us-ascii?Q?NwXla9/OjeoTfOD9Mm7loJIbYTX/7HPIKhw+XtxKPNqaHVQR477q8SQr2xIv?=
 =?us-ascii?Q?UGIcJ3JJn9vYH55xKUKG1GqGVwmcvpN8s7maNbljtaMDucVGQfw5n9gENaxi?=
 =?us-ascii?Q?OBKWsd1EvUn3f8oYDAJfypVX1U/urlzpyLT0qeu3ksC/mhPfh4svdpYXXEmW?=
 =?us-ascii?Q?CTNxjMNbnlo4AJnvfvXHWpcgeQj3M3932MNRbxSd5JTtfq3x9i+lpaL8Mky1?=
 =?us-ascii?Q?JOFnBDLN7fc/OuKll+GPTPLJTglB1btzN6QwwVMxAwzD1+x1aw2S4hKo7ZDm?=
 =?us-ascii?Q?NsYcrCK2YBGthO8+U6+hveeY90Sk+7oDKRTl7mUeIizN+nVmT1AiLdtc9Pey?=
 =?us-ascii?Q?j/R4XE8i+Z+TA3SyDaegp5xc?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b60bb04-4204-4503-a1ee-08d96ec58e2e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 10:28:22.5018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vsEUrLdA7BLR144YLlkibm4JxYBgcZDIEXweeinYxoKwPCfNa1qDjWY+mpvMs5UyfQVofu37kegnhavamHOToV74XAApyIeB0HOblz1xwoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4913
Received-SPF: pass client-ip=40.107.22.109;
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

Sorry for a long delay :( Finally, here is v6.

v6: rebase on new rbd handlers and backup-top renamed to copy-before-write. Also:

01: add Eric's r-b
    tweak commit msg to not mention sheepdog
02: add Eric's r-b
03: tweak commit msg
    drop extra type conversion in raw_co_pwrite_zeroes

04: vvfat: no write_target_commit() anymore
    nvme: fix over-80 line
    type conversion in raw_co_pwrite_zeroes() now dropped in 03

05: tweak commit msg
    add Eric's r-b

06: update comment

07: tweak commit msg, grammar and typos in comments
    don't add extra empty line
    handle also qemu_rbd_co_pwrite_zeroes

08: tweak commit msg, add Eric's r-b
09: tweak commit msg, add Eric's r-b
10: add rbd, drop sheepdog
    add assertion to iscsi_co_pdiscard()
11: tweak commit msg, add Eric's r-b

Vladimir Sementsov-Ogievskiy (11):
  block/io: bring request check to bdrv_co_(read,write)v_vmstate
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

 include/block/block_int.h        | 66 ++++++++++++++++--------------
 block/blkdebug.c                 | 12 +++---
 block/blklogwrites.c             | 16 ++++----
 block/blkreplay.c                |  8 ++--
 block/blkverify.c                |  8 ++--
 block/bochs.c                    |  4 +-
 block/cloop.c                    |  4 +-
 block/commit.c                   |  2 +-
 block/copy-before-write.c        | 15 +++----
 block/copy-on-read.c             | 19 +++++----
 block/crypto.c                   |  8 ++--
 block/curl.c                     |  3 +-
 block/dmg.c                      |  4 +-
 block/file-posix.c               | 35 ++++++++--------
 block/file-win32.c               |  8 ++--
 block/filter-compress.c          | 15 +++----
 block/gluster.c                  | 13 +++---
 block/io.c                       | 44 +++++++++++++++-----
 block/iscsi.c                    | 58 ++++++++++++++++----------
 block/mirror.c                   |  8 ++--
 block/nbd.c                      | 22 ++++++----
 block/nfs.c                      | 12 +++---
 block/null.c                     | 18 ++++----
 block/nvme.c                     | 48 ++++++++++++++++++----
 block/preallocate.c              | 14 +++----
 block/qcow.c                     | 16 ++++----
 block/qcow2-cluster.c            | 14 ++++++-
 block/qcow2.c                    | 70 +++++++++++++++++++++++---------
 block/qed.c                      |  9 +++-
 block/quorum.c                   | 11 ++---
 block/raw-format.c               | 36 ++++++++--------
 block/rbd.c                      | 20 ++++-----
 block/throttle.c                 | 18 ++++----
 block/vdi.c                      |  8 ++--
 block/vmdk.c                     | 14 +++----
 block/vpc.c                      |  8 ++--
 block/vvfat.c                    |  8 ++--
 tests/unit/test-bdrv-drain.c     | 16 ++++----
 tests/unit/test-block-iothread.c | 21 +++++++---
 block/trace-events               | 10 ++---
 slirp                            |  2 +-
 ui/keycodemapdb                  |  2 +-
 42 files changed, 452 insertions(+), 295 deletions(-)

-- 
2.29.2


