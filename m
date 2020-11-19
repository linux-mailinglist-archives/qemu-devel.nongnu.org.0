Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD632B9777
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 17:13:55 +0100 (CET)
Received: from localhost ([::1]:36340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfmZF-0004qx-RY
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 11:13:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfmXO-0003pC-RW; Thu, 19 Nov 2020 11:11:58 -0500
Received: from mail-eopbgr150113.outbound.protection.outlook.com
 ([40.107.15.113]:58547 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfmXE-0004Rr-4e; Thu, 19 Nov 2020 11:11:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k18oU+7OAskW/DsctA635DaRuEF/Je+rz8UWsqKO9y5G/DvrgJ4EvtD1wH2SDp5q7NX0rfyuwZ2qgkqzXC0ldwu1UVESlXTeDCuGa+bq0tdMZP0ld7PeXmJAZUqUOkVls3Q+zkdbEwb06/JdM0zvJgRjmmodzrpIh8ZpFXI/dB01u+ruuie5IJtXI/HakQ+F+sl5mkppEWZ9MoMOuQNqIyMlu0nS0mv+EaonRLmOYgTVtS4211BWgCUvGV5vkUtj3rCgpBtfPaoQIzc3nnlK3HFbedsAdIE6cfGBsC4kHvpxLdMzoQsxlD3Z8cWUj5hxMzFrJZ0e9dFFpZsUgYQ1TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5HCiPhuFbjSmV2mMokv4UKhi5CbrvWOlzc9iDSzllSE=;
 b=XSsp7zZSl93o1jImg3aUtEoF6W8+9Ylw3iL7rSCRkjTiNTlw0kNxRfLIfOIFPcVoWD+MTFjr9eW1DY7tv0P75yDD4MznSd9dGgN2QHK3cmMAaoTkNVmKu2QrnKOE6xkpiOBbaxTsv114wZCARL0eSDuChN+Eq7Ql99IQEaQWC2T0q8eLAnfAnR2DUAhx/2MxOTnEduBy/kdy5ZepkKkiM6TyEwlr1fYDVZqkcIPvWM4sMbz8mehUFpnR+ybI70l7vkrXRRYkpqjtOMaSsa32ZSXvrp5xjBo7JCT03JOM7NE/0G86rX7q8llK+mUonU750BTnrtLpi333ISS4UD2E2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5HCiPhuFbjSmV2mMokv4UKhi5CbrvWOlzc9iDSzllSE=;
 b=JSeqbNmPHVCkBw/nv33ebAxIS1ZWTUCMcQUq5nO04l1kqhbvsdNU6iDSVhGTC0zmfNjouyK/0yWN0+FwX22SkwIdeBL0oTf5BigN7gji0WxupK2hrzBh5D1yOUOR/4sohRZ9Lepu3uEiqssLwXHehuTZyWdGWKjnxkEawmFoBwQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5990.eurprd08.prod.outlook.com (2603:10a6:20b:296::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Thu, 19 Nov
 2020 16:11:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.021; Thu, 19 Nov 2020
 16:11:41 +0000
Subject: Re: iotest 030 still occasionally intermittently failing
To: Peter Maydell <peter.maydell@linaro.org>, Alberto Garcia <berto@igalia.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
References: <CAFEAcA8OqZe9MYmp=B023bTqatP-KcoGsh_vQ4OZ=a=jh09wcQ@mail.gmail.com>
 <w51tutpp5nr.fsf@maestria.local.igalia.com>
 <CAFEAcA-Me4jw5TPYCHkJSX=9bAw0kzTMadyMM3YabGFNu+swkg@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a058f32e-402b-d269-a6a2-5c30e28abc4f@virtuozzo.com>
Date: Thu, 19 Nov 2020 19:11:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
In-Reply-To: <CAFEAcA-Me4jw5TPYCHkJSX=9bAw0kzTMadyMM3YabGFNu+swkg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.89]
X-ClientProxiedBy: AM8P190CA0028.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.89) by
 AM8P190CA0028.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 16:11:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3644fbfa-7bcc-40e1-5f2e-08d88ca5ccec
X-MS-TrafficTypeDiagnostic: AS8PR08MB5990:
X-Microsoft-Antispam-PRVS: <AS8PR08MB59902054CDDE033662372D4CC1E00@AS8PR08MB5990.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: abaSvuNDS+PUIQkF/tfaawG/wglHPgVzg/LrmCxtbBQDebpGnkUxIp4iBEdk7NiLhxpJk5AHtRYPuuoBxhtn+4uTl70+MXlj871rSlIK62wViiZmiWH0Jp+/zZaJ29neSsN4+Xry/TdcZbI08S7a6GAVYDAQZ5itcfgp1HFhJZ+GsQJE15ufsQ89LZ8VZ7Jo6y6sJEZffzP3n8L1CoVY9sBce3yKyZ7kw02WY7K7ZI84cIi6AashnOTzXMxARCwsq8T26Mfcho4ZFHYqFS4CTvQPY5rjiWWxcr9O2UFJbefq61NUAAPs6lp4eJH63yfs32zy2Q+BlywU4BBksb+tEjR1MjdTqFJ8saEHkcXSCno04Fi02RAyZdJ+KLnQimou
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(52116002)(8936002)(5660300002)(2906002)(16526019)(83380400001)(186003)(16576012)(498600001)(66556008)(66946007)(54906003)(86362001)(26005)(66476007)(110136005)(2616005)(31686004)(6486002)(4326008)(956004)(36756003)(31696002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: j9nvwdiZDZdxkBKBYtLLDIjekZO5Z1QHT1LgU6ESCk+1H8WqZrgwQGQv+JqdmVtaMiUgm8JTQqqHqozEwZY7CII8ykIz4OpFn54UV4aN7pu3zzMfvWpQBhmV6AhgC7X/CWBtsU0fc/jBAMnkmyBsnmXQvWJZUg9YTkOMyd3EU0mU+KnUnzJ8RrmyrHvw32e23men7y3jnEyMH5jAEph6htwzyUs3m2zSTwX6Jejhk3c6dOzwyOMGQ5KxazNz1RtURF3rCGJ+HqQU9hetauhZambwoNWGJ2gMgnR36Gh3RRUSTyKQmKWZ+ql1LuS6lyGXIs7evsxOm13QbBLkJK9TQ8pwuGvdXVECW7K6RfTiUllLYdKRmrvLEvSkdMqwwkiGBS2LRrzirkge9GTMDWw+GJMtRdN01AV4vh8l0VPCmYm5Tbc3dAQt319sD+6FMqfrvV4UOzKTeyHRNd5czmAeO0tfUJSngKxsLZXkWuidgD+Reuw0WyYpXAMEtHOmKJHUbskML+npsOvPCRXmupXhyzKkGHp1I8iqEe1wNbAfoKLgBbV29FJJizstGcjbc3SZiKA4OtCoTfjD3UtnqeEn2yGaw/EuhmYfFVi758u8WF8AflROIvBtcy4T1itYsLhPrGlXfXNgzjKntM7FIFP89A==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3644fbfa-7bcc-40e1-5f2e-08d88ca5ccec
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 16:11:41.0919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z4yqQ5PhRd5PFlH/mUy58w8ib/nxmDz43ltTyhGHh2urGXkgjtzWX2E14MlL9Ghlt+i4zqbdUSd3/s10dNQ+C/MDB5PlqmoqQak6JXOVLmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5990
Received-SPF: pass client-ip=40.107.15.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 11:11:42
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

16.11.2020 20:59, Peter Maydell wrote:
> On Mon, 16 Nov 2020 at 17:34, Alberto Garcia <berto@igalia.com> wrote:
>> Do you know if there is a core dump or stack trace available ?
> 
> Nope, sorry. What you get is what the 'vm-build-netbsd' etc targets
> produce, so if you want more diagnostics on failures you have to
> arrange for the test harness to produce them...
> 
> thanks
> -- PMM
> 

Hi!

After some iterations I've reproduced on SIGABRT:

#0  0x00007feb701bae35 in raise () at /lib64/libc.so.6
#1  0x00007feb701a5895 in abort () at /lib64/libc.so.6
#2  0x00007feb701a5769 in _nl_load_domain.cold () at /lib64/libc.so.6
#3  0x00007feb701b3566 in annobin_assert.c_end () at /lib64/libc.so.6
#4  0x000055a93374f7d3 in bdrv_replace_child (child=0x55a9363a3a00, new_bs=0x0) at ../block.c:2648
#5  0x000055a93374fd5a in bdrv_detach_child (child=0x55a9363a3a00) at ../block.c:2777
#6  0x000055a93374fd9c in bdrv_root_unref_child (child=0x55a9363a3a00) at ../block.c:2789
#7  0x000055a933722e8b in block_job_remove_all_bdrv (job=0x55a935f4f4b0) at ../blockjob.c:191
#8  0x000055a933722bb2 in block_job_free (job=0x55a935f4f4b0) at ../blockjob.c:88
#9  0x000055a9337755fa in job_unref (job=0x55a935f4f4b0) at ../job.c:380
#10 0x000055a9337767a6 in job_exit (opaque=0x55a935f4f4b0) at ../job.c:894
#11 0x000055a93386037e in aio_bh_call (bh=0x55a9352e16b0) at ../util/async.c:136
#12 0x000055a933860488 in aio_bh_poll (ctx=0x55a9351366f0) at ../util/async.c:164
#13 0x000055a93383151e in aio_dispatch (ctx=0x55a9351366f0) at ../util/aio-posix.c:381
#14 0x000055a9338608b9 in aio_ctx_dispatch (source=0x55a9351366f0, callback=0x0, user_data=0x0)
     at ../util/async.c:306
#15 0x00007feb71349ecd in g_main_context_dispatch () at /lib64/libglib-2.0.so.0
#16 0x000055a933840300 in glib_pollfds_poll () at ../util/main-loop.c:221
#17 0x000055a93384037a in os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:244
#18 0x000055a933840482 in main_loop_wait (nonblocking=0) at ../util/main-loop.c:520
#19 0x000055a933603979 in qemu_main_loop () at ../softmmu/vl.c:1678
#20 0x000055a933190046 in main (argc=20, argv=0x7ffd48c31138, envp=0x7ffd48c311e0)

(gdb) fr 4
#4  0x000055a93374f7d3 in bdrv_replace_child (child=0x55a9363a3a00, new_bs=0x0) at ../block.c:2648
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
(gdb) p tighten_restrictions
$1 = true


Hm. it seems that the problem is that tighten_restrictions is not initialized. I'll send a patch.

-- 
Best regards,
Vladimir

