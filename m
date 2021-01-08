Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF62E2EF125
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 12:15:57 +0100 (CET)
Received: from localhost ([::1]:45592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxpkL-0002Q7-01
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 06:15:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kxpj5-0001hb-ON; Fri, 08 Jan 2021 06:14:40 -0500
Received: from mail-am6eur05on2127.outbound.protection.outlook.com
 ([40.107.22.127]:47266 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kxpj2-0001Xd-97; Fri, 08 Jan 2021 06:14:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ik0spIz4pqEewDPaZjtwqVoIJ6yvyZiFuz/2ajjOVGWegxvQZq0K38OQ95ieMYIGIfhC1EjC/WtOS6MZYQSZO4J2mZ4BgjviRxj2uTd59CeXUvrLp/pISNrrObz0pkXOkCm4Rcm5A09a1rq9z+XM56dlOXj3rTj6qlelzaOtF4gQ4hELni3ZZN2vr7S8YgYxaoQccM+iGUXFyFYXFNiN+Lp0wowOH5VBFTLVPq7wGMz5SQ6s76l0aY53zWvC5Tsn3cdTOhRciZY8+epbhQhPyV0OzIjTd0ehqX4grxf2hBDRPKtDuxsbgq51pJ9N3e11Sj6ggTd0Qz2VquPlss+OAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XzpxITvCPdD7kz/POKHcIdcN/DgfVYrdJWD6jrQjf+Y=;
 b=QcaIUaoeTDHAyAqfWorRCNJLyxga95LT6zcNx+KyyqAl437BZfcQX+hnz/wc019sD/jX3BIfo9Y0UjDjGXPDiItq83p0CB1Ey5lMwSYK0X9Zftfhg47/Lig00gxSjeJQXjyqw4U2yA89JHmQAI/t+OihmK1uRQAY9hFR8tdc4wNVM+GCE8Z1pS+IdW2uERsEB178ErTk+nRKNShm9ZFjSkDetmFT69Pp1azOZvLMI9WepuhYeJ7wImCk8UM88IKqyT14onBSCKM6Xw9i1Dns+JgCvup2O3F97omLp8PCaiRve+Hshup79bMs9l8qqOlXduzUg/RDxE5H0mg6ITEr/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XzpxITvCPdD7kz/POKHcIdcN/DgfVYrdJWD6jrQjf+Y=;
 b=oruwM5tg/eDKTEZ837GR4PdLXuwDwsCHx34lFlXLVmFEkVZxxg6OmLed8nRb68a3NKYKoIMy5hXWh93X7AUntJ75J4r+TBi84CTc7Tr+IuyuJJZSGtjvoWcOf8OxzCsArw6YkqkaUJftgRsMTnFlqrxV3leYvDfwxgW748+8HOA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4023.eurprd08.prod.outlook.com (2603:10a6:20b:a6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 11:14:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.006; Fri, 8 Jan 2021
 11:14:32 +0000
Subject: Re: [PATCH 4/4] block: introduce BDRV_MAX_LENGTH
To: "Richard W.M. Jones" <rjones@redhat.com>
References: <20201203222713.13507-1-vsementsov@virtuozzo.com>
 <20201203222713.13507-5-vsementsov@virtuozzo.com>
 <20210107095817.GA2673@redhat.com> <20210107105611.GB2673@redhat.com>
 <20210107122005.GC2673@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4dffd554-06cf-ff2d-f4c1-24feffd53283@virtuozzo.com>
Date: Fri, 8 Jan 2021 14:14:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210107122005.GC2673@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.119]
X-ClientProxiedBy: AM4PR0501CA0064.eurprd05.prod.outlook.com
 (2603:10a6:200:68::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.119) by
 AM4PR0501CA0064.eurprd05.prod.outlook.com (2603:10a6:200:68::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Fri, 8 Jan 2021 11:14:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54f61ca9-c926-4369-859f-08d8b3c69308
X-MS-TrafficTypeDiagnostic: AM6PR08MB4023:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB402326A8C914F955160FF82DC1AE0@AM6PR08MB4023.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B96yJq+T7/zXq8TQMbyuiDxzBhmjN6nPlMvztSOmmQ74Di8Af5cRSmqGQgYfShCvXqpZULc6xXrdNLFWhX0lOT5gadVFzYan2ZpODW1C/2yBFP1J7d9JM6hL7PNZgeCYLnEquSJxECUOHYW/Db1ONbO802Qhn/x35wzc8UVaiujLi10B/DltXn08vah17iEZH5ngE0AHkqcip+YKlJ2v7Z8Ulu20vPpodTN27IjJUg7y6Ft6fbpJ8o6yb9u++fCRTjb8qbm2l/x/CQwsuZe3oTfZmcd6TgN8kelNM+M23tZre0gwp39BT4xyXcHHKd4rHktW2YCs/EwYVdcMNyIgFMi2aeRMqcCN3IuPjuo4rLunVzvpKtxFsVv1mLor6brWoo6hNDE8i8N39qyrT0qXj1/AVS/IFsZGvGIGdMcYmXpGCCtK4Nf4j6PYAvt5NJKN/KNw7E/pGMUF/b/5r7BMiDx22n7Y49pXd0TTnhf6EV8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(376002)(366004)(39840400004)(5660300002)(52116002)(83380400001)(6486002)(31696002)(8676002)(86362001)(66476007)(6916009)(66946007)(478600001)(4326008)(66556008)(31686004)(2906002)(316002)(16576012)(26005)(186003)(956004)(2616005)(8936002)(16526019)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L2xRWlF1K3ZjRzFBa3dnTi9hL0s3WUp0K2lCMXE0SkJHbGJrUlRvMENPYlZ6?=
 =?utf-8?B?cW9zZnpRaHZkMHhkNVdVVm9CVDZTdklxY2tPT2JXOW82RzFEeHcwZ3JYV3Fi?=
 =?utf-8?B?ZzJnejdNMVhxUlpxY2g1SEVvTkRkRUdRRFA0SVBhNjVRUWIxSGN1STcvejRD?=
 =?utf-8?B?cWN2djV5Q09WK01UenlKcVF3bSt6b0MrZVR0REM1T2hFNXFjNlpTRUtWMk1F?=
 =?utf-8?B?YjRqTm5vamxtNGxhekl6RWNtekxZcXJxc1UrbWJlUXFRdTducmpTcEpSRmlj?=
 =?utf-8?B?UTh4dlpjUkNWV2JCVHRwYkxWSFV0ak4rY0tmWVNUQnRNSHJUaFRPdGtjTExG?=
 =?utf-8?B?MTJYY1VRb0I1ZktRYUxtOEFIaFBoeDc0RWZGOXZwaTkrNWRLN1V4ZE9XUGY5?=
 =?utf-8?B?RGxZMm5LWnB6Ym80dzMxVUovdXdza0FVUlVRb2EyaG90NTFyU3FyNFcwVWZZ?=
 =?utf-8?B?N0NhdjJVUHBYc3ZWTGI1YWdRd1BwbTYwZXVFektqRFZHMmo2VWVQN0hWbFIv?=
 =?utf-8?B?YjJwaDZMcHBPUGxoMk9UTnZ1SFgvNDRDVStXN25uNmFIaFdrR0wyTWVhV3M2?=
 =?utf-8?B?UFZmUFlpS2NtSW8rallyUHgxeFFqZi9BVld6YlFyTmNVbER0SkFvVDlGeGVI?=
 =?utf-8?B?K2RxRFNFQ1Zycm5DOGpUU0ViSWtPRFM4L2lwbzVWMTg3K3NWMVBmMEdNaWJK?=
 =?utf-8?B?L0VZSVZaZ2FJS3RPbzgxK0RRZFdvRUpYaUk2c0lDSkpKdE90d0t3WTBVVWdV?=
 =?utf-8?B?Vk9lQUZIKy9JUCtiZDZ6WDBpdjdQOCtGZVlSNW1nTkJDcmtkMit2V3hlUTRm?=
 =?utf-8?B?R2tqTS9QOTEzVzNYRHBScmFUNU5DbjJwcHUycVhaYVV0VDQ5ZVBzWnRleUN4?=
 =?utf-8?B?eHdCYnJ5elg1dXVIMUo3Ykt2RVNCRGthK3RRSTVrME9pVklUSjQycnlLZzVJ?=
 =?utf-8?B?cjRVZGFUdGFsTmI3UCtoTkNYZFBiWDl6cGt5TW5BOUFhZ09nZFcxWkNYMGtV?=
 =?utf-8?B?LzBIWEp3ajE5WlBOeUVXb0hJaVFybDhlMkMycU5jUzlianQ0UzFwRVZqOWg0?=
 =?utf-8?B?WVA0aStEaC9oUDFUUVczZy9ZSFZmbXUwWnlST2pFT3gxMGdFSHFOdnBxSUlX?=
 =?utf-8?B?elZJWDJSQVZsTUtQL3FJSkJtUnppeTNMeEhtYmRsZkpveis2ajlVbW5KN1E1?=
 =?utf-8?B?S3Vjbk5HZzA3VkdkQnFxa2hRYU9qSG1NN1ZuYTA1VHFMZms2SGFzQnRCWDRE?=
 =?utf-8?B?SkFra0hXM0sxL0FOR3NkTXJmZHBLN09mZFhqZk9SKzcydWJSSjQ0WWIzSzdQ?=
 =?utf-8?Q?7Xm83ZuXr4GpRi9Nby0ziGaRCCG56Idiw0?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 11:14:32.3366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f61ca9-c926-4369-859f-08d8b3c69308
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iBZfPx0jNkSbjRM8Lhqu3rRuLE60qv87VC7tSCPJ91Mj1G2FMH2SLWO9ZzOfNB3SH4oXdOCoV5mOZ9W/ECKkr+vYkfuEPNfRKcUqqQZmq8I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4023
Received-SPF: pass client-ip=40.107.22.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.267, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: fam@euphon.net, kwolf@redhat.com, berto@igalia.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, berrange@redhat.com,
 stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

07.01.2021 15:20, Richard W.M. Jones wrote:
> On Thu, Jan 07, 2021 at 10:56:12AM +0000, Richard W.M. Jones wrote:
>> On Thu, Jan 07, 2021 at 09:58:17AM +0000, Richard W.M. Jones wrote:
>>> On Fri, Dec 04, 2020 at 01:27:13AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>>> Finally to be safe with calculations, to not calculate different
>>>> maximums for different nodes (depending on cluster size and
>>>> request_alignment), let's simply set QEMU_ALIGN_DOWN(INT64_MAX, 2^30)
>>>> as absolute maximum bytes length for Qemu. Actually, it's not much less
>>>> than INT64_MAX.
>>>
>>>> +/*
>>>> + * We want allow aligning requests and disk length up to any 32bit alignment
>>>> + * and don't afraid of overflow.
>>>> + * To achieve it, and in the same time use some pretty number as maximum disk
>>>> + * size, let's define maximum "length" (a limit for any offset/bytes request and
>>>> + * for disk size) to be the greatest power of 2 less than INT64_MAX.
>>>> + */
>>>> +#define BDRV_MAX_ALIGNMENT (1L << 30)
>>>> +#define BDRV_MAX_LENGTH (QEMU_ALIGN_DOWN(INT64_MAX, BDRV_MAX_ALIGNMENT))
>>>
>>> This change broke nbdkit tests.
>>
>> Actually that's not the only problem.  It appears that we're unable to
>> read or write the last sector of this disk:
>>
>> $ nbdkit memory $(( 2**63 - 2**30 )) --run 'build/qemu-io -r -f raw "$uri" -c "r -v $(( 2**63 - 2**30 - 512 )) 512" '
>> read failed: Input/output error
>>
>> $ nbdkit memory $(( 2**63 - 2**30 )) --run 'build/qemu-io -f raw "$uri" -c "w -P 3 $(( 2**63 - 2**30 - 512 )) 512" '
>> write failed: Input/output error
>>
>> You can play around with the constants.  I found it's possible to read
>> and write the non-aligned 512 bytes starting at 2^63-2^30-513.  Could
>> be a fencepost error somewhere in qemu?
> 
> Actually this is a pre-existing bug in qemu.
> 
> What happens is qemu-io calls qemu_strtosz("9223372035781033472")
> which returns 0x7fffffffc0000000 and no error.  That answer is plain
> flat out wrong.  The reason for that is qemu_strtosz uses floating
> point for the calculation(!) so is limited to 53 bits of precision and
> silently truncates.

Hmm.. Seems it wants to support floats, like 1.5G.. Don't seem to be very useful, but why not. I think we should call qemu_strtou64 first, and only if it fails or leaves '.', 'e' or 'E' (anything else?) as end character we should do all this floating point logic.

> 
> It happened we were just lucky that our earlier test with
> 2^63 - 1024 worked.
> 
> Rich.
> 


-- 
Best regards,
Vladimir

