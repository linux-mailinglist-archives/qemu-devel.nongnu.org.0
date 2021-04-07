Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 951CA356B70
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 13:41:40 +0200 (CEST)
Received: from localhost ([::1]:57480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU6Z1-0001QG-6G
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 07:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU6WK-00006H-C4; Wed, 07 Apr 2021 07:38:52 -0400
Received: from mail-vi1eur05on2133.outbound.protection.outlook.com
 ([40.107.21.133]:44768 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU6WC-0006kw-4e; Wed, 07 Apr 2021 07:38:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OTBi7oEX/anNTw5gjisIb5Gb7hJ0Kh+Q7g+qqxasTyhfy6qHhLgwRvev1MZmB5ylKF+3qsQZHVfnUZ7HlRogg6mZV1wr8d1FRlWmlrbjJRO15pXg1uxqZ5/HRsrsLmjK0TmibkJiYzkUnGqg24upbM7lh/M607paspmfS1b0SPB0UC3jMxfQvH+3iJej9kbpzetG0VY5n9GjtOmgKDpAeZMFTqNAb50Qew8K8ifDVDEyYP2O30oe30eBhrFljjRUtdRVViWgu6//ojOtbERzJhHr20mOXSudwasHY9BgSstnVVTOEoBG6w+9evi09RiQS+OualgbAJ8gwhXfKMZ0mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhtSPXHvKjVMfFZJZUNZP1Mxhti4XpniILCFt0hJ5Ys=;
 b=meIsop3zRTw7MrxLtsrmPIXTMMoKwryi0ggwomsp/o1tzGheQ/88VmEmKikpKCt7/8nFECwjt0VbOzfhvty5Pn+OotVdP7cJBcoBoSPXOWH7/IY2yJuRy/jNjR6S0KOgYrmy811GRZtcLHmswjzYCuxbodq5eew45xyDbhAvja+Xf0uiSZghx81VJqAtRZmdAHwUoTkhmX9ryaw/YJfZ9I0rQ5ESxSasHGPjZ8mWGBpcwtvOjKKm6hd/LgWKCA+SjwWG2KmdQ4ZXz6JZiRP1uhnuJwVDo4tJFvcdb9bGaKODPyBzOj6XbGBdqRgZQaNJopQm7k6hVvzkrTt9izn5Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhtSPXHvKjVMfFZJZUNZP1Mxhti4XpniILCFt0hJ5Ys=;
 b=SSxi8IK5dNwFIPB02lDikHzT6zqYiCVdGnrd9vfJmeSqC0qwI59OUEwzWZgOMYRfup7nd6XQ5WcJ5/8E9zMv7vAapRNetia9A/HqqmweICsGakfoZySb/wQ2a7UCB9R1++/mi63jnx0glEHvmeGRMvbW0d1rmm4dACRZ2aow/go=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5446.eurprd08.prod.outlook.com (2603:10a6:20b:107::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Wed, 7 Apr
 2021 11:38:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Wed, 7 Apr 2021
 11:38:37 +0000
Subject: Re: [PATCH v4 09/23] job: call job_enter from job_pause
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org
References: <20210116214705.822267-1-vsementsov@virtuozzo.com>
 <20210116214705.822267-10-vsementsov@virtuozzo.com>
 <7dea84af-188f-1145-0e4f-afefd9652256@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <062f350d-5194-393b-5725-953740ad4b0f@virtuozzo.com>
Date: Wed, 7 Apr 2021 14:38:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <7dea84af-188f-1145-0e4f-afefd9652256@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: ZR0P278CA0066.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.206) by
 ZR0P278CA0066.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:21::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 11:38:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 953c97b7-b0df-4aa7-b5a5-08d8f9b9af01
X-MS-TrafficTypeDiagnostic: AM7PR08MB5446:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB544641835FE5BF6044FD5D2FC1759@AM7PR08MB5446.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7RgLl27KN0gTA4r4FdZ6qEHSppyozj8WKV9anPv1HO6eBF9qJFHwv56GJVGEaJOPD2s0D/Fmlu2BpQUIUS4bIIlaNRG3kpfVSqdDzqSDjLt6fJzluKuAzU/x96CJZgFolNB0SwFsyCJRW02VJL4GPs19rxxXVUrHSLydRSFc3K6WhmM8GnR9IvOIiMbkb/zpcIJQadrImqtYfGYC7inG625nH+s23DUz24n5XpuuFOvOjsjn+jX5g4qvw6o2aXn/URJraeBFBVC/P+jWtrS408ckQBKhl33KQa626hYj0suctixVDtFB0q35lOERTQIY+/8NSBphO8zb5K37k78AyWzZyn7XZqQ57t02pZ/i0P9FRLLJdtlJVC/oreT4+EXDY31QGTuLzQFPV3eH3o/Oa0Y1UEF7JAXe1k/TJS08mfMLUS8OxY68WGTVaUTwZNSDdEuJOpK7gK/7goMaYeemPZ8FLdFn98VBqNy5xBvpi2DDVk/SG8gUyfGunUxboBF9fPj7VPZ9OxsCMnOiEF/xhBK4eia5Cz86nIFamxcOYkg5npJ0vOXgp0T2rUTrie7JOLoA+3ZqBcZwFTY4y2UEKM0DTaTFycgaKN5VluGMRkODupPZOHPzWAcZhiJcX0/NRSpaTCNDUNNGVgzidhY7nSOqVO7nccE2oZrlwuJiuKMhOMUn+rziwLFVxMXzoJW2FA1KhARPXk/zVak3ll5h0GjXFFcpRPlJ0l40XpRDVGF8IJ3Sx9eeSOqnCUxIXqvkRSg1xLGIMkjNUmUpTnjvRkPKPw+jjZzaJqpyv9ShrwsqRcyFlfywZaeyRqsD0/mEbNWUOMNdP07IJqgWpPbEGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(366004)(396003)(136003)(346002)(376002)(36756003)(8676002)(66556008)(16576012)(4326008)(31686004)(8936002)(38350700001)(186003)(16526019)(26005)(107886003)(66946007)(83380400001)(38100700001)(956004)(478600001)(86362001)(31696002)(52116002)(316002)(66476007)(966005)(53546011)(6486002)(2906002)(5660300002)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cWRTaHRBekU4T1lEclRGbFFTbHhhSXFRY0NBWTJQVllYbFhaWE0wTXpSanJk?=
 =?utf-8?B?L3orRnVLcE5qYmVqdUhzOFRGNllHVk9kdVExT2s3Rzl5andOd0JXRFNrbmw2?=
 =?utf-8?B?aVBucjNzcXk2ZkpJZGl6MW5IRkNxTWdUQnNiTi82YXQrUDI2bjI2WVNTakxh?=
 =?utf-8?B?dFBxRzZSMmUxSlRVT25NRFlMSVlPdHJha1pKUTZuZ1A4RjhCMTRoNHZDL2N6?=
 =?utf-8?B?N2lXUU5HcFFqSURWbDIvS2w4UE1zS3YzczZhSVU1ZndmdGRKYm51elV3RGFD?=
 =?utf-8?B?MGRORnB3TlJrZEpTVmQ1RHlqbTBzVm9ucGorYVFVK1VVS1lBdFJCaEc3Q0hy?=
 =?utf-8?B?bDhueGFqeXNVRVI4QjFRQ3ZJeWNoRW52eGRReEMrazFCY205NWtFRitBZFB6?=
 =?utf-8?B?dmx1ak5xbFJUdFMralNzeFpJRGltbmY1TElQbnB5bkF2YTVSN1l1dTNDOXdt?=
 =?utf-8?B?K0d0T0V5OHJMQ2EwMzE5TVdQRXdFM3Q5YkJmUnpDNUZkbXJkcml2OXJkR05y?=
 =?utf-8?B?aXhSL0pxckplbGhlOFpTOUV1Q29QMUo2N3A3MjEvV2hrNW5pK2NvT3UrSzlJ?=
 =?utf-8?B?TmJYenNXcjdpUXJIQnUzbm44dmlKbGxYdjV4OUdPYUM2dzROQjBndU02dWFJ?=
 =?utf-8?B?MTNkY3FDVUdFWHp4VUF5V1lVK2hvcnBKWWRzWERkVjIzZ3dVQytpWFhGdi9L?=
 =?utf-8?B?WFVZZklPd0FrSVZsa1ljM2dGd2NZcTQySUxIVnQwZEVPMVRzclhWdG9hNEJP?=
 =?utf-8?B?bDFWeS80ZzRhOEtHaTRRdXlZRDdtb1dzZmRXcDhjbVJaSVVUaVZ6NUgzeEJw?=
 =?utf-8?B?WWxzdzl0N0h4a1hSUWpYamxTVlpoQ1F2am1VckhaMHlMcWRZeVBiL1Ivcjk1?=
 =?utf-8?B?dWppdmQ4VlJpcG5lM3lKVzdJQzJRRHhrOUhib3hxTmFVODU4YkN1ZnhXL3pN?=
 =?utf-8?B?SURPcGxZaDdKeEJmSyt0UmVuY05LYVVDdzNqeEMrT2Z0bzJKZU5xa2VLTmIz?=
 =?utf-8?B?QUVJbW92OUtxR09DN0ZSbmhuUjgwdkR1ZFJKbWZuL09vZEdlY1VSR2F4QWIw?=
 =?utf-8?B?MlY2VUd3R0NWbUNEQnJ1S1VMSUVMRUJWTS9FeklUNGRxVkg1RG10cjQ3V3Ur?=
 =?utf-8?B?M0d2SDlDVkdBbTRmVkFjbHVJZlJIYU0wS2QxalI1YmVvQUdPUjhDNnUwT3V0?=
 =?utf-8?B?aVIvb0RRTWg2TmFwMXZEOTBIclJIR2xJZ2I1VmU4Y2xrOFZyeHVIUEVTeW92?=
 =?utf-8?B?MzNjNEsvL2NEdDZCTFptZHJ3c2VJNWk4dGZ3VzZVVURseVJpWUN4d2hySVVy?=
 =?utf-8?B?RDdGaGthM1JNVzdBTmloVGU1T2JXOWIzYkE2eFpyc2Q5N1Vad20wNDNFTVNj?=
 =?utf-8?B?bzJVenE5R3pJSjQ0L0orZXBwbjdrOG4xOWc3NTRSS3pqVFh2Q2xRcllrc1dy?=
 =?utf-8?B?VUY5ZnUvUk5UT1NqbTE3eW56NC9pbFRjL2k3NGZqb3RzSE9ocjVsN2hDYktq?=
 =?utf-8?B?dU45eHFRakVoeTNZM0ZzcXVXYnNqcHZJeVl5eTkzL2V0UGlWWUgyUkxXVHEv?=
 =?utf-8?B?VW1JZHBxR2ZLTHdheDNyUlpvTHVDRlplTHI0Y1RiWGtkMlR4WjF3TUlvWHRh?=
 =?utf-8?B?VW1aUUpyZkdBU24xb1hPc29xUGFxd0JzZWNLcklDMUEydlVjRE9nR01YZERq?=
 =?utf-8?B?SmpxdWpWTm1sNHltUDVnTDhNbXh1RjRwM3V3b1h6dXo5Z2pIemd0M3pEdkh1?=
 =?utf-8?Q?5pcIqSgSViHhhlQX9l4e/gEWqHq+/ePsUEd3Ucm?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 953c97b7-b0df-4aa7-b5a5-08d8f9b9af01
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 11:38:37.4530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: etOj9X4gQYEYWkMVZVIQlb6FrIZDWh7WxVJCYksHBcGu9KQLUNj4mDqQotXWZpbBJaRS+tmvAvxlkur3+rWQnw1XXs5O8YBGh2TJBRQ6LB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5446
Received-SPF: pass client-ip=40.107.21.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

07.04.2021 14:19, Max Reitz wrote:
> On 16.01.21 22:46, Vladimir Sementsov-Ogievskiy wrote:
>> If main job coroutine called job_yield (while some background process
>> is in progress), we should give it a chance to call job_pause_point().
>> It will be used in backup, when moved on async block-copy.
>>
>> Note, that job_user_pause is not enough: we want to handle
>> child_job_drained_begin() as well, which call job_pause().
>>
>> Still, if job is already in job_do_yield() in job_pause_point() we
>> should not enter it.
>>
>> iotest 109 output is modified: on stop we do bdrv_drain_all() which now
>> triggers job pause immediately (and pause after ready is standby).
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   job.c                      |  3 +++
>>   tests/qemu-iotests/109.out | 24 ++++++++++++++++++++++++
>>   2 files changed, 27 insertions(+)
> 
> While looking into
> 
> https://lists.gnu.org/archive/html/qemu-block/2021-04/msg00035.html
> 
> I noticed this:
> 
> $ ./qemu-img create -f raw src.img 1G
> $ ./qemu-img create -f raw dst.img 1G
> 
> $ (echo '
>     {"execute":"qmp_capabilities"}
>     {"execute":"blockdev-mirror",
>      "arguments":{"job-id":"mirror",
>                   "device":"source",
>                   "target":"target",
>                   "sync":"full",
>                   "filter-node-name":"mirror-top"}}
> '; sleep 3; echo '
>     {"execute":"human-monitor-command",
>      "arguments":{"command-line":
>                   "qemu-io mirror-top \"write 0 1G\""}}') \
> | x86_64-softmmu/qemu-system-x86_64 \
>     -qmp stdio \
>     -blockdev file,node-name=source,filename=src.img \
>     -blockdev file,node-name=target,filename=dst.img \
>     -object iothread,id=iothr0 \
>     -device virtio-blk,drive=source,iothread=iothr0
> 
> Before this commit, qemu-io returned an error that there is a permission conflict with virtio-blk.  After this commit, there is an abort (“qemu: qemu_mutex_unlock_impl: Operation not permitted”):
> 
> #0  0x00007f8445a4eef5 in raise () at /usr/lib/libc.so.6
> #1  0x00007f8445a38862 in abort () at /usr/lib/libc.so.6
> #2  0x000055fbb14a36bf in error_exit
>     (err=<optimized out>, msg=msg@entry=0x55fbb1634790 <__func__.27> "qemu_mutex_unlock_impl")
>     at ../util/qemu-thread-posix.c:37
> #3  0x000055fbb14a3bc3 in qemu_mutex_unlock_impl
>     (mutex=mutex@entry=0x55fbb25ab6e0, file=file@entry=0x55fbb1636957 "../util/async.c", line=line@entry=650)
>     at ../util/qemu-thread-posix.c:109
> #4  0x000055fbb14b2e75 in aio_context_release (ctx=ctx@entry=0x55fbb25ab680) at ../util/async.c:650
> #5  0x000055fbb13d2029 in bdrv_do_drained_begin
>     (bs=bs@entry=0x55fbb3a87000, recursive=recursive@entry=false, parent=parent@entry=0x0, ignore_bds_parents=ignore_bds_parents@entry=false, poll=poll@entry=true) at ../block/io.c:441
> #6  0x000055fbb13d2192 in bdrv_do_drained_begin
>     (poll=true, ignore_bds_parents=false, parent=0x0, recursive=false, bs=0x55fbb3a87000) at ../block/io.c:448
> #7  0x000055fbb13c71a7 in blk_drain (blk=0x55fbb26c5a00) at ../block/block-backend.c:1718
> #8  0x000055fbb13c8bbd in blk_unref (blk=0x55fbb26c5a00) at ../block/block-backend.c:498
> #9  blk_unref (blk=0x55fbb26c5a00) at ../block/block-backend.c:491
> #10 0x000055fbb1024863 in hmp_qemu_io (mon=0x7fffaf3fc7d0, qdict=<optimized out>)
>     at ../block/monitor/block-hmp-cmds.c:628
> 
> Can you make anything out of this?
> 

Hmm.. Interesting.

man pthread_mutex_unlock
...
      EPERM  The  mutex type is PTHREAD_MUTEX_ERRORCHECK or PTHREAD_MUTEX_RECURSIVE, or the mutex is a
               robust mutex, and the current thread does not own the mutex.

So, thread doesn't own the mutex.. We have an iothread here.

AIO_WAIT_WHILE() documents that ctx must be acquired exactly once by caller.. But I don't see, where is it acquired in the call stack?

The other question, is why permission conflict is lost with the commit. Strange. I ss that hmp_qemu_io creates blk with perm=0 and shread=BLK_PERM_ALL.. How could it conflict even before the considered commit?

-- 
Best regards,
Vladimir

