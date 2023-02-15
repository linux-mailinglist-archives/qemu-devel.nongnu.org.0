Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A9A697AC4
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 12:30:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSFz0-0002CJ-DI; Wed, 15 Feb 2023 06:29:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1pSFyy-00021e-JP; Wed, 15 Feb 2023 06:29:52 -0500
Received: from mail-db3eur04on072e.outbound.protection.outlook.com
 ([2a01:111:f400:fe0c::72e]
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1pSFyw-0004fS-2j; Wed, 15 Feb 2023 06:29:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPQZKDZr8fxtN9K2ksyBo5SPGq6s+rTMbtQQtXEU3Npil9km4WtaIcaS6zWb99xG0oljFhk2NyhFp3e8yqeBctDgM6ZGMWFg32na0hNpFtgkaslLSU1YnpYIr+74WSl9vuanZmrmhae2bxaoI8WunE3VfXP1bThWO38n1EEHr88RHJh/pINUpp4FXVT6R0GSGn7ZBkARuA4ejdScJkVCKwAFPvFkUNNh5PRMs1mdnMRzsHmOryJ2AvP7bE050cODkpG/ZuPBXuJjR4NUM4TF3yDqokDhwNnZhb5tKUZxiSEoj6+JemEePDfANwPgEDFjphCIWB1yTVdnlzKpV6DMRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EABL2PPlrW4HpyqPB0BU3eNwSxYM1fIV78XC62lLsJY=;
 b=T9sr0h59AwyRUz0nh36UBKJG7M+Amb1oMX1dBXC/TI3ST7yZhwkZJNS2RkZvRD20E/NVwJ1tphrwvSmCGOLinKh71qGUNToMzq/RdAd+QOYGv+4obtrfdIZg/EeNIuE8dxu4VwVqkxaVaR3arSmFAqhRPwQADqzRtR0xp/0o4CCxFRrxLYkMyVXifPXRiIRn7hhFuozUkRH+FOshUf80Y844MP+utvNYvm1hf7wYtbbSs54dtKV23g5UeojrC/92dUm46ti5a9wsLzXu6rYHF9r2JeAOldPWBRtwnmK5KFxQoPQ+0rkt/oyq5fF6g+4GXyYIIDtu4s+/KBum5lDuVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EABL2PPlrW4HpyqPB0BU3eNwSxYM1fIV78XC62lLsJY=;
 b=NiyAa6WJDPN+FTuMe+2r5MTCn26fzia2fItM11e3XIFxhLEqD11JCbgJ8/ZHWCuUph8GZPfuTNOYCBjva0XuxCTHi13GycI61ZMEpzloDAbwVBL5hVnlljHOjCT9zWAG7uKJQM5YD+GO3OKyyJmqrgLocI59vvTIYW9krOZtXAL2YMscWmh3fhpCoRl7FJP7/9EJOA2aD3LSCVThHdj+Yh274aHY1pXxtSML5796L5purgoYV0HMFCAvWS9HYmK+pE2/JMhXo4QqSaO91or2a2Ov9Y/D4JFSlr8IaIdqHRnOowgTDMszgHLrEMMtyYetZTC6SnSjm5wzlR4UJWKjOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by DU0PR08MB9654.eurprd08.prod.outlook.com (2603:10a6:10:448::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 11:29:43 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::eb1:689:d0da:8fc0]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::eb1:689:d0da:8fc0%4]) with mapi id 15.20.6086.024; Wed, 15 Feb 2023
 11:29:43 +0000
Message-ID: <61e10fd3-c58a-5990-dcfc-45ebfe56d74b@virtuozzo.com>
Date: Wed, 15 Feb 2023 12:29:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v10 01/12] parallels: Out of image offset in BAT leads to
 image inflation
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com
References: <20230203091854.2221397-1-alexander.ivanov@virtuozzo.com>
 <20230203091854.2221397-2-alexander.ivanov@virtuozzo.com>
 <7b45258d-e046-373e-6434-2ae5bd7c2aa5@yandex-team.ru>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <7b45258d-e046-373e-6434-2ae5bd7c2aa5@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1P195CA0011.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::21)
 To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6956:EE_|DU0PR08MB9654:EE_
