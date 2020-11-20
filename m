Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A54572BAFC8
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:18:37 +0100 (CET)
Received: from localhost ([::1]:59832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg97M-0005Pj-NN
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:18:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kg95W-0003Xa-BM; Fri, 20 Nov 2020 11:16:42 -0500
Received: from mail-am6eur05on2104.outbound.protection.outlook.com
 ([40.107.22.104]:54753 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kg95U-0004qy-3Y; Fri, 20 Nov 2020 11:16:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRhIvzbs2xIFdTVjGllrp/T5SXxNxY446J7MCijynxFsF8fr4CcPDa1prHVjE5l708AqO6r+/rkDTPw7Jwevh12gVEF4i6dcOJzr/09hJqn+DAk9kgAFB6GfdjEGx3n0vLIKhWvIx9yAMCsg/mSNItdzxp4ryWTvn6OdpjLqQghEGDJdIA6EzkUL6JRyuPBSOcTCB0TLQHZ0PKlFsxs/JFomrfEiZWDffhN2AILBHGIm/JksTtWjt2iqWoL0tKYoOmUEPSjbg1uiGdr3uSzh4txQ3i8NniFWJ3JiecHHKOISCRQYfzVjytE/TDMqdZr5fnhGtDee0jenE2vYtdzw3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EG0W+L8cIsGGQDhwxYMNrF9Dw4rnBMutPjnX8bQBulU=;
 b=U+BEVnPlef0XHuvoIF+eP4S8bGzAfcqGH2oIn5EGzJeP3T1tPlioe53r6KM9U2m8mBQ4a6pSwcz7TP5DhtHyajFN1LsH41llUAo1FEbKI9pthMoXOVIGMTBjiBi2E0Xk0HGV5hLciDhTWGFn60ypSmOXUI3/OSy7P6ZKnWWvj7htVkJGFqzvwb2gTTVY47dcBsLKqPDdRG3IOBp/iIrRIa5TQOxYrVbNWF3DQbKvxw/VNKJbI47c1UpDdwVqwAA7tFD9Mo4hPDkHKNLgW4oGWzrSxvic4Y8NsI3SY79LCRsmJVUbsSqT8rKu2gMzBTg4EORXAwFkAe9lPq7AwPayAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EG0W+L8cIsGGQDhwxYMNrF9Dw4rnBMutPjnX8bQBulU=;
 b=kolod0pPqE0cH7QxmA8tNRzXlUP0X+Uia1Cmiins4jIXYQusqBwOCwBG3SwdmniPJvBXm9/r4zWqcFRmeHyem6IHMfTTAC6f8yBO8HYsPVQzN5oSI69lwzSa6cfe3HRWofhugM1+2eMrXdWDSERQscj4WQ4U1eDPqnW5SERDjFA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5333.eurprd08.prod.outlook.com (2603:10a6:20b:104::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.26; Fri, 20 Nov
 2020 16:16:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.021; Fri, 20 Nov 2020
 16:16:36 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, philmd@redhat.com, peter.maydell@linaro.org,
 berto@igalia.com, stefanha@redhat.com, pbonzini@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, eblake@redhat.com
Subject: [PATCH RFC 0/5] Fix accidental crash in iotest 30
Date: Fri, 20 Nov 2020 19:16:17 +0300
Message-Id: <20201120161622.1537-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.108]
X-ClientProxiedBy: FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::9) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.108) by
 FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.13 via Frontend Transport; Fri, 20 Nov 2020 16:16:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5644a4d4-3eac-436d-cfa2-08d88d6fa735
