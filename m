Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A48F9375823
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 18:04:21 +0200 (CEST)
Received: from localhost ([::1]:60782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1legU8-0001eH-Li
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 12:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1legO8-0007tG-HF; Thu, 06 May 2021 11:58:09 -0400
Received: from mail-eopbgr00125.outbound.protection.outlook.com
 ([40.107.0.125]:34738 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1legNu-0000ai-Vj; Thu, 06 May 2021 11:58:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gSt3uBc93Z+0K8y/4WwHpl4McRZDi0d7BuV8Q/TmyOF8h5N1J8TW2Jh4qYB2c6AnWQ6Nk5XpGArdO7PMURzbzA6te0wq1y5GWWGoPWfrcJjCGwemCODvp2PZyUUijvBDqx5ILBkY01DWmRTjobvj/V55xGhFypE420APADcHygsJnK5cRZdjzYVoK7lle22+7/A4hqEXaPTMfuoSoFoBLafOZYwsa0karAi8t8VQecApC82Q3jmD4GKJpyTfeu+iZERhqCZccfImqORP8pEI9b38zmiRiUyca6mB9blPpXfKivmJ7gMI/X8Ys0IFem2kkWcTFR1avmc20/GOQZkm/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXGOgeAOLpTjVvugj/bybNXysPMKKkecxeViGEwZJLw=;
 b=A6f5uTbsGjT4JFoLDeE0tNsD7ubpq/AY//QgtMc6pVgNHI6u1x+HjXgnQKbyV/cyjTLHPPg3/RiXnPZKie39nU8iB6BKma3E1JzQNCBfpLl7fj+b4d5J73Pwp6roa1Kh1cjyyJgXd2ReUMdz25oOl6d/i4NsaSUDGkDkiAxu5VrgdR2dsFWSlv/Zeqaz/JLzxrtvQcivmudRPmtkExMFc2QN1oDI9QNMwWUUPttKZVh6TpjC3pBncrpY+bcOkRg7QHga+Ek+uPxwLLvW1uPXJbH1VPjrTMOjuduvgDaEmWrBJi99m09V6LEYhbTriLjSSXpj6wR/IEGg56rj0HLI2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXGOgeAOLpTjVvugj/bybNXysPMKKkecxeViGEwZJLw=;
 b=Z84uGf9ypDtoQo9dvQJzsYCpRGyTUW9dqqcL+1NxZjb+LroKnbdTcSCXM+wOCya1L27CbrJKzvKY9Bu19B6eAl/sMi5Lkpr0ymyvWL6VrMNvGkN0ot7xkTqEu5ipZOTMd8iWeeXHPKQnz9r88JdLTB8bLVuBs/FpS2Ku5prf+cQ=
Authentication-Results: dreamhost.com; dkim=none (message not signed)
 header.d=none;dreamhost.com; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3864.eurprd08.prod.outlook.com (2603:10a6:20b:8e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Thu, 6 May
 2021 15:57:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Thu, 6 May 2021
 15:57:45 +0000
Subject: Re: [PATCH] block/snapshot: Clarify goto fallback behavior
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 morita.kazutaka@lab.ntt.co.jp, gregory.farnum@dreamhost.com
References: <20210503095418.31521-1-mreitz@redhat.com>
 <29db0d1f-2d60-7df6-e6d0-97b89cf636ef@virtuozzo.com>
 <11eaa840-a882-3ba9-3069-91501b4c92fe@redhat.com>
 <e4fee62c-dec6-052a-9d9f-087bbe6b9530@virtuozzo.com>
Message-ID: <453ad949-d6d4-cc17-6eb3-2abe1610fa9b@virtuozzo.com>
Date: Thu, 6 May 2021 18:57:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <e4fee62c-dec6-052a-9d9f-087bbe6b9530@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: PR3P191CA0056.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.236) by
 PR3P191CA0056.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 15:57:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f437d9a5-ec73-4847-cc35-08d910a7b049
X-MS-TrafficTypeDiagnostic: AM6PR08MB3864:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3864564D5DED1EE6B97C353FC1589@AM6PR08MB3864.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gibgF/mlx/jQ1QTjVhq6UGvH02jo4KTuts07ywNe8iioovIaLA+c390AbgGG4bFgIaN0XPZbG3DBL3CRWD2/ywvtjhs/GPq0CDv9oOsAnrZBVpGqePTAUbBuYHYPHaWXm7p9YYbMbHq7r7R3jIDC6kj4gIPIyQB5s6fXe3AOnJm8+C2/MmjpEPc5Ghqpnru2a6lNOvRdslbUsGqWoFtaD2H1gtxbom1y+a1S9EpT59Gwp0OVLtfX29nep8piqVEy3w/nR6PFx83SKruCB3SOMp4I9ePsRdUVFMwpbj4uThJNYr8PVYWCX4zz7f0ewU+wj6mCaM8k9GwIAL4K8bXZQtPTSqnFLmqSapwn30kl8hfZIch2G5krVnJLATNoYCsBvKbxS8rkDsxLCDfEMrE+wqaxMSmyBZkXDBpLmDGhFG5muzQmq17Rjoj5HAG3L4KLTgL28sjhRHvvNNIRCo5toItxuDHDOalqBp9l6rYYnzB7kixxKafkAGOZlV7zF0agVz5rRm+F6sGlWBIdD/cJERWW1ZnENUN5FaEFxeOohbX2Tl4JBDkDHU3vmYWgeaMfh/n7zqyUVXBbYH5euxcrAsUdAg1w8mJBMKI5uKOMeVZEJnmRZzRE+K0r9XZqFgRV00yo4G9ctn4HtTnsNjxpTKOOh/QlqlVqERB46ghRBhhMyjItzz87waLjSI/IMxWH2bUfbHcwXz0Fd+x7JJdJfhrDO8QX9fw6CZQjr/NlX90=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(376002)(396003)(366004)(136003)(86362001)(5660300002)(66556008)(26005)(8936002)(66946007)(52116002)(2906002)(8676002)(16576012)(4326008)(31686004)(478600001)(6486002)(83380400001)(16526019)(186003)(36756003)(38100700002)(38350700002)(956004)(53546011)(2616005)(31696002)(66476007)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N2Z6bXFQL3UvRFdhK2xmZDZiZHFUd2N5dGhPaEJlS3gvL053b2krVHBMSkZu?=
 =?utf-8?B?MEFmR0JyUVhPKzFsdGRuL2IwWklPU0JRZGkraU9UQ3BMUlVXVFJ5ZTVKTEE3?=
 =?utf-8?B?U1VscUx5OXAyV0gydFQxWVRLb2FZeFpucEtZQU0vaWRiZjFkVWlOL0JoQ2hX?=
 =?utf-8?B?ekRaalhhUC82cHk0dHBsdVZCL1RhYXZ1N1VNUytmQ01yNldhNmUzQ21LQjlS?=
 =?utf-8?B?dzRqV1BwbUxiWXNIUmMzVG82dHdERmtLTjhrYkEwNE5sRFduRWFJV2JCN0FL?=
 =?utf-8?B?ejhyYTl0TVVGenROdk1nZWMwQXdpMjhVZDFaeW1iYjR1cEVzNWhIa1AxMGt6?=
 =?utf-8?B?KzJsU0pPK3Jvd2RaaS9NL0I2YWE4eHM4aXdoQjhQcXlPanNwQzUvUUxCQmx1?=
 =?utf-8?B?M2taVzI2UkFOTmJXRk5LTHJ6Wkp5SzUrekhadUE1MzMrOEFKeEVsRnFIZTVn?=
 =?utf-8?B?R1ZrMkcxRmduWkZXZC9ieGphUldEUmVkdnF3dzYwUnJDMnJvNlpBTGtTK21D?=
 =?utf-8?B?UVlUekhVbzJ4aGFxOXhoS1gyMGUwcXI2MlN4a1A3Y1Y4NDEvTzlJTXQ0ZXVM?=
 =?utf-8?B?Z3liWC9tc3pNcDhsazU5S1RuK3YxUDlXTXFqTFk5ajkwV0xYbmdXWFM2UVZp?=
 =?utf-8?B?V0NEV0g2aHZuT1pGcEZaK0RNNDI4SDg3dHo1OGZzNGhmYmZtTDE4eUl2ajV2?=
 =?utf-8?B?am11QndqWFVPQ0RJQnJ0bWFsS0ZNdFBwK1FUUHJ2cTcyOEVVeVhNTWk0aHVx?=
 =?utf-8?B?MEVlSHJnUkdyNXNMcWR1T294QVRTbHZMVGhnaFRuVUNzRm1qQzlaV2QrSUlx?=
 =?utf-8?B?MGhSQ0VxdnMyVjY1ZGhqMFNlSFByLzBqRUpDSnBMZWlieEhMcEhEa1BuRXRK?=
 =?utf-8?B?ZURqOExBUUJBcDJRNTZIVjRnZUk3ZjBWQUhYUlZmU1JnMTljTkZLZXNaRmQ0?=
 =?utf-8?B?VFZzUDFWUHVGWm1NUzlJVVdFSUVGZlh2MVBmWm10cVZtaHNkQ1JMcDhGR2Q2?=
 =?utf-8?B?b3hxaEFTTWxPZGtkZmNId3FGaUJWKzNSOGxreE5uMVdIMmVsNVRYUVMxb01t?=
 =?utf-8?B?Mk5ycDZCS2NJRmRZNHkyeWJsWnZIUjNVa21tM083S3UwRUJzNGswU1pVZ2dN?=
 =?utf-8?B?aTNkRWJhZWpsTWMyUUpWdjhhUldaUE16Y204MHJqRDZJR2xpUmxldnJyekQ5?=
 =?utf-8?B?a0drKy8wUEVlNjNUYWtUc1c2U0ttVlRTQXR1RXBkdGR3MDg1VGVYeVBTVVQx?=
 =?utf-8?B?UmFiUmFEMHJjaUdtaGhQWi9aRzI5Yk5VQ0l1c0g1Y2tLWDArZzNNZ2t5cjRx?=
 =?utf-8?B?bjVUYUk1anNseWpKeUhwUVlWOVp6TjdhaUt4QjFoZ3ZDSm10VzhrMDVRVWFR?=
 =?utf-8?B?T0FhSXhXMVhBZ2lZMVhSMFNaZHBibitIMTBBVTE1aUM2T2QxOGg5ZmZTSTUz?=
 =?utf-8?B?aTc4RlAzdHYvbUd2NkZhR3cySkhlRmN4bDU5MU42aUZTOXh1SmltZjNaSXBY?=
 =?utf-8?B?TGtaZkdzNUk1MWdmVytCL2JReGJVYnpQeURLVGVKdktySEVERytycG1vcDcr?=
 =?utf-8?B?ellkelVnOGlZZG1RV1VQeHhLMWRBc0tleVgyZXN0TjArdDNIZzljWStJN1R4?=
 =?utf-8?B?Zi9OZlBlTzhaUDF2akFyR0w0WTdvSWVhVktzejAxenVZWDlDQjEyRDZWR0pC?=
 =?utf-8?B?QVZlRUZKU1MzbGpwRlBrOHhXc0NIVE9TcHpGcG84Wm9hV1VNYm9wTzJ4aTlm?=
 =?utf-8?Q?xwNrR6XxukaMWZkRLz0WL7+zs/iMtdaG1Rq/pLS?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f437d9a5-ec73-4847-cc35-08d910a7b049
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 15:57:45.4398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MEIQ5+8amnHqGRM2LM7usUffNEoKxYNWBngP73dKIPezB1l+ZlLLushUZm06HCITMZinCdpL7H1VG4rZ+TKnG+rY3lUeYkbEOa00VfqAN/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3864
Received-SPF: pass client-ip=40.107.0.125;
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

05.05.2021 23:37, Vladimir Sementsov-Ogievskiy wrote:
> 05.05.2021 19:25, Max Reitz wrote:
>> On 05.05.21 17:05, Vladimir Sementsov-Ogievskiy wrote:
>>> 03.05.2021 12:54, Max Reitz wrote:
>>>> In the bdrv_snapshot_goto() fallback code, we work with a pointer to
>>>> either bs->file or bs->backing. 
>>>
>>>> We close that child,
>>>
>>> Do we?
>>
>> We *detach it.
>>
>>>> close the node
>>>> (with .bdrv_close()), apply the snapshot on the child node, and then
>>>> re-open the node (with .bdrv_open()).
>>>>
>>>> In order for .bdrv_open() to attach the same child node that we had
>>>> before, we pass "file={child-node}" or "backing={child-node}" to it.
>>>> Therefore, when .bdrv_open() has returned success, we can assume that
>>>> bs->file or bs->backing (respectively) points to our original child
>>>> again.  This is verified by an assertion.
>>>>
>>>> All of this is not immediately clear from a quick glance at the code,
>>>> so add a comment to the assertion what it is for, and why it is valid.
>>>> It certainly confused Coverity.
>>>>
>>>> Reported-by: Coverity (CID 1452774)
>>>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>>>> ---
>>>>   block/snapshot.c | 14 +++++++++++++-
>>>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/block/snapshot.c b/block/snapshot.c
>>>> index e8ae9a28c1..cce5e35b35 100644
>>>> --- a/block/snapshot.c
>>>> +++ b/block/snapshot.c
>>>> @@ -275,13 +275,16 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
>>>>           qobject_unref(file_options);
>>>>           g_free(subqdict_prefix);
>>>> +        /* Force .bdrv_open() below to re-attach fallback_bs on *fallback_ptr */
>>>>           qdict_put_str(options, (*fallback_ptr)->name,
>>>>                         bdrv_get_node_name(fallback_bs));
>>>> +        /* Now close bs, apply the snapshot on fallback_bs, and re-open bs */
>>>>           if (drv->bdrv_close) {
>>>>               drv->bdrv_close(bs);
>>>>           }
>>>> +        /* .bdrv_open() will re-attach it */
>>>>           bdrv_unref_child(bs, *fallback_ptr);
>>>>           *fallback_ptr = NULL;
>>>> @@ -296,7 +299,16 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
>>>>               return ret < 0 ? ret : open_ret;
>>>>           }
>>>> -        assert(fallback_bs == (*fallback_ptr)->bs);
>>>> +        /*
>>>> +         * fallback_ptr is &bs->file or &bs->backing.  *fallback_ptr
>>>> +         * was closed above and set to NULL, but the .bdrv_open() call
>>>> +         * has opened it again, because we set the respective option
>>>> +         * (with the qdict_put_str() call above).
>>>> +         * Assert that .bdrv_open() has attached some child on
>>>> +         * *fallback_ptr, and that it has attached the one we wanted
>>>> +         * it to (i.e., fallback_bs).
>>>> +         */
>>>> +        assert(*fallback_ptr && fallback_bs == (*fallback_ptr)->bs);
>>>>           bdrv_unref(fallback_bs);
>>>>           return ret;
>>>>       }
>>>>
>>>
>>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>
>>> ===
>>>
>>> I still think that this fallback has more problems.. Nothing guarantee that all format drivers (even restricted to those who have only one child) support such logic.
>>>
>>> For example, .bdrv_open() may rely on state structure were zeroed and not initialize some fields. And .bdrv_close() may just g_free() some things, not setting them to zero.. So we probably should call bdrv_open()/bdrv_close() generic functions. But we can't: at least bdrv_close() requires that node has no parents.
>>>
>>> Not saying about that we lose everything on failure (when actually, it's better to restore original state on failure).
>>>
>>> This feature should instead be done with help of bdrv_reopen_multiple(), and even with it it's not obvious how to do it properly.
>>>
>>> The feature were done long ago in 2010 with commit 7cdb1f6d305e1000b5f882257cbee71b8bb08ef5 by Morita Kazutaka.
>>>
>>> Note also, that the only protocol driver that support snapshots is rbd, and snapshot support was added to it in 2012 with commit bd6032470631d8d5de6db84ecb55398b70d9d2f3 by Gregory Farnum.
>>>
>>> Other two drivers with support are sheepdog (which is deprecated) and qcow2 (I doubt that it should be used as protocol driver for some other format).
>>>
>>>
>>> Do we really need this fallback? Is it used somewhere? May be, we can just deprecate it, and look will someone complain?
>>
>> Maybe? :)
>>
> 
> :) I'll send a patch later.
> 
> 

Or not.. We need first some clean snapshot qmp api. And blockdev-reopen. And then just deprecate old hmp snapshot api.


-- 
Best regards,
Vladimir

