Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 785773109FB
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 12:13:05 +0100 (CET)
Received: from localhost ([::1]:58544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7z2u-0007Lc-Hz
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 06:13:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7z0i-000691-Gs; Fri, 05 Feb 2021 06:10:50 -0500
Received: from mail-db8eur05on2133.outbound.protection.outlook.com
 ([40.107.20.133]:5088 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7z0a-00073l-Nt; Fri, 05 Feb 2021 06:10:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lFoyxYb0vOxpSaqP1fHQtIvkZFUhz0Rk5LlYe/+u3+Ffe7tWr68QQEYjVrVOlXh/B7hE4+wxE+itgBjPvdgdhgVlvEGZwN1Mjy4NRjk+90dU7NycYhK0tzabYVCUn6zK9DlDGPujAsYO+fUZg1ZzlgPCOuHB18ziJEGGmgj/NXQeqS4qqr+Idk5PLZgqMsJV5rpc6i/zPU+2DQzr9+sNYRkcT9abczziRTm62JTn5xb1T97qfU5J7TW7YLdX3vAcMaBDU6V9aTpW/wXsGXo/i3MIGkXMzvB/4XjOB8RNyyu6PjI2uIf8gjcbf9rjUp135NG7YbW5gKgFyd2xTUqxog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6Ie5mYXqefVzXXbtRXGm2VZD+r+90QeWeLr1pwW9Pg=;
 b=LmntPzEeh0dic4ZqfL7Ljmx3+5hxct+g1wAPURj9fHP8CdMOfny41P1nmcRcEM4+8fhCBcgmiKCq90loqYt7IGLmdRRcJWdoIwVjN01W1zqyHRz+RsCza1dG21BsiNZLAvFMiH4txj5h+f6ezOa1tnfrv7bECHT7ZF657EbzDHehJR/9uDsYHmeSJmx2df8/dU4vtK+ZQhZPLuhHvoBoCvPTQejzTd2s1D6SJktWe2Hxj69Jp0PvyMcstzYcOE2tl/6hMy2AnQMlsNZU6GO49MjH2OcpIyl2cvCk1jfOl4/2/lxkEoATkRzfeSeuJxcOeLfSOfU4Iqiz7bSGZbgopA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6Ie5mYXqefVzXXbtRXGm2VZD+r+90QeWeLr1pwW9Pg=;
 b=DuAA8fUQGVpsJBhH+pEhjgwJopm5Xy2mIlqBvh4m32NH+CTHYcPZ/J+X2WTEbLe4gwkPspfOxGDY37Ftbdt9/aL6+YNPbd7k+6vOmJrggbkdQDyl/sgQHwaqeXeRQe/OJkctCzgEF+yHQEbbhU5lWSc/CtTT5yCG7npRJShRUf8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3863.eurprd08.prod.outlook.com (2603:10a6:20b:8b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Fri, 5 Feb
 2021 11:10:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Fri, 5 Feb 2021
 11:10:34 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, cfontana@suse.de, peter.maydell@linaro.org,
 philmd@redhat.com
Subject: [PATCH] iotests: 30: drop from auto group (and effectively from make
 check)
Date: Fri,  5 Feb 2021 14:10:21 +0300
Message-Id: <20210205111021.715240-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.213]
X-ClientProxiedBy: AM0PR10CA0035.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.213) by
 AM0PR10CA0035.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend
 Transport; Fri, 5 Feb 2021 11:10:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a997ce1-1d3f-4d8a-7071-08d8c9c6a861
X-MS-TrafficTypeDiagnostic: AM6PR08MB3863:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3863C2970F9F998DBC5E23B5C1B29@AM6PR08MB3863.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:158;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GFIVWdryi8oc8gxKmdAAsHPhDCD0yPnDlw0Fli/Vs3NvAE0Yt2ktfEuvXFuko2r+AqgpT0sKgs5av3/zvVSMWUn814m0MB9D80rhaZu5ORwn+JuAAQwP8gGV9hMMQDpP7szKi2Z+vQEWQnFQudSWJD1x9OSTFPNlqpPUSO/Sr1ncwZpl+Tu/xN73TlLo030EgLXT+Q6asF/doINo7ek/P5SOFLqhMcieUWFDFZ+yOUSLyayE1Exg5meWiMYBesdiZByy7jzLukSA95IDJTa/LyXLfzvzGe+IsPH8g8okpkfGbrRPsgmyi1X7HjzElLDCyQR5usDrguoau7T5xbvZdvEOZO5+VBeYKFaduFpnkKbn3b0+MDfjQF4ovhYWAN98IYH7VJeTwM5nlSuXh2mwe4ViPVCmONalgSMHxJyuIAyOoQ82Su+cLsJ65l8HpXunRR599jHMj+0T8r5+oceTIdXocYK33s+C6ewdkrTBDazNxLPAqeWCQkiEefk4bJY2wncXDTlqfmT9L6Ujz7qngw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39840400004)(136003)(346002)(396003)(66946007)(66476007)(66556008)(52116002)(36756003)(478600001)(5660300002)(6916009)(316002)(8676002)(1076003)(16526019)(956004)(83380400001)(6666004)(186003)(2906002)(86362001)(4326008)(6486002)(2616005)(8936002)(6512007)(6506007)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?eu1lfk9iiHhEqW9ZNx5gOlqwjE77xyEJ/mReyIdS8a1WlLrhdjUVf9drR/lj?=
 =?us-ascii?Q?xXwF+OZqfo+CRbQ3pJogLEQOrEeIfAb4ewJdFj5j5Jvn8C68yy001xftC5X6?=
 =?us-ascii?Q?IGX4a7fT+mecfLSbJtqcT1Jwf81gZZOA6GT1bjgwi6jD0vJwB6oALzLLvbTG?=
 =?us-ascii?Q?6QSayC2Umo1fipsGoyIQuVgcOaGVVEEpdIhSY0KJ12ShSWEEzjquI5BqOn6t?=
 =?us-ascii?Q?O0cvKn6A3cllHAdHYAJD7N1ph/YTbSi8tauuhDCmfKOY5O0Q88aV1qC8VDkN?=
 =?us-ascii?Q?Z3tg3TwhpB1ohbCwYequb0ZUBD9A6M8/0awOp4GbGZX+LrWunZ2Gi81CwrR6?=
 =?us-ascii?Q?hM6rlCbqFfF8oq6iaeXUHsCe9UUE3/QiudRy22i7WiN980DAHuRC2NjBya/3?=
 =?us-ascii?Q?AbsH7v4U9rc4p6fXjeVIp+7z90OMrkInLjGVHNTpdDM+4lOhT95JuNNvHBfn?=
 =?us-ascii?Q?r2wMwu2Kkr1qCeY336p9XMtgnA2ZFQgjhF0wsw/e80o5sPiYrCHAf7/Qw/uo?=
 =?us-ascii?Q?kMcMSxPsRUAI+uN7mrneTAJUkG7kVNVnYpXtdg2PnYMAecpcpDyHa7dqM83i?=
 =?us-ascii?Q?Imctw0f4mKVnLnhYsO8orlCXQnfZlBraMTPyzvOjMF1XAPA3wXavr1ffmAbn?=
 =?us-ascii?Q?q2EEJnuwTDKJzhso/NNCzEYsTlBM5/ZO75rt5LsvJyi3Grbw2JHE8Sey9imN?=
 =?us-ascii?Q?XR6Wvn8RNqOKK9LjcQDqjEyU2zhYkIZNeOo7WSNJT06+CqKegiZTlL0JAktW?=
 =?us-ascii?Q?kHlpdZhG4J4GEbdpB1AwrhfcOmM0nLldCvOyPSLMs4uZM3qhZyf4dn4X59th?=
 =?us-ascii?Q?LfcK08xqcpWR7Lvt09CknerM0O1EypyDiX4BRH/39GK4/nrlbwdNqj1zG7Y9?=
 =?us-ascii?Q?BHNolbcic8ywYfwUt4BWGoTb9N5pY9tlk7zm1lSQH0zIaSzVPE92Y0IfSW7v?=
 =?us-ascii?Q?C7IdwUxmwWtO9DtPJ/C4zjbbeziE/1NnMqrKxOUCX6vChrSpmpe6bFt36EA6?=
 =?us-ascii?Q?0NoyHxJ1xdcEU/cTXWmkc+FfDmHdqcmVIuv9KQGQipi+4bFoSNb+VW759ibA?=
 =?us-ascii?Q?bq+wOwrD/XlDN6kKQ4tW6QHvgQKXo5syHEwm2WE5H3qxP+02QSRVyU3UuJzN?=
 =?us-ascii?Q?NXEEIjDPs4kteDkvTcyQsRfeZ8lLegzigReg5oWXUsaiLP0jBeylkV/rOCw6?=
 =?us-ascii?Q?Ue/5tbSTOiJWUiflBbQB9jgzLnIwk6D32dE9X2AGF81IOtRbYplbgtqGXqCY?=
 =?us-ascii?Q?SQJi6EZS6G6s6k4V587rFFHe1ks6FOnewlq02KsgWvSeGLE2LwELE+zp9kIO?=
 =?us-ascii?Q?y9nSPt0k0Ykh4tTu6ItwQQ/A?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a997ce1-1d3f-4d8a-7071-08d8c9c6a861
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 11:10:34.1816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lr7YgRt1EWlMndQ6ikfx9zrcumDobgF4hhIkPxxzSUhjmozIM+bX8cd8KeQ6jIf2OVaiGB48il7UFRfCJd870+PnXlHEigtf4md4lJLFBmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3863
Received-SPF: pass client-ip=40.107.20.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

