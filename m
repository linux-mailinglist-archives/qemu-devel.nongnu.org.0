Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EBE544F95
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 16:39:04 +0200 (CEST)
Received: from localhost ([::1]:45602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzJJP-00035q-8n
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 10:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1nzHuV-0001BK-Sp; Thu, 09 Jun 2022 09:09:16 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:35424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1nzHuQ-0006vG-CC; Thu, 09 Jun 2022 09:09:14 -0400
Received: from sas2-6a1db1376cb6.qloud-c.yandex.net
 (sas2-6a1db1376cb6.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bb0f:0:640:6a1d:b137])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 809792E123E;
 Thu,  9 Jun 2022 16:08:59 +0300 (MSK)
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net [2a02:6b8:c08:bd1e:0:640:7470:3316])
 by sas2-6a1db1376cb6.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 kS1vvi3HvB-8wKa8nHE; Thu, 09 Jun 2022 16:08:59 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1654780139; bh=Cbkz4eVecPuqhTNAVrHB2x9n1US3l8pj8zhNHB+sosU=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=t0MDPNxnKnTS6YJhpzyRxdgOXlw3i/dFUVvkWeeAAjL2ikl6Up3yKUoFwxCe+Kwmf
 C6ip9Cjc5obDsU0M5L4D3XPy+ErucBrCkHrzpzT4E5SwBpu+zHcBAxHs2DSxvnnzGw
 Z+xX/Np3NDm4h/frWeHIRrE3hHqMOGAvFA4q08rM=
Authentication-Results: sas2-6a1db1376cb6.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [172.31.114.224] (172.31.114.224-vpn.dhcp.yndx.net
 [172.31.114.224])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 eTEAByRLES-8wM0ogLn; Thu, 09 Jun 2022 16:08:58 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <d2a595ad-a06c-d48a-d691-a1fd94510444@yandex-team.ru>
Date: Thu, 9 Jun 2022 16:08:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v5 04/45] test-bdrv-graph-mod: update
 test_parallel_perm_update test case
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru
References: <20220330212902.590099-1-vsementsov@openvz.org>
 <20220330212902.590099-5-vsementsov@openvz.org>
 <bbe8b25e-d72a-fb01-2b8a-7edfb4e587cf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <bbe8b25e-d72a-fb01-2b8a-7edfb4e587cf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On 6/7/22 13:53, Hanna Reitz wrote:
> On 30.03.22 23:28, Vladimir Sementsov-Ogievskiy wrote:
>> test_parallel_perm_update() does two things that we are going to
>> restrict in the near future:
>>
>> 1. It updates bs->file field by hand. bs->file will be managed
>>     automatically by generic code (together with bs->children list).
>>
>>     Let's better refactor our "tricky" bds to have own state where one
>>     of children is linked as "selected".
>>     This also looks less "tricky", so avoid using this word.
>>
>> 2. It create FILTERED children that are not PRIMARY. Except for tests
>>     all FILTERED children in the Qemu block layer are always PRIMARY as
>>     well.  We are going to formalize this rule, so let's better use DATA
>>     children here.
> 
> Another thing is that any node may have at most one FILTERED child at a time, which was already formalized in BDRV_CHILD_FILTERED’s description.

Right, will add

> 
>> While being here, update the picture to better correspond to the test
>> code.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
>> ---
> 
> The change looks good, I’m just a bit confused when it comes to the comment describing what’s going on.
> 
>>   tests/unit/test-bdrv-graph-mod.c | 70 ++++++++++++++++++++------------
>>   1 file changed, 44 insertions(+), 26 deletions(-)
>>
>> diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
>> index a6e3bb79be..40795d3c04 100644
>> --- a/tests/unit/test-bdrv-graph-mod.c
>> +++ b/tests/unit/test-bdrv-graph-mod.c
> 
> [...]
> 
>> @@ -266,15 +280,18 @@ static BlockDriver bdrv_write_to_file = {
>>    * The following test shows that topological-sort order is required for
>>    * permission update, simple DFS is not enough.
>>    *
>> - * Consider the block driver which has two filter children: one active
>> - * with exclusive write access and one inactive with no specific
>> - * permissions.
>> + * Consider the block driver (write-to-selected) which has two children: one is
>> + * selected so we have exclusive write access to it and for the other one we
>> + * don't need any specific permissions.
>>    *
>>    * And, these two children has a common base child, like this:
>> + *   (additional "top" on top is used in test just because the only public
>> + *    function to update permission should get a specific child to update.
>> + *    Making bdrv_refresh_perms() public just for this test doesn't worth it)
> 
> s/doesn't/isn't/
> 
>>    *
>> - * ┌─────┐     ┌──────┐
>> - * │ fl2 │ ◀── │ top  │
>> - * └─────┘     └──────┘
>> + * ┌─────┐     ┌───────────────────┐     ┌─────┐
>> + * │ fl2 │ ◀── │ write-to-selected │ ◀── │ top │
>> + * └─────┘     └───────────────────┘     └─────┘
>>    *   │           │
>>    *   │           │ w
>>    *   │           ▼
>> @@ -290,7 +307,7 @@ static BlockDriver bdrv_write_to_file = {
>>    *
>>    * So, exclusive write is propagated.
>>    *
>> - * Assume, we want to make fl2 active instead of fl1.
>> + * Assume, we want to select fl2  instead of fl1.
> 
> There’s a double space after “fl2”.
> 
>>    * So, we set some option for top driver and do permission update.
> 
> Here and in the rest of the comment, it’s now unclear what node “top” refers to.  I think it’s still the now-renamed “write-to-selected” node, right?  But “top” is now a different node, so I’m not 100% sure.

Right, will fix.

> 
> (On the other hand, even before this patch, there was a “top” node that was distinct from the former “tricky” node...  So it seems like this comment was already not quite right before?)

Hmm yes. Obviously I tried to make this more obvious, but didn't update the whole comment.

> 
>>    *
>>    * With simple DFS, if permission update goes first through
> 
> 


-- 
Best regards,
Vladimir

