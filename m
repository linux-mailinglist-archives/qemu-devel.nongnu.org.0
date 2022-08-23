Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DD659D9A3
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 12:07:27 +0200 (CEST)
Received: from localhost ([::1]:34500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQQog-0005Bf-D9
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 06:07:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oQQkI-0001UL-7k; Tue, 23 Aug 2022 06:02:54 -0400
Received: from mail-am7eur03on2137.outbound.protection.outlook.com
 ([40.107.105.137]:43008 helo=EUR03-AM7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oQQkB-0002f8-Rk; Tue, 23 Aug 2022 06:02:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZEjU45FInUYWeEffUZ826QV2Zc1qJEZJUTnr0AAKhV+8OJtySifv0CDQJaD+aaBgFynfR9kI/geQrW/+EoRpVI/IXiLZiDjJ8g6ByKhrI7+vO5d0qKe82jOGLr+fTS1rzZ/P/phCrTMt6pwB/zym9wZGMvm9sBIWbn5gQpUW+2+o1+17HPOJB9cxrOnJMY2Fxucylfmr1cxBg4OaLeMp28UuB5BGiN6YcWf4GTOig7HhP3wF4yG0gilHFmnZVOnPySym1f94VVj7Bh7L/+9S/oMcCkxRtbfuhf1Xab7hDXRaWREPRWcMJIMOvxL838ndhdbo0FuSdJaK7WCIM/ZJvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9jSHP+rQzHlgBfhgrRu1pszaJlvQi0QUJdMgXXfppQ=;
 b=ArsDWKCGZIVw8zPwz9ym3GooLJ85cgtbS3GJ7JZ7hzgiHaqWuWadEuG1TNpxkgVokBADenbrL2t5qGJlf2gIufFixP/U1FmL4otFJVp0CDaB+Jgnc7rhvkbg7xdritsgx6vFhL/B3xbMoVAWy0mJRb+MV28FRuieQljtw/2hSofRCYsyZmyWlusIamD5bZvhDMmADCs0P1ebAMg/FrgnzJl4eRYN1v59EaUU0/vs/rJ34xGuUTl/4srBGxDkEZ5FCGC+NrvvzStOxtOGJTJReB0ADm6W5dCoHHdmk+WtVcevJSjnXb0bk/U70dqM9EcwVZQCyKj/Fqn0WYh/NmwT9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9jSHP+rQzHlgBfhgrRu1pszaJlvQi0QUJdMgXXfppQ=;
 b=OPgFPHMc9A2iLlwX2vNNlyqJsfpVBV1zO4401xZCjyU0qCxj0sAQBxUZWkHGiPpvCURhbZP1Hl5Gf1GqNhDXfpOZ/TIJ5IRKn00jMuR/xYkqWngDY/2hdb1OtlbTXEx7pRpSbDdLGkwGUd7ksloQvUiAUgVamc63qt1TT3AxlL4/BgElnPBpFIWPg1vNVIvEHz/d6ALJb5giP98qTeqXGeRvpLHskF+yWHYNNyCODeQd4NLdURA+CJ5/pKM9s77KAXnpEwieU5yVdCda7xYCN+kBddP0thnyAiNDMQTdwI7aF9AvoAkEUfOIVW/xE6reSfxjz5Z1CTr0499JkpfhaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by VI1PR08MB4095.eurprd08.prod.outlook.com (2603:10a6:803:e6::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Tue, 23 Aug
 2022 10:02:41 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%3]) with mapi id 15.20.5566.014; Tue, 23 Aug 2022
 10:02:41 +0000
Message-ID: <72b54d3f-fddc-9672-ef4d-6255f086ce85@virtuozzo.com>
Date: Tue, 23 Aug 2022 12:02:39 +0200
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
 <68dc52ea-514a-3561-719b-172acbade2ab@virtuozzo.com>
 <5252a511-b102-b0f0-8d79-1b80b91b0e7c@yandex-team.ru>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <5252a511-b102-b0f0-8d79-1b80b91b0e7c@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0158.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::15) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ee5eabb-fe07-4bca-fb1f-08da84ee9dd3
