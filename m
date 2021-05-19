Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 863B8389086
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 16:16:51 +0200 (CEST)
Received: from localhost ([::1]:41688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljN0E-0005Af-73
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 10:16:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljMyL-0004Ao-GR; Wed, 19 May 2021 10:14:57 -0400
Received: from mail-eopbgr00101.outbound.protection.outlook.com
 ([40.107.0.101]:2014 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljMyH-000840-CK; Wed, 19 May 2021 10:14:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O60S5gx7PwEnqdID7oWToGQ0VBV1EJ2suY/G+kaQbB1EkeoOTx6nNjsYF/FoWBnoOzj01loxX2zctOvpM287V8HInJ1VUZyIbR79TmcJMxTCzIiMjH4qZa7LihU3yOYMJflc3++2VGE92d8/MEUmPmxGI1djI8+kQfCsVKhFUsCXNpl+OrHu/mee/e7kqYviefLmh7N97Q3YBKAsZ/arGY8CwcI04uNssAGXPqRsHY1066WnuK0qNhoAno5YhQXIhU4PpqnGqrWt53IT9q2v952dnFSXuUFtxkYIdHOn+f5ca14FEf0l64/NJWU//KQpz1XhZcZTMSI2YXVI4LWx7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Po+TIfJSuEz8qHnmrY6sKA1i5WYXPVx9Lw/M+KShcDY=;
 b=Hm2wALzotBgVACyK48szrk2HkWWp1sPKAAJy0yn/QOtE991YIW7dKTGeZ96g7bjnceNGkpzcbIXdJ7WuJX5JzYIG/w7yh2DuNyL3nnVN11uSodMhRVt+GnSia8gVaPIgWgIwpKHLDEBSysVdClU8aAx4SZCW3KrLmOfRgJ/NGidgrCF6nd8T9rqmKdvyXVPoHy8ZOWnfNU8LFIFAL3A0xwMXqXrKaXlD/v9IVs45fjz5rULBLKU8E73E6z0LFDWhW7o1a6HauBIWLC/jcz5LZdTl+xaArdEo7BjvS2f0x6mbZ+jdIlseU8ShXNBaMzuHnl+LMiSmOl6hLfKaKseV+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Po+TIfJSuEz8qHnmrY6sKA1i5WYXPVx9Lw/M+KShcDY=;
 b=UJZZM+2RwprgUZPkLyA5dnlUUuJ3b2iNZBHxvoBQZO83YRghvSIaK7x5YmsxAcjNJQZhNEWFD+xlM/yEMaUhobB60uwrgNYtVAbbP5oX4SB/fkb9JNkq1/+kCYE3GTeezwgKZUVyF5BbNzrJm1FDyTimxu5aBkSXWF7y7ebR/dc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 19 May
 2021 14:14:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 14:14:42 +0000
Subject: Re: Qemu block filter insertion/removal API
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Nikolay Shirokovskiy <nshirokovskiy@virtuozzo.com>, yur@virtuozzo.com,
 Dmitry Mishin <dim@virtuozzo.com>, Igor Sukhih <igor@virtuozzo.com>,
 Peter Krempa <pkrempa@redhat.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>, armbru@redhat.com
References: <a1de7e2e-2048-50d7-4373-7e04299cf7aa@virtuozzo.com>
 <YKT6D1jg4gYi8nZE@merkur.fritz.box>
 <a6435411-d4dd-29a0-02b7-d99e9b42597b@virtuozzo.com>
 <YKUMeq/EY+TyXZGk@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <bf9b37fb-fa02-20f3-6642-4d2d578927f5@virtuozzo.com>
Date: Wed, 19 May 2021 17:14:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <YKUMeq/EY+TyXZGk@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.218]
X-ClientProxiedBy: PR0P264CA0243.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::15)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.218) by
 PR0P264CA0243.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 14:14:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c30014b-21d9-466c-4cc9-08d91ad07207
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5078460F4B457707F058DFA4C12B9@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y1Oh6nE0X0Swv8JF1LRFHetWwhYQ3qjT1hcutewgCq/hCjdUZW0PgRSpysONZgqVrQcNgUHcIovSC6vFbktvOzPwKkGasxpJrbK2z1dzwB8UM9xIK1MCn6uv+L5afWgojh0ttpGcB6IdlzjsG1+tW5k7Pj8qN4WkEu6ZbceThNC1LGDzzsIkyogYQHWO5CKW4iUqSEVARW2Cvl0KGRaBj3fh4EOJbsZtZmYx990UoRwxCvWKNhf6qb+vBINQ/ViKltNj9bibCHqdu+P6q9vmJDUJIl0DgoO/lcBqQCDSZVwHPgwT/Uk2XjHhjmRA6hfIpbT2S3WXJ5tKUN0oLDPv7szk0UHsh3C5Bh0afFZReB5gUKhZRUPuwl5FQlAR5mXkzvcw/odfF1SPsgKv+eG3vmuGkg1f9QvBUpEf/E1z/JQhbq+sEcyVH81532OIsaaAVgtZUQLDupd4PEx5i0c1m3Bmi2hfyZ5mvRCLgb45uMnOsDDR1kZzOWujs4o5+I2xexHKlQUVAK/wuyeAanulxXQKzUARYiTMEHi2m45G/+maftqQQoj7z1uICFP1KAve4+6uLodz9M7WBpBaoPjm6dgBt5RRP01lno1k2J7qsblOMdbkSZrTDznw8TQ0uVHLJum7gl7OqG6Wx4FZpXipAiefnJFxacI+aTudqbD2mrJttKRHpwRYXiByeiMSKRPKLrsoUPbNJJF5DrFvEsLHya2kGGCGLirQgJgnr9E3kD8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(39840400004)(346002)(366004)(956004)(4326008)(2616005)(8676002)(16576012)(8936002)(316002)(6486002)(54906003)(6916009)(38100700002)(38350700002)(16526019)(31686004)(52116002)(26005)(36756003)(31696002)(5660300002)(2906002)(83380400001)(86362001)(186003)(66946007)(478600001)(66556008)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dm1BM0lzZDRrbUFaWW0zbmFQMzlMWmNRdmt4ZWtEWU5UUU10bkZCaWxSWCtp?=
 =?utf-8?B?U1JnMmlRM1lmQlNHQ1hoRFpLYWNHTlFKVEM1b1lvaUVzUFlzL3dBd3BMN2Uv?=
 =?utf-8?B?cjluVm42OVZjRE1vY3EzVnVVTTRJdkEwSXBiSGwyV2NPU2xhMmQ4Mi96Yno4?=
 =?utf-8?B?ejFiRzJpSE5hVHFUWmYxQmRndTUxQVZxb3FIdkxPZmo5U0ZUUHNiNm5ROUFk?=
 =?utf-8?B?dTE0bHc2cmlzZ3BwUW42NFowdjYzWGY4UEZOL0dwT3lqaUJ0TTZCOWlONWpr?=
 =?utf-8?B?MzZPL0l1cEY4MExsdkRwNVMrOTlrMThocXdoTk1OWXJJZFZLWC9JZnZOcmhH?=
 =?utf-8?B?RGhuMzE2azB2bjNucS96VDdnTHFZc2xGdXNDMVAybGsvOWJkN2J1aHo4eUVB?=
 =?utf-8?B?SitKdTlQQ2VTcXlPWExkOXlYVUE3djk5eklzazROVUFZRFZLdFVxUDV6ZFMy?=
 =?utf-8?B?K010bml3ODVwNTBZN1YzdVpPT0l6WHZKSUR2Z096bDFqajYrVnV6RnFGRWlr?=
 =?utf-8?B?dUo5aHp4czJRSER2YjFnV05OS3dRODYvZnEwamE0VWxPMy85YlJzc0EvTkNZ?=
 =?utf-8?B?ZDBjL2tIQ0FZWUZpL0MrTmx2RDZpblRJcEwvOUViRmZ5blZGRWZmRUZVU0px?=
 =?utf-8?B?Zml2aWxlK0hzSzBOaEZ4eGtoakZRWG41SmN6Sm9PVitMeVlUSEYvSDJhdVpP?=
 =?utf-8?B?b0FvM21EdFRvTHlXbFEzeCt3eVRyeDB4R2laN2Y4S0JnWGs4djhCaGMvd0hz?=
 =?utf-8?B?ckQwd09zZmJ0LzB2TnhkR2NnbG5oRUtNemcyaVd5L1ZMZ0Z4bURCYit0RWhQ?=
 =?utf-8?B?czcxd1lIUU1BUUsrS1EwSnV5Yk1EYnozc2J3YW1qYzAxdzc5U3pzbzlrdXNM?=
 =?utf-8?B?cS9pN1FCb2p4Y2hvc0VIOXRHbFlJeFFhU3ZmZUM1d2hUOVpNTGpoZ21QWlI1?=
 =?utf-8?B?a25DWkhUaTFpSWxOWVNvcXZNOHY0cXBOV1lzNWQxaXhZS0taK0FteW9EV3Bm?=
 =?utf-8?B?c29pZ0U2SW56dlh4dlpJcnJCRk16MUt4SitMbVlJTWorL3g5T3M2dFQxK25s?=
 =?utf-8?B?R3V6dk9vdU85MjFJMFdabUpVcWNyMTlQek1MTnJCd0ZrSmhFRTA4dDA5TytV?=
 =?utf-8?B?SS9qVVZqeFhpRXhXVkxScGR1UGNnemJtbk1OV3RLWUFQbngvTk9yUEUzbk1m?=
 =?utf-8?B?YWMxejlqWmxWVVEwSDBpZTM0dWxoOFZyaC9nMDdDUEo4dHQ1eGE1Ui81eHM2?=
 =?utf-8?B?YUl0OVF1bTY3MUJTOFZIQlF0a0s2SGpSc3Z6cnNwTDlqZldJL1UyWkFKdFUz?=
 =?utf-8?B?OGZRdG5ZN0JXYnpobDJVVGsxMlNGbDhNaXFTclhqd2V5OFVqN0FXVkpWaGtj?=
 =?utf-8?B?UWt4YWE0Q29KVHMwYzZVSTFJWlc2R292VDU2UEJLWkMrUWZWQ3BvQU5McFJE?=
 =?utf-8?B?Z3RJeVdPSjk4dXBHUGxxd21kb3VkWlRtanZ6eVorZlZLNmRiWGFaZEhzUTJX?=
 =?utf-8?B?cmxxOEZPNHMyVjlyWDIyQVdkYk9YYU5URnlnL3o3Rjc3M2pKQ1ZPZ3BPcWkv?=
 =?utf-8?B?UFFrelYwS3QrdGl3VmxvNXhmWHpkNkJlenBqY01rTHZ2akhsbEJmS2R6SC9K?=
 =?utf-8?B?YzY5VDNkOUxOeWE5dkNJUG5xa3JWbWVQcHl4aiszcGRXOXp4MEJabCs3WEFW?=
 =?utf-8?B?N3JqcFpSdkJOT3lrUWlWYXNOREJjaTNFeG02L2poQUhzVkt1Z2g5Y2dZRjJz?=
 =?utf-8?Q?Ktmwg3NOwrwFnU+OOXhcFl/GodrrypO7+WpEDpl?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c30014b-21d9-466c-4cc9-08d91ad07207
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 14:14:41.9929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /JFzQpOWUuFMmWyeYjfP1eJXttnSG4I2DqngMoJ0ltQ2aUlmuZB86P1KubTtRKMZq2orNcXLIR7KpD9wKi7hu0OdClFK3HI0DlYko5qrzP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5078
Received-SPF: pass client-ip=40.107.0.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

