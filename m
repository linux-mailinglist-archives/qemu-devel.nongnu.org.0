Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F6659DA7F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 12:12:46 +0200 (CEST)
Received: from localhost ([::1]:52436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQQtp-0001Dm-Le
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 06:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oQQsW-00085a-OR; Tue, 23 Aug 2022 06:11:25 -0400
Received: from mail-eopbgr80138.outbound.protection.outlook.com
 ([40.107.8.138]:59616 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oQQsT-00049f-8y; Tue, 23 Aug 2022 06:11:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kGZSMnpvdiCYcd2lXOhe2ql/EX7WPPIw+JFH/Dxg0aNhMaOpsZ10l1CQ1K0Wl5yD2MiUNBV6bjHnbisSyju3csbCIoVmfV0jCChnjYdCBvMTrIQ1cfmOREoxSAXASIcDAso+4PTCkgEuR0wyhT0gyyZ2rRjXleMoYb9QGQ+jJOyyXqaoVx0D0opDkyt6zQfIE+/GCrnYwgiEZQNJJP1f8Z01AtKzrLzJhvuuaNBHN8KRHWm2GU7udbyGOp7WzHqYQCyEyrrGYVMCKqo9BbBFcVio3Npv5ZbyFVZrq5i+Tppd8RSjFSvd1smnWinWXWHPrbFvWmKg/zPBGe1i7vp6Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8FQWg+iDiRkjBervVToH5OVAVM4D3JumsrpwDfZ5DJE=;
 b=M5kYGGdZwWhLbXtIOHn69N/SsBFUX6Cb5syuYe5b9qIT+OH+0Kb88QtS6Hc/juqEyaHNU7W5qMV4BV0EplvsJg95qtopP9CLG6MNbdEFJmXbV9ZX2vwiGLiDHc3CNCHHLgW4PSnpWatgI5+0CNWG1DYcmTWAhYSYbpwcCPLN42qtORgV3QDmbKWn574LObAvMTNsqNO+2jFLiIwnofo58yGM2LarEMWoqdG8AKWBFDPzAUHo2W/J9vNWydmeKA94uKKBh+u4c9Vwr+DOGFsw+/jdOL35upFxmQos3bB+G+Z3dQITMTDr672ino4XqhsDEa/k8UarFD/xMiovgK6Tug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8FQWg+iDiRkjBervVToH5OVAVM4D3JumsrpwDfZ5DJE=;
 b=JlDbr+KQxH2DAySH8nhzAhLl3jcuUIA4Ea6+U/JQnV4yxSKGqYrIfYuvKadwJjVOad/b5CyUpLB6hSogYAYbq3g8kcxDMXfyYvnq9rM/HLYTKMst0rtd3/KL55gBuMBAqpMAvoswvqbmUOrbUfgJqKpnqRKFLWthvDQ6f35ZWZfWhFhOwlNNTf22hGKae2l61bDRkhzjUhQsAyySNbgSNONCO1K96J3qQOunmAz0fmISu1VZOLaSYhezEUEYZIGs6Wdo69iRLdXgq6XZ4JwTAWo4XMJxTDi4ZKcxDY8NYN4qyB2xVnbO7jEwEpUR3DPZqtKtm+fVY+NEJy21WtAZzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by VI1PR0801MB1693.eurprd08.prod.outlook.com (2603:10a6:800:4e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Tue, 23 Aug
 2022 10:11:15 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%3]) with mapi id 15.20.5566.014; Tue, 23 Aug 2022
 10:11:15 +0000
Message-ID: <5e5624ab-49f0-028f-6d73-d800d9dcd6a1@virtuozzo.com>
Date: Tue, 23 Aug 2022 12:11:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 1/9] parallels: Out of image offset in BAT leads to
 image inflation
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com
References: <20220822090517.2289697-1-alexander.ivanov@virtuozzo.com>
 <20220822090517.2289697-2-alexander.ivanov@virtuozzo.com>
 <8a010bb8-82e3-8b74-8ce6-414d3638c7ad@yandex-team.ru>
 <c7c88a75-4e21-99ab-db91-bac5adc27f98@virtuozzo.com>
 <234ffa52-e067-b80c-dbfe-427e18013655@virtuozzo.com>
 <8411cd50-6fba-27ab-ee9c-42b69a0c1a1a@yandex-team.ru>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <8411cd50-6fba-27ab-ee9c-42b69a0c1a1a@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0207.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::28) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68dde3d4-d6f3-45b7-d051-08da84efd02f
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1693:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zv0714YbEQe9oB1pEKhr30OvvYu32dENEX+S+pC6VO+ugQMRhNXLoJksJHvwYBo4JxqejF4d3uWnONLBV02bCEASLf4u0M2BxED3V7TbjSSGE8TjSYrHGpC09OrJcNB7AfOn56G70lNkMiQLQo6m4PgIT5RRA9q373NTqen3gv/570oyf02sGAaurxVYqkf2wLk8Z8VOSj2cneADOPGoxgLLTPWZj4cq1ov+SQ+WbC/xRJSbvlhv/6NAeHrM9DBKxFOEboCHZG4e3YWib1IruT/vPtnrQs5RB+gvLTlM2LWcyjGe4N9AvfjaH+UbNAH/68uZVwoEqQ8C098zfDcx5Li3mczR30dW/60qvEqIpHsmFpZqLTntzWiGfIXA0oVOLm/1ipiKN+lpvuXlYDowaMUUyn6IUIPl9Oub1uz802AjLv1oRbM/L1DNNsOsl7aYN7Ihjy0+vwxwYp2Cxu61R9b472jsY/uBObxjThkwqXT/TR0ZPwfCLx08L8vJskkVwf/N04cXL6UmxLnOaz1A9EYdkEZDvT0mJR/Pr6TFFqYKSIaX6oxBrioA5SCD1/l0OvymaDKle1ZOKF84XQ0SCknGwD4jcgiSEZjHBK9pzOH1A6NQtDPU0Ba8rjq92y5dlLe4ICE28LosfLCevCpEBcqSNBLtCEsHvvoVxzaEIxHb3h1g5ER685V1rVkhVEMYVyRKEnI7tw7d1sGg/ls3XNqQWDyqGpeCc+/HjqQLhjD8fsFeIkJG34wtOEURJFbu57waO3yOGqoTOf8UgK56PhaqbB4qx+mHSvS9h9QqCR0WEQSgc0u7uCorL0iNtZzTnhhJM40tSL8eAihwlaX7Zg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(366004)(136003)(346002)(376002)(396003)(31696002)(86362001)(2616005)(186003)(38350700002)(83380400001)(38100700002)(5660300002)(8936002)(31686004)(66476007)(8676002)(4326008)(66556008)(66946007)(36756003)(2906002)(41300700001)(478600001)(26005)(6512007)(53546011)(52116002)(110136005)(6506007)(6486002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjNQOGFGdUdmRXVZWTZDUy9uNDRiT2NLWmdWb2pvQjlXSDZCSFQvSkpmd0xE?=
 =?utf-8?B?Unp1ZUdLRHRJc1FvS2x1VEowR2s0OHBJTll1VEFtemlOeDh3SFhFUG1sc3h1?=
 =?utf-8?B?TVJ3aUgvcFkxL3lvQUxNd2hLTnlWVTd1dWpZLzdMTERiT2VMSGlJOE9hR3lm?=
 =?utf-8?B?b2dTY2VObmtpaWFEdHNqNjhzQkJoUStMTHlrUUZreEgyZ0FJek9xamNNeTdT?=
 =?utf-8?B?cHBsVFprQVlaV3VsWWx5SDd2Y0Q3US8zSkZNUm1MdE1qd0FZVEcyZUNwUk04?=
 =?utf-8?B?dUZ6NkdBTHlQRE5MVkJSZHFhV0Y0bmtONlZXdVhBVzZBOXRLazF6eFAzRXFp?=
 =?utf-8?B?am9CdEJaRTFLM09wcFpFdndFSTc3RHppYVZQS3dRNjkyRWlDQ1dZLzhpVW5s?=
 =?utf-8?B?TVVWMlBSaDB3bmV1QmVxVWxBRlU1VjhWQzlRK2l2QnFuU213ZDVUdURzSmJm?=
 =?utf-8?B?Q085ajRMMDJOSEQ5ZDVKMG1PMk9kNG5CQVlMWHU0MFcxRFpSdmszZjNkWitW?=
 =?utf-8?B?UjRYTXNKQ2h0QmlUdFpCb3FHYTRtczdKTDdVNVh4VEhRdkRRcVRZaFgxYnAx?=
 =?utf-8?B?VVYveGtRZnhVbEkyTzFacnRnK1FETGxxV1pJcnZibUhKaERnWTBkWk9iSlBG?=
 =?utf-8?B?cEh2aGJ2OFJEWS9FZ2JxbVBDdi9IcW9pQitKYUVweXlZVGNMeDF3dVlmTzdz?=
 =?utf-8?B?SG5wRXg1OW1PTXdQSTkrTlUrQVZTNVFSRW1QTnQ0c1BKdTMrbEM3TGx3TDlN?=
 =?utf-8?B?VDdFbjR6VVBJcEkxdmcwYjc5OGZrRFBRZ21IcFFadVlMVUR1TW9ZN2kwamZu?=
 =?utf-8?B?YTdrT1phRnFYaHQ4NnJzVkM5WFlEMGlzSUpEZXlwRkxVRGJMbklLM2JlZ0Zp?=
 =?utf-8?B?R29wK3cydlFEOGpML29wbkZDRzhTTnJ6TDRUOWZFVW9Ic3FQUFl3SStqeWo4?=
 =?utf-8?B?UUl4ZFZSWDNsY3hYS2J0MXRGNHZVbWxiY2xYMFhRRTBLYW8vZjZVNHVYcHAz?=
 =?utf-8?B?a3lCRzNtQjd4Tm9NVE9KNk14eklhVEN1aklwNWhBSjIwakdwOFJqZWxnYzNr?=
 =?utf-8?B?a3N5Ri9ERDNUaEJoRit6dFpQemZ2dUR5WU9seUJ4UEVGbHREdmo4ZUJ2dWtX?=
 =?utf-8?B?enB5WVBMZE5mK3BJdHlOdk9leFU2Y3ZyVktUQXhtUG84a2locGlZdmNtY1M5?=
 =?utf-8?B?bW1CSnJoTTYxMEFKT0pMZ24zOGZNWkhEVEtYWUlKaXRkd2xycDZ2STFacmRU?=
 =?utf-8?B?Q2V4R3AwRUw2RHVBaGlpV1VXRWZuNjZUSVpoUHIxakY1eURQQnFkeEtTRmhF?=
 =?utf-8?B?SSszRjlNaDVGRHhYOTUyaWVoOTRQY1UvZVdEbGV3QjNxWlRZS2VSMDU1alJG?=
 =?utf-8?B?SVpGbGxlM1J1QWRJMmtndHh1Wm9GUGV0Q3dhMzBQd0FmQURYWUhPcWhwaytO?=
 =?utf-8?B?NVpuV0pIM0ptUjJiaTcxVUxXMzJUZnF3bytIdmRZMVdmNFBxSVlyTGZybDNI?=
 =?utf-8?B?SGQ3bHduU0VOWXFkd3NrbVNPS1JvTVdwRU1qcTZPVjQrOFlEREtEUnB6UGZa?=
 =?utf-8?B?M0lXZ1dsZWZXZTZFK0RhVlQvTTRvRFo5USsrbVdnRW43azRSWUJWVjFtNisv?=
 =?utf-8?B?QkNWRHFXQzNBNG1xWXJ6RUtoV0paM1VmQldJUWRCQ05FTTkzV2VzTS9YdVhL?=
 =?utf-8?B?dGgvSlBSTzlmL09NUXorTlgrUlFEeGJHRHlDT0FUMC8rdUdrVVp1K1RaSmJW?=
 =?utf-8?B?cEk2R1pKZ0NYODV2SkNXb09LUWlKRFhJbk0yQ1NRcjlOUEp5QTAxbENNRWdt?=
 =?utf-8?B?YURLdmQxbWlDWTdUaTMvcEdRazJ0OTFGeWRrSHl3R0ZNa2ZmYUQrbXlya2xr?=
 =?utf-8?B?UmVWVTVEaWlSSmpzOTM4Z3VhVzFveUpOSDhERmFxa29PbFVBSnY1eEJYSHNZ?=
 =?utf-8?B?SnNONmhCT0EvRStvMVM1MmFNNWg3LzhnTlkvWkdzQjcybmxaSDg4R0RTMWc2?=
 =?utf-8?B?WFBNcTVwb1cwdytGdGtqdS9jR3ZKUVcyWnF5WU5GM1RWczFpNzhHOFM2ek5S?=
 =?utf-8?B?djA2cm1uQjBzTW5iTUdBb041eG8zZ0V0cm9QQkg2NlZiZVNqMzdmRksrRkQv?=
 =?utf-8?Q?w5Iqq1GFuedjiTuvr9EBo8qql?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68dde3d4-d6f3-45b7-d051-08da84efd02f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 10:11:15.2284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x7Y+rCqBp62ODl3Am/cgFim6Kcrk1yWCkvoSpv5C7aJPKA3SBw8lHn4JIrndQTv+qlAMmq3mxXdl2suWUP0gfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1693
Received-SPF: pass client-ip=40.107.8.138; envelope-from=den@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.08.2022 11:58, Vladimir Sementsov-Ogievskiy wrote:
> On 8/23/22 12:20, Denis V. Lunev wrote:
>> On 23.08.2022 09:23, Alexander Ivanov wrote:
>>>
>>> On 23.08.2022 08:58, Vladimir Sementsov-Ogievskiy wrote:
>>>> On 8/22/22 12:05, Alexander Ivanov wrote:
>>>>> data_end field in BDRVParallelsState is set to the biggest offset 
>>>>> present
>>>>> in BAT. If this offset is outside of the image, any further write 
>>>>> will create
>>>>> the cluster at this offset and/or the image will be truncated to this
>>>>> offset on close. This is definitely not correct.
>>>>> Raise an error in parallels_open() if data_end points outside the 
>>>>> image and
>>>>> it is not a check (let the check to repaire the image).
>>>>>
>>>>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>>>>> ---
>>>>>   block/parallels.c | 14 ++++++++++++++
>>>>>   1 file changed, 14 insertions(+)
>>>>>
>>>>> diff --git a/block/parallels.c b/block/parallels.c
>>>>> index a229c06f25..c245ca35cd 100644
>>>>> --- a/block/parallels.c
>>>>> +++ b/block/parallels.c
>>>>> @@ -732,6 +732,7 @@ static int parallels_open(BlockDriverState 
>>>>> *bs, QDict *options, int flags,
>>>>>       BDRVParallelsState *s = bs->opaque;
>>>>>       ParallelsHeader ph;
>>>>>       int ret, size, i;
>>>>> +    int64_t file_size;
>>>>>       QemuOpts *opts = NULL;
>>>>>       Error *local_err = NULL;
>>>>>       char *buf;
>>>>> @@ -811,6 +812,19 @@ static int parallels_open(BlockDriverState 
>>>>> *bs, QDict *options, int flags,
>>>>>           }
>>>>>       }
>>>>>   +    file_size = bdrv_getlength(bs->file->bs);
>>>>> +    if (file_size < 0) {
>>>>> +        ret = file_size;
>>>>> +        goto fail;
>>>>> +    }
>>>>> +
>>>>> +    file_size >>= BDRV_SECTOR_BITS;
>>>>> +    if (s->data_end > file_size && !(flags & BDRV_O_CHECK)) {
>>>>> +        error_setg(errp, "parallels: Offset in BAT is out of 
>>>>> image");
>>>>> +        ret = -EINVAL;
>>>>> +        goto fail;
>>>>> +    }
>>>>
>>>> If image is unaligned to sector size, and image size is less than 
>>>> s->data_end, but the difference itself is less than sector, the 
>>>> error message would be misleading.
>>>>
>>>> Should we consider "file_size = DIV_ROUND_UP(file_size, 
>>>> BDRV_SECTOR_SIZE)" instead of "file_size >>= BDRV_SECTOR_BITS"?
>>>>
>>>> It's hardly possible to get such image on valid scenarios with Qemu 
>>>> (keeping in mind bdrv_truncate() call in parallels_close()). But it 
>>>> still may be possible to have such images produced by another 
>>>> software or by some failure path.
>>>>
>>> I think you are right, it would be better to align image size up to 
>>> sector size.
>>
>> I would say that we need to align not on sector size but on cluster 
>> size.
>> That would worth additional check.
>
> And not simply align, as data_offset is not necessarily aligned to 
> cluster size.
>
> Finally, what should we check?
>
> I suggest
>
>
> diff --git a/block/parallels.c b/block/parallels.c
> index 6d4ed77f16..b882ea1200 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -725,6 +725,7 @@ static int parallels_open(BlockDriverState *bs, 
> QDict *options, int flags,
>      BDRVParallelsState *s = bs->opaque;
>      ParallelsHeader ph;
>      int ret, size, i;
> +    int64_t file_size;
>      QemuOpts *opts = NULL;
>      Error *local_err = NULL;
>      char *buf;
> @@ -735,6 +736,11 @@ static int parallels_open(BlockDriverState *bs, 
> QDict *options, int flags,
>          return -EINVAL;
>      }
>
> +    file_size = bdrv_getlength(bs->file->bs);
> +    if (file_size < 0) {
> +        return file_size;
> +    }
> +
>      ret = bdrv_pread(bs->file, 0, &ph, sizeof(ph));
>      if (ret < 0) {
>          goto fail;
> @@ -798,6 +804,13 @@ static int parallels_open(BlockDriverState *bs, 
> QDict *options, int flags,
>
>      for (i = 0; i < s->bat_size; i++) {
>          int64_t off = bat2sect(s, i);
> +        if (off >= file_size) {
Like this, especially >= check which we have had missed.
Though this would break the repair. We need additional

if (flags & BDRV_O_CHECK) {
     continue;
}

No incorrect data_end assignment, which would be
very welcome.

Den

> + error_setg(errp, "parallels: Offset %" PRIi64 " in BAT[%d] entry "
> +                       "is larger than file size (%" PRIi64 ")",
> +                       off, i, file_size);
> +            ret = -EINVAL;
> +            goto fail;
> +        }
>          if (off >= s->data_end) {
>              s->data_end = off + s->tracks;
>          }
>
>
>
> - better error message, and we check exactly what's written in the 
> spec (docs/interop/parallels.c):
>
>
>   Cluster offsets specified by BAT entries must meet the following 
> requirements:
>       [...]
>       - the value must be lower than the desired file size,
>
>
>


