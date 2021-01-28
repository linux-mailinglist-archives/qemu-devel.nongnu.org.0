Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2233072FC
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 10:43:42 +0100 (CET)
Received: from localhost ([::1]:59826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l53q1-0007qp-34
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 04:43:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l53hf-0007dL-Aa; Thu, 28 Jan 2021 04:35:03 -0500
Received: from mail-eopbgr60124.outbound.protection.outlook.com
 ([40.107.6.124]:59214 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l53hX-000411-By; Thu, 28 Jan 2021 04:35:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbYDeOXme5PrXLk5MEjDIZHMisKdLh5pdyzY5ZGRnp7SubpNiWGDXWK07M0MfESlldxz887odiF+6srm33fqQExjdDH8hQfh0K2VXIPFUkmalw5+vPfS9iyGeN/n0e4mS63BG+iWUQo45SSRMACbmU8zeFR3j90FmaTy8N22Tr1uG7THgyjSg8jClQMboJk3UkKuy7bOkV0J2XMPeZwqVtcV9N2TmT6Ef9HDKN5KUop3+6xlys7a+1XZ3bHOp2OlNsWqC6RwPz67mtGa6uVBqLFpzjm4GyzQkC3uI5545UWEt+OzmEIeHZgrSEJgq6oB73PVc/0UtHgC5DWw54lu1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJBAi1+SEu1iNwJYltdXEDSecae19U7vQLW0AK5ZjNg=;
 b=Yma+YdqDt0a14TcHHYiYZjrojv+o23qKjYrFk4oF3crESGCjNJuK0Oz1F8T/sKPB7a12nI6va+zWjFV3wewdUptHMJ4Y9vknbiOmeGsHEB/3k8SKhXRj1Y4NqGbJMjgHuHUtNOXOJRm80bBG3kRiPgj+rT94lNk1uR3geyacawKzoRJIL4wyj2RPX6foM1sS0aMDRDtDHEjufmA4XkGtnLLhnAEyj9e4okSk+GER5s/ADpWuVSTYs2qCjQFImhKsvnp9dAOJ2vPs3FqWwR3aHIhcPtTlb1YLVZRQMckCDsRQU1z6N7Gfbo0DQL3enEpAQWXKB2z87EpS3bjJVzF2Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJBAi1+SEu1iNwJYltdXEDSecae19U7vQLW0AK5ZjNg=;
 b=F6kQGaMnSEqPV1duZTD50s+Jsb60k0xrnSjl2ncVi8Ei8O25/C/ETPBsxBF2Ze5kRu/DeFq47ItFs8TqvOqSxWStM1VEo24a1iKgEk+KFB2q+ropBUEdCZONK0EHU15T77Rws25qX6UGsp074oVDh9TTUqVNa9w6y78RQEEKi48=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4689.eurprd08.prod.outlook.com (2603:10a6:20b:c3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Thu, 28 Jan
 2021 09:34:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Thu, 28 Jan 2021
 09:34:48 +0000
Subject: Re: [PATCH v2 15/36] block: use topological sort for permission update
To: Kevin Wolf <kwolf@redhat.com>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-16-vsementsov@virtuozzo.com>
 <20210127183809.GD6090@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <ef4f43d2-a8b8-932e-78e4-6ffc9d8e7d3e@virtuozzo.com>
Date: Thu, 28 Jan 2021 12:34:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210127183809.GD6090@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.105]
X-ClientProxiedBy: AM0PR04CA0097.eurprd04.prod.outlook.com
 (2603:10a6:208:be::38) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.105) by
 AM0PR04CA0097.eurprd04.prod.outlook.com (2603:10a6:208:be::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.17 via Frontend Transport; Thu, 28 Jan 2021 09:34:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8a034e3-9ee6-44fb-3e8c-08d8c36ff4b3
X-MS-TrafficTypeDiagnostic: AM6PR08MB4689:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB46895454FB0B760B2ECF8EADC1BA9@AM6PR08MB4689.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TjnUNQrhOa/xA1JF1QF/FbkkaCIkFmkYFgjFfu/jofwY2vLTH2GslLqsFXCtMuhaJI6SLfoXFy0F8z7dDsiHiQ/Xesm/nckYne9r5XN4NFlUF3frR3aoT6y/bZ61P46oQ9yNNFyPPKz3tkGxOLsTEE0/aWg6WFqCW8kHw/xyOA7GzhAIbQ33RHIvgS6fq5x2hqfdhJwpgiej2yVXhUE15ipRDulh/ggRU/Zwfl+rynLr45RU14FgMlmMn21//NyX+Wg2X0RNvFTmRNSaauHDzUti9CgP4EEv5HraZKhh4bEyfZ0U5CgeVM/wk6LEsbGqAln7Irp216hvE6fu7X+tMrNORNW1hsTlcDS0JutMbRd0dovF+IYv20kSztJ1CVGaK8w4pesfRPU9cz2t9UesZJQMr5QUbVAfXEPBPyYRKkR2QuwguMc/XfPub1JRKw2MXST/DQFl70tvVH38X+7tg7ptiew1s9yhJRiFw2VseOvKb9I8/LvKZ2zeDj9GRVy/tvq8ZZ5XZ68OuWcRO4jsSpj1lqk6n2GSFcPQmT3C7Z2WEnIDgTpqfRwpa7Vd0NjaKm+9+jQW39gOQ9gXS+WyrSBLkgw+m0TuL6ysl+5Ks9Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39830400003)(376002)(366004)(396003)(136003)(15650500001)(6916009)(16526019)(956004)(2616005)(478600001)(2906002)(6486002)(8676002)(83380400001)(8936002)(86362001)(31696002)(107886003)(16576012)(316002)(66946007)(26005)(4326008)(66556008)(66476007)(52116002)(31686004)(36756003)(186003)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?a0pnbTVkU2tFZmxaSzJ5d1poUUttdGZZWWN1M3cyNEgxamE2V1RWSGNieEpW?=
 =?utf-8?B?R2lkRnI4QlVMazh0NEdrU2FhOUY4WHhvcFhsanVmdTBVbHBKaTBIOW9vdkVF?=
 =?utf-8?B?SU1YbUJ1eS9jc3pXUkkyR3B1bXVrTmJtM1lnRXZ6SGxqL2l3N1NuNXMvOUNN?=
 =?utf-8?B?cXFvKzRpeFRXRzRTVnlaOE9WSXpDa3EyMUtxMlM2eVJ0WDEzSWxjN2cxQmdn?=
 =?utf-8?B?ZG1UdlRsK0hiZVpIYVhvV0RmVEwrUG9oTkRFTzFhdlZUVUNhS2pWNEVBdVRP?=
 =?utf-8?B?dDlzRDNOam9iT1llY1ltUS9ZUlpLKzFQaEtVMzZlazB0djlZL1d5YTdTRFo1?=
 =?utf-8?B?Uko2RWltcnVjd1dMVkJXZThEU015MlkvNHliZmptWXp6Y3hGLzFYdnY4UTB6?=
 =?utf-8?B?MlNOZWZhdUh6OTZYOERMdHdLN3FnN0oyN3NDVUNXS3lmY21VVXgwRHB1RTdZ?=
 =?utf-8?B?ZzBrOS9vWHo5bjY4KzJxMFA0MytDVG1NaitkZFBib0dPT3BGYi9rNmhua1lY?=
 =?utf-8?B?YzZ3MUM5OVVVYUZzcDBJekI5cGsvV3l2L1FMdGtNdjZrR3NYWVp1TERlcFZY?=
 =?utf-8?B?a3hiczZsVFJWdnFCL3hWUXJYdkJxQ1NONmNWc0ZYNTY0T3BVYVdZNThkUTlM?=
 =?utf-8?B?ZUQ4Lzc3TTNueEZrcTZNVTl1OThYaC9zV095Q1hMTEJaVnJNVEdhcUMxalha?=
 =?utf-8?B?N29FMHRjUmpEWG1WN1VRUS9DWWdUVmRkUFVVYWxjR1Z0dXFnUzdxU1ByVHVJ?=
 =?utf-8?B?NjZJcDVGRlg4MlRDcGtzSnNsejNwK1lzM1M3eE9IRmU1bWlmRi9NQmV0Mm50?=
 =?utf-8?B?VytCREV6VmgzbXNYaXJaeWpKMVBWMzVmVUt4aUtWQXpCTWZNZXdQTzNOK3py?=
 =?utf-8?B?NFZaeloxNVk2NVprOFNsREFMYjdyTFI3VEJMTnRkdjJrTHlidTR6aHNhcE9X?=
 =?utf-8?B?bmFkMXU0NEUwZWtrYVN1d1ZjNE91Um8vMk03UkpKMmtXcWdKeC9XWWVseFp4?=
 =?utf-8?B?OS9WRERFSGdZSkxYVGJzaVdTN1RleWxkSkFrTk41TkVXY0hwQkhCUFgyM3JG?=
 =?utf-8?B?ZGxJNDJpSzRCUzZnajU4UUczR0duUFp2OStPaUcvM2JUWkVkNDVsTU1KSllG?=
 =?utf-8?B?UUEzblowMVdTb3hxekR1V0JkclErTm1pWXhNMTNDOXdtVFpwcjJRWENCeitF?=
 =?utf-8?B?bnUxcWl6dzgwQUg4cGhVN2R0NHFzNHlRTjhYaDlvTVFtOFN0eVFvSE44NmRJ?=
 =?utf-8?B?VFJVbnpIZWI3NVN5TGMyU0MzUjEzLzZibXFHa2dxSTdDNDJVYktaN3dTR0lR?=
 =?utf-8?B?Mm0xK1ZZa3gyR0p6TFB5cVVLaWlTTDVQNmlUdldTbGdHRXNDdzNWaUo4bFRD?=
 =?utf-8?B?T2JMOHBwbUlRU2M3SmNqcC9xQnRpamR4Y1VWNU5KWjBTdDNGT0Fpam9NTFRI?=
 =?utf-8?Q?4vQytKCG?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a034e3-9ee6-44fb-3e8c-08d8c36ff4b3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 09:34:48.9030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3OlKK1a1x4jgFA07YEBVeZNFvKawSaCIEAO5qNU3ACI39CNSxlqJTvpXBkTOe6HHpYfXBGzAh6VPi1xcgtiNUAJsFHuuseipgwc97bafqx4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4689
Received-SPF: pass client-ip=40.107.6.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
Cc: qemu-block@nongnu.org, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

27.01.2021 21:38, Kevin Wolf wrote:
> Am 27.11.2020 um 15:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Rewrite bdrv_check_perm(), bdrv_abort_perm_update() and bdrv_set_perm()
>> to update nodes in topological sort order instead of simple DFS. With
>> topologically sorted nodes, we update a node only when all its parents
>> already updated. With DFS it's not so.
>>
>> Consider the following example:
>>
>>      A -+
>>      |  |
>>      |  v
>>      |  B
>>      |  |
>>      v  |
>>      C<-+
>>
>> A is parent for B and C, B is parent for C.
>>
>> Obviously, to update permissions, we should go in order A B C, so, when
>> we update C, all parent permissions already updated.
> 
> I wondered for a moment why this order is obvious. Taking a permission
> on A may mean that we need to take the permisson on C, too.
> 
> The answer is (or so I think) that the whole operation is atomic so the
> half-updated state will never be visible to a caller, but this is about
> calculating the right permissions. Permissions a node needs on its
> children may depend on what its parents requested, but parent
> permissions never depend on what children request.
> 

yes, that's about these relations

> 
>> But with current
>> approach (simple recursion) we can update in sequence A C B C (C is
>> updated twice). On first update of C, we consider old B permissions, so
>> doing wrong thing. If it succeed, all is OK, on second C update we will
>> finish with correct graph. But if the wrong thing failed, we break the
>> whole process for no reason (it's possible that updated B permission
>> will be less strict, but we will never check it).
>>
>> Also new approach gives a way to simultaneously and correctly update
>> several nodes, we just need to run bdrv_topological_dfs() several times
>> to add all nodes and their subtrees into one topologically sorted list
>> (next patch will update bdrv_replace_node() in this manner).
>>
>> Test test_parallel_perm_update() is now passing, so move it out of
>> debugging "if".
>>
>> We also need to support ignore_children in
>> bdrv_check_parents_compliance().
>>
>> For test 283 order of parents compliance check is changed.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block.c                     | 103 +++++++++++++++++++++++++++++-------
>>   tests/test-bdrv-graph-mod.c |   4 +-
>>   tests/qemu-iotests/283.out  |   2 +-
>>   3 files changed, 86 insertions(+), 23 deletions(-)
>>
>> diff --git a/block.c b/block.c
>> index 92bfcbedc9..81ccf51605 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -1994,7 +1994,9 @@ static bool bdrv_a_allow_b(BdrvChild *a, BdrvChild *b, Error **errp)
>>       return false;
>>   }
>>   
>> -static bool bdrv_check_parents_compliance(BlockDriverState *bs, Error **errp)
>> +static bool bdrv_check_parents_compliance(BlockDriverState *bs,
>> +                                          GSList *ignore_children,
>> +                                          Error **errp)
>>   {
>>       BdrvChild *a, *b;
>>   
>> @@ -2005,7 +2007,9 @@ static bool bdrv_check_parents_compliance(BlockDriverState *bs, Error **errp)
>>        */
>>       QLIST_FOREACH(a, &bs->parents, next_parent) {
>>           QLIST_FOREACH(b, &bs->parents, next_parent) {
>> -            if (a == b) {
>> +            if (a == b || g_slist_find(ignore_children, a) ||
>> +                g_slist_find(ignore_children, b))
> 
> 'a' should be checked in the outer loop, no reason to repeat the same
> check all the time in the inner loop.
> 
>> +            {
>>                   continue;
>>               }
>>   
>> @@ -2034,6 +2038,29 @@ static void bdrv_child_perm(BlockDriverState *bs, BlockDriverState *child_bs,
>>       }
>>   }
>>   
>> +static GSList *bdrv_topological_dfs(GSList *list, GHashTable *found,
>> +                                    BlockDriverState *bs)
> 
> It would be good to have a comment that explains the details of the
> contract.
> 
> In particular, this seems to require that @list is already topologically
> sorted, and it's complete in the sense that if a node is in the list,
> all of its children are in the list, too.

Right, will add

> 
>> +{
>> +    BdrvChild *child;
>> +    g_autoptr(GHashTable) local_found = NULL;
>> +
>> +    if (!found) {
>> +        assert(!list);
>> +        found = local_found = g_hash_table_new(NULL, NULL);
>> +    }
>> +
>> +    if (g_hash_table_contains(found, bs)) {
>> +        return list;
>> +    }
>> +    g_hash_table_add(found, bs);
>> +
>> +    QLIST_FOREACH(child, &bs->children, next) {
>> +        list = bdrv_topological_dfs(list, found, child->bs);
>> +    }
>> +
>> +    return g_slist_prepend(list, bs);
>> +}
>> +
>>   static void bdrv_child_set_perm_commit(void *opaque)
>>   {
>>       BdrvChild *c = opaque;
>> @@ -2098,10 +2125,10 @@ static void bdrv_child_set_perm_safe(BdrvChild *c, uint64_t perm,
>>    * A call to this function must always be followed by a call to bdrv_set_perm()
>>    * or bdrv_abort_perm_update().
>>    */
> 
> One big source of confusion for me when trying to understand this was
> that bdrv_check_perm() is a misnomer since commit f962e96150e and the
> above comment isn't really accurate any more.
> 
> The function doesn't only check the validity of the new permissions in
> advance to actually making the change, but it already updates the
> permissions of all child nodes (however not of its root node).
> 
> So we have gone from the original check/set/abort model (which the
> function names still suggest) to a prepare/commit/rollback model.
> 
> I think some comment updates are in order, and possibly we should rename
> some functions, too.
> 

In the end of the series they are refactored and renamed to be native part of new transaction system (introduced in [10])

>> -static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
>> -                           uint64_t cumulative_perms,
>> -                           uint64_t cumulative_shared_perms,
>> -                           GSList *ignore_children, Error **errp)
>> +static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
>> +                                uint64_t cumulative_perms,
>> +                                uint64_t cumulative_shared_perms,
>> +                                GSList *ignore_children, Error **errp)
>>   {
>>       BlockDriver *drv = bs->drv;
>>       BdrvChild *c;
>> @@ -2166,21 +2193,43 @@ static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
>>       /* Check all children */
>>       QLIST_FOREACH(c, &bs->children, next) {
>>           uint64_t cur_perm, cur_shared;
>> -        GSList *cur_ignore_children;
>>   
>>           bdrv_child_perm(bs, c->bs, c, c->role, q,
>>                           cumulative_perms, cumulative_shared_perms,
>>                           &cur_perm, &cur_shared);
>> +        bdrv_child_set_perm_safe(c, cur_perm, cur_shared, NULL);
> 
> This "added" line is actually old code. What is removed here is the
> recursive call of bdrv_check_update_perm(). This is what the code below
> will have to replace.

yes, we'll use explicit loop instead of recursion

> 
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
>> +                           uint64_t cumulative_perms,
>> +                           uint64_t cumulative_shared_perms,
>> +                           GSList *ignore_children, Error **errp)
>> +{
>> +    int ret;
>> +    BlockDriverState *root = bs;
>> +    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, root);
>> +
>> +    for ( ; list; list = list->next) {
>> +        bs = list->data;
>> +
>> +        if (bs != root) {
>> +            if (!bdrv_check_parents_compliance(bs, ignore_children, errp)) {
>> +                return -EINVAL;
>> +            }
> 
> At this point bs still had the old permissions, but we don't access
> them. As we're going in topological order, the parents have already been
> updated if they were a child covered in bdrv_node_check_perm(), so we're
> checking the relevant values. Good.
> 
> What about the root node? If I understand correctly, the parents of the
> root nodes wouldn't have been checked in the old code. In the new state,
> the parent BdrvChild already has to contain the new permission.
> 
> In bdrv_refresh_perms(), we already check parent conflicts, so no change
> for all callers going through it. Good.
> 
> bdrv_reopen_multiple() is less obvious. It passes permissions from the
> BDRVReopenState, without applying the permissions first.

It will be changed in the series

> Do we check the
> old parent permissions instead of the new state here?

We use given (new) cumulative permissions for bs, and recalculate permissions for bs subtree.

It follows old behavior. The only thing is changed that pre-patch we do DFS recursion starting from bs (and probably visit some nodes several times), after-patch we first do topological sort of bs subtree and go through the list. The order of nodes is better and we visit each node once.

> 
>> +            bdrv_get_cumulative_perm(bs, &cumulative_perms,
>> +                                     &cumulative_shared_perms);
>> +        }
>>   
>> -        cur_ignore_children = g_slist_prepend(g_slist_copy(ignore_children), c);
>> -        ret = bdrv_check_update_perm(c->bs, q, cur_perm, cur_shared,
>> -                                     cur_ignore_children, errp);
>> -        g_slist_free(cur_ignore_children);
>> +        ret = bdrv_node_check_perm(bs, q, cumulative_perms,
>> +                                   cumulative_shared_perms,
>> +                                   ignore_children, errp);
> 
> We use the original ignore_children for every node in the sorted list.
> The old code extends it with all nodes in the path to each node.
> 
> For the bdrv_check_update_perm() call that is now replaced with
> bdrv_check_parents_compliance(), I think this was necessary because
> bdrv_check_update_perm() always assumes adding a new edge, so if you
> update one instead of adding it, you have to ignore it so that it can't
> conflict with itself. This isn't necessary any more now because we just
> update and then check for consistency.
> 
> For passing to bdrv_node_check_perm() it doesn't make a difference
> anyway because the parameter is now unused (and should probably be
> removed).

ignore_children will be dropped in [27]. For now it is still needed for bdrv_replace_node_common

> 
>>           if (ret < 0) {
>>               return ret;
>>           }
>> -
>> -        bdrv_child_set_perm_safe(c, cur_perm, cur_shared, NULL);
>>       }
>>   
>>       return 0;
> 
> A tricky patch to understand, but I think it's right for the most part.
> 
> Kevin
> 


-- 
Best regards,
Vladimir

