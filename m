Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7615530ED26
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 08:18:40 +0100 (CET)
Received: from localhost ([::1]:53748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7YuV-0000rc-2u
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 02:18:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7YsS-0000EU-5o; Thu, 04 Feb 2021 02:16:36 -0500
Received: from mail-eopbgr60128.outbound.protection.outlook.com
 ([40.107.6.128]:23165 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7YsK-0003ir-2Y; Thu, 04 Feb 2021 02:16:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aKEssKIwT0Hb9aRcZ47QGj3jYuqAnBrfQ/BqSIOZrfC1b1Y6CEpPw76iMTtFVvYmeLlLsy7R7sjcQYd5wI10QZ0JVDcfOqb0WcPMalXEQbmwqZblEn7UrWXiE5Z4gXw3W6faO5xLvfYfmahX0vmuSldPtW6fV8ZZfPb8IVF1x1tap9h2xkJqXp39cGxe0ostprhPCHcYDghW0CgqdGU5Vbvf6+k9P9pKilhNiuzcQudwglsnWZSNY0nKfOSb6ciX/uD1ew0vSp7uJuySbJRBEKXpld0TGpj596yl3TxaLdtKwsnEaDdteb9hlrqBu4om2p3FsYi7GZxwuNemUzt3tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sd07+9V2ApGJsddl0cfKb4IRFVETPkli65S7Zdu3NY4=;
 b=WU5kx25IrWDKkOCCljAdgXFNlpeVgxjex1FIGOwETXqztUwJVfAseGPz3HzOcSjwLr+8kUTKq8w28C8H2vFCLgHi0Qh9Ku/IMGU4tuVueg1O5toG7eZ6Nibj0QVCdLBNyaOhMXLgYM8tIZPnabrB3WgzIx0VYqryvlHO44gR+QnGuIOXup3FxHH836GpNHhXFIkOCuG3/QtikDvRjhvkqetssfNpBQrlTBlmhyKTZbKI+7Fvalad2tz/gID3UxDPyZ3er6lHK0haeoyWOc2sxYLCZeklJVcr7tv4zsPP9XN6zYiGy8zlo1gEhkJb409c1pPmM7H4W/qRtVODx910TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sd07+9V2ApGJsddl0cfKb4IRFVETPkli65S7Zdu3NY4=;
 b=Wn1vxJDg3Jd+kOW0sOUNRZ+b8X3m9y8yTN4ypS7EMjGvxtEnCL4C09RGJAJFdrqackwTzlhVlaBt+FEI7xtWFRaxj12/hJluTB+1Mssr0Ixyc/XBWkWG8Bab31Dno0gUzEl600gqI3Iw9zuw5WIFntzm679qHvNTCHv4FKyWxRI=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6294.eurprd08.prod.outlook.com (2603:10a6:20b:29a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Thu, 4 Feb
 2021 07:16:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Thu, 4 Feb 2021
 07:16:18 +0000
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
Message-ID: <77dbd9b7-e123-5015-4cac-2c27a89a7c48@virtuozzo.com>
Date: Thu, 4 Feb 2021 10:16:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210203183829.GG5507@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.214]
X-ClientProxiedBy: AM4PR07CA0033.eurprd07.prod.outlook.com
 (2603:10a6:205:1::46) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.214) by
 AM4PR07CA0033.eurprd07.prod.outlook.com (2603:10a6:205:1::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Thu, 4 Feb 2021 07:16:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b03b085-9678-4067-918b-08d8c8dcc431
X-MS-TrafficTypeDiagnostic: AS8PR08MB6294:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB62940866FA17E61EEE0EC947C1B39@AS8PR08MB6294.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iB8qev1bZM3KM3g6prntA29DjrolGN51WtdaYt4u6OuWkZOUQjebCJ8voGlb45bEhMsdvHdDOBEWR7EkT8Dynd/Tl/ZzV/oM6VQVvfH/JmFXXlGmh57HMUROaAWOld48mw7qtp/1KDywLAFs1VIU5kUap9pEg16slmMCbqVim/ctg7iOLRUUK3Z+4Gv7zKtrDR1Duk/nd4epfLqQ9Y25uKR/DOWbybBTKIuQlxR8pyiDnB50jk+aOk51cdHk+z823zpt1Vw+nv0cZqdCRVu00gw3+wwm7nOEtHjUPULSX28NDLUFyNx7Mus31gHS48TmnTmgo7A/1VcAs+A4M8yoeI+ZIcuUZKzdw9ncEcEjWY/rUlmZQpAom6drDBzUaT8P2KXJ9jf0XimfWqVzNxA4I9ogQmBOCU/ykB2dI2803gUdJ+0jEgPHNfg5u5PFx+3X/Czeg5F6Oj3lavqWefpzzS2Cg4S54YqyguBIAsOpU4XzUxiMy85ZCaeSjqZxW/0BxK0IUiGzDZgpZvQHKx+TjGNu9v+5w/d8/31AIngC5aK7v9ZeBk4ViDw6TXuGYSsl2XIbH7/6FAWcfOPXS8RkWdC6guItZQlXfGHJwBX77Us=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(396003)(39840400004)(346002)(5660300002)(8676002)(83380400001)(2616005)(6916009)(8936002)(66946007)(66476007)(16576012)(66556008)(52116002)(316002)(31696002)(36756003)(86362001)(2906002)(15650500001)(107886003)(26005)(186003)(16526019)(478600001)(4326008)(6486002)(31686004)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L1BycVJzUHBiZUxRU2hPUGRoYUtwU1FtYzJsWjcyOStpMk9WdHBaSEJwMUtI?=
 =?utf-8?B?dkRKclNCZ3lieGhmRTkrdEtzTzJQVnZvSTlyZUpvYU4zOUwrbDFtb0lrTjBF?=
 =?utf-8?B?VjJuYnpmdGZLV0haeXVPenIrSkNXTm9DRFY3dk12RnBsaXFwTXh4NTIwMHd0?=
 =?utf-8?B?TTZPRWFCT3N5dWFpSUxEZklSckVPVWNLSlMvdFlGNkFneGFPRzIrTTVRL2Zq?=
 =?utf-8?B?ekl0QWZWNHNVdjF4Q29scnZPWnFLN0dCVmpOYXhzWXpPZzQ2KzFpMU1wNnU1?=
 =?utf-8?B?dm85WDNzdUtpZ3NYMVlxUnNQSGgzQTRDdmhiek9PY01oMkYxZXQ4OXV2R3hL?=
 =?utf-8?B?azNiSkNrZ25oMnRlSUw0RXhvTGVzYUp4YjRXMU1GV2c2aHBGcCtweElYNzNT?=
 =?utf-8?B?emEyYnRsK2ZKQWlOaHNGWFNINUVhWTVEWGpRejBDR2tlaXVRWU05WG1paFNH?=
 =?utf-8?B?aDdrekdnYUg0SUZlb3BCb09iQk01dUZYbFNKbTVGcldsZG5TUlhScGZVbmow?=
 =?utf-8?B?RXQxTkVvSVF6cjFoUHNRUmZ3dnE2bmFRd2VtNkpkS2NUang1cFFDSDhJU2Ns?=
 =?utf-8?B?YkdGNjcrNFVUZzBuUllsN2c0VTRpNFhkdG53c2d2SUIzdlBqOUw3WWUwbnpB?=
 =?utf-8?B?K0pFelVsUzBPaldadW90akgrTkswLzJTcnpwSEhQU3h6bXg3OVVoZmRLMktP?=
 =?utf-8?B?amlYNUZzeGZSTmIzcTRyc3RGd255RHpJbmhTK2NETkNZYkl6bEdvb3lKdEtO?=
 =?utf-8?B?SXAwZGZOSS9QaEhHcTlWZjFXL0VrVk9UL3AzVXkyck0xUXZnVFZBTExMNDlm?=
 =?utf-8?B?a29WM2hXamgzN3NrelVOTWRSQ0Rxc3VRelAyQlVpNmE5M2w3TDlQRzVQTHR3?=
 =?utf-8?B?Z2V6QXhPN292djdKdDg5U0dIOGFyU2tzQTdycXpaVXpOS2lZZUJUNlBOaGww?=
 =?utf-8?B?L3RqcElmbjlDNkdTTUVidjNZQkpYaFYzd1pJMW1ibEs3YzIyWDZ6NnZNWkp1?=
 =?utf-8?B?aW5wN0w1aUJYU3VRUmZMeHV4QVFFZ2RPTlFsbC9JbU9xNzYyWm1KNkwzS3Uz?=
 =?utf-8?B?NTNocW5UcGR1RVhyS3hEZGpSZkRCZjZmVGQ1QmNnN2hBRDRJaWZpbWxZd21D?=
 =?utf-8?B?dlpUT0FLSjRBRVBXYzRvMFJlYk1ieS9GNVVqQTNvTEM5MUdidUpCYW92eERG?=
 =?utf-8?B?empRZjlsTHZ0d2JUcEt2cU1xUVJmTUdQNFhENlBWN3lqS2ZqZWFNNGExN2tQ?=
 =?utf-8?B?dTVCejcvSmhsWEQ4RmFaQ2RVMlZSRFdtemZwUVEyeGVnMUhkSVZNc05FanJW?=
 =?utf-8?B?L1ROMFkydGVteUNydnIrckVYb0FBRTBOOFM4d29MV2FIcUk3RXFsMDg3THFF?=
 =?utf-8?B?d3Rncm0rQ2RxU2J0bnMwT29NRkNpY0YwMUZhcFFwc0NRTVZGaEFFTGlTVEhD?=
 =?utf-8?Q?Ej4P9MOv?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b03b085-9678-4067-918b-08d8c8dcc431
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 07:16:18.6233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XGW5x4piFnrogpLeX/q6LaRwgn5APsIwu1fPlMRnjA5nvo/5Q/n8WIhzuX0/WEJwn+D47mt9a9x7SYeAMHSEyQbS6HGcYayuCN3iH7VxCCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6294
Received-SPF: pass client-ip=40.107.6.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_NONE=-0.0001,
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

Will add

-- 
Best regards,
Vladimir

