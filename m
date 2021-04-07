Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 605E3356930
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 12:15:56 +0200 (CEST)
Received: from localhost ([::1]:44656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU5E3-0007iU-0s
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 06:15:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU5BY-0007AO-Gk; Wed, 07 Apr 2021 06:13:23 -0400
Received: from mail-vi1eur05on2112.outbound.protection.outlook.com
 ([40.107.21.112]:42880 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU5BS-0006ku-9G; Wed, 07 Apr 2021 06:13:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTNKXEfCn+Bly3xQCwk+pu4BzfYG30M8B03h2vPOn2ShNpBR4jpLDsUOYKHtVIqa0eluwN3bWEMCOwhSUwkTcbOor3xPnP5Qiyp0TG3gxY/hVCy+ooBnt9FB3o4KLJSqAXwSMWmVRo6mvQCJ1gPlqXgWSyt+9ByNi4R0SemG3PmncVOtXi1mDNBU/edVTS6P9D+nUzXt5gKhexXGLstMow3NQisFslCZsMx2FUMcC83SY8y4jd6aseyIpRp0L6KAdz5en9LMn3+hxJRrlCUXS07Px5SU59Hz5b/nDdL+3BRZ762yVWMW3/JHVDLmLo5ofZGmTWNMNA5TuuWdYinFvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWhnGo6fK+yxPt7LATBbFj6ztRfdI4h/bUpLoFSgRNI=;
 b=oXIDcBrae0ukWVIlaMDIHOoIRvQ/2wEGtlbvj0Vza/UUGwWGQTwsEDnm+JwLPdhDE05zT2B/cotPCG2WasE6GyDzh8IWhvP7l0UuySEfujYfxu+nKMwiZNe26sZIGlegBKaV2qsdVwwzawriI9e5+tzLcu30qqgAuT3+vncnCQgOcZa5YITMTC0UiKEPfxY6WvRYZQRWS6FDy/7f42E5umK8hPerBZJzkc0XzeQPVuTgCm7uJbK9AsU5PtBHowASlnKQV6H8HFGk0TRXQdmmB8yVGUuLEOFrmyJ6AcCllDo9fQ0FSrP3qHEe5zte/dSgIZrCeTeBuvLvuINFfQKVjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWhnGo6fK+yxPt7LATBbFj6ztRfdI4h/bUpLoFSgRNI=;
 b=m/pDWCAhcTSR0KbAuRWKMIrH98KAZK1hlCHIiaHBkX7OwMYvKrD+DvF4+iAoqbArOtIez5C68HNsMtTYZOHDq71bnnHwjeRdrAcYVFNWd+pYoUGCqjA4Va9V1tvVACLOlmEFgPu09bIGGzK1M6H/IZ0/ugmT4WuG04HAR9tE7H4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3541.eurprd08.prod.outlook.com (2603:10a6:20b:51::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Wed, 7 Apr
 2021 10:13:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Wed, 7 Apr 2021
 10:13:10 +0000
Subject: Re: [PATCH 0/7] block/nbd: decouple reconnect from drain
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org,
 yc-core@yandex-team.ru, Eric Blake <eblake@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
References: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
 <2066b4a5-7a6b-1810-2522-9118540ae4a9@virtuozzo.com>
 <YG1jMSzW4uySSOyR@rvkaganb.lan>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <be0d4446-61ca-cb44-2205-62255e12abe4@virtuozzo.com>
Date: Wed, 7 Apr 2021 13:13:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <YG1jMSzW4uySSOyR@rvkaganb.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: ZR0P278CA0015.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.206) by
 ZR0P278CA0015.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:16::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 10:13:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62432766-4b37-4134-c17b-08d8f9adbe9a
X-MS-TrafficTypeDiagnostic: AM6PR08MB3541:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3541D73DFF53F69A21D5650FC1759@AM6PR08MB3541.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OYkIDMdgxZxCn2c6hvwLFY98K02Xk1rws9qDpAeO2N+j4Vhhywz4pO4gfvTUWa+ZvJg665CiCJtq1VFCN/IyTWeXY6JwMFhDcRmB3HzM/EWOmz7nmOaqg/GpH99EDy/t2aeFwsVDum4J8kWriPcIfmSSsxZ3urgZNAF1mcLaheisbMev1Tbs87gye5tsm5v+mHGRV58a30C/HMvbcmm5uZe4CNSmDN6ZRb2XcLm2spevCshW04It3fC1NGow5KUm/eW1/ki5ZE+AevomgmhmgBRvQih88Uu4f+0jhq3eQHhZxtigAHfThrzJzYwDx0xroVL3qSYi53mCPvEpl+q2umJTnmxl3vj3fR/c4jQFzR5l8a0SAwf2BY9S7L5TKxDvnlT6wJI6rLqL3fwwsO1hU6NCR5T0/nrvaZUuGdzne0RTvNHimGsNxlS5mo/ksDbdmN4G260uR5pFz/Q/nUqkgCbSR3b+KDuTHxSyr/KPllkJ8uMDTTdneY8BHEZW7hffazsNbqS07h/u1vEzI9f1+hXBXNFhlTW5qojdXuEtVHwCQoLu0btn+opJIqeprewGkO/JkzllA7t7c8eUiGXBfup6UmILw+JM3zeN1PEhad65Qi4PLs6o5TTs7IFxxbHR5I92+m0xOj3WVifpqsO0eNPoMLTZnhm9C2GYQjjxHL8r2GsUIcSJDG8bNPwzv+WIeFxKIzEZlTAmDjy8L0KkgQvcfB8K4q5BYhbzEyBbFUPEm8Kuvjke+gIBDaIsLCXu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(136003)(39840400004)(366004)(2906002)(6486002)(16576012)(66946007)(66476007)(66556008)(186003)(110136005)(38350700001)(26005)(38100700001)(16526019)(36756003)(86362001)(8936002)(31686004)(2616005)(83380400001)(956004)(478600001)(8676002)(52116002)(31696002)(5660300002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MlUrZHFxc3FBSlp1TmNBeHJwQ1JZend0NGp5cnhwQXpHKy83MXdIZW1FVkly?=
 =?utf-8?B?bVY2RU0rR3hGWm1aUHJFUk9rY2VVYmdESFJldjhsaGNtdmN0SjhGVGp6ekN5?=
 =?utf-8?B?WDcyMmZuNFhhOERsK0NLM1Nxa1FrNTk5NW15NHAzTXJzc2xHREdZK2diL01k?=
 =?utf-8?B?U2xGbUF6eWRDdDI0WFZqT2J1NzMrV3dnOEJqTXFkS1ZHVEl3VDQveHRWL0lF?=
 =?utf-8?B?dG9hM0wzUEQxRG13MTNQUHZldUtLWnJMQUxaUUNjMmN5YkJWTElkTHZXT1VT?=
 =?utf-8?B?WHprQWlXVW00Y0VFVXVVc3dPVURkbWU1bjBaTm1WaXBDUEgxV25wa1BicVVU?=
 =?utf-8?B?S1RYVUowak0zb0EwTGNxei9sSUtTZ2U3QXV0YkJ1b1VDUVNPNTBvNlRNR09R?=
 =?utf-8?B?SXpkcm50ZEFrTThaaVROMVhqN3RXbWN4cjNvNU1TYzZXbHgzNjVFQlh1MTZk?=
 =?utf-8?B?eXZ4R3dmeWtwNEM1aERpR0xNQml6NWdManN3UEFwQzFtNHRvWXVlN2pYSnhC?=
 =?utf-8?B?QXJDWFBwTkhTL2Q1d29rUUZVNUhWZkVqN1B3VmdyZ25GQ2hsQzNFY0p1YWVo?=
 =?utf-8?B?ajRRWGp5Q3VZb2F2TWdGcjIvRHNiZ3ZkT0J2MHdBQ2lrREhqQzl3UjNtU0lJ?=
 =?utf-8?B?eTVaV2JQWE8wOWpjYUFsNXNtNWZpdlU3MmhWZm5Qb2ZOMi9TUlJCMGlLSDZk?=
 =?utf-8?B?cDlWRFJ0QVB4QXU5UWZKWitBbUpFSG12dGVpRHVvSTF0dTJBWU00KzJLaHli?=
 =?utf-8?B?NlR1dk55V0t2c2VqMk03SXhkczBDRG1YK0t3U2dKVk1mTEdmK1dLR1hoV2xI?=
 =?utf-8?B?bmdHRlFPdWc3aXh0UnIvQVJMUi9YNlFQVDRVbEpjWHMwZnk4dEd3VkpsVlJ6?=
 =?utf-8?B?OWNibXpOeHEwcjRZWk02b20xdkVNS1FPaVRsOCtBMmgwQk1aTXU0Smh0blRK?=
 =?utf-8?B?aDNwYTNReTRObXl3OHR4cGZNUjF3ejYxUkhUOTAwck14M1RlejZJRjdZV1VL?=
 =?utf-8?B?N1ZNWUROemd6TE01VVFQQzNRcGl1RllDWHQ3ZG0xanFHc2dRRDZpemp1eXAz?=
 =?utf-8?B?NTRnb0Q2WXNrZzJEV2FKSzNPcGxWQjRIRlpyYUVvMUErTndFL0Zzb3JwK05B?=
 =?utf-8?B?b2k1Zm12SFMxM1ljVThUMDk3YUF5N05nSitvTUx0L2pGeVhFME5taU50TFVa?=
 =?utf-8?B?S0kybFA5dGFHcEJyQ1Y5WjM1TmVWUXJRZGVPSmozRU5tNXhJd0Y2Q0Z1YU9C?=
 =?utf-8?B?NEY2ZnA2a1R5Z1NQNjJVcGZIV1VGYW01NHFPN3NBVDFJbk5ac2JZZlFKTzNx?=
 =?utf-8?B?clpXamNKb04wSUxNQnVNMXgxemNST09IblZRRFBUV2gzazhXeXFHZkE5VXlR?=
 =?utf-8?B?SXcwU0c2QTNxVnRoMFMrNU1DOVlETEhveE9iMHNod015dEFGMnNRZ3pUTkRu?=
 =?utf-8?B?QVNKL3NlUDR0TE9RZHdEeGEyZ3Rxc1U5cG03QjVDRmNOamhYOTFGSUdydTln?=
 =?utf-8?B?dUdqZWhBbWFuRjB6VWJ6TEFMa3BzUWtia1ZQYmhoZzBLTjAwQ2x0bVZtU0pC?=
 =?utf-8?B?US9LdThXUVNJN0taS1hDR1BkOW9IYjhOQWFnZ29vODh4NWdtNE14cUVZb3Fo?=
 =?utf-8?B?aWYyM2dmbTYxQ3N4NmJVVFYwdzlsa2ErVG9rejRiWGxUV1JhTUd1dFR6MFpr?=
 =?utf-8?B?SmtmRU9UUWNGTXdqNEd3OE5rWlZWbmJKOXBENThURWNOZ1JLaU1CS2t6Kzda?=
 =?utf-8?Q?31BUEnozkph2lU1xPEQfQNOHQdXPzK9Yzg2qiW0?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62432766-4b37-4134-c17b-08d8f9adbe9a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 10:13:09.9050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N1RsWEoZkR9MYsLJR8+k72gnU7MvdUiy/mLtKYDoA5jqfkTSqCxORcqm7H4OIk4eYDeDaHEC+pCNdktpLPtFTEQcHbwtziY38nGVJvjezUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3541
Received-SPF: pass client-ip=40.107.21.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

07.04.2021 10:45, Roman Kagan wrote:
> On Wed, Mar 17, 2021 at 11:35:31AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> 15.03.2021 09:06, Roman Kagan wrote:
>>> The reconnection logic doesn't need to stop while in a drained section.
>>> Moreover it has to be active during the drained section, as the requests
>>> that were caught in-flight with the connection to the server broken can
>>> only usefully get drained if the connection is restored.  Otherwise such
>>> requests can only either stall resulting in a deadlock (before
>>> 8c517de24a), or be aborted defeating the purpose of the reconnection
>>> machinery (after 8c517de24a).
>>>
>>> This series aims to just stop messing with the drained section in the
>>> reconnection code.
>>>
>>> While doing so it undoes the effect of 5ad81b4946 ("nbd: Restrict
>>> connection_co reentrance"); as I've missed the point of that commit I'd
>>> appreciate more scrutiny in this area.
>>>
>>> Roman Kagan (7):
>>>     block/nbd: avoid touching freed connect_thread
>>>     block/nbd: use uniformly nbd_client_connecting_wait
>>>     block/nbd: assert attach/detach runs in the proper context
>>>     block/nbd: transfer reconnection stuff across aio_context switch
>>>     block/nbd: better document a case in nbd_co_establish_connection
>>>     block/nbd: decouple reconnect from drain
>>>     block/nbd: stop manipulating in_flight counter
>>>
>>>    block/nbd.c  | 191 +++++++++++++++++++++++----------------------------
>>>    nbd/client.c |   2 -
>>>    2 files changed, 86 insertions(+), 107 deletions(-)
>>>
>>
>>
>> Hmm. The huge source of problems for this series is weird logic around
>> drain and aio context switch in NBD driver.
>>
>> Why do we have all these too complicated logic with abuse of in_flight
>> counter in NBD? The answer is connection_co. NBD differs from other
>> drivers, it has a coroutine independent of request coroutines. And we
>> have to move this coroutine carefully to new aio context. We can't
>> just enter it from the new context, we want to be sure that
>> connection_co is in one of yield points that supports reentering.
>>
>> I have an idea of how to avoid this thing: drop connection_co at all.
>>
>> 1. nbd negotiation goes to connection thread and becomes independent
>> of any aio context.
>>
>> 2. waiting for server reply goes to request code. So, instead of
>> reading the replay from socket always in connection_co, we read in the
>> request coroutine, after sending the request. We'll need a CoMutex for
>> it (as only one request coroutine should read from socket), and be
>> prepared to coming reply is not for _this_ request (in this case we
>> should wake another request and continue read from socket).
> 
> The problem with this approach is that it would change the reconnect
> behavior.
> 
> Currently connection_co purpose is three-fold:
> 
> 1) receive the header of the server response, identify the request it
>     pertains to, and wake the resective request coroutine
> 
> 2) take on the responsibility to reestablish the connection when it's
>     lost
> 
> 3) monitor the idle connection and initiate the reconnect as soon as the
>     connection is lost
> 
> Points 1 and 2 can be moved to the request coroutines indeed.  However I
> don't see how to do 3 without an extra ever-running coroutine.
> Sacrificing it would mean that a connection loss wouldn't be noticed and
> the recovery wouldn't be attempted until a request arrived.
> 
> This change looks to me like a degradation compared to the current
> state.
> 

For 3 we can check the connection by timeout:

  - getsockopt( .. SO_ERROR .. ), which could be done from bs aio context, or even from reconnect-thread context

  - or, we can create a PING request: just use some request with parameters for which we are sure that NBD server should do no action but report some expected error. We can create such request by timeout when there no more requests, just to check that connection still works.

Note, that neither of this (and nor current [3] which is just endless read from socket) will work only with keep-alive set, which is not by default for now.

Anyway I think first step is splitting connect-thread out of nbd.c which is overcomplicated now, I'm going to send a refactoring series for this.

-- 
Best regards,
Vladimir