I reproduced the following crash fast enough:

0  raise () at /lib64/libc.so.6
1  abort () at /lib64/libc.so.6
2  _nl_load_domain.cold () at /lib64/libc.so.6
3  annobin_assert.c_end () at /lib64/libc.so.6
4  bdrv_reopen_multiple (bs_queue=0x55de75fa9b70, errp=0x0)
   at ../block.c:3820
5  bdrv_reopen_set_read_only (bs=0x55de760fc020, read_only=true,
   errp=0x0) at ../block.c:3870
6  stream_clean (job=0x55de75fa9410) at ../block/stream.c:99
7  job_clean (job=0x55de75fa9410) at ../job.c:680
8  job_finalize_single (job=0x55de75fa9410) at ../job.c:696
9  job_txn_apply (job=0x55de75fa9410,
   fn=0x55de741eee27 <job_finalize_single>) at ../job.c:158
10 job_do_finalize (job=0x55de75fa9410) at ../job.c:805
11 job_completed_txn_success (job=0x55de75fa9410) at ../job.c:855
12 job_completed (job=0x55de75fa9410) at ../job.c:868
13 job_exit (opaque=0x55de75fa9410) at ../job.c:888
14 aio_bh_call (bh=0x55de76b9b4e0) at ../util/async.c:136
15 aio_bh_poll (ctx=0x55de75bc5300) at ../util/async.c:164
16 aio_dispatch (ctx=0x55de75bc5300) at ../util/aio-posix.c:381
17 aio_ctx_dispatch (source=0x55de75bc5300, callback=0x0,
   user_data=0x0) at ../util/async.c:306
