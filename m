Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D62537B643
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 08:41:04 +0200 (CEST)
Received: from localhost ([::1]:55790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgiYI-0000zU-Rw
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 02:41:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lgiVo-0008V7-KO; Wed, 12 May 2021 02:38:28 -0400
Received: from mail-he1eur04on071e.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::71e]:32898
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lgiVj-00032W-9T; Wed, 12 May 2021 02:38:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CVk1LavjFXhFgHILJSZpGKW9sPwspTtjkqPvAlT732pjykJ5h53o43veqjrK6L53piDDlBHTZPD77XXcTP6LH1AVJBDxO/ffBWujGzZux7XGfsdJZDqfIudSwO7iP9ntUndGKCDngfQyuYcJcEH775kqCkWGfl35XBYZBiSikIvEALIsxLvgOq2UJ2z1rAyra7AmXGAectX0hXZy4YBJw3z+MUhFTI+1IsPkhcU4TpYVLh6ZM5gAPw8sfvHsMJ3JuA1xsb1B0PyEtZ8eZbrfItmWQ+ydGnv0hE1y1jiYYuG3HBDPUaXOhdQF8JbEoKPG560deaNCnnY3ycRFQkW0Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TEacGcCJmc5kGEqNYXabCryDT0BaiaX58HD6oDh2hsU=;
 b=MT7Eo4tX4W3EiPnPj0RajaUOWMfgOs/gXMTd18/1Nk2wu6vQRqSHf7zoZrR98/DVP3XkQOW9ssFSjs0yRclXmHWP3jpr+ZAAMYXiLJ+VjnP+TapGiYsxs2uAWgo8mO5GhIzrTWRqS5HS+/fJ9H4y2yh4b5y0foOmrYdyxjmUW3Sf7wsPbOIVuDiH9SasFcl0bJidwO3jrIUdEzHQmLfEUacAHCj2eyYfCPgpdAm7CtjvUHa7B6f+z8Dmd7tZzWM4ZIMarT6ipUVo62WnOP9dVCsurk9ylzgR/0PN4H1jW9gBEhPvbvTf0dpo1iz6k4kETJ2FDPFGgODj35AgAQcwZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TEacGcCJmc5kGEqNYXabCryDT0BaiaX58HD6oDh2hsU=;
 b=iZZBm+WkvphXb3dFIDEQPmb4uDWe00xNeBNQA2/cG5y77ujqwC4oKwBxMwS8BJojKLIK76kOQj0K4idC36hve2HHMparDMhlZnahtHQ760zbKhupeuB1O9I3otS7Zz7vR2PsyRZbnOiEWRUfeAIwQ5c7vU6F6UJM16Ur+8O3P/c=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6855.eurprd08.prod.outlook.com (2603:10a6:20b:398::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.27; Wed, 12 May
 2021 06:33:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.031; Wed, 12 May 2021
 06:33:15 +0000
Subject: Re: [PATCH v4 06/11] block: make BlockLimits::max_pwrite_zeroes 64bit
To: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, integration@gluster.org, namei.unix@gmail.com,
 dillaman@redhat.com, berto@igalia.com, pl@kamp.de, ronniesahlberg@gmail.com,
 fam@euphon.net, sw@weilnetz.de, stefanha@redhat.com, pbonzini@redhat.com,
 pavel.dovgaluk@ispras.ru, ari@tuxera.com, mreitz@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com
References: <20210324205132.464899-1-vsementsov@virtuozzo.com>
 <20210324205132.464899-7-vsementsov@virtuozzo.com>
 <94bc702a-99a4-9a94-cf9b-6c67f4cf1fd2@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <1923bf2a-5bbc-cc4d-6c3a-314846dc8d94@virtuozzo.com>
Date: Wed, 12 May 2021 09:33:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <94bc702a-99a4-9a94-cf9b-6c67f4cf1fd2@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.203]
X-ClientProxiedBy: PR2PR09CA0007.eurprd09.prod.outlook.com
 (2603:10a6:101:16::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.203) by
 PR2PR09CA0007.eurprd09.prod.outlook.com (2603:10a6:101:16::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Wed, 12 May 2021 06:33:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0a365c4-c241-45f4-cf2b-08d9150fd27b
X-MS-TrafficTypeDiagnostic: AS8PR08MB6855:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6855AC1B9E1AB3583C339162C1529@AS8PR08MB6855.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9N7xYVH7qRi6JQZX/kkX1ijBN0B1gASc4/RsJLRQz8F7ZUHu+73ZJWYORB8LZdkx4qKVp/uUZb9dB3KMmLJ9f8jA74iUnP5ExiWoZ4B95wQX5/idcbzzfy6F9k30VT4+FH2jQXS/IDDduYkyMg2TLz86fkk4MnLfbMmkp72Lp1UAZpsO4m8koR2DNb85rzHEVAYpQSoYrQYBV4rFWfedH62zR4eE7hnFHNsfbYkQkYHmi8K9gWxB0bjfp706PUt1N26pYg9uv0ejN57e7MUp3ysH0BXh9Co3jsRK6tzQPTT0kmUQLRQOxUrcGvhPNz8GkEH6PNACmhu1KZyDOsV/9CU4IHTAHoanuS4dUJ2qg+JzPZzoyR8aHX9yiT5tjJUuxlYtdIeLZx/4FpUkACmV7MX2MRXpKghZGaFITATiVwSBz4t0GIsVLO5+jAgQ+0tVP3EN/Y6KTA37rXRcMIC9GUetZsP5YZ7zlU7y9WlHddlYbqFJlLqGx6oE0EXWt894ztNG5sSkvmGIDU9okX+f1Nc75OadVVdCmsYArrQ/lfjTryNodarHzB4r4U6fApqWDqfkjwVQKmO0xLKDtq6UsSg/q6R5GkuyW0/myoIoYgiStAVs/ExfCxAAVV3nXWEE0t3SxoyzWDULrDlN0KzZEmR3oC9C2hiZPypPh+3VORl+dTXsWIQi7B2ZAK8N3IkWqaHDIm9TNxTuyPEK2xjo3i8Jj5FaGu15/lxZ8nez/w8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39830400003)(376002)(396003)(346002)(136003)(956004)(38100700002)(26005)(316002)(38350700002)(36756003)(86362001)(8676002)(6486002)(2616005)(16576012)(31686004)(83380400001)(66556008)(53546011)(52116002)(186003)(66476007)(2906002)(66946007)(5660300002)(8936002)(31696002)(478600001)(16526019)(4326008)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WEFOTVFQaC93QWJPYVRsVmFtc2JybUFKcDAxdlRQSVIrcG9zOW9zRlNrZDMx?=
 =?utf-8?B?MDh6NTNlVWJQNGhJWkcyLzVuL0p3QmdCZW9xY3lPNmt2L3ZvSnBQeDJQZDFr?=
 =?utf-8?B?NUYxVVg0WkJCMnZrK1NuZWozS0x4ODg0U0trQzk1UFJDNXBuV3hUK2V0YXFE?=
 =?utf-8?B?WElLckk2Q2RlZHkzaWdEd2hSTmxDNjRNNHpmOUNYVU9idGhZN29ieG91eUMr?=
 =?utf-8?B?ejR3RUkxRzNER2xORFhsZWNKcTNwNHU5RzhIaXhHZlNZbDhTT0EzeHZnSS9h?=
 =?utf-8?B?b3ZPOXR6bWFXdnY2ODdQdTZsSmxKL2xQblE0WllRSUlCK1d0UTJIUU1hN05B?=
 =?utf-8?B?Z1RhVEZnTDlxSGtHZHloV2RlTG1TN3p3cGNaL25zQmJBdXZ5SHdTVEg1a09j?=
 =?utf-8?B?V0l3Tmx3V29jYlhIZkRaemJ2d1hWR0xpeHNwMG9ibGRqZk9ORnIvYTZkczlz?=
 =?utf-8?B?UUdUc0RRdHZtSnB5eW5CWEhQSUR2T1MranI3KzgvUDRPRE56UGdEaUdSYVE3?=
 =?utf-8?B?RkkxbE1LV1BtV3ByK2MxYWx6SFYxNDMwTlRBWE92bURMSjFqanl2Unp1cVhn?=
 =?utf-8?B?anVrODhHZmViMXFMa3EwM3VFVHg4Ti9ZS2ZDYzYxWWpGblVkVml1UkdZeGRL?=
 =?utf-8?B?a25jSGRGaFVqaStENUFOS2diM01xZHRjQ2FEODhNY1lrdFhjMVZ0L3k1UUhm?=
 =?utf-8?B?UHptTG5kbGlWWjVPMGdPUDJTMnZLRHJxRmRhYkt5K2E3ZlMxN0JQZDErTkhV?=
 =?utf-8?B?dXhBVzdxVVRodG1GVGhNNXJ4bG5melQ4NGFTL0s1QzdNcnpHNjZYdy9GUHRn?=
 =?utf-8?B?RUFNU2RiM3I0YkNvZzVDNERDdDNETzd0OVlEekdKUm5Ob2FZRE1yVE9RTFVD?=
 =?utf-8?B?T3hkbHZud0dFa0dpNE4ySGZHTHorVjdyZ3JtWEl6RHdCRi9zcWh2WUxKdzYr?=
 =?utf-8?B?UkZGSUZEa21OYm9UTjg4LzVPNjRxd0pxbkU1akNSU2o3TnJ4QU5mYndEVSs4?=
 =?utf-8?B?d1Z3K1JiS1NpZjVCSWpLTnRVMzIycWV5bTRudG5pS2pCa1UzYWloMURENEJG?=
 =?utf-8?B?ZEk1ODVsWGZWbnZnUWtrNkhUWUNEd2Q0NkZtcDVwOHBpbzJrNE5YQWYrTWFW?=
 =?utf-8?B?SHczQmhZVUxwRFJvTWU5a2VrQ3Z1Y0ZHYk4wd2RNMFA3RXkzbTF0Ym9mWVNo?=
 =?utf-8?B?Vm9MbWF3M2JEVlhNdEZ4eU5aallUdW1JZEg3eHFjaFpPSEx0WjVlNzlTdVJP?=
 =?utf-8?B?N2R5SW5xZFdRTkxranpjZjcrTVAvMU1xaGJsWWRiRU00R0M4N21vRjlta1BO?=
 =?utf-8?B?WW84K1ZNQlVFNUFYTVhXZ01mQlptTHNBeWdYellrMUJ0L2F6TXZHM3dVZlc3?=
 =?utf-8?B?UXVibDhDRDNGaFVUaW1rVVcwSVBTVUJqaTdQUUphR3pVRlVMLzVndFBhd2FJ?=
 =?utf-8?B?OENXTGJMOW5kTnA1UmhVenpwbDVqOENqRlRNRG9QM09idHNOako4OHhiU3RT?=
 =?utf-8?B?dnVGUkZxMFRZbUxUR2tRSW9ZUjZacEl1dWFNNDlBZE9CemhxejNXQjhDZWN1?=
 =?utf-8?B?WCtOOFRWcjZPdEt4NUhjNHltUlF2b1pjbitid1ZxTk93bzlyYzIyRVlTOFlP?=
 =?utf-8?B?cnJEemFIczlTZlVWUG10akhpMXFna0N6NmRPWVJsNzFCWWhBbHBpTE1vbmZ6?=
 =?utf-8?B?ZENUZmFrM0Q3UDc3UTB5b3orSzdXWU45SkJBWFhMUFVqSThreWpIQlJCeWdC?=
 =?utf-8?Q?eC08qjgB6Z3sI/VI1fu8OeCj7ZCQss+mnmhPIbq?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a365c4-c241-45f4-cf2b-08d9150fd27b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 06:33:15.1489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DblBoahRhTKcKDtzJEwFcMNW3htscfa2g5xviRXuR/eiOQR5JqHKHm+gFEbrQBxXY/TgtArzWjuU58RsmYk3pDDdNQVDbl4H5TxHzPANNVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6855
