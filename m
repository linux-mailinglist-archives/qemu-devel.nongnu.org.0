Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 091303965C5
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 18:46:46 +0200 (CEST)
Received: from localhost ([::1]:47806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnl3s-0005zN-SY
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 12:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lnl1U-000586-7R; Mon, 31 May 2021 12:44:16 -0400
Received: from mail-eopbgr80090.outbound.protection.outlook.com
 ([40.107.8.90]:42720 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lnl1P-0003Il-UJ; Mon, 31 May 2021 12:44:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iwj1Z/eak2kFgukB5Oy88dcqmqc13DArwRoGw84MdWu9Q2wdFSg4EZXhR9kqw+Lni+S4XNZFOf64DAWFliWh7N1w5A/DZ95M3/gQG1zLmNFNAoDfIh2TZeYfPTHdQ1vrS3Flm2Zq19E1xiL5ZrBsXlM/o7T3Nn2mENmUiMB64Cxg9X1P+AbScT47i36bJ3uLdnDURFvreffzyTfO1aqMvSHtZ8xruEbXRCPZc8aZVYW8317q92jZbOZbkzo7rplVyyZCwG3yMoEIP3TwFvYZgJFRuq3A0smGUd5leNVMGyLrSmL+gtfy1DbZzQkBXOVH87xYhkun529ID2LAopCfOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkLwsHT1TZPtBywdZ90sWgQmydbp4X8Yjl2O3qRRtb0=;
 b=JzfPYDqZ5wUYLH18Q3TjmC/2x4/4UWEK/qvE7g0/AbBxLHCS32DVNG3pO7BPnYK9knKPSrfzSvJ77IpCbxIbWCsp9n83f1+aqT20ZgDuxncebcPmKQ9KguakXirCBlOo+LHEepJ1PvNGAAtQSQJDqMAZnqhAeWRjwgA/tlPkDJ3AO3/NgAyJGzrYIR24I2bT+iRD+w4o7ETwmPL7XgYN1oDqy/l2XPsideC5hn3xYqcnZ2i1qiFDrkRZVZVKGdU2uCnaO60opvMke+lVXf1o7bjTZwFON6ID5lC8JDK9LL4BNFgkT7ZTNOoeQQsZ0G0oQ5ThLipoY8jbkdRBTgNZDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkLwsHT1TZPtBywdZ90sWgQmydbp4X8Yjl2O3qRRtb0=;
 b=U1dg8m+GJGOjIiFlpqIISs1t0xLmbngWcVcsR/hMPlO6DQ0NMJu/NKdlvjIGOq5VB3uHJRFXc89sZjCnC1ys3oO3st+5a47K/7wTbLGCGd6d8nPKWfZ3RhrN30hSAdbVB6j5HAJ8S/+dzLUZKdO6wKpuX7Ir0pU7qx8WWc4C61k=
Authentication-Results: igalia.com; dkim=none (message not signed)
 header.d=none;igalia.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6551.eurprd08.prod.outlook.com (2603:10a6:20b:319::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.29; Mon, 31 May
 2021 16:44:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 16:44:08 +0000
Subject: Re: [PATCH v2 5/5] block: improve permission conflict error message
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 berto@igalia.com
References: <20210504094510.25032-1-vsementsov@virtuozzo.com>
 <20210504094510.25032-6-vsementsov@virtuozzo.com>
 <YLUJzdunvOGmfdkO@merkur.fritz.box>
 <e08592be-2520-217a-0b68-fb7f44ac6c47@virtuozzo.com>
 <YLUQQtEUbeHdluPQ@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <820b7a2c-bd0e-3ff6-3e90-d9365081dfff@virtuozzo.com>
Date: Mon, 31 May 2021 19:44:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <YLUQQtEUbeHdluPQ@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.226]
X-ClientProxiedBy: FR0P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::10) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.226) by
 FR0P281CA0075.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.9 via Frontend Transport; Mon, 31 May 2021 16:44:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5c81601-7443-4f01-b64d-08d924534f61
