Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F33C0307D7A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 19:11:32 +0100 (CET)
Received: from localhost ([::1]:52642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5BlU-000696-1V
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 13:11:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5Ben-0000xE-4M; Thu, 28 Jan 2021 13:04:37 -0500
Received: from mail-eopbgr80095.outbound.protection.outlook.com
 ([40.107.8.95]:55301 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5Beb-0007wa-0r; Thu, 28 Jan 2021 13:04:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U2nP2ZShGmw9rZUho+p9C3eAsgq7rdYxm2EWLHvQQ+85l/vJu6lQ8i+DapK2zJyBEpH5TTI5pgo2I3z/VlsZ0hXZTduU+zn3ubqMuIr3hcttd7tAPgQ4AqjFC3BoD5T8B20A/Kg+Gv+VgiUcqyAfa9pMiODPwb6/md1FSAfYk9OymN4UoYzA3Ljc8fhs7STaTphDuK+SxPJOmgAby38NG91Zif8C2WmVjc8ONBG/XQi4mNLOX3nU8BS2Kt2jKLUcE8pQzkfWa7fmTq+2qxfnuLBZIfO58T+8+xU5NXOFC+RXU837TCKZrpSjgbMka4LgQtvmOCsQT3X8Y3R9Wlo4kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEv6m/5+svnLgsPM9LDkyjn8FFWKXgJwi+Mfxl6JIns=;
 b=mwoHcdQOGyaElideAF/ZjfiX2j+5mfbyDZ0lSuTp2U6VXI8T1qQLdM/C5nTHudMwfefazKm1bmoE1gfbrr1ob0UFEuzbs+xVaofP7U1l2FtJCyKnsN/069rOwkLEVT6TA1Rp5wtk0IS8OieIMkWW1lEpaNs66GF+MGPOaNYXr5PPxslIZispubIV1+7mjEip8TGce7YCxOfeWVCN1YnQNpidqeqDFbyS0kuo6bjNcqe4HbcnE2sVGkUsMiNlIx+8FJ8F1elmyBDhG3BbS27o/PUoUlya/uoCUxqae8SykDykCw12DBG7liNEMK1AGxFCw2+n3KaCuNwWSy1vh5t70g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEv6m/5+svnLgsPM9LDkyjn8FFWKXgJwi+Mfxl6JIns=;
 b=E9DXAOY8NewLYnnbYWTV2n4NjAGM+oipmdXSJMy8rSFHz3p57JaTW8o8kCUACIi+3LJbMiPD3LquCDTNWwsQTIJJxiYzUi0ZZKBSUhE1nb1e4ZOcBq6wRx8VJN+/v7Ijp9lderg84OdJeq0ci23YCdrCR0qDOtvcimCErBjZcfE=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4470.eurprd08.prod.outlook.com (2603:10a6:20b:b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Thu, 28 Jan
 2021 18:04:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Thu, 28 Jan 2021
 18:04:17 +0000
Subject: Re: [PATCH v2 15/36] block: use topological sort for permission update
To: Kevin Wolf <kwolf@redhat.com>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-16-vsementsov@virtuozzo.com>
 <20210127183809.GD6090@merkur.fritz.box>
 <ef4f43d2-a8b8-932e-78e4-6ffc9d8e7d3e@virtuozzo.com>
 <20210128171356.GE5361@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5e6e28e0-133c-9094-1c48-532090453cb1@virtuozzo.com>
Date: Thu, 28 Jan 2021 21:04:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210128171356.GE5361@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.105]
X-ClientProxiedBy: AM0PR01CA0180.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::49) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.105) by
 AM0PR01CA0180.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend
 Transport; Thu, 28 Jan 2021 18:04:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a6fb563-79bf-419d-9445-08d8c3b7210f