Received-SPF: pass client-ip=2a01:111:f400:fe0d::71e;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

12.05.2021 00:19, Eric Blake wrote:
> On 3/24/21 3:51 PM, Vladimir Sementsov-Ogievskiy wrote:
>> We are going to support 64 bit write-zeroes requests. Now update the
>> limit variable. It's absolutely safe. The variable is set in some
>> drivers, and used in bdrv_co_do_pwrite_zeroes().
>>
>> Update also max_write_zeroes variable in bdrv_co_do_pwrite_zeroes(), so
>> that bdrv_co_do_pwrite_zeroes() is now prepared to 64bit requests. The
>> remaining logic including num, offset and bytes variables is already
>> supporting 64bit requests.
>>
>> So the only thing that prevents 64 bit requests is limiting
>> max_write_zeroes variable to INT_MAX in bdrv_co_do_pwrite_zeroes().
>> We'll drop this limitation after updating all block drivers.
>>
>> Ah, we also have bdrv_check_request32() in bdrv_co_pwritev_part(). It
>> will be modified to do bdrv_check_request() for write-zeroes path.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   include/block/block_int.h | 7 +++----
>>   block/io.c                | 2 +-
>>   2 files changed, 4 insertions(+), 5 deletions(-)
>>
> 
>> +++ b/include/block/block_int.h
>> @@ -676,10 +676,9 @@ typedef struct BlockLimits {
>>        * that is set. May be 0 if bl.request_alignment is good enough */
>>       uint32_t pdiscard_alignment;
>>   
>> -    /* Maximum number of bytes that can zeroized at once (since it is
>> -     * signed, it must be < 2G, if set). Must be multiple of
>> -     * pwrite_zeroes_alignment. May be 0 if no inherent 32-bit limit */
>> -    int32_t max_pwrite_zeroes;
>> +    /* Maximum number of bytes that can zeroized at once. Must be multiple of
>> +     * pwrite_zeroes_alignment. May be 0 if no inherent 64-bit limit */
> 
> Is the comment still right?
> 
> Leaving as 0 is the easiest way for a driver to say "default limit", but
> I would feel safer with the default being 2G-align rather than 63-bit
> limit.  And it is a 63-bit limit, not 64-bit, if the driver opts in to
> INT64_MAX.


May be, just s/no inherent 64-bit limit/no limit/ ?

I think that no-limit is better default: let's motivate drivers to be 64bit. And if they don't want, they should specify limit by hand.

Hmm, also, you missed v5 of this series, rebased on master. There almost no changes, so your answers should apply to it as well.

> 
>> +    int64_t max_pwrite_zeroes;
>>   
>>       /* Optimal alignment for write zeroes requests in bytes. A power
>>        * of 2 is best but not mandatory.  Must be a multiple of
>> diff --git a/block/io.c b/block/io.c
>> index 55095dd08e..79e600af27 100644
>> --- a/block/io.c
>> +++ b/block/io.c
>> @@ -1836,7 +1836,7 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
>>       int head = 0;
>>       int tail = 0;
>>   
>> -    int max_write_zeroes = MIN_NON_ZERO(bs->bl.max_pwrite_zeroes, INT_MAX);
>> +    int64_t max_write_zeroes = MIN_NON_ZERO(bs->bl.max_pwrite_zeroes, INT_MAX);
> 
> You are correct that for now we have no behavior change; a driver opting
> in to a larger limit will still be clamped until we revisit this patch
> later to drop the MIN() - but I agree with your approach of keeping
> MIN() here until all drivers are audited.
> 


-- 
Best regards,
Vladimir