X-MS-TrafficTypeDiagnostic: AS8PR08MB6551:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6551E1E1B2AA2D5002646BD9C13F9@AS8PR08MB6551.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c2EiTEVnkiDZqHrQ1C9zJv4GUJ+XNcuCMRkeqbUct0ppjX4GjvQMOLNokge7SGieMPqEB6UI7COQgTMjQlkXbFg5N2G9yV8noSuwmkLF+OxJYTr3bkkVQ9tqg58oaJWr1Kt0XGLNuBbGKOxYXSUQGXkZTEcVjK6rTQQcbMAnJQIBjMo6wRWZzCkz4DLE3FQpFoEV0rAZC+6Gcx2HkppuzhZMFo5oAnawLs0LqBLUai8yDJK5MrnhHG42UWoxIrPLW6zA3fCLpaUVPFb1QU7i7rBV61zdO8aYC/l87aUFbfBHXRurvcN4+nehvItmUx/anHXcRIlGbGcFYRbQYjqsKvWM1tnf48IDan121lkzXutGXYF6lCJwK+XHnC3sAp/kq+8Rn1jhq7h9Ldy4HXnD6YgLDrWp0ia1wYZbn/Uow2giVnwni54mtq5BBGFpdbVwJ7rtbzpMvi5OdSqvwl55w/ELO13v8gZut2cO3dKqT75LoQ6X8MwbouYP/sf8BPVUgdAlZ7Pa1aD8p7UI95pWkoooxk+VDTCh0YpE0pnnBR7pS2lE3WDcmpAQdAdcgIROoFbyMmT2CAYexI8um+mFjnaQm20l2vpl99wMNVCmUHJpMfFzuKrB5pq383DykVcVBm2IU7DKC41119n0KK2s7JSQmlUFOgE+0Gn8KZ3OalFRfuuKCC96TOw8Bwo4YbcUA5t8e+dZCY4Rl5RMxx6w4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(136003)(39830400003)(396003)(186003)(26005)(31696002)(16576012)(16526019)(478600001)(8936002)(83380400001)(86362001)(4326008)(15650500001)(52116002)(6486002)(6916009)(66476007)(36756003)(8676002)(31686004)(316002)(5660300002)(66946007)(66556008)(956004)(2906002)(2616005)(38350700002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aFZSYkVaRnM0SkVnUFZpS3RsdThpTFkrSzNoWW9sTVp3S0MxWG9rQitpVTBy?=
 =?utf-8?B?Ym80OCtiMFIxN1ExQ3FSS2xwSVJwaEw3QTgxdU9ha0pQT3ByMUtOOWNuSnpz?=
 =?utf-8?B?RXlrSUwzcmUxNElsOUJ1TjQ3Z3VuTjJoOHRuWFF1WjVscEo2TXFDZzZGZ2xp?=
 =?utf-8?B?Tkd0M0F4aFk2aU5zUngyakxlT0k1N2hEMVE0bkdHdVByOHRUakV0QzlBWFhP?=
 =?utf-8?B?aW5IRGRYMEpsUkVlYVovUUlva1U0YjZTbExES1ZQMGE1elR6ajhJeFRtWmhH?=
 =?utf-8?B?NDVCdTFpZnJjRzlEdGUvQVpBNU1Wd01BMjNuVWhTcDF4V2tQcTVaZEY2U2h0?=
 =?utf-8?B?T3ZCaUJMODZSUTI5R29wOTU2alR3dlZDeWFJQUdsSVR4eHhWZHFnU1MySDly?=
 =?utf-8?B?QWZBSHlGanR3M05qUktNaVUxUE0xYmR3QnlvZ2pqRk9xWTg1UUdSRnk1RHhE?=
 =?utf-8?B?dzZ6bEw0UEhVWG51RVZmYU1CSklkL29VcGhLYjc1SEVLVVNyRFcvTUpUVzRr?=
 =?utf-8?B?d3p0ekoxZkRaTXJsaS9iRGZEQXBpMWRLYjY2dWdUOGd2WFFRRUZKV0MxSWxC?=
 =?utf-8?B?eGxXcEhjbUxneFpMb3FldVE0b2tNRy9OZUZLWTkvOCsxaVgyTmR1SGNzY2d6?=
 =?utf-8?B?U1B6ZlRsMVdUUGZxWVZnZ2NyRUlNbDg2c2VyT2pOalQzLzltYUtwZnVkUlVH?=
 =?utf-8?B?c2pQVjcvSEwvSkdTVFZGeTcrSTVuK3lVc2thWDJTeEY5cVVxeWx0NlJiZVVR?=
 =?utf-8?B?b0VFNDdzZUw3c09sSjJlZWFySGJ4QlFqK1lRN0wyblFBNSt3am9tNDlmUVBO?=
 =?utf-8?B?TEx6V1dURXNGa2tUNE8zRlpObExJRGNwOWJXVCtyaTRGbnVvMndEZk1FUFBp?=
 =?utf-8?B?OUR5L3BncU16aVpvVFJWK1h3T0hmY2kxL0kvR2g5eFZyd1h6dkUvUWNvQUxK?=
 =?utf-8?B?U2tnWkpMSmpjYjNJRGI3WHNWSEx3eDJHalZlemNTRUFXdWpzdGlRNWduSnlL?=
 =?utf-8?B?VjMzUGxGSnRjT0QvelJjcyt3T3VYdjBsRDE2RWpjZVgwYnhzbWFQYThRVkdv?=
 =?utf-8?B?OWhlRWl1S0VNUUVzVTJKRDh1b0ZpWVZsYldIY00zdkRYR0lKdmV1Q0dxc0Rl?=
 =?utf-8?B?L3pYQ2RDbTJDUGlWb1hSb1RhNSttQkJDVkhtZjdmZjBLZG1FSVNGVlF2a1pL?=
 =?utf-8?B?bk9aNnd5bUZMLzFxZGgvc0laSzZIdXRDaXJFUjNDRGg5WExoZCtGUVlUN2My?=
 =?utf-8?B?SGQ3TkZjTW1NSXlLanZLYnBNbjdsNlZmMWpBZU9IdHcycEpBN3d2RXFjRGVk?=
 =?utf-8?B?ekJtVGhuNDFJRmVhTmpYbGU1S2hSMEowSU5oREVCdXJIWWRXMWpOeHdNMXRr?=
 =?utf-8?B?MkxyL0ZxM2JyaDBkd1hZeStvNE5mcXBVaWM3cy9RdEFrTFROS05UNGM0c2dm?=
 =?utf-8?B?OFVPYnd6MjFFbE5uT1RJOE42OWpCVGg2RVBuZWpNYUwrT1F3RVdtZ0FCTkF5?=
 =?utf-8?B?dlI2dmZ6angybHRrbWk0bk1GdVgzMEpWaEMxeThpcy9CM0YycGpyeHJmVEtJ?=
 =?utf-8?B?UVF5YnZDSzlIZTM3QkpVdDlheDd5YXBqOU1QTEJNMXoyUjVjOThqWkJtREh3?=
 =?utf-8?B?R3V2dzF1ZzM3K3l5QVNxTFNSUTBnZmdiMnk3TkMzKzVMWVNQMGJucGlaOGho?=
 =?utf-8?B?ck1SK21vemFJb0JsVXQwRUV0MjljR2VDUGtqc0txcmUvZkxUd3RRL3h0UnIr?=
 =?utf-8?Q?MWjMA5ycOzcmt413NhAKlYLD7SbUicHnz75W2Bf?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c81601-7443-4f01-b64d-08d924534f61
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 16:44:08.3231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H5leqkJdzaRSIHEvfo25kE6uHY+JBUTMEsQLOsGktluMqzMqxI2dXbjhwELPsdvj/28/UDFm1qvYmqFLAwXvBWD27Q7wF39MRUy+mAab7qU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6551
Received-SPF: pass client-ip=40.107.8.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.591, RCVD_IN_DNSWL_NONE=-0.0001,
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

31.05.2021 19:35, Kevin Wolf wrote:
> Am 31.05.2021 um 18:18 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 31.05.2021 19:07, Kevin Wolf wrote:
>>> Am 04.05.2021 um 11:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>> Now permissions are updated as follows:
>>>>    1. do graph modifications ignoring permissions
>>>>    2. do permission update
>>>>
>>>>    (of course, we rollback [1] if [2] fails)
>>>>
>>>> So, on stage [2] we can't say which users are "old" and which are
>>>> "new" and exist only since [1]. And current error message is a bit
>>>> outdated. Let's improve it, to make everything clean.
>>>>
>>>> While being here, add also a comment and some good assertions.
>>>>
>>>> iotests 283, 307, qsd-jobs outputs are updated.
>>>>
>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>> ---
>>>>    block.c                               | 29 ++++++++++++++++++++-------
>>>>    tests/qemu-iotests/283.out            |  2 +-
>>>>    tests/qemu-iotests/307.out            |  2 +-
>>>>    tests/qemu-iotests/tests/qsd-jobs.out |  2 +-
>>>>    4 files changed, 25 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/block.c b/block.c
>>>> index 2f73523285..354438d918 100644
>>>> --- a/block.c
>>>> +++ b/block.c
>>>> @@ -2032,20 +2032,35 @@ static char *bdrv_child_user_desc(BdrvChild *c)
>>>>        return c->klass->get_parent_desc(c);
>>>>    }
>>>> +/*
>>>> + * Check that @a allows everything that @b needs. @a and @b must reference same
>>>> + * child node.
>>>> + */
>>>>    static bool bdrv_a_allow_b(BdrvChild *a, BdrvChild *b, Error **errp)
>>>>    {
>>>> -    g_autofree char *user = NULL;
>>>> -    g_autofree char *perm_names = NULL;
>>>> +    g_autofree char *a_user = NULL;
>>>> +    g_autofree char *a_against = NULL;
>>>> +    g_autofree char *b_user = NULL;
>>>> +    g_autofree char *b_perm = NULL;
>>>> +
>>>> +    assert(a->bs);
>>>> +    assert(a->bs == b->bs);
>>>>        if ((b->perm & a->shared_perm) == b->perm) {
>>>>            return true;
>>>>        }
>>>> -    perm_names = bdrv_perm_names(b->perm & ~a->shared_perm);
>>>> -    user = bdrv_child_user_desc(a);
>>>> -    error_setg(errp, "Conflicts with use by %s as '%s', which does not "
>>>> -               "allow '%s' on %s",
>>>> -               user, a->name, perm_names, bdrv_get_node_name(b->bs));
>>>> +    a_user = bdrv_child_user_desc(a);
>>>> +    a_against = bdrv_perm_names(b->perm & ~a->shared_perm);
>>>> +
>>>> +    b_user = bdrv_child_user_desc(b);
>>>> +    b_perm = bdrv_perm_names(b->perm);
>>>> +    error_setg(errp, "Permission conflict on node '%s': %s wants to use it as "
>>>> +               "'%s', which requires these permissions: %s. On the other hand %s "
>>>> +               "wants to use it as '%s', which doesn't share: %s",
>>>> +               bdrv_get_node_name(b->bs),
>>>> +               b_user, b->name, b_perm, a_user, a->name, a_against);
>>>
>>> I think the combination of a_against and b_perm is confusing to report
>>> because one is the intersection of permissions (i.e. only the
>>> permissions that actually conflict) and the other the full list of
>>> unshared permissions.
>>>
>>> We could report both the full list of required permissions (which is
>>> what your current error message claims to report) and of unshared
>>> permissions. I'm not sure if there is actually any use for this
>>> information.
>>>
>>> The other option that would feel consistent is to report only the
>>> conflicting permissions, and report them only once because they are the
>>> same for both sides.
>>>
>>
>> Agreed.
>>
>> So, what about:
>>
>>    error_setg(errp, "Permission conflict on node '%s": permissions %s are both required by %s (%s) and unshared by %s (%s).", bdrv_get_node_name(b->bs), a_against, b_user, b->name, a_user, a->name);
> 
> I'm not sure if I'm happy with the child names simply in parentheses,
> but I don't have a good alternative. I was thinking something like
> "(node used as %s)", but while writing down the example below, that
> turned out confusing because a_user and b_user can refer to nodes, too.
> 
> "permissions '%s'" with single quotes might be preferable, too.
> 
> So a real error message from the current version of the patch is:
> 
>      Permission conflict on node 'base': node 'other' wants to use it as
>      'image', which requires these permissions: write. On the other hand
>      node 'source' wants to use it as 'image', which doesn't share: write
> 
> It would then become:
> 
>      Permission conflict on node 'base': permissions 'write' are both
>      required by node 'other' (image) and unshared by 'source' (image).
> 
> Looks like an improvement to me, but if anyone has a good idea what to
> do about the unclear meaning of the parentheses, I would be happy to
> hear suggestions.
> 

The only idea I have is duplicating (hmm, "triplicating" is an existing word?) the node of conflict:

bs_n = bdrv_get_node_name(b->bs);

error_setg(errp, "Permission conflict on node '%s": permissions %s are both required by %s (uses node '%s' as '%s' child) and unshared by %s (uses node '%s' as '%s' child).", bs_n, a_against, b_user, bs_n, b->name, a_user, bs_n, a->name);

-- 
Best regards,
Vladimir