18 g_main_context_dispatch () at /lib64/libglib-2.0.so.0
19 glib_pollfds_poll () at ../util/main-loop.c:232
20 os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:255
21 main_loop_wait (nonblocking=0) at ../util/main-loop.c:531
22 qemu_main_loop () at ../softmmu/runstate.c:722
23 main (argc=20, argv=0x7ffe218f0268, envp=0x7ffe218f0310) at
   ../softmmu/main.c:50

(gdb) fr 4
4  bdrv_reopen_multiple (bs_queue=0x55de75fa9b70, errp=0x0) at
      ../block.c:3820
3820                assert(perm == state->perm);
(gdb) list
3815
3816            if (ret == 0) {
3817                uint64_t perm, shared;
3818
3819                bdrv_get_cumulative_perm(state->bs, &perm,
                    &shared);
3820                assert(perm == state->perm);
3821                assert(shared == state->shared_perm);
3822
3823                bdrv_set_perm(state->bs);
3824            } else {
(gdb) p perm
$1 = 1
(gdb) p state->perm
$2 = 0

Then I had 38 successful iterations and another crash:
0  bdrv_check_update_perm (bs=0x5631ac97bc50, q=0x0, new_used_perm=1,
   new_shared_perm=31, ignore_children=0x0, errp=0x7ffd9d477cf8) at
   ../block.c:2197
1  bdrv_root_attach_child
    (child_bs=0x5631ac97bc50, child_name=0x5631aaf6b1f9 "backing",
    child_class=0x5631ab280ca0 <child_of_bds>, child_role=8,
    ctx=0x5631ab757300, perm=1, shared_perm=31, opaque=0x5631abb8c020,
    errp=0x7ffd9d477cf8)
    at ../block.c:2642
2  bdrv_attach_child (parent_bs=0x5631abb8c020,
   child_bs=0x5631ac97bc50, child_name=0x5631aaf6b1f9 "backing",
   child_class=0x5631ab280ca0 <child_of_bds>, child_role=8,
   errp=0x7ffd9d477cf8)
    at ../block.c:2719
3  bdrv_set_backing_hd (bs=0x5631abb8c020, backing_hd=0x5631ac97bc50,
   errp=0x7ffd9d477cf8) at ../block.c:2854
4  stream_prepare (job=0x5631ac751eb0) at ../block/stream.c:74
5  job_prepare (job=0x5631ac751eb0) at ../job.c:784
6  job_txn_apply (job=0x5631ac751eb0, fn=0x5631aacb1156 <job_prepare>)
   at ../job.c:158
7  job_do_finalize (job=0x5631ac751eb0) at ../job.c:801
8  job_completed_txn_success (job=0x5631ac751eb0) at ../job.c:855
9  job_completed (job=0x5631ac751eb0) at ../job.c:868
10 job_exit (opaque=0x5631ac751eb0) at ../job.c:888
11 aio_bh_call (bh=0x7f3d9c007680) at ../util/async.c:136
12 aio_bh_poll (ctx=0x5631ab757300) at ../util/async.c:164
13 aio_dispatch (ctx=0x5631ab757300) at ../util/aio-posix.c:381
14 aio_ctx_dispatch (source=0x5631ab757300, callback=0x0,
   user_data=0x0) at ../util/async.c:306
15 g_main_context_dispatch () at /lib64/libglib-2.0.so.0
16 glib_pollfds_poll () at ../util/main-loop.c:232
17 os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:255
18 main_loop_wait (nonblocking=0) at ../util/main-loop.c:531
19 qemu_main_loop () at ../softmmu/runstate.c:722
20 main (argc=20, argv=0x7ffd9d478198, envp=0x7ffd9d478240) at
   ../softmmu/main.c:50
(gdb) list
2192        QLIST_FOREACH(c, &bs->parents, next_parent) {
2193            if (g_slist_find(ignore_children, c)) {
2194                continue;
2195            }
2196
2197            if ((new_used_perm & c->shared_perm) != new_used_perm)
                {
2198                char *user = bdrv_child_user_desc(c);
2199                char *perm_names = bdrv_perm_names(new_used_perm &
                    ~c->shared_perm);
2200
2201                error_setg(errp, "Conflicts with use by %s as '%s',
                    which does not "
(gdb) p c
$1 = (BdrvChild *) 0x8585858585858585

and trying to reproduce it on top of
"block: update graph permissions update" I had 634 successful
iterations
and then the following crash (which looks much better):
0  raise () at /lib64/libc.so.6
1  abort () at /lib64/libc.so.6
2  _nl_load_domain.cold () at /lib64/libc.so.6
3  annobin_assert.c_end () at /lib64/libc.so.6
4  bdrv_replace_child_noperm (child=0x5585bb632010,
   new_bs=0x5585bc4f42a0) at ../block.c:2589
5  bdrv_replace_child (child=0x5585bb632010, new_bs=0x5585bc4f42a0,
   tran=0x7fff5a14d8e0) at ../block.c:2211
6  bdrv_set_backing_noperm (bs=0x5585bb704020,
   backing_bs=0x5585bc4f42a0, tran=0x7fff5a14d8e0, errp=0x7fff5a14d918)
   at ../block.c:3030
7  bdrv_set_backing_hd (bs=0x5585bb704020, backing_hd=0x5585bc4f42a0,
   errp=0x7fff5a14d918) at ../block.c:3072
8  stream_prepare (job=0x5585bc2ef230) at ../block/stream.c:74
9  job_prepare (job=0x5585bc2ef230) at ../job.c:784
10 job_txn_apply (job=0x5585bc2ef230, fn=0x5585ba638ad0 <job_prepare>)
   at ../job.c:158
11 job_do_finalize (job=0x5585bc2ef230) at ../job.c:801
12 job_completed_txn_success (job=0x5585bc2ef230) at ../job.c:855
13 job_completed (job=0x5585bc2ef230) at ../job.c:868
14 job_exit (opaque=0x5585bc2ef230) at ../job.c:888
15 aio_bh_call (bh=0x7f62b8004270) at ../util/async.c:136
16 aio_bh_poll (ctx=0x5585bb2ce4a0) at ../util/async.c:164
17 aio_dispatch (ctx=0x5585bb2ce4a0) at ../util/aio-posix.c:381
18 aio_ctx_dispatch (source=0x5585bb2ce4a0, callback=0x0,
   user_data=0x0) at ../util/async.c:306
19 g_main_context_dispatch () at /lib64/libglib-2.0.so.0
20 glib_pollfds_poll () at ../util/main-loop.c:232
21 os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:255
22 main_loop_wait (nonblocking=0) at ../util/main-loop.c:531
23 qemu_main_loop () at ../softmmu/runstate.c:722
24 main (argc=20, argv=0x7fff5a14ddb8, envp=0x7fff5a14de60) at
   ../softmmu/main.c:50

(gdb) fr 4
4  bdrv_replace_child_noperm (child=0x5585bb632010,
   new_bs=0x5585bc4f42a0) at ../block.c:2589
2589            assert(bdrv_get_aio_context(old_bs) ==
                bdrv_get_aio_context(new_bs));
(gdb) list
2584        int drain_saldo;
2585
2586        assert(!child->frozen);
2587
2588        if (old_bs && new_bs) {
2589            assert(bdrv_get_aio_context(old_bs) ==
                bdrv_get_aio_context(new_bs));
2590        }
2591
2592        new_bs_quiesce_counter = (new_bs ? new_bs->quiesce_counter
            : 0);
2593        drain_saldo = new_bs_quiesce_counter -
            child->parent_quiesce_counter;

So it seems reasonable to drop test from auto group at least until we
merge "block: update graph permissions update"

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

Note: be free to shorten commit message if needed :)

 tests/qemu-iotests/030 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
index 832fe4a1e2..12aa9ed37e 100755
--- a/tests/qemu-iotests/030
+++ b/tests/qemu-iotests/030
@@ -1,5 +1,5 @@
 #!/usr/bin/env python3
-# group: rw auto backing
+# group: rw backing
 #
 # Tests for image streaming.
 #
-- 
2.29.2


