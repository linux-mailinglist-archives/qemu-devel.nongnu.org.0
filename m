Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8182A365996
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 15:13:16 +0200 (CEST)
Received: from localhost ([::1]:40976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYqBn-0001Tb-ID
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 09:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lYqAU-0000kJ-1H; Tue, 20 Apr 2021 09:11:54 -0400
Received: from mail-eopbgr150131.outbound.protection.outlook.com
 ([40.107.15.131]:28941 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lYqAK-0001CK-Kb; Tue, 20 Apr 2021 09:11:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A0DDY1dZtreJT5uEt/8lyqiQl4AUwMDADu9LkGGVI3eZw1lHl7c2SQBiVq3I1xuFQ0K9xkUigTdTu3ZHNC05eCrEBSsyc9vzlrAVQX1XWqaBoWtVbDnkZhPJVRGIR0L02JYpE0CTho3EXsLVwV2CN+IRmzHzaCLkTG1WoWnrz/KT8ERO5IDksBIfKPn1wlBt0O+nMf+RzxgA9FleoIOqoj6mItqqC0aYNee2qp6/IE6E1bhO+vpwxy+GYK1IjLfakkRHXkX+cLOniYwAWLUT6KwM55qDkSMK5O6JS1fKjZi6cl3t34/x4bmctuu9SQClAGtEHB2Ugms8P0oxkQW0MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLOJI5AvQzD9cuF8zc0Ggv0rCLp3igXVFQ2x7OsApO4=;
 b=F2doUQAYPaidjcH7gSyPPiGSWxMDjsLFBWDiS1MtTLv0UTQefQ0EytV+40zw4Iz3XmCWBuHcI3/CAh4e0SbiZ29mDUL2UsfWk500kSmZe0tOLCAgSB5vAPwjpikCEgX90BDtLlgQfJMEeimVV7OHfP65kA26sngKLw7Jp8OgIWBjlol5uiTc774I4DX8AVdq3KnKVBnRRNfOFCs/Z5pGEqjrdQRn1OdMOLWzaPq0wyJ222g4GoW8DFQTXCflDX9VdpmAuwZ4yyZiqXnhLwdsQNeG5np4Tu6On0UR4LIsnlH5kjoiF4Lv6NcwhoP/x0t6f45ny5LA8k/x9lnnnxkQWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLOJI5AvQzD9cuF8zc0Ggv0rCLp3igXVFQ2x7OsApO4=;
 b=cgFAJJTOHmeVZwV0eZ8gfQoaqvR6ifVjvf8HmdkmTTVSZdmqpl9YIxQLrn3Ob8THP+Nx6ObmwpLCRTR5cBhQLsYqjE8QoIx65RqfyEaFRBDBT4l7AAx0ZVdsJYFv/WzL1futAKd5ootKrgJgzsFUCS31XE4SZvZuD8Q7aTcYm5U=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3720.eurprd08.prod.outlook.com (2603:10a6:20b:8f::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.20; Tue, 20 Apr
 2021 13:11:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 13:11:40 +0000
Subject: Re: [RFC PATCH 1/3] block-copy: improve documentation for
 BlockCopyTask type and functions
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-devel@nongnu.org
References: <20210420100416.30713-1-eesposit@redhat.com>
 <20210420100416.30713-2-eesposit@redhat.com>
 <9576b9d5-c40b-14d4-399f-4d14473433bb@virtuozzo.com>
 <2210f74d-53f8-caf3-6f7b-6f2478d8d507@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <374cb0f6-c0d0-3fe3-166e-5a22ee85810d@virtuozzo.com>
Date: Tue, 20 Apr 2021 16:11:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <2210f74d-53f8-caf3-6f7b-6f2478d8d507@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: PR3P189CA0069.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 PR3P189CA0069.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.20 via Frontend Transport; Tue, 20 Apr 2021 13:11:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b53b798e-da72-43cb-589b-08d903fdd5ec
X-MS-TrafficTypeDiagnostic: AM6PR08MB3720:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3720A1FDF64B3D5DE2DE78B2C1489@AM6PR08MB3720.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uBU0jxzzeA+kzSZcRH98TCTDMWHjSXg/8VDShB6WVUS9m9DT6OnJfLywreIKJ7L4iYz1XxxDLmLkj0Ko4xjtx/DEZj1C04lJvVHY61LtCE7AuUNSeue+9SSDLMh6nTBUf9oG1Hjwgjb+zBpOEknVjL9+G5kiILaHmy4+UMCSvMFlr9XU2geela3dKd8HSG+NFzVwtFmpxbVs1/Azn6Tcg+IW/3xzOaeV0D+PiakoB0Bs5Fuw5zG3h1aBe1NjbK0A+nAdww0djWHOPCNapjA8p+pCAE3CrTpBa70Qe10J5UHukdC5VE2QpoTTgMLt3Y3ceITIosEL3r0Qfw2LpcxIfn2xHo1iGvAT7MMh9CJ9Y92sPLOfz729E/68nEpq+zUzImAghd3FxN8Q0XKZ9RODm7pG4g/j56G+Cw3lR4SehMF5V9MRLB51IQsHFmzlY4mo/h60oLgohQXWzL0zGUTvQIrJXvs6SZeHX4MCRja/mk476TUzIHox2EVHI1rXNv+IlrBAWReH07T8uA5q9W/C6XJGZHnvu/ecgc0jyiafT3HmeWqE9YXWnvgQ7dgVl3XRYHxdNjo+6rXafjMkj1OvCt/LzSknaZxt2/t6unJz2MbZrgc+VEyxfmRkCpyBbxAwioFR/jiw9zGxFh0v4q08Bumlsf9TOdXpYLdl+4xU59JJZDNpXt3m8OZhrBmc4YRzz0d16O2KWed2JgMNiXq3hfciOjlZHuS+oA4OSAHDqDU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(396003)(376002)(366004)(136003)(4326008)(31696002)(6486002)(66476007)(53546011)(8676002)(83380400001)(66946007)(16576012)(478600001)(2616005)(316002)(26005)(66556008)(16526019)(38350700002)(186003)(956004)(36756003)(31686004)(52116002)(5660300002)(2906002)(8936002)(86362001)(54906003)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M1RIa1ZwbHZjQmpFODBlbHdZem9jaXVuRElQRXVNSFJMUVRHSXNySUNTbFdV?=
 =?utf-8?B?NTE5NXdQSWx5cmdST3haSTV5b1A4YzVJd2hLZUJUWlV0alkzcmtPQVJQTnRL?=
 =?utf-8?B?ck93OGV5YWRsR0UxM01jZlNCVUpZR0JCbk1xQkZVa3VVa2lvVVZhK1FXdm9B?=
 =?utf-8?B?a3pwazVnQnZWWkNpUVlyYzJndlpnZWhjbjRGV2Z4K2Jjd043aWNMYm1pRzZB?=
 =?utf-8?B?Z1pVRHNwMUJVUTZsV1FZSUxUNUFRVFVPOUZ1YXdYaFRCWW1wSjhSMU1LZGFO?=
 =?utf-8?B?anZ6VWw1YVpraFhkOE00ZG8yMmZWamRSN3RYSDdnZlI2RXV2WldBdGpLL3Yv?=
 =?utf-8?B?Z0FIVjRnRXFydHFqckVxaFJVaW1sR3RIbUpoNWZqS0w4czJrWXFwQm96OGZ3?=
 =?utf-8?B?b2NmN3JCUndoeXdiWGE2RlRCNjJoVHF0UytGQWNIVlBFb0lzeGl2TUdmZ2Va?=
 =?utf-8?B?d3hSd09GYjRJMy9wVXUrcjJVUkFHM3dCSDZWeWlCcklVb3hiVElQT0taNzhE?=
 =?utf-8?B?bWFZbTgweHpPVkdkaElmeGFwcGRzN1ZUWWtsYURsWEJJaHR6QkdWUm9ERDF5?=
 =?utf-8?B?dENORVdkd2NKZEEwQ0Z2OGVGcE1HbUM1Um5aOXUxZUErbTc5QXNUSzBPSmpG?=
 =?utf-8?B?NGNFM2h1aE1hMnZ3SlJXdWcwRWR5RmRLWG5iQUQyVm9yYSt1N2VaUUNwV0h2?=
 =?utf-8?B?SlFSYmIva3ZML3BraUFlN1llMERIdU02QzVsYk9YYjZuL2o0RGxZdllGa1BP?=
 =?utf-8?B?bG85V2xHK3g1a3ZvUDNrbXh6NmRObm9QZllDT3ZYYi80MjJCQm5XYkJiMXp5?=
 =?utf-8?B?TCtQaW9TbUJuTEs3ODV0S0tkeVd6cDN4dkdlOEVTbzFaN1JCNlJEaFVHeVRX?=
 =?utf-8?B?Z1FSeFFSOEkzdTZYYmpsOHhZeTZFWU1oN2hBaUl4WklUYk4wNS9xNFI2QW9m?=
 =?utf-8?B?ekNqZXN6WFMwWkw5bk5kOGwvS25QNjdPd3I5U2tuNjFFcC9IUFU5S29yZTVN?=
 =?utf-8?B?MEJESVc4cFFlZ0JNdjhoemRVNURxNzFZM3k3MUU3UU85YnZTTE04bVY3bEJD?=
 =?utf-8?B?cTdqbExWVG9seGVQRlk2R1pqUzl4dmZrNEcxekRSaUZZSEVHNjRQeUxIbUpB?=
 =?utf-8?B?TDdOcGVwYlNaUk5BMndzaDFNV2pmcGhycXRhVzd2N1BCN25oa0FENitWaGtk?=
 =?utf-8?B?UHhkRDJEaVAyMDlrbjVrb0xOMmZhaVpxeFl1S3lOSTVhZU1DREJGQ0p0R05u?=
 =?utf-8?B?eDltQWVxTStDcmtWKzdXZlF2blJCUHJ5WDRkd09TRHExR0ZjdElNVjY0OG8x?=
 =?utf-8?B?TVpZU1RHMGI4VTFJVTBBc04xK3k5bnlubnBsRmErL24vRldhVkIvVjhzdDJR?=
 =?utf-8?B?Y3FETWZQaVVKYzNRNS91UXFkNGJzeDdxNzhKWEJmWStFRGpmL00weGhzUDN0?=
 =?utf-8?B?d0h2b0hZNWZKZTJ3S3MyNDh4OGRRTGxGNUxGc1NueloxbWV5L1I2M1h1dGVJ?=
 =?utf-8?B?RWltL2picWdZdHB6VjRhbTFnV3liU0txMkpiT1oxb2N5R3U2S0lVa3JpTWRr?=
 =?utf-8?B?R0Rxd1ZaKzJnZUdySXFYTTRyNjhzZCtUK2oxY0h0dFZtTXlHemltS21qdk1N?=
 =?utf-8?B?a3hCUEQ2aS9jaVdBQ3kvUzRoczFSQ2M4bmNlVzZRRnFldGNoY3J3cGh2QWFD?=
 =?utf-8?B?NkxXTVM3eXdPcms4eTlHRmlYc0h1cHhlZzZzWXBhZW9iUkZJSWRiMFZ2azFw?=
 =?utf-8?Q?bysakBimUfXpW/l7osK9icdPRXbcmcOW1N2gW0f?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b53b798e-da72-43cb-589b-08d903fdd5ec
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 13:11:40.1386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xVbhJ24xFx2cTb0i4i7aOh2i0ZwUBSN/RvnyCeTuZqfEgQ1bapwmtWV0RW2yFdSNef5/GAJWnpA90kt5KL8gteRoZRuM79rXdwP8sxOS+40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3720
Received-SPF: pass client-ip=40.107.15.131;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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

20.04.2021 15:51, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 20/04/2021 14:03, Vladimir Sementsov-Ogievskiy wrote:
>> 20.04.2021 13:04, Emanuele Giuseppe Esposito wrote:
>>> As done in BlockCopyCallState, categorize BlockCopyTask
>>> in IN, State and OUT fields. This is just to understand
>>> which field has to be protected with a lock.
>>>
>>> Also add coroutine_fn attribute to block_copy_task_create,
>>> because it is only usedn block_copy_dirty_clusters, a coroutine
>>> function itself.
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> ---
>>>   block/block-copy.c | 15 +++++++++++----
>>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/block/block-copy.c b/block/block-copy.c
>>> index 39ae481c8b..03df50a354 100644
>>> --- a/block/block-copy.c
>>> +++ b/block/block-copy.c
>>> @@ -48,25 +48,32 @@ typedef struct BlockCopyCallState {
>>>       QLIST_ENTRY(BlockCopyCallState) list;
>>>       /* State */
>>> -    int ret;
>>>       bool finished;
>>>       QemuCoSleepState *sleep_state;
>>>       bool cancelled;
>>>       /* OUT parameters */
>>> +    int ret;
>>
>> Hmm. Somehow, ret may be considered is part of state too.. But I don't really care. Here it looks not bad. Will see how and what you are going protect by new lock.
>>
>> Note, that ret is concurently set in block_copy_task_entry..
> 
> It is set but as far as I understood it contains the result of the operation (thus OUT), correct?

Yes. I just mean, that ret should be protected too. If block_copy_task_entry() called concurently from different threads, we'll check-and-set ret concurently.

> 
>>
>>>       bool error_is_read;
>>>   } BlockCopyCallState;
>>>   typedef struct BlockCopyTask {
>>> +    /* IN parameters. Initialized in block_copy_task_create()
>>> +     * and never changed.
>>> +     */
>>
>> It's wrong about task field, as it has "ret" inside.
> Not sure I understand what you mean here.

task.ret it not an "IN" parameter

> 
>>
>>>       AioTask task;
>>> -
>>>       BlockCopyState *s;
>>>       BlockCopyCallState *call_state;
>>> +
>>> +    /* State */
>>>       int64_t offset;
>>
>> I think, offset is never changed after block_copy_task_create()..
> 
> right, will revert that for offset
>>
>>>       int64_t bytes;
>>>       bool zeroes;
>>> -    QLIST_ENTRY(BlockCopyTask) list;
>>>       CoQueue wait_queue; /* coroutines blocked on this task */
>>> +
>>> +    /* To reference all call states from BlockCopyTask */
>>
>> Amm.. Actually,
>>
>> To reference all tasks from BlockCopyState
> 
> right, agree, thanks
>>
>>> +    QLIST_ENTRY(BlockCopyTask) list;
>>> +
>>>   } BlockCopyTask;
>>>   static int64_t task_end(BlockCopyTask *task)
>>> @@ -153,7 +160,7 @@ static bool coroutine_fn block_copy_wait_one(BlockCopyState *s, int64_t offset,
>>>    * Search for the first dirty area in offset/bytes range and create task at
>>>    * the beginning of it.
>>>    */
>>> -static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
>>> +static BlockCopyTask *coroutine_fn block_copy_task_create(BlockCopyState *s,
>>>                                                BlockCopyCallState *call_state,
>>>                                                int64_t offset, int64_t bytes)
>>>   {
>>>
>>
>> We mark by "coroutine_fn" functions that can be called _only_ from coroutine context. 
> In my opinion, block_copy_task_create is a static function and it's called only by another coroutine_fn, block_copy_dirty_clusters, so it matches what you just wrote above.

"coroutine_fn" is restriction. block_copy_task_create doesn't need this restriction. It may be safely called from non-coroutine context. So, no reason to add the restriction.

> 
>> block_copy_task_create() may be called from any context, both coroutine and non-coroutine. So, it shouldn't have this mark.
> 
> Thank you,
> Emanuele
> 


-- 
Best regards,
Vladimir