X-MS-TrafficTypeDiagnostic: VI1PR08MB4095:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fnaeEkKMFgjCg1qq5A6d5HOOMHzVzrrIFIdb17Afict02Deb3H86u7D1mUZg+dj2Q4tvtSJDpw2oturMSAyaLQ7iI+9MRlwrvKMCnPv69Lumrw9hMczE1iPAwkKd/Mam9uUQuL5h+bmqR60sfgp9xjQYuMFl9Qd0SIdvdKmxLFAgZRIce469Pn7WRJ2oo1LQjzznBd+yU32sKpReHS/ml74gIW6hrwhhnJpJvamH5HiLciUuxA8PcQXG4cA1ptmF6yYU8/6OnQS6ancfuyQ6qKIoe+pcVlRRwFhScLo643V3wCWIun8UCL4tf2lsUSXQkSiNfTAVSGJIF+YPGbM+gT8nT556CFb+r7/rmAnakY/4KCHOSQEyRiI3F602pISspsuswWB8ydhA0mwhhdv1ryygeiFRyfwtPf9YNWGRXtoih+Epn3cki0a5NolUxDPpxlmfjGF2Q93CIl2MBWDDR0BvT3bhmkaYkQ6ABNc4tgk2ybj/0D4soFBOanqAaQZ+OKmT+Kb0hQYVoOGOSE4qi6uEQTITXZ29iweZnV2dGb+aNswHcXvJ9YSRdmvZY5vJFglAYP2i8LzJQsii8nbzAv+RVsn1WsdsoL5zwLDTYrjcYq2bLY4Su/TLlinPheCmxW2U4Y+xMkVGe0+dZWs/T468Pg78Pu8lh0imx/UOxD9/8TFOrx52AeQCudH9CXf1l32TbfhIBs8wolrknECd1JM7O0qtGqUZFSDkQPL13jFR5LQlqsZBjERF18MMBRN2xzoycxjttzGsFQNLyJHfSVlVFEgv/WnR+XV6RpYd6kurrp2eaxFtm7Mrp/N3HMV9ZsgRWdix2y5CTZUfY+8u9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(366004)(39850400004)(136003)(396003)(316002)(186003)(66556008)(8676002)(38100700002)(38350700002)(66476007)(66946007)(110136005)(4326008)(31696002)(86362001)(41300700001)(53546011)(52116002)(6506007)(6512007)(26005)(2616005)(478600001)(6486002)(31686004)(36756003)(2906002)(5660300002)(8936002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0hydUYyRW92cCtMYWhKRExBdlJISVhVOUhOZTJaaWFqQUxOUmV3UGQyaDkz?=
 =?utf-8?B?Ykx2UmFvUjZNcTIvM1FCSkxjN3MxU2xpdTZqNjJvc0N4UUNSNnBaQWNjNDZH?=
 =?utf-8?B?cTZlZmNxTVoxeXZUQ3pESitZTmlTc1luUG03aUZPOVV1ZUU2ZUpOZTd3UVA4?=
 =?utf-8?B?cUZoMGxoL2grYXFIMmdXbkJUQVpjYkk1aVZkNm1lb3NqazhHRU9mQjZubGlX?=
 =?utf-8?B?NEszUWxVeEFGYVpvMm9jR2FXMXZlZUlpdElOb2ZHZ0tlR1Y5ZlVEWVlxZGZh?=
 =?utf-8?B?Tk9LWUVkcVBGRy81d2tYRmtrSEF1bFZJV28wUHRIWTNjeUtkS3ZDbkFXaGhj?=
 =?utf-8?B?R2Y4a25tMHg5bTFLaG9hbXJTb0gyRHQ1aUFTemlYeFRIbkI1clhrTVF4UXJh?=
 =?utf-8?B?clNVRmpUTm9pdUJTZVUwV013RUFHVzVNNmpWS0ZoMnhkNXNlUlhXdHA5ZzVD?=
 =?utf-8?B?U3ZKRTBiUnF2Ynh4QVZFMHFsNllhZmpua0VCQWxITW05Q3pnc3RqTVpZd2J3?=
 =?utf-8?B?ZmpSNTUxblNrdk1obTlwdlhFNDh0TWVCS0NheEd0MGh5blJsSVU1YTlzRktj?=
 =?utf-8?B?R01zVVJJTUlicGJiVVNkUjY3Kzlsb2dmdEtoTVZ2OUlYTDlVVEdrYldLK0s5?=
 =?utf-8?B?dW1Kc21ldmhPWXdhVGdBb1FnTnYzdGIzVWRDNFlwQ2lRMlpOajZoRFNSZ2Iy?=
 =?utf-8?B?MmRLYXd3THNxZy9nRnE2MVcxNjFRaUplYjY3RzFEaEc2MmYwYmM3bENXYm96?=
 =?utf-8?B?Q05lTEs3aGxSWW9pYytGZlJQWEVmL20rbUk4R2htdlhja25CemhSajhXQ3Zw?=
 =?utf-8?B?RndqVG5RZTM0eTJINHBKWFFWczZzTFBKczBCRVlZb3A2ZTJ1SkwxaGxrTjRH?=
 =?utf-8?B?Z0xXNUFCQVA4QXZyVFBPS1NkSnVrQndIZnZXamZLT1BkU3JjT3ZZbWJUL3pj?=
 =?utf-8?B?M202VkRmMWpBbStOYlZGSVRHSmRIeWhVTDE3ejVvclFSdTZYN2RKWTJlZUFi?=
 =?utf-8?B?U0tlY2J6SWZTUnRvNndlZEFIczRpSFZCZ2kyOTU2R041bkJleXZHMXFEVisy?=
 =?utf-8?B?Z2hhVU9ndE5VckUxbllzbXU0bVQxL3FMY2owQzhHU2lueVFNZXhEdkk0Y3Fl?=
 =?utf-8?B?d0JSWnZuK1dzS3lVUmNuRHExQmJMZGUyRm13NGZJQ2tQc2xybzdielRaajc0?=
 =?utf-8?B?emp4TTl1QWkyNWhvdEJXUmppQUtETFEvUEFpSXF1eG9rOFFMakNvVWtsSS9r?=
 =?utf-8?B?ck5reWR3V2JzMllmZDBndnhaR1B4UExJU3ZsMFp3UjNZalA1R1VXVFY4QU05?=
 =?utf-8?B?R0hQUnpuUENHT1VzVTVETDhtT2VIS3lCSmE0d05jZXltL1lFYjVUZEdHY2xM?=
 =?utf-8?B?OU5RU0Z2SXh0RFNKNDk1NHhVc0xlNDQvdThvNFJPR1VGZ2kzQy9Bc1BtaXA3?=
 =?utf-8?B?VDBJTWNGNlh2WmpGUmFwa0dNZ3ZSOXRTTmZ5bklEdkc3N1ZiRHBFWmVsVGUw?=
 =?utf-8?B?YVZDM2w0VnJEZ08wZ0dpOS9zM1R5NTl4QzFyQ2NEeElOQTgxZEJUcGZKc1lC?=
 =?utf-8?B?eHl1N20xNGhndEpTOHloTUo1V05qL3J1WlgxN2UyZEZyZm9DT0FQbFRFRFFi?=
 =?utf-8?B?UWNyN1hYWit4d2pId2ZmM2huZW9jTFpQb01UWWE4OHltMHFhMVRTWjhwcWx3?=
 =?utf-8?B?NHZqdFRObHNRZDFtYnBvdlNreGgyT255SkFoZGlMRkpRc2d0OXpIUmFQZ1BD?=
 =?utf-8?B?bE1lNmt3MXoyS3JRaVN3dkQ2aERFa1M0dDJDUXZnM1dEdy9vMDVkZUw0cWw1?=
 =?utf-8?B?S1ZGeDF4TWxic29Sb3BYOTlVRUtWdC9HbDc0bG5uNXVBeVN5d1RtMG5uci9n?=
 =?utf-8?B?WXYrR0podm10UURYMGpXeW9iVm9UVzFTZkpaaEtZdk9kalROR08rN0NSSUc2?=
 =?utf-8?B?dUR5cmlyNm9lYU4rbXBYYkNtUmQrdEJGSDhZNEJCdXUxUTNvMFJGRHZHdGhz?=
 =?utf-8?B?ZGpGQ2ZubkdITWM4N0lsY1lFNEd6TEhqM3hXenZBQmV1Nmh3dTJZd0ZSeGZo?=
 =?utf-8?B?VWR4aFRFaWd6ckV6NXNZNXI3R3VaYVdhejVkZU13ekZrTXZOUzlmS29oRW1y?=
 =?utf-8?Q?eJTZeJWJacE3GHvD9k7+zXE9x?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ee5eabb-fe07-4bca-fb1f-08da84ee9dd3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 10:02:41.2438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nOTaPi7kBLAqkE9g9Ghqrc0bwWlkKr99MQPUffcIGMfLzeKKcYcxxffBWxiN5PgbfHrRqmw/DsNHjJ1TVXN4zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4095
Received-SPF: pass client-ip=40.107.105.137; envelope-from=den@virtuozzo.com;
 helo=EUR03-AM7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.08.2022 11:47, Vladimir Sementsov-Ogievskiy wrote:
> On 8/23/22 12:34, Denis V. Lunev wrote:
>> On 23.08.2022 08:58, Vladimir Sementsov-Ogievskiy wrote:
>>> On 8/22/22 12:05, Alexander Ivanov wrote:
>>>> data_end field in BDRVParallelsState is set to the biggest offset 
>>>> present
>>>> in BAT. If this offset is outside of the image, any further write 
>>>> will create
>>>> the cluster at this offset and/or the image will be truncated to this
>>>> offset on close. This is definitely not correct.
>>>> Raise an error in parallels_open() if data_end points outside the 
>>>> image and
>>>> it is not a check (let the check to repaire the image).
>>>>
>>>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>>>> ---
>>>>   block/parallels.c | 14 ++++++++++++++
>>>>   1 file changed, 14 insertions(+)
>>>>
>>>> diff --git a/block/parallels.c b/block/parallels.c
>>>> index a229c06f25..c245ca35cd 100644
>>>> --- a/block/parallels.c
>>>> +++ b/block/parallels.c
>>>> @@ -732,6 +732,7 @@ static int parallels_open(BlockDriverState *bs, 
>>>> QDict *options, int flags,
>>>>       BDRVParallelsState *s = bs->opaque;
>>>>       ParallelsHeader ph;
>>>>       int ret, size, i;
>>>> +    int64_t file_size;
>>>>       QemuOpts *opts = NULL;
>>>>       Error *local_err = NULL;
>>>>       char *buf;
>>>> @@ -811,6 +812,19 @@ static int parallels_open(BlockDriverState 
>>>> *bs, QDict *options, int flags,
>>>>           }
>>>>       }
>>>>   +    file_size = bdrv_getlength(bs->file->bs);
>>>> +    if (file_size < 0) {
>>>> +        ret = file_size;
>>>> +        goto fail;
>>>> +    }
>>>> +
>>>> +    file_size >>= BDRV_SECTOR_BITS;
>>>> +    if (s->data_end > file_size && !(flags & BDRV_O_CHECK)) {
>>>> +        error_setg(errp, "parallels: Offset in BAT is out of image");
>>>> +        ret = -EINVAL;
>>>> +        goto fail;
>>>> +    }
>>>
>>> If image is unaligned to sector size, and image size is less than 
>>> s->data_end, but the difference itself is less than sector, the 
>>> error message would be misleading.
>>>
>>> Should we consider "file_size = DIV_ROUND_UP(file_size, 
>>> BDRV_SECTOR_SIZE)" instead of "file_size >>= BDRV_SECTOR_BITS"?
>> That is a different check. We need to be sure that file_size is 
>> authentic,
>> which worth additional check.
>>
>> At my opinion, this worth additional patch later on. Let us agree here,
>> queue and proceed with further pending fixes.
>>
>> We should use something like the following
>>
>>      data_start = le32_to_cpu(s->header->data_off);
>>      if (data_start == 0) {
>>          data_start = ROUND_UP(bat_entry_off(s->bat_size), 
>> BDRV_SECTOR_SIZE);
>>      }
>>      if ((file_size - data_start) % cluster_size != 0) {
>>          error();
>>      }
>
> Do you think that we should error-out in such conditions? It doesn't 
> break the spec, is it? Can the last cluster be half allocated?
absolutely no!

We should adjust the spec on this.

Den

