Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 669C6387579
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:47:46 +0200 (CEST)
Received: from localhost ([::1]:58124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwKH-0006vN-AT
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1livtg-0003b9-FT; Tue, 18 May 2021 05:20:16 -0400
Received: from mail-eopbgr150099.outbound.protection.outlook.com
 ([40.107.15.99]:60068 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1livtc-0003R5-3z; Tue, 18 May 2021 05:20:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SU0K/2lnj5XTRazehSJcStVLnroq4RPaE9tZNktKb591K4PI33A/o+bd7vs3CglklwnYSluoXhdjXmDRli0t9KTcf1BB2DL+/NlXUJFhpiON1/w+9PJ8GHCckffhIDT4KB6AK239/odJFt/TfsYvoOUq3iGMUyS3icvmcutOXU0Ic5dfiXWPNoDz0I5KTTbCima8rDVxJB8C5j0+DXoYF1AQl1nyel/5TzpIZxO1Hx5hvyAFzDfGrvNECx+Rl0EzSMJz2A8kntIO0GYwUrvrsgxgaa5Nj6U4Tz7GFLxGBaweSFcnvOh7fV6lKL0ZGpwjo6r8l38XUahFMlCStZHiQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jUMjXxJoQK+/uvLfzT+WIpeSatVUe6aQiACdRBWLnnA=;
 b=FhV07cb9TloDVkJjd6+0Qzi8eg2rN76Ujtl+zrHSLtHa64km+BmJ754L9L7jlXl71zSpqLVgjhXyBnDiI90wjy01Ym6AGz9BxQztMX3CxBScc6qxav06O8W64Wiap5EstIcbnNQhZEJNCViffZwexdj6Bg8L4auRjg/bZIiVzJ4boL4Nh5495GkIO5Db5gbK0k+g3AUgERMg+tfOpjN7NMLviF0v4FUY+n/dGrWzUCB5+QTfUAD/zNx5g2lHKOpGXZyI2FrLJQr8xKV8omVBgtyY4EL7f10rtXCT6/WGYMYVUmxyIqMqg1MKMNNsqXzN3x5/N9jw15c79jezBH8FHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jUMjXxJoQK+/uvLfzT+WIpeSatVUe6aQiACdRBWLnnA=;
 b=OtF4K1OJo3VRl+EMFYJQNOHJz9yaE/JX/ahqKN8QcGhxCOZT1C/qujMj8SGMcTLYyl7aZ0854aCmK38+dE1T+Hoi/zBwLz+WvVRTIFjV1k7VgQc/U4Wmd0t9XJBYASYK2hewETOSmbGNkroqSd7f4bNDGp5j2liOz4Ye+ZR92+4=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3864.eurprd08.prod.outlook.com (2603:10a6:20b:8e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Tue, 18 May
 2021 09:20:04 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 09:20:04 +0000
Subject: Re: [PATCH 04/21] qdev: allow setting drive property for realized
 device
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 jsnow@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
 <20210517064428.16223-6-vsementsov@virtuozzo.com>
 <90135147-4b08-3af2-cfde-aaa3dd397c17@redhat.com>
 <c0c45ac4-46a1-bf33-f563-634a7fd5670a@virtuozzo.com>
 <58f8166b-88f0-b300-71a1-ff7b20a339e5@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c964c750-6a8e-19be-d4b0-9a9616f9bded@virtuozzo.com>
Date: Tue, 18 May 2021 12:20:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <58f8166b-88f0-b300-71a1-ff7b20a339e5@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.199]
X-ClientProxiedBy: ZR0P278CA0086.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.199) by
 ZR0P278CA0086.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:22::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 18 May 2021 09:20:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d647c4ee-be80-4c3f-d3d7-08d919de1ee1
X-MS-TrafficTypeDiagnostic: AM6PR08MB3864:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB38640C35F1F6973A9EFC774CC12C9@AM6PR08MB3864.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O0mvmgWiDRI/6xhkgF0sw9s/jTk4ZM/LM9diX+T2zRSl8zVndWwBWhnZR2lwUyQjZBFAH/AuJFMGm86F2jC5wT+w0xzF8Xx454lo5gkO+m1mUrzgZbqS+/zbhFOhU1MiNoDdV9yBOMcaXR82NOM//RLuJhIw+IM96ucbwcC+mRPFtboYvc9yunVl6Mf+Hs195urJUhxoSaDvwxV6KubHXA29olrHODVmapJvpBEGhiBsGjKiQ3UMNWorzHuPRxGaKPq0D8eMWJkoxa21ZNnAFTZS7oWYGJfcOruR6DUUieVRndtPVXoY/LE0STa8PWZS0CpGrkYYKxLQBGtMsTtBjTxR47SK1ytD8uj2C9NT3cYZGmIbxggY+fxA6wobRxbgS0vJnJliv25g9mvcvNveFclVNoKAp05OwAismuoqXFVqPQshquM8wVqQ0zuYVWg0/zKUmvSwGtWXKUHsw5pe2sh88cBPn3V/Q/wZqzo2rXhh0Tui1kCi/GNO9HIE96Sl28whU6MDdqSuPtc+Vb3SDJvDbHZnUGYXBnrjx6AlElnsKaH8FWUklwOl+7S3OEYTohH7JArpE5uS9xsCB9rl9hjT8feOSx/iMwLua77NsRFP7kkvJlWpIw1qmhYOWWKs4zXwExX1Fo6nDIC5D+ClDpeyZYbLKIULy0h7fuM7UADC03qCL9cmmA+U/lfx0g0huqwEraojuAmetIzBT5S6ACwnnzKNVehb8QCQQ3nNXCE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(136003)(396003)(39850400004)(8936002)(66556008)(53546011)(16526019)(186003)(4326008)(956004)(66946007)(478600001)(7416002)(66476007)(36756003)(107886003)(83380400001)(31696002)(86362001)(38350700002)(2906002)(31686004)(38100700002)(6486002)(8676002)(2616005)(16576012)(5660300002)(52116002)(316002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TE9EQUJERkU4YXdRVzZ4VnFWek9YRlJvdVFDOW45aDVMQ3lmY1h0Nm5JQU1L?=
 =?utf-8?B?MkYyKzlTRTZTZWlWS1o1WHh0WjN0WlhIV1o4dHJ0VDJtaFJQb1dTekJuVU1I?=
 =?utf-8?B?cUlYanJvT25iWXp3RU5wYXVpYWp4L2MzcGRpeFdKK2NUUzlhTC9UYTRYOGNl?=
 =?utf-8?B?NkhRNnUxeHJTaTRKQzJFRWRUbzAzbzhDVk9wRWJXZk5XdjZmbkxTOTNVb1c5?=
 =?utf-8?B?Slh2VVN0VFd5ZE1FTmVZWk1lZjVkSWJGVmdQcUltblB2d2RTNFQ5eE8zbWUz?=
 =?utf-8?B?TENWSmo1RzJzcXVJaElDWnRPRCs1ejBQRkdTRS9rNHltQmpoTHR1TzA4V3I2?=
 =?utf-8?B?Tk13K3VIYU4rQUJZdTZtM2t4L3JFZlpvanIzc0NFb3VaZWZTWGUrVC82RHpS?=
 =?utf-8?B?emlBMTBobTJTcUlXcndXV0xnOHh5OW9mdVRtbzZHVXBveWFFdFpQQ1h0T1JI?=
 =?utf-8?B?dXdDejlyQXU4ZzJtdklTNGNpc1hBR0VDQVM5c0t6a25NK1hxUTlXcWh5T0ZO?=
 =?utf-8?B?YUdkQ0xCbU5MeGRLc3lNR2VPa1hETmwvSzNPUGkvSUNYWnI5WmtnTXdFRWNT?=
 =?utf-8?B?QmlQY2pha2ovS2JHVVhZelpGY2R0d2d3S01DNXBMcTFvU2R1SG03bjJ5bkx0?=
 =?utf-8?B?NzEwK3hJZkJIR053cEhmVE51NDR2V3hPem5sbCsyb0Z3NXZDbjRKQU9leFNH?=
 =?utf-8?B?VEVIWktrK0c3U0dJTXRLblpCcjcxbi9Fd1F1TlVWYXQwSGc4cFdheW5XT2No?=
 =?utf-8?B?ZWR1RVllRDQvSkNlbUVReENxQUl6UVhPcDI5WnJ1TC9vb3lpVzVyZkovcDB2?=
 =?utf-8?B?TTQwSlRFMEIyRGh0VERvbVRrcFdRVmZibGlnNmxORUQ2QXZ0dzE2Mk91b2o0?=
 =?utf-8?B?N1A1VWxCT2hzYlBJSSsrYnRueEQxc0J6dU16RWRGWXYycTd6K3pqZ2d4UU9t?=
 =?utf-8?B?enNuaU1lS3UyOUMzcGZBNWlvQmxQUzJ4Y0JaWmVTemNqM0s1OTQrWC91bW5p?=
 =?utf-8?B?bVdudzFBdCs3dis0aGpZT3F5MWRXNmlnUklvUDRiaHlobnczYkF4WXRQMnJM?=
 =?utf-8?B?aDJMN3A1SHh0TTdoYTExemVxUW9ZOVNwODNtWEYwdDh6V3FScW9kY3lSWXJQ?=
 =?utf-8?B?Z0lhbDE2RlVtMmxuWEJnbVdHM2YreHlNVy9uZUN1MkpJUlVPaC9GQUpzUmFh?=
 =?utf-8?B?RS84b0lKYnFWa3Ivak1Wc0pGVnpPOGhQaTIxRkxWYmxsUkpWVXFKUjFHcHB2?=
 =?utf-8?B?UFFzZFJKeEZQS29TTWZRbEFZdWswbkFDMXN5dUNoMVU4UGl1VGRwRDhSTHhi?=
 =?utf-8?B?Q3I4QlFyU0tjdGw4WkpNWFFLdzg2M2ZjQlJ3eU81ZGRjbUdqMnZCWDZkaERl?=
 =?utf-8?B?THlQSURHSjFLNWt3UXB1Z3Q4QXpQQjV5RzBzMmZpRHpuaFhpalh1Qk1KaGxv?=
 =?utf-8?B?TzdYUThZZE1MRlp2M3VJVkQ1Sk5ldDRiRXlnN1p3NWVUUS9STW9Ha2MvdVJQ?=
 =?utf-8?B?NVZnQnhVaStvc2QwOFp4T0cwQVhUYTBDRy95dUh5VkFJaExST2JSM0d4Q1Zz?=
 =?utf-8?B?N2lwMlpybmhRS0xQK0tMdDZhTzgrdThicFprN0FLWlUydFpoZzdrWkdiVmtB?=
 =?utf-8?B?OWVhQmgwQTI3a1RneTk1Q3AvdjBtQUNtUCswRk5tK05ySmZDdEhqS25GcDk2?=
 =?utf-8?B?QjdpSU9jOWVucjVJeEZvYmJ1MWNCUUt1bFF6ajBsQ08zcDM2THRWeUJidkEy?=
 =?utf-8?Q?HanzQTE49Sz0pr/7Rbr40kmjUiVN/NSU3EABX+i?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d647c4ee-be80-4c3f-d3d7-08d919de1ee1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 09:20:04.1853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: puaKLzXyloA5/JVgNyAHJWTzSkyV9Idg8BQTUzeX952MO+49owsIWzbrsmvEko2TKVZBYTRQ9MDyUbUmp01GSvKa6kqwqnqGgAh22IgECw4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3864
Received-SPF: pass client-ip=40.107.15.99;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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

18.05.2021 12:09, Max Reitz wrote:
> On 17.05.21 20:09, Vladimir Sementsov-Ogievskiy wrote:
>> 17.05.2021 18:48, Max Reitz wrote:
>>> On 17.05.21 08:44, Vladimir Sementsov-Ogievskiy wrote:
>>>> We need an ability to insert filters above top block node, attached to
>>>> block device. It can't be achieved with blockdev-reopen command. So, we
>>>> want do it with help of qom-set.
>>>>
>>>> Intended usage:
>>>>
>>>> 1. blockdev-add, creating the filter, which child is at top node A,
>>>>     attached to some guest block device.
>>>
>>> Is a “not” missing here, i.e. “not attached to any guest block device”?  I would have thought one would create a filtered tree that is not in use by any frontend, so that the filter need not take any permissions.
>>
>> node A is attached.
>>
>> So, we have [blk] --root->  [A}
>>
>> And want to insert a filter between blk and A.
>>
>> We do
>>
>> 1.
>>
>> [filter] --file--\
>>                   v
>> [blk] --root-->  [A]
> 
> Oh, so you mean node A is attached to a guest device.  The sentence sounded to me like the newly created filter tree were attached to it.
> 
> Yes, that’s how I expected it to be.  I just find the sentence not quite clear, because I found it ambiguous which node the “attached to some guest block device” refers to.
> 
> Perhaps:
> “Intended usage:
> 
> Assume there is a node A that is attached to some guest device.
> 1. blockdev-add to create a filter node B that has A as its child.
> 2. qom-set to change the node attached to the guest device’s BlockBackend from A to B.”
> 
> ?

Yes, sounds good, thanks

> 
>>
>> 2.
>>
>> [blk] --root--> [filer] --file--> [A]
>>
>>>
>>>> 2. qom-set, to change bs attached to root blk from original node to
>>>>     newly create filter.
>>>>
>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>> ---
>>>>   hw/core/qdev-properties-system.c | 30 ++++++++++++++++++++++--------
>>>>   1 file changed, 22 insertions(+), 8 deletions(-)
>>>
>>> Looks good, just one question: (well, two, one was above)
>>>
>>>> diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
>>>> index 2760c21f11..7d97562654 100644
>>>> --- a/hw/core/qdev-properties-system.c
>>>> +++ b/hw/core/qdev-properties-system.c
>>>
>>> [...]
>>>
>>>> @@ -196,6 +209,7 @@ static void release_drive(Object *obj, const char *name, void *opaque)
>>>>   const PropertyInfo qdev_prop_drive = {
>>>>       .name  = "str",
>>>>       .description = "Node name or ID of a block device to use as a backend",
>>>> +    .realized_set_allowed = true,
>>>>       .get   = get_drive,
>>>>       .set   = set_drive,
>>>>       .release = release_drive,
>>>
>>> Why not for qdev_prop_drive_iothread?
>>>
>>
>> Hmm, the only reason is that I missed that part of architecture around here, I'm new to qdev code. Will add with next version
> 
> OK.  (I just saw it because it was right below this structure, too, it isn’t like I actually know what I’m saying.)
> 
> Max
> 


-- 
Best regards,
Vladimir