X-MS-TrafficTypeDiagnostic: AM7PR08MB5333:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5333ECC958F86BBCB4F18483C1FF0@AM7PR08MB5333.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UPvxDEALPeeIWunIhzBXQnQtvQdTe+pwT5VoXGcIww5lUBDXDEhooThHAa/xkb0XaOXoqC8lzaj8FK7W13NSi9quNh+6v48RjPQxWtDZRBrmrnr8k2R7vLBdz63n/Lb2UWDlU/hK8WjpJ15jUb3TMwhjod9XmtSsTbnAoCPvZOymvLlGB5LDHTRBAR9NvSaIu1EKngVV6uP7GWKqgrYp5YmHCB9QJ4gCNnc3mQhaKhL6er6cB5XbaQdcEnh3s1u1Md6Sz/a9OtyTg3Uge9IR2GyNM6PD08849w2+P9FsrN3LYzk1gE8mX5a59fMPvbd9j3H+D1XmKdACyvLlW1c/E9ER2MXqUPIf3Pnl1hfBnTwzYat7hPelsEvHjWPw8qA6SqjEXqN0jbwl2Uxb/QnoPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(376002)(39840400004)(396003)(6512007)(1076003)(2616005)(7416002)(6916009)(966005)(66556008)(2906002)(478600001)(83380400001)(52116002)(66476007)(66946007)(86362001)(26005)(5660300002)(316002)(6666004)(956004)(6506007)(36756003)(16526019)(6486002)(8936002)(186003)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: gSgjM7qThpeYzRxQzgW17QfGFHHuzSTmud1BDgWTgB0QX9kxSRcENj6IcgBTeozZSqtQnY8pc/awW3N8YJEQ16ZMsiPkqSdRM7SgoAvk6aTXbxSBE+tmR3w+nrGri/mGopLfRyOEOcRCFxF+3zV2YnzhCq7QRs9+JxJatZ2WSm33QG2u+5mE8At3cS3fIBTSDy8c9u54+NOg1Eana78mAs8lZ2v693lu0ChJpcyMERUK6G4c7T3bcj23VUarSf85SBnoUFFlEb+ijsgzo5MTL3ha5gcyC+8dy/6oMaD1/7QjmMVj1CosmUW+FC9cuBYWlBr6aCbcWPfcg0incNaqN0TNRf3odNv5bwcg75W87QsKDYOIqP0MIvEdrG+lJJ3geJbc9Kj1FFwgPWW5j7o5yIKfyMj+puJlBcx2vniRfzSZj12XNpgsrtn29uTE8jqxTR316eMiUbWiZ20sVleRol1uRtQ8fIsDpVl3dadtvVySUzDygg8M0TdaY5Cbi4qOgeL/6o7G7VDRNpQ0Pt+1ATKyOlVT0phSoI2IkzL4MYXlP6MtgmYkxI+smUjI53w0Gy08vpwoRsTt1qoUsz3/UvDfENVXX9y18zbvem1bc47XClKvYnJcRWi/rSQENeEOEaYFHQacIjZY1oAKb2KYZQ==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5644a4d4-3eac-436d-cfa2-08d88d6fa735
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 16:16:36.2020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LDG4BK6phjFyUaUwnKmikJQ2vodAR1XNmZ19qzv4Fdsw5eSxrcr+C6W8yPN6mYJBsTGuAgCgZBiQyHgUnLeY58RFq5e3xxTbW2MAg4N7Kvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5333
Received-SPF: pass client-ip=40.107.22.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

As Peter recently noted, iotest 30 accidentally fails.

I found that Qemu crashes due to interleaving of graph-update operations of parallel mirror and stream block-jobs.

So, here is a "workaround" to discuss.

It's of course not the full solution, as if we decide to go this way we should protect by the mutex all graph-modifying operations, not only here. And move everything into coroutine..

So, I send this mostly as a starting point for discussion, may be someone imagine better solution.

Main patches are 04-05. 01-02 only simplify debugging and 03 is
preparation for 04.

Original qemu crash looks like this:

