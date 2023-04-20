Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B1E6E8A36
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 08:13:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppNW6-000371-IT; Thu, 20 Apr 2023 02:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ppNW4-00036l-54
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 02:11:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ppNW0-0001hp-TQ
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 02:11:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681971088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ia9txNBJ56c0uSjGzq3B3KUTv71BpZiY36HxYiMQric=;
 b=TSMdnzd1BpkGyNPWfWUGb4x/gtRUjb7f+7fepMTbEI0xclc2//ZYQHr1lQ0uOMTU3QypXd
 bsYorZMFJ0sCnBZ5gOpsjMxzw/I6nAPmMrhh/2DVtHFP14N9wnEyriUdqoLC8VLv3GNLdn
 tnDxNCyzg4JYMiqGml/uWuQSSMsbezE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-tGE7jBXLPf6j4G41CD2utg-1; Thu, 20 Apr 2023 02:11:25 -0400
X-MC-Unique: tGE7jBXLPf6j4G41CD2utg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C43F788B7A0;
 Thu, 20 Apr 2023 06:11:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 550402166B35;
 Thu, 20 Apr 2023 06:11:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4CF9021E675B; Thu, 20 Apr 2023 08:11:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Fiona Ebner <f.ebner@proxmox.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,  <qemu-block@nongnu.org>,
 michael.roth@amd.com,  Fam Zheng <fam@euphon.net>,  Stefan Hajnoczi
 <stefanha@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Thomas
 Lamprecht <t.lamprecht@proxmox.com>,
 Kevin Wolf <kwolf@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: Re: QMP (without OOB) function running in thread different from the
 main thread as part of aio_poll
References: <2a61b581-5a21-c945-bb98-b6863cac0c1f@proxmox.com>
Date: Thu, 20 Apr 2023 08:11:23 +0200
In-Reply-To: <2a61b581-5a21-c945-bb98-b6863cac0c1f@proxmox.com> (Fiona Ebner's
 message of "Wed, 19 Apr 2023 16:09:43 +0200")
Message-ID: <877cu7gk1g.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Fiona Ebner <f.ebner@proxmox.com> writes:

> Hi,
> while debugging a completely different issue, I was surprised to see
> do_qmp_dispatch_bh being run in a vCPU thread. I was under the
> impression that QMP functions are supposed to be executed in the main
> thread. Is that wrong?
>
> I managed to reproduced the scenario with a build of upstream QEMU
> v8.0.0-rc4 once more (again with GDB open), but it's not a simple
> reproducer and racy. The backtrace is below[0].
>
> My attempt at explaining the situation is:
> 1. In qapi/qmp-dispatch.c, the main thread schedules do_qmp_dispatch_bh,
> because the coroutine context doesn't match.
> 2. The host OS switches to the vCPU thread.
> 3. Something in the vCPU thread triggers aio_poll with the main thread's
> AioContext (in my case, a write to a pflash drive).
> 4. do_qmp_dispatch_bh is executed in the vCPU thread.
>
> Could this be an artifact of running with a debugger?
>
> I CC'ed the maintainers of util/aio-posix.c and qapi/qmp-dispatch.c
> hoping that is not too far off.

Fiona, thanks for reporting this!

The monitor core has become awfully complex.

Instead of trying to explain everything at once, let me recount its
history.  If you're familiar with the monitor, you might want to skip
ahead to "Paolo wrote".

In the beginning, there was just one monitor, and it ran entirely in the
main loop (callback when input is available).  To keep the main loop
going, monitor commands better complete quickly.

Then we got multiple monitors.  Same story, just multiple input streams,
each with a callback.

We also got additional threads.  When I say "main loop", I mean the main
thread's main loop.

"Must complete quickly" means no blocking I/O and such.  Writing code
that way is somewhere between hard and impractical.  Much code called by
monitor commands wasn't written that way.

"Doctor, doctor, running code in the main loop hurts".  Sadly, the
doctor's recommended remedy "don't do that then" is really hard to
apply: a lot of code has been written assuming "running in the main
loop, with the big QEMU lock held".

The first small step towards it was taken to enable the "out-of-band"
feature.  We moved the QMP monitor proper out of the main loop into a
monitor I/O thread.  The monitor commands get funneled to the main loop.
Instead of the main loop calling the monitor when a file descriptor has
input, it now calls the command dispatcher when a funnel queue has a
command.  This is implemented with a bottom half (merge commit
4bdc24fa018, March 2018).

Why bother?  Because now we can execute special "out-of-band" commands
right away, in the I/O thread, regardless of the main loop's state.
Peter Xu wanted this badly enough for postcopy recovery to code it up.
It was hard.  It's not generally useful, as the restriction on what OOB
commands can do are severe.

The next step was the coroutine feature.  Quite a few of the problematic
monitor commands are actually running coroutine-capable code: when
running in coroutine context, the code yields instead of blocking.
Running such commands in monitor context improves things from "blocks
the main loop" to "blocks all monitor commands".

Sadly, code exists that falls apart in coroutine context.  So we had to
make running in coroutine context opt-in.  Right now only two commands
opt in: block_resize and screendump.  Hopefully, we can get to the point
where most or all do.

Until all do, the dispatcher needs to run some commands coroutine
context, and others outside coroutine context.  How?

The QMP command dispatcher runs in a coroutine in the main loop (HMP
works differently, but let's ignore it here).

If the command can be executed in coroutine context, the dispatcher
calls its handler as before.  Right now, we take this path just for
block_resize and screendump.

Else, we create a bottom half that calls the handler, and schedule it to
run in the main loop.  Right now, we take this path for all the other
commands.

This if / else is in qmp_dispatch().  The else is the only way to get
do_qmp_dispatch_bh() to run.  Merge commit b7092cda1b3, October 2020.

Paolo wrote:

    While monitor commands in general start only in the main thread,
    bottom halves can also run (via aio_poll) in the vCPU threads,
    always under the BQL.

Today I learned...

So, splicing in a bottom half unmoored monitor commands from the main
loop.  We weren't aware of that, as our commit messages show.

I guess the commands themselves don't care; all they need is the BQL.

However, did we unwittingly change what can get blocked?  Before,
monitor commands could block only the main thread.  Now they can also
block vCPU threads.  Impact?


