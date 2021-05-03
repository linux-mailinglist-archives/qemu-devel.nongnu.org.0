Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5015371547
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 14:34:17 +0200 (CEST)
Received: from localhost ([::1]:59042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldXmC-0005Aa-Qo
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 08:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldXje-0003zv-W9; Mon, 03 May 2021 08:31:39 -0400
Received: from mail-eopbgr130120.outbound.protection.outlook.com
 ([40.107.13.120]:54020 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldXjb-0001Gl-UT; Mon, 03 May 2021 08:31:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RukX4wiHxZVVA4P4lONNN3K6cD0kj8DYoyDZzG5AvzFcSYKztuvw808Ke0MVHeMc5Ixg7MpwL3eL4n7myyB+7nN9HXH7bS7GKD8joBjRQS7GAPAyHiTNp9NQNvN0KAvyiEhqgMaim+NM8O4GpQpR9s5c7yFMbkvfq53KOhZGx7DgMeZ1slkGzHUrz+lQjmcdVlQIUPSp65F3y7KzeBhEN/zr5tcmWd6wKp9naNQfyrx3+Q9gpkycXu9mZFxjxa00NRfZ2MazBcBpl3i8L+HSA5HlZc/iZ+K69JFLq/f5C1Z8+BLv4IFaZL44fxcuzqfmCLpZy6tZvEvI/lm2ML/k3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4j3Zed0ykbEexx9l6tGETRRtXeBTPD+p8krJt1sRdM=;
 b=cIRVc0nHNmTD7qGXovpF+8mjkM5a+tQfl/koevtziJtE5wBLnv3Z0p/xGNRxHszZjJlzqz7jQu+7oX3+W7y4meBIK+bN75o+23mTG8xJGhb5qDeQ5i4kASUgoHFENvEQDlT+qXJWD/Fi843XhfDBRXzuKx9pcDLdbZd4PFH7LzRnCRLt8744CsBlJWdnT8cC1zxzP5dS8d1nHWuN7j+r/JKp5NXJp06cg/fz5Pg4hjxKf780x0hBKD0FwN1xMatCQNQicFlHBqobVxznZ5Szm5r4Vfc6hBnmY6vG1bOJ9LpjWSNf7JlHH57MI7tQUmQC0zOkFvdU44LgdLPpZPqHqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4j3Zed0ykbEexx9l6tGETRRtXeBTPD+p8krJt1sRdM=;
 b=ZNKvVTfEYYDS6fPLZ4GlGV/AOMoImh0BQ44Uhmor3Bg/mZ0ZYGMC84vabWvtK+5edreqCpA2dOlkwVAqqSVtTo2amtdg7ZXLTgMqbCc+++pqxY6tGtX+UySn0KmDYvYkEogzL2jSz59zUtPGaNWFUuWHY8KvRz/n/1J/Cpz7rno=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1716.eurprd08.prod.outlook.com (2603:10a6:203:39::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.40; Mon, 3 May
 2021 12:31:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4087.039; Mon, 3 May 2021
 12:31:31 +0000
Subject: Re: [PATCH 1/2] block: Fix Transaction leak in
 bdrv_root_attach_child()
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20210503110555.24001-1-kwolf@redhat.com>
 <20210503110555.24001-2-kwolf@redhat.com>
 <9e23f679-84ac-9d1a-09dc-4894cd9d6979@redhat.com>
 <cdef7d37-1d8c-85c3-de0e-0730949bda92@virtuozzo.com>
 <a7a4c787-8dd9-858f-c627-6b20809d30dd@redhat.com>
 <bf6bfa0f-b7a8-b685-5069-99740b34e4d8@virtuozzo.com>
Message-ID: <b08735a3-d144-a7a6-f00b-cfd739bbb058@virtuozzo.com>
Date: Mon, 3 May 2021 15:31:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <bf6bfa0f-b7a8-b685-5069-99740b34e4d8@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: PR1PR01CA0031.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::44) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.251) by
 PR1PR01CA0031.eurprd01.prod.exchangelabs.com (2603:10a6:102::44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend
 Transport; Mon, 3 May 2021 12:31:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: afc77e4b-b1fc-407f-d24f-08d90e2f61d2
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1716:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB17166E8CA88C3A7BD30C1A1EC15B9@AM5PR0801MB1716.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g3bFRWDlq10QCgglM4d9BbGb9WE7qIQiJso7mT45KOx4cIyvY2+5sAbmNQnEuBlhQ8o5xEQxQliXS1dZpQ6C+0w8Pkzb2m9lVyiqAyytURTZeAK5HSCcrPrug7TnSQmLNgYLKyT9OqhVjqzGH4vSwbYm/9IsfJ8jls/aPykp3SLPdAmn0iffzLFDZvmkIrzAELYcojmtP5Fe+FFOOmfiLEZMYgZGIok0eWmR83+4RzrV0PElEdUxAVYTU0/Jg3QlGThsFnTd1+ZBut7pc1bLvYju1xBoII/lc2ey1+tryy+BFc9YODYe3Y36mO2iNe0JyioTgVvSP8DbogUVc01RNgNGMWYFIjt8aRJn7L9Ym7xMJFXORgCB4LdQsHsXXklAqRnFVWJac6mXvVniUTHRkcJ0EpAtYOOXANN7I9XchvMOPKn4yk9/19Wdlkuflsu1fhZz+sbA8EMhVM0JyUisy6UUcsEaEWBwP5DTMZlaUDQzUBY8z2/iLKsVOZMLtY6OWs72sawrEepjoNjmAfeV/KgFm8pj8cDY7zuOrC7A0Uy2COhf6wGn0JMH32nvfpwzwVC1FQFmAea/4nydteVSQU6+88tJruPQmr4oSu0f+F6+4Sd8k6iSmwNqz3ak5icjZ2PBLYxA7bV7UxobNUFCtOHbzLOdiYLvl322grcuARUR8PBIuUFi7L2RK3C1jKYE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(396003)(39840400004)(136003)(316002)(36756003)(16526019)(26005)(186003)(956004)(86362001)(83380400001)(31696002)(38350700002)(38100700002)(16576012)(110136005)(2616005)(2906002)(66946007)(52116002)(53546011)(6486002)(478600001)(66556008)(66476007)(8676002)(8936002)(4326008)(31686004)(5660300002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UkhpemlSV3Azb2c2VDROR0xHUWlGOVllc1pjTHREWm9VdDJQQVNrSzhNN1pC?=
 =?utf-8?B?SzA1djRKejBSZUNYcER1K2pXUERacEVPSnZ3cllPR3RMYW9tM1lMeGR6WVpJ?=
 =?utf-8?B?N3ZoYXNOVHZPMkZrYkRqN3RZOVFxUmRSazlmQXF3UW5GQk9TdGd4ektnNDhS?=
 =?utf-8?B?ZE95UHluaE5NTEh0YTlQOTZTbHg4V2t1OExINVZ6b0gxMFk1VjdtdGlqZit5?=
 =?utf-8?B?RkViTEl3UUhNSjIwdmlicTdaUzBzMmR5cHFNd2FvN2JjYmJzWWZPd1l3cE9E?=
 =?utf-8?B?Uzc4blpRbjg4bTZ0UnpYKytwbmc3ejQ3aHVhWXpURUNvblB4cFZjTmtJYXM5?=
 =?utf-8?B?ZWJkTWVkeXh3bFBMaWxZNFEvd2tmRlh3Rm5jaDhkVWZsbzRlRTZsd2FSbDM3?=
 =?utf-8?B?K3NBNEc5QW94aUtZODNkVE5XK0MyMjNRS2ltQTBwNTRuMmE0Q3Q2Z21ocTNO?=
 =?utf-8?B?bXlqV3U5VXJQUHFJUkxjaGw0Q2dtM3VyZk9IU2dNUkJlL2xtY0Q2M0pnTkxJ?=
 =?utf-8?B?K2NpbTBrcEgzbUpVcDBlcnpTN0lyWTBxaWdtalk4Ym1aR3dGMFRGak4yM2Vl?=
 =?utf-8?B?d2t2R2VpS1AwenREaitxdTVxVWxnOFVuU3d5NzY0blZlYTBxZG1FQzNwbFpm?=
 =?utf-8?B?REtNZWxERjNkTVlWR1dNb0FwOWV5UENVdDJ1Y05tWUdQKzBicFhQbm00VXNv?=
 =?utf-8?B?RktYME5CWUVJOFNOZktmdWk4WkZxa3R6ZnFISE1QVXF4N3AwU25EUERZcXNZ?=
 =?utf-8?B?MXB4dnpUTURPZDBaNnlzSXgrWWhZVUdJbGpOYTdFSnAyazd0QndDYjZ6ZFY4?=
 =?utf-8?B?LzJnSG80cy9DMDF4Uk1DUkNWSkppWTN6QjRjcURTd3p0Zlc5MG9TYnNXdUJu?=
 =?utf-8?B?Qy8xTXJRallWMFRIMWNDRUZvOTlPOURXQUxJTFpIcktBa2dGOU80TEp1Y1h4?=
 =?utf-8?B?T0psTnZRWnVWWVVoY25ncFc5RFZ4WG1XMWozcTlIZFJnckIyYmNGNUxkWm5U?=
 =?utf-8?B?U3hZYnFXUldSbzJ4My9uSWZDTnMwZzFtTG1qY3FBZUNzTzBoM2htWGZCMUhJ?=
 =?utf-8?B?dm1adWtDSk1JYjFNZk9USmRneTFlZEIrOXh5Ukx4VVQyalN3S25IbnJHZWlU?=
 =?utf-8?B?SXQ1Uzl5TzhNZjZnVUpoRXptdVJlQ2tHaFkrRkhXeTNuakJicGk4QVZ0a0dH?=
 =?utf-8?B?dXYwR2hray9CN3l4cWNUZWpUbTE0ckptbkpDZjI3VGRYV2NIcnpQV0lKZ09G?=
 =?utf-8?B?Um5nWmFlQ3FHS2hPK1pmU1M0ZWpzTTZVcFRIZUNwL3EwZWtSZnc3enZrTnVK?=
 =?utf-8?B?a0VZeWxWQ0dSbUlOQ1JOdVdteVRZQ2pvSXBFdW5EZmhyR0NlM3I0VXRmRXVr?=
 =?utf-8?B?UWRyOHZ6cnVyMk5BRXE0aWE2MHFGUldaN1hiaVFDMW1oWnVqTkM5d0QvOWZH?=
 =?utf-8?B?MHpaU0s5VjNmNVU2Z0R6N0lGZ0txc1VpVUwwOUFuVW8yVmtQTUF5UmxNeXc5?=
 =?utf-8?B?bEFhLzRVNTd0dE9uVlYwVk1INkxOL2pQWjk4UDlpcmhHbWlBVzRBcmgvWmJI?=
 =?utf-8?B?S1h4cURQV29RSStKaW5KcS93d2N1SlZ0RVE2SUJxS1hNcGVrWFFyRXFnYzNZ?=
 =?utf-8?B?Z1R1QnlGbFUxWWJUMTlUR3Mwdzk5OE5UVW1TOUlwd2tQTVVsZVFrS0k5RHZ2?=
 =?utf-8?B?MUpvd1IxenJ0S3pVNEcvajUybmFHODNYd3BQZlBlRm11Kytnc1J6cU1wazhH?=
 =?utf-8?Q?Tt0eDbjZ7zBzFb2d8PKsSOt6+IvhfeKBJGAITM4?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afc77e4b-b1fc-407f-d24f-08d90e2f61d2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 12:31:31.8517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4TPJbE8sOg9+LoYqQNuscJ/HSdtyaxvF4lnt0exbmveVxKhkuilOHyxLbfty15/r0LzYYrRGxNO/Kt6kksFVp++q3QvMaN+b4krtqbiTr6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1716
Received-SPF: pass client-ip=40.107.13.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

03.05.2021 15:14, Vladimir Sementsov-Ogievskiy wrote:
> 03.05.2021 14:53, Max Reitz wrote:
>> On 03.05.21 13:51, Vladimir Sementsov-Ogievskiy wrote:
>>> 03.05.2021 14:49, Max Reitz wrote:
>>>> On 03.05.21 13:05, Kevin Wolf wrote:
>>>>> The error path needs to call tran_finalize(), too.
>>>>>
>>>>> Fixes: CID 1452773
>>>>> Fixes: 548a74c0dbc858edd1a7ee3045b5f2fe710bd8b1
>>>>> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>>>>> ---
>>>>>   block.c | 7 ++++---
>>>>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/block.c b/block.c
>>>>> index 874c22c43e..5c0ced6238 100644
>>>>> --- a/block.c
>>>>> +++ b/block.c
>>>>> @@ -2918,13 +2918,14 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
>>>>>                                      child_role, perm, shared_perm, opaque,
>>>>>                                      &child, tran, errp);
>>>>>       if (ret < 0) {
>>>>> -        bdrv_unref(child_bs);
>>>>> -        return NULL;
>>>>> +        assert(child == NULL);
>>>>> +        goto out;
>>>>>       }
>>>>>       ret = bdrv_refresh_perms(child_bs, errp);
>>>>> -    tran_finalize(tran, ret);
>>>>> +out:
>>>>> +    tran_finalize(tran, ret);
>>>>>       bdrv_unref(child_bs);
>>>>>       return child;
>>>>
>>>> Looks OK, so:
>>>>
>>>> Reviewed-by: Max Reitz <mreitz@redhat.com>
>>>>
>>>> However, the function’s description says that it will return NULL on error.  But if bdrv_refresh_perms() fails, it will still return a non-NULL child.  Is that right?
>>>>
>>>
>>> No, it's reset to NULL on transaction abort, so code is correct. It's not obvious, and I've added a comment and assertion in my version of this fix "[PATCH 1/6] block: fix leak of tran in bdrv_root_attach_child"
>>
>> The fact that the transaction keeps the pointer to this local variable around is a bit horrifying, but well.
>>
> 
> Yes this looks overcomplicated here. But it's useful for bdrv_set_backing_noperm where we would have to add a separate entry to @tran to rollback bs->backing change. Probably, it's better to refactor this thing. Or at least document that out-pointer argument goes into transaction, and should be valid up to transaction finalization.
> 
> 
> 

documentation done:

   [PATCH 7/6] block: document child argument of bdrv_attach_child_common()

-- 
Best regards,
Vladimir

