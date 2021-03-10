Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEE0333B1B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 12:10:06 +0100 (CET)
Received: from localhost ([::1]:57866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJwj7-0004U1-PU
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 06:10:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lJwhq-0003YE-PX; Wed, 10 Mar 2021 06:08:46 -0500
Received: from mail-db8eur05on2121.outbound.protection.outlook.com
 ([40.107.20.121]:24768 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lJwhm-0006f1-UE; Wed, 10 Mar 2021 06:08:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MbtDTy2JKRdTeCycAlM1K5tSiniWLrhv6QXVLQHNgErV/q7sH0CN9BOFSFRqtylsyZt/BPNXpaiCRPTeHrj7XDtURf5Yz2VM99x0xotdcR6afLTeury5c9xBAtae3V0je3SbLjb7aa9Uz4AWQygY6eYqW40mkYTgjgJFuI9F4Rr0ftkztqgkPMP8j926rfUaC4Wx3ab4qKxF6suZPImCl3szNw9D0zqZNLfXH2ViZW9It/ErTsnitzca0/jMpwfokfN+bK8Sic5fhtGBCk2Pwvk7Ln3HuaOUOsgqUDCQcViT/cHKIm0ai3Uo1SlvsF+sutgx4er3Y1yW+q8GAgS0cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2NPjHgsqFpmEQELsFxrZwb72SR9zsc+1IGFYwot/YRM=;
 b=da6T97gxChnqt7ggA06MM9L+IJrPlkHgni8+j0xMvxnha94YLrNBQ1mdq1WzQ+lVUX9HiLTS5JOsHoGic6gwQZu/T4ZE2IwrA4d78/HqjOQl3Af8h+a/V5W2Of4fNcKWx391MC9pn6aFoVYuFnPGW4eLArHFYvuVPdJwqnvtbaWQqC3vReTvELzQ+tcsY/cp2XNEqo3eLL8cYPp1lSykTfpsOhKsf5xYHjaz3IGZ5NN32x5Upf+TqRpmUZP3x74mHGhOebX25F3xqbLxm44PWhPgTq9znDXu3DlTyxkl5IlAbmZKSvoLwaJYGXAA2kV2F8KmZjKz3VPH4yKKVvMnPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2NPjHgsqFpmEQELsFxrZwb72SR9zsc+1IGFYwot/YRM=;
 b=VlSqFyDBd51qm0G5h8Uepv56Kf0o8bApZCJjaN+qeMzDdpXgN7+OTeKa3/n8d9P8As7xRdL+AVzrEdk8Z6Zgc4w9nVNN4lj1CqCp6Utr+uQH4j61MCAs/UXphN0tYBX14Vb+Kj5avtMPuvnrnjJjW00hxs8Qoa5bi9K2coL0twI=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5384.eurprd08.prod.outlook.com (2603:10a6:20b:10c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Wed, 10 Mar
 2021 11:08:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.027; Wed, 10 Mar 2021
 11:08:37 +0000
Subject: Re: [PATCH v2 15/36] block: use topological sort for permission update
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, mreitz@redhat.com, den@openvz.org
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-16-vsementsov@virtuozzo.com>
 <20210127183809.GD6090@merkur.fritz.box>
 <ef4f43d2-a8b8-932e-78e4-6ffc9d8e7d3e@virtuozzo.com>
 <20210128171356.GE5361@merkur.fritz.box>
 <5e6e28e0-133c-9094-1c48-532090453cb1@virtuozzo.com>
 <20210203183829.GG5507@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <61c15d60-6d32-3f18-8f17-1104cb7bf683@virtuozzo.com>
Date: Wed, 10 Mar 2021 14:08:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210203183829.GG5507@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR02CA0159.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR02CA0159.eurprd02.prod.outlook.com (2603:10a6:20b:28d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.18 via Frontend
 Transport; Wed, 10 Mar 2021 11:08:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f66d7d6-7d7d-4ac5-8ac8-08d8e3b4da44
X-MS-TrafficTypeDiagnostic: AM7PR08MB5384:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5384EC107E02C094B506CD47C1919@AM7PR08MB5384.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PQPGcH77P5j4GNFp5O09u+ZCD32NFdOcRMf7sBh2Hur10nRYSHpXrAGF0InDctitfbUhHh5lbFqfN7GO2+81sLtyd+Feyr+XRvxMfp8WXNTmZUkia2edCMZxh7R+KY8EwagXCWfaWBozEVmGXym8aGap1ECKyrB4djjnc/+wWciGdav0/s9dUArbYJmnQbDAWX5NBVXvw/Zw+Rv1ETPoYMci+Yqv8n+VoxZmJ87anKtD0R5zgbmaNMjcPh93HDybJy01Ep52xo0tjfAc4JQJh1ffWGWFM7SfT/MR/+/s6CS2hLuD2c/VSfrYQDPBMLHIBkF5YyZrwBVBiRyxZttWRiPwubFR5FqTUVjI7Xumsp/ZunatNEI9SZAJmlnAAYxmx+6nKnUCQv5NWTxbG7qanxU/qb43Z+Mc+pLHFqblAia5YyI5pgtgLyBBhIw/eIgnEHqgVUHozs/c4oPKx+pjeEQZz3QkSvgIBTqdrbbAKAvsh4zUilyZvSkFMflaucdwb+daKa9b01LvP4LqAfHuinCsjWV3OppdnFZLMlOOiCR1RxVUxg+XE9P9eHahWFJh+4XAVyXKI6ogu2qw1V3kyx7e6kJRK1y04jKgUv4TU1o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39840400004)(376002)(346002)(136003)(956004)(31686004)(2906002)(15650500001)(478600001)(16526019)(6916009)(26005)(186003)(107886003)(86362001)(36756003)(8936002)(52116002)(2616005)(16576012)(66946007)(66556008)(8676002)(66476007)(316002)(83380400001)(4326008)(31696002)(6486002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bDUzNVVlQ1B1SEJaLzZqRDNRdEVzWmowRnJHYmpPc0hGR1dvVDM3SDh6dDNM?=
 =?utf-8?B?bGpTU0xHU1JQV1ErZERyQ0R3R0Q5UXFpQjNHT1lQL3QwdnFZOVdtNGxhdWlC?=
 =?utf-8?B?K3JsSGV4bGZ0ZnFVeUpIMUIzL3ptdEhBYVBIeVRKdURMSmdJQWFCZjk0WUNu?=
 =?utf-8?B?UGJVQ1AyQWkxcGo4R0o5VzIzOTVJMHRmL2FXRC9Td2ZZMG9UVzZUVERuVkx1?=
 =?utf-8?B?SlFmbUc3MTE3YnJCT3RXUVVGVmQ4RjMzU2F5cUJxbStnL053bTMzU0hFem5G?=
 =?utf-8?B?c0NWdjlCN29MeVlUNk9IalpCWlJpRDBtaDZVZ3l2eDlCTUxDbFRPODZqdzZL?=
 =?utf-8?B?YkN4Q2k2Ny9rQkhJNDJBVE14VzNpb0g3U2xTQTZtZ2VKRHcrTFBpWDZTY2tH?=
 =?utf-8?B?a0o3b21UM3hRT2tRMXNKZEMwVVJ0b0NnZ1dSUG1QNmRicGdOR0ZWdzZhMnVr?=
 =?utf-8?B?VlQ1cGY2dnU1WW45cElDdlBmNjJIRlZXOEdRa0FWSFBacFQ3WjJ4V1hrQzBh?=
 =?utf-8?B?RDgxWFM1cmphbUJURFRHU3ViajNQUEROZ2xRNFBMQ0w4YUJyZjZrMllZYmI4?=
 =?utf-8?B?YjRMRjhjbDd3V2RGcUhmdWF1WXVISGJXQ2hycHRabmdCYWRNNlk2dGtiQkEw?=
 =?utf-8?B?a081cnBEWFVKa3l0VmI2RXh2aS90Sm5OdUhyeitGUXZJWVUwa05neldYL2ZS?=
 =?utf-8?B?OS9aVmFKUTh0RjBGYXBNeEFpL3NkdXVQYjdxM2JsS1krSFZBcWxPdGN3aXFY?=
 =?utf-8?B?bGRYNUpiNXJ6NGtKaFF5UkRUU2Y0WVAybHJLRXRQOGVQb3JsdkNFMHZNQ2pZ?=
 =?utf-8?B?bElxOW5NaVVGL0NyQXlPWkN6cEJwVEhzdjQ4WHVQYnEza0x0TjlKNUU1N0Zu?=
 =?utf-8?B?WlAyamdGa0w5ZGJtWC9rb09ZM0tsc242Q3pyK1BPaXdzdEtVTjhrcHV1bkNQ?=
 =?utf-8?B?SVdJSkhVejNTN0dHcnY0aXN2TFNQNi94OWVQVS9Ba2Jjd0lnb05Yc0E0MHRM?=
 =?utf-8?B?QUZIN2FOdG1RYTk3d1pGL1J4cUhtbkczNUM0aFVzRlVxZEFBbjZ3M1N6ZzNh?=
 =?utf-8?B?YTQzVnl2enBKVXRBK1ZCd0tGM3BLZjJIREl6bWpBRlllZERtbzhWcWxPRThK?=
 =?utf-8?B?WEZOODB0c0tYZjl5MHF3K3ZBRHcxcWxCSlVJZ3EyZnorKzNKUkJpMkxGZmsx?=
 =?utf-8?B?bjRRS0xnY3pIdTlVV3dQTW13OUJvYjI1cDRBVUFqcEpWS2xVUHl1SFdXUTI3?=
 =?utf-8?B?TDh1TUQ0S2FBV2tvUjgxcGYrZmZHTThocGFUR29QLytVbEpoWXdQSHBQakJD?=
 =?utf-8?B?VW4vNXp2MGJ4YXc3UW85VnR6TXIxVnVBL0RXRHdGclNBcWdNT01IOGRaTDl0?=
 =?utf-8?B?a2hGamM4V3UrTlJwc21sTmdMUWpvRmMvN2F3c21xWFFxWUt0d0gxU2FZYWNa?=
 =?utf-8?B?bXQ1Ry9TREIycW95dGpNaFJzbm9uMk91L1J0K1M1T3I4KzBIQ2E5NUNlM0xZ?=
 =?utf-8?B?aVRzR3hZbVliMTk1WjRqQk5XZ0lMam80UCtkTUlhOE80T21Va2tZS2tSdDhW?=
 =?utf-8?B?OHVIdnVPTHpkWTlwdUo5WkVWUzVneXVNNTc4MzNZWTltRVBaQWg1dHRIdmtO?=
 =?utf-8?B?dWo5UzlMenQwSEQwMjRrc2dCTlRVcXVuWm5iQnVQc3BqNmNGK0dsSk1PZ0NE?=
 =?utf-8?B?V0hvRnc4MmJvdGtTNDVuT1VFSlpsZ1ZSd1ZLaHFrTkdOZ3N4N3hJT0RmYXhP?=
 =?utf-8?Q?mCQQyokVV9StkAKJi4jLgvqSJZ/SskLaazewheu?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f66d7d6-7d7d-4ac5-8ac8-08d8e3b4da44
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 11:08:37.0121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oOLT0tQY0H7ekhv+AjAANQhRND2BwJSx+PuxCe4a1n/3BN9zy6VXgFBFGXEO3A0je3/pQHXSK9YUtOCF18IBH3OWvT6+fWdjLAROphS909g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5384
Received-SPF: pass client-ip=40.107.20.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

03.02.2021 21:38, Kevin Wolf wrote:
> Am 28.01.2021 um 19:04 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 28.01.2021 20:13, Kevin Wolf wrote:
>>> Am 28.01.2021 um 10:34 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>> 27.01.2021 21:38, Kevin Wolf wrote:
>>>>> Am 27.11.2020 um 15:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>>>> -static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
>>>>>> -                           uint64_t cumulative_perms,
>>>>>> -                           uint64_t cumulative_shared_perms,
>>>>>> -                           GSList *ignore_children, Error **errp)
>>>>>> +static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
>>>>>> +                                uint64_t cumulative_perms,
>>>>>> +                                uint64_t cumulative_shared_perms,
>>>>>> +                                GSList *ignore_children, Error **errp)
>>>>>>     {
>>>>>>         BlockDriver *drv = bs->drv;
>>>>>>         BdrvChild *c;
>>>>>> @@ -2166,21 +2193,43 @@ static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
>>>>>>         /* Check all children */
>>>>>>         QLIST_FOREACH(c, &bs->children, next) {
>>>>>>             uint64_t cur_perm, cur_shared;
>>>>>> -        GSList *cur_ignore_children;
>>>>>>             bdrv_child_perm(bs, c->bs, c, c->role, q,
>>>>>>                             cumulative_perms, cumulative_shared_perms,
>>>>>>                             &cur_perm, &cur_shared);
>>>>>> +        bdrv_child_set_perm_safe(c, cur_perm, cur_shared, NULL);
>>>>>
>>>>> This "added" line is actually old code. What is removed here is the
>>>>> recursive call of bdrv_check_update_perm(). This is what the code below
>>>>> will have to replace.
>>>>
>>>> yes, we'll use explicit loop instead of recursion
>>>>
>>>>>
>>>>>> +    }
>>>>>> +
>>>>>> +    return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
>>>>>> +                           uint64_t cumulative_perms,
>>>>>> +                           uint64_t cumulative_shared_perms,
>>>>>> +                           GSList *ignore_children, Error **errp)
>>>>>> +{
>>>>>> +    int ret;
>>>>>> +    BlockDriverState *root = bs;
>>>>>> +    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, root);
>>>>>> +
>>>>>> +    for ( ; list; list = list->next) {
>>>>>> +        bs = list->data;
>>>>>> +
>>>>>> +        if (bs != root) {
>>>>>> +            if (!bdrv_check_parents_compliance(bs, ignore_children, errp)) {
>>>>>> +                return -EINVAL;
>>>>>> +            }
>>>>>
>>>>> At this point bs still had the old permissions, but we don't access
>>>>> them. As we're going in topological order, the parents have already been
>>>>> updated if they were a child covered in bdrv_node_check_perm(), so we're
>>>>> checking the relevant values. Good.
>>>>>
>>>>> What about the root node? If I understand correctly, the parents of the
>>>>> root nodes wouldn't have been checked in the old code. In the new state,
>>>>> the parent BdrvChild already has to contain the new permission.
>>>>>
>>>>> In bdrv_refresh_perms(), we already check parent conflicts, so no change
>>>>> for all callers going through it. Good.
>>>>>
>>>>> bdrv_reopen_multiple() is less obvious. It passes permissions from the
>>>>> BDRVReopenState, without applying the permissions first.
>>>>
>>>> It will be changed in the series
>>>>
>>>>> Do we check the
>>>>> old parent permissions instead of the new state here?
>>>>
>>>> We use given (new) cumulative permissions for bs, and recalculate
>>>> permissions for bs subtree.
>>>
>>> Where do we actually set them? I would expect a
>>> bdrv_child_set_perm_safe() call somewhere, but I can't see it in the
>>> call path from bdrv_reopen_multiple().
>>
>> You mean parent BdrvChild objects? Then this question applies as well
>> to pre-patch code.
> 
> I don't think so. The pre-patch code doesn't rely on the permissions
> already being set in the BdrvChild object, but it gets them passed in
> parameters. Changing the graph first and relying on the information in
> BdrvChild is the new approach that you're introducing.

New code still pass permissions as parameters for root node. And only
inside subtree we rely on updated parents. But that's correct due to
topological order of updating.


OK, that's incorrect for the following case: when one of the parents (X)
of inner node in bs subtree IS NOT in the bs subtree but IS in reopen queue.
And we'll use wrong permission of X. Still:

1. It's preexisting. bdrv_check_update_perm() doesn't take reopen queue
in mind when calculate cumulative permissions (and ignore_children doesn't
help for the described case

2. We can hope that on next permission update, started from node X, permissions
will become more correct

3. At the end of series permission calculation in bdrv_reopen_multiple is
rewritten anyway.


> 
>> So, we just call bdrv_check_perm() for bs in bdrv_reopen_multiple.. I
>> think the answer is like this:
>>
>> if state->perm and state->shared_perm are different from actual
>> cumulative permissions (before reopne), then we must have the
>> parent(s) of the node in same bs_queue. Then, corresponding children
>> are updated as part of another bdrv_check_perm call from same loop in
>> bdrv_reopen_multiple().
>>
>> Let's check how state->perm and state->shared_perm are set:
>>
>> bdrv_reopen_queue_child()
>>
>>      /* This needs to be overwritten in bdrv_reopen_prepare() */
>>      bs_entry->state.perm = UINT64_MAX;
>>      bs_entry->state.shared_perm = 0;
>>
>>
>> ...
>> bdrv_reopen_prepare()
>>
>>         bdrv_reopen_perm(queue, reopen_state->bs,
>>                       &reopen_state->perm, &reopen_state->shared_perm);
>>
>> and bdrv_reopen_perm() calculate cumulative permissions, taking
>> permissions from the queue, for parents which exists in queue.
> 
> Right, but it stores the new permissions in reopen_state, not in the
> BdrvChild objects that this patch is looking it. Or am I missing
> something?
> 
>> Not sure how much it correct, keeping in mind that we may look at a
>> node in queue, for which bdrv_reopen_perm was not yet called, but the
>> idea is clean.
> 
> I don't think the above code can work correctly without something
> actually updating the BdrvChild first.
> 
>>>> It follows old behavior. The only thing is changed that pre-patch we
>>>> do DFS recursion starting from bs (and probably visit some nodes
>>>> several times), after-patch we first do topological sort of bs subtree
>>>> and go through the list. The order of nodes is better and we visit
>>>> each node once.
>>>
>>> It's not the only thing that changes. Maybe this is what makes the patch
>>> hard to understand, because it seems to do two steps at once:
>>>
>>> 1. Change the order in which nodes are processed
>>>
>>> 2. Replace bdrv_check_update_perm() with bdrv_check_parents_compliance()
>>
>> hmm, yes. But we do bdrv_check_parents_compliance() only for nodes
>> inside subtree, for all except root.  So, for them we have updated
>> permissions.
> 
> Ah! This might be the missing piece that makes it safe.
> 
> Maybe worth a comment?
> 
> Kevin
> 


-- 
Best regards,
Vladimir

