Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 852CE6F05CD
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 14:30:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps0kw-0006F9-ER; Thu, 27 Apr 2023 08:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1ps0ks-0006AD-FL; Thu, 27 Apr 2023 08:29:46 -0400
Received: from mail-he1eur04on0718.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::718]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1ps0ko-0007Kt-DS; Thu, 27 Apr 2023 08:29:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmzqeLivoRZ8YMQtfGRvZ6sv8swVFSfmUNNuFvTZsKxEvcgQxTjIIDM2/MpUoiX3wAia9yDLKep+leEONRs4qtQaKiplUA0UJ7QhDf9G+8VQaFfltIvDn0d1vU+/d4x45gn5WSbJRW2PMtfeMM6Iee9Y4EUeGgC4ylgocdQCw4aViugjsXXoEP//c0DfNnHkM4SyqC94cB3tiBeo8BKNrTliC6Fjyg03wIIeX/V2ONovL4tuN5hlQDmmaryLjetPL0LaeUJ71zJgU1SHnoxxMjuRlXd+aJq1IT/EkPz6Ki8f2n6YePypigxKeLn5ZL/nAcDGZ+kxjhifY2x4Q7GtmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+NUbytK9en9uh8lSpa5knKslNP+Fou9AioiY8CrkO18=;
 b=hq//wh0CaMmQ+mtiydILLl+sV2575q9rTedrEzYd09mDW0Qiu7g8zaPMv2BD0OSxN8hHF4atAggW/A7ePZQjWnwNnWo4ulavkUaAuDlys5scsKcseLLALJ3LnvUtvjyrz8AYIyV2t3fTG3el00InbKS2+E9Cmvv14L3nObydrM+uf1UlKixvzZbHKZUcdIV7ZFkAFMxmTubjS55/qvdGEcdV/cmj5Ck5lP5h3lapEcvOgXwVBSmPCaP8pCI/yG7xiS8fm44Zgl0Fp9o/c1Y5x29/Z26cmUIq1nZ/xatBYRnNDzO6EZvqoC4bLXCX39aXwKGtXA3uxk85jvwhK3riEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+NUbytK9en9uh8lSpa5knKslNP+Fou9AioiY8CrkO18=;
 b=m2Rjx7mLyT+eQ1e+CDPDpDWHtjZvcc4lL4drngYJOFoNlPyNv5V5uTEeiqPf3XYOA9JdcQFXyTX3OSU9HrgHxCkSJ8BYLOQli24UfcmE0iRTkcmeLcMGpDve0dA3kg3Fd2b3vHWBVlFMkHR2rguz3Hov9ogDiE9RUMGb52WzlUXmQ5cjeLL24dhYoO/FeO3oxskC9ShtBDGV4FRy6HBWrytjULsd3UCPMEtOy1fH1jNTowOLLHrANxFogX0fwY1BmLswkCfGON6xfHRPj33Ygp4AB/EV3X/AWsknosPvMvy471HdyN6BVVCTLhgOv+Wbw2Qm35//lwYrv0Ele3WaVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PA4PR08MB5983.eurprd08.prod.outlook.com (2603:10a6:102:e7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Thu, 27 Apr
 2023 12:29:37 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%7]) with mapi id 15.20.6340.022; Thu, 27 Apr 2023
 12:29:37 +0000
Message-ID: <792ee284-473e-b659-2a33-3c15f8bae2b8@virtuozzo.com>
Date: Thu, 27 Apr 2023 14:29:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 3/5] parallels: Add checking and repairing duplicate
 offsets in BAT
Content-Language: en-US
To: Mike Maslenkin <mike.maslenkin@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, den@virtuozzo.com,
 stefanha@redhat.com, vsementsov@yandex-team.ru, kwolf@redhat.com,
 hreitz@redhat.com
