Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAFD59D69B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 11:23:44 +0200 (CEST)
Received: from localhost ([::1]:58424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQQ8N-0007iY-HV
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 05:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oQQ5u-0004oJ-Ef; Tue, 23 Aug 2022 05:21:10 -0400
Received: from mail-eopbgr80101.outbound.protection.outlook.com
 ([40.107.8.101]:47517 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oQQ5p-0004cE-8h; Tue, 23 Aug 2022 05:21:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MSjlq0zyUW+sXQnPIP15mE8nROkfWrdrY8l88HjynOc1tGsms8rj776p7TrVuYvK6b64JB6uY4Cn8zn5p58CDORqNKdl+GU+lweUeV7o1Sn+x0QAeuatpIap7KrByODjRuOygqKgb35+jm4haHEENXXPhPYeuek+dZx6J2JPMDtYnjbghUmtaX5CXrdk3hbeOXa00BWgpCfL9TVfkgGz+fGPGLhtgp3D2WaVUsbIpj3akCnn4mBlJS9z09aKYiiP0gtEs7y6Qo8d9+hHtXZlcSY03hunL4NO9Z6fzB2JBmtvjrlB5dPyqvxfOCjnC9Elc3/aL/+ub7mcAqViEdEyRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1vNroL1kAA6dFnirX0ax9l26sVODMuvADlaJd03BXQ=;
 b=hKujPJ/tGjWLYTxjJ9sbhC3lPuciroYl/+BAgR7obn6icDTOVNR6SS1Z0OxDhqMYXtAic3krmkSo6+LSLU9RSKVp4Dp6D89/15U3GtxF0/6QBlyBMD35+EtFQ3Anum0RiBP/xVWQyH9kx/qV2x7hPppVteomuXef71TbM+5qWVeJU35+Fi9Sk9SgQ4Q1A1dT1Xhg9FC2NUgybc6w2+oHPetZSpG7QZHVXSb0j/ldAGNViscmGUdw1GMg/BbyrGHrDR2l4K08g9/NhEuPYVa+wCxmYUvspVnczJAvXL4FwKS0NaTvSa5c41+7UVW0tbpLmMHEe9XgdWxrTkwLhKJJyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1vNroL1kAA6dFnirX0ax9l26sVODMuvADlaJd03BXQ=;
 b=GZCaBGjDIFXLh1eh2Yjl8G3lFK/aWHv86BsWOqfOeWDhaQZqWKgvQzEulxyGsvPRTPSIt1u70p9Dpaz4yWavL1YKyqyx3Qq8OsmUP9VBlYxpYTPw697BrHWkuQvGUtcaKvMW3D1rvnTeSQO8yaqDb5MneO+GxyhNodV462sJeewWSs82FBLkfyoo/kXK9aY2tz/1OboHECDv/WhHNh1QYoH8kiuKu5hDrzuPj8HWdHrKXs0y1EnW/UyXIGox9oKvvW79rFlk0p4hUaMeryVWCQ82kmdnv3oPwIy3S8bWPkQ8eJ6Oow1wk2/e/dl6E5iOsxm5+28/NYi1HfZcTb5Qbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AM9PR08MB7086.eurprd08.prod.outlook.com (2603:10a6:20b:418::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.20; Tue, 23 Aug
 2022 09:21:01 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%3]) with mapi id 15.20.5566.014; Tue, 23 Aug 2022
 09:21:01 +0000
Message-ID: <234ffa52-e067-b80c-dbfe-427e18013655@virtuozzo.com>
Date: Tue, 23 Aug 2022 11:20:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 1/9] parallels: Out of image offset in BAT leads to
 image inflation
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com
References: <20220822090517.2289697-1-alexander.ivanov@virtuozzo.com>
 <20220822090517.2289697-2-alexander.ivanov@virtuozzo.com>
 <8a010bb8-82e3-8b74-8ce6-414d3638c7ad@yandex-team.ru>
 <c7c88a75-4e21-99ab-db91-bac5adc27f98@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <c7c88a75-4e21-99ab-db91-bac5adc27f98@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0211.eurprd07.prod.outlook.com
 (2603:10a6:802:58::14) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20899903-bc01-4272-9745-08da84e8cbe8