X-MS-Office365-Filtering-Correlation-Id: d5ea8119-f42a-434e-c04e-08db0f47ef25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lUTq1xLkXQNE/FYOHzpDO37j5ZxHiIZcyerDobzUciQaQpaeAw7btqnococHeMpT21gVngiGh687FsRmlZfrLRAW13yHztrc+S5hvmmvDfz7CvGxeSFvgI4YyN+WCG7gE+NcG+RDKFhf1JOwlNnNof/7XqIQT8PDaGoCyjcWg1Fa0RKFS365rAOGAjSPxP8kS/Bd4AHbbjqMCqjKwARCwRSbfJrx43Ffc6y4j8nIJStczNm4YSisRS1UIKm4XuSpY1qY9ipGPXwZj0oWP0Whb6KoUPDoLSpAFhKXVukt6uIs1Cy2IevvdC8GgPm6tgSREMf6Ox4UOBpTVfqd6Vcy/1j6rwjuxMk2QfI2jSCSFvtqI6Jd6rgjJ4NoC7bvk/p+sZ8bFwaftYCH3RicDUWJd6j8g/2IGNyGayWNiPmAieDQQ3/I6NKzvACpu7iT5+nyOdKApXX1qKhKxheAdLKZItEM5nwuZreFfJck8vFtM3MPC45uIE7JrEuFP7iXnfzONmhc4a6bnu5o6qPkQby0M3jl1fTPBiLk8Syz7sJZb7fSgfpdNW1ARW9KSHJkKyMjBvXJO3ehentkp5os7BL+/lTwOQWBHK+kgM8cRbDp2+WegNQhKD9wSBOxoVJ8p/7aLfhUa7RR/0ASQNLGy36CQcMnV39vF9sfdXiUWUeaEH6+HU045FXOq9/Is7XETBQBCghqmyiN9CULyaGbNFcGnHpv3hTYtj1ItR80kjcyCss=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(136003)(366004)(346002)(376002)(39850400004)(451199018)(478600001)(6486002)(83380400001)(86362001)(31696002)(38100700002)(6666004)(36756003)(2616005)(26005)(186003)(6506007)(6512007)(53546011)(66946007)(66556008)(316002)(66476007)(5660300002)(8936002)(8676002)(110136005)(31686004)(41300700001)(2906002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjB2UDBEdDBWZ01RNzFzOHlySkdFYnpJcU1TWFdaUHlHcC9WNmRVNnVSK0tr?=
 =?utf-8?B?dFBhOVN2eWxJRW9IZ1lwRTJkNCs2V3NPQ2NyY3AwZDROUEV1ZU44dFFQT1NQ?=
 =?utf-8?B?YnBXNFpHdlIxNitiNnNGUEd4R0ltYXBncThvY1liT29SSnFEdTJ3ejdaR3BD?=
 =?utf-8?B?eWQ3T3VYMjhqRDN0RGNTU3o4M0Rjd3RKYlVzeXU3U0lOS3A4MldjTjFwVWJS?=
 =?utf-8?B?WUtWQ0JCUmNNcFoxRVJMQ28wVXdJeGVyMUlUZUQ5RG1GbGl1UE1OdTlIdkd6?=
 =?utf-8?B?bS9JTEcwRjVNMkxHRHFzb1p3RzEyUThuMXFDZUdUQTZLT3VDcllabFlVY1Y2?=
 =?utf-8?B?SDhIcWJINGIwYzRZNkFYbmVlWWZyQzMwelA3U3NFd0VBYUpKTm9Zd1F5VGg5?=
 =?utf-8?B?elgwMFkxdGxBT1o1L05qbTh2MlR0YzM3RmR0Q0M5ZWZlRnkrcWd5NkM1Y2Z6?=
 =?utf-8?B?WlRWektQdUxQNTkxQVpVdk5GY3l6STkxUVozM1pBd09ZdUFvakJkL2VSVjNP?=
 =?utf-8?B?c2dReWlzRXE1YWNtQ1YrVFBQWEM1dFR6NUU3d21wcGUxMGk3RGFOSzBza3dI?=
 =?utf-8?B?WWN2ZjFRWXBkNmh5eW5qK1A4Wm9lOUdYKzlOUzRoSFNWVzh5emxtUk43YmdO?=
 =?utf-8?B?Qks2aE1hM2JlTGE1M21uUHVESmY5eDVqOHIxbEt6YzlkRVllN2ozYytKZlI4?=
 =?utf-8?B?WkpreVlDdXVOMW1nNXFwc3ZaU2VLRTJKSmRVekt4dnIxZnlVNGs2Y2pEdUZ5?=
 =?utf-8?B?RjRINzhrb2Rnay82VHU5Ujh2MEVvdXQvVDJ2TFNhQkpvcEtIYjRVbGk3T1J2?=
 =?utf-8?B?bSttM3JOZmJFSnBhS1JScW9MekVvdmd2ZldmZk45SWxaeCsrZUFwcFBGMVM2?=
 =?utf-8?B?cGZDRzdQZWtFakpiNDBHWk9pY1EwaU5VcWFpYlVlakhRaFFsRDlZY2g4enc2?=
 =?utf-8?B?T2VERFREenhJdXNhU3ZMU1NmVFB0cVlRYmVKOGZGbG16WGZDekF2cnJDcmJG?=
 =?utf-8?B?S084dVZoOEl4ZUlWMjBQQTVBRzc4V3RZUnJjRkR5VGU2bTYrRkRxMmwyaXVw?=
 =?utf-8?B?ZFFRUTJ4UDNNQVB0QjNiTUJhN1pGQkFKdnMxK2dqZXZRdmZPRHBMS2QwTklJ?=
 =?utf-8?B?VHg2VjV5a2x5U1p3M1FYSUhVKzVKVzBIQTVhZSs0YTV0c3VybXVSZHpFN3Yv?=
 =?utf-8?B?TlZsb3FIdlY1RW1SMTZZci9nU0xERjU1bnhPNzI4WWpYZjlnRnFJcFV2YWFj?=
 =?utf-8?B?TDRnL1ovR21rbkwrSk1YdWhzUTA4RzRhV3F4VmVkeHR6eVNTN3BmUzYvU1dp?=
 =?utf-8?B?TlpaYWlIVi82MERwY3hFbmRxN3Rmd3lKQ0QvZjZHM2cwdDhIYm0xeE10UVRu?=
 =?utf-8?B?cERla2pTTjlVbURyUXRRZEpaQzlwaDE0M21pVVFCQTBXd2NyV2YvZFd6c1Ux?=
 =?utf-8?B?Tlp5d2N4MUR6SlZURnFqNVdOTy9ONnRsNm5OTjhpTGxGZUJId1dqZHlGeUF0?=
 =?utf-8?B?Q29jU0VnenJhWjJiRmp6OHNwUEYvbTlROVVZekxRUWZQTHRNQi96dG5CSVFx?=
 =?utf-8?B?ZnUwS0JwVzFGeTRlcTVUQUY4TTZ2R2lodFMzNldBc3RrZTV6c0NzYzZib0th?=
 =?utf-8?B?VmlmT0pZajYxUGdQUURxTE5qT0JBM3hEbHNPb1dWVGZLK24zVWhmTXRzL1E3?=
 =?utf-8?B?MFdRYzJIL3BLZHE0bGowT2JPRzhGN2Rwb21oVGE4Z3g1V09URzRpQkt5QlZE?=
 =?utf-8?B?UHl2aEpXZUtXMno4dnRvSGJsdFhLODBodDcwcU1OUGxRK1FoRkFidld4SFg3?=
 =?utf-8?B?dmxIN2JXbUZUMWJYZCs2Z084eHJtRlFsN0ZLSG1iRjQ2UjFzRjZoL0xRTlhX?=
 =?utf-8?B?Uld4TFM0ZVFlTjUxVGs4bVdQV0lyWndyMUprcDF5ay9rZG51ZzFIdXBtQ1Ay?=
 =?utf-8?B?eGdkRU1zc3FLbzV3RWdDKzJtNzNaZHJUMkhBTHRqNVRsS3lyaUJUMmRWMGh0?=
 =?utf-8?B?NThObWZCMllaZ2VQTFplV3c3cnpYaHBIVmdLVVNxZGZqVDdaaXJrbkZSQzNN?=
 =?utf-8?B?djdUSFJ5TmgxZzZjbWJ3OWhNRkJSUDB2bzIxYjU1QkVGMlJkNkcrWXVoY29G?=
 =?utf-8?Q?qrIIpOrsFUiSg5RzVQ9pswaAm?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5ea8119-f42a-434e-c04e-08db0f47ef25
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 11:29:43.4723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IcV0RemqUIQgvw/9F3NC9kU7Z0wnFoZUO8/7V2avnrM1LYDS/r/N4ynMepo/pw9cXnX+hm/BfIjcoJrvluNuTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9654
Received-SPF: pass client-ip=2a01:111:f400:fe0c::72e;
 envelope-from=den@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/14/23 18:44, Vladimir Sementsov-Ogievskiy wrote:
> On 03.02.23 12:18, Alexander Ivanov wrote:
>> data_end field in BDRVParallelsState is set to the biggest offset 
>> present
>> in BAT. If this offset is outside of the image, any further write will
>> create the cluster at this offset and/or the image will be truncated to
>> this offset on close. This is definitely not correct.
>>
>> Raise an error in parallels_open() if data_end points outside the image
>> and it is not a check (let the check to repaire the image). Set data_end
>> to the end of the cluster with the last correct offset.
>>
>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>> Reviewed-by: Denis V. Lunev <den@openvz.org>
>> ---
>>   block/parallels.c | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/block/parallels.c b/block/parallels.c
>> index bbea2f2221..4af68adc61 100644
>> --- a/block/parallels.c
>> +++ b/block/parallels.c
>> @@ -732,6 +732,7 @@ static int parallels_open(BlockDriverState *bs, 
>> QDict *options, int flags,
>>       BDRVParallelsState *s = bs->opaque;
>>       ParallelsHeader ph;
>>       int ret, size, i;
>> +    int64_t file_size;
>>       QemuOpts *opts = NULL;
>>       Error *local_err = NULL;
>>       char *buf;
>> @@ -741,6 +742,12 @@ static int parallels_open(BlockDriverState *bs, 
>> QDict *options, int flags,
>>           return ret;
>>       }
>>   +    file_size = bdrv_getlength(bs->file->bs);
>> +    if (file_size < 0) {
>> +        return -EINVAL;
>> +    }
>> +    file_size >>= BDRV_SECTOR_BITS;
>
> if file size somehow not aligned to BDRV_SECTOR_SIZE, that's not 
> correct, DIV_ROUND_UP would be better
>
I would say that if file length is not aligned to block size - this is a
point to mark such file as broken and call check immediately.


>> +
>>       ret = bdrv_pread(bs->file, 0, sizeof(ph), &ph, 0);
>>       if (ret < 0) {
>>           goto fail;
>> @@ -805,6 +812,16 @@ static int parallels_open(BlockDriverState *bs, 
>> QDict *options, int flags,
>>         for (i = 0; i < s->bat_size; i++) {
>>           int64_t off = bat2sect(s, i);
>> +        if (off >= file_size) {
>> +            if (flags & BDRV_O_CHECK) {
>> +                continue;
>> +            }
>> +            error_setg(errp, "parallels: Offset %" PRIi64 " in 
>> BAT[%d] entry "
>> +                       "is larger than file size (%" PRIi64 ")",
>> +                       off, i, file_size);
>
> offsets in sectors rather than in bytes may be a bit misleading
>

agree. Should be easy

>> +            ret = -EINVAL;
>> +            goto fail;
>> +        }
>>           if (off >= s->data_end) {
>>               s->data_end = off + s->tracks;
>>           }
>


