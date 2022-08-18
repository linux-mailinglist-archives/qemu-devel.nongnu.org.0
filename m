Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1F05980CE
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 11:30:01 +0200 (CEST)
Received: from localhost ([::1]:48122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oObqi-0002by-F9
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 05:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oObYS-0007Cm-9R; Thu, 18 Aug 2022 05:11:10 -0400
Received: from mail-eopbgr00112.outbound.protection.outlook.com
 ([40.107.0.112]:46919 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oObXu-0005nA-M6; Thu, 18 Aug 2022 05:10:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iR0GpBi55kJpv+cEd979LQg9ymHiIUMk16PkB4DQwaGKwxXEkNmAmeX1eAVXP9dcw6jBEUfeW+fhpeLD6AB6Zk17KMivHkkqddmi8XQhwTqA4ejIAKseM6UAcM4CLUSJ+hMdcBr3xUlEzzuJso7jUeC2t+eHRATOJ3ebzcXKJrySFkm6a0Fb0U2cThhDO6eZpOdYTH3gSuEkM8c1TMAUx/bOKEk0BDwm8g+r7g/l9QHX/lhSNIUVC4GWNyy691lFYp/Wvr1dS2Ff/fRpDtbnGs5ZR0rDX5uTCOrtMOIsi4QFFlaBBHr1TGV/ASK3SQAm0z6tS1VUbTtgwgGflB5Grw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lO1W+J51exir5Rowc5E951WCBv861046PdHcXZ6OEZE=;
 b=fWRKxGvjNgmyx2n3hUrAZIoKG7Mzgu2qkgI4Jk9SbbgZQ0EVqusCsexpq72i9s/Dmyy03hntMdm0yAMp1c6rJoEQcq48vcMYm0bjvGcllc/974cKgcLNPGy6ZO7lgRU7/osnfIiOaU82nuX90cOyozEhY2dQlpEI5YZtQb5nV1XC8ZWf+gmH6MM8obM02qapuQzk1PQ0WMTZxKs3cerXgQxpKf/ROM3yFTXdiTpnnMwRuFas2guquiHMosxyB/LKE6qLNRCXtzXzRCf1WB9bjORtLgwAUcSiGaHm79wa0yPTIex7RGEamsOl9A2I2xeoWP6CjlFjThJBOFa2oIG8TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lO1W+J51exir5Rowc5E951WCBv861046PdHcXZ6OEZE=;
 b=duCSaSsis27PHSr2AV/O/GWdVgLUDs4l6igLc7L3r1YoNvnZ4NopuKpmcJbqWxq1pIB5KZmGKyHoO+9xvIf21fZ0KlYRTL5YvU7BxJOmaMpMiq9ddPdmlpJ/yx0OtFCMBcw9YUYZpq1k1O4LZmifalnB8nQwfjn+NjqW6qt24aySd9CfxxLcURv+03ivyEHkJ0HMJDO33mipMst3BX72bVBBGrP1eeYMn5vH/skPgDI71g+IzcAbmh1ZlrXeEaC3U3ZQN2TC+0QnP+CdC5r65ui5RSvGcWkir04Um3iuDqCWYc9ZCaJwokePtHqtVOdwVbPig6vT0pRuzQ/wCQk0Mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM6PR08MB3302.eurprd08.prod.outlook.com (2603:10a6:209:41::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Thu, 18 Aug
 2022 09:10:27 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%7]) with mapi id 15.20.5546.016; Thu, 18 Aug 2022
 09:10:27 +0000
Message-ID: <30ae4be7-44ed-d52d-6197-48cce443bd47@virtuozzo.com>
Date: Thu, 18 Aug 2022 11:10:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 6/8] parallels: Move check of leaks to a separate
 function
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220815090216.1818622-1-alexander.ivanov@virtuozzo.com>
 <20220815090216.1818622-7-alexander.ivanov@virtuozzo.com>
 <791ddbb5-cb6a-aaf6-d1d0-44d62a1aa263@yandex-team.ru>
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
In-Reply-To: <791ddbb5-cb6a-aaf6-d1d0-44d62a1aa263@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::8) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db5384c7-1dcb-461e-e904-08da80f97dc4
X-MS-TrafficTypeDiagnostic: AM6PR08MB3302:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2+3X9+25xiyV1aupZSbow0MLc6qB5qN2PZBujc/HBjic3dLXLEheuDKdPB068GlOSZm60OjJHYqPxe/pWLeWOtCq0zkMKch7R1YSOS3jy4crwDt0ek1avmPDk5ffkry3k5thwlhUve8teJY+h5cmRd2wzFk3ZtGkUI+QO0F0ED3kTUF5eC7W2oI35nX5R7sTvexb4FD520yLLGd3P7yCCVlTVHMwLquLRdbyrolpOuPujwooh0+oUZtlhwWtvIdcezV0T+0HsaomvY3FB6BGpI+EuJVBBEJr9aVLE2WtMLgLoC2AyEhYARabiTZVv/VcerDliSmv+gmOSNkTrBsARB6ny0wpQEElrtEBzVnV0YSYKGWelHJf4NMHkJOye6Ai8/s+iiXwXjdeJU/oiTKsmbLOw9DLd6Sa12YOm6LWE6PqSRUTdNyQVNa7F27ZPmeI1L1W2BZ+khPiOXj1BxHO7KNZbZP7YffdXiIBC9ksPtVrN/103XcJ0CbqdYdZDV/3Uce5OqLndOen/cb/JG6eBj1tt3RJW8Igbaa0AyIgpjg62V9cpDaZI2wLSst+GozjVKUUWxEg5BGj5In7w6LEiCTMGiZUyS+clt9U/8M4Iq4YuYaDPjQswywX8vB8UPOpKZ6OY04KqwenRd32jpUb58yOk4mN3nLdFaXUyM2KGRucgXURCbnNzwDrnHbf1/SW5FVVmUYCXedSJikZravLrwlNYN8G1ybwm6l1fNVEq6amy/gm+9/R2odn22cqZ76+xP305+UYSYde+MSIzwJVKgllaB4WV22kSQQ/lpo1e7TbW8M9Qm3SXBAHozVY55dpSCC+rZsg8Z3iq+SsW6n8iQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(366004)(376002)(39850400004)(136003)(6486002)(83380400001)(8676002)(478600001)(66556008)(86362001)(316002)(66476007)(4326008)(36756003)(44832011)(5660300002)(2906002)(31696002)(66946007)(8936002)(38100700002)(38350700002)(2616005)(6506007)(52116002)(186003)(41300700001)(53546011)(6512007)(26005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yk0zTmJyRjBvM0QzYnhJQkZ5NjNKRDhla1R6ZjlVY3pJUDVyOHVnNytGa0Mv?=
 =?utf-8?B?Q3Z5T29abmo4eHV3cE43YnVid29ydkV0bWNtdjl4Uks0TG0wc3pQSnRlakMr?=
 =?utf-8?B?aENkaXNIS2RJZnVOVldWSXVCMTh6MllpLzlEd25oc1BodWhlQmVqYWd3Z05J?=
 =?utf-8?B?Um5yRm5JWnBSOTBBYzZPREtwUEJUTkpaYldBNGFYYmdZOGVmSVdpckd1N1M4?=
 =?utf-8?B?ZWRONzA5OW8rc0lkeVRKUXg4eEd1UkJjWmRrN2luTXlIOWpGaTE0UldnM25X?=
 =?utf-8?B?c1oxLzVHNDBEaDNsL2ExVW5uM1BDTWRHZW91amZlVEFndElDeEFibVJPL1Zt?=
 =?utf-8?B?M05xaFlzcVF6ZWxiNFdPbFl2R0VtY1dSQW5ZMFhBUVNvZEJaeFdMUWFsdndo?=
 =?utf-8?B?cnhGY3RGcHhTZXZyZGdISHpyeDdCdEVnNm5ZNHY2NlpKRURaN2xnYjJUOVBP?=
 =?utf-8?B?UnIwaHd4cXV3MkdvYWlqNjRLSE56R2FvaEdodDh5dFRLL3RsL3V0eVlISUxy?=
 =?utf-8?B?dnV5bGJvSFdwczR4emN4Y1A3VVZ0czNKVzhOSGlxSG82WGwrNmx4cjJxM08r?=
 =?utf-8?B?bEk0Wkc2NmNIbk01cHpYRzIrdnhyNHhFWHk2dzBIRWJ0Q1ZtMEllL3IyTjl5?=
 =?utf-8?B?ZUs3a1E5ZVlEMDQyT1VhLy9rM2g3aVJDMVpOUFc2VWZZbzMvc2MvSmdQNmty?=
 =?utf-8?B?T2F6Nk5UZjhLa0RHMnFOSk1BeVU0YVQwK2JEVmRSSThCM2wyYVpNNjJSYlJR?=
 =?utf-8?B?WEVCS2RBcHRJb3U4Q0ZJWksvbDNnaC96cDZMRVhaZXYrei8vNzA4YW5sbCtr?=
 =?utf-8?B?akxlWG42b3U5UkFydDFaaTlqakkrWDR6ZVJxSXRxVzZUS1hDZEFTckZWZktT?=
 =?utf-8?B?RCtWR1p1ZjR5a0l0MFlTSkNqWGZtdDU2WWRxbzlaZ2UwQkpXOUZvTXpNYjFm?=
 =?utf-8?B?SDVpdHpEUHBjeVZWbE5lL1lzbjBINUhwZE9OVXEwN2RQTWp5K3RaeUF1VDJt?=
 =?utf-8?B?ZEFNYVB1aWY0b0ZUMkZkdUtzck5lTzlIUGxERUJsbEk1a0twWVhoYWE3Tjdq?=
 =?utf-8?B?dTZwOWhqZVNEN2t6TU1YM2k0UG1zejVMbmdyY0dhcjFpUWF2YlVwUXErZVNn?=
 =?utf-8?B?OEZkR28vVWhISUJJZ1VHODE3bXdmcHNVWVlNK3B2WWlsV1ZpcGcwRVNSR3FJ?=
 =?utf-8?B?dWVQbk5GMTZlanpPRXRlU3BoaUM1NWNQUHN3SHJlcjFPcE0zRHJnTzBlT240?=
 =?utf-8?B?WENqUWJDbXhtb3lRZ2JZZHRRZGNFSFN5UytQR3FwKzdsNnFrMWMxTTdDUlRk?=
 =?utf-8?B?SFdXQ0JuaFBrVVJPazdMS1lWck5WczJFbGMrc0lRSzhMdzNIeWxOMTBLMnBO?=
 =?utf-8?B?bktSeGhVdWpFZmZ4VXFRaFZiUEJWZXpzNlNuTVU5aFdrU21sQUVhNVFhOGkx?=
 =?utf-8?B?R0FSUzBtNlBzQzgwVnVJcW1Vb2x2OUNEclRwMjVBTmR0aE9rNVQ1aWwxclAy?=
 =?utf-8?B?WDlndUVjVDNpYWc4S0YvWFFxcTNNSUNSVSthMFpKb2c5OW5uOXRMbmUxRVB2?=
 =?utf-8?B?SmZJMTJOcU13RVc1SThuVTk5blNVZmIySWdPeVdpbkhJT2NuamZWMGFDdkRu?=
 =?utf-8?B?RUxjcXZ1SXpJaFJTUXloVDczenNyYlZubEpsekxTZHp2Q3l0V2VFelNSVHFL?=
 =?utf-8?B?ODdUNXk2QWNSd0k2aFVqVmpZQmVqMDc0MXU2TVpYc2xDWW1CYkZoSnhJMDIr?=
 =?utf-8?B?eU1OMXFWNEZEMEd2c3ZFS1pnWnIrU1R0aTcyVFB0SFRnVjk2cjMzOHBoaWIz?=
 =?utf-8?B?a05CVjVaZTZiZCtIWVZwQ1Y1K1BPbzdwR3ozYW0rT093MnFGenlOMzJMVjRE?=
 =?utf-8?B?eXplbi9RU2EwZTZjZG8wSjZPTWdtZ2ZJM3IvYS8vejZ2K2U4NTQ4cXdTSmR4?=
 =?utf-8?B?eUQ4QlRJamNBNm1kREcxUHdiK2JxK1RmZlJlbTMxV2lCRWJjVWhRQWZIc2gv?=
 =?utf-8?B?N1VZY3VKaXpjNTEvRFJSWkZhT1BlRDgrTlZvZHFYSXJEMkR6b3FSSTJ1ZGta?=
 =?utf-8?B?WmhlaUlZejU0Z2NNQWdYWWN5SENUS3hLQkFoVHdxR2RlRlBwZnF5djlZSWxs?=
 =?utf-8?B?cUJPa3hRSVJHRXFSMSsxYVFZNU1CN0kyWjgxZkYyMWJGREFOQTQxZmlDT1VY?=
 =?utf-8?Q?e2WULiT4PZQ3MeaFGDhAcVw=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db5384c7-1dcb-461e-e904-08da80f97dc4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 09:10:27.2552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ALI/oo5fw2J75OAfjYvSl5N6bYcfzEWj3VcOHm/CQkrKMpYJ2zwtdQ2iddfZNNOvX8KCo8clG31jyxpzcsuUZjRfi7ykq8+x2wS+L89p2TM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3302
Received-SPF: pass client-ip=40.107.0.112;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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


On 17.08.2022 23:00, Vladimir Sementsov-Ogievskiy wrote:
> On 8/15/22 12:02, Alexander Ivanov wrote:
>> We will add more and more checks so we need a better code structure
>> in parallels_co_check. Let each check performs in a separate loop
>> in a separate helper.
>>
>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>> ---
>> v2: No change.
>> v3: Fix commit message.
>>
>>   block/parallels.c | 85 +++++++++++++++++++++++++++++------------------
>>   1 file changed, 52 insertions(+), 33 deletions(-)
>>
>> diff --git a/block/parallels.c b/block/parallels.c
>> index 12104ba5ad..8737eadfb4 100644
>> --- a/block/parallels.c
>> +++ b/block/parallels.c
>> @@ -469,14 +469,13 @@ static int 
>> parallels_check_outside_image(BlockDriverState *bs,
>>       return 0;
>>   }
>>   -static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>> -                                           BdrvCheckResult *res,
>> -                                           BdrvCheckMode fix)
>> +static int parallels_check_leak(BlockDriverState *bs,
>> +                                BdrvCheckResult *res,
>> +                                BdrvCheckMode fix)
>>   {
>>       BDRVParallelsState *s = bs->opaque;
>> -    int64_t size, prev_off, high_off;
>> -    int ret;
>> -    uint32_t i;
>> +    int64_t size, off, high_off, count;
>> +    int i, ret;
>
> 'i' should be kept to be uint32_t, as pre-patch.
>
> With it fixed:
>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>
>
Will fix it, thank you.

