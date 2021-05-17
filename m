Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FA4383BF0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:09:40 +0200 (CEST)
Received: from localhost ([::1]:45028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lihgR-0000Ra-DU
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lihca-0005Vt-JW; Mon, 17 May 2021 14:05:40 -0400
Received: from mail-db8eur05on2113.outbound.protection.outlook.com
 ([40.107.20.113]:48745 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lihcX-0000XP-KH; Mon, 17 May 2021 14:05:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JT68tdK+xed4gEkJyPVg/AAncYGNaiFeBYGm7F53CTQTWKWLyW4XIRkyJLxne7iy4poNF1CIzseUB+WdEW4ij6wyTD6UV7GbQ4zEWTnxbVZN7DN0HZG2tU2xBqqdcRqdGXnq69oCvi4qDZmARqF+JU9ihcgM9EAojvN+HaAC35yWIG7J/kxUdPj/KK0U+DBYoYE4D/jCW29wzNNxh17fpfEBO0bcjEUt/anDLDcW0bl9eHaWTLoFteWJ5k7d5//ugocVHkJREN+HF2MWkDijUP/hScARZKG+RRjspKrF/L5M7kfS3wfzGvCE8J6XZFhSBsUwi6mn1yyysBRPRz6ppw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ctBLhQCkXfQT47FtOCkeOJSgeK4ZxQCr5beRO7gLu+Q=;
 b=oKOlOVIu37KtmDs9oVG5sUg6gkuqvS88yJKSeJzEQQWh/trhJozIj8gHO8IOaRKZw9I+Hlsj/kHp34DXkB0M2G/yGECf+XBAGFtLf40tf2KpLhg3a9jiDUj8kle5bgyEHGp/IBn0UeG6gLg+RKBkYz/YKpJMMTggqvvwLKpV7u2d9DYFJrH3Gccp/3adjsKsoHp2fzzW+NYBdNHBaoLCUdVWBI0nNVkBTNy8Tc9hO4scCR6wqtVfeLD9rkaLS8qjPT8G/+tyNeAGEXnv9MIItVQraob5W3+trV4Ny5e5nXY/Fls1K3NO+KhD9PSKVgY7e7GVpy4m9Z6woIqc7/iYzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ctBLhQCkXfQT47FtOCkeOJSgeK4ZxQCr5beRO7gLu+Q=;
 b=rhNhBWG8+CAOSuL4I5ySajWxzC99NlfgpN4RlfSQvwjAXVGoc4t4s/oqUAashkV3IwNj5N+QZH8WGrnLZnT9Cz2jTw+qUwm6xLr5eK5SX5WIU1JpvUxOcboHSSxueVZVXcLLVUni/NuUIOCbFQZxVGNG5gucltdqQJbjXXvdD1U=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5493.eurprd08.prod.outlook.com (2603:10a6:20b:102::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Mon, 17 May
 2021 18:05:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 18:05:33 +0000
Subject: Re: [PATCH 01/21] block: introduce bdrv_replace_child_bs()
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 jsnow@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
 <20210517064428.16223-3-vsementsov@virtuozzo.com>
 <ee302de8-bd22-b43c-f30f-eedce438d825@redhat.com>
 <554dc7c4-c16e-932b-21b1-e803cb1cee32@virtuozzo.com>
 <cdfbd6f3-0d87-942c-9037-6a80ff6a76d5@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <023824c7-99cf-a26c-8db7-16dead2b3274@virtuozzo.com>
Date: Mon, 17 May 2021 21:05:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <cdfbd6f3-0d87-942c-9037-6a80ff6a76d5@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.231]
X-ClientProxiedBy: PR0P264CA0224.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.231) by
 PR0P264CA0224.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Mon, 17 May 2021 18:05:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bfaa551-a2d4-45bb-921c-08d9195e5d8d
X-MS-TrafficTypeDiagnostic: AM7PR08MB5493:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5493C56B2D8E9E24CD7A24D0C12D9@AM7PR08MB5493.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FiaIf9+Xrb416nn+s8px8QJqMq4zXGTaAHZ0bFr5plAlPyhYSmF3qiOX8WitfQqy5i7IfhTL9skgbZBf+Zl7pZYMQ0ioQiNOgYZPQKIrWZMWePNGjShlsonkcKHB6pPKPIhvumUlze+vLDsy6Sxv2giz/o9Xt7vPloVo+lcHvfsMLoL5sqxuHXWD+yZ7oAg7a4SvUnUAtQNW3WLQt1K2tnjYfcpt75hmW9T69SXnHmOG1yU3b0RNNoYWsWGAd8crp2vqnDWhF0aGcVeHgGiL9a91KMVJPyV1OM5M2kQ52MbcoPYI+SEIn5RQxBo9ClhOy6MtElxCf/b0jt+z+kEqla6fQNYdD/oEoh44xyMti1hweZ/f7CGU9kgZNa4/eQrE2TY9unGMR5CV/OupJQUvsTnYYBDj4vWQ4zspLNbJ084zCEfAfzBLdrJYz5HzD9HcntJMfS7ZF9LyuxhzMLkfwJvgbneqds5+wzcxcCWW0ODiXjXNxLI/odFbabqJ117pfgOpZu7YhpE4/+p/OgIRkCVnZ/02sZfcutFIo9Db7lLqSoKJ4Cn4uzYKbiiL1QxqkajFWLSsc7LVLWRwHYblC5HHdquArggOqCqxxSnTjlj0fhWn/1MC5NIIO0qIIaUuKozTSHhXs3ErerwROtCzVme1yzIMG5aW9bLabZjxB3WzpCJzQDsn/m/XtnZB7ehJUJJlisrZOMHxkPKDswSANqJI5myqSJkJ/55VoCBnrtc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(366004)(346002)(136003)(396003)(376002)(5660300002)(4326008)(2906002)(31696002)(86362001)(36756003)(83380400001)(107886003)(8676002)(7416002)(31686004)(2616005)(956004)(6486002)(66556008)(66946007)(66476007)(478600001)(52116002)(53546011)(16526019)(26005)(38100700002)(38350700002)(186003)(16576012)(316002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TlpzcmwyYzR3NFN0Smo2V0lDNUxzbEFkSnhpT0s3WXY5KzErRVIyTXlHeUFn?=
 =?utf-8?B?bnhaR21TVnptN2VGS1lZSFpobXJMZzhhTEFqcVhoQkZsL2NVdSthWFBzUFlz?=
 =?utf-8?B?NVE4NEtSNERKdEdWK1dqL2dmbDJlZEFEQVEzNWlnaW91MGVDYU5FZ0ZFd2l1?=
 =?utf-8?B?ZnE1enlncHNuTXRTZG9wZnlORFQ5Sk1LaUdTRDc5SXNIc1pqU0VIYXVBeVpw?=
 =?utf-8?B?VUoxTXYxMHJWemhnYTVQaGo0elgwT1VRM1lmTUZMWkxTOVp2SDhWY2VJaE4v?=
 =?utf-8?B?UjdWR0JpTTgvUStHRFlLcGx3Y2FPQjlKS3pXa3Zjd0doOFZiRkVscU5kV3RP?=
 =?utf-8?B?bm1aeU9Ocmt5dkF5ZzgxeG02c3RBbGtLVXdNSTNtSUU4Tmt1SjlDQy90M2VK?=
 =?utf-8?B?QS85ME5yV0wvY1RNR0NibHlCOXBLdVB3N2JNRXBrNWhUS1J4VG1TY1FnWXJI?=
 =?utf-8?B?ai8raGo0dW1jZTlBdHVITk5POXBYTXk0N3dXcTJDdmxuZXlTbE1jY2tJcElL?=
 =?utf-8?B?N0p5c1AzZFBUbjE1cWRJTXF5OVBjZUd5QmM2QVM4OTU5ZU9FeHZtOUY3d2Zn?=
 =?utf-8?B?Q29hUEdYS3YxN0ZVUXdMeE5GV09nOFpiMDVpcExJU0xJc2luT2dXZlFwakRo?=
 =?utf-8?B?K05nTVRERDFYYU05bWF0cEFSNFZrMC9TYy9RWVpKQUdDdVg3Tm1RZ1hxaEYr?=
 =?utf-8?B?VmJQZERIYWFSS2lleXE5b2I0ZTRzSk4rOHQzUjlRY3BWbWpUSFRvdmpGNGlH?=
 =?utf-8?B?Z0lCSUVDam5ZTGJ3dlE2SkFjZTRlSXh0YzNDbnB2Q2lxNlVSR1RjcVBUS1lo?=
 =?utf-8?B?bHpBY3lSV2t6elJJbExvUnFCeFVYZVkwRW02STdoV0cwdFAyazN2K1JjQnVt?=
 =?utf-8?B?K1NQL1Yya2llbjZPSzc0QWIrME45Z0NhNGo1T2ZDdlBUOFZEZ0d3U0gwUkYw?=
 =?utf-8?B?dUFRM1JieTAwMk5LMjZuOXp4N1N3WEI0OEc2cXd6NS9DQ2JNUCtVZW5MWHBU?=
 =?utf-8?B?WkRGdTRiRkI1U3Njd29nRUlHNmVoYnV3MlFMZzN2SjN2L2ZVa1ZGZlZhbkx2?=
 =?utf-8?B?SUlrTXAxbEQyQ0FTaS9SSFJhRk1FM0hEZEF2R3B1dGxuODBnRDZVVlhBOUJn?=
 =?utf-8?B?UG9seFowTGhQU2V1Z0tlMFowUkxqaUdaQ29zVS9yazJzZXc3eGI5M1VGb3Ax?=
 =?utf-8?B?QmU2VGM1Z0cvTW42YXloRlhDMVNzbzBNb3pjL3ZLa1RFN2RmNG9xUG9XN2M4?=
 =?utf-8?B?KzRaQnB2RHRZV25USnJGT3dBdVcxMWkxUk1qd3NQSFZvYVVMWUozdEs4UEFS?=
 =?utf-8?B?SnIreFFhOUFJc3c5dVBqTUxXK2Z4S1UwNHc5WW1jenlMWEI5cSs1Nk9kNlp2?=
 =?utf-8?B?cW1jdU5mbm44VTg0S1JnM2FiNXR3NHo3Y1BTMURYYU0xTXZUNEUzSURoV0xY?=
 =?utf-8?B?ZytUNzNmUTZ4WjF1T2lJdGcxcFJlUXlRb0VObTdydFVuWmp2Kyt1cEJUZkx5?=
 =?utf-8?B?Ulp6QmFlN3pTNWloNE1hcnpWcisvRVVjUHhJbm9mUGtadlpVcGtRZmxWTjVW?=
 =?utf-8?B?ekhwV2w3Z3NPVVdvYmF0bU9wTGI2SXB1cGVLYUNUSmk1ckVjUFNEYlFraUYy?=
 =?utf-8?B?UXlhZ0ZnUmU0dlBVbUdiQ3Ywa25uM1lMbU5ZT3JlQ0dIaHZlYUswUnpjSmV4?=
 =?utf-8?B?aE5tcCt3aUw5TE51QUVHWXhiS1pXS2I0eHBwWGVOV2JmbnBWOWg2VW53a2NL?=
 =?utf-8?Q?3AFApKrC0r6g21xaTs4NDAyXvdDUHxMHYKM4BWs?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bfaa551-a2d4-45bb-921c-08d9195e5d8d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 18:05:33.8119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SrCpGmg8CWtXUMZQIOvT5IbqKburHXReS0QS75FF66KzJ+FeO6mQ+VXmm85KrR7GECWn8GUeDABuDs+SmeXGegoZQzDKUPvWTNaZbKVWnSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5493
Received-SPF: pass client-ip=40.107.20.113;
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

17.05.2021 18:51, Max Reitz wrote:
> On 17.05.21 16:30, Vladimir Sementsov-Ogievskiy wrote:
>> 17.05.2021 15:09, Max Reitz wrote:
>>> On 17.05.21 08:44, Vladimir Sementsov-Ogievskiy wrote:
>>>> Add function to transactionally replace bs inside BdrvChild.
>>>>
>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>> ---
>>>>   include/block/block.h |  2 ++
>>>>   block.c               | 36 ++++++++++++++++++++++++++++++++++++
>>>>   2 files changed, 38 insertions(+)
>>>
>>> As you may guess, I know little about the rewritten replacing functions, so this is kind of difficult to review for me.  However, nothing looks out of place, and the function looks sufficiently similar to bdrv_replace_node_common() to make me happy.
>>>
>>>> diff --git a/include/block/block.h b/include/block/block.h
>>>> index 82185965ff..f9d5fcb108 100644
>>>> --- a/include/block/block.h
>>>> +++ b/include/block/block.h
>>>> @@ -361,6 +361,8 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
>>>>                   Error **errp);
>>>>   int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
>>>>                         Error **errp);
>>>> +int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
>>>> +                          Error **errp);
>>>>   BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *node_options,
>>>>                                      int flags, Error **errp);
>>>>   int bdrv_drop_filter(BlockDriverState *bs, Error **errp);
>>>> diff --git a/block.c b/block.c
>>>> index 9ad725d205..755fa53d85 100644
>>>> --- a/block.c
>>>> +++ b/block.c
>>>> @@ -4961,6 +4961,42 @@ out:
>>>>       return ret;
>>>>   }
>>>> +int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
>>>> +                          Error **errp)
>>>> +{
>>>> +    int ret;
>>>> +    Transaction *tran = tran_new();
>>>> +    g_autoptr(GHashTable) found = NULL;
>>>> +    g_autoptr(GSList) refresh_list = NULL;
>>>> +    BlockDriverState *old_bs = child->bs;
>>>> +
>>>> +    if (old_bs) {
>>>
>>> Hm.  Can child->bs be ever NULL?
>>
>> Hmm. Most probably not :)
>>
>> In some intermediate states we don't have bs in child, but it shouldn't be the place where bdrv_replace_child_bs is called.
>>
>>>
>>>> +        bdrv_ref(old_bs);
>>>> +        bdrv_drained_begin(old_bs);
>>>> +    }
>>>> +    bdrv_drained_begin(new_bs);
>>>
>>> (I was wondering why we couldn’t handle the new_bs == NULL case here to replace bdrv_remove_filter_or_cow_child(), but then I realized it’s probably because that’s kind of difficult, precisely because child->bs at least should generally be non-NULL.  Which is why bdrv_remove_filter_or_cow_child() needs to add its own transaction entry to handle the BdrvChild object and the pointer to it.
>>>
>>> Hence me wondering whether we could assume child->bs not to be NULL.)
>>
>> bdrv_remove_filter_or_cow_child() is "lower leve" function: it doesn't do drained section nor permission update. And new bdrv_replace_child_bs() is public function, which cares about these things.
>>
>>>
>>>> +
>>>> +    bdrv_replace_child(child, new_bs, tran);
>>>> +
>>>> +    found = g_hash_table_new(NULL, NULL);
>>>> +    if (old_bs) {
>>>> +        refresh_list = bdrv_topological_dfs(refresh_list, found, old_bs);
>>>> +    }
>>>> +    refresh_list = bdrv_topological_dfs(refresh_list, found, new_bs);
>>>> +
>>>> +    ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
>>>
>>> Speaking of bdrv_remove_filter_or_cow_child(): That function doesn’t refresh permissions.  I think it’s correct to do it here, so the following question doesn’t really concern this patch, but: Why don’t we do it there?
>>>
>>> I guess it’s because we expect the node to go away anyway, so we don’t need to refresh the permissions.  And that assumption should hold true right now, given its callers.  But is that a safe assumption in general?  Would there be a problem if we refreshed permissions there? Or is not refreshing permissions just part of the function’s interface?
>>>
>>
>> Caller of bdrv_remove_filter_or_cow_child() should care about permissions:  bdrv_replace_node_common() do this, and bdrv_set_backing_noperm() has "_noperm" in the name..
> 
> OK.  Makes me wonder why bdrv_remove_filter_or_cow_child() then doesn’t have _noperm in its name, or why its comment doesn’t explain this interface contract, but, well. :)

You are right that's unclear. I'll make the patch that cleans that up.

> 
>> The main impact of previous big rework of permission is new scheme of working with permission update:
>>
>>   - first do all graph modifications, not thinking about permissions
>>   - refresh permissions for the whole updated subgraph
>>   - if refresh failed, rollback all the modifications (main sense if transactions here and there is possibility to do this rollback)
>>
>> So a lot of internal functions with @tran argument don't update permissions. But of course, we should care to update permissions after any graph modification.
> 
> Ah, OK.  Makes sense, thanks.
> 
> Max
> 


-- 
Best regards,
Vladimir