References: <20230424094309.197969-1-alexander.ivanov@virtuozzo.com>
 <20230424094309.197969-4-alexander.ivanov@virtuozzo.com>
 <CAL77WPDgx5gsnDZAbir+ae5f6N419WxHQVHZhUr=M4E63AZk0w@mail.gmail.com>
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
In-Reply-To: <CAL77WPDgx5gsnDZAbir+ae5f6N419WxHQVHZhUr=M4E63AZk0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P190CA0013.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::26) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|PA4PR08MB5983:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c509dce-6c4f-4bef-67ae-08db471b1074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PbR6oL7r5IV0Rzp+P0biKLbN4Rsa9rKk2+XQKW8dO4dmKB8Tky2T4BGuN1aqdLHHXHNvFYdfyPEFN+vT9bKASrIJL0QLunCIzSfRswhQM+teekGn6AoW34O9kC8wnZbLa804REMdLT3ldfASUw4RAVNx78TAJEf7BUyiDBLaKZsTzByuByctGhB2RlJHURcyYfizBEP84F7JPMd1bWFOzHSsSiF4rjLhsfxvNjQAoVmrXytL9lTcRTNs+C+WGWnVTIueRoivZtik1YLrmDAEbHYXFb4VG0Ad0LvfrADHEr4Phur9EgyMpF0PhkER7RNUSf4tCu6H/f5kuPB/e6pmLQoZOaEd9XAOmql+/M0VczyuVBxWuczuc9cbYNHIKE1up5EJ3YVReshLuI0qbJXt1S+WNamDL2jEFAQIfbcv5NTixdU/yEIYfdUecJRurSUKSyAr9/8ktl+zEyZ81GVpvsmKR6GhLBJkEQ9bil5lgOdinDCg+EhTofGUd4AfRcalllxmfKdRUFsHF8XB8h4RY26VrLUU9QbJwgJGhMucxG4wDTef8dEfXWrbuiStfter9gykLBrFvnTClvU3P9KimMc+FhaUCzEVN3sTqo7/dkoQ3WoHAd1QrtALR9jqyW7x0MUuahm6srMbWn+ZKBTdvh4gQlLtpDk7EicjsnEj/Zll4KkD/Yy1IUz2YctXUerM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39850400004)(136003)(346002)(366004)(376002)(451199021)(31696002)(36756003)(86362001)(2906002)(31686004)(6666004)(6486002)(52116002)(2616005)(83380400001)(186003)(53546011)(6512007)(6506007)(26005)(4326008)(6916009)(66476007)(66946007)(66556008)(478600001)(316002)(5660300002)(41300700001)(38350700002)(38100700002)(8676002)(44832011)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QU9DTGdpOEhNUDFrUHBSSk8wUTdvYzJVTkNGTTlTblZudHVGZ01WWjNjMGRz?=
 =?utf-8?B?V1phUUMwTGwxcFl5bGxsMXRucmFLM1ZFUWMxd3dmb2ZCVkJITVE0WnBoMzBY?=
 =?utf-8?B?MWI2U2JySTdBL2hUNEUvVCt5VTVQaXlIK00rWndyN2J4KzBwVDR6TTloNFJP?=
 =?utf-8?B?WHEva0xkSHdYZTRoV01ndUdqRjhFQlZ1WXYzdDNvUUVCY01PNVIrSXI2YVVE?=
 =?utf-8?B?dVhlMU9pdWc1eXpkaUFMK1V3bWJ5cXJmUDRwb0lUTTREdU54a3d6eDFBd1lK?=
 =?utf-8?B?MU1MMEJVTmZBZWFTN1hHajNuVmpzQUxHd21jcVAxbVByYXM4NDljZFR3Mm12?=
 =?utf-8?B?bEpmeFN4aVpsYU5nU0lhR0NjUzB5Y1F0blM4VFc4RXdyd0NLYnVjbE5ySTRU?=
 =?utf-8?B?eloyZjRMcVBkMW4yUXBaZ0tyZTdTQSs1ZlJJRGhKdktqS1JFR2xMeEZBV0pz?=
 =?utf-8?B?T1djOHNMRVlIenFCakRUTGhhaXQ1azFSaC83RFkzT1pISDZCZUswWStJTzFz?=
 =?utf-8?B?UjN4amFzb0g3bHdrVGdreHQzYkE5WXdmSkQ2UWgzdjZUNVJ2emtyOFJHWTRY?=
 =?utf-8?B?YWFoR0EzQ0xJQW81aENvL2o2V0lOTENhY3hNM2JYUDFDdThKZitKcWcxRzVK?=
 =?utf-8?B?SUo4Tkd0d21KR3dJY0FnZ1BVU1NBczVRV3VROS85YkhiaWp5MjhRZWRuZGxP?=
 =?utf-8?B?SmFqM3dlY3E0OURTL3Y3dlJnMUp6QnJBM0pYOWpMMXg4dEFsbERGcnEzWDRw?=
 =?utf-8?B?NTRZSVlNb3R5eXAxV1U4V1pLZmVlTzlZM2xtVjJ2bjNvLzU4cTNBOTh2aUha?=
 =?utf-8?B?UnpxNndoRml3WTc2cVdVdUJqbTZ0S0lUWUhObzREQXNQSmZ6a0h3QlNRWUZX?=
 =?utf-8?B?ZFo0SjNuZVNCbnRGS2wzQW94RXQwVHd6SzVuNG1iVHd2V2lUTXArVnQ3UGd1?=
 =?utf-8?B?V0g5eStXWVZZUmtZMFhUQ01uZ3lRekFDRkdQWWFvdkdXQXBVbUpicktTdkcw?=
 =?utf-8?B?NGpHVE9xOFFjS1VjM05mYisrTlYrazljc0ZrUnFFUStCMnVRRDNzT0t6YkFs?=
 =?utf-8?B?MGtxM2RENlRDZWRaYXEvaE1XcUgreUJWMGs3L2hId2ZkR0VacDFXQjB6SFJH?=
 =?utf-8?B?d256UUk3dEVIaUxyTmV3aFJkWGZSSm5vWFgxS25wd2htcjhlUUNLd0RsZVlR?=
 =?utf-8?B?clpqSmNyTjlwUDk0b3FOYXV6c05ackdLQ1VnKy9oSFpyT0VpMXduZHVmODJx?=
 =?utf-8?B?NkxDMFgwN0MxSUhMV1BoMkNwQmdjbzRITzFjdWUvUnR2OHlLREROZkU5WXg2?=
 =?utf-8?B?RzNmU2ozTHViS3Y4OVdseXg5Ynh3NU1HMThFNU1xTFp1UWR6TDFuWXNvM2No?=
 =?utf-8?B?YWt0LzB2VzFZSloyM1ZNTkNlOW90dnhhMXlBejhmUU10RFpVdks3SHF4RVZY?=
 =?utf-8?B?YU9ETEtVaUhNZitmOFUvdmpNMTNiRXF0cC9rR29XWmNwNnRCa1JsOG13ZmdV?=
 =?utf-8?B?TUVyNzVpSm84eVhjKzBuajRTTW5HSGdZOGRaVitBS0JWTnAxV0hOVVdDVXNp?=
 =?utf-8?B?aGVrVC81UEo4Sy9EZEkvbG8wUkkyVTJwS09LTm9qelhITlBoZ08wQS9iK3Rv?=
 =?utf-8?B?eUZablQvU2o4Y2hJejlYZy9rOXhpTTFaV2lNekZOZURvTHdwZWRSRkJhMy85?=
 =?utf-8?B?Tm9Oa3pvbFk5MEJsZ3daYXdDZE44ZXZ4S3JaSUpoMVIvZUlsb29CQW5Fb0hM?=
 =?utf-8?B?OFRGMnM0YlZaY3Myei9jMTRKRFFOclhjSml0MWNCZ3YyWE81NXA0N2RvU0pX?=
 =?utf-8?B?SmJtS3BUZlcxVWVXdTV3Q1RaamVTSHYwcFJCLytncnNlWVVhWjZuZ3lWQWt6?=
 =?utf-8?B?QXFQUnpOWFVWQVIvbHVKZGZIazBWU1ZoR1lJNEI1SCtqTXlTTGk2bjQ0cHhI?=
 =?utf-8?B?TXZMUm9VdWhqNFcyS3hWS1JVU3FieExxQ3IzbWdycHRuYzVjenIzanhkY0U2?=
 =?utf-8?B?SkJlaTNXayt5S2RZdEJ1bVNQQm9BSU9RMjFuUEFkalNBSHFLUjVpczc5RzBq?=
 =?utf-8?B?bmtPOUFBcTB0TnExSG1GOHNmK2ZmbTNRbTM1eGJkWVc1dnBZTWxqQy8rZE5Y?=
 =?utf-8?B?NXl0UTluL0FLNXNWV1h4WVFUVGRxdC9Vdm5GaU1IOVh0KzF5aTRrWlpnOThs?=
 =?utf-8?Q?JPQqnr7KlWICpR9QLkkZdaE=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c509dce-6c4f-4bef-67ae-08db471b1074
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 12:29:37.0577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uAlOgjc+ljaVO9VDT9arhHhQPvUF+nJFFysBzU70SSrrJADesptx6IuwVyYC15y66WBlwpUJBAkAqzuaBu6ObZ4t3RH/0Qk+LpPXETBRP+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5983
Received-SPF: pass client-ip=2a01:111:f400:fe0d::718;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Good point. Thank you.

