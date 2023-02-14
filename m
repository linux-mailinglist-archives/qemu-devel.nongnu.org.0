Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC31696795
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 16:05:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRwrD-0005mR-Cq; Tue, 14 Feb 2023 10:04:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRwr6-0005lF-OU; Tue, 14 Feb 2023 10:04:29 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRwr2-00015o-18; Tue, 14 Feb 2023 10:04:26 -0500
Received: from myt5-8800bd68420f.qloud-c.yandex.net
 (myt5-8800bd68420f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:4615:0:640:8800:bd68])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 1F4445FE3B;
 Tue, 14 Feb 2023 18:04:06 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b433::1:3c] (unknown
 [2a02:6b8:b081:b433::1:3c])
 by myt5-8800bd68420f.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 44lAe00RZa61-2QFEjNb3; Tue, 14 Feb 2023 18:04:05 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676387045; bh=9Mn3hqBygFZXjFY2pSm3YRURullLbV2fk6NCPLzJFZY=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=aiaP2oFkaM6TLdfh2j/m+yyqdJkE4fz3urEESphSJS3jJqgzetFTf8z8AwXtP+HaN
 jooPEpJZek96nKh/TKmzcNm5L5tmCllnxEFKhKEgsRRT2I0HpAqycB+oLDXa5aninv
 oVdrZ1SBi45FMfQTVL+FaxsQlZBOigjui50Fw8cY=
Authentication-Results: myt5-8800bd68420f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <3a3f4598-e7fc-0f22-51f9-029ce372af14@yandex-team.ru>
Date: Tue, 14 Feb 2023 18:04:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/3] migration: In case of postcopy, the memory ends in
 res_postcopy_only
Content-Language: en-US
To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-block@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, qemu-s390x@nongnu.org,
 John Snow <jsnow@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230208135719.17864-1-quintela@redhat.com>
 <20230208135719.17864-2-quintela@redhat.com>
 <61c84841-7018-edb2-806b-921e2065f940@yandex-team.ru>
 <87mt5m3e2d.fsf@secure.mitica>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <87mt5m3e2d.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 09.02.23 21:10, Juan Quintela wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
>> On 08.02.23 16:57, Juan Quintela wrote:
>>> So remove last assignation of res_compatible.
>>
>> I hoped for some description when asked to split it out :)
>>
>>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>>> ---
>>>    migration/ram.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>> diff --git a/migration/ram.c b/migration/ram.c
>>> index b966e148c2..85ccbf88ad 100644
>>> --- a/migration/ram.c
>>> +++ b/migration/ram.c
>>> @@ -3474,7 +3474,7 @@ static void ram_state_pending_exact(void *opaque,
>>>          if (migrate_postcopy_ram()) {
>>>            /* We can do postcopy, and all the data is postcopiable */
>>> -        *res_compatible += remaining_size;
>>> +        *res_postcopy_only += remaining_size;
>>
>> Actually, these "remaining_size" bytes are still compatible, i.e. we
>> can migrate these pending bytes in pre-copy, and we actually do it,
>> until user call migrate-start-postcopy, yes? But we exploit the fact
>> that, this change don't affect any logic, just name becomes
>> wrong.. Yes? Or I don't follow:/
> 
> My definition of the fields is: how are we going to transfer that bytes.
> 
> if they are on res_precopy_only, we transfer them with precopy, if they
> are on res_postocpy_only, we transfer them with postcopy.
> 
> So, the rest of RAM, if we are in postcopy, we sent it with postcopy,
> and if we are in precopy, we sent them with precopy.  See the whole
> code.  This is the _estimate function.
> 
>      uint64_t remaining_size = rs->migration_dirty_pages * TARGET_PAGE_SIZE;
> 
>      if (migrate_postcopy_ram()) {
>          /* We can do postcopy, and all the data is postcopiable */
>          *res_postcopy_only += remaining_size;
>      } else {
>          *res_precopy_only += remaining_size;
>      }
> 
> After the change, _exact does exactly the same.
> 
> The caller (migration_iteration_run()) does this (I remove traces and
> things that don't matter for this). This is before the change.
> Remember: in precopy, we add res_compat to pend_pre, and in postcopy to
> pend_post.
> 
>      uint64_t pending_size = pend_pre + pend_compat + pend_post;
> 
> ### pending_size is the sum of the three, so it doesn't matter.
> 
>      if (pend_pre + pend_compat <= s->threshold_size) {
> 
> ###  In precopy, we add pend_compat to pend_pre, so we are ok.
> ###  In postcopy, we add the data to pend_postcopy, but that is right,
> ###  because to calculate the downtime, we only care about what we have
> ###  to transfer with precopy, in particular, we aren't going to send
> ###  more ram, so it is ok that it is in pend_post.
> 
>          qemu_savevm_state_pending_exact(&pend_pre, &pend_compat, &pend_post);
>          pending_size = pend_pre + pend_compat + pend_post;
>      }
> 
>      if (!pending_size || pending_size < s->threshold_size) {
>          migration_completion(s);
>          return MIG_ITERATE_BREAK;
>      }
> 
>      /* Still a significant amount to transfer */
>      if (!in_postcopy && pend_pre <= s->threshold_size &&
>          qatomic_read(&s->start_postcopy)) {
> 
> #### this is what I mean.  See how we only use pend_pre to decide if we
> ###  are entering postcopy.
> 
>          if (postcopy_start(s)) {
>              error_report("%s: postcopy failed to start", __func__);
>          }
>          return MIG_ITERATE_SKIP;
>      }
> 
> So the only "behaviour" that we can say are having is that with the

actualy, this one was already "changed", as _estimate never return compat other than zero.

So, The patch really changes nothing

> change we are a little bit more aggressive on calling
> qemu_savevm_state_pending_exact(), but I will arguee that the new
> behaviour is the right one.
> 
> What do you think?
> 


I think, that the order of logic and documentation changing since introducing _estimate is a bit confused.

But I agree now, that we are safe to unite old compat and old postcopy_only into one variable, as we want only

1. the total sum, to probably go to migration_completion()
2. pend_pre to probably go to postcopy_start()

So, patch is OK, and seems it changes absolutely nothing in logic. Thanks for explanations!


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir


