Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7375FDB15
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 15:40:01 +0200 (CEST)
Received: from localhost ([::1]:53532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiyRL-000195-A1
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 09:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oiyGS-0005Fu-9c
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 09:28:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oiyGQ-00052Q-Ph
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 09:28:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665667722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8hrZ9U/C4fvSASZ3tz5f8u32RDr4F0E/I9Z6nvAA5aY=;
 b=DCujpiMy2/34Y7U11wpzElsnCfGg/HLNPBs50DFAuA3++I2IQzh4C7tEdHbhm+/9DCSn5v
 bxPHp0imQ3TCFAAe3R8IQKyc0wsYv6p1ImligfBvlddFRED8vcX/5HL/346y233iPnjNlj
 uPyevyXYC2AzLikUDbSGs6mD57qmZXg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-418-rMepfIICM0mhB2uW6I0ZiA-1; Thu, 13 Oct 2022 09:28:39 -0400
X-MC-Unique: rMepfIICM0mhB2uW6I0ZiA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 898A186F147;
 Thu, 13 Oct 2022 13:28:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4585EC2DF63;
 Thu, 13 Oct 2022 13:28:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4B4E221E691D; Thu, 13 Oct 2022 15:28:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,  kwolf@redhat.com,  qemu-block@nongnu.org
Subject: Re: [PATCH] blkdebug: ignore invalid rules in non-coroutine context
References: <20221013093523.586361-1-pbonzini@redhat.com>
 <87a660yosv.fsf@pond.sub.org>
 <a6e941b0-ce20-916b-7ea1-d575056d8282@redhat.com>
Date: Thu, 13 Oct 2022 15:28:27 +0200
In-Reply-To: <a6e941b0-ce20-916b-7ea1-d575056d8282@redhat.com> (Paolo
 Bonzini's message of "Thu, 13 Oct 2022 15:06:12 +0200")
Message-ID: <878rljyhs4.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 10/13/22 12:56, Markus Armbruster wrote:
>> rule_check() is called from blkdebug_co_preadv(), blkdebug_co_pwritev(),
>> blkdebug_co_pwrite_zeroes(), blkdebug_co_pdiscard(),
>> blkdebug_co_block_status() (all marked coroutine_fn), and
>> blkdebug_co_flush() (which looks like it should be marked coroutine_fn).
>
> Yes (separate patch sent, https://lore.kernel.org/qemu-devel/20221013123711.620631-11-pbonzini@redhat.com/T/#u).
>
>> Ignorant question: how could it be called outside coroutine context?
>
> You're right, only blkdebug_debug_event() can be called outside coroutine context.  I confused process_rule() (called by 
> blkdebug_debug_event(), both inside and outside coroutine context) with rule_check() (called in coroutine context).

Let's drop the rule_check() hunk then.

>> Also, code smell: reporting an error without taking an error path.  But
>> let's worry about that only after I understand the problem you're trying
>> to fix.
>
> Unfortunately there's no way to know in advance if an event will be called inside vs. outside a coroutine.  I can keep the abort() if you 
> think it's preferrable, so what you get is still a crash but with a nicer error message.  Since this is debugging code either solution has 
> pros and cons.

Let's have another look at the remaining patch hunk:

    @@ -858,7 +864,12 @@ static void blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)
         }

         while (actions_count[ACTION_SUSPEND] > 0) {
    -        qemu_coroutine_yield();
    +        if (qemu_in_coroutine()) {
    +            qemu_coroutine_yield();
    +        } else {
    +            error_report("Non-coroutine event %s cannot suspend\n",
    +                         BlkdebugEvent_lookup.array[event]);
    +        }
             actions_count[ACTION_SUSPEND]--;
         }
     }

If I understand this correctly, the user asked us to suspend, but it now
turns out suspend doesn't make sense, so we ignore the request.
Correct?

warn_report()?  info_report()?


