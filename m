Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 461263A2DC7
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 16:12:51 +0200 (CEST)
Received: from localhost ([::1]:38020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrLQQ-00052U-CF
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 10:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrLOT-0003UP-AL; Thu, 10 Jun 2021 10:10:49 -0400
Received: from mail-eopbgr60131.outbound.protection.outlook.com
 ([40.107.6.131]:6894 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrLOL-0002Nl-1g; Thu, 10 Jun 2021 10:10:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LL/uI/1FFq4HZWCNiyOao0L0nLN5oC+T045sw+S25S+cnakIasFE/GGh1i5dUYXlV2zRWj71B9aM7//cpOJcfhJiiS4k7BhTnB9/MayRdzRXohONjAFkGwOsPYnQLaJDr72UafgYubidM6EqDBnxbDGS8qxKx2/0xGYfKYrKQWWeQqWE8Xmir/LJx7EzWDs3cmTYPyMeOt7+djr7udKxEK2KmSGorbwwbsFk6lDk/vFtV/AfI9kyJ0L+LnJ/8quH8o3hduJa9lgyBSgzLSOCeTbvjlNX/j62HUGb9s+R5Mxujrd0bUbh6h3EL4O2V8Tu3qPiL2gvQItl53b+UBpNlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDWQenHFXST4puJ7kpzUu0+Q3jB7v5Xs5xqgmgHS8Ws=;
 b=WW1iYuPA3O2GnGw4eg7KQvwjsCNX2000vZ73oSz/KfPYpKvP8uhzlXBN66qIMppNFWowvaMqQxSylMnrH1VUCdSqItZjnm1Sk0LtAHolaiIo6uHYtA1l37KOLKcMEQKMlIKNsNBI+XaUBEi0s0o2VuH5eJy8OB6QgM1isUQJlAd+1XZDi0dnOpn4KcGMhcBoh81+OwkzNrTAfduML8/B8JM6MvVOxOUz35EZLk+E6gadWM/foDlWPQaXSxsOKbvBmYv4VE3HEQSPoWaeNthhWwIroXzyyJ0SWnfb1U/yq5AHqO7qU8oA2XpItQE0VIAZMwv25UKe/wsepo2jm+Avlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDWQenHFXST4puJ7kpzUu0+Q3jB7v5Xs5xqgmgHS8Ws=;
 b=H8ZCV7o15q05VIZBavhBnx9fwjyB2iqxqhgySQMqSIc48ioMO7ja3bJoB9O0r6GMlFnm8/HmcxwPanjKQ9yrM0YfMf/mMF7gwE8bp/j59OFYjGWQkUUMmUuKZmR8N0En8TMTq+xRqTFOne3uMjj9dN6RJFmS/OPwCTubuySCUvc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2451.eurprd08.prod.outlook.com (2603:10a6:203:9d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.21; Thu, 10 Jun
 2021 14:10:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 14:10:35 +0000
Subject: Re: [PATCH 2/2] nbd: Add new qemu:joint-allocation metadata context
To: Eric Blake <eblake@redhat.com>
Cc: Nir Soffer <nsoffer@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 libguestfs@redhat.com, qemu-block <qemu-block@nongnu.org>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20210609180118.1003774-1-eblake@redhat.com>
 <20210609180118.1003774-3-eblake@redhat.com>
 <CAMRbyyuyK5r11bxDD4Gyy8ru-RBPB_WufmSFktnXQ+G-Hxg3nw@mail.gmail.com>
 <5563d5eb-c90b-6f09-e550-3b39cd76b641@virtuozzo.com>
 <20210610134749.orq6cgyrtrjylduc@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <e136eed8-3a3f-b1c0-7d6d-d57a3123e3e0@virtuozzo.com>
Date: Thu, 10 Jun 2021 17:10:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210610134749.orq6cgyrtrjylduc@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: AM3PR05CA0153.eurprd05.prod.outlook.com
 (2603:10a6:207:3::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM3PR05CA0153.eurprd05.prod.outlook.com (2603:10a6:207:3::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Thu, 10 Jun 2021 14:10:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: baab45bc-2086-409a-5796-08d92c198470
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2451:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2451A2DB2911F40B50DDE455C1359@AM5PR0802MB2451.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fkAi9yFcav1u9ltJQ+RTfWZu6Nhd8rkA79RKIE0CGM+DndrrLCLh8APU5Z1gbRLCH23AFp7iAERbwJIUFS1vpKrci//eIcYZOEYgCimm5jdnUlCGzNZtndObkYYXAIGtcavYJ0+cgemAWGMh2Q7oQMA/vyP5gW+CUHFdoXCqQ1IhOZ3ibLPwV4mIMui6LMI7QTr/uMhiV2AEDpLqMvEgPGFH0rRNqqNRYe5PA4o+zPku/ofmkVZv5JTAfvuvL06IbDoBHGk/9CqUFPyH51E638bhOFgkwby9iKNOlj/Z1O0PFwXgBl6H1jltO9CUzh5vxqTFIzCheir+b6XDegUZnMDNsjATWqw+GU2X2U+Ae0IbTQi8tFqx6VxV0z6jlWa8VwPUG362xLqU+ggmaOuRnkOTLr4Im63xQQH0TdtiWNjnvEZbPM5E+r2wUi2h86VFUcMiNmvziq1NH6w09bRzCe9FCDzftm/ndu3IyDXo2U4Tq+K1CoWfc3gBuFg4/u8VxbxXz2atL3g+Wi/IE5Ox4QfbgdX8hOaysTIwZBjT+L3efjtkGLf4XbKp+uQwBGMIMBiHRSg+8HBzoN6lZLrk5m/aFtHNwn1sPlXC3TwIurAtkYm82wPu2tz2kw9pC4DFj/eUGa7K+JF+PzT2kE88bujsW0geSlUa9INIkg5gMfE2gFaKXnlyrhCrJVHOrpFHW2SbHhRroICLdlc3l7rUWTTHX8gm5jQrnmbdpCLn/I4j25+G2dx2QtrjwDt9JmNG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(39830400003)(136003)(376002)(66946007)(38350700002)(31686004)(38100700002)(66556008)(66476007)(186003)(6486002)(478600001)(8676002)(26005)(16576012)(2616005)(956004)(16526019)(316002)(36756003)(4326008)(31696002)(86362001)(8936002)(52116002)(5660300002)(6916009)(83380400001)(2906002)(54906003)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aVh1ZW03N3hadEw3RmFheTJKeUhzOUpadUVSenljYU43VytQNExtR28vYUtR?=
 =?utf-8?B?WFJGMUZRRWtJdEluWW9IMjFLK2g3amtTT3lLUUc3ZzQ5aXNpYlorZ0JXMGRx?=
 =?utf-8?B?dHZUQkpJS2RxRkRuZjBDSkhLUDQwNnVEMnRrV0tuTGxOTzhNUjV2alZGczV2?=
 =?utf-8?B?S1hrVldHZE5mOFhxS0plRjd3QWkyaFE0OVRNZmZRZzZoVGFJbmtJcXNpNkhh?=
 =?utf-8?B?Nkc0Q2wreVNQNGhrOStKRk1BeEpwRDBzN1F4Q2lPc1FQbHFIMGlkQjJ1NXVX?=
 =?utf-8?B?dW1EcjI3MzE1bnhMOFNORThTeXU1WkpiTVhKaGNCNDRWZTVaWTBBb1pPbnIr?=
 =?utf-8?B?Q2RjV2h0Q2RlbzBLYnY2NWhHdFl1SmkwNEY5ZUtRRXFrNUVLRWowd2wyRGNW?=
 =?utf-8?B?OWY2S0hJU045WDBsQzhSMVVVV09OV2x4c0djRmxUWTZoUVIvY0RpeFZDMUNj?=
 =?utf-8?B?T3kwNWZCMDFyNFl3cXdFclgvSmF5Mkx0UFVrdTVVZlRPUjFkOFdNRWUraFlh?=
 =?utf-8?B?YWZHMWNFeW41d3BiR1lZVks0cUVzUEZ5bDBJcnZ6eU0wWFFZT3g4VGVCSkdh?=
 =?utf-8?B?Q3NMTWFJT21aYVl3MVUxQjU2ZnZrK0JRbFd0ZUZoMndyLzgvZWYrS011RjA1?=
 =?utf-8?B?elRvRVh6ak5uSVZvVmNLTTgrZzRjbTVVQloyVWtYbnlEUGYvZTVOSmFpMjBi?=
 =?utf-8?B?eVBwblh2ZlErUWFDWFhydXpNWGJGODVDcHZtNkhOaTJiSGpicENQa0ZsZGZl?=
 =?utf-8?B?MnYxL09Ic1FWR0ViRWIwVTBTbCtnR0xybWpWUTg4Tk1seFplOXkwV2xiL0Vv?=
 =?utf-8?B?S3FLY0lOdFplZkFvUVhrOVU3eUNXamNzZ1hBZy9HdDRBRGp2bUVWU2xmU3lp?=
 =?utf-8?B?TDM3MWtGYXhZSi9jS3RSeW9lMGtFTno0dGhsUlRDTE9IcWRSTjZncDBMOHI5?=
 =?utf-8?B?UWt3R0hKNXVzQTFUalY2TG1TT1pjWW1SczQ4NFJKam13RGJTVEJoeGd3UnVt?=
 =?utf-8?B?alpmRkRmemJHZVAyc0Yxem9DYVpvMXNDSkdKTTRLTU8ydHdsZ2ZzbTZOWEhl?=
 =?utf-8?B?blg2Y2U1QlA4ZDZlWjhrVmJBUUlzOW5TTkhXS2hlaWtvOEtDaDJUM2xyR2pu?=
 =?utf-8?B?QzdlYXNVOG1xajZiQnY0ektKY2JkbENGOE9FcjlCVGgxUkg1eXR2U2paOHRU?=
 =?utf-8?B?RUhsdGVBVm9pVkx2VGFVNkhBeWZNTndDQ2RSNEd1a3Y0ais4dWJxRzZLUGdV?=
 =?utf-8?B?a21WN0FoTjN3WG10R2JnbHdoRnAwTGN2UDRpU2RYbXNvSGZuTFZtdFJNaDBu?=
 =?utf-8?B?a2lrTDZwRFUxQk8ySFRVSEprc0JMUlpzK0c3OXc5Zzljeno4Zy9tcitLZURu?=
 =?utf-8?B?VENrMFBZTWszQnBkTVh2TFVNZ1dkVnpJbU1lY2p4b0RIdHpMMEZISFl0bDE4?=
 =?utf-8?B?bGorQWg3V245RkxDSjVkTjh6SlphSDl1MHF0UnlJMEpBR08veHI3UEt0SWw1?=
 =?utf-8?B?eXlnN2o5UCthVHN5Z3BKWEFNK0JpeUxmREFveHlrK0hHRS9jTEZjTXZGV29t?=
 =?utf-8?B?SzN2ZFFBUVpYUU1kQk9MVDY4M3BHcjRaVHJURWlpQ0JTT3dmYjBXQmpHTW1z?=
 =?utf-8?B?cmxqSjBLQUpxQkhVaHVXa3kzZUdORFIxbGs3SVk1RUhtekpwWS96aHVkdWJS?=
 =?utf-8?B?VUdkZWU3TmZybjdJSlo2YktJbXdFSnhLYjJLR1JCNzRETE9RSWhHNlBKaDNC?=
 =?utf-8?Q?/b1t/QySSrP5Qay7ATJEIeu9aZYJwd779bTdHmO?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baab45bc-2086-409a-5796-08d92c198470
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 14:10:35.8470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kEXihzYLZf+j1ZWqWO2l+gBHg+BN5kvy0zAtZcnv9T0HtcT0cJNjgD82t80HOuGdW0PiCazySHpTN+3gKGnTLP8cuKqmBwlB1+Ujpri2vu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2451
Received-SPF: pass client-ip=40.107.6.131;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

10.06.2021 16:47, Eric Blake wrote:
> On Thu, Jun 10, 2021 at 03:30:17PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>>> The correct fix is for ovirt to additionally use the
>>>> qemu:allocation-depth metadata context added in 5.2: after all, the
>>>> actual determination for what is needed to recreate a qcow2 file is
>>>> not whether a cluster is sparse, but whether the allocation-depth
>>>> shows the cluster to be local.  But reproducing an image is more
>>>> efficient when handling known-zero clusters, which means that ovirt
>>>> has to track both base:allocation and qemu:allocation-depth metadata
>>>> contexts simultaneously.  While NBD_CMD_BLOCK_STATUS is just fine
>>>> sending back information for two contexts in parallel, it comes with
>>>> some bookkeeping overhead at the client side: the two contexts need
>>>> not report the same length of replies, and it involves more network
>>>> traffic.
>>
>> Aren't both context described in one reply? Or what do you mean by not the same length?
> 
> The example file demonstrates this.  We have:
> 
> base.raw    ABC-
> top.qcow2   -D0-
> guest sees  AD00
> 
> Querying base:allocation returns:
>           0       65536    3  hole,zero
>       65536       65536    0  allocated
>      131072      131072    3  hole,zero
> 
> Querying qemu:allocation-depth returns:
>           0       65536    0  unallocated
>       65536      131072    1  local
>      196608       65536    0  unallocated

Hmm right. Sorry, I forget how BLOCK_STATUS works for several contexts. I thought they are combined.

> 
> That is, the query starting at 64k returns different lengths (64k for
> base:allocation, 128k for qemu:allocation-depth), and the client has
> to process the smaller of the two regions before moving on to the next
> query.  But if the client then does a query starting at 128k, it
> either has to remember that it previously has information available
> from the earlier qemu:allocation-depth, or repeats efforts over the
> wire.

Hmm.. but if we are going to combine contexts in qemu, we face the same problem, as sources of the contexts may return information by different chunks, so we'll have to cache something, or query the same thing twice. But yes, at least we avoid doing it thought the net.

> 
> The joy of having a single metadata context return both pieces of
> information at once is that the client no longer has to do this
> cross-correlation between the differences in extent lengths of the
> parallel contexts.
> 
>>> We discussed in the past the option to expose also the dirty status of every
>>> block in the response. Again this info is available using
>>> "qemu:dirty-bitmap:xxx"
>>> but just like allocation depth and base allocation, merging the results is hard
>>> and if we could expose also the dirty bit, this can make clients life
>>> even better.
>>> In this case I'm not sure "qemu:allocation" is the best name, maybe something
>>> more generic like "qemu:extents" or "qemu:block-status" is even better.
>>>
>>
>> Oops. Could you please describe, what's the problem with parsing several context simultaneously?
> 
> There is no inherent technical problem, just extra work.  Joining the
> work at the server side is less coding effort than recoding the
> boilerplate to join the work at every single client side.  And the
> information is already present.  So we could just scrap this entire
> RFC by stating that the information is already available, and it is
> not worth qemu's effort to provide the convenience context.
> 
> Joining base:allocation and qemu:allocation-depth was easy - in fact,
> since both use bdrv_block_status under the hood, we could (and
> probably should!) merge it into a single qemu query.  But joining
> base:allocation and qemu:dirty-bitmap:FOO will be harder, at which
> point I question whether it is worth the complications.  And if you
> argue that a joint context is not worthwhile without dirty bitmap(s)
> being part of that joint context, then maybe this RFC is too complex
> to worry about, and we should just leave the cross-correlation of
> parallel contexts to be client-side, after all.
> 
> 
>>
>> This all sound to me as we are going to implement "joint" combined conexts for every useful combination of existing contexts that user wants. So, it's a kind of workaround of inconvenient protocol we have invented in the past.
>>
>> Doesn't it mean that we instead should rework, how we export several contexts? Maybe we can improve generic export of several contexts simultaneously, so that it will be convenient for the client? Than we don't need any additional combined contexts.
> 
> The NBD protocol intentionally left wiggle room for servers to report
> different extent lengths across different contexts.  But other than
> qemu, I don't know of any other NBD servers advertising alternate
> contexts.  If we think we can reasonbly restrict the NBD protocol to
> require that any server sending parallel contexts to a client MUST use
> the same extent lengths for all parallel contexts (clients still have
> to read multiple contexts, but the cross-correlation becomes easier
> because the client doesn't have to worry about length mismatches), and
> code that up in qemu, that's also something we can consider.
> 
> Or maybe even have it be an opt-in, where a client requests
> NBD_OPT_ALIGN_META_CONTEXT; if the server acknowledges that option,
> the client knows that it can request parallel NBD_OPT_SET_META_CONTEXT
> and the extents replied to each NBD_OPT_BLOCK_STATUS will be aligned;
> if the server does not acknowledge the option, then the client has the
> choice of requesting at most one meta context, or else dealing with
> unmatched extent lengths itself.

Yes, that sound good. And that will work for any combination of contexts.

Actually, when server doesn't support _ALIGN_, client's behavior may be simple ignoring of longer lengths, shrinking all replies to the minimum of returned lengths. This leads to larger network traffic and probably some extra work on server side, but client logic remains simpler and all problems are fixed if server supports _ALIGN_.

-- 
Best regards,
Vladimir