#0  0x00007f7029b23e35 in raise () at /lib64/libc.so.6
#1  0x00007f7029b0e895 in abort () at /lib64/libc.so.6
#2  0x00007f7029b0e769 in _nl_load_domain.cold () at /lib64/libc.so.6
#3  0x00007f7029b1c566 in annobin_assert.c_end () at /lib64/libc.so.6
#4  0x0000558f3d92f15a in bdrv_replace_child (child=0x558f3fa7c400, new_bs=0x0) at ../block.c:2648
#5  0x0000558f3d92f6e1 in bdrv_detach_child (child=0x558f3fa7c400) at ../block.c:2777
#6  0x0000558f3d92f723 in bdrv_root_unref_child (child=0x558f3fa7c400) at ../block.c:2789
#7  0x0000558f3d897f4c in block_job_remove_all_bdrv (job=0x558f3f626940) at ../blockjob.c:191
#8  0x0000558f3d897c73 in block_job_free (job=0x558f3f626940) at ../blockjob.c:88
#9  0x0000558f3d891456 in job_unref (job=0x558f3f626940) at ../job.c:380
#10 0x0000558f3d892602 in job_exit (opaque=0x558f3f626940) at ../job.c:894
#11 0x0000558f3d9ce2fb in aio_bh_call (bh=0x558f3f5dc480) at ../util/async.c:136
#12 0x0000558f3d9ce405 in aio_bh_poll (ctx=0x558f3e80c5f0) at ../util/async.c:164
#13 0x0000558f3d9f75ea in aio_dispatch (ctx=0x558f3e80c5f0) at ../util/aio-posix.c:381
#14 0x0000558f3d9ce836 in aio_ctx_dispatch (source=0x558f3e80c5f0, callback=0x0, user_data=0x0)
    at ../util/async.c:306
#15 0x00007f702ae75ecd in g_main_context_dispatch () at /lib64/libglib-2.0.so.0
#16 0x0000558f3da09e33 in glib_pollfds_poll () at ../util/main-loop.c:221
#17 0x0000558f3da09ead in os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:244
#18 0x0000558f3da09fb5 in main_loop_wait (nonblocking=0) at ../util/main-loop.c:520
#19 0x0000558f3d7836b7 in qemu_main_loop () at ../softmmu/vl.c:1678
#20 0x0000558f3d317316 in main (argc=20, argv=0x7fffa94d35a8, envp=0x7fffa94d3650)
    at ../softmmu/main.c:50
(gdb) fr 4
#4  0x0000558f3d92f15a in bdrv_replace_child (child=0x558f3fa7c400, new_bs=0x0) at ../block.c:2648
2648            assert(tighten_restrictions == false);
(gdb) list
2643            int ret;
2644
2645            bdrv_get_cumulative_perm(old_bs, &perm, &shared_perm);
2646            ret = bdrv_check_perm(old_bs, NULL, perm, shared_perm, NULL,
2647                                  &tighten_restrictions, NULL);
2648            assert(tighten_restrictions == false);
2649            if (ret < 0) {
2650                /* We only tried to loosen restrictions, so errors are not fatal */
2651                bdrv_abort_perm_update(old_bs);
2652            } else {


And my exploration shows that this due to permission-graph already broken before this permission update. So we tighten restrictions not because removing the child but because we recalculate broken permissions graph and it becomes correct (and more strict unfortunately).


Also, please look through my explorations on this topic in threads:

"iotest 030 still occasionally intermittently failing"
https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg04018.html

"question about bdrv_replace_node"
https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg04478.html

Vladimir Sementsov-Ogievskiy (5):
  abort-on-set-to-true
  iotest-30-shorten: concentrate on failing test case
  scripts/block-coroutine-wrapper.py: allow more function types
  block: move some mirror and stream handlers to coroutine
  block: protect some graph-modifyng things by mutex

 block/coroutines.h                 | 11 +++++++
 include/block/block.h              |  2 ++
 block.c                            | 36 +++++++++++++++------
 block/mirror.c                     |  9 ++++--
 block/stream.c                     |  9 ++++--
 scripts/block-coroutine-wrapper.py | 36 +++++++++++++--------
 tests/qemu-iotests/030             | 52 +++++++++++++++---------------
 tests/qemu-iotests/030.out         |  4 +--
 8 files changed, 105 insertions(+), 54 deletions(-)

-- 
2.21.3


