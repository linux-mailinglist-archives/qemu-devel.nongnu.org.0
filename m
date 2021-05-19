Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2513887AB
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 08:38:40 +0200 (CEST)
Received: from localhost ([::1]:42598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljFqp-0004nz-GI
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 02:38:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljFpa-00046T-53; Wed, 19 May 2021 02:37:22 -0400
Received: from mail-db8eur05on2127.outbound.protection.outlook.com
 ([40.107.20.127]:2689 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljFpU-0004a0-QE; Wed, 19 May 2021 02:37:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ob1MxiK6VJRgAfzZjiRvb8Bcm0BV1OyVxQff+VAVmDjGvbYDnWk08LY7Md3/t+Agx2ROm8vNk0d4LuT46Op31AdjsfYIBv6RMNiBlcRDYz6u4D10R6ZoBwUJakTN7BS4rlmAWsUDKksL+UhFSvlrMoU47iEySPENycl0K5COQ9BkRBSavthL1rQzMhfM2dVEzJeNTkhnglJ1JYG0izXclNPnpD35sdjApuhcFmYsmczIsxSpRLdafmU5VlcRlzk7MQeuTJD2EMvSFVsasfIOD4mbSekSmTs2woh5jxvNXkZBGus5PScVBgKKjPs7MQpPR8EfC1XBv9c53soQZCwIZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXcWi4Mm1AbD/6HnAXEYo/PL5D6v4SzTtiYLQhd8rrw=;
 b=fpA3lyKisLyOemFIIwZiFioRXpvSRQUiibSncWN/KePRpG3Cop7I85xvBmt9XEEGlYC7VmHpzhb8FkSoTDy9Y55EmhPOyZgFPp7X1OskVb5mLb3gh/uLK9D4nVTUVtW4JKSHGX5f6xV0COBI4SgAKtdEhsXTmQAf5346VmQTQknqpwFO94ksx/iv3eqsfVUegpTSmRX89kIZ0aYY/h/+5WREZlA+e2u33YxQW7C7gD2EkE7X1zCH3ZrJ46O0AvCwZ1n6cPfQQqLOh84c2ygZiLWiEN1qJLhlk2rElOP0BNFEQ1W4rfijL1H+J7v6GpP8JR4p17zGmhRS815ozYZhBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXcWi4Mm1AbD/6HnAXEYo/PL5D6v4SzTtiYLQhd8rrw=;
 b=A+nL12HQy1kUPLruIN80iLl1v2D/GcjPfo0odVw69+38INXE4t9U3njizeMECnmoNHV888EJnCPD8B8JyNMXSl9NqoSEdYWquxZgy4nTCjRVm95CaAxyyhUYWEgvPvLfJjuFgiVy9rftwOJjk+Gxf4mcn56IyQEXlW6Hh5unxM0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6119.eurprd08.prod.outlook.com (2603:10a6:20b:290::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 19 May
 2021 06:37:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 06:37:12 +0000
Subject: Re: Qemu block filter insertion/removal API
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>,
 Nikolay Shirokovskiy <nshirokovskiy@virtuozzo.com>, yur@virtuozzo.com,
 Dmitry Mishin <dim@virtuozzo.com>, Igor Sukhih <igor@virtuozzo.com>,
 Peter Krempa <pkrempa@redhat.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>
References: <a1de7e2e-2048-50d7-4373-7e04299cf7aa@virtuozzo.com>
 <0f0ede72-5b40-4896-a9c4-488b31e74d5f@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <17e76652-d488-1bdf-dcad-5174bea8e383@virtuozzo.com>
Date: Wed, 19 May 2021 09:37:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <0f0ede72-5b40-4896-a9c4-488b31e74d5f@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.218]
X-ClientProxiedBy: HE1PR05CA0154.eurprd05.prod.outlook.com
 (2603:10a6:7:28::41) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.218) by
 HE1PR05CA0154.eurprd05.prod.outlook.com (2603:10a6:7:28::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 06:37:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69692a08-63a1-4ef5-49b8-08d91a908917
X-MS-TrafficTypeDiagnostic: AS8PR08MB6119:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB61196C8A3BFE10804A9741F3C12B9@AS8PR08MB6119.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ac6eGqgpTa8JkwYNTZce371PvXywBLV/fiuc9mg9xB34E7R84HZWR1UeegTwVdt+Xbb6bbjSD+RaeiFyr4G2TYGRdXhwdVKcZSywRBTClxHKpjcIepwXNqFagIL1OHDVOVrR30+CGfV61IKc2p/VZnRqpW69F1phJ98cYx6luBEeRCNjCofocrF58fhupqWKzi3KAPtjnWQDTmMQgUrxDVeSS80JlMoFOi4ahxruH5xpkQTqIJPzkodJgxIgZ9UgFTmsMLoZTFI76LU3PhvMsiI7GFPSfLM72Up/IEE9K9oEcWjXhQAwAffrsYcyiLsnd6uenO44vAL0rUGzrh6nvsC8LT72Hj0AxiOE4J/rPvfYc1QwWr6dG4ONJSE2WHZ/KA1FTwIYJ/nf5G49E0WssfIx5K8zbS/w10lkqm2+Bylz0AJx2MpZeWERGquoJJz4LixPPG+renieIjNZYbFiondggYKsCFHr3WmCwbUGmJmsm6PqeeDOFqjwWx1NxLkF+SWzRxpdS+aFimy0ZkbccJbODceUS18mhcnIzQFHo3j3nhdxo7R+Mu7C2/yoL1oxlibkmJ8Hi4zfoyy+z5ReQLuWeN2PUcQQpyQSpn4GID4vkxlWiNwOvVDZvnH86+gztHDkxJbXP5lT/ydZoBaZQhZTznHLymzxVyxiJemkpafKu6NW8kKlQ7/e+ZnU+sdWTK6vztampIyF/CSdtdO59wwSU67OJG+f16gwucw/H+0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39840400004)(136003)(376002)(366004)(8936002)(4326008)(86362001)(36756003)(38100700002)(6486002)(38350700002)(5660300002)(83380400001)(54906003)(26005)(31696002)(186003)(478600001)(16576012)(31686004)(316002)(2906002)(52116002)(66476007)(66946007)(16526019)(956004)(8676002)(2616005)(66556008)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T3d3NlM2TU9iNHFBKytFK1I4OHQvVmp0aHZKQU1Za3pZWDkzN0wxNk1UZzlH?=
 =?utf-8?B?REk0UG5neVF4UzU1ZVlwWG5HSWVRbmNNR202SndVWXlUcmptVFhFTkdUWUhR?=
 =?utf-8?B?U05MKzFPU1dvaVgwWU4zQVo0Nko1ckZVNzgrRzFUc1JXd05idzVHREhMRVEy?=
 =?utf-8?B?N2IxbzJhL0tBOUgyckFVbGp5Qm4zeUhGY04zMFREb2M2UjlOMjVPQUJRN1J1?=
 =?utf-8?B?QUdxcHdVM0hwQ0h2dCtSa0dzTmtseVFMNHZ6WFNzZXo4YTFzdFhGVnY2NWMz?=
 =?utf-8?B?TE9RRHN4ejNNYnY1MFdtYUptbGU1VWdWSzBqdkJlSlhWVWJ3dDV5cGJuaVhV?=
 =?utf-8?B?NjQ2eHJESGdiZzJkYmphcWc3Q094Qk0xOStEbjVOcGVVSGl4V1ZmcEcwZDNa?=
 =?utf-8?B?TnBRZDBVNEMxNWdLd3g0Rk5JMy95TDY2VUdGZmNiVXJGQVdjaUlPRGo5N3Bh?=
 =?utf-8?B?aFJDalVNODE5NDgzbUlOK3FGdkNnbW1RYnY4YlRUVGphaWtKck9RNmxsL0JO?=
 =?utf-8?B?c1AvVkM3SU5UMzRERWc1SldxUDF1eWRabGwyVUw0SkxCLzMrQUdmY2dOaEFX?=
 =?utf-8?B?WEZVckRacXV0MEE4WXVoM2N0eVZ5RFY2TGcyRko0ejc2TnhRckxEQUg2SzRB?=
 =?utf-8?B?SXhoOXVKZnR1RzcxdEdqd2VwdUdRMGFsWC9pYXI2bTZoTmpNYytNMGdKZkVy?=
 =?utf-8?B?Tm4zSzlrOXVlOWxpUTNybCt2b3hYbjhiQmhVd2hBRmhDOFZ3VFF4c0ZCakVw?=
 =?utf-8?B?V1l0TDNwT3FJNzR3dkZnRzFjeUkvVEtMc0lwYlRZRDJjK1F5SEk0WXRFN3dE?=
 =?utf-8?B?dHRXRUpKbU5kTzhsVUZCYkJtUHdtV3A2UGFVWE9XM3NnTlBONEFycTRvRkVj?=
 =?utf-8?B?RjBLdXZ0ZHk4UWc1NzhvWWJqTldWWnNaTnVraDJEOUR6UnlvMkZMYWFjcnN1?=
 =?utf-8?B?S1MwbEk5NlZxSWV4V3FHaVZBZ2ZPa09VRmZGVExGQjUwVUxKVzZwNG8weVRR?=
 =?utf-8?B?Qk9KZ2srZ0JFSXFBYlRxKzdJT1p2dW5veXNOVmlYSU9HS21pU3hMazZxeFF6?=
 =?utf-8?B?MjZhYUNjQU9uYUtyMHFJNzZPL05xQWdyZWZYNGxYUml0ZE9VMkJpMDhSN0J2?=
 =?utf-8?B?YzFNS3MvdjJ2YXRRWi9ETVBBbVZzc1NGV1lQQmtrRlZjRm56bGJSUTBGTXpW?=
 =?utf-8?B?Uk9ZKzQrMnZiYVA4QzJxVitEcDhnN2ZBVEFNVHpXRi9SY2lHMkxqeGljTmYw?=
 =?utf-8?B?Mmd6bkZPYWZlQjNvQmVzUGVkckwwRllEVlJkTmpVcTdxOGQ0alA0WmUrY0V2?=
 =?utf-8?B?ZkRtKzExYitXQmQ4QU5NcVFNandPZ1ZlK2pQQUwxMUhKdnFKTkdxVzd6Qnhm?=
 =?utf-8?B?NStDb1lvQVUrMkVyVWxUbWUyeEljVktlZmw1TnpvdzNoSlJhcWUvbmttMUp2?=
 =?utf-8?B?VitGcXVYZjRuaElodXEzOVRaUUFpTzI5MzNGdVFRZ1ZzTlNLaWVUVko4dExh?=
 =?utf-8?B?SlJIdGFsV3VtKzNYTU5zbm1XTzFSMGEvcWRIeURkbHM4MUd1WGZkQmV5VXUv?=
 =?utf-8?B?YmlMMEFjQXV5b01yOUMyblVZODZFei9qRUVMZS9FL3dOejRrWkZ3QllTY3RR?=
 =?utf-8?B?VjBBQkxCRWhHZkJaSzdnUWdRTGEzOUVZc1JicHlRbVdaa2RlcWx6cTV0VW5M?=
 =?utf-8?B?TituVUFWa1p5QWRMNkl6RHBXZ3FpMDJFNURpaVd5RldnTjVZNEFYRWxXVlh0?=
 =?utf-8?Q?m846ZAUlZ9EB6Y9tDdho24eeTZkGK32OkmYJi24?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69692a08-63a1-4ef5-49b8-08d91a908917
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 06:37:12.8388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fmeA4+MPUU9AyGoNa3N0uZ8pI8NrVGe1+biwadV8J47B6cPgtt8x5tR1uqCiVOfPqzWY6dXD3uEVt5rI/dn6X0jR/+Wa6yxw1RIk+th5UiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6119
Received-SPF: pass client-ip=40.107.20.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

18.05.2021 19:49, Max Reitz wrote:
> On 17.05.21 14:44, Vladimir Sementsov-Ogievskiy wrote:
>> Hi all!
>>
>> I'd like to be sure that we know where we are going to.
>>
>> In blockdev-era where qemu user is aware about block nodes, all nodes have good names and controlled by user we can efficiently use block filters.
>>
>> We already have some useful filters: copy-on-read, throttling, compress. In my parallel series I make backup-top filter public and useful without backup block jobs. But now filters could be inserted only together with opening their child. We can specify filters in qemu cmdline, or filter can take place in the block node chain created by blockdev-add.
>>
>> Still, it would be good to insert/remove filters on demand.
>>
>> Currently we are going to use x-blockdev-reopen for this. Still it can't be used to insert a filter above root node (as x-blockdev-reopen can change only block node options and their children). In my series "[PATCH 00/21] block: publish backup-top filter" I propose (as Kevin suggested) to modify qom-set, so that it can set drive option of running device. That's not difficult, but it means that we have different scenario of inserting/removing filters:
>>
>> 1. filter above root node X:
>>
>> inserting:
>>
>>    - do blockdev-add to add a filter (and specify X as its child)
>>    - do qom-set to set new filter as a rood node instead of X
>>
>> removing
>>
>>    - do qom-set to make X a root node again
>>    - do blockdev-del to drop a filter
>>
>> 2. filter between two block nodes P and X. (For example, X is a backing child of P)
>>
>> inserting
>>
>>    - do blockdev-add to add a filter (and specify X as its child)
>>    - do blockdev-reopen to set P.backing = filter
>>
>> remvoing
>>
>>    - do blockdev-reopen to set P.backing = X
>>    - do blockdev-del to drop a filter
>>
>>
>> And, probably we'll want transaction support for all these things.
>>
>>
>> Is it OK? Or do we need some kind of additional blockdev-replace command, that can replace one node by another, so in both cases we will do
>>
>> inserting:
>>
>>    - blockdev-add filter
>>    - blockdev-replace (make all parents of X to point to the new filter instead (except for the filter itself of course)
>>
>> removing
>>    - blockdev-replace (make all parante of filter to be parents of X instead)
>>    - blockdev-del filter
>>
>>
>> It's simple to implement, and it seems for me that it is simpler to use. Any thoughts?
> 
> I’m afraid as a non-user of the blockdev interface, I can’t give a valuable opinion that would have some actual weight.
> 
> Doesn’t stop me from giving my personal and potentially invaluable opinion, though, obviously:
> 
> I think we expect all users to know the block graph, so they should be able to distinguish between cases 1 and 2.  However, I can imagine having to distinguish still is kind of a pain, especially if it were trivial for qemu to let the user not having to worry about it at all.

I discussed it yesterday with my colleagues from Virtuozzo, who will have to be users of that interface. And they of course prefer one command for all the cases :)

> 
> Also, if you want a filter unconditionally above some node, all the qom-set and blockdev-reopen operations for all of the original node’s parents would need to happen atomically.  As you say, those operations should perhaps be transactionable anyway, but...  Implementing blockdev-replace would provide this for much less cost now, I suppose?
> 
> I guess it can be argued that the downside is that having blockdev-replace means less pressure to make qom-set for drive and blockdev-reopen transactionable.
> 
> But well.  I don’t really have anything against a blockdev-replace, but again, I don’t know whether my opinion on this topic really has weight.
> 
Thanks, actually my opinion is the same. I think, I'll prepare a patch a day later if no answers here, and we'll be able to continue discussion on top of new patch.

Hmm I have one additional (weak, but still) argument for blockdev-replace: it just seems good to avoid touching extra subsystem in block-graph operations. For block-jobs we don't need to touch qdev guest block devices, we are good now with node-names and blockdev-add. So, it's good to save this bit of interface beauty if we don't have strict reason to drop it.

-- 
Best regards,
Vladimir

