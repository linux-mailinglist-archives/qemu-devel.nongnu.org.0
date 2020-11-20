Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DA22BAFC6
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:17:08 +0100 (CET)
Received: from localhost ([::1]:54444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg95u-00036R-GR
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:17:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kg94A-00022Z-CO
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:15:18 -0500
Received: from mail-eopbgr70122.outbound.protection.outlook.com
 ([40.107.7.122]:24760 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kg946-0004Rq-A2
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:15:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b7sqicKOl+6oJlaR9FO+mZau4gjf+/3V3W/KCLylF1Iwmv9lTw8a61uQwhj0lIkwV3yDXwxNYwclk+qpo2xK9AQgF66F/95zur5corndJKaesTYUWIUGQ4fnCbfjl1W0B0KmFiXr0o9zT+NBEH34uPJDl/ZLOlkum6sRfxCVrmtZSxG3Cqvj+w+TwvORCK3fcCreRBAd193t5nOuGn/Q3LrXGzT4NzAYXL4ek3HdX6TPsurhTXdOHM8DJQCDSO7OIAS/UDFuIfkdazBd6yEtDF8SEbWxGKCGh60qgfH6fJvQ8WUvq84tymvDv488jJqbRb0IyHd9WNHo6xjJGrlONA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvVC/JIWsfxVaiTQ+0tXtAcKNXueb6zdfLdStPI1UvE=;
 b=ko7DDkeBh/ASpK4ZUabfJ2dvyMKiEAjB2iqGLjzPxNyDZSACrjJmVpBRmMcubEtbydD5YuFOBs5I6c8ulFKdKUPNfUxnQwqXuQgLwAaDuUYOrutdeOtx4cUvhLHKphxX0yiaV0vWKNYlHTSWECchvJqROV017/QXTQsy1PLTnqoOhopsxRLDql+JLc2IFlQdaCf2t324FqoiZLfuLqo/t8tdARMaSBVE+42N1fXaw6fUxWUGIkS7J5Kl9cAs3RsFzddT7LDhd7ogNyy4pzn42ASOvDiSxC40ZIoCpXV427LfeOoL1rHXQW2pCWUfdg4hky8HKueez/ZLqFu5ljCAZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvVC/JIWsfxVaiTQ+0tXtAcKNXueb6zdfLdStPI1UvE=;
 b=Caz0Cy5LR+6nuC5Y6xCp/F9r6X9aj3V7Bf1OEsNX55oVUATfDmMKQ9U09E4nousDjbCPo57frosoPzH3L+SZ8txp1SeLmgcVq7H21gEVB+ZyM5npVcSkHPbHtImPEKDbkYS4MOBW0SOeQQf/ho4cTgJxUcJWIeFeYPTPaSFIBcs=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VI1PR08MB4351.eurprd08.prod.outlook.com
 (2603:10a6:803:fd::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.24; Fri, 20 Nov
 2020 16:15:09 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543%7]) with mapi id 15.20.3589.020; Fri, 20 Nov 2020
 16:15:09 +0000
Subject: Re: [PATCH v3 3/7] support UFFD write fault processing in
 ram_save_iterate()
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20201119125940.20017-1-andrey.gruzdev@virtuozzo.com>
 <20201119125940.20017-4-andrey.gruzdev@virtuozzo.com>
 <20201119182516.GB6538@xz-x1>
 <1e35a550-a6a0-fbe2-ac8d-6844ce23b3fb@virtuozzo.com>
 <20201120150703.GE32525@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <2797b4b6-b083-750f-385b-f0aa09730251@virtuozzo.com>
Date: Fri, 20 Nov 2020 19:15:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201120150703.GE32525@xz-x1>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM0PR04CA0141.eurprd04.prod.outlook.com
 (2603:10a6:208:55::46) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM0PR04CA0141.eurprd04.prod.outlook.com (2603:10a6:208:55::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Fri, 20 Nov 2020 16:15:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85932cde-051f-44e8-f01b-08d88d6f73b0
X-MS-TrafficTypeDiagnostic: VI1PR08MB4351:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB4351396F1868A5E6C1B0F8E89FFF0@VI1PR08MB4351.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7eYf3rJuLfwl1pSBI9IoWUtuCS6MG6ImbqoJaDxbftFTpq2BC+MtDCWVC7EqK+PFCQ10zPnpF2WMozaN/dHtz+6QS7Y57tUnWWJdiXrQDbuAInswYsmscrJTkMuSFuDPNx1fzN+ZnFRRfdyuSoOabGd6JASAFgaNASBC8mucoSM5GROd5iqWmOs/bFifGFg/Y9kMJ/p8YaUOM7Ppr1HIKq/T4VE3WTotXs5IwGl3TXZrwcN2wbn7eAPSS/Qwu+7Tk8cOuwG3C7miTBA0v9VGMYTGjjjVYKHRfX9k+BGLf9kglDSFdtnx1Q2rEW0TKHVZab/zmBcxJjO6RHERtlSp3sPTh5LgpdLW1YGRsqWmDXQuY/QD1ZLZgAUEkoqwuweb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39840400004)(366004)(376002)(136003)(36756003)(2906002)(956004)(16526019)(2616005)(66476007)(66946007)(186003)(66556008)(5660300002)(86362001)(4326008)(31696002)(44832011)(31686004)(83380400001)(6916009)(6486002)(52116002)(316002)(54906003)(16576012)(26005)(53546011)(8936002)(478600001)(8676002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: bbpFRcekBoJybpGU6cZ65fEvnKMWjvPNZAESsrnJDBXiULJPwLuwshhDO1m3wFIemZx/8t/JyAz85Ghv2uvHfh0CuNXJUcGNjZo9Grgwqxb8CpOdCgChx6dpDoFx6poolQdktBvJThNBDklVniFku0ED/GLizQLEXmfHArqN7R2tUrH1ovxkzI8w5Wa7pJK9mVH5y34IxET0RSfJ7riQxnow9iJqGUHR1t38iTlKcPK3B/Oaw6LOGRA+2nf+hAajXz+n+SS0Dronhn7Sm+SOY6pSIEEcY4FMK6PfT5K/q3htWhGjqsfwNmXJfJMvy7eKwDOzTuYXUwjqYFEcBZXdHmhnA3hYP2v6lgqNQbHeWEimt5OhBOE9tz2eugbJySkRjnA/Xe4/VAFNkRv+3wazj2lD8NeiX59Jv+hLPoGBwAwjivuquBL7TD6DGUMBQ31wXp0foESbtnZhdosLv/nCRHp8iNFnnQRfJNj49Gbr4aZtWhOck9sbB845g6CNtYIwPAvKxIKFo5z8qH5zhVx0kocAypn3B+sdGOlPbmEk8Pbwt4bylDlyQcb2GLDAYV22Js6bgRA8OXvVASNhRORlCVtI40OnHNOHGO9GVSmpr+BlkdOB1dBcZYJtV+hFe8tEtEBxMnzt7bcN2rIZHpPl71jp21gsYBLYfQtuASQkdroYHXcdfVnNFhWgQShnb6Y5kg7spLJFtmas1kFvUwm7l+gqVDeZvJn2lAq9dix8pEN/OvOOeFI83P6qt3sgkUvRCET4dCt6bpS1bmQ4rAsj0UFnZe1v6rVimwwaJKp8eVBARCBn5sM9ZLHGmp3Cyt6YCQumbQRslIIjGwIUwLMvLGya1Wj0SwdY1iWebfpzccCH/dbAMLNVAa+1ZpJT/CxO6dZ227rlhjJKGd7nOQa9NA==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85932cde-051f-44e8-f01b-08d88d6f73b0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 16:15:09.6266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O4280Gt0yJPzgNsmE+6PwzUtpgNqp6tIIfBi9Lb0nbxaa+ESUJg/LNuyd+Rse5FoSxrScCfB3iNvjV4VPe6HfyyYtuYkkEzJ77mSdDQaR8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4351
Received-SPF: pass client-ip=40.107.7.122;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URG_BIZ=0.573 autolearn=no autolearn_force=no
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

On 20.11.2020 18:07, Peter Xu wrote:
> On Fri, Nov 20, 2020 at 01:44:53PM +0300, Andrey Gruzdev wrote:
>> On 19.11.2020 21:25, Peter Xu wrote:
>>> On Thu, Nov 19, 2020 at 03:59:36PM +0300, Andrey Gruzdev via wrote:
>>>
>>> [...]
>>>
>>>> +/**
>>>> + * ram_find_block_by_host_address: find RAM block containing host page
>>>> + *
>>>> + * Returns true if RAM block is found and pss->block/page are
>>>> + * pointing to the given host page, false in case of an error
>>>> + *
>>>> + * @rs: current RAM state
>>>> + * @pss: page-search-status structure
>>>> + */
>>>> +static bool ram_find_block_by_host_address(RAMState *rs, PageSearchStatus *pss,
>>>> +        hwaddr page_address)
>>>> +{
>>>> +    bool found = false;
>>>> +
>>>> +    pss->block = rs->last_seen_block;
>>>> +    do {
>>>> +        if (page_address >= (hwaddr) pss->block->host &&
>>>> +            (page_address + TARGET_PAGE_SIZE) <=
>>>> +                    ((hwaddr) pss->block->host + pss->block->used_length)) {
>>>> +            pss->page = (unsigned long)
>>>> +                    ((page_address - (hwaddr) pss->block->host) >> TARGET_PAGE_BITS);
>>>> +            found = true;
>>>> +            break;
>>>> +        }
>>>> +
>>>> +        pss->block = QLIST_NEXT_RCU(pss->block, next);
>>>> +        if (!pss->block) {
>>>> +            /* Hit the end of the list */
>>>> +            pss->block = QLIST_FIRST_RCU(&ram_list.blocks);
>>>> +        }
>>>> +    } while (pss->block != rs->last_seen_block);
>>>> +
>>>> +    rs->last_seen_block = pss->block;
>>>> +    /*
>>>> +     * Since we are in the same loop with ram_find_and_save_block(),
>>>> +     * need to reset pss->complete_round after switching to
>>>> +     * other block/page in pss.
>>>> +     */
>>>> +    pss->complete_round = false;
>>>> +
>>>> +    return found;
>>>> +}
>>>
>>> I forgot whether Denis and I have discussed this, but I'll try anyways... do
>>> you think we can avoid touching PageSearchStatus at all?
>>>
>>> PageSearchStatus is used to track a single migration iteration for precopy, so
>>> that we scan from the 1st ramblock until the last one.  Then we finish one
>>> iteration.
>>>
>>
>> Yes, my first idea also was to separate normal iteration from write-fault
>> page source completely and leave pss for normal scan.. But, the other idea
>> is to keep some locality in respect to last write fault. I mean it seems to
>> be more optimal to re-start normal scan on the page that is next to faulting
>> one. In this case we can save and un-protect
>> the neighborhood faster and prevent many write faults.
> 
> Yeah locality sounds reasonable, and you just reminded me the fact that
> postcopy has that already I think. :) Just see get_queued_page():
> 
>      if (block) {
>          /*
>           * As soon as we start servicing pages out of order, then we have
>           * to kill the bulk stage, since the bulk stage assumes
>           * in (migration_bitmap_find_and_reset_dirty) that every page is
>           * dirty, that's no longer true.
>           */
>          rs->ram_bulk_stage = false;
> 
>          /*
>           * We want the background search to continue from the queued page
>           * since the guest is likely to want other pages near to the page
>           * it just requested.
>           */
>          pss->block = block;
>          pss->page = offset >> TARGET_PAGE_BITS;
> 
>          /*
>           * This unqueued page would break the "one round" check, even is
>           * really rare.
>           */
>          pss->complete_round = false;
>      }
> 
> So as long as we queue the pages onto the src_page_requests queue, it'll take
> care of write locality already, iiuc.
> 
>>
>>> Snapshot is really something, imho, that can easily leverage this structure
>>> without touching it - basically we want to do two things:
>>>
>>>     - Do the 1st iteration of precopy (when ram_bulk_stage==true), and do that
>>>       only.  We never need the 2nd, 3rd, ... iterations because we're snapshoting.
>>>
>>>     - Leverage the postcopy queue mechanism so that when some page got written,
>>>       queue that page.  We should have this queue higher priority than the
>>>       precopy scanning mentioned above.
>>>
>>> As long as we follow above rules, then after the above 1st round precopy, we're
>>> simply done...  If that works, the whole logic of precopy and PageSearchStatus
>>> does not need to be touched, iiuc.
>>>
>>> [...]
>>>
>>
>> It's quite good alternative and I thought about using postcopy page queue,
>> but this implementation won't consider the locality of writes..
>>
>> What do you think?
> 
> So now I think "Do the 1st iteration of precopy only" idea won't work, but
> still please consider whether it's natural to just reuse postcopy's queue
> mechanism.  IOW, to see whether we can avoid major of the pss logic changes in
> this patch.
> 
> Thanks,
> 

Yeah, I think we can re-use the postcopy queue code for faulting pages. 
I'm worring a little about some additional overhead dealing with urgent 
request semaphore. Also, the code won't change a lot, something like:

[...]
         /* In case of 'write-tracking' migration we first try
          * to poll UFFD and sse if we have write page fault event */
         poll_fault_page(rs);

         again = true;
         found = get_queued_page(rs, &pss);

         if (!found) {
             /* priority queue empty, so just search for something dirty */
             found = find_dirty_block(rs, &pss, &again);
         }
[...]

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

