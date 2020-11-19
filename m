Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 420D12B979A
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 17:18:23 +0100 (CET)
Received: from localhost ([::1]:41870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfmdZ-0007Om-UX
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 11:18:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfmbq-0006m3-EF; Thu, 19 Nov 2020 11:16:34 -0500
Received: from mail-eopbgr40127.outbound.protection.outlook.com
 ([40.107.4.127]:28816 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfmbn-000680-A8; Thu, 19 Nov 2020 11:16:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ks3cKNBddcUhpdp8Vsfd5RMIygFCk5tum7ZR1AoVLG4KSUYcrYGR3pVbfmkqnx7pwoOpDNowazWM3vkRedGgKW4QBwWd8SRfNsXrx3nrHJrI0BGlcY8GRCi5DbTF+JiEm14pY8D8d5KDn18lGiZ+UnE1WviEpOGikZaLBhLB9I094yQUQu0r7EfVh+Iqfo7t0gzdztlT/s6qFo1sHNLHxQz/QmswZSEoHDGyzmjUA8rulSyD5MpJMnPN0lajb3wM3DqqbU921lIXvWtNgDyvjOTW1IAwGZkdEN6jFNlaRV+fbzlIpmz2SsD0T6OuOZxcIw7S1QQdDmfKHtsILS4sWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m58BDGCWLzGIV146xVSBKZnsPPgi5pnGkzSzBqDoA8Y=;
 b=je4jPyFWoyNFjKqXl7Vgw5Rnj4AxexOm4xaCzOhtw7eOZUZ9DREcDFwEOxX0LpVnHEaIobbDcK9NEpCmQD2MX0JW2bwvh6nJOJaK+vUss7/AJU2VHlr9K74BJOw6gKbklRf2/iH+0S+CNjhVjRbrrMdCwmVTncoqam5NROaXVbjcPT6/GbMOjab3PJt/6e4gyBHE9WV1uBQZCWIX90RDxkcKa2TM9R/Mnj0/yS2VQSX66g1TE6LGjVa8MmC3jcuT2JR1f8qTlF8Qbdp4MKYa/E8Mfs3Mnh6IeSyeRuWVxy10QIZ2mcXKRF+KTda+q50vEuBkpAoYyxyB6H54ydoNUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m58BDGCWLzGIV146xVSBKZnsPPgi5pnGkzSzBqDoA8Y=;
 b=LvHbifnUEIBYwjh3549pub+wFlsWa7f4SsokeCeDWWebG66ozMDIDdKwUzafDiZHakQo3F9Bsz5/Qqek6gmjzzsEXRbdtzaUj/WiDT5gIwCvg4wdYYPaiTCIQ/okjAYykuMKtn2hoex2ygrdsSQedLQraJqbb39YswPbxQxdrZA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2530.eurprd08.prod.outlook.com (2603:10a6:203:98::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 19 Nov
 2020 16:16:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.021; Thu, 19 Nov 2020
 16:16:27 +0000
Subject: Re: iotest 030 still occasionally intermittently failing
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Peter Maydell <peter.maydell@linaro.org>, Alberto Garcia <berto@igalia.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
References: <CAFEAcA8OqZe9MYmp=B023bTqatP-KcoGsh_vQ4OZ=a=jh09wcQ@mail.gmail.com>
 <w51tutpp5nr.fsf@maestria.local.igalia.com>
 <CAFEAcA-Me4jw5TPYCHkJSX=9bAw0kzTMadyMM3YabGFNu+swkg@mail.gmail.com>
 <a058f32e-402b-d269-a6a2-5c30e28abc4f@virtuozzo.com>
Message-ID: <e04cd5c0-6975-48af-9efa-2a2e16fa6605@virtuozzo.com>
Date: Thu, 19 Nov 2020 19:16:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
In-Reply-To: <a058f32e-402b-d269-a6a2-5c30e28abc4f@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.89]
X-ClientProxiedBy: AM8P192CA0013.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.89) by
 AM8P192CA0013.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21b::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 16:16:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a65c1705-7a29-4235-0215-08d88ca67776
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2530:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB25307EB5839FCECD416F2778C1E00@AM5PR0802MB2530.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N2t280m8wLSYDR0Yf0NpcT+VK8lw3UhJYMUyiTAI8xut/AAGU+21uDdpHWkoqWW7Kiatc0/V22pylM0Q0w7lClobGclypLRidM/CwNe3FhCJ2jvZReHMF5BRAS3pcasSVDxU1kYSS45zIN2jNt29HH9z01fd6wSL83NAV04PgUCe1KY+1ZIVSEcEiDIyXXlvDNngFZncleK1WCfdpTpDDuQov8Piqcd4xuz9kGM1LOenHPYg4tC2BWJlZM6/JL/KD315Ipe+8ULSlQvE+ML8c8/MzmpX47ATsbsAn9F6zW0Muj/ZH+Fhs07PDxXed6b1zVkzXpRprY95z3Cv+UfhwInOC0yxRCnoGBtdsc5wSa3x4BymF1UgyjiViyxiJkkR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39830400003)(136003)(376002)(396003)(346002)(16526019)(186003)(5660300002)(110136005)(66946007)(66476007)(16576012)(26005)(86362001)(36756003)(4326008)(31696002)(316002)(2616005)(31686004)(6486002)(54906003)(83380400001)(66556008)(52116002)(478600001)(956004)(8676002)(8936002)(2906002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 6Ru36mCPfLVqH2Wej2hZfD3d7rPv2qXRkm6lTyPKgErlyjE1jkXIAIODe48f5Zyv1/a6KlOeIU/AeJzpp3Qwwrcw2h5d/isa+hxoMJUX7igeKPjdq2+pH1zZVhkoWyiLo7M7v/uNX1DWVCAGx7kYjYSo3kMNeDRFChhcKYKtYLDG/TxdjzwYuTxQTnlkJg0Np5y0qDOF9mPLh+ptpVkR0g/FJ14psgpYFdSvX6wwM8wsCzPRzLsQMEMlK5mSU2fG2yBCCStJlvqp/F+OCvHBv3us2VYfyXa3G0YREtkaxlx7uC9zJO3gzKEEfNA9eUv/zqi0rUbF/vipfL9ezTZEAPk9FD3HqT2Aa0fT2PiVANLNSN8ACc7gh+yn1I1jqy7LlcTiHWPTODdjJqlgFUdhEEHrUJlwmNV+hHA9M98uhTxkvj4pud4qdOf0smDwYpXGm9Xd27bncNrwB0Ee/dvHkbUcvWBqdrSESLzKO0I4SiY507VdkPf3B1FuxAbg3px6JdbhRv1t8ylQKMQwqE8+6nw1m2lEx/eIybMNd5r1saEljlSAQweM8FCfLwM34E359HlClfl90AY4DSvBguALSV+Q3EqGJ0f5NW7rj1E5VBmbxVa0HTpkCHkvOZAVQ1vB2mUHTP8ohjVrS1dUckqbHQ==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a65c1705-7a29-4235-0215-08d88ca67776
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 16:16:27.0523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3n4KE6vnvUb7iN1LnWg6Pf2nQa/a70941Jir/sbdBC8LCTsoLVNm95B8KQwsWjFzVgVOR2JEI0/6ahQbupdq6RBwRQUwG8ze7tCT2UEEF2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2530
Received-SPF: pass client-ip=40.107.4.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 11:16:28
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

19.11.2020 19:11, Vladimir Sementsov-Ogievskiy wrote:
> 16.11.2020 20:59, Peter Maydell wrote:
>> On Mon, 16 Nov 2020 at 17:34, Alberto Garcia <berto@igalia.com> wrote:
>>> Do you know if there is a core dump or stack trace available ?
>>
>> Nope, sorry. What you get is what the 'vm-build-netbsd' etc targets
>> produce, so if you want more diagnostics on failures you have to
>> arrange for the test harness to produce them...
>>
>> thanks
>> -- PMM
>>
> 
> Hi!
> 
> After some iterations I've reproduced on SIGABRT:
> 
> #0  0x00007feb701bae35 in raise () at /lib64/libc.so.6
> #1  0x00007feb701a5895 in abort () at /lib64/libc.so.6
> #2  0x00007feb701a5769 in _nl_load_domain.cold () at /lib64/libc.so.6
> #3  0x00007feb701b3566 in annobin_assert.c_end () at /lib64/libc.so.6
> #4  0x000055a93374f7d3 in bdrv_replace_child (child=0x55a9363a3a00, new_bs=0x0) at ../block.c:2648
> #5  0x000055a93374fd5a in bdrv_detach_child (child=0x55a9363a3a00) at ../block.c:2777
> #6  0x000055a93374fd9c in bdrv_root_unref_child (child=0x55a9363a3a00) at ../block.c:2789
> #7  0x000055a933722e8b in block_job_remove_all_bdrv (job=0x55a935f4f4b0) at ../blockjob.c:191
> #8  0x000055a933722bb2 in block_job_free (job=0x55a935f4f4b0) at ../blockjob.c:88
> #9  0x000055a9337755fa in job_unref (job=0x55a935f4f4b0) at ../job.c:380
> #10 0x000055a9337767a6 in job_exit (opaque=0x55a935f4f4b0) at ../job.c:894
> #11 0x000055a93386037e in aio_bh_call (bh=0x55a9352e16b0) at ../util/async.c:136
> #12 0x000055a933860488 in aio_bh_poll (ctx=0x55a9351366f0) at ../util/async.c:164
> #13 0x000055a93383151e in aio_dispatch (ctx=0x55a9351366f0) at ../util/aio-posix.c:381
> #14 0x000055a9338608b9 in aio_ctx_dispatch (source=0x55a9351366f0, callback=0x0, user_data=0x0)
>      at ../util/async.c:306
> #15 0x00007feb71349ecd in g_main_context_dispatch () at /lib64/libglib-2.0.so.0
> #16 0x000055a933840300 in glib_pollfds_poll () at ../util/main-loop.c:221
> #17 0x000055a93384037a in os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:244
> #18 0x000055a933840482 in main_loop_wait (nonblocking=0) at ../util/main-loop.c:520
> #19 0x000055a933603979 in qemu_main_loop () at ../softmmu/vl.c:1678
> #20 0x000055a933190046 in main (argc=20, argv=0x7ffd48c31138, envp=0x7ffd48c311e0)
> 
> (gdb) fr 4
> #4  0x000055a93374f7d3 in bdrv_replace_child (child=0x55a9363a3a00, new_bs=0x0) at ../block.c:2648
> 2648            assert(tighten_restrictions == false);
> (gdb) list
> 2643            int ret;
> 2644
> 2645            bdrv_get_cumulative_perm(old_bs, &perm, &shared_perm);
> 2646            ret = bdrv_check_perm(old_bs, NULL, perm, shared_perm, NULL,
> 2647                                  &tighten_restrictions, NULL);
> 2648            assert(tighten_restrictions == false);
> 2649            if (ret < 0) {
> 2650                /* We only tried to loosen restrictions, so errors are not fatal */
> 2651                bdrv_abort_perm_update(old_bs);
> 2652            } else {
> (gdb) p tighten_restrictions
> $1 = true
> 
> 
> Hm. it seems that the problem is that tighten_restrictions is not initialized. I'll send a patch.
> 

wrong, bdrv_check_perm initializes it correctly.. I'll look more careful.


-- 
Best regards,
Vladimir

