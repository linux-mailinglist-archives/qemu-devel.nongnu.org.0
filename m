Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B513BC308
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 21:14:01 +0200 (CEST)
Received: from localhost ([::1]:32820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0U2Z-0004Hg-R9
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 15:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0U1W-0003Bf-2u; Mon, 05 Jul 2021 15:12:54 -0400
Received: from mail-eopbgr30135.outbound.protection.outlook.com
 ([40.107.3.135]:53058 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0U1T-0007ZY-9f; Mon, 05 Jul 2021 15:12:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jalsjmSVRLqbUXUk2FguLsclkipz9SGh2Oa3o7sMMP/p21eM5ADCOdczwbEY1sJIBD9/1DaqZQfhGSEGnGzSUX5kL1TRx+NKntjcgC9ofuTP5s2Ztf8qC91cq14phqT0PbQBsygr4egv2yF3VsW50TsZCyjX1PxM9GFzJHjJdHfpRVS6ALZqIBnnnnu9B155rAsiaKpP56zF6XBJNQckeW8QOY2oYpugiBwQlDF/eJT5fGhW1jrLSIQqEpaXlHOKgKS5kyEWoogpjluJgySrpEqj98E4EylQJ8iTfsYKkLAP/bQklBiam7mwmiIo0TmY/DgzAowu426JOa+0YmVEPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aF0Ubln6imnQl7ITnP1BPHgSMnH+kJcr3bftz7xxa3g=;
 b=BpCP/Z/qYYBzX0aLE1n+uzGAJiYAXTEuLvuoXBB1GqvXAX3JH3745bChajAeDsDDAF5Syg6h6czTL9bfVQ+lU/R3DoXkcVGd+tfqBOrLy0HpXGEruECBjNToUT/UW/bNr1aWvxVNWDwY+F0K/8ZMwPlNsVXcTKBmDH81abcebbbjVATB9tcI8rHjnU3uQSF+uTe2qThSxLSNx4zh9NKm6ub/ZMrgD9OvtdQRTjIJfxnIPTVRHkNbU+r7qVMvfMVeOEzoC6m2XUG5aRFdirtpUvHh8fV+KgBKq737wQcQVjaCitnA2jk1JzuSvN713DyLltPmUr9vJlbgEDM2LfecSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aF0Ubln6imnQl7ITnP1BPHgSMnH+kJcr3bftz7xxa3g=;
 b=sv5GyQmk6JGUZcAGL5F0Pkq5hs6T6qJ1OHfUep4C5ZANaDVFth7mN8xYzIYA06lqk3o13VhLU+Cy4ZTSzbMsIuTyzdrBAhET6pExVdCWToZ11nyKIqC3LAAZAd7QGuP9ncJFtZHPTSeTlafxmdAOvD67FB6m8gUIkTYtJMfoTq4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6805.eurprd08.prod.outlook.com (2603:10a6:20b:396::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Mon, 5 Jul
 2021 19:12:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Mon, 5 Jul 2021
 19:12:47 +0000
Subject: Re: [PATCH v2 3/3] qapi: deprecate drive-backup
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, libvir-list@redhat.com,
 jsnow@redhat.com, eblake@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, nshirokovskiy@virtuozzo.com, pkrempa@redhat.com,
 den@openvz.org, yur@virtuozzo.com, dim@virtuozzo.com, berrange@redhat.com,
 kchamart@redhat.com
References: <20210505135803.67896-1-vsementsov@virtuozzo.com>
 <20210505135803.67896-4-vsementsov@virtuozzo.com>
 <87eedc1ugb.fsf@dusky.pond.sub.org>
 <3c1c05c3-87ec-c665-00ae-0c0ca312e5bc@virtuozzo.com>
 <874ke7s46i.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <734bccbc-3cff-5e22-e487-451e73db1d65@virtuozzo.com>
Date: Mon, 5 Jul 2021 22:12:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <874ke7s46i.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: PR3P189CA0025.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR3P189CA0025.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 19:12:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2149049c-d2f2-4890-d283-08d93fe8df44
X-MS-TrafficTypeDiagnostic: AS8PR08MB6805:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6805920F84C6AF841F56F532C11C9@AS8PR08MB6805.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zj6Ez/LbIIzpgsESj/6pyPeFqvTS//tPFI1yZNdE2IGq1y6n/51mG/gqFlOyQSFMiT4L5+Ebk4nf3zNo7V3QD2MIYhaVWPct/Y3UCVBoo/4F5tUW/Wf/Mlf8FhneXfoC7+tB6RQWtzdoSbOA62eefp9+Mw2XXoxk78GfZbDad8QKwWSgXfzY4EgDHgTXwkR9Nai5CQVfKkfKxKL57J3Q1RmHPJF+iNdz8a0HIoTolCeMqBzv9oHv26rnHiE6Y6kiUWFk7AJ2TFfVQPiXR0k2LWUmYjY8VSVT0MwYCaEFNmbv5HPAbZrEbSmLMXrAiMhf7fWnAb6s383awrQ0KDqLu4P7g8UtVgzSPuXAdxBZrEMpsQ9Zd+be1nQIVjUI7kggKwCsFRjuHXyM1yjbxgwf5mnFi40HAbgeybqD3HkrNyDuGj42IRO1Wy2v+SfqsjlAn3TWNqsNKLlds57LZoBbQvzgJIZX26mA5k5e7fuaYjlrUREVEnaUzwESYUdHI/eZmmRsstggMyo5VYNQsYbzN8/zlUz2FBH/AiS+bvsMjLymFpWi38AxGqe8ZV1ou9Yhhs7EuwsWqm0vW2MXOHZxIpMTQhvazrqrwJXwkdSltUHdpHSz7iTnMub1XGskkEJno4l6wZZKjPi75Cv4gx/Ao4N1K51U5EpmxLkR1GWc8koKqGk7HSMaMUQWe2mXgWnubSocgdCShNuUJc5lbljFtd48/6VHc3oTrKeZJABrguqkt61EbQmYHNanTlwp35dUDHcMYWV+IJ92E9V9p9Qr9+pspLLxB4ZpHALhvxdz9zNriZwhWGN7ncVwn2CmfPN0LgQr/YS0lZb+Lqc8WLq4Br1ocb4C6RhyFmFwxp+FspY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(39830400003)(376002)(346002)(16576012)(316002)(6486002)(966005)(478600001)(8936002)(66946007)(6916009)(7416002)(36756003)(8676002)(5660300002)(52116002)(2616005)(83380400001)(956004)(4326008)(86362001)(31696002)(26005)(31686004)(66476007)(16526019)(38350700002)(38100700002)(186003)(2906002)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHBRS2c5SXdSMEg4VnpmSUxCSUtwV0d2SFNEekVYVnZqM1JzbnpIZC9sR2Zx?=
 =?utf-8?B?cFJqUk1ERGZoV0dHb1p6aTVDSFZtcHZWQWdjdUlDUkFqSEtYb0t4MFViS3Jq?=
 =?utf-8?B?cFFxcHltZGhlbnZjV0hGMWp5cHErMTU2dnJZeG1IZDNGMy95WGx3dWxQSDhD?=
 =?utf-8?B?cEdmN3BCVW00MTFqV1ptUWdxSGgrUi9uQ1Vzc3JlTDcwTGJGOE1PcTcvaUxC?=
 =?utf-8?B?dngrNy9rQXl0SGNHVzhwOGw5cWgxbWRrRkZzZFVQMy9Od2lxeWtYM3ZmM3o2?=
 =?utf-8?B?cWNacEphaUhsY2pkUmJLVW1RQ21tb0FmUFBrVzYycndRVzJqTFRtZWZqMDVM?=
 =?utf-8?B?TlZXaDBna3hEbmdVMGdEVmlvWERMVTdKVWxqS3FxM0NQdTZVZlJSWnQ3c0lX?=
 =?utf-8?B?M0QvWEZEdUlGWVhCSTBndS9CNWFzMXlPSks4TE5oY3dhRVAzVktiZ20vSkUw?=
 =?utf-8?B?ZUNEb1RmVHJoMEc2V0tYbFAzTU92dHdFVUVmczlNVUs3Z0pkRkdEZjg2Slkz?=
 =?utf-8?B?d1duU29RT0ZwaVU2MDUrQUtoZW95cFhWWi82dDdla3BZeFN1L1d5cGJOT1Bo?=
 =?utf-8?B?TjljWWN2aWxFRTl4OXcxei9kSmFFdjJ5SjdqeXdXZXhNNWdxaWx1SURwU0Vt?=
 =?utf-8?B?b0RuYlU1V1NKeEM4Nmd4alpVaFlnaE9kdTAzS2pBd25TQURNYVJTakVXSm1w?=
 =?utf-8?B?SEgxQVdQeTVXNG9vL1JUeUlERTZOQW1Jam50VW5UcGswelhMYSs5aG1EVVhM?=
 =?utf-8?B?dWRuSXIraUViSSsxTUhoYTlUZDZMM2dRTzYrMWVKeGcveXhvNHhBdElyZGYz?=
 =?utf-8?B?UHpDeSthWlR1SlRNc2MydEtCZ0tuR2NOUXZVK1BCYmlMWi81dFJ5ZlhoUnU3?=
 =?utf-8?B?NkVtSEQ5Q2RmZytoVng1aGdIdmtsdWtYLzJYcFJid2FOU0l5L0trK0tJOGU1?=
 =?utf-8?B?TjdrR21KME5yY3N3Vk9YZ2twc0tTQk44Z1M5aFBReXErdVlpQ2t2MW9iYmVx?=
 =?utf-8?B?V2psUGY2eFpKUlBESThqYnNNNG1vUkRseXVsS0ErUUxFWWcrc0VkQk50MWQ5?=
 =?utf-8?B?STB4eW40QjRLOGFOcWpBT1B5ZjRsQ3JFSFBhSUNVVDA4U0hOU2dRWWZybWdl?=
 =?utf-8?B?azBqZTZ0dEFYNmJxWVExeGtkeDI4MXFKcVhWRXdsV1RSKzUzK0ZvN0dJNnlo?=
 =?utf-8?B?MVlPeXFRN2N2Skp6RWUrc0xEcjdZTXNpVnUvWEd6Yjk5My9DV0E0VzQzbDBS?=
 =?utf-8?B?UGJCYllHc2tFTU9Ca2QzYVp4QU9VclpoSi96VGc5NWptc2owWklqbzhoR0Q0?=
 =?utf-8?B?eXBSb1ZxRUhidXNQMThma1NTT3N5ajRLZXRWQnA1bk1uTkdOMGlraFJLcDRv?=
 =?utf-8?B?K1cxUlB1Vk9CZFZoRjRWcldZbmdHaTZmcTBsZURvejg0N1dxYlNYT2pkZnU4?=
 =?utf-8?B?bFppK05TKzNPbGJRa0FaWFhEOXZ6MmUrTS9BMERYN0E5SWNkNlY2RXkzTW5B?=
 =?utf-8?B?UWg2WjR6MzBWaFpHOVdGWXdpRzR2SDdGNzcyWGlOU3NDN1BJSmxPb3B5MFp1?=
 =?utf-8?B?clF0Uk5oNlE2RWJibWxiQ3NsbTZjam1QZnJDRHlBMEJPb3VVZGJhbXk3N3U2?=
 =?utf-8?B?RjZYazRnTks4aVJFbzdWZFpTNVFZeGtBQURndDRDNGlxL1RrUkdkZUZwTC9C?=
 =?utf-8?B?UDdoMXBhVzBpYXRVTGZJc20zRE9XYWIyQ0dEbXNFRzRGZisyUG9ML2dKYTFW?=
 =?utf-8?Q?JgYkfHA/u7wakNtZ6DzbJBBRkfOfgJuokNRLAUv?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2149049c-d2f2-4890-d283-08d93fe8df44
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 19:12:46.8333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cX++BVcFYl37HBtAO0SkCiW0YTOxW1mqh3XCf/z2NhDLJNQqypAbR2RFsABgCLN6XCNNYmukKQctPBn33PG5/DKmzh0hjvXANCS+OZvWTYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6805
Received-SPF: pass client-ip=40.107.3.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

09.06.2021 13:49, Markus Armbruster wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
> 
>> 08.06.2021 14:12, Markus Armbruster wrote:
>>> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
>>>
>>> [...]
>>>
>>>> TODO: We also need to deprecate drive-backup transaction action..
>>>> But union members in QAPI doesn't support 'deprecated' feature. I tried
>>>> to dig a bit, but failed :/ Markus, could you please help with it? At
>>>> least by advice?
>>>
>>> There are two closely related things in play here: the union branch and
>>> the corresponding enum value.
>>>
>>> So far, the QAPI schema language doesn't support tacking feature flags
>>> to either.
>>>
>>> If an enum value is deprecated, any union branches corresponding to it
>>> must also be deprecated (because their use requires using the deprecated
>>> enum value).
>>>
>>> The converse is not true, but I can't see a use for deprecating a union
>>> branch without also deprecating the enum member.
>>>
>>> I think we can implement feature flags just for enum members, then
>>> document that 'deprecated' enum value implies corresponding union
>>> branches are also deprecated.
>>>
>>> I have unfinished patches implementing feature flags for enum members.
>>>
>>> Since TransactionAction is a simple union, the corresponding enum is
>>> implicit.  We can make it explicit by converting to a flat union.
>>> Simple unions need to die anyway.
>>
>>
>> Does BlockStatsSpecific from qapi/block-core.json a correct example of flat union you mean? I can make patch to convert TransactionAction to be similar if that helps (discriminator field should be called "type", yes?).
> 
>  From docs/devel/qapi-code-gen.txt:
> 
>      A simple union can always be re-written as a flat union where the base
>      class has a single member named 'type', and where each branch of the
>      union has a struct with a single member named 'data'.  That is,
> 
>       { 'union': 'Simple', 'data': { 'one': 'str', 'two': 'int' } }
> 
>      is identical on the wire to:
> 
>       { 'enum': 'Enum', 'data': ['one', 'two'] }
>       { 'struct': 'Branch1', 'data': { 'data': 'str' } }
>       { 'struct': 'Branch2', 'data': { 'data': 'int' } }
>       { 'union': 'Flat', 'base': { 'type': 'Enum' }, 'discriminator': 'type',
>         'data': { 'one': 'Branch1', 'two': 'Branch2' } }
> 
> The generated C isn't identical, but adjusting the code using it should
> be straightforward.
> 
>>> Does this make sense?
>>>
>>
>> Yes if it helps)
>>
>> Did you also look at John's https://gitlab.com/jsnow/qemu/-/commits/hack-deprecate-union-branches/ ?
> 
> Not yet.
> 
>> I hope you and John will send patches that you have, I'll help with reviewing (keep me in CC), and finally we'll get the feature.
> 
> Sounds like a plan.  I need to get my post-vacation e-mail pileup under
> control first.
> 

Hi!

Kindly remind in the case you forget :) Or may be I miss some patches?

-- 
Best regards,
Vladimir

