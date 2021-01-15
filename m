Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D612F7C51
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:17:57 +0100 (CET)
Received: from localhost ([::1]:35418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0OzE-0003Q2-Kl
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:17:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l0OsQ-0007vU-G7
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:10:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l0OsJ-0007QP-6C
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:10:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610716245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CL8RO4X7r6eiUgdArjkwU5Nv3d4B1v50KAfdufm1svU=;
 b=AyDZ1Yj7aPUWdklIGgVX+uAIGyNEKNNNUvz5AhGfIXFf2UDsU7r8/+BdLVOa+GCvYVgOCk
 XUFMpaseerVws3fKn7/OOrEKMiQ1M8VAuXOUrHUd1+b9b0G8ozDQOKwAblw3mxomVbzhYK
 5E4NsjzIjX07mNAz14PUytxTbB+ESCI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-3LUCFbC4PcKAy9FOFkSAEw-1; Fri, 15 Jan 2021 08:10:41 -0500
X-MC-Unique: 3LUCFbC4PcKAy9FOFkSAEw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1867680A5CE;
 Fri, 15 Jan 2021 13:10:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-142.ams2.redhat.com
 [10.36.115.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9699960C8A;
 Fri, 15 Jan 2021 13:10:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1955C11386A7; Fri, 15 Jan 2021 14:10:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH] cirrus: don't run full qtest on macOS
References: <20210106114159.981538-1-berrange@redhat.com>
 <20210106133622.GM976881@redhat.com>
 <7018bf8c-fba5-4025-df58-02da091eebf8@ilande.co.uk>
Date: Fri, 15 Jan 2021 14:10:20 +0100
In-Reply-To: <7018bf8c-fba5-4025-df58-02da091eebf8@ilande.co.uk> (Mark
 Cave-Ayland's message of "Thu, 7 Jan 2021 12:23:19 +0000")
Message-ID: <87ft32pcqr.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:

> On 06/01/2021 13:36, Daniel P. Berrang=C3=A9 wrote:
>
>>> The Cirrus CI macOS build hosts have exhibited a serious performance
>>> degradation in recent months. For example the "qom-test" qtest takes
>>> over an hour for only the qemu-system-aarch64 binary. This is as much
>>> 20-40 times slower than other environments. The other qtests all show
>>> similar performance degradation, as do many of the unit tests.
>>>
>>> This does not appear related to QEMU code changes, since older git
>>> commits which were known to fully complete in less than 1 hour on
>>> Cirrus CI now also show similar bad performance. Either Cirrus CI
>>> performance has degraded, or an change in its environment has exposed
>>> a latent bug widely affecting all of QEMU. Debugging the qom-test
>>> showed no easily identified large bottleneck - every step of the
>>> test execution was simply slower.
>> It appears I might be mistaken here. On IRC it was reported that
>> going back furrther to v5.1.0 shows good performance in Cirrus
>> still.
>> I had only gone back as far as
>> 2a5a79d1b57280edd72193f6031de3feb682154e
>> which I thought was fast originally.
>> So somewhere between v5.1.0 and 2a5a79 we apparently regressed.
>
> I tested a few macos cirrus-ci builds after the meson conversion and
> found that they were working fine, so whatever is affecting the macos
> build must be related to a QEMU change.
>
> A full bisect proved to be too tricky due to the instability of the
> tree at that point in time, however reading through "git log" and
> attempting some builds at merges I thought might be related I
> discovered that the slowness was introduced by this PR:
>
>
> commit b7092cda1b36ce687e65ab1831346f9529b781b8
> Merge: 497d415d76 eb94b81a94
> Author: Peter Maydell <peter.maydell@linaro.org>
> Date:   Fri Oct 9 13:20:46 2020 +0100
>
>     Merge remote-tracking branch
>     'remotes/armbru/tags/pull-monitor-2020-10-09' into staging
>
>     Monitor patches for 2020-10-09
[...]
>
> Fortunately that PR could be bisected and that led me this commit:
>
>
> 9ce44e2ce267caf5559904a201aa1986b0a8326b is the first bad commit
> commit 9ce44e2ce267caf5559904a201aa1986b0a8326b
> Author: Kevin Wolf <kwolf@redhat.com>
> Date:   Mon Oct 5 17:58:50 2020 +0200
>
>     qmp: Move dispatcher to a coroutine
>
>     This moves the QMP dispatcher to a coroutine and runs all QMP command
>     handlers that declare 'coroutine': true in coroutine context so they
>     can avoid blocking the main loop while doing I/O or waiting for other
>     events.
>
>     For commands that are not declared safe to run in a coroutine, the
>     dispatcher drops out of coroutine context by calling the QMP command
>     handler from a bottom half.
>
>     Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>     Reviewed-by: Markus Armbruster <armbru@redhat.com>
>     Message-Id: <20201005155855.256490-10-kwolf@redhat.com>
>     Reviewed-by: Markus Armbruster <armbru@redhat.com>
>     Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>     Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
>
> Given that Peter can run the tests manually, I'm not exactly sure why
> the cirrus-ci environment is different - all I can think of is that it
> could be related to running in a headless terminal.
>
> For reference running cirrus-ci on the last good commit 04f22362f1
> "qapi: Add a 'coroutine' flag for commands" gave me a total runtime of
> 35 mins.

Let me explain what the patch does, in the hope of helping somebody else
find out why it behaves badly on MacOS.  Unfortunately, a proper
explanation requires quite some context.  Bear with me.

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

When a monitor command blocks, the main loop blocks, and that means no
more monitor commands can run, not even on other monitors.

"Doctor, doctor, running code in the main loop hurts".  Sadly, the
doctor's recommended remedy "don't do that then" is really hard to
apply: a lot of code has been written assuming "running in the main
loop, with the big QEMU lock held".

The first small step towards it was taken to enable the "out-of-band"
feature.  We moved the QMP monitor proper out of the main loop into a
monitor I/O thread.  The monitor commands get funneled to the main loop.
Instead of the main loop calling the monitor when a file descriptor has
input, it now calls the command dispatcher when a funnel queue has a
command.

Why bother?  Because now we can thread execute special "out-of-band"
commands right away, in the I/O thread, regardless of how badly the main
loop is.  Peter Xu wanted this badly enough for postcopy recovery to
code it up.  It was hard.  It's not generally useful, as the restriction
on what OOB commands can do are severe.

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

We've finally reached commit 9ce44e2ce2 "qmp: Move dispatcher to a
coroutine".

The QMP command dispatcher runs in a coroutine in the main loop (HMP
works differently, but let's ignore it here).

If the command can be executed in coroutine context, the dispatcher
calls its handler as before.  Right now, we take this path just for
block_resize and screendump.

Else, we create a bottom half that calls the handler, and schedule it to
run in the main loop.  Right now, we take this path for all the other
commands.

Hypothesis: on MacOS, taking this path is s-l-o-w.  Perhaps creating
bottom halves takes ages.  Perhaps the delay until a scheduled bottom
half actually runs is huge.

Possibly useful experiment: find out which QMP commands the slow test
case runs a lot, and mark them 'coroutine': true in the QAPI schema.

Another hypothesis: entering and leaving the QMP dispatcher coroutine is
slow.  If yes, all coroutines are probably slow, which hurts a lot more
than just QMP.

Hope this helps.


