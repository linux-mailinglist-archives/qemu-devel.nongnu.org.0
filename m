Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B13310A31
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 12:25:47 +0100 (CET)
Received: from localhost ([::1]:49958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7zFA-0007w3-49
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 06:25:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7zDl-0007PZ-5w; Fri, 05 Feb 2021 06:24:17 -0500
Received: from mail-am6eur05on2115.outbound.protection.outlook.com
 ([40.107.22.115]:28249 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7zDh-000506-Dx; Fri, 05 Feb 2021 06:24:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQx8dV9kFF73vHk/jZhoc8Sz839nBMJV8vIAxRdpJB7y05zfwx3V1sr2Iw/Jcqm+GOsX+mYHhd6+EOIO0cG2Hya5pjFrghWFg7+PpZhh98ZJiRjIzRWZjHs+4kiISnXIqtSYG4ZTN+Z+QVFc6iQrg2/W1HeY8puaAtL3dCejimd+/rjyPBceMYzB89sB+SG+AzlUdcuFrdeHldmxK3LRfk6wxfQBYZ6rhkI+0/Y+oBRL05NvwFR1wcbD5P9TKfM8j2g1OAUEjVZsGrY/pprF8NyF7CPlkRMNvg9qi2Av0P6dQ5K7rBB5/Ozk1SQYDnnWt3iKiNvheHlaX0wpFhnvgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IyFQM4+CaerM3AP6y9Ge/b+Wj4xFPmizvrfjVIABzyI=;
 b=M68nUFoZWhrfGBQlKmiy8EZEs8t+nXeXIjL/uQXwZY6NY+OJOsofIDXqofAhyypaLe2W+JPsWLiw2lcl15YplD8XcyvzudahZEq+Edh5muMd6RhD51lkU5PC6NGt1fViTX1py85a/IiGnJbCvfva9UKlJslNUha5A9V28RKgYXGIOshnZnPFadaKGy0Mu3JfmPVnLjiZtf7Rht2TnwzKNnEkoK8r9tK4SPUG/Rc219IPJaI4dmtVTslZNt7D7ArLeedeXr1pliFunVmCBmEu+1dPYCBn0DGKqPAbgriNIhzSGd3ImloifH8sTcxCEkgMsYwts04FwEi22GMLTJWb8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IyFQM4+CaerM3AP6y9Ge/b+Wj4xFPmizvrfjVIABzyI=;
 b=IbBVlV0IHiR9q1ek+otyLw7Ekbvh94hCHCl5eVFBlBRBR3/Spqoq/hZOdb/MN/kAvaKqy3fkgYCap9TTe02oNE42qjsxGXsc1l6TZ30K6t7zc8BWyfF8b628dr5YDfmMl8oaZizX9Dk8k4zAc32DIwMHRE5RTdtVLOEvFACRMiQ=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3765.eurprd08.prod.outlook.com (2603:10a6:20b:8f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Fri, 5 Feb
 2021 11:24:09 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Fri, 5 Feb 2021
 11:24:09 +0000
Subject: Re: [PATCH] iotests: 30: drop from auto group (and effectively from
 make check)
To: Claudio Fontana <cfontana@suse.de>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 peter.maydell@linaro.org, philmd@redhat.com
References: <20210205111021.715240-1-vsementsov@virtuozzo.com>
 <dd4a56d4-a347-296a-1dbc-cd279e7e223c@suse.de>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4b5a5cd2-e442-8b2d-a668-10d51db246c6@virtuozzo.com>
Date: Fri, 5 Feb 2021 14:24:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <dd4a56d4-a347-296a-1dbc-cd279e7e223c@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.213]
X-ClientProxiedBy: AM4PR0501CA0066.eurprd05.prod.outlook.com
 (2603:10a6:200:68::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.213) by
 AM4PR0501CA0066.eurprd05.prod.outlook.com (2603:10a6:200:68::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend
 Transport; Fri, 5 Feb 2021 11:24:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8679547-2e9f-42da-2fd8-08d8c9c88e57
X-MS-TrafficTypeDiagnostic: AM6PR08MB3765:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3765C13E1699B78DFD5F4DD7C1B29@AM6PR08MB3765.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:183;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zTo0GN5jKbW8H5XOX4FjTP2O06Ytvvyu97W1xjF0Z45pDd953bVp3jpg3wqQCHxbyflBi9UoncdbOnt0P8YTCAkM1/Ga0IbJlFG3dgVgf6bGaGhk7mpF7CKCFBcuJhKP74zMbUftD+zqY78iqRxeBLeo+XiB10OidhvMRWD1feqzHOKshoRQixNp2twMtAr4Od6dnunUkB4LdqgT7iPp4s38/tPfNNpTDHG76Hy27ABK3odKFnGOmi6lngSPL2Mxs8K6gnINd24D1Bytc+5AInvLWBksXuXvVxey6TRzpou70kJjm7JlgCv8v8+j1rHA/pUxeN58xMJOSiTJDX7SShoC3W2Ka+X1wKjyhsjTlGuUJLkfkznL76A1u4d7ovnP7A0nX4V1oXvXgPp9UA7sicQtVe7e0cybrbq7Sn4preZEZcYAZyjUq+fT7vUJeRIU+oA1ktah4BkUdalsXF81WbvDyIbwF0UMEbMO8w95Bn2Rhy4n1X9uTJJmJOLm/+uTHOnwAIvLXupTYWynzhvklwKTbIC2GSWNo5Wf4LRM7nS2uF9QC1jir519SBB+1I5PlqFgDudRGXcKyn8AtwHnlO9LzAMSuKCnQj38im73cl0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(376002)(396003)(39840400004)(316002)(478600001)(4326008)(36756003)(31686004)(16576012)(956004)(66556008)(66476007)(8936002)(6486002)(2616005)(26005)(86362001)(53546011)(2906002)(186003)(16526019)(31696002)(5660300002)(8676002)(66946007)(83380400001)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RUM3UGpiZmVuSTZIVy9HWXRHVTF1Z3QvZkI3eTc0QXl3QXhYdlJZR2l5OEpo?=
 =?utf-8?B?bHhodFpJMVJrbVV3WVhEM2dUU0ovUTNhZW1yQkE3VGw2dnZ2Wk5IUlRQRXUr?=
 =?utf-8?B?VndFanFaWWRjaUJ0L010cHp1UURxdkNleXp4WjdvNXl5Vk9LOWwwNDRYV3J2?=
 =?utf-8?B?RHdUY2J1OE4zUUtVZytQZmpiVHpXVGdQMCtUYWFhbjRkWk1zcGo2TEVsMk9C?=
 =?utf-8?B?U1E4UFZFQTBRc1ZzSi9EUnZ1aHVkczNWdnZXUW8rTHB3M3dtQkpHZWwwQXpF?=
 =?utf-8?B?RTJMUTh2aGNqS0hJUkFDTVhpb25lOXpjcEJ0WUhQbTVkUG00Z043VXRuRSs4?=
 =?utf-8?B?MmtqOGt3WWtlZjZCWXVTYVJmUFkyVkx6WE8zRThOUXdUV0QxVGtuWm5pbXZv?=
 =?utf-8?B?bXlTUGFRSVVjbFFtdmdud3RlS3Zjc0ZSN1FycVBKTTZHOUdPZkV0QlI4UDBJ?=
 =?utf-8?B?SnJyYTNwSFN0eVdjZm5SM3dnN0x4QXNYZ2FNckhrUDdTWnhMQmFiRkI1WGNM?=
 =?utf-8?B?TXZGRy9xN3N2a2V5Q3Rsa2JEcks5aUZuUDlwZGREYSt5ZTlWT1M2YzV2bjUv?=
 =?utf-8?B?aERSaDZyS0kvVmtZRGpCekIzekwzRzVTOFV0SUhGT2xSNVB5WlptOS82Vmxo?=
 =?utf-8?B?Yjh0UEtNZlBTYWVHY0t5d0FMNVM1eFVqREhybU9DRzNLNGtSMzNvNFAyZ1Bp?=
 =?utf-8?B?NlBCc2VXeG1JbldiWmpDeUEzOTJtcDl2bUJ4cjFRTnFwL1hjbWFzV3Uzd1dK?=
 =?utf-8?B?Y2N2UmZLQXJwWUJIYzNhajNKTXU0UVNjekoxaFBRaXlXMlIzcmI1LzRkSGYv?=
 =?utf-8?B?cmJraUg5dWZxMUZORHQzczdKRmFjR1hvUUJvMU44V2thcWFIQVYxdUV5U0ti?=
 =?utf-8?B?TzZTekw3Ry9EQzVTVUJVZVRxRkN1dkVOcXFnNStTMzdGRys2OGFKR3lqRHM1?=
 =?utf-8?B?MWZscTJjOGZPWE5KMUM2cU9GL2xxT1drbGxsSVFhcWJrQWtVVzFmZUdVRTkz?=
 =?utf-8?B?aVdmc2Q2bUpPcVEyU1FuNEoyYWtNK1g3bit1OWtFYXFreDZDK3YwWUs4bmtD?=
 =?utf-8?B?V2VJMDI4Y2gzSnVBcUJVU0h1L2RaZ1V0TmhINUdTb0tUTlRBNXhrd2dSS3Fq?=
 =?utf-8?B?djRsWFd4UWE5MmY5WlRsa2dNWVJESXFsYjQxRnA3KzZHbmN1Wmw1ZUl1d3o4?=
 =?utf-8?B?RmtjeFJPdWU5Zmc4azVOZGt3cm1hRDhwNzdXazhpZTdDNFpuMk1Fc3RsYStu?=
 =?utf-8?B?c2ZyWUh4TjFYaFhsRTZpYnBteThpN3dWY0VrV3RUcllIK0FqYkF0eC80Njhv?=
 =?utf-8?B?MW84MHUrd2dkTWJZOVY2aFJTS083ckxmYVl3elpTcnJTdFNQS2xjbHZEclpV?=
 =?utf-8?B?Q2ZHaTlHOTNDbjE5MXhlN3pUdVRzamVScU4ydEM1MXoyamgyeDkzWlozY1Q5?=
 =?utf-8?B?cW00SXVYVE4zb2VDNUNrMlNGOXU1YWFnZUcwU08zYTB4S1V5bDJ3bXlzQ1B6?=
 =?utf-8?B?Zi9zWXB5eGViVHBUYUJSY2h3OUR6dzdpYVcxdDhQa29ISUNBUUlOakNmTUdE?=
 =?utf-8?B?enhOYzVLZ3RvTS90Vml1T241MEJuakwzU2IxRHVwUjdjbCt0bW9TSGdndHRQ?=
 =?utf-8?B?QkhFZkkrcDY0MXI2QUJPd2ZkalZQc1lyYXJXR0tSSmNhVkhsT0JIR3Zhbm9q?=
 =?utf-8?B?V09Ub3c0QlJmS3cyMTVOMjI3ZjhNSzdQckJXMjZONE5ETFBpcVVMZzcrTUdU?=
 =?utf-8?Q?9kaUs+QfFVe1lSd3KVfcZZWw+JNciCc0rNmlaOl?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8679547-2e9f-42da-2fd8-08d8c9c88e57
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 11:24:09.2790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZ9pkRnakkWPGcnBlqNtW2UFnynaMfKTjN8rATHIjRYGT7mEiIfbvUb8PWqlYEhsQ/8+4Q/seJ88bdqEBUXx07ydo48AKbdG1Pi/ogsQ+sE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3765
Received-SPF: pass client-ip=40.107.22.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7,
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

05.02.2021 14:15, Claudio Fontana wrote:
> Just in case it helps,
> 
> I started getting this error only when I rebased to latest master a couple days ago, after regular rebasing and testing with full make check every 1 or 2 days.
> 

The first crash below is on assertion which was added recently. I still think the assertion is correct. And shows that we just have problems that were hidden. Probably we can make the assertion less restrictive. But I hope for my "block: update graph permissions update".

> 
> 
> On 2/5/21 12:10 PM, Vladimir Sementsov-Ogievskiy wrote:
>> I reproduced the following crash fast enough:
>>
>> 0  raise () at /lib64/libc.so.6
>> 1  abort () at /lib64/libc.so.6
>> 2  _nl_load_domain.cold () at /lib64/libc.so.6
>> 3  annobin_assert.c_end () at /lib64/libc.so.6
>> 4  bdrv_reopen_multiple (bs_queue=0x55de75fa9b70, errp=0x0)
>>     at ../block.c:3820
>> 5  bdrv_reopen_set_read_only (bs=0x55de760fc020, read_only=true,
>>     errp=0x0) at ../block.c:3870
>> 6  stream_clean (job=0x55de75fa9410) at ../block/stream.c:99
>> 7  job_clean (job=0x55de75fa9410) at ../job.c:680
>> 8  job_finalize_single (job=0x55de75fa9410) at ../job.c:696
>> 9  job_txn_apply (job=0x55de75fa9410,
>>     fn=0x55de741eee27 <job_finalize_single>) at ../job.c:158
>> 10 job_do_finalize (job=0x55de75fa9410) at ../job.c:805
>> 11 job_completed_txn_success (job=0x55de75fa9410) at ../job.c:855
>> 12 job_completed (job=0x55de75fa9410) at ../job.c:868
>> 13 job_exit (opaque=0x55de75fa9410) at ../job.c:888
>> 14 aio_bh_call (bh=0x55de76b9b4e0) at ../util/async.c:136
>> 15 aio_bh_poll (ctx=0x55de75bc5300) at ../util/async.c:164
>> 16 aio_dispatch (ctx=0x55de75bc5300) at ../util/aio-posix.c:381
>> 17 aio_ctx_dispatch (source=0x55de75bc5300, callback=0x0,
>>     user_data=0x0) at ../util/async.c:306
>> 18 g_main_context_dispatch () at /lib64/libglib-2.0.so.0
>> 19 glib_pollfds_poll () at ../util/main-loop.c:232
>> 20 os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:255
>> 21 main_loop_wait (nonblocking=0) at ../util/main-loop.c:531
>> 22 qemu_main_loop () at ../softmmu/runstate.c:722
>> 23 main (argc=20, argv=0x7ffe218f0268, envp=0x7ffe218f0310) at
>>     ../softmmu/main.c:50
>>
>> (gdb) fr 4
>> 4  bdrv_reopen_multiple (bs_queue=0x55de75fa9b70, errp=0x0) at
>>        ../block.c:3820
>> 3820                assert(perm == state->perm);
>> (gdb) list
>> 3815
>> 3816            if (ret == 0) {
>> 3817                uint64_t perm, shared;
>> 3818
>> 3819                bdrv_get_cumulative_perm(state->bs, &perm,
>>                      &shared);
>> 3820                assert(perm == state->perm);
>> 3821                assert(shared == state->shared_perm);
>> 3822
>> 3823                bdrv_set_perm(state->bs);
>> 3824            } else {
>> (gdb) p perm
>> $1 = 1
>> (gdb) p state->perm
>> $2 = 0
>>
>> Then I had 38 successful iterations and another crash:
>> 0  bdrv_check_update_perm (bs=0x5631ac97bc50, q=0x0, new_used_perm=1,
>>     new_shared_perm=31, ignore_children=0x0, errp=0x7ffd9d477cf8) at
>>     ../block.c:2197
>> 1  bdrv_root_attach_child
>>      (child_bs=0x5631ac97bc50, child_name=0x5631aaf6b1f9 "backing",
>>      child_class=0x5631ab280ca0 <child_of_bds>, child_role=8,
>>      ctx=0x5631ab757300, perm=1, shared_perm=31, opaque=0x5631abb8c020,
>>      errp=0x7ffd9d477cf8)
>>      at ../block.c:2642
>> 2  bdrv_attach_child (parent_bs=0x5631abb8c020,
>>     child_bs=0x5631ac97bc50, child_name=0x5631aaf6b1f9 "backing",
>>     child_class=0x5631ab280ca0 <child_of_bds>, child_role=8,
>>     errp=0x7ffd9d477cf8)
>>      at ../block.c:2719
>> 3  bdrv_set_backing_hd (bs=0x5631abb8c020, backing_hd=0x5631ac97bc50,
>>     errp=0x7ffd9d477cf8) at ../block.c:2854
>> 4  stream_prepare (job=0x5631ac751eb0) at ../block/stream.c:74
>> 5  job_prepare (job=0x5631ac751eb0) at ../job.c:784
>> 6  job_txn_apply (job=0x5631ac751eb0, fn=0x5631aacb1156 <job_prepare>)
>>     at ../job.c:158
>> 7  job_do_finalize (job=0x5631ac751eb0) at ../job.c:801
>> 8  job_completed_txn_success (job=0x5631ac751eb0) at ../job.c:855
>> 9  job_completed (job=0x5631ac751eb0) at ../job.c:868
>> 10 job_exit (opaque=0x5631ac751eb0) at ../job.c:888
>> 11 aio_bh_call (bh=0x7f3d9c007680) at ../util/async.c:136
>> 12 aio_bh_poll (ctx=0x5631ab757300) at ../util/async.c:164
>> 13 aio_dispatch (ctx=0x5631ab757300) at ../util/aio-posix.c:381
>> 14 aio_ctx_dispatch (source=0x5631ab757300, callback=0x0,
>>     user_data=0x0) at ../util/async.c:306
>> 15 g_main_context_dispatch () at /lib64/libglib-2.0.so.0
>> 16 glib_pollfds_poll () at ../util/main-loop.c:232
>> 17 os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:255
>> 18 main_loop_wait (nonblocking=0) at ../util/main-loop.c:531
>> 19 qemu_main_loop () at ../softmmu/runstate.c:722
>> 20 main (argc=20, argv=0x7ffd9d478198, envp=0x7ffd9d478240) at
>>     ../softmmu/main.c:50
>> (gdb) list
>> 2192        QLIST_FOREACH(c, &bs->parents, next_parent) {
>> 2193            if (g_slist_find(ignore_children, c)) {
>> 2194                continue;
>> 2195            }
>> 2196
>> 2197            if ((new_used_perm & c->shared_perm) != new_used_perm)
>>                  {
>> 2198                char *user = bdrv_child_user_desc(c);
>> 2199                char *perm_names = bdrv_perm_names(new_used_perm &
>>                      ~c->shared_perm);
>> 2200
>> 2201                error_setg(errp, "Conflicts with use by %s as '%s',
>>                      which does not "
>> (gdb) p c
>> $1 = (BdrvChild *) 0x8585858585858585
>>
>> and trying to reproduce it on top of
>> "block: update graph permissions update" I had 634 successful
>> iterations
>> and then the following crash (which looks much better):
>> 0  raise () at /lib64/libc.so.6
>> 1  abort () at /lib64/libc.so.6
>> 2  _nl_load_domain.cold () at /lib64/libc.so.6
>> 3  annobin_assert.c_end () at /lib64/libc.so.6
>> 4  bdrv_replace_child_noperm (child=0x5585bb632010,
>>     new_bs=0x5585bc4f42a0) at ../block.c:2589
>> 5  bdrv_replace_child (child=0x5585bb632010, new_bs=0x5585bc4f42a0,
>>     tran=0x7fff5a14d8e0) at ../block.c:2211
>> 6  bdrv_set_backing_noperm (bs=0x5585bb704020,
>>     backing_bs=0x5585bc4f42a0, tran=0x7fff5a14d8e0, errp=0x7fff5a14d918)
>>     at ../block.c:3030
>> 7  bdrv_set_backing_hd (bs=0x5585bb704020, backing_hd=0x5585bc4f42a0,
>>     errp=0x7fff5a14d918) at ../block.c:3072
>> 8  stream_prepare (job=0x5585bc2ef230) at ../block/stream.c:74
>> 9  job_prepare (job=0x5585bc2ef230) at ../job.c:784
>> 10 job_txn_apply (job=0x5585bc2ef230, fn=0x5585ba638ad0 <job_prepare>)
>>     at ../job.c:158
>> 11 job_do_finalize (job=0x5585bc2ef230) at ../job.c:801
>> 12 job_completed_txn_success (job=0x5585bc2ef230) at ../job.c:855
>> 13 job_completed (job=0x5585bc2ef230) at ../job.c:868
>> 14 job_exit (opaque=0x5585bc2ef230) at ../job.c:888
>> 15 aio_bh_call (bh=0x7f62b8004270) at ../util/async.c:136
>> 16 aio_bh_poll (ctx=0x5585bb2ce4a0) at ../util/async.c:164
>> 17 aio_dispatch (ctx=0x5585bb2ce4a0) at ../util/aio-posix.c:381
>> 18 aio_ctx_dispatch (source=0x5585bb2ce4a0, callback=0x0,
>>     user_data=0x0) at ../util/async.c:306
>> 19 g_main_context_dispatch () at /lib64/libglib-2.0.so.0
>> 20 glib_pollfds_poll () at ../util/main-loop.c:232
>> 21 os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:255
>> 22 main_loop_wait (nonblocking=0) at ../util/main-loop.c:531
>> 23 qemu_main_loop () at ../softmmu/runstate.c:722
>> 24 main (argc=20, argv=0x7fff5a14ddb8, envp=0x7fff5a14de60) at
>>     ../softmmu/main.c:50
>>
>> (gdb) fr 4
>> 4  bdrv_replace_child_noperm (child=0x5585bb632010,
>>     new_bs=0x5585bc4f42a0) at ../block.c:2589
>> 2589            assert(bdrv_get_aio_context(old_bs) ==
>>                  bdrv_get_aio_context(new_bs));
>> (gdb) list
>> 2584        int drain_saldo;
>> 2585
>> 2586        assert(!child->frozen);
>> 2587
>> 2588        if (old_bs && new_bs) {
>> 2589            assert(bdrv_get_aio_context(old_bs) ==
>>                  bdrv_get_aio_context(new_bs));
>> 2590        }
>> 2591
>> 2592        new_bs_quiesce_counter = (new_bs ? new_bs->quiesce_counter
>>              : 0);
>> 2593        drain_saldo = new_bs_quiesce_counter -
>>              child->parent_quiesce_counter;
>>
>> So it seems reasonable to drop test from auto group at least until we
>> merge "block: update graph permissions update"
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>
>> Note: be free to shorten commit message if needed :)
>>
>>   tests/qemu-iotests/030 | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
>> index 832fe4a1e2..12aa9ed37e 100755
>> --- a/tests/qemu-iotests/030
>> +++ b/tests/qemu-iotests/030
>> @@ -1,5 +1,5 @@
>>   #!/usr/bin/env python3
>> -# group: rw auto backing
>> +# group: rw backing
>>   #
>>   # Tests for image streaming.
>>   #
>>
> 


-- 
Best regards,
Vladimir

