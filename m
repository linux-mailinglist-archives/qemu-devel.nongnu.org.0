Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2123DA2B7
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 14:00:09 +0200 (CEST)
Received: from localhost ([::1]:42114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94hs-0001Wi-8L
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 08:00:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m94Js-0000zR-Nk; Thu, 29 Jul 2021 07:35:21 -0400
Received: from mail-eopbgr40137.outbound.protection.outlook.com
 ([40.107.4.137]:55879 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m94Jo-00067f-Vr; Thu, 29 Jul 2021 07:35:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hx3fCmq+iUst9kQvCF7fxZrk+8jtrea3t3VeTezRLP1o3PVU+c5d0yQi79xvKA1Q6ZrDZjoRoyM8vX90+k3AxWjuh35qZrT5+kbcMqMqjWQ0t14umN7P47eGBzMSRC0wjtVHH4qqjIby3MTJXNJX76W0MxasTFg3fav8Qz7DBxhFYtawdh7rW/xDJcm2JT1Gn6bniT/AOrAQX36fetUJ3FybimkF4AflcxLIut23MAF/xqmxtMm94Tlov9oTfFc4GnqLvEkHqQM6wSe8V2sBk0X23lvbQI5pFKoxSw7mVv+wRNAaRUYxQPMhP3/F5ELIKJtyObv2dxTFQiQVqD/Gtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXI2C5AGvFzbYuy8RjKwyo3J0FegKA1e5T86k6CTzeg=;
 b=mG3twFdPjKoUuTiVpRhNtdczK0VVV8/oKPaIiOv+2KAHuKlN9ATKiNflFkQMhw0+bEbC8ThUpgp7xfUi2jfYydao01trD1Zg3pAHHVpWo6tPnJtUSsL2UNcyGJCItIE8gatkIwLsCNPQ48GCJRs9o+6GinA4XP89HGjjDZ+yRhcNF7kr6BBYPGpCBNy4mQWXsQRdZCL7YyzODaHbJVWz1w5qj1G+JGf0SbI8fWZaiVxaQINcfWiIMh5teu6AV2MWeQGEQSSq/NZqokmOmodn7XqE0m9Wd+1ZSHw3fZPi7NzTEV00q4fDm9VaKiCD77C0CyoU7kz13Q9Ml63I7Ycl4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXI2C5AGvFzbYuy8RjKwyo3J0FegKA1e5T86k6CTzeg=;
 b=ZTCTtPYRVYdUJPraf5RKXxqLup+YTuds3dwzrYNgBbuvYr23ILmjq1j0dLfPrHArcCPDsiEWoHt/G/GV/L9I0v8DuGQ+M9d7ndq+z4l/UZgKKaHmihcv8fry2gLIfhCqnpyjihZuxv3YrkBs3t8rWnn9hnG8Huk5MdQNN17d9FU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5895.eurprd08.prod.outlook.com (2603:10a6:20b:298::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.19; Thu, 29 Jul
 2021 11:35:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.021; Thu, 29 Jul 2021
 11:35:13 +0000
Subject: Re: [PATCH RFC 0/3] mirror: rework soft-cancelling READY mirror
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, kwolf@redhat.com,
 jsnow@redhat.com
References: <20210727164754.62895-1-vsementsov@virtuozzo.com>
 <eb6db91e-9b6b-331e-8a8d-ee4fcf60ff2f@redhat.com>
 <19e149dc-ff1a-09b3-2d6c-2d046e9daabb@virtuozzo.com>
 <660d9a7b-beb9-c2a2-33eb-d894aae8b1e0@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <af37e046-46d3-2791-f91d-bdbaec9ee5e5@virtuozzo.com>
Date: Thu, 29 Jul 2021 14:35:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <660d9a7b-beb9-c2a2-33eb-d894aae8b1e0@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.211) by
 FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.8 via Frontend Transport; Thu, 29 Jul 2021 11:35:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5102a4d1-2e69-40d3-d29b-08d95284ee53
X-MS-TrafficTypeDiagnostic: AS8PR08MB5895:
X-Microsoft-Antispam-PRVS: <AS8PR08MB5895F808D3A4DD8C4E92D28AC1EB9@AS8PR08MB5895.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yN0Gblabhp9iXq0DkndJvvYRM3JaQgeCHN7oaa4EnRaf1hqKt7QldHdqUNmXmoU8hS76xJbw5k7ZAQm9qe7i3LkCW8dhTcZNTheNqrN2KxjxSahs44uHmgkUCLs81v6VOYjuIXM+ZkFtH7zCkCtUzYTt98ayldfcoVweH12mmJyS6Du9glho2esMg9MiJ/5hL36DSpnqIbfuezclJtGZnxQTQToboGEqjPrapYPeG4YXnQ7pLMDLk5+Hxsh66GMEVw8CWsCnzpDvwBofHZAWvcH/nT0xdehPLXhosUupy3tf3iGiyQIrrChiG0M3yNzh0frsUL2cAMgeOlOgGUwFHN847N6GKtGYnta1H0v4w/7XmRY2OvDBqCSlCHEQLXuyIP1CQ0lHhyGFcQcZdN7jPWw5Mso7UVrbFSinmqxwOJOzAoVXbtUW3zQi/cMEH4gXi44BZJWvW6NaiDjM60pJ9qyrytfcWrwP4A5J8HKW1UHe+rOZpesyFOtmSpTUIe0CDv8Wcc5wsq+l3GzGX4LSIU5iF7vIBoWC7VXs+DXSGXOBOOk3dRP6/t8yObNPsx3TGaATvR7+dyP+qwcFYKlynyFyyZBwXBumhqWFTdSAq/t94t9sKg+/mt0F809olVBv2CnBVYepQobbU3aLcT1ksnLUxBtm6T/b2s3XgtVLUnvcaDdnPYjblY1cj9ZMRI/FqDPmBxEJR4DST9MKJCUpKFro7WzrUTU8YL/Jrz2SGOEOhpacxB5UjpdGt4TLpRLfSKzK6r9WtxlYjfl2OH+WvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(956004)(8936002)(8676002)(5660300002)(66946007)(66476007)(66556008)(36756003)(4326008)(38350700002)(38100700002)(508600001)(52116002)(31696002)(53546011)(2906002)(86362001)(16576012)(316002)(186003)(26005)(83380400001)(31686004)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azBITENmNTN4QjIyMlo0U2FYWWdndWZtc2pGQ1VxUWg1R2NMNTdlNVA0Sy9Y?=
 =?utf-8?B?Uko5U0dqQjhrcnhhdGpuaGNWcFN4dGVhVDUyRW5ZbFhvaDg2ZUZVZGJiUmVa?=
 =?utf-8?B?YUFtVDFybW96OVdPeDhpdnNXSzc1MlhmNXlsVDVsbWtMZWRlVHNoWk5iZXlX?=
 =?utf-8?B?OXpTWWFKdDBrMVp2Qlh4RndweGgxeWhUYk1iVDVXaVFqQThWODRlRkd1U1Ja?=
 =?utf-8?B?Q1JDUXkzdHVMUTM0UUE0d0NJN3FBVmlmTlFaTlhFVldSNlc3YWZOdDRLcVNm?=
 =?utf-8?B?OXgyK2xkRDVoUEtCRGZpZ2gxSHArdXNYSkNFdnYzNzlCeXE5WDExOWJ0UjJy?=
 =?utf-8?B?MGw1RU0xVUZHY2pYQ3hlVkUzUFhMWi9PUC9FWFUrSy9Hd0tzU1FVYU9CdlNE?=
 =?utf-8?B?RU80NUc4M1o2OVRYNXRTVmN3T0syeUZweXlLc2M3a05WaGJlc3FUN1hubXJj?=
 =?utf-8?B?UWt6SU12Yk5VaUUzSnNLTXNPaVgrTHJlYVdNK0tSdGMyWWl0Vm9GbEZvQXFi?=
 =?utf-8?B?WWJyZzlZQkFsZkljQWtxdTVZYWVEQWRHa1J5OFhuUng0blRZMUpqTnZKcmlR?=
 =?utf-8?B?UDJXTkZWVXdDMU51d0gwZzRJQ0lLSm5RZW1hZzVoTEtSTFZJUVNXb09iOVUv?=
 =?utf-8?B?NHp6NTdPT2NYRU9nMjNleHpCcEkxWXZJMmFRRGpkU0w1WDBWaDI0LzdtNTE0?=
 =?utf-8?B?Wk9LL2k0VVFXQ3lHd1Z1aHJ5WVlnMXQ3THVGaUp1YkVSRkUyMGUyUVBudURx?=
 =?utf-8?B?eDdzSlVqb1Z3MHg0cGx0ZmlWQUVjNmY4OUpOUDNQNXh6TVZsYjhqc0dQV3Zi?=
 =?utf-8?B?UnNYV2UyZFlqV1FRckJ5d0lRa1ZjRERlQTlxQ3liTXlSbjFaWEM5dk44SnlO?=
 =?utf-8?B?b0o0UXFIWmI1Mzcxa0hOZjhVcmpEbWlMbGpBREl6cGEybXNYcFp5SUNOYnFG?=
 =?utf-8?B?cHNLL0lTNXdUK0NZTWQ0YzVXMUNyRXh2b2VPZG5qd1ViRWNHZ0dtcVV1dHh5?=
 =?utf-8?B?aW01MjBTMEhBWlFyb0JMQUtJSHVWNE4vUFJYM01OTkdlSzVCdVgxQUszak1r?=
 =?utf-8?B?MFhvcWk2OWM0aDFCV1EyamIzVUEyaFAwbFlhOFdUVE5oQnl4TitHQndaV0Zl?=
 =?utf-8?B?cHNWZ1NPVHlnNDg3UkJSWDRzZDVjMDd1cVczcVlDWDR3WjNPQmVNVmdqUVpU?=
 =?utf-8?B?S0Y2N0JMQWVZTTlOZk1kRTRvREFsNE1GZk5pOExZcnVVSTN1VVNVUkRBNVhh?=
 =?utf-8?B?MmVkSXVOVkpCaFJRbm9vODdXOC9FT2FoOGpvalFaS01kSldHZzBnUGgrSU5S?=
 =?utf-8?B?OXZsaEFyQ1l0Z0o3a1hZZ2V3R0dLSHozSTB1NlRFWUZxTzlTUk1OK2xNOERT?=
 =?utf-8?B?M21TZGJROWJLZDBoQnd2cVE0ajFpdytHRVY4ejVYUGlwV0VMbGhva3R4UFFy?=
 =?utf-8?B?MWpFelRLZ2pUOVNwRTk5WFRDV1dWMkpweGpjaGlQS21Bb2dGMWdJc0FCSCth?=
 =?utf-8?B?c085emk2bklIYzRBNFRCR3IrZVloMlRGVTFZNWZ4bXI3WXFrSnFxc2xQNVhF?=
 =?utf-8?B?MDRyQk42d0hacjJDVmVtcUQrRDJuOU15U05xQlFRWElBOVlHRnhGcUFmT04z?=
 =?utf-8?B?bWFiaGtIZUYya1hmVHZ4VzI3SjI1R243SnJ2VUk4ejNneHZaTEhjcmloOTIr?=
 =?utf-8?B?SXQzcjdYTStHZW9IUmdKL1dwc1VDRlFqL1NHK0o2UTZ1a1ZGU0xWSTEwYXQx?=
 =?utf-8?Q?Id4bNONBRByYkX8vLppE5pEenUwV0DtRX4vZqkH?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5102a4d1-2e69-40d3-d29b-08d95284ee53
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 11:35:13.8442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x2kqSZ6YmEiV74ZCteOKzRzvKJ3SZA/+P99VDquI0h18/oAC9A4vQcVFdlIj8x/7LS0jLFspmosPVg9+f/XTBlj8W31V4FCimVQUjxpLTDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5895
Received-SPF: pass client-ip=40.107.4.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.125, RCVD_IN_DNSWL_NONE=-0.0001,
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

29.07.2021 13:38, Max Reitz wrote:
> On 29.07.21 12:02, Vladimir Sementsov-Ogievskiy wrote:
>> 28.07.2021 10:00, Max Reitz wrote:
>>> On 27.07.21 18:47, Vladimir Sementsov-Ogievskiy wrote:
>>>> Hi all!
>>>>
>>>> That's an alternative to (part of) Max's
>>>> "[PATCH for-6.1? v2 0/7] mirror: Handle errors after READY cancel"
>>>> and shows' my idea of handling soft-cancelling READY mirror case
>>>> directly in qmp_block_job_cancel. And cleanup all other job cancelling
>>>> functions.
>>>>
>>>> That's untested draft, don't take it to heart :)
>>>
>>> Well, I would have preferred it if you’d rebased this on top of that series, precisely because it’s an alternative to only part of it. And if it’s just an untested draft, that would have been even better, because it would’ve given a better idea on what the cleanup looks like.
>>>
>>> There are also things like this series making cancel internally always a force-cancel, where I’m not sure whether we want that in the replication driver or not[1].  With my series, we add an explicit parameter, so we’re forced to think about it, and then in this series on top we can just drop the parameter for all force-cancel invocations again, and for all non-force-cancel invocations we would have to think a bit more.
>>
>> I now don't sure that patch 5 of your series is correct (see my last answer to it), that's why I decided to not base on it.
> 
> Well, we can always take patch 5 from v1.  (Where I changed any job_is_cancelled() to job_cancel_requested() when it influenced the external interface.)
> 
>> My series has the benefit of handling soft-mirror-cancel case the other way and handles mirror finalization in case of soft-cancel properly.
>>
>>>
>>> Specifically as for this series, I don’t like job_complete_ex() very much, I think the parameter should be part of job_complete() itself.
>>
>> That was my idea. But job_complete is passed as function pointer, so changing its prototype would be more work.. But I think it's possible.
>>
>>>   If we think that’s too specific of a mirror parameter to include in normal job_complete(), well, then there shouldn’t be a job_complete_ex() either, and do_graph_change should be a property of the mirror job (perhaps as pivot_on_completion) that’s cleared by qmp_block_job_cancel() before invoking job_complete().
>>
>> This way users will lose a way to make a decision during job running..
> 
> On the contrary, it would be a precursor to letting the user change this property explicitly with a new QMP command.
> 
>> But probably they don't need actually. Moving the option to mirror job parameter seems a good option to me.
>>
>>>
>>> Max
>>>
>>> [1] Although looking at it again now, it probably wants force-cancel.
>>>
>>
>>
>> What do you think of my idea to keep old bugs as is and just deprecate block-job-cancel and add a new interface for "no-graph-change mirror" case?
> 
> I don’t see a reason for that.  The fix isn’t that complicated.
> 
> Also, honestly, I don’t see a good reason for deprecating anything.
> 

Current interface lead to mess in the code, that's bad. Cancellation mode that is actually a kind of completion (and having comments in many places about that) - that shows for me that interface is not good.. It's a question of terminology, what to call "cancel". Also, that's not the first time this question arise. Remember my recent cancel-in-flight-requests series, when I thought that "cancel is cancel" and didn't consider soft-cancel of mirror.. And reviewers didn't caught it. I don't think that interface is good, it will always confuse new developers and users. But that's just my opinion, I don't impose it )

If not deprecate, i.e. if we consider old interface to be good, than no reason for this my series and for introducing new interface :)

-- 
Best regards,
Vladimir