X-MS-TrafficTypeDiagnostic: AM6PR08MB4470:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4470B293D3318EE11E8BCF50C1BA9@AM6PR08MB4470.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3+H4utztxEQ0qIPtCDQ+Zfn5LbJNHr9IL1pWn1aapTNLDBrcBEG4clQQ0PWxLb/bqlwhY1SPg+dcMuguwVgyWojxgB8FiHrNXl9KJAmcjRDgjKqYLNPTYpUT2JVnnKolq3udKaV1lrQWjQQzzvJaaTXzo1NQ1527+uXM7EsJ55lEt675+u1oD54XtkEox344Ry9Ocn6aMHTJVPnahTyTR0tok9TQVLKdinrxMt7ZfnnPzwVCfdhZU4HpFw6W1gCIxnvfxhPH0cPBZMQJVOHy/TgmiL8oZqkdPxYhuZUng7vczlG2fsDNLusDAqDdAmxpxS1pCuqzmDGE7+Ip3EQ42A07mclpFMz07Y+hAt8Rlx0JiawSiAuJ9WfZglFsmc6lWrr1kmQTzgQ4RwPfCroCjaGHDRlbplsfyWdNmFgpr3rvhV4BRkIXfdILTcfGJHLE89ELuxjg6yZ9AsQmgP+I2cuL5pyI/WDjPL3z7z+f4lp3wnPdMZ2rnuEkdG2o4O+JSeQOy07ritMhlZhvHDfJpl59MsTDeprWFNp9pj1K9SkInrJ4t0tDjIqAUcICVwYTIZxgAA+Nq03TFuBReeD63g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(39850400004)(136003)(366004)(316002)(52116002)(5660300002)(4326008)(31686004)(6486002)(8936002)(16576012)(8676002)(26005)(36756003)(478600001)(6916009)(186003)(86362001)(956004)(31696002)(2616005)(15650500001)(83380400001)(66946007)(107886003)(66556008)(2906002)(16526019)(66476007)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K0kxdXVwSDV2VFkwemZWSVBlWmpGNENWaTBscEYzbHRqeW50eUNFcVJ6QVNn?=
 =?utf-8?B?dDAyQkxhZFNFSlAyUDlQcDlEVW1YWlh0c3Flc2V3a1pNU3hSTm41bUh2NDFS?=
 =?utf-8?B?bmI0MHdJSzJxZmZ0T2hKbXJxbVFLMDV3aVNieFkvMk9XL29VaWo1d1BsMFJ6?=
 =?utf-8?B?bm4wSGpsbjczRy9JeXRXWEJibmlrQ0g3L1dia1RTbmlOVGh3RFF1U0tkU3Uv?=
 =?utf-8?B?djJINWF0d09YbEpWcHU3ZVhNS1BtbHBJVTRjaXF5Ylh2bmJxUnlXQ05NS2tH?=
 =?utf-8?B?UlBMaDR5alFYaWRtVU5NbHZmMGNLV1dJQnlmYVNVMGY3UWlFUnV6NkkwYWt5?=
 =?utf-8?B?aTE3SWNUTWdrV0hETE9lbU5VcFVET3RNSTBTclJwRVJOZVFSaXA3T3FLaHgw?=
 =?utf-8?B?SUFadk1rUHlsTHVGa0l0TXFqTEpFM3kwZXE0K3FCR05yRGhTTUEzOXNKSU1H?=
 =?utf-8?B?L1pyMTFpYWdVKzdjN3BMQzFrTHZkbDZKdkgyVFJDaS92VW1yeEg5N3hveEYr?=
 =?utf-8?B?LzFuYVhVTWdsaTBodEN0emo1SmdsVGQrTXRZMUNlYTlyWGMzM3F4bHA4T2xr?=
 =?utf-8?B?UlZjQWMzZUJvY1Z2V3NZZjh4Y09lUlJ2c3dLaGJIUmE2c3p2d3NzWHpTQnIr?=
 =?utf-8?B?YlY5YnpZOEtCbElDN1BjNjZlT2k5UEtFQUNuRFcvRGhQY1h3VlNwdGtjSXYz?=
 =?utf-8?B?TEJpbmw2dFAzMEJ2VUQ1NWkvN2RQZkpmejZXME5KSkxBeCtyNGF4TFdnajBR?=
 =?utf-8?B?L29aY3ZRVnJmSFExY0xwYUp5b0piSlB6ZlQveXFrYVJsdkdpZEJCeVpTellO?=
 =?utf-8?B?SjhLREMvSURPd29CcDUwMEh3OWQ4VmpBWjh0VzlKbUd6QThaWDVkTGxvdzVV?=
 =?utf-8?B?R2x3U2x0L3V6N1dQZSs5ZkJOUDVES3Q1TWc0OVBwczlEdVgzeWp2YUtqclBP?=
 =?utf-8?B?K2VESWRkd1crZTNSb2t4SzUwQ0lXaHRwYmFteFBkUWZBMlhiTzdxczd5ajRN?=
 =?utf-8?B?R0ZwL0hvQnVOS3RuNzJ1NjFnWHQ1V0JuaVlzWE1CWWJrNmE3Z0FldzdqcVhV?=
 =?utf-8?B?UVplWC95MlArZGpoZ3BtcnI5dG1IRjhrUlo5U1R0QUFwWHdlR1Q1VDQySVc4?=
 =?utf-8?B?QWo5NTJSSWtJY3NPNWI5dG0ySW9OTTNrVVE4c1J1Tk1laWFUYTErVVFOQUhq?=
 =?utf-8?B?OFIrNEZrZ3pKd092QVV6dGxlSGZJUlUvcGVQR2J6ZHJiSTZmWVZzT1JLcTdM?=
 =?utf-8?B?Zi9TZjBQdnQwK2hxdWQ3M1FGamY5TzAwaFRtSUc1WFZWUktweVIvRDBqMjdz?=
 =?utf-8?B?aWhHeWlUYVFrZXp2RTRwL1ZOVHlyNlZ4NU9pa0V6Wnp5YWpCSCsrS0l4L0Nz?=
 =?utf-8?B?LzdyeHVwbFE2V3ZyMVVMd1JqeUZ0N1ZOaW9iell0OW81cHdmMVZRNkxMMGE5?=
 =?utf-8?Q?8C3yNN7c?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6fb563-79bf-419d-9445-08d8c3b7210f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 18:04:17.5170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eVa8//bWs/WT2GEm2cpp5SXIfkMuTYtFXkXcq3s+VFETyq0qDVe7wAk4kxA0WWbGrbu9Ac1JCzXZDBaeVw1RRFp1+W/sx/yKSqHQdx/WNjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4470