Best regards,
Alexander Ivanov

On 4/26/23 23:56, Mike Maslenkin wrote:
> On Mon, Apr 24, 2023 at 12:44 PM Alexander Ivanov
> <alexander.ivanov@virtuozzo.com> wrote:
>> Cluster offsets must be unique among all the BAT entries. Find duplicate
>> offsets in the BAT and fix it by copying the content of the relevant
>> cluster to a newly allocated cluster and set the new cluster offset to the
>> duplicated entry.
>>
>> Add host_cluster_index() helper to deduplicate the code.
>>
>> Move parallels_fix_leak() call to parallels_co_check() to fix both types
>> of leak: real corruption and a leak produced by allocate_clusters()
>> during deduplication.
>>
>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>> ---
>>   block/parallels.c | 134 ++++++++++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 129 insertions(+), 5 deletions(-)
>>
>> diff --git a/block/parallels.c b/block/parallels.c
>> index ec89ed894b..3b992e8173 100644
>> --- a/block/parallels.c
>> +++ b/block/parallels.c
>> @@ -136,6 +136,12 @@ static int cluster_remainder(BDRVParallelsState *s, int64_t sector_num,
>>       return MIN(nb_sectors, ret);
>>   }
>>
>> +static uint32_t host_cluster_index(BDRVParallelsState *s, int64_t off)
>> +{
>> +    off -= s->header->data_off << BDRV_SECTOR_BITS;
>> +    return off / s->cluster_size;
>> +}
>> +
> I guess  there should be:
> off -= le32_to_cpu(s->header->data_off) << BDRV_SECTOR_BITS
>
> Regards,
> Mike.