19.05.2021 16:02, Kevin Wolf wrote:
> Am 19.05.2021 um 14:19 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 19.05.2021 14:44, Kevin Wolf wrote:
>>> Am 17.05.2021 um 14:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>> Hi all!
>>>>
>>>> I'd like to be sure that we know where we are going to.
>>>>
>>>> In blockdev-era where qemu user is aware about block nodes, all nodes have good names and controlled by user we can efficiently use block filters.
>>>>
>>>> We already have some useful filters: copy-on-read, throttling, compress. In my parallel series I make backup-top filter public and useful without backup block jobs. But now filters could be inserted only together with opening their child. We can specify filters in qemu cmdline, or filter can take place in the block node chain created by blockdev-add.
>>>>
>>>> Still, it would be good to insert/remove filters on demand.
>>>>
>>>> Currently we are going to use x-blockdev-reopen for this. Still it can't be used to insert a filter above root node (as x-blockdev-reopen can change only block node options and their children). In my series "[PATCH 00/21] block: publish backup-top filter" I propose (as Kevin suggested) to modify qom-set, so that it can set drive option of running device. That's not difficult, but it means that we have different scenario of inserting/removing filters:
>>>>
>>>> 1. filter above root node X:
>>>>
>>>> inserting:
>>>>
>>>>     - do blockdev-add to add a filter (and specify X as its child)
>>>>     - do qom-set to set new filter as a rood node instead of X
>>>>
>>>> removing
>>>>
>>>>     - do qom-set to make X a root node again
>>>>     - do blockdev-del to drop a filter
>>>>
>>>> 2. filter between two block nodes P and X. (For example, X is a backing child of P)
>>>>
>>>> inserting
>>>>
>>>>     - do blockdev-add to add a filter (and specify X as its child)
>>>>     - do blockdev-reopen to set P.backing = filter
>>>>
>>>> remvoing
>>>>
>>>>     - do blockdev-reopen to set P.backing = X
>>>>     - do blockdev-del to drop a filter
>>>>
>>>>
>>>> And, probably we'll want transaction support for all these things.
>>>>
>>>>
>>>> Is it OK? Or do we need some kind of additional blockdev-replace command, that can replace one node by another, so in both cases we will do
>>>>
>>>> inserting:
>>>>     - blockdev-add filter
>>>>     - blockdev-replace (make all parents of X to point to the new filter instead (except for the filter itself of course)
>>>>
>>>> removing
>>>>     - blockdev-replace (make all parante of filter to be parents of X instead)
>>>>     - blockdev-del filter
>>>>
>>>> It's simple to implement, and it seems for me that it is simpler to use. Any thoughts?
>>>
>>> One reason I remember why we didn't decide to go this way in the many
>>> "dynamic graph reconfiguration" discussions we had, is that it's not
>>> generic enough to cover all cases. But I'm not sure if we ever
>>> considered root nodes as a separate case. I acknowledge that having two
>>> different interfaces is inconvenient, and integrating qom-set in a
>>> transaction is rather unlikely to happen.
>>>
>>> The reason why it's not generic is that it restricts you to doing the
>>> same thing for all parents. Imagine this:
>>>
>>>                       +- virtio-blk
>>>                       |
>>>       file <- qcow2 <-+
>>>                       |
>>>                       +- NBD export
>>>
>>> Now you want to throttle the NBD export so that it doesn't interfere
>>> with your VM too much. With your simple blockdev-replace this isn't
>>> possible. You would have to add the filter to both users or to none.
>>>
>>> In theory, blockdev-replace could take a list of the edges that should
>>> be changed to the new node. The problem is that edges don't have names,
>>> and even the parents don't necessarily have one (and if they do, they
>>> are in separate namespaces, so a BlockBackend, a job and an export could
>>> all have the same name), so finding a good way to refer to them in QMP
>>> doesn't sound trivial.
>>>
>>
>> Hm. I like the idea. And it seems feasible to me:
>>
>> Both export and block jobs works through BlockBackend.
>>
>> So, for block-jobs, we can add optional parameters like
>> source-blk-name, and target-blk-name. If parameters specified, blk's
>> will be named, and user will be able to do blockdev-replace.
> 
> I'm not sure if giving them a name is a good idea. Wouldn't it make the
> BlockBackend accessible for the user who could then make a device use
> it?
> 
>> For export it's a bit trickier: it would be strange to add separate
>> argument for export blk, as export already has id. So, I'd do the
>> following:
>>
>> 1. make blk named (with same name as the export itself) iff name does
>>     not conflict with other blks
>> 2. deprecate duplicating existing blk names by export name.
> 
> Yes, if we decide that giving them a name is a good idea, it's possible,
> but still a change that requires deprecation, as you say.
> 
> The third one is devices (which is what I actually meant when I said
> BlockBackend), which also have anonymous BlockBackends in the -blockdev
> world. The same approach could work, but it would essentially mean
> unifying the QOM and the block namespace, which sounds more likely to
> produce conflicts than exports.
> 
>> Then, blockdev-replace take a parents list, where parent is either
>> node-name or blk name.
> 
> Note that you need both a node-name and a child name to unambiguously
> identify an edge.
> 
> I guess you could do something like the following, it's just a bit
> verbose:
> 
> { 'enum': 'BlockEdgeParentType',
>    'data': ['node', 'device', 'export', 'job'] }
> 
> { 'struct': 'BlockEdgeNode',
>    'data': { 'node-name': 'str', 'child-name': 'str' } }
> { 'struct': 'BlockEdgeDevice', 'data': { 'qdev': 'str' } }
> { 'struct': 'BlockEdgeExport', 'data': { 'id': 'str' } }
> { 'struct': 'BlockEdgeJob',
>    'data': { 'id': 'str',
>              'role': '...some enum...?' } }
> 
> { 'union': 'BlockEdge',
>    'base': { 'parent-type': 'BlockEdgeParentType' },
>    'discriminator': 'parent-type',
>    'data': {
>        'block-node': 'BlockEdgeNode',
>        'device': 'BlockEdgeDevice',
>        'export': 'BlockEdgeExport',
>        'job': 'BlockEdgeJob'
>    } }
> 
> Maybe BlockEdgeJob (where the correct definition isn't obvious) is
> actually unnecessary if we can make sure that jobs always go through
> their filter instead of owning a BlockBackend. That's what they really
> should be doing anyway.
> 

I still think that block jobs may operate without filter in some cases.. But the schema looks good, I'll try.

-- 
Best regards,
Vladimir

