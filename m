Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6775035DE96
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 14:24:25 +0200 (CEST)
Received: from localhost ([::1]:33300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWI5g-00034G-G4
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 08:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lWI1Y-0000nh-N0; Tue, 13 Apr 2021 08:20:08 -0400
Received: from mail-vi1eur05on2090.outbound.protection.outlook.com
 ([40.107.21.90]:45485 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lWI1T-0002hn-Ur; Tue, 13 Apr 2021 08:20:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUnOV3mFSq8BoNFHlAhAyAHHiTs+602hrI56OhrZem7fOCNEag/iVDQA42/Yr/fEGvJPC1efx2lmaxmxqtV/Im3Iodv7KuBHpAupXT26zqpkpW5f8OzmsxBnZvMwcgxqc45emT2VNEjqadkFyXMqdGxiyBAHYs4Ky9/qLytx8CVrm871Y+njU5Dpxv37bEHPLBU09BRb6WRKoNZFfP7BqQaQNHa5iRPwT6xAS2oZAo4KpImOFwuK6THsoru/8IALunZ/TVPcsKd6vUCOycFos7h+FNxI8rW4D3079Tj9dGnXw2Np6fGHGQXapYCgVu8dPsBUramQx7tO2RG2zgOrBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQogXtU0cL8QFX35462UQGi1zBdzOp2GltT6PfOaGvY=;
 b=WW3Po71yq8Fy81VfYiWzJqPgyW+3iZXNUW5Kv8BFzYDN2DqigJofVuSHTDKiuCy1/ZKVE+z8GyKX2jnmoNt0NFsKSqXBOd7GM+v/R3zuiC4+E4TwlaxGEhEXUxO8HVioiOdO4bmM3ir9nYlygQK4KBH8b9WiUENN6FSpGrconvAk256Xqouqk83RvpcLEe9c7aSF/y8CuA/6TcgD9RGCi1H2peWrcT7BV/srt+VEiQqBEcHQrFAlhlUR31nF2wemEiRyfH+/MayORpCffbEYo3pKawTko7q3CIdMGveqCR9Kr+hlSvucX4at1ok+nb+TZSWJepUHqX7rFGNCFm+9gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQogXtU0cL8QFX35462UQGi1zBdzOp2GltT6PfOaGvY=;
 b=tQTywpEcpKOdOocraxRYdt6e0Q3VC8B3goL/7acV8QMvnM1+IlWQSB6+AJsZmiqcLbQGlwgW+59Octb7bCzkyafJp3agMFo6c2beg2XQ/3LRobGb41OR5uHr57JAsda6HHAtaDweYEocOR9XIf9gujahXsPU1SbI8I73FTqiiuU=
Authentication-Results: yandex-team.ru; dkim=none (message not signed)
 header.d=none;yandex-team.ru; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB7011.eurprd08.prod.outlook.com (2603:10a6:20b:34e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Tue, 13 Apr
 2021 12:19:58 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.022; Tue, 13 Apr 2021
 12:19:58 +0000
Subject: Re: [PATCH for-6.0] block/nbd: fix possible use after free of
 s->connect_thread
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, eblake@redhat.com,
 rvkagan@yandex-team.ru
References: <20210406155114.1057355-1-vsementsov@virtuozzo.com>
 <eb293b4a-6335-5788-5cf8-7f98d04ccfba@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a8cd91ca-ae7f-49b0-c98a-f5a9b392a7ac@virtuozzo.com>
Date: Tue, 13 Apr 2021 15:19:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <eb293b4a-6335-5788-5cf8-7f98d04ccfba@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.205]
X-ClientProxiedBy: PR3P193CA0034.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::9) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.205) by
 PR3P193CA0034.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Tue, 13 Apr 2021 12:19:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45890d4c-c28e-47bc-5ab6-08d8fe767438
