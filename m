Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B74A132371F
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 07:07:03 +0100 (CET)
Received: from localhost ([::1]:38262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEnKA-0001xr-Pa
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 01:07:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lEnHf-0000pd-Be; Wed, 24 Feb 2021 01:04:27 -0500
Received: from mail-am6eur05on2098.outbound.protection.outlook.com
 ([40.107.22.98]:22506 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lEnHc-0001nW-Nb; Wed, 24 Feb 2021 01:04:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dd6oZofUSumSi0g6yaPlt8JCoCRiqRq5/q4mp14vwhb3BwyhWguFTDEOBSXqxop8aHRdD1LnemovaT5tAg7EW2aY9FByUWBWP8DIDKOuCUYLgVG8ybg4iPbNkeqNtdPiahH5eBPGueXZjg1233SL78+SvqC2/GbsKNu+cvxOUQCKEzP8IGOkbSRHOuofaTSd94J3hNaqS4yv/asj2Jv/mKWlxioDxJ/nyh66rc6vE0tGZYkxmw6tBRVNbzh3cPaBdtERl96ZCg2HVisRTi3ZAs+j2rUOjxMe99bV83D6lq6ApL2Whf5v/Jygn2UOGsJuddx/wVTZsZoJQuVsIpQkpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUGGCyisTLHwh8yG4ETD4rGZwlO7LzKZsNJ1MFDm6w0=;
 b=cQj7UkTf0ZlB3O36r65YfLKzx0OSkh42JFo8KGHFsjFAWW7o4Ijy1CSp+llo22jegueC+M7W3zBG/0P7mgT5xFRbEAxoF3UxluADsXcMCNJOBBLSDUPqJrno56e4xeknnCnYBNodNxOxR5PVgZjFd+7Rc2/RMTdOS4L1LzoFgbyP4DKV+aD8oLOvZR0a3XfS+uMGmCYi4Pi0cnSKAeY7UCOpjhShGKSZ5IT+vb1HulG4SWgq5HAPY7bU0c1XfXXXBNqJOXEPxjvm3kYLF8SjwJuKZPfQcF1FQZgG07NA1An0JvMoY8zFh5jj1hxi/wRdvzwJIsZ/wYgeC1LfxvJEzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUGGCyisTLHwh8yG4ETD4rGZwlO7LzKZsNJ1MFDm6w0=;
 b=Rrfj8pO12H/PIRnzMapFpo3rbnJgHf/6xn6/N+TRLn/fSc8nwNG4e5gRiI538Ahh+dqc8Ur/+PNOgkl5dcXN9294N7YjGXJWWK0uDvQdo7PpVOutjX+wuGqRsnOj5DfHKy9lfFz1bJPXzwRE/NwF7XKrC4iSaECaPeuLqjV7kM4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6168.eurprd08.prod.outlook.com (2603:10a6:20b:294::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Wed, 24 Feb
 2021 06:04:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3868.032; Wed, 24 Feb 2021
 06:04:18 +0000
Subject: Re: What prevents discarding a cluster during rewrite?
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Eric Blake <eblake@redhat.com>
References: <198596cd-4867-3da5-cd8f-68c1c570a52b@virtuozzo.com>
 <21d6f4e3-1512-50b3-d2a0-7969a49f18bb@virtuozzo.com>
 <20210223103534.GD5083@merkur.fritz.box>
 <e7480b84-bda0-c280-603e-38ba176c44c9@virtuozzo.com>
 <20210223162926.GE5083@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <3b23449a-a19c-a1d1-5176-d125f9e72e36@virtuozzo.com>
Date: Wed, 24 Feb 2021 09:04:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210223162926.GE5083@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.244]
X-ClientProxiedBy: AM0PR02CA0121.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.244) by
 AM0PR02CA0121.eurprd02.prod.outlook.com (2603:10a6:20b:28c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.28 via Frontend
 Transport; Wed, 24 Feb 2021 06:04:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2a4712a-81e9-436d-7992-08d8d88a057f
X-MS-TrafficTypeDiagnostic: AS8PR08MB6168:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6168D994A7D5E6EC2A54767EC19F9@AS8PR08MB6168.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B/DLGpjf7m1r2ZV7cN+DGb/O1bXrsms/FQ28Xk+OGN+AkvsRk0OoW7k9n3yilJgUHiJq3d07AqpBn1yPsiqL7/ptzVFuBLsxaeA39IwfmxzveNYPfJ8BPHPB54C2Gg/6tU544e6LQwHLlms2JAza7GsdOuzEV8sTXh5KuZeXitXMp5oAqjDkxuZA/6iykmptKQu91IiapqPukOXnV7vZ+VyRjJ59Vrg7z++ht0IbFNTvCs6q9S95AnhzJit8Hk+BcpIi48syZkdPZnsPHOnqBD0jersixi4oRWKSiyN6Ciii+eTdyj2YlPTB6+JOJ2YNiN5O541Le2mEzmr7J5yMa8UgudQzQiHXCHAKnzfr6bvokNNV0lGgRv/0DtQyzMBWWgu6fUEvU/DTVjaadZcJzxQVMk3YuU4agvvXFoFoc1jQcv7efiOjnmE181slw8CtXtf2J1nj3EvRUwgR+41uzddtoJCFwkfMTLJDno91ycqbXwh4/E9t2BuBFhbNLmNnh8QUUyEePkSZzxACw0bHKr6Phpu9DGP3/WZAmRlN6vqfWFGbLOjEls06dhk0cJ+Q+c0iqTkqGnmSRb6sPnN5YbbZmdocQqotRLU0CecBles=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(396003)(346002)(366004)(136003)(2906002)(66556008)(66476007)(83380400001)(16526019)(66946007)(54906003)(36756003)(26005)(4326008)(316002)(8676002)(86362001)(16576012)(186003)(6486002)(31696002)(8936002)(5660300002)(53546011)(956004)(52116002)(478600001)(6916009)(31686004)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dURWMjFrWTB5YTJuL2JsN1V3NklDaHltcDRWODEvejZYVXVJeXBLcFU5eStN?=
 =?utf-8?B?cUZvZU81VmRUcms2VHlieWRNbXcxcEVBWXBpUlhwTjVoemYvM3hadzhDTU1W?=
 =?utf-8?B?ZFN6bGUybHZxVkpMRUFFbmhKWUJOZXFWYVh2aC95VldpN0M0eVpNbXRDK2xz?=
 =?utf-8?B?RkFWNDZuSWhPdHdQMWZLaEdicWhkeGFSTzE2MlBSVnZva2xwZk1VTmhnNGx6?=
 =?utf-8?B?bGpaakJjTlZrcGZnUFBoMDdRZkpmSWhndkRHdUdmbFMwa08yZ1g2R0tlRTJH?=
 =?utf-8?B?bHhzTGtycDloTHZySGJJVzBZNTQ5ZWM3b1pHc3Qvam9yRFBLMWZVbVBrY01M?=
 =?utf-8?B?OG1OMmRCczgrU3VKZUpkM1lzRmhWSzJUS042RUZkSEZ4NGNkWGY1aklDRVRY?=
 =?utf-8?B?b2w2b0Z1cEgzL09YMFhVWXdJTUVaTlFrL3Bua3lsbkQxdE9QQzQ4Q04xM3Vl?=
 =?utf-8?B?UzVXVTBSZklSNnE2SVJkSDRQWkFWL2RYS1o2eWdmTHdFZDB0NU03eC9tb2N5?=
 =?utf-8?B?cW1qN2NtOVUrQUYzdFlyVVo4bkRCWnhncW9TaGZydVQrTkh5TVhnTmNvZWhS?=
 =?utf-8?B?UDhYZGI1N05pNjhLaEFjOG9OU3NCemNqTmprbjY2VlBhNFZVaWh5YXZYNVRX?=
 =?utf-8?B?SVE0VmN0cXpNZ3lDak1iSDBvSG1uQXE2Z0xWbHRTd2lrekNtb0JpSnBEV2Jq?=
 =?utf-8?B?M3Q1U2YxZHR3VGQrZ3NMYS93RXpCc2t1azdGbENacUlPZEN6L05wZXI1UjhC?=
 =?utf-8?B?TmN6RFprUUI4L0RpenZyRmR3cFhoL1crSXRSRks2T1QrdjVKVzBYSTlGdmlS?=
 =?utf-8?B?NnRYM2F3RGhrOWNQanZLYjhDMlhXU3pna1JpVVVGVHpoRWJOL2RxY2pJQnFa?=
 =?utf-8?B?anE0SmU3UzZ5K21zS1hadEcyazI0eDBvWGw4VzJVRVV5cm5CazJVN2YzSG8r?=
 =?utf-8?B?ZFcxQnBZdzNpdWJyand1RzFTeDVLODlYcVNrSlZoY0ZHN2oxbEhRanZ2RXNt?=
 =?utf-8?B?MGg1aGRFZWZ4SU1EMnVmWEZWWGR5dCswUUhBZ2llOWE5RWpXaERLOFRGc0hy?=
 =?utf-8?B?djBQbHBlekh1UkNBY29ZUmlCSFJZVWpSM29SWmp1L01haE42UVlQR3VWQWRL?=
 =?utf-8?B?SnNTbWhXMUhYOU55Tnl0WUh1RkszU1BEWENOTHdUTlVkNTZ2cUNGaTE3Sk9p?=
 =?utf-8?B?WVJZa0ZqTFJORTB0c1UxTjA4SGdXZU9jbm1OWUFSRU81L3RqU1VJSGNpV2px?=
 =?utf-8?B?Z1hJMzVRR0RJY1RxNlh6UWhrWEtPVFQvSElVK2k0ZkVVWXZRU1hSRnBiSFlL?=
 =?utf-8?B?aU1XUTgraWp6NG9vWU9XMTJ5ZW9yYXk1b0VwWXkvdm1UT0tSUDA5RnUrOURN?=
 =?utf-8?B?aTVyWHpKajdaelpoT0tkS0kyMGtISTRSRnhad2EycTl1aUFKVmpVMDFpT3Ra?=
 =?utf-8?B?MzhLb054RFBZWUQreDlRTjkwKzVSMUpaVWFNUmFlSnFiM05sM3FXUWxFVHBL?=
 =?utf-8?B?YzczUklCcVdtSHZBZFpjZ1JhSkFiVDRYTm5qTTVqMUNxK2hOTTZqL0x0RXJV?=
 =?utf-8?B?UEppODlyTFYyb1VEbHIxL1FjVlluNElPZGg2NWpDckNtSkEvblVmUStHeUdR?=
 =?utf-8?B?R01rOEZnU1kyRVQ3TEVRdW9UeUtWOXpFNks3b2FMMjdLcHZzM3daLzl2cGN6?=
 =?utf-8?B?enRyTjZJRi9OZHhteUhkTHlLVnE2Z29IM080VjZiT0NkMWhoeXRGZlcwVmdJ?=
 =?utf-8?Q?kh835WLjvHOMNn6Eqq3m85oPknXeq38C5rBBAtO?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a4712a-81e9-436d-7992-08d8d88a057f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 06:04:18.3426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mz0JzKRH2/hOs6GpZJvQJ3QzfqeQNSaThlRoSdTsZSDmQtabWGZcawStV88GgvphLL6uZJRfCRfADBCQ5YAK1xCEGz5ioHoR7Ug+bfw5YRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6168
Received-SPF: pass client-ip=40.107.22.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

23.02.2021 19:29, Kevin Wolf wrote:
> Am 23.02.2021 um 16:23 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>
>>
>> On 23.02.2021 13:35, Kevin Wolf wrote:
>>> Am 22.02.2021 um 22:42 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>> 23.02.2021 00:30, Vladimir Sementsov-Ogievskiy wrote:
>>>>> Thinking of how to prevent dereferencing to zero (and discard) of
>>>>> host cluster during flush of compressed cache (which I'm working on
>>>>> now), I have a question.. What prevents it for normal writes?
>>>>
>>>> I have no idea about why didn't it fail for years.. May be, I'm
>>>> missing something?
>>>
>>> Ouch. I suppose the reason why we never ran into it is that afaik Linux
>>> drains the queue before sending discard requests.
>>>
>>> Of course, we still need to protect against this in QEMU. We can't just
>>> unref a cluster that is still in use.
>>>
>>>> I have idea of fixing: increase the refcount of host cluster before
>>>> write to data_file (it's important to increase refacount in same
>>>> s->lock critical section where we get host_offset) and dereference it
>>>> after write.. It should help. Any thoughts?
>>>
>>> It would cause metadata updates for rewrites. I don't know whether the
>>> intermediate value would ever be written to disk, but at least we'd
>>> rewrite the same refcounts as before. I don't think we want that.
>>
>> Hmm, if that can provoke extra refcount cache flush that's bad..
>>
>> May be we need something like of additional "dynamic" refcounts, so
>> that total_refcount = normal_refcount + dynamic_refcount.. And for
>> in-flight clusters dynamic_refcount is > 0. We can store dynamic
>> refcounts in GHashTable(cluster -> refcount).
> 
> Do you think it's worth the complexity? The qcow2 driver is already
> relatively complicated today.

I started to implement it and actually it doesn't seem much more complicated
than additional CoRwLock. So, I think, I will make two patches (refcounts vs
CoRwMutex) and we'll compare.

> 
>>> Discard requests might be rare enough that not considering the cluster
>>> at all could work. We could then take a reader CoRwlock during most
>>> operations, and a writer lock for discard.
>>>
>>> Actually, maybe s->lock should be this CoRwlock, and instead of dropping
>>> it temporarily like we do now we would just upgrade and downgrade it as
>>> needed. Maybe this would allow finer grained locking in other places,
>>> too.
>>
>> In this case many operations will be blocked during data writing, like
>> allocation of another cluster.. That doesn't seem good.
> 
> You're right, that would be too restrictive.
> 
>> Separate CoRwLock looks more feasible.
> 
> Maybe that then.
> 
> Kevin
> 


-- 
Best regards,
Vladimir