Received-SPF: pass client-ip=40.107.8.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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
Cc: qemu-block@nongnu.org, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

28.01.2021 20:13, Kevin Wolf wrote:
> Am 28.01.2021 um 10:34 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 27.01.2021 21:38, Kevin Wolf wrote:
>>> Am 27.11.2020 um 15:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>> -static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
>>>> -                           uint64_t cumulative_perms,
>>>> -                           uint64_t cumulative_shared_perms,
>>>> -                           GSList *ignore_children, Error **errp)
>>>> +static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
>>>> +                                uint64_t cumulative_perms,
>>>> +                                uint64_t cumulative_shared_perms,
>>>> +                                GSList *ignore_children, Error **errp)
>>>>    {
>>>>        BlockDriver *drv = bs->drv;
>>>>        BdrvChild *c;
>>>> @@ -2166,21 +2193,43 @@ static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
>>>>        /* Check all children */
>>>>        QLIST_FOREACH(c, &bs->children, next) {
>>>>            uint64_t cur_perm, cur_shared;
>>>> -        GSList *cur_ignore_children;
>>>>            bdrv_child_perm(bs, c->bs, c, c->role, q,
>>>>                            cumulative_perms, cumulative_shared_perms,
>>>>                            &cur_perm, &cur_shared);
>>>> +        bdrv_child_set_perm_safe(c, cur_perm, cur_shared, NULL);
>>>
>>> This "added" line is actually old code. What is removed here is the
>>> recursive call of bdrv_check_update_perm(). This is what the code below
>>> will have to replace.
>>
>> yes, we'll use explicit loop instead of recursion
>>
>>>
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
>>>> +                           uint64_t cumulative_perms,
>>>> +                           uint64_t cumulative_shared_perms,
>>>> +                           GSList *ignore_children, Error **errp)
>>>> +{
>>>> +    int ret;
>>>> +    BlockDriverState *root = bs;
>>>> +    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, root);
>>>> +
>>>> +    for ( ; list; list = list->next) {
>>>> +        bs = list->data;
>>>> +
>>>> +        if (bs != root) {
>>>> +            if (!bdrv_check_parents_compliance(bs, ignore_children, errp)) {
>>>> +                return -EINVAL;
>>>> +            }
>>>
>>> At this point bs still had the old permissions, but we don't access
>>> them. As we're going in topological order, the parents have already been
>>> updated if they were a child covered in bdrv_node_check_perm(), so we're
>>> checking the relevant values. Good.
>>>
>>> What about the root node? If I understand correctly, the parents of the
>>> root nodes wouldn't have been checked in the old code. In the new state,
>>> the parent BdrvChild already has to contain the new permission.
>>>
>>> In bdrv_refresh_perms(), we already check parent conflicts, so no change
>>> for all callers going through it. Good.
>>>
>>> bdrv_reopen_multiple() is less obvious. It passes permissions from the
>>> BDRVReopenState, without applying the permissions first.
>>
>> It will be changed in the series
>>
>>> Do we check the
>>> old parent permissions instead of the new state here?
>>
>> We use given (new) cumulative permissions for bs, and recalculate
>> permissions for bs subtree.
> 
> Where do we actually set them? I would expect a
> bdrv_child_set_perm_safe() call somewhere, but I can't see it in the
> call path from bdrv_reopen_multiple().

You mean parent BdrvChild objects? Then this question applies as well to pre-patch code.

So, we just call bdrv_check_perm() for bs in bdrv_reopen_multiple.. I think the answer is like this:

if state->perm and state->shared_perm are different from actual cumulative permissions (before reopne), then we must
have the parent(s) of the node in same bs_queue. Then, corresponding children are updated as part
of another bdrv_check_perm call from same loop in bdrv_reopen_multiple().

Let's check how state->perm and state->shared_perm are set:

bdrv_reopen_queue_child()

     /* This needs to be overwritten in bdrv_reopen_prepare() */
     bs_entry->state.perm = UINT64_MAX;
     bs_entry->state.shared_perm = 0;


...
  
bdrv_reopen_prepare()

        bdrv_reopen_perm(queue, reopen_state->bs,
                      &reopen_state->perm, &reopen_state->shared_perm);

and bdrv_reopen_perm() calculate cumulative permissions, taking permissions from the queue, for parents which exists in queue.

Not sure how much it correct, keeping in mind that we may look at a node in queue, for which bdrv_reopen_perm was not yet called, but the idea is clean.

> 
>> It follows old behavior. The only thing is changed that pre-patch we
>> do DFS recursion starting from bs (and probably visit some nodes
>> several times), after-patch we first do topological sort of bs subtree
>> and go through the list. The order of nodes is better and we visit
>> each node once.
> 
> It's not the only thing that changes. Maybe this is what makes the patch
> hard to understand, because it seems to do two steps at once:
> 
> 1. Change the order in which nodes are processed
> 
> 2. Replace bdrv_check_update_perm() with bdrv_check_parents_compliance()

hmm, yes. But we do bdrv_check_parents_compliance() only for nodes inside subtree, for all except root.
So, for them we have updated permissions.

> 
> In step 2, the point I mentioned above is important (new permissions
> must already be set in the BdrvChild objects).
> 
> The switch to bdrv_check_parents_compliance() also means that error
> messages become a bit worse because we don't know any more which of the
> conflicting nodes is the new one, so we can't provide two different
> messages any more. This is probably unavoidable, though.
> 
>>>
>>>> +            bdrv_get_cumulative_perm(bs, &cumulative_perms,
>>>> +                                     &cumulative_shared_perms);
>>>> +        }
>>>> -        cur_ignore_children = g_slist_prepend(g_slist_copy(ignore_children), c);
>>>> -        ret = bdrv_check_update_perm(c->bs, q, cur_perm, cur_shared,
>>>> -                                     cur_ignore_children, errp);
>>>> -        g_slist_free(cur_ignore_children);
>>>> +        ret = bdrv_node_check_perm(bs, q, cumulative_perms,
>>>> +                                   cumulative_shared_perms,
>>>> +                                   ignore_children, errp);
>>>
>>> We use the original ignore_children for every node in the sorted list.
>>> The old code extends it with all nodes in the path to each node.
>>>
>>> For the bdrv_check_update_perm() call that is now replaced with
>>> bdrv_check_parents_compliance(), I think this was necessary because
>>> bdrv_check_update_perm() always assumes adding a new edge, so if you
>>> update one instead of adding it, you have to ignore it so that it can't
>>> conflict with itself. This isn't necessary any more now because we just
>>> update and then check for consistency.
>>>
>>> For passing to bdrv_node_check_perm() it doesn't make a difference
>>> anyway because the parameter is now unused (and should probably be
>>> removed).
>>
>> ignore_children will be dropped in [27]. For now it is still needed
>> for bdrv_replace_node_common
> 
> In bdrv_node_check_perm(), it's already unused after this patch. But
> fair enough.
> 
> Kevin
> 


-- 
Best regards,
Vladimir

