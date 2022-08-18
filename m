Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD89598071
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 10:59:15 +0200 (CEST)
Received: from localhost ([::1]:52570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oObMw-0000BQ-Dt
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 04:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oObDW-0002nY-Uj; Thu, 18 Aug 2022 04:49:31 -0400
Received: from mail-am6eur05on2120.outbound.protection.outlook.com
 ([40.107.22.120]:48417 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oObDU-0007d6-8R; Thu, 18 Aug 2022 04:49:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BT/ADGFiloOB7eBT8Bhx3G0NEmr5Ekb3il+9NL+x36mlEBvsW6f8k+4BijFiG6Wss1xWB7Nd1BnbsZoXsanm0B/ltADCx7erG5srhdUw2e4CQUdAfgUvT+Ama4wgtdPkOY+jPHNNpBiGvLbAM/yKZOyrAz/7m8H/ju+OMZwVFTaZ/xdzdXgJ/JX4gDYi0G1WlA+u3qgLYcWuA48GOJeBVvHrupRgq2j6zKTdLx5nHF2aEN7hZUeYLd7Wj5hWaX6ez+FBzDlRAiD2w5DZHQEBvgVFpGkdvcVPYDaeCLMBDl2ew+RNszkOmt5qw3r4XCPe30IOWyQn0e6+KzDRkkqm2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+A7mOoG8CWFy4oWO9tvpVsh6ISCVW3fjZrVjNuW5dU=;
 b=SjFEk8tsQ1vL/wTJ3zYDgJgffIw6Q4+IMRwnOcTjSeqFM4yyaaszdyVyvfZSoWHjRTS6Uja2kJK7Z72wPc3xfUDeQnXChYO6pFDtu9q8wd/OGVfHVy3K6ZO+fpUepvbweBHfpL4gg3F6fErN1OqibAIGbsOhCkQ7ysC9DIzt0/Y//6LFQnlyfc6aKO1VN2F+Xh5t8JHLDv0OQEJNkUl7m0ZIQ66inuyeZX4ZzKVm/6uBLIA7xdcDhsB3fQUk7ZzD5FL2wY3alE3GaUTPtGdew4ty89R4f6JvbvFrbNrGGsquSvjyv9bSdo56cwFwybDYoJ63Eh4PLoHterH6UrNaVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+A7mOoG8CWFy4oWO9tvpVsh6ISCVW3fjZrVjNuW5dU=;
 b=bPMQy5fzfDQVBzkhGCjmD5veJQlxW1vRASI37Hkx+AhP8f/o84c0Cj46FMek+J4znDqQpWBe1tRvdiBhlBQ9tYSmtJng6Q10eNwdaLYPHWUjMJlbzKWW1AGGzA3GFXnMY4w22eJzgz3+Yek9R174HxAGcEgl4d8ErL0tMohGjbXNG4Ul8A92fWS1ssVzm8uqgxgmhsYoVinXlDtZOXWV7so+zoVk6VZ5786zx7024N28dEb88164sxvuRHcTnsXTgLEdprff4M27+HKuC7vW4GROdmGcHtpSPXly8dOCP54u9q7z9eioHcsRGC9x61UQHnLGo4wsXFjYYkYrSpIA9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PAXPR08MB6831.eurprd08.prod.outlook.com (2603:10a6:102:139::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Thu, 18 Aug
 2022 08:49:21 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%7]) with mapi id 15.20.5546.016; Thu, 18 Aug 2022
 08:49:21 +0000
Message-ID: <336cbc1b-c591-3440-e111-762b3088cef1@virtuozzo.com>
Date: Thu, 18 Aug 2022 10:49:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/8] parallels: Out of image offset in BAT leads to
 image inflation
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "Denis V. Lunev" <den@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com
References: <20220815090216.1818622-1-alexander.ivanov@virtuozzo.com>
 <20220815090216.1818622-2-alexander.ivanov@virtuozzo.com>
 <f0f1cee6-1409-c94e-d9c1-68cb4c848d0a@yandex-team.ru>
 <30d44555-cb86-ae29-e781-959d6f12f0d2@virtuozzo.com>
 <fad01f34-b266-dbc7-6e19-6c29e835cbc1@yandex-team.ru>
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
In-Reply-To: <fad01f34-b266-dbc7-6e19-6c29e835cbc1@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::6) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84bb3e7b-f85b-43ed-55f1-08da80f68b58
X-MS-TrafficTypeDiagnostic: PAXPR08MB6831:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pMcmfRs8ASAeuIAR/pxz033qvNi6aeGaatfLf0qpNejHay4Qibe/7AYVPVFgtfLYKa+DpDZvJiCpwLDWaZcthgwQfiglV58x+fXOxYQQTuWL8g7RdhDWiwKkbW77pWpQZLwN7uIr6/zOD1n1BTHpuuvmexno+/gP4rNc+Ue7hsaqc/E1ozAE1FPJLWS3QgvFWc9D6llTE4nrBXwwbrJlILYDoHhj6bQ9JLC6ezFyFb366346wrqoJxPVA/Aie1m49jZXCYyt484ZNVeAewruE27KfyKruWr6OAuOsLH3BPq+yO/uxL0Ez+l/fI1rkj1C7cUcfs2XkVBo2grL+CGwT/mMalo0mWsscueDcRTPyRA9PVWuCfFDZx0Tp6q8cpEILeteO7A5pXSeXosehq9wqpccscMHu4EFMhbAmYfEYwdLRkHsQCgC76q4y9IUi2B+nF+UFIzWjpj3awhLIbQyGJ0giC9/yveZpa5FqErscMtQL5bE7bf59xNZAK/BrG2Q/ihCJxVlstzmZSIx1ShUztPlbAzBRqymXikLl/XBs37gaBig/dxAJedQ6ubg0rHtOvAJTAl542LuOmsYq4ERBCYo/sRWh6BHiQ0rQ0XgVG9i5nsLeq+ikOPvNbI9JLPsrkKN7E9bdJW0dQLO6DctkTAoGJJshK9I/f4sRg5i4gVMEpJ9X2DpSo3uaB+a1iCH956gMPnWcmpFO5AUCic5LRZUjh1JXOrxd8JXWwTfhYqySTF1PU4N4EmhcEC8GRrN+VDskPzGH1Ms4Ou/EZdys0mV5CyOP+mufT06v9AVBqnOdZUHNE/PMjkklINhit+rlQVmiuuogPLZiomodj2D/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(136003)(376002)(396003)(39850400004)(346002)(36756003)(6666004)(38350700002)(6506007)(186003)(44832011)(31686004)(38100700002)(5660300002)(41300700001)(316002)(6512007)(110136005)(66556008)(8936002)(52116002)(26005)(83380400001)(2906002)(66946007)(2616005)(66476007)(31696002)(478600001)(86362001)(53546011)(4326008)(8676002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGJ6ck93bU93WVJrbmV4U1E3N1lMbFB6MXJIcU9QcFN3cVlNdkhGZTR0eis0?=
 =?utf-8?B?UTdJUDkwV0FpeWgram8zMWdlY2VrSkthcUhCeTlIZE9CR3l3V1R4c1BLWVZD?=
 =?utf-8?B?ZnRUQTJzQ1RPVlNHb1JybllSdWJDNnlpZDJkWUk4Z05zclduUWg3RFBORDFP?=
 =?utf-8?B?MkpjMzV4YkY1dDMxaVZVbnMyOWMrdFIweWJVdTN3MnZ5RjUxQytoL282Nkx4?=
 =?utf-8?B?R05KOW5LZU1sWXNSb1dORDhrdVBnSlVlakVuWmhiUy8veW8wQ1NNL0J5THlj?=
 =?utf-8?B?U3lFQk1oWm55LzZpWFAzanN2U2d3TXkzaGVNN3BkMHN2Vk5zdU9jMEN1cU5h?=
 =?utf-8?B?QmttRUgrLzhtcEZoMkpTOVR0Qjk4ek43K0tLTWJRbjVQc01NMmNTU0V4OWJ3?=
 =?utf-8?B?VDBJbTFzelJPbGRlazlXMXFYamptRDVJenFvb0MwS3c5YSsxYXMxUURxY2ho?=
 =?utf-8?B?UTJOWElPaHJKTFVoMVRQSDhzTEp5bDBQLzJRcmp6MkJTSyszZFBZQ1lKTTAr?=
 =?utf-8?B?SW00eklTTWJHMFZKSzRzbXIweFJRU08xSGs3VEEyeTdFMThWdXBEUWp3cG5U?=
 =?utf-8?B?ajY5ZTBSV3dtb0o4WGN2UmRBUWlXUmNFRUZxWjlOQmwvbjRJeFErN2JXNDJz?=
 =?utf-8?B?dFlBeldvUmdnY01SR1NkSWRXaWNWMDZENVloQmZJa2RQYmVoUXJYcWhsSkUv?=
 =?utf-8?B?WmpmSG42VkZ6TGs0SzA4Z2V2WGFvZnRwNStnWUZ2Z0lBcEJZVlg2bWlGOGxB?=
 =?utf-8?B?djNNZGp5VUVTVFl6Z2JuajBTYVU1Y3VlajlQbEw1b1Q0Y1ViWHdUUE0xZlhG?=
 =?utf-8?B?K1NNT1pMMkF3LzRLWm9jL1htN1ZQcUpqMkJsOUwwZVl1Q0lZcURSa0xETlht?=
 =?utf-8?B?alNiUmRpQkVvckM3bGM2ZUVIOVRqTm5CZTdjSGFNY2k2WGljSVg1KzVMd0I0?=
 =?utf-8?B?cXpvMkk3WVhqUEdFaW9nZEVXT0ZDem1aU3BTcXIrQVg4dkdTZEdvS2k1eWpP?=
 =?utf-8?B?anpiUXIyRitmODBnaEptdUVPREhQWG5pQkt2aHJ2N08zU0xtcUxNbXlvb2tm?=
 =?utf-8?B?SVY3SzJhdjNTaThwVFpkbWFkZ0lkNE1NZU02RXQ3Sk4zRDlmQzkrUVVIbE5S?=
 =?utf-8?B?UGlWWWtxaUI4cm9kcGlQaXhqVXBjZytqdFZ1ck9pODRLcitOU1pQSFRRbWJL?=
 =?utf-8?B?bVlwUjk2MWpTOEswQ2lmc1dIZ3J1TUFxdnFSNlhocG1VdmNwMnlaZmZod3dx?=
 =?utf-8?B?WE5DVzNXdHcxZ3oxNjBBYnJFWjhNU3J6L3ZuU1RwTWR4ZjY4UDVwZEpxTnVN?=
 =?utf-8?B?SFNvYWlQYzBTYy9xZE5WSDlOTjJhZERNcGovNE1yNVllRGpySGRkNTd4a3pV?=
 =?utf-8?B?V2Z5UzlGY1hDU0JPRGg2QnpiN1NZMVZRMzNZeEwwY0dHdk1Eam9pcDN6d3pq?=
 =?utf-8?B?MDNJcTQvZHNYTnRybUtiRHJrWGlGa0EvM3Nkc0ZRYmFVOEs0ZzdTcXRaV0VD?=
 =?utf-8?B?U0NGMlRKVUxiSFpyS21TNG45cW1ZTkkwaHl2bFhMdzVSVEpOek41ckdDU0dX?=
 =?utf-8?B?VTdrUExLV1VRRUhqeGxEbkFRVXB2U3oydm92bkk2S1F2Zm8xbDJLMDhnRTBj?=
 =?utf-8?B?MkI5OXZKRUQwUTd1WGc4cFY1R3R6MmZ3M09kVWJVYjlGZG1zZnJtcVgrb0I1?=
 =?utf-8?B?MWZNL2wxZm5RdmxzeFlTMzNFOFdKOTgxS2lhV2hoditXWVVWWGhrTnVZUHB3?=
 =?utf-8?B?ZWF1M1U3cUpvZ1UvN1o3M0FQWlJMbDFyTVB4Q2xheXRYS1NpNlVaVlBsSVFt?=
 =?utf-8?B?ZUp4eEQxaXNEdTI4ZFNsaWluYTJJQ21LQUczMHBFL05oeU1WY1NwcVVKNGxK?=
 =?utf-8?B?OHVwSjdxRDRUWDZIYUJuTy9tTkdMREtiR0pwVFlHZlVkN1Z5ZDZpdzRhR05q?=
 =?utf-8?B?Y3VKZUtacFVYV2d1UW5jWVVSa3dmOW1oZ2dMRU9jU2t5TTZNSGR5TkhuM2Vp?=
 =?utf-8?B?aXBRK1IrWm9uYkNLMlUyR3gxNkFTaG12QUUwYkFPeklKUlM2dHYrTWVwQ09P?=
 =?utf-8?B?VGhSTThXa2ZwazVKbXh4eXppMGViN2tuSFJ1di9HczZiZ1hNQWpFOWJwQWJV?=
 =?utf-8?B?S0hHTUFSUGhaK2p2Q0UvOGFBcGxKSWl2dHFWaDN5Y0ZWd0dKRTFLa1BNa1Zm?=
 =?utf-8?Q?wavm01UWbD40u7n5MDeVNtw=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84bb3e7b-f85b-43ed-55f1-08da80f68b58
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 08:49:21.5573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTeXsX9SLtlat+j8seDn8EHv1P8lynZDETQ93unK8cxsxqHzqX0FAcq2DspMQtEzgn/6J/hGFtJTicgL0lY6HTRAupIuwMy/oXqVav9NCs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6831
Received-SPF: pass client-ip=40.107.22.120;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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


On 17.08.2022 21:43, Vladimir Sementsov-Ogievskiy wrote:
> On 8/17/22 22:27, Denis V. Lunev wrote:
>> On 17.08.2022 21:13, Vladimir Sementsov-Ogievskiy wrote:
>>> On 8/15/22 12:02, Alexander Ivanov wrote:
>>>> data_end field in BDRVParallelsState is set to the biggest offset 
>>>> present
>>>> in BAT. If this offset is outside of the image, any further write 
>>>> will create
>>>> the cluster at this offset and/or the image will be truncated to this
>>>> offset on close. This is definitely not correct and should be fixed.
>>>>
>>>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>>>> ---
>>>> v2: No change.
>>>> v3: Fix commit message.
>>>>
>>>>   block/parallels.c | 17 +++++++++++++++++
>>>>   1 file changed, 17 insertions(+)
>>>>
>>>> diff --git a/block/parallels.c b/block/parallels.c
>>>> index a229c06f25..a76cf9d993 100644
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
>>>> @@ -811,6 +812,22 @@ static int parallels_open(BlockDriverState 
>>>> *bs, QDict *options, int flags,
>>>>           }
>>>>       }
>>>>   +    file_size = bdrv_getlength(bs->file->bs);
>>>> +    if (file_size < 0) {
>>>> +        goto fail;
>>>> +    }
>>>> +
>>>> +    file_size >>= BDRV_SECTOR_BITS;
>>>> +    if (s->data_end > file_size) {
>>>> +        if (flags & BDRV_O_CHECK) {
>>>> +            s->data_end = file_size;
>>>
>>> Hm. but with this, any further allocation may lead to twice-allocted 
>>> clusters, as you just modify s->data_end, but havn't yet fixed the 
>>> BAT entry.. It seems unsafe. Or what I miss?
>>>
>> if O_CHECK is specified, we are going to execute parallels_co_check 
>> which
>> will correctly handle this. In the other case (normal open) we will
>> face the error, which is pretty much correct under this logic.
>
> Sounds like "s->data_end = file_size" is part of this handling and 
> should be in parallels_co_check()..
>
> Looking at it, seems more correct to recalculate s->data_end exactly 
> after for-loop, which fixes out-of-image clusters. Also it would work 
> better in case when we have leaked clusters at the end of file.
>
> Otherwise, ideally, you should have comment at top of 
> parallels_co_check(), that we must first fix out-of-image clusters, 
> before doing any kind of allocation, because data_end is already tweaked.
>
> I agree that patch should work as is.

I would like to leave this check in parallels_open(). I think it's a 
good idea to have an error on a corrupted image. Later we can replace it 
by checking&fixing images in parallels_open().

But I agree, it would be better to move the fix of s->data_end to 
parallels_co_check() and then move to parallels_check_outside_image().

>
>>
>>>> +        } else {
>>>> +            error_setg(errp, "parallels: Offset in BAT is out of 
>>>> image");
>>>> +            ret = -EINVAL;
>>>> +            goto fail;
>>>> +        }
>>>> +    }
>>>> +
>>>>       if (le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
>>>>           /* Image was not closed correctly. The check is mandatory */
>>>>           s->header_unclean = true;
>>>
>>>
>>
>
>

