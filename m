Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E53D32D7D79
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:56:02 +0100 (CET)
Received: from localhost ([::1]:40792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knme9-0001Cu-R1
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:56:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knmR4-0003jR-2S; Fri, 11 Dec 2020 12:42:30 -0500
Received: from mail-db8eur05on2120.outbound.protection.outlook.com
 ([40.107.20.120]:15823 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knmQu-0005qy-00; Fri, 11 Dec 2020 12:42:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9C7nzfSjrNo3V3O6Muzfrb5zXQpnchoeGBSzNUDZtPXgbN6gYX+d2p9FW9wO6ruMhYNFbqXr7aVxEHPYB8WzyzhH9VO6AQ5V8cEsZA2ngYBxDkcOfNAegYrzz+M5urmeUEZgGroVHYCE0Yi4uGDL5eVEp9qZobk3mSva2VVkNEocFXde8oNTf0kZ2axK8kpTuNJxHpPQVEH4b4qzF1go0O2pjn/4J41IUTD3CMNJhk1v5wrJCt6oZzKPt0CEOQDkPmbby+HFEokTjCLEyszYa2yDdZOfbd5zi3gkZXNP/2m4SasRHIBeDY/WetxHo6PoC+gemslVvDp0qK6P0PyBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjlDn/OZDNhVSYxcEJlyVfGjRhzq7YoNG7fQpPkXCSs=;
 b=ehN3VA8T+Qwg2CZ8UPChO2JBUR0y4btnNDjLlAwx13hLz/JJj7enyrLVSipA3AgT0CPstpCXwSKRiUCNlLjfGoQZbDqpjcb+0g0xoecQJzkO1fHUCOL4Xw6J9epY3MQnGJqzq5LPyRZGTXfSpkVWpdn0UcJ7w/zfHvq9iE2N9B6TJnOtVv5FLC/QU2R0UfR+zPnXj8c5uhHwgTcnkHsMA+4C73uW0RDHDQRXn53w1iar/maqNVIiCBhXczLZftlVuLERfwrUhC521FFa4AOGRM7kr13dF8u/9nI31pdSC7eBf0EDcoQY5fKXIXE+2KaL7Ty1BtyRHY/xMwd5IKRy4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjlDn/OZDNhVSYxcEJlyVfGjRhzq7YoNG7fQpPkXCSs=;
 b=qwBo813Qra/DAUQrJdFois+knw6cM4z8vbaOSNhyiJgti4r1uG2IHc73QGGor8U6w+Fbhr4juOvIXoYO0KwTxFRepuCPCh3y7wvP7qMsDK5HDvOnKrpZ0rcQk1kG0RHXu+W1YfNhJUbm2U+hO1ZzA8r+uLe02s10ogk+Ik/8woY=
Authentication-Results: virtuozzo.com; dkim=none (message not signed)
 header.d=none;virtuozzo.com; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3718.eurprd08.prod.outlook.com (2603:10a6:20b:81::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Fri, 11 Dec
 2020 17:42:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.016; Fri, 11 Dec 2020
 17:42:15 +0000
Subject: Re: [PATCH v14 10/13] qapi: block-stream: add "bottom" argument
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20201204220758.2879-1-vsementsov@virtuozzo.com>
 <20201204220758.2879-11-vsementsov@virtuozzo.com>
 <79993af7-1993-5af1-d343-04f208b03d73@redhat.com>
 <9e131589-84b5-761b-3e26-c4e8eb32ec09@virtuozzo.com>
 <ef0cc817-69c0-017c-bf94-cc19a66d9dc5@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <45365012-aae5-8c0e-0e46-fe4ae56199fc@virtuozzo.com>
Date: Fri, 11 Dec 2020 20:42:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <ef0cc817-69c0-017c-bf94-cc19a66d9dc5@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR02CA0129.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.91) by
 AM0PR02CA0129.eurprd02.prod.outlook.com (2603:10a6:20b:28c::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Fri, 11 Dec 2020 17:42:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4a6cd97-cb9d-44b3-2ab9-08d89dfc1965
X-MS-TrafficTypeDiagnostic: AM6PR08MB3718:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB371867CD56370F8F87AADD68C1CA0@AM6PR08MB3718.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HmL9SvPpM/D1/AbRZL1PPjcq0DxfU8N32P2O+zTxHZ1HmLFg8u5PtzYHuQjzfm5QIssSYu1Os1WXnNksbY4Mj4XLo1pqLHPtiahKFsQcmbmwUUc0vvh/M0iDz0Dnf/MAaT+8T17Fbt2zvCJ8qy638rv+ZYW7kxGxNLIX/1OhEkv1RvoGi8cXB7CtwknLQ3biPVix5mMqJ5FEWDUip6Vcput6LKEaAjeILCLSFhAgYXVLbJwguKry0Q36sc8yzccOxGJIRYGlZqGVraaofMqH2w8CxJy5+p2tbtBgo2Uu7a5DJkqLSI/SzJdgRZZm0+9e1ZtJrvZROzq1thLtaH70J7wK3Xpej1Xw6TkGmw1fbhwWEz6IuXjXHdH1bgDNatTpMWJtg1HFov0A6CUgK4p8ta4/dxuIe7Jwvmc/9xGfxtY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39840400004)(16526019)(16576012)(107886003)(53546011)(186003)(2906002)(26005)(6486002)(8676002)(4326008)(8936002)(2616005)(86362001)(956004)(316002)(478600001)(83380400001)(66556008)(66476007)(31686004)(66946007)(52116002)(36756003)(31696002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MCttNVEwUHpmRVUyMkxsQ2tNY1g4UW96blRwbzJJM1B4UkhoSEhPSHBXTDc5?=
 =?utf-8?B?TlJ4TUhBcW1sa1hINWVtNWwyeHR3emF5dk1rNzdiZHp3Y2IxcVFUamFPcHY1?=
 =?utf-8?B?dUFPWk9CdGVSRndvbWVhTWhlMWNBMkR5VGwzTHdLUFhrMHQ2MFhRZGVZTHhj?=
 =?utf-8?B?TEhOR2pBUnREVzh4MkpVbkk4bUNNYk0wK05oRlRUUEo3bHFDSjlrL1F1YmYy?=
 =?utf-8?B?Q1NVVVV6eEd5NkQyM2h4OUVkUTVkM09teXFBdVQyd0xna2lUYmhQQzQ0MXFP?=
 =?utf-8?B?b25oVEcxc3h1ZGdrTlo2VzF3YWxXSE10NkZSeHhhR0srbUt3TEtqdkxUK0ZP?=
 =?utf-8?B?R1VXS1VqK3dHSVlxSFUwMkt3aXlWR1l1ekRkZG8yVnVmNlgwRlhMaEtlYmdV?=
 =?utf-8?B?cStuN1ZXdFRYd0dZcFFtb3hCR1p5cSttN3Q5NmxsYjVteklXS0pvcS9IenRl?=
 =?utf-8?B?ejNHYldDU2FzZDZhWFV5Q09pbnJHeXVsT083cUtudVRXeUpyVWJKbFBNSy9h?=
 =?utf-8?B?dFg4d21rRGUxdzBaVEJKQmpHUlM4RGtrQVJrUSsyWGI3OW42anp6dGJwdVAx?=
 =?utf-8?B?WU5pcjFYWitRUDg5QS9JOFhGZ1NnT0ptb0VIRVZtQXBJS2xrempSZnI1Y3E0?=
 =?utf-8?B?L3lWbW1mT2JVb1BqUVF5OFQ1UDFvWWd3emp2MkR6QXFJcjFHRlNZcHNjSHpy?=
 =?utf-8?B?M1UvZmR2dGFsV01JY1o3SjJJMVhyb2tRVHRLV0lZeEZ5SFk3SXN4akltZW9k?=
 =?utf-8?B?RS8zaHVMSTRqOWI5NGttTlJmZ0NIUGZEV2tMelJJVVR4UmFHdEd2NDR6NFRr?=
 =?utf-8?B?NVBEaExDdDJjcjU4cy83N2o5ZVo4NTRpT0l0SEdzNm92MUlPTHBPNU02VHR5?=
 =?utf-8?B?TFRxRWxPK2RIQVdDQXl3Y1BDektyWnBUenNHUFZWcVFEQXg4OWtUZGlPZEVG?=
 =?utf-8?B?TURXclA4ZDhDclF4SVdGMGJ0UDkrVjlDTWg2TDhjL1VuSHR3UWhKcnVwME9M?=
 =?utf-8?B?VllUK0FxbWU0Wm43a3hPSHRYanBjT0creU9BdGVyZ0ZCRzNGd3oyQzZEcXpM?=
 =?utf-8?B?T1pVZ2pubXFBNStHaGZ1OFZoRmRhMVpXUUVMOVg5NERWby9OTUNGMlYyOHBF?=
 =?utf-8?B?dUVScmQ5SzIrbW52T0pGREF1d1RNQll1TWhGQUhOc0o0U1NiTnpWYS90eUds?=
 =?utf-8?B?V0s3Z2NiOUdrMmlBV21WNFQ2WDdUbGFsK1JiRSsyaXU4U0FJUlhRK1NNeE5W?=
 =?utf-8?B?bXJCLyt2dEZibTkzS3kvRFYrSHNxWmlJNGxKcWlhQ3lSK2RrMDhhWS9ZanFY?=
 =?utf-8?Q?OSGc5P8gm05GC9kGNLA+aps8TqUYaZkFHt?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 17:42:15.5548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: c4a6cd97-cb9d-44b3-2ab9-08d89dfc1965
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yj06hoZnLfb5XOzt7bEsaAff55oSqWJMe7HrNq3D4+JvnPA8CxacfmhNo/vhI2LOgnOf6bk7pB1LWAFO//BeRjPEYvMoxjbuQiwxl2uBo9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3718
Received-SPF: pass client-ip=40.107.20.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, andrey.shinkevich@virtuozzo.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

11.12.2020 20:24, Max Reitz wrote:
> On 11.12.20 17:50, Vladimir Sementsov-Ogievskiy wrote:
>> 11.12.2020 19:05, Max Reitz wrote:
>>> On 04.12.20 23:07, Vladimir Sementsov-Ogievskiy wrote:
>>>> The code already don't freeze base node and we try to make it prepared
>>>> for the situation when base node is changed during the operation. In
>>>> other words, block-stream doesn't own base node.
>>>>
>>>> Let's introduce a new interface which should replace the current one,
>>>> which will in better relations with the code. Specifying bottom node
>>>> instead of base, and requiring it to be non-filter gives us the
>>>> following benefits:
>>>>
>>>>   - drop difference between above_base and base_overlay, which will be
>>>>     renamed to just bottom, when old interface dropped
>>>>
>>>>   - clean way to work with parallel streams/commits on the same backing
>>>>     chain, which otherwise become a problem when we introduce a filter
>>>>     for stream job
>>>>
>>>>   - cleaner interface. Nobody will surprised the fact that base node may
>>>>     disappear during block-stream, when there is no word about "base" in
>>>>     the interface.
>>>>
>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>> ---
>>>>   qapi/block-core.json           |  8 +++--
>>>>   include/block/block_int.h      |  1 +
>>>>   block/monitor/block-hmp-cmds.c |  3 +-
>>>>   block/stream.c                 | 50 +++++++++++++++++++---------
>>>>   blockdev.c                     | 61 ++++++++++++++++++++++++++++------
>>>>   5 files changed, 94 insertions(+), 29 deletions(-)
>>>>
>>>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>>>> index 04055ef50c..5d6681a35d 100644
>>>> --- a/qapi/block-core.json
>>>> +++ b/qapi/block-core.json
>>>> @@ -2522,6 +2522,10 @@
>>>>   # @base-node: the node name of the backing file.
>>>>   #             It cannot be set if @base is also set. (Since 2.8)
>>>>   #
>>>> +# @bottom: the last node in the chain that should be streamed into
>>>> +#          top. It cannot be set any of @base, @base-node or @backing-file
>>>
>>> s/set any/set if any/
>>>
>>> But what’s the problem with backing-file?  The fact that specifying backing-file means that stream will look for that filename in the backing chain when the job is done (so if you use @bottom, we generally don’t want to rely on the presence of any nodes below it)?
>>
>> I just wanted to deprecate 'backing-file' together with base and base-node as a next step. If user wants to set backing file unrelated to current backing-chain, is it correct at all? It's a direct violation of what's going on, and I doubt that other parts of Qemu working with backing-file are prepared for such situation. User can do it by hand later.. Anyway, we'll have three releases deprecation period for people to come and cry that this is a really needed option, so we can support it later on demand.
>>
>>>
>>> (If so, I would have thought that we actually want the user to specify backing-file so we don’t have to look down below @bottom to look for a filename.  Perhaps a @backing-fmt parameter would help.)
>>
>> If we decide that 'backing-file' is really needed, than yes we should require backing-fmt to be specified together with backing-file when using new "bottom" interface.
> Before I can agree on removing backing-file (or deprecating it), I need to know what it’s actually used for.  I actually don’t, though.  The only reason I could imagine was because the user wanted to write some string into there that is different from base.filename.
> 
> (The original commit 13d8cc515df does mention cases like FD passing, where qemu has no idea what an appropriate filename would be (it can only see /dev/fd/*).  From that, it does appear to me that it’ll be needed even with @bottom.)
> 

I should have checked it myself.. That's one more reason for my "RFC: don't store backing filename in qcow2 image"..

OK, do you think we can require backing-fmt to be specified if backing-file and bottom are specified? Or allow omitting it and deprecate this thing? We actually already have deprecation message in bdrv_change_backing_file(), and how we are trying to workaround it in block-stream will not work with file descriptors anyway (hmm, and old code works, so, actually 09 is a regression?)

-- 
Best regards,
Vladimir

