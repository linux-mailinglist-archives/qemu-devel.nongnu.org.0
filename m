Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7225D31C620
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 06:05:01 +0100 (CET)
Received: from localhost ([::1]:54734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBsXe-00071u-9O
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 00:04:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lBsWg-0006CH-8G; Tue, 16 Feb 2021 00:03:54 -0500
Received: from mail-eopbgr60101.outbound.protection.outlook.com
 ([40.107.6.101]:53254 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lBsWc-0002Bo-2W; Tue, 16 Feb 2021 00:03:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=meacthKNxbSB/tlQmk5Rseggd+a7o4f8al+33x48Zg3cJNR6RGXEkGMOuao68Vrp/YvETtXcwJ98DK+R2WIDy/80Oy9rexG9fqIyaUkhPpRtmeZ3VDL7koADfxSqHnHbP7rY/rCcQiIN9Z0girw4LQ960N9jft7Ko3IoqM6zHEkZLVKH9mjZ/YY9oGeavTvsLJRMqpCnXhxOYvP88yKNCuzgY1xPGxlLL2Iqo2h+eisFySlHoA+K3aGzG1LdcYYo75wLXhaYP1G+QXwqpFv7iqefyrzJRnnxatAjgJ42GdN9RtwXEBksgBbxGuT3bJK5vKO17kkWulzEuchnw2rrcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8BSPjNEI0ZN32+98clHIHwEkSwsjFhmuKWDP/1XcEc=;
 b=B0Wj+y/bn0K0h6MgNynYK4HPKqwd/foTQKmfnz2DDVMwjJuk8k2yQR2/HhKtcjxpuSAoVdIroO+ZS6awW+J2FaWaPlnZnAcT3nLRvJh/tL/Oges1Bkyt54lzXpKyHc9yjeNho3xiXlZEJMadL+Q06Y2MPzMgfcYVYWPR5Z54nHRmbXBF25CjtI6Is1zeqBkg7rBdZae51TfMIYZTvj2xmKIm8oq8j5Ks2QBGFAATrNUBH2awgg93WOjcAi9uHTnOmFMbLlX1jInMMKrLoANgS78DmrpcHwGJgfVuwSM8HZuKpfayPzZCDNnCC01EAOEbWeNjHF66NYKfpr72NJ/Skg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8BSPjNEI0ZN32+98clHIHwEkSwsjFhmuKWDP/1XcEc=;
 b=NUecMPHmQxx1V2OyI+gscP1napAtxOMRNcHPj0mUdjCOZfpWz5/uV7J+IVTZLddQDH9KdyaHabtlXtD8FLH8bSXf0H3wjfOitCqC3PvK7eIhFImvFDvbKXjEm6xDz4GlloQzXEV4FfiH9iN5swdzlD+R+Lxr9CVRhsBNqwsFsxg=
Authentication-Results: kaod.org; dkim=none (message not signed)
 header.d=none;kaod.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6774.eurprd08.prod.outlook.com (2603:10a6:20b:399::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.39; Tue, 16 Feb
 2021 05:03:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3846.043; Tue, 16 Feb 2021
 05:03:44 +0000
Subject: Re: [PATCH v7 03/14] block: check return value of bdrv_open_child and
 drop error propagation
To: Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com,
 berto@igalia.com, jsnow@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, pavel.dovgaluk@ispras.ru, ari@tuxera.com,
 mreitz@redhat.com, Greg Kurz <groug@kaod.org>
References: <20210202124956.63146-1-vsementsov@virtuozzo.com>
 <20210202124956.63146-4-vsementsov@virtuozzo.com>
 <e076e88b-b5b0-258f-7300-2e4f6db985c6@redhat.com>
 <20210215092203.GA7226@merkur.fritz.box>
 <da15e18f-ac36-aaf4-6cca-2550939497a2@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <775123c9-2210-49fb-78ce-cddd2b34abb2@virtuozzo.com>
Date: Tue, 16 Feb 2021 08:03:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <da15e18f-ac36-aaf4-6cca-2550939497a2@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.244]
X-ClientProxiedBy: AM8P190CA0027.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.244) by
 AM8P190CA0027.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Tue, 16 Feb 2021 05:03:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 501ca914-024d-4973-e969-08d8d2383c69
X-MS-TrafficTypeDiagnostic: AS8PR08MB6774:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6774E45B9222522F7952E6AAC1879@AS8PR08MB6774.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P+h+o9/LFpgIP+qpkA5uuODkHNqdfMUiMpWevK/G7xNjcEzHG+P0HzCO4ijeBA42DF7WpVlLJKCrRDFVQt3QUTy3hQKFKWT1KGrP43KpWgEPhVtNTrXZjbCLYlI798onC2KZ2Hz6gE7PZl21Q4P7FPZ+/I8iVwsocOiwq4R8DcupeQhS5/4H5ID21VI0TmlizeC7MIzPL+fOO3Tdk8KSZhn77p+KBgR5XoOtlSVkOCZHgIjzreK+5D0kpLzYXaiC6Oh7Fz0odNYgzkuN59QxKx/w42kUswiChrjCfq7baSg6sNuUo4vV7N/vw8clJ0gsNvzAAw3N+wPOyT/1/rEYozxKTNz8OtdBI93+egixvAm3ObhVcySi7coIAp4nwvpJtNk6lr6MWWWip4EqR+aDXm3k+JogZAjI0+G5v2QvJVn/Ohxh5K6mgAQiMTiI0Z3UGu0wcw5XgTh2QSPexNglO26NHntFsRYXrV8R/PPRlRYfvjAmXepTDifuBQH5xQbN6gUUy1/MLL5zZ6uMgHwY9QM04MPZda9py9ZzYvh0yDkRVwiN/g5WVvyHsha84KVoGFmearAW9JNjIqBp+r2CCZPcLnWRKMlQrsNndTZM3hE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(39850400004)(396003)(366004)(956004)(16576012)(26005)(186003)(2616005)(316002)(53546011)(52116002)(7416002)(86362001)(2906002)(66556008)(110136005)(16526019)(66946007)(478600001)(66476007)(83380400001)(6486002)(5660300002)(4326008)(36756003)(31686004)(8936002)(31696002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?S3NsbURpM1ROU0paZG9GaDZFL2x3dGNyUHhiM2FJcCsyd0FqbGIyQWFwRVhu?=
 =?utf-8?B?c0g2d0RJbnMwMndpTVA1Ti9wMWEwenVkTVZXL0RhS2p6V1VkM3RqSC9ITEdi?=
 =?utf-8?B?UDloRkJSR1IvY2pWazNUWFgrLzI3dTBsKzJOY3loN0FOekZId3ZlSHgrdlpU?=
 =?utf-8?B?dGdjeXUrWU9Wb0gzYytlL1BTYXFyRHdkdVRHMTZlSG9ibDlzR3JLdElBU1dK?=
 =?utf-8?B?bXdaR0VQWWIvT21MNTJyb0JqOFFHQ1M3dzRFRTZrdjJ0ampaQzY2Z25Telcv?=
 =?utf-8?B?bkM2VFBvcE13eEpESWRseHFOYmN1YlZESTVMdHRuZFdGTHFscnFVZG5MYlV5?=
 =?utf-8?B?MHB4ZW1ONWlJS1lPYmpSNTB5djJoTEd5YkJyYVUzSDJGblMvcnNWSStwd1BP?=
 =?utf-8?B?MUdYYlgvRXZJMnBVTjJ0eVc2cExGMmxNU1pYazVmZDVJTnBzYXpkeXVDazVO?=
 =?utf-8?B?MWVUeDVJdUZ2dmxNMWFyWXFaSC9lc0lyUEt3L3ZlR2gxZHpwOVVyNzRLVVdN?=
 =?utf-8?B?NlRDL3FuaVpSd2kyZk9qaDQxNlUvVmRqMTFjbWFRSU9RdjZTckhUNWVsb2JF?=
 =?utf-8?B?Q3J4MkxWUTlLZTA2dnNFaWFueGU1UVBvaHVWQi9pd0FWdjRQMy9FTDA4ZnBZ?=
 =?utf-8?B?RU9tajhINzZUUnlOVjg5L2tnOElyelJ0U09QQ2tjcTBJV2VESEhWRnF1Z0l6?=
 =?utf-8?B?MytTclZ0UHdRWkpMM3YrY1doUVZrY0FoRkhlSVovdkhSL21lYnRCdkNZdWZs?=
 =?utf-8?B?YytaNnM4bkxyVHZ3YzRXMEY2SFdkbzVaYjl3dlZia2ZFZEtEeE9yMzFYNWlu?=
 =?utf-8?B?NXNnUmtDdUJVQWd0R1RmN3drRjh6WWVaWjRjTEY4VUg4U05ONTM0cTBVUGNv?=
 =?utf-8?B?M3J0WmVoRnBvSkhGbmF0WTRVVHd2TUE2ajRjRWpPUjNNb2lxSjhtMmUxYzBP?=
 =?utf-8?B?cVBUSWFDdjA5WW9yS2V5TFlQMm9MZjhMT0lyV2pZVHFvTVlNTG50c1UzSEd4?=
 =?utf-8?B?T05ycUZMVXcweEl2bEFIUldiVVVjd0xaM25mWFp5NVVVbUhvcXJsTUhJdHFI?=
 =?utf-8?B?Q05UajljV1hvdjJpRm5uMzJyRUxFUmRuU25qVXovdlJPZGc5dlhxV3B5RW9Q?=
 =?utf-8?B?UDZ6d1k5WUhyVi9HZjB2R2VydVMvV0I4bFR2Z2QxUlhHUkZIUGdRUzZxbE5P?=
 =?utf-8?B?ZEpEdjNDK0o1L0o0a2x6dGhYY0VIQ0tjU2tHOXRHSDRZWTI4N3FFVkU0eWRt?=
 =?utf-8?B?UE0xT3dLYXJGR29XejhkQWt2Y3hUa2dqMFRmZ1RtT0hWMWR5VndZYWRRSlJD?=
 =?utf-8?B?RWg3bkxCM2tMRGY2NHp0WXhPZzIyL0FOLzNaUHNCcVQ0YUhoeTc1QTl0WXd1?=
 =?utf-8?B?Ty9yS2srQ1QySXFlcjRXZ25YeHFDQ0Z2WjN6K2pUUDk0RDFOa1J1TFBid3Jm?=
 =?utf-8?B?eEIvNmpQejQyZWMyTkFMMUxIVWhKZ3ppUkJaNzg5cGdtMHQrUXpPL1d2T3VU?=
 =?utf-8?B?amxJLzI0dTFqYXRGZ3A3amJZTjZQWGRVdGtUU1hHRGZBRkJIa1IvUTQzMVJE?=
 =?utf-8?B?dUMrUkViS1NkNXB1NXozMEZjOTRUK1RuRDBDWUhvUVpCVDMrQWRIMmsvdGh2?=
 =?utf-8?B?TTdmVEVQR3V0ZStPZUN0ZmtFZzNITWFzSlpnT3pQa2hRRXBML2wyOTFaN3RB?=
 =?utf-8?B?M0w5TzRXUmJXQ1FsQmtZWncvSHlFZFloYlIraXNVY0xOc0R2THF2VVdpajF2?=
 =?utf-8?Q?g/lecIy9Bv0qtHRGjVuw344SAbRD8iPT5r7AkHj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 501ca914-024d-4973-e969-08d8d2383c69
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 05:03:44.7585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uz+2jDuJ6fxz/K3ydJ9PJevhMpVNInB9MkraaL+3yPXZ+ppPQBTXYl8jCheCy6uznUjVlyMt63tUKf9n97/V692THDuodpYuE7lur80Jep8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6774
Received-SPF: pass client-ip=40.107.6.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

15.02.2021 23:04, Eric Blake wrote:
> On 2/15/21 3:22 AM, Kevin Wolf wrote:
> 
>>> With this patch applied, 'check unit-test' fails with:
>>>
>>> Running test test-replication
>>> Unexpected error in bdrv_open_driver() at ../block.c:1481:
>>> Could not open '/tmp/p_local_disk.z1Ugyc': Invalid argument
>>> ERROR test-replication - missing test plan
>>>
> 
>> The problem is this hunk:
>>
>> diff --git a/block/qcow2.c b/block/qcow2.c
>> index 5d94f45be9..e8dd42d73b 100644
>> --- a/block/qcow2.c
>> +++ b/block/qcow2.c
>> @@ -1611,9 +1611,8 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
>>       /* Open external data file */
>>       s->data_file = bdrv_open_child(NULL, options, "data-file", bs,
>>                                      &child_of_bds, BDRV_CHILD_DATA,
>> -                                   true, &local_err);
>> -    if (local_err) {
>> -        error_propagate(errp, local_err);
>> +                                   true, errp);
>> +    if (!s->data_file) {
>>           ret = -EINVAL;
>>           goto fail;
>>       }
>>
>> bdrv_open_child() can return NULL in non-error cases, when the child is
>> optional and it isn't given. The test doesn't use an external data file,
>> so this returns NULL without setting an error, which now gets turned
>> into -EINVAL instead.
>>
>> This makes the most basic tests fail with qcow2 (iotests 001 is enough).
>>
>> The other hunks in this patch don't suffer from the same problem because
>> they pass allow_none=false.
> 
> Thanks; that's enough to figure out how to repair the patch:
> 
> diff --git i/block/qcow2.c w/block/qcow2.c
> index e8dd42d73b4c..38137ca30eb0 100644
> --- i/block/qcow2.c
> +++ w/block/qcow2.c
> @@ -1292,6 +1292,7 @@ static int
> validate_compression_type(BDRVQcow2State *s, Error **errp)
>   static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
>                                         int flags, Error **errp)
>   {
> +    ERRP_GUARD();
>       BDRVQcow2State *s = bs->opaque;
>       unsigned int len, i;
>       int ret = 0;
> @@ -1612,7 +1613,7 @@ static int coroutine_fn
> qcow2_do_open(BlockDriverState *bs, QDict *options,
>       s->data_file = bdrv_open_child(NULL, options, "data-file", bs,
>                                      &child_of_bds, BDRV_CHILD_DATA,
>                                      true, errp);
> -    if (!s->data_file) {
> +    if (*errp) {
>           ret = -EINVAL;
>           goto fail;
>       }
> 
> 

Agree.. Or better refactor bdrv_open_child to follow more common (and recommended) semantics (i.e. NULL + errp on error, non-null on succsess).. But this will require more investigation.

I'm busy now with our internal deadline (this week), after this will return to handle upstream things.

-- 
Best regards,
Vladimir

