Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FC02DC22C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 15:31:19 +0100 (CET)
Received: from localhost ([::1]:39542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpXpm-0007F5-3L
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 09:31:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpXkn-0004Xl-33; Wed, 16 Dec 2020 09:26:09 -0500
Received: from mail-eopbgr130103.outbound.protection.outlook.com
 ([40.107.13.103]:63106 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpXkg-00038y-Sx; Wed, 16 Dec 2020 09:26:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UuC61wwn78sfcqV7oJyIfe0n4PQnS4/vKvBkuDvEM8n5bTDpTk6aV43wr115ZQCZYjEegSLPLXJ/aTezisQ0dHYovZ/4qnE+shtFUL9h0W9M0/nUGUr/OS1FFswlBMiVQ9leLzm7Kor43K1blMTTLJpxAh6Le0x+0fxhZlXjo2RSr1XgGkqG7VzEQ42BeSNVFq+cyu94pkTN61sqWmbljzPrQNGlr+S+K3q6wxjSr00kn27kl/Nj4wfKmS6ASuMZV7waVmYO3//fe668et7C1flWWqQ/aTVHElGQZjDbnF21oVu22goBDUXHPSrF0JGRrqxRe7hCh+Iv1dqaxhivxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6JdyKHGgZ08vciOxk5cg7FF8wguRZZgRBF9Ne7PZN0=;
 b=EyqQ7MJ5OvfyXDjRKzFX6QIu3cMQQ7ClrfBl13BpMkrJFpCH1MA8dXjMx6KVwl32O/rj/RAakgYnXGewdN34OHgUyGe4St4f7jZGySCoIRISeD00oWpK77xwI8vbcs3OqOMZdCvxWwf5xaO31lio81Wd4k9UP1N7Qk5qZqxSyPP7utQyC7B8wIBVR0XX3anYfBf32wopvO/ZH85n6v4C82etOn6yBaHbPJFRUPMjQ2FkeXY3v0PPQcks9ouzLPqiD43DIN0NEF15krM0pBwvqDHXTmZbeo+iBXjw5GFe8Wnw+m4hh8XegRG7u4g6O6uwTLgNGE+nmSmnPQz3ZpahJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6JdyKHGgZ08vciOxk5cg7FF8wguRZZgRBF9Ne7PZN0=;
 b=ZK1/Ge2GaxRZqN2XCfFa22ogVBiLxs4TzNvlhFXlrpPZwBCd9UoSqxOBiWtFMMUmTZL4nYxh/zG9z/ENaFU5TPuBhyY52IScHVXW/aRK04rh2BxnB6Rplh9Xg5AP4h+tf2Daz88QpWFGhnKzJu/IYBmQXJy4qROpIXhcPB4/rgY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3381.eurprd08.prod.outlook.com (2603:10a6:20b:43::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.24; Wed, 16 Dec
 2020 14:25:58 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.024; Wed, 16 Dec 2020
 14:25:58 +0000
Subject: Re: [PATCH] block: report errno when flock fcntl fails
To: Kevin Wolf <kwolf@redhat.com>, David Edmondson <dme@dme.org>
References: <20201215190127.1765595-1-david.edmondson@oracle.com>
 <20201216112940.GB7548@merkur.fritz.box>
 <cunwnxit1yn.fsf@zarquon.hh.sledj.net>
 <20201216115746.GC7548@merkur.fritz.box>
 <cuntusluch1.fsf@zarquon.hh.sledj.net>
 <20201216135350.GE7548@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <0b5e2f7e-827d-7f6c-ae2d-c4afea0895a8@virtuozzo.com>
Date: Wed, 16 Dec 2020 17:25:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <20201216135350.GE7548@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM0PR05CA0076.eurprd05.prod.outlook.com
 (2603:10a6:208:136::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.92) by
 AM0PR05CA0076.eurprd05.prod.outlook.com (2603:10a6:208:136::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 16 Dec 2020 14:25:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ce992d6-8c49-45df-5e33-08d8a1ce818d
X-MS-TrafficTypeDiagnostic: AM6PR08MB3381:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3381AC4F929523ACF54E5C8BC1C50@AM6PR08MB3381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kmaaD7Crv80BSWyaoqTn4fBMQCGybW8nF0onyk2MD2DgrHJs5plLh3lrU0D+50LHaaUcs0AqPCt2PXqk1zWIQNgoUGbHSDt0k6lT3UWcRfh7s964mxjayPpC4CMnt39z9L51RcpDMflDJuGPwhSTC8oG49poBnss6R5sNwQBCPnoBQjriDep2jTUmVzLy6eeHHpEpyB9ypi8/aowryz9KU6oubsRqoPwiZUnvRED1oYASyrPWDDEQVYw0TOwiaimK05LYW9LCPRunavxAoxcZEkHZON7ZnU+tcWOlEXIJso4WGt614v/ZNMP+qwbBp4EcOHhenELjb07fxzhrtsVvd2rZ4TjZqxqN5qxnTCum1uydRqWeJIvndiv/TG9+8A/0CFjmgOJeZzq8nC3KFdXBtuNzd82SPdSrwNPeFhDAeI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(346002)(39840400004)(136003)(956004)(8676002)(16526019)(2616005)(26005)(66476007)(66556008)(8936002)(5660300002)(4001150100001)(16576012)(66946007)(52116002)(316002)(83380400001)(2906002)(478600001)(86362001)(36756003)(6486002)(186003)(4326008)(31686004)(31696002)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SnBNQlpmNmFqb3gvRmJyeHVmMEZpNWhRL3hGS0YxWjM1ejcyYTZvMUFjUEtO?=
 =?utf-8?B?b1RDYnZTUFlHN1pGN28xTTUxUE9aalJQd0lmZmtKZXNaSmlUR3BLRWNzYUpr?=
 =?utf-8?B?ZnRBeG1EdVpiQURQSVNwR2xPL1lwNWhGVmRRaHVtQ2JBbUJNSEk5Y2paMUdV?=
 =?utf-8?B?OUtPekMzSkFjOVVCczZRUXNNeUhhcXhyUGpQdzJZYU1jWUFBYk1SUzJ3M3Jm?=
 =?utf-8?B?dlI4c3Z3R2wycWxYOHJLVkkyckJ6VGY4eTRSdGp2UHlQc003K29rZUZISUxR?=
 =?utf-8?B?QXNZcHBRUFc0Q1hZNWQ4dGV0UW1TSmV1Yy91U0ZOWnVXbmpFRml2YjhJRytN?=
 =?utf-8?B?YllnV3RSNUVyelR5cmMrTldLVEpkREZ4OUh4UlRXcnVyalJrVEEyby9vRmQz?=
 =?utf-8?B?TVh4ZDhOMVFLaE85SXRsZnJKcGljS29UNUZCWFYzeWtwTmlqOUYvMGpKUm1w?=
 =?utf-8?B?U0JKR2pCZ0srNFdaanNDNGhMTjIxdjBYWjRMZ1g4S3d2S1ZmZjducG9SRk5X?=
 =?utf-8?B?QkxtMkJ3Z2lEbWttUVMvY2VqbnRoM05RVzVLcFFCbitqNk1wZ2V1bmVVQ0th?=
 =?utf-8?B?TUMwQWZiTVlyWXd5ZFh1aGw1cDN2aVloSWNZbVpVR0VCRFBwd1FWV09zalhj?=
 =?utf-8?B?T3BxNFBHZEVjMU94RE42bXNDL0NCVXkzWnYramdOUU1ySXVONzB6Uy9melJZ?=
 =?utf-8?B?dFZxRVpOVW1vdDlHYXN6WXduQUxvVFpYb3FrOTVNei9zUVZJUHhZVEU5RWxN?=
 =?utf-8?B?TnVvNVZtYXJVRVZzbVh0QmdRQVczck9maHArclZzOWI1N3JzdjM4cFpxNk1j?=
 =?utf-8?B?MnpRMWcrRWVJcVRpcWYxUmJVMjFRdGRmdFpqdm5kaUlmNFRrNXo1Z3hrdVE5?=
 =?utf-8?B?cWlTeXd4M3RUb0JYOFpSZndFU2NQakJGNGdQVTk2TWZ0ci9hTnM3TFhGZEV6?=
 =?utf-8?B?Y1V4cUVqWGNEK0dta21RbjlCelFKbFF5anV3cGpjZGZyVlNKZ0pqKzcwdE5v?=
 =?utf-8?B?eForb3N6OU5tTC8rSUF3S1NHYTcxR0MvQmJQRDc5Uk9VRkJBNzRvNFF3YW5E?=
 =?utf-8?B?OHFuTG44ZjdGMXgwVGJrMmMyVHM0MTJNb2hpSjRFd3RMYTNDaXZkSEI0b2di?=
 =?utf-8?B?bEdlcWVBS09JVG5wYld5cTZsY1ZuQTUyMkloc2hqTCtnY1doV21UUzRjd1ds?=
 =?utf-8?B?Y2J4UEdKRzZDOTV0QlpPZ0R5bi9NZmpwZEY0emxLenJpVUl1Q0hwUDliV0xN?=
 =?utf-8?B?RkdGSnQzUjhMVExQOTZVSjQ2WDJvMmpRcFVOODU4L2lDVFRWN3JObUJ3RHZY?=
 =?utf-8?Q?+1IYXLFI4ixZYkyw7LETeB2F3ZaqQmypQv?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 14:25:58.0740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce992d6-8c49-45df-5e33-08d8a1ce818d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8EWRKBjunUbkw8uNOkO/JUfKic17YOaglDPgR7/2H+DXwhyFv4O9ly7gXvbcKZ21PNkUzy7AfhXuCEWuLjWBp4p9wkWoVYC5V8uCTFP7HJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3381
Received-SPF: pass client-ip=40.107.13.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

16.12.2020 16:53, Kevin Wolf wrote:
> Am 16.12.2020 um 14:06 hat David Edmondson geschrieben:
>> On Wednesday, 2020-12-16 at 12:57:46 +01, Kevin Wolf wrote:
>>
>>> Am 16.12.2020 um 12:38 hat David Edmondson geschrieben:
>>>> On Wednesday, 2020-12-16 at 12:29:40 +01, Kevin Wolf wrote:
>>>>
>>>>> Am 15.12.2020 um 20:01 hat David Edmondson geschrieben:
>>>>>> When a call to fcntl(2) for the purpose of manipulating file locks
>>>>>> fails, report the error returned by fcntl.
>>>>>>
>>>>>> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
>>>>>
>>>>> Is appending "Resource temporarily unavailable" in the common case (a
>>>>> file locked by another process) actually an improvement for the message
>>>>> or more confusing? It would be good to mention the motivation for the
>>>>> change in the commit message.
>>>>
>>>> Distinguishing between the common case and others is at least a start
>>>> when trying to figure out why it failed. We have potentially useful
>>>> information to assist in diagnosis, why throw it away?
>>>
>>> I agree in principle, just when I saw the result, it felt more confusing
>>> than helpful. Maybe the best option would be to include the errno only
>>> if it's different from EAGAIN? Then the qemu-iotests reference output
>>> would probably stay unchanged, too.
>>
>> This is a pretty low-level error report even today - unless you
>> understand the implementation then it doesn't shout "the file is being
>> shared".
> 
> Hm, certainly true for raw_apply_lock_bytes(), which shouldn't normally
> fail, so I agree that we don't need to simplify messages there.
> 
>  From raw_check_lock_bytes(), you get messages like 'Failed to get
> "write" lock', which I think is fairly obvious? I'm not saying that it's
> perfect and couldn't be improved, of course, but it doesn't feel
> horrible.
> 
>> Given that, I don't see any value in eliding the EAGAIN message, as I
>> have to know that the lack of the errno string means that it was EAGAIN,
>> meaning that another process holds a lock.
> 
> When you debug an error, you'll look at the code anyway. And a normal
> user won't know what EAGAIN or "Resource temporarily unavailable" means
> even if it's displayed. Temporarily sounds more like it will go away by
> itself, not that I have to shut down a different process first.
> 
> I wonder if anyone else has an opinion on this? If people think that
> displaying it is preferable or it doesn't matter much, we can add it
> despite my concerns.
> 

[a bit offtopic, but related]

I think, there are two kinds of errors:

1. Simple errors, when user (or in our case, most probably some vm management tool developer) understand the error, understand what he is doing wrong and don't report the problem to Qemu developers.

These errors should look well, do not contain information which may confuse the user.

2. Errors that should not happen. Often the reason is some bug, sometimes, it's actually type [1] error, but user didn't understand what's going wrong.. These errors are reported to Qemu developers..

For these errors it doesn't matter how they look for the user, user doesn't understand what's going on anyway. These errors should contain as much information as possible..


And it's a pity, that in pursuit of well-formed error messages for [1], we loose information, and have to deal with well-formed, but not informative error messages, wasting time on debugging.

Even such simple thing like determine, from what line of code the error comes not always obvious, due to different reasons.

I'd prefer that error message always contain the call-stack with a function parameters, not saying about errno :)

-- 
Best regards,
Vladimir

