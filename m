Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB1E697AE7
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 12:36:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSG5M-0000jJ-0m; Wed, 15 Feb 2023 06:36:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSG5K-0000e1-0s; Wed, 15 Feb 2023 06:36:26 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSG5H-0002Rn-Tr; Wed, 15 Feb 2023 06:36:25 -0500
Received: from myt6-23a5e62c0090.qloud-c.yandex.net
 (myt6-23a5e62c0090.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:1da3:0:640:23a5:e62c])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 25F1A60932;
 Wed, 15 Feb 2023 14:36:09 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:1313::1:34] (unknown
 [2a02:6b8:b081:1313::1:34])
 by myt6-23a5e62c0090.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 8aiw2B0Re8c1-qMybIfyr; Wed, 15 Feb 2023 14:36:08 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676460968; bh=0jGipK9UboGZu5tNMsLC4mn69GDlps8LEX7s6U4fjZ4=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=YXnw5hh6hZrIZPkW/oRTrFAoPdaIxXgZUbyCXdSV2s6x57R6zqRgonORbRdQOtxkW
 K5jSclT6fxiht1Gj6K8FXzzqi8B+ANSEY5otyvI+bSzWo63eM7oKL2jdR/KZ87q79C
 2SzkH1DQEvwyu3+FNvZaAmHE+1gVUyVa1f0ePVi4=
Authentication-Results: myt6-23a5e62c0090.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <8c3d033e-b9dd-35de-e0bf-2d2a643fb162@yandex-team.ru>
Date: Wed, 15 Feb 2023 14:36:07 +0300
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
 <87k00j47p9.fsf@secure.mitica>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <87k00j47p9.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
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

On 15.02.23 12:08, Juan Quintela wrote:
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
> I think of this from this different angle:
> - if we are on precopy, we return on res_precopy everything (and nothing
>    on res_postcopy)
> - if we are on postcopy, we return on res_precopy what we _must_ sent
>    through precopy, and in res_postcopy what we can sent through
>    postcopy.
> 
> i.e. if we stop the guest and do the migration right now, what are we
> going to send through each channel.
> 

I understand.

I've introduced the division into three parts together with block-dirty-bitmap implementation, and it seemed significant to me that block-dirty-bitmap pending is postcopy_only in the sense that it can't be migrated before source stop, unlike RAM. But yes, it turns out that that's not significant for the generic migration algorithm, it works the same way for RAM and block-dirty-bitmap not distinguishing postcopy_only vs comaptible.

Anyway final documentation and new field names that you proposed are clean and correspond to the meaning which you have expected. And it avoids extra variable that I've introduced.

Haha. Looking at my old commit 4799502640e6a29d3 "migration: introduce postcopy-only pending" I see

-                              uint64_t *non_postcopiable_pending,
-                              uint64_t *postcopiable_pending);
+                              uint64_t *res_precopy_only,
+                              uint64_t *res_compatible,
+                              uint64_t *res_postcopy_only);

so, we just rollback my change, which actually was never necessary. And it was called like I've proposed in 03 discussion thread :) Still, must_precopy and can_postcopy are nicer.

-- 
Best regards,
Vladimir