X-MS-TrafficTypeDiagnostic: AM9PR08MB7086:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zIMjWBQvHayDluZ11gBoYp4fe2wxnZkcb/hsYfknGkq8fbJOfweFt1Nb2NCrGCcl9IW43zIvVlEaIpmV1Q4V6GYrctKuNQZNq/qonm22L1NkLWrlqUq1Tcf+Mh5O6KwU1NjDLamxqF1KSgEUuppvZIaPPyXzWcccWCxpavfcQARjB9vnF8o429TcWcT86MJT+ftF88XzjWb0qSTzjHUTEUbE+XEL0h1/Gs8+88a1LqugIEGy4Qa/j4/mkaz6lsP/fWhHhNpMlZtm1YyHyIzKQvCuxSQmx20+gr2MQB6J6Ld4y7nIYa2kzHKAkc8KRp0+vWCyGQLRBCff6IFW3zpQS1tIUdKj3zKQ7u6x10zuCjcTagAIJh3Va70LZ3MYQKSkValrMgzFUJR2DH5kE1K/rCLMNLyZyxREHAzPzumOzlPLtHCDHmJZa0MZTrZF8/5JdwPRPQ+nO2gBCZb3zy9GtuXbGsuX6kB7r2rBpgWgH8qNXnc1e7Rd5meMAZazeMuwVuhWXVn9xXAby9Am3EmkwJ0FpHHmmU4cfr+Hclscg0F+XsvZA13+l6s00RgI81pdUv0mdyc7svDh53/J6EKTwzLMv6WEMF8qE2zPycwUFkfWFHGcACvKU1GF+xl49wdxv/wDml8VGkZPKxmxLIAwqwCscyLnOPUZ468heexHxIG2S+UGPs4swNWwMpb7yW0ckn8rmFVCAP0MJJyGd7Ryqko0nyvV+L6sROQPNvqeLtDdY9GAyy15pPmFIx1pzMBDM39mV/Mc0XKgT5Kk8Fq7kR7r2PZJbu1SbXmJW+Huz4jKMr2nh7bPyQZ5y9jjLj446e4MA5uB0MlzkzcMK0CrVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(39850400004)(376002)(346002)(366004)(66946007)(6512007)(66556008)(6486002)(5660300002)(8676002)(66476007)(8936002)(110136005)(41300700001)(31686004)(316002)(6506007)(53546011)(83380400001)(2906002)(478600001)(26005)(52116002)(36756003)(2616005)(186003)(4326008)(86362001)(31696002)(38100700002)(38350700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTJoSDJBNVBpUmUveWlla3YrSW5CS1V6bjNkRnNyZGJmaXZHekkycmxteXNy?=
 =?utf-8?B?UGV1YlBGajRzckt1SzZWbzFzNUlaWDUwZGJUZTE4aG9VdStKby9tNXphQnRC?=
 =?utf-8?B?aENUVkhpNjk0RjlkM1BJa2k5RTJZRGtxbUpybVBkVnRmYm5SbVZXNm1nRGZZ?=
 =?utf-8?B?VnlRN2N5SG93cDFHWHM3WU95MXoxdlp0ZUE1QnphSGtBR202V3dJaEU1V2RB?=
 =?utf-8?B?VzhMRE9GYnQxM2xFSThjblRucVAxcGNYNUVoSEZGSjgyMGZGQ0VqWERCdTJG?=
 =?utf-8?B?VGJXTVZRMFV6YmdCRnMrYStqazN3L3VMSzNWTW5jRG0rZEJxYzlTRUtPWnI1?=
 =?utf-8?B?RmFyb2ZDb0NIbUxKa3EwcG1mK0VTWmFJZzZmcU9IZE9kRmJGeG5sc0s4SkpF?=
 =?utf-8?B?R1hkTk9ybERQK3Y0Zk1oS2VxVzVjcDRpOWo0aCtabEZVUy9UVGFzNExvWERa?=
 =?utf-8?B?OFhsYTh4TGdXR2JzMnFQU2dITjNySndTbk9TY003djBCT1oxOEoyVEVlQ0V6?=
 =?utf-8?B?OExoWXJUNlEzcXRaMnAwamEydkhJaDYrKzYvVEtqVnQ3OUcwaHEwOUlXaTdG?=
 =?utf-8?B?Uk0xN1JKODBwNC9KRzNvYS95TEw1VGR1Q1JDU2xuclFyblNqQmR3UmM1Ti9G?=
 =?utf-8?B?QTZTRjNtcXEzMUpnVWNxS25PdmlrQmVtMURkN3FhRjUyVmkrTm5HckdncC82?=
 =?utf-8?B?VUlpUmd6WjcvbDJoRGxkRURRUGZ6WmpibnJwUG8wcFhBSVliSVJsQ20vQ3Zz?=
 =?utf-8?B?K3BlOGlkRnM3SGlJb09tQnd6UGpHYWhRVDJ5NWI1QUxjaXptS1FNVm5NWWVt?=
 =?utf-8?B?TUJyMlZERkNYZ2dOcEhqTlRpNjJZYVFELzlYL082enFrUVY3b0M0bFNWeVF1?=
 =?utf-8?B?bFIza0VKTFIrTjE0WjFQZEloU0lha2RPSE02dzhzRUxMVmlKUTZFYUJkS1Vp?=
 =?utf-8?B?aUVjMU9EVStyekRkRU5RVFNBVyszbi9nZmFFOStSOVRqL0c0QlprVkRxem9U?=
 =?utf-8?B?bnlDclZzcWhzKzJUSkNDaktUL3dKYUdKcTJmOHBrTCtLbGJhQVhRYmIzRk9W?=
 =?utf-8?B?YjBXempzTHBjb1RaZDZQZXJDWlh0K3EyWlRrb1NOaTZpbTlRNFd6Q2dKOW1V?=
 =?utf-8?B?TVdRS3lzQlpMYktUeTNGZExoUEhwdjFtS2llMC9DRXhPSEU3dGV3aTYrdlFa?=
 =?utf-8?B?Nm5ucWp1Y0ZUSVY1R3J0ZXQ2dHVHOWZodnpvZkRwcDFwNCtPRDdIQ1R4aUpp?=
 =?utf-8?B?SVZsMlpyTUY0SW1kbit3cUtlNmxxUGg4SFg4SFlIZGpWL2JJQ1Z1U0Rzbm9U?=
 =?utf-8?B?clpPWWlucGFFdVZiTE1XeUxJUGhYMTFZMUVJSE9BMGJLSk5Mc1hQN1huTVhL?=
 =?utf-8?B?b0ZBc1hNTzZLNXhWODdOWjExQ1MzM3hod21oNDh0cHhnbEJQQXZ0Q1lXK1dy?=
 =?utf-8?B?WG9pczE3ZEQ3MXpYNEh4TDh3Zi82bW1NRWpBVjhDTVhZcEpzemZXS3ZPT2dD?=
 =?utf-8?B?T2JaakhCRS9ZdFJPMy9aZFhGMk1NVTNjdUFVbms4UGlOQVdWY0R0N0p1aGRt?=
 =?utf-8?B?U3c2aERSTzNGM1ZuditINU96SmxSZ1BidVBOd1BpZFJhYm15RkJueUpyTmhG?=
 =?utf-8?B?N1hvZzgwbS9wdmE3SGVSS1Vrb0xMZ3R0VDd2MFF5MnRRTVhyQlR3czBjQ0Yz?=
 =?utf-8?B?WER2bzVFbUt2RVY2Y2xFM0xOOGdILzRVektVQmhIWlQ1UWZIQTd2VVl2cWRw?=
 =?utf-8?B?NU5BRG9TUW81eGxmSTgraEJHTnpkNTQwUWMzS2NHQW9MOWJXT0ZFL1BySkxW?=
 =?utf-8?B?ZnplZHk0VUZEOUtJQnhmeGNTWm1rSnF6djBveWQxQ2E0ZC9kNDE5L0xZT2li?=
 =?utf-8?B?WGR4SjFZVG1yeVVDSzF1MWRtN00yM1NxTlNRdGtJS3QxeHhqczhUWEV5NVhs?=
 =?utf-8?B?ZzMyZXZDR2Yybm5zcjBjTVlHcVRReVlsVHI1bkRzWVpmRUEzbG8xRzNEMisx?=
 =?utf-8?B?NVVhT012RS9wQWY4emk1bWNqdWJKZjQxaHBmNFVRdnRQNXAvNWlGenhTeDN6?=
 =?utf-8?B?Z09WNVc5emhBTGRoclltNWRINXdVd1V1cTJoL0YyYllUZ0QyMHg0V082aGoz?=
 =?utf-8?Q?UVID/Fu+TAxXMHH5PTYqKqTbf?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20899903-bc01-4272-9745-08da84e8cbe8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 09:21:01.7111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9CF6HwAQzerv2oW1gQsLyunReKl6SoCCwAtNyJGnvPRbyDanVmzG5WRHgek0/InDOb+hk3JxzlGpMYGUnqBW8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7086
Received-SPF: pass client-ip=40.107.8.101; envelope-from=den@virtuozzo.com;
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

On 23.08.2022 09:23, Alexander Ivanov wrote:
>
> On 23.08.2022 08:58, Vladimir Sementsov-Ogievskiy wrote:
>> On 8/22/22 12:05, Alexander Ivanov wrote:
>>> data_end field in BDRVParallelsState is set to the biggest offset 
>>> present
>>> in BAT. If this offset is outside of the image, any further write 
>>> will create
>>> the cluster at this offset and/or the image will be truncated to this
>>> offset on close. This is definitely not correct.
>>> Raise an error in parallels_open() if data_end points outside the 
>>> image and
>>> it is not a check (let the check to repaire the image).
>>>
>>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>>> ---
>>>   block/parallels.c | 14 ++++++++++++++
>>>   1 file changed, 14 insertions(+)
>>>
>>> diff --git a/block/parallels.c b/block/parallels.c
>>> index a229c06f25..c245ca35cd 100644
>>> --- a/block/parallels.c
>>> +++ b/block/parallels.c
>>> @@ -732,6 +732,7 @@ static int parallels_open(BlockDriverState *bs, 
>>> QDict *options, int flags,
>>>       BDRVParallelsState *s = bs->opaque;
>>>       ParallelsHeader ph;
>>>       int ret, size, i;
>>> +    int64_t file_size;
>>>       QemuOpts *opts = NULL;
>>>       Error *local_err = NULL;
>>>       char *buf;
>>> @@ -811,6 +812,19 @@ static int parallels_open(BlockDriverState *bs, 
>>> QDict *options, int flags,
>>>           }
>>>       }
>>>   +    file_size = bdrv_getlength(bs->file->bs);
>>> +    if (file_size < 0) {
>>> +        ret = file_size;
>>> +        goto fail;
>>> +    }
>>> +
>>> +    file_size >>= BDRV_SECTOR_BITS;
>>> +    if (s->data_end > file_size && !(flags & BDRV_O_CHECK)) {
>>> +        error_setg(errp, "parallels: Offset in BAT is out of image");
>>> +        ret = -EINVAL;
>>> +        goto fail;
>>> +    }
>>
>> If image is unaligned to sector size, and image size is less than 
>> s->data_end, but the difference itself is less than sector, the error 
>> message would be misleading.
>>
>> Should we consider "file_size = DIV_ROUND_UP(file_size, 
>> BDRV_SECTOR_SIZE)" instead of "file_size >>= BDRV_SECTOR_BITS"?
>>
>> It's hardly possible to get such image on valid scenarios with Qemu 
>> (keeping in mind bdrv_truncate() call in parallels_close()). But it 
>> still may be possible to have such images produced by another 
>> software or by some failure path.
>>
> I think you are right, it would be better to align image size up to 
> sector size.

I would say that we need to align not on sector size but on cluster size.
That would worth additional check.