X-MS-TrafficTypeDiagnostic: AS8PR08MB7011:
X-Microsoft-Antispam-PRVS: <AS8PR08MB701124855B2C9665843E697DC14F9@AS8PR08MB7011.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IFr89E+tnd6sGqRw4mZUm2kLgACazs61E48gExAcmcZnB9MIlPmxNFDNixUhqPH/bWvWVwFECsTQuCSyJfx3LTc5Ifq+5WG7KhBpKWGoO9cKxItHcPXFhcxQOd1cXyrJ/LuvP4Ks9b5DYt6y/zQEFh+/Rtlzqq+cId3RJoWumRFa3180ekKP0oD55vA/YsXKEhxZF75ZOXcSvN3ULtbjj8ULpopoJpQ9zZ0IDWDOAzNWw+DE/W96ItReUn0opIAUINGxoM/hVWzNm5VcgrR2kIKlxfqg34VbIWQzat/vShXr+WYS98ZT9N6jI892OKcg7331JzdVz5KyLZNsLFlpTQOZm4oOkk4AUCn5jUSQq01FioUS5MlboQzIq9KU03gMjZ1DFMLJO6AmtJmEhS5njbXlu4eYk2AoUc83PLOFBISQBr2nFnO4K+gfiBzPQpFlKeuLvBylEgbCaIxMzqwuJYvrZ49CI7DxK9h79Ld9krUZ5ewkrjvDjDTAbXNkPmcaQ8aTmm0L3y99KOSgQyJ+HmC5v4tuBvbVnb85NzxVEjOu8cbkeAdDzj7HGmSo29HS3jNUEGs1bUegL4Xd4+TiwkC6mUaYOy8/ZF8ezIIR09w5lqaFQ/jkDvHd2G9jhEwPry0wWGfzl5ZRzJqPTH+SFDE4SxymS11EOksrqrT5x7pPFtEnzGqKwTjLGJ747UrPH54LRtYaZsJC2zq96bUc5hkfN95N58qN2UGPiOpbbJQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39840400004)(376002)(396003)(346002)(66556008)(2906002)(5660300002)(31696002)(956004)(86362001)(52116002)(8676002)(66476007)(4326008)(186003)(8936002)(6486002)(26005)(16526019)(2616005)(316002)(31686004)(478600001)(16576012)(36756003)(53546011)(66946007)(38350700002)(38100700002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UFJoZnNpc2NyZklwYlJjR09PbzRNZXpPbkZROXpjY044YzMyNG02TUJCWlU5?=
 =?utf-8?B?Um9YN2o0OXpHL1V3YnJPSkpOZWVPV3U2eHlFRDdpb0lkMkJaOGZaZTNkM2tu?=
 =?utf-8?B?Nit3MDk2VVpvYngxeDhqUkthcGxrWGNCRk1iVFZXRjZXNlUvRmNQMXpEMnNm?=
 =?utf-8?B?TFJ6eWZKdEoxeDJBTCswcXdqS24yQ2VXL0l6VmZBVnloZUNBdy9jMm1paGxN?=
 =?utf-8?B?UUlpYUxqY0c1cE56clZPVk1DWTdvTUxYc3kwK1VPUzYxbGJKR2M5TERkV1pt?=
 =?utf-8?B?QzdyNmtNWGpsdkF3VWk4b0xrRno4bVBiY20vUFAvZXF6VmF1U29ycWRidk90?=
 =?utf-8?B?WnFEV1lueXBDaFF0bnJOajErb284YXRXVnBuTUtFQ0JYaFJPK1V5UDVLYkpy?=
 =?utf-8?B?UTdUWEJiVzBKQVUrYW5VaEJXTWdhNmxqRUhLRG4vWUZkcG5nb0VNUWd2RkhW?=
 =?utf-8?B?cU0xK2lLYTlrcVEyd3FkNFI2Qi9zRzNCQWlkUXphZ25nZytIeSthNnlsdk9F?=
 =?utf-8?B?ZTEyNWRxY0xzVk16eHhDR0JJaU0vNG1GNHNmOVhieVgrRFgzdHBQcFZtd1J3?=
 =?utf-8?B?Ym0vZ2RqQ2o2eC85a3FzM3l0YlV5TENNaU1WV2c3RnlwdEMvNDJPU2I1c041?=
 =?utf-8?B?Vk56ZHp6dTZla2ZPSCtyRjBFRkxNTS9TWXJ6bUQvNXJaV05qMGxUZmNtYWNa?=
 =?utf-8?B?QkMvUUdZalRxcThpNFV1YVc1cStGMXBrMm5aVHI0T1VGNitIdGJjdU5qVHBI?=
 =?utf-8?B?cTBHN0labStMVCsxVmdWMWkxTU5qajk2eGdianV1ZXRQQkVGc1o0eTIxVjZ3?=
 =?utf-8?B?ZTgwSEViRHdvVFV4SGsrdHo2YlRuV09NaDQxRFg4bkVSUm5oT3ZTNmI5YmpI?=
 =?utf-8?B?aCtIMmQvMUh5a3luWGtmTlpSMFJ4MjJnalZwVFl3K0JWSExTRjRhTi8wWnRt?=
 =?utf-8?B?Y29sUHYxME5NUFVWUitEc040ajIyTTV6dzVYZXJRSTgzZVBEZk95cmpJZXNv?=
 =?utf-8?B?dThwQVRMQnpiV2V6UWRBOUFTb3dvNVNoQ1NYaE1FNitURkg5M3I1SjBOVjFQ?=
 =?utf-8?B?aGh6dFZTV0RkbU5pcFNJY0M2akcyUzJ0cGl4UDVIbGlBcjlTejI0cWRzM205?=
 =?utf-8?B?WmZObVlaRWdiL2FEeWN1R05POUtXV0N2UEhsQzI3YnF1a0VxU0ltSEtwYUZN?=
 =?utf-8?B?NzZnUnNQcG8zcGpuYVF1REFxdWhlU29SaE1KZnNpdW13VFU1N2h0Z1c0THhX?=
 =?utf-8?B?ajdtRHlHNEhpaDZ6WC9SaWoyQ1hlTklNVkNnZStIUlNUSGpwbDNIMlM3SE5o?=
 =?utf-8?B?QjhGMXNOTlVqMEh1WXFaZDBBcXRoNk9sTkRxV0l6Z210enluckRLSkVGK3Nh?=
 =?utf-8?B?eFVwb05FUjQ3UzZMU2NUdWU1bVZCTHFTVXIxaFR6L0tjME9JUVNwajVsaGNj?=
 =?utf-8?B?T01Oak44Rk8yY1BEblFsdUovNE4yTjk5TG1JT0tOY0lVYi9xV1BPYzVpNGlz?=
 =?utf-8?B?Wk5zSHVYc1duNU4xWDU3K1FNOEphZGxqRFRwSUU5SDdKUXh6MmlOZjNCU3Rm?=
 =?utf-8?B?dWxVaDBIRXc2ZFFBVThUMjA4d2Q1eFRWUDZZUTVwdnB6V1F5TC9YU2UyeEgr?=
 =?utf-8?B?MDdkRkpoSk9PSmNFQ1NDNmJwOVQ2TzFtRjMxLzZKMUhuMkp1MUxDUE4rcmQ3?=
 =?utf-8?B?aXdMd0NsaHNSVnJwenMyU011Si9BMjdxc0VGeENJVUd3bnBLUEllakJlZEJC?=
 =?utf-8?Q?IGoSGS62l3bnV9hi6jntIWJEWBfTluBg5Y2VIDG?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45890d4c-c28e-47bc-5ab6-08d8fe767438
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 12:19:58.4432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /uMktGxP83cT4dtVlbNiV5z/653DuqbJxuZmqMLoIuzm1B8edFJKYq7uoxRuLi0hhItqJs2WMI5YnNH7KTux+dR0HJe/GP08V9iej5PU/X0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7011
Received-SPF: pass client-ip=40.107.21.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

13.04.2021 14:53, Max Reitz wrote:
> On 06.04.21 17:51, Vladimir Sementsov-Ogievskiy wrote:
>> If on nbd_close() we detach the thread (in
>> nbd_co_establish_connection_cancel() thr->state becomes
>> CONNECT_THREAD_RUNNING_DETACHED), after that point we should not use
>> s->connect_thread (which is set to NULL), as running thread may free it
>> at any time.
>>
>> Still nbd_co_establish_connection() does exactly this: it saves
>> s->connect_thread to local variable (just for better code style) and
>> use it even after yield point, when thread may be already detached.
>>
>> Fix that. Also check thr to be non-NULL on
>> nbd_co_establish_connection() start for safety.
>>
>> After this patch "case CONNECT_THREAD_RUNNING_DETACHED" becomes
>> impossible in the second switch in nbd_co_establish_connection().
>> Still, don't add extra abort() just before the release. If it somehow
>> possible to reach this "case:" it won't hurt. Anyway, good refactoring
>> of all this reconnect mess will come soon.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>
>> Hi all! I faced a crash, just running 277 iotest in a loop. I can't
>> reproduce it on master, it reproduces only on my branch with nbd
>> reconnect refactorings.
>>
>> Still, it seems very possible that it may crash under some conditions.
>> So I propose this patch for 6.0. It's written so that it's obvious that
>> it will not hurt:
>>
>>   pre-patch, on first hunk we'll just crash if thr is NULL,
>>   on second hunk it's safe to return -1, and using thr when
>>   s->connect_thread is already zeroed is obviously wrong.
>>
>>   block/nbd.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/block/nbd.c b/block/nbd.c
>> index c26dc5a54f..1d4668d42d 100644
>> --- a/block/nbd.c
>> +++ b/block/nbd.c
>> @@ -443,6 +443,11 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
>>       BDRVNBDState *s = bs->opaque;
>>       NBDConnectThread *thr = s->connect_thread;
>> +    if (!thr) {
>> +        /* detached */
>> +        return -1;
>> +    }
>> +
>>       qemu_mutex_lock(&thr->mutex);
>>       switch (thr->state) {
> 
> First, it is a bit strange not to set *errp in these cases. 

Oops, right! ashamed)

> I don’t think it’d make a difference anyway, but now that I look into it...  The error would be propagated to s->connect_err, but that isn’t used anywhere, so...  What’s the point?

Yes it's unused.. That's to be improved later.

> 
> Anyway.  What I really wanted to ask is: nbd_co_establish_connection() may create a thread, which accesses the thread.  Is that a problem? Like, can this happen:
> 
> - nbd_co_establish_connection(): thr->state := THREAD_RUNNING
> - nbd_co_establish_connection(): thread is created
> - nbd_co_establish_connection(): thr->mutex unlocked
> - connect_thread_func(): thr->mutex locked
> - connect_thread_func(): thr->state := something else
> - connect_thread_func(): thr->mutex unlocked
> - nbd_co_establish_connection(): yields
> - (As I understood it, this yield leads to
>    nbd_co_establish_connection_cancel() continuing)
> - nbd_co_EC_cancel(): thr->mutex locked
> - nbd_co_EC_cancel(): do_free true
> - nbd_co_EC_cancel(): nbd_free_connect_thread()
> - connect_thread_func(): nbd_free_connect_thread()
> 

I think not. Here we are safe: connect_thread_func will only do free if thread in CONNECT_THREAD_RUNNING_DETACHED state. Thread becomes CONNECT_THREAD_RUNNING_DETACHED only on one code path in nbd_co_establish_connection_cancel(), and on that path do_free is false. OK, what you say is possible if we call nbd_co_establish_connection_cancel() twice with detach=true. But that should not be possible if it is called only from .bdrv_close (indirectly) of nbd driver.

The problem is that nbd_co_EC_cancel() may free the thread state, and then nbd_co_establish_connection() reuses saved thr local varible after yield. Still (as I noted before), I've never reproduced it on master, only on my branch with some modifications. Still it seems possible anyway.


-- 
Best regards,
Vladimir

