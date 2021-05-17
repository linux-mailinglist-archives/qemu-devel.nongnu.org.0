Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A824E383DD2
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:52:26 +0200 (CEST)
Received: from localhost ([::1]:42112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lijHt-0005Vo-Or
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:52:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lij8P-0001pE-7l; Mon, 17 May 2021 15:42:37 -0400
Received: from mail-eopbgr00092.outbound.protection.outlook.com
 ([40.107.0.92]:14262 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lij8M-0006To-1g; Mon, 17 May 2021 15:42:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R9tWRcR8QGIYDR8Gh7UMF7a28IgkIrohyO0VK0sKM4RXRMVnH4PbLPMltPG2iuJ5YIEkXRN5UKN3RqCeiLbaX2tcNIcNoWEk93sd29FXLlengbIb9FupeW1PDdnFN+IhoFfmuo7kgb8c+UkX9K8Gb6LKeJwWKteHSHmuJ8T4K7hOanPnaNSipWVTeH8bKwG+nhH9eCPyeGza+lPV8JZcCA9YmsE8PFhl/kRH0kC0rO64g48R1RbSJFyGVmQOTSPIHuwz7Y+2meReL93xz/nFti+r3YPz3uL68TSGZclzgbdmYTWKIqJoMVC9d/PlYrZqW8nVTg4eLgozTUlEF3bFqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5AT++RvI49Tncm6uU94HWIQ4QrI2zq32ffTlgJUgGZ8=;
 b=a7Jjpn5frM6QeeIemjYkWX5KjbpW1VxktpCxc8lW3T7SjDKy5BNnppK2k5DbQOpcJy9iEiKKzYrJ37UmydzsISZAt6Dz8wZ24AnMethFy/DN2sw/59PSziGis1rSxnwmE/EiBDcW7Rr4ygtGvlvTGiLHJ1w/ayXiV3N3ZiSTZ2kusWeap78Z+OU2Qb7LNPOS2DTtmMeiZa8nhzqKzjIbOTvzjR51+mtXJKPOfe2YrDODBcdx/M5/WXH6/Uf3Zigl+0OSmBUdnw9g+dkJeBuCucqixrWrkIjLWLZv5k5WcFfAouRaF7DMmXNBX0GEeFMvYrUgNN6qTIlic8fQxF9bkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5AT++RvI49Tncm6uU94HWIQ4QrI2zq32ffTlgJUgGZ8=;
 b=qXR9xvSAGIJE1aUxp+SBPnoL+SgwNMhH/SC2TImanKhFvAQpxGpcqnta0QK8N1jaNZ8lGuubTEWwZwoIjz3+0IWh5SXZLWdTT0eFCd1xjtB9sxrj0FvoKW1vdAtk97IAmrz3wC4Vxt+XiCBaz2++FNMmOEsDaFC1CQ8z4Lpix/E=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2035.eurprd08.prod.outlook.com (2603:10a6:203:4a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Mon, 17 May
 2021 19:42:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 19:42:29 +0000
Subject: Re: [PATCH 05/21] block: rename backup-top to copy-before-write
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 jsnow@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
 <20210517064428.16223-7-vsementsov@virtuozzo.com>
 <75715377-5f8e-7be6-6fab-f87b015a33e3@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <22561008-81a7-d8ba-3895-440437168b92@virtuozzo.com>
Date: Mon, 17 May 2021 22:42:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <75715377-5f8e-7be6-6fab-f87b015a33e3@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.231]
X-ClientProxiedBy: AM0PR06CA0102.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::43) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.231) by
 AM0PR06CA0102.eurprd06.prod.outlook.com (2603:10a6:208:fa::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Mon, 17 May 2021 19:42:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3cde3e12-ac67-4e67-51f5-08d9196be80d
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2035:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2035063BAD92E333C4919162C12D9@AM5PR0801MB2035.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3+OdkrnKTtW/cFRhata5jd8cSYxmQvBpy1RYulEzUCbIUG22d1CBFqb/f6E+7a3o3yprG27zAUYte453M+HJu/I3kT+pY5WSI0ICmm7NWVZLvXEu6Des+q6zRiuXO3qr1842dsiSOkTo0WWBsb67CghbgyNqgJgOwWfo+9r6y6vtJWk2iAlRruQmIZBxQwT/vL6XjeBMPFM16GNm9SeiSgYznhfyi/v5y/3DY7SgnT0+Ke+Eh7vzkHnREaiZG+CY7MtRJIgC8jD01wb0Ep4WvHsSrqvJ66oupFVFGQ0m7iXmqg4T/nETlB2UGY2hGF376sYdSvLNz4C2dmhWTd/MpEoeyKPMy1qRXO2eLG9ZNhVHTN92Aw8E/GrZdvU8PWBvTVxmqLsgtMQz0AHgzZyC2H21SW14KLW0WA4PcCvvK9I52wmJGoPEOncb2Jk5KriPKoV9lBsGbdHpYXEKUpoTyouMCKC5HtzmMvdL5hhntnlOmqdW5aXgKiypK/BgxnAdWqU9dT1/TSxf5TkXf7QmINZ8WHDULqtyWQIakHhrZIBmTL8PHI7GLiIn60KIaVpLD20mJeMRrZeXUcfsdnVRQFIE8rrvJz+MrMZa+DPJYvtaWHHL78gJOheP5YsgUI0XeqZVQ+Qei6JvRR6kBMXKyRP04lLduROkIP5xByhOvkwgcS+NUzehsLpdhUi4vQ/arbcoDC4oIB0cYy0NNUwk9PsVTF27MHjiEogFIP+rPdU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39840400004)(136003)(346002)(376002)(956004)(2616005)(66556008)(316002)(86362001)(83380400001)(7416002)(16576012)(16526019)(31696002)(8676002)(8936002)(66476007)(52116002)(107886003)(5660300002)(478600001)(2906002)(38100700002)(26005)(36756003)(4326008)(31686004)(53546011)(6486002)(66946007)(186003)(38350700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?alo5TnZaZ29scEVYbk5UY1l1empiMTJBVUMyakpWbTYra3pLT29hRXZndTRw?=
 =?utf-8?B?VHNRRXo0MGdWQjNsaTdSRHp5TUw3Sk82VTd2c2ZjUUxjSzZlbFpXb3owaTdQ?=
 =?utf-8?B?RU9Vcm5Db2dDMktma3VtOWE5R2k2ZmtoTkpzdXhPMzVOL0xlUEQ2S01YY0k3?=
 =?utf-8?B?akJ1alFmRE9SYU5sQjZWYmtqeHZZTmxod1ptRWx1SlFKSGg3TkhOajR5cE0x?=
 =?utf-8?B?dnN3RlU0Wk1BZ2JhS1E4RjRodklMeWtHNTQ3dDZIVnNrWUZsSjgrcHgrVW5o?=
 =?utf-8?B?RGRvajM0cVZQQWJMaGRXUm01U2FVbUdvemRvLzBabHhNZTdWMkRGcFlyYml4?=
 =?utf-8?B?M1kwUkxFeTRpMHcrcWpNNFM5YzYzb0xpNWM4ZGpib2VKYWZWOUI3eWt0Sk5P?=
 =?utf-8?B?QUNVU2NveE0wbXZWUVN2MWwxbk1sZXBocG1yYmtkbUs5QWdVVUtrNEs2anVS?=
 =?utf-8?B?MkRLem9kb2NieS9mT01ET2I1dVJnTFBLcExrVWVaa1F4dXFPREhMbkhhMG45?=
 =?utf-8?B?NUdwdWtORWdSK1pjRVJFSFBvSmRYdEFYY0swZEpWcGVha2FDUFliR0dZTmFh?=
 =?utf-8?B?dkQzZmpkaGd6TCthTk9qRkRMSkQwMk5SNk82My8rVzI4VW84WnhxQ3dOYnpw?=
 =?utf-8?B?aXc2K2h6K2VSeEhicEQyd3B3NnMrYmtYYk5Bb3VnYk9ObnIyMGsyZlFrUHR4?=
 =?utf-8?B?NVlBMTY4bTBrWVlwalhaZ1ZicFRhRjNkNGFNckp5YWluVGtQNnpjR2FUZ1Bi?=
 =?utf-8?B?cGtSV1hKVmdDUnk0QTZpdmprbi9sQ25HY3dMM251WXRUbnhYdW81cm10dGcx?=
 =?utf-8?B?K1JLWFhzZG9iVnpzdVFQTDF4NVpHNVR3aUxjUWRza3IyMmVGb2t0Y3RaaG1G?=
 =?utf-8?B?NVV6VmZEWm5GUFR0dkNYakppZkJaYmMxTjByQkdkVkgzNjY5K2Z2cGxjaTdR?=
 =?utf-8?B?M2xZRVFGVlFraGVlK0hwZUgwY0V1bS81d3MxV1puU1oySHd5WDViVkM1U0tk?=
 =?utf-8?B?em5FdGozQlc1aHpTblQ2VjBzUUwvbi9WQ2hJVENOTkMxTUtMNzN4S2RWUTk3?=
 =?utf-8?B?dGg4WklQRFBoVTBxdEFoYXVOSFo3a200emxHQ08xRTNQbndoUHhKa3RXOGJH?=
 =?utf-8?B?d1NlRWNFVjcwQjlQVS9jNG5TWGxaU0RiVDQ3U1VsOUNoeGU3cnowUGN2Y2Zt?=
 =?utf-8?B?R1ZrRm0zY3QyVTQvWWQwZzN6bWZXRkZDbXNmZmVIZjZkK2Z0OXlxYm00cmpY?=
 =?utf-8?B?U3ptbEJlbk91WVNXa0lzSzd2TCtnc2RkZzAvTVFMNzVyY3hsK0YyMjNGRS9p?=
 =?utf-8?B?R3BVeTJWSlZzWHZKNDA2WmM3MzNDNUZEaE1nQU83RUJJUjRLTGVjeEltTHBv?=
 =?utf-8?B?WHg4VWpFWGpYRXUvK1dPdHpSOU4yd1FTMFJ4RnpCdllEejNuMXlISUdoOG1Y?=
 =?utf-8?B?ZVpLK1Jwc1E5RnRWOGZuNnpvOE8zbEMvbDRGTXJFWDFzeUhsYkhGOFpmMWpr?=
 =?utf-8?B?cG5SbUI3bHpQdW1iS0dWK3FjS1l1eHMwOHBxS0hFMHA1NWY5eVhLUXhiT0I5?=
 =?utf-8?B?SkNMWlE5UWxXZXYrSW1IanRua0JmU1Aydkx6dVRKWGJaRSsybmZWRCswRGFy?=
 =?utf-8?B?K2RQaythMWdSN1lEVkljV1RVbzMwaVpTejl5VXdlMkw1ZW9BTmhzOXFLaFFZ?=
 =?utf-8?B?NGpzcVJIZFJsNFF0bDByYmZDaG1nSUJCaFQ2VjZaZHFKMnZ4akc3dmcxaDdT?=
 =?utf-8?Q?zu7/j4ytqXLDo7JNSEy+uH2KdmFjAbfHX+f2tDp?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cde3e12-ac67-4e67-51f5-08d9196be80d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 19:42:29.6521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: alUgrHQKlm6Y/+7I5c8SErBZdOJzKtOhnlWWtSCUgb9q7q77WSuhKKk0in1sHEAX9e9Ywuae6HTbiM9hoW3btnEqxT1Et1SWI9bLi5Tw17g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2035
Received-SPF: pass client-ip=40.107.0.92;
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

17.05.2021 19:05, Max Reitz wrote:
> On 17.05.21 08:44, Vladimir Sementsov-Ogievskiy wrote:
>> We are going to convert backup_top to full featured public filter,
>> which can be used in separate of backup job. Start from renaming from
>> "how it used" to "what it does".
> 
> Is this safe?  The name was externally visible in queries after all. (I’m not saying it is unsafe, I just don’t know and would like to know whether you’ve considered this already.)
> 
> (Regardless, renaming files and so on is fine, of course.)

Hmmm. I don't know.

It was visible yes.. But we've never documented it. And if someone depends on name of the format of the filter automatically inserted during backup job, it's a kind of "undocumented feature" use..

Another change I is changing child from backing to file in 11, from this point of view it's unsafe too. But ше even more reasonable than good name: having all public filters behave similar is a very good thing.

So, may be it a bit risky, but I think good interface worth that risk. And we always can say "sorry guys, but that was not documented, we didn't promise anything".

But I'm OK to go on with "backup-top" and "backing", is someone has strict opinion about this.

> 
>> While updating comments in 283 iotest, drop and rephrase also things
>> about ".active", as this field is now dropped, and filter doesn't have
>> "inactive" mode.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/{backup-top.h => copy-before-write.h} |  28 +++---
>>   block/backup.c                              |  22 ++---
>>   block/{backup-top.c => copy-before-write.c} | 100 ++++++++++----------
>>   MAINTAINERS                                 |   4 +-
>>   block/meson.build                           |   2 +-
>>   tests/qemu-iotests/283                      |  35 +++----
>>   tests/qemu-iotests/283.out                  |   4 +-
>>   7 files changed, 95 insertions(+), 100 deletions(-)
>>   rename block/{backup-top.h => copy-before-write.h} (56%)
>>   rename block/{backup-top.c => copy-before-write.c} (62%)
> 
> [...]
> 
>> diff --git a/block/backup-top.c b/block/copy-before-write.c
>> similarity index 62%
>> rename from block/backup-top.c
>> rename to block/copy-before-write.c
>> index 425e3778be..40e91832d7 100644
>> --- a/block/backup-top.c
>> +++ b/block/copy-before-write.c
> 
> [...]
> 
>> @@ -32,25 +32,25 @@
> 
> [...]
> 
>> -static coroutine_fn int backup_top_cbw(BlockDriverState *bs, uint64_t offset,
>> -                                       uint64_t bytes, BdrvRequestFlags flags)
>> +static coroutine_fn int cbw_cbw(BlockDriverState *bs, uint64_t offset,
>> +                                uint64_t bytes, BdrvRequestFlags flags)
> 
> I’m sure you noticed it, too, but cbw_cbw() is weird.  Perhaps cbw_do_cbw() at least?
> 

OK. Maybe even cbw_do_copy_before_write()


-- 
Best regards,
Vladimir

