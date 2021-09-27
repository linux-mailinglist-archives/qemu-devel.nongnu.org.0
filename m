Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 059E6419317
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 13:29:14 +0200 (CEST)
Received: from localhost ([::1]:41730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUooq-0004rG-GJ
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 07:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mUolg-0003Bn-E9; Mon, 27 Sep 2021 07:25:56 -0400
Received: from mail-eopbgr60098.outbound.protection.outlook.com
 ([40.107.6.98]:55680 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mUolc-0008LE-Qj; Mon, 27 Sep 2021 07:25:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekYm5lbtr89MRkpslJNfQFKCbaN6LFWV25rAwVP3RZt3PGKA4jp0vfxY7b4GvmzIeoRwXXltFRhrLvSSS7QIpmZNmet5541FzILk9oUk9niTsV8yrmmQlJ7GI764ObCF1xc+P0LfEUvM8brAs6mgGMdL97ipcmzXxrc3lbUqDCAtyN9j4CmrmDHIokTSkaki0wyC+9TtN3NbEliEYzYEvzEOJ/uFBS7GaWW+HJSrgz3zh8YhXLgV2QNTbWWqYajNJfXqOMJR5+RsOz4yf6/lm5KtKRYpo6RSYADuwhqn9qrLgQsd8rH6pmPjQZhUSejSfIXIAK1LjblqxmUZlAFyBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=jeX0dYh85EJWnU8tzzX1zCqx9Hxj0FVShQIE9gPrXIs=;
 b=MXXC7+pPZdNYoDZyW3YINieMgT7NLW1g7iRCvBW0UtJXw5v0kjMefHI1sxVwLy0DsyDkWruD5d2WWMCs7ALDPj30M5+/z6Zfu5aNaxjYbcuYMInjWJTI6UCJaT2IiEYrWBvaaORcJY7cBTgZBklf3sjTs/iiW76bq8cmE9yoaHlqqvzn3oTQ+mox/ANbMhAyv3i79EUvxouQTwAiY29ayfowAp36jartd3aSH5sIfhUwunlOKwzRHljWJ+gqW2SNJhBKnwU8U7YgOzcYVG3yV5WTtEya/JmkYHlnGgrZu0KrxlR2SoefpxU+8f7GgES+KxwsDY5oDCd7MncQ0YGqog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeX0dYh85EJWnU8tzzX1zCqx9Hxj0FVShQIE9gPrXIs=;
 b=Nx6GmIsZAXhX6cyeSg7sd/5STQuP7ilOAY9IAxtoFfqZzjGXAR2UFIP80ALmE/4dQXj/p8TTYL5uAo6IXOl8ehbX117oXWAp6wGIRItICgRtVsJAgxzVSVLWUJ2qOnER8zpl/K4gbgBgEiv6CH1nEMGFIquGcHHVF/0qDb7FCPM=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6871.eurprd08.prod.outlook.com (2603:10a6:20b:392::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Mon, 27 Sep
 2021 11:25:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 11:25:48 +0000
Subject: Re: [PATCH v3 2/9] qapi: make blockdev-add a coroutine command
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, hreitz@redhat.com,
 kwolf@redhat.com, eblake@redhat.com, den@openvz.org
References: <20210906190654.183421-1-vsementsov@virtuozzo.com>
 <20210906190654.183421-3-vsementsov@virtuozzo.com>
 <87tuixa4gv.fsf@dusky.pond.sub.org>
 <7f9959e1-851d-b38a-c92c-ae42c340f29e@virtuozzo.com>
 <87v93c9ajn.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <7dde010f-640d-3283-f406-5c428bbe374c@virtuozzo.com>
Date: Mon, 27 Sep 2021 14:25:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <87v93c9ajn.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.13] (185.215.60.205) by
 FR0P281CA0090.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.7 via Frontend Transport; Mon, 27 Sep 2021 11:25:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efe11a1c-dcbe-4bf0-a6b4-08d981a98dc3
X-MS-TrafficTypeDiagnostic: AS8PR08MB6871:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6871F3F74C146CDCCCE2D89CC1A79@AS8PR08MB6871.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YAfOvS/pmdhPTglZkAfZxl1Y1mFKzuxZ4QM4Ip3RRXzqoX12ng2Uwf2K/0xoPbhO/+ALNKhv7OD4NizYNlOYJ3MGU32edDBDsf5Qedsc84wMl4KwVFpAi8Nc9lMIqFYZCRcQ1dfVQn8MPDOmA9Qh2+/a/jTyoNtrf6W9T8O4BWlupQHJfhPOAg3QA77MzpDCo2yipFz1H+3rLC3LfLa1kOsI0vr/vef/GzVhu23pNEPQg4yuq2scz/BUQ/t5ubWvpggRCUCWvbBi8EoG/FDPCoVtkthQ9ZEYOeDSzo9JAz24LqGVvkFptrWfZ91E4rx5kFwyb8Go4WTP91SLU+R/883ywnFKMROp+JuaHPKIM72+10y5iih6RuQ49Icqnz++S0AO0Tmu3DymIU3zlfqOCMrWiLUpVzG20AYSxrC3C8rwk5AFIKuw1v+Uvr9dzUZnUcGmO+sGXdI58oBA9TtjBjdbbRNUsNWeDOAP+f+WImz8CcYJoyZqO7LQn9ZxhU+3xS6DLoJQLkk02TxCDdo6e0tq1pET0FHeNcvsfncMu2AqbKExt2C3wSj0Ptjm6nHf3Lez78vQqU/0Wvn/2PoNQrK6tXZKKXqYTq9NmQp1y7qSBpTqzdPrphOwn4bHSSuyzTRPvPqNzQyeYoUrR7w/CfegXUnBBX4vZzpM9haWBXnry6D7NoSv1F5rN0u4KDBNemhIc3VbBcIBB0tbrx15pVXVsPtInczADCSatNiB/aXDnM3kGnBpjybKm63hjRiDzJv/t9Z9v1lzbfNX10VllW/fl96ZLc4W316MzmggpYU5TDHNvXtrx4st10F7N9L/9ogyoYMj/4fnBaPmFAqkn7eKpc9h5+hayBQixVM5934=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(38350700002)(31686004)(52116002)(38100700002)(6666004)(2906002)(8936002)(83380400001)(107886003)(508600001)(26005)(186003)(86362001)(36756003)(6486002)(6916009)(5660300002)(31696002)(966005)(4326008)(66946007)(66556008)(66476007)(2616005)(956004)(316002)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUtXLzdCQTlSLytMQjB6OHVmeXJGSlI3Tm40c0VUVjh4ZjNONWZjMDI5V2lP?=
 =?utf-8?B?RHFSUnk5dG5pUnZaQ0ZMQmhCY3pkRlBKZGtqam5rc1NRRWhZTDZSTGN4Sy9G?=
 =?utf-8?B?cTJCVTVMc0cyVEwyKzRMNEd0MUFqR1ZPa0J4eFFhcThqSUxmckw3WmRGRWxW?=
 =?utf-8?B?b25zZ2E2Zm80dTNneHJtZG12b0YraGd6UlFwVzg2cnRaREJya21CaHJXYXBE?=
 =?utf-8?B?dUJ6d25QZENob0hGdkVMcy9xZFlwVGVXTEZJODdJdzNhT25GVDIxWlptSGJJ?=
 =?utf-8?B?VDRsaTM3QWRkVEJUMGh5OWNpbnZydzVFd08vUWhUZkRTd3dFSDV2QUIvWHo2?=
 =?utf-8?B?WENodldCbU5HaGRaUElXUkx1c3dNZm42aG1ZT1c1cmh0cHFJb09rbWsyUGVB?=
 =?utf-8?B?dldJVjRQVERFMmk3eEpOYjVKTDBLRzc0UitpY282aElXR1FNSFQxTWFFTDlE?=
 =?utf-8?B?aWg4KzNSNkNlU3kvRGttMUh6ZkZydmRFQ2prcEFZbnRHZUdCeUxSUExwL1FY?=
 =?utf-8?B?REpQalgvN1lBSVAxV2ptdmowYmpsOG5hakNrQ1RaTkJYbHJWTGFmMWx0SEJZ?=
 =?utf-8?B?VlFldW9DK0tFSU95MTZvNVBRTHVZSnJJRnhrcEtIWVNlZ1pleW9iNG9ySUE4?=
 =?utf-8?B?ak5ISVp4Y1Y0QlhIMnVzQVJyTXpTUVZueTdIdTdLSWhvWnpuTHo0alAzbktq?=
 =?utf-8?B?L0d0bjNjNmpURFhjdDhsNnVHQWwvWCtBVFErdnJiZEg0RGlDZFBNV1d5WTZo?=
 =?utf-8?B?RnlkbTh2ek5TWEw3Q1RWZGY0M0krZ3I0SjZJck1IRnlyUGZsQW9HWkNYV2Zq?=
 =?utf-8?B?Y2poNFVoLzIrOU9vaElmcVBiSGd4ekpxMjkvVU9JVjNBMWdpVjhWN3c0bVFZ?=
 =?utf-8?B?ZEtVaHJ6MytlMnRyTS9EOGw2a0VnTjRqMXo0ODJhYW5TQjJLdk9OUldVdnRI?=
 =?utf-8?B?N3hHSlYyS3lwajR6VGd5blJuN1c0SWZuamtheHk2eG0wKzM4bGpzcGdkRDBn?=
 =?utf-8?B?UDNScThHK2ZUcytUbWFsaWlWWG5zUElWMlV5Y2ZnWTB5aHRrYlM0V0QrWmFo?=
 =?utf-8?B?TndnMDhNdnJPc3F1V2JnenREOGxjUVRHdmowbUNnOSszdVl4MGdXb0xKVnNM?=
 =?utf-8?B?aEFWemxYWXJpc05oZU9jTDY4R3dVWGtYY1BYd0pPc050M0kwcGFDMUwwa1N6?=
 =?utf-8?B?OWdlem5Od0lPWkVlYmt6SFV4Z0MvbEsrREFQaXdCZUV3WkkxSEdMbXhnYlZ4?=
 =?utf-8?B?cnh6UC9IZzJ0cXBjbDdIUFVpNGN3YWovck9FVmlWWGhVeldUZEZaM1NxR2J5?=
 =?utf-8?B?akVBeVhDQ2NBandvN05xcG5aZ3Y4V2hjd2RBR01tZXc1RUZjanhNaWluZW1r?=
 =?utf-8?B?cGJ4aTh1V2pHd0F0K2c2MHRSc0N5UzE2WGVWdjRUT05MTGg0b3pMMmpHREFV?=
 =?utf-8?B?YXZRK1cyUUpRZVR4dndjNUtZcHNqK0N3UWdKQVZzd0hGUUFiRFBTaWlFc0VZ?=
 =?utf-8?B?eUFRUjh0ZUh3UG1RY0JxSEJCTnFGaGVDQXRaOVZiVEp1YjZUbnlXMjF6QlA4?=
 =?utf-8?B?eUxiTGZKOERnMlYyQlZoVjZ4VWptam1LL0VNcnRhWU5YdnVQRVZ4SUgrYUxL?=
 =?utf-8?B?Ujk5YjgxQXN4ODU0dlQxd2cyS3huaTY4UURCa1UvaTVYVkpZaytqeTE1dDFC?=
 =?utf-8?B?d2l3NjJYSUZVanBWYjlmbk9QYXlERHNrNkZ2eEg1Ty9OcFVEb3o1YUJjazVV?=
 =?utf-8?Q?Y+j4aeIcjtrfaWDyJlqECJQbtyFWt3VoP3joU1S?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efe11a1c-dcbe-4bf0-a6b4-08d981a98dc3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 11:25:47.9323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vKV4q/uVYjVyhw9YfndNSxxYoo74SU3qrU7k5v72uhFyg45g9D1/S1Pz0TZX+SvOb7YwulpoHC9lHIqk40BjkbMrxTY/d6PUgr8Te9TLQJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6871
Received-SPF: pass client-ip=40.107.6.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-3.136, RCVD_IN_DNSWL_NONE=-0.0001,
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

07.09.2021 09:14, Markus Armbruster wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
> 
>> 06.09.2021 22:28, Markus Armbruster wrote:
>>> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
>>>
>>>> We are going to support nbd reconnect on open in a next commit. This
>>>> means that we want to do several connection attempts during some time.
>>>> And this should be done in a coroutine, otherwise we'll stuck.
>>>>
>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>> ---
>>>>    qapi/block-core.json | 3 ++-
>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>>>> index 06674c25c9..6e4042530a 100644
>>>> --- a/qapi/block-core.json
>>>> +++ b/qapi/block-core.json
>>>> @@ -4219,7 +4219,8 @@
>>>>    # <- { "return": {} }
>>>>    #
>>>>    ##
>>>> -{ 'command': 'blockdev-add', 'data': 'BlockdevOptions', 'boxed': true }
>>>> +{ 'command': 'blockdev-add', 'data': 'BlockdevOptions', 'boxed': true,
>>>> +  'coroutine': true }
>>>>    
>>>>    ##
>>>>    # @blockdev-reopen:
>>>
>>> Why is this safe?
>>>
>>> Prior discusson:
>>> Message-ID: <87lfq0yp9v.fsf@dusky.pond.sub.org>
>>> https://lists.gnu.org/archive/html/qemu-devel/2020-01/msg04921.html
>>>
>>
>> Hmm.. I'm afraid, that I can't prove that it's safe. At least it will mean to audit .bdrv_open() of all block drivers.. And nothing prevents creating new incompatible drivers in future..
> 
> Breaking existing block drivers is more serious than adding new drivers
> broken.
> 
>> On the other hand, looking at qmp_blockdev_add, bdrv_open() is the only thing of interest.
>>
>> And theoretically, bdrv_open() should work in coroutine context. We do call this function from coroutine_fn functions sometimes. So, maybe, if in some circumstances, bdrv_open() is not compatible with coroutine context, we can consider it as a bug? And fix it later, if it happen?
> 
> If it's already used in ways that require coroutine-compatibility, we'd
> merely add another way for existing bugs to bite.  Kevin, is it?
> 
> In general, the less coroutine-incompatibility we have, the better.
>  From the thread I quoted:
> 
>      Kevin Wolf <kwolf@redhat.com> writes:
> 
>      > AM 22.01.2020 um 13:15 hat Markus Armbruster geschrieben:
>      [...]
>      >> Is coroutine-incompatible command handler code necessary or accidental?
>      >>
>      >> By "necessary" I mean there are (and likely always will be) commands
>      >> that need to do stuff that cannot or should not be done on coroutine
>      >> context.
>      >>
>      >> "Accidental" is the opposite: coroutine-incompatibility can be regarded
>      >> as a fixable flaw.
>      >
>      > I expect it's mostly accidental, but maybe not all of it.
> 
> I'm inclinded to regard accidental coroutine-incompatibility as a bug.
> 
> As long as the command doesn't have the coroutine flag set, it's a
> latent bug.
> 
> Setting the coroutine flag without auditing the code risks making such
> latent bugs actual bugs.  A typical outcome is deadlock.
> 
> Whether we're willing to accept such risk is not for me to decide.
> 
> We weren't when we merged the coroutine work, at least not wholesale.
> The risk is perhaps less scary for a single command.  On the other hand,
> code audit is less daunting, too.
> 
> Kevin, what do you think?
> 


Any thoughts?

I think, we can simply proceed without this patch. That just means that blockdev-add remains blocking, and using it to add nbd node with long open-timeout when guest is running [*] will be inconvenient (we don't want to block the running guest). Still commandline interface, and running blockdev-add when guest is paused is OK.

Anyway, this case [*] is not super useful: OK, guest isn't blocked, but you can't issue more qmp commands until open-timeout passed. That's not very convenient for running vm.

Side thought: don't we have/plan async qmp commands or something like this? So, that command is started in a coroutine, but user don't have to wait for finish to run more QMP commands? It should be more useful for command that may take long time. We have jobs, but implementing new job for such command seems too heavy.


-- 
Best regards,
Vladimir

