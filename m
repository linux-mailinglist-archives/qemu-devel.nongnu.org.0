Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C99C160516A
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 22:40:12 +0200 (CEST)
Received: from localhost ([::1]:58572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olFrH-0004gg-Bn
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 16:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1olFpg-0003EA-N9
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 16:38:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1olFpW-0004cf-4a
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 16:38:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666211898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TFsVRQtq+iQjAuTvk4h69Y7hlhP8P9KX2KrULimNJyI=;
 b=CGdvtnrvIVOfAhYBNoG+NDRW2NBuMuFqFvwKUh9GHktNVkqsqZQgVDNWok4Jp9LzLYZWeN
 dkS2HvAZBHvjK9h9PZ034oL5rkgSs5Knj81aA0pME+OLH5UpS0F2BfaNu89mcqJDEJ+UkI
 b0RqdxZX4H9rulCpoyk5KTNCdaW/pI8=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-549-c002nqbCPLqcsgdichmThg-1; Wed, 19 Oct 2022 16:38:16 -0400
X-MC-Unique: c002nqbCPLqcsgdichmThg-1
Received: by mail-lj1-f198.google.com with SMTP id
 h21-20020a2ea495000000b0026dffd0733aso7623798lji.7
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 13:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TFsVRQtq+iQjAuTvk4h69Y7hlhP8P9KX2KrULimNJyI=;
 b=tCn4XFylhrQkkEH3GkOURO1CND0Agq0Sg1lYstuf2kXNrlmN8q+8YbXNz4oClWsvz9
 f3iIu8cWqE5tGM4FvWm2vV9dd6vC19U9SfwATXQ6lEqhUeT47gWds1OWSKC4LMjbgZmG
 Qoq2tj8u3mKYHM+ZzIxEnVxZcbeoGCygO7hJ6up06Ie3zwyZYJFGejsIi8jPT83rwWAq
 UYsQABLGYahuVb2S9Wyy6Ewto6W4JE+vs5qmNrk80RqIwNambqrtpttWaolSF2Cd8ty3
 95FGwvigCZYqecEOtd5uqN6hghjc0Bn6fnxnrNDkFvpDsCxBM08pDFPnu09IkViUhldY
 Ng4w==
X-Gm-Message-State: ACrzQf0uEtwajoZp2EDarmicszyysWgVrqg23pxzRyuI63cvU+zGlXTE
 1vLsgaNvHulqFFsFgXuDDS6/gO/MVTlKYsfDe9t1fDlG3qV2m8evUCRrjuE22j3H4J61pVcEIaO
 4g6TsgLuAkhZL7Om4/mpGd9Gg1tyC7Mg=
X-Received: by 2002:ac2:4e88:0:b0:4a2:2fa8:9bd8 with SMTP id
 o8-20020ac24e88000000b004a22fa89bd8mr3318843lfr.621.1666211895299; 
 Wed, 19 Oct 2022 13:38:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4GI4zSw0z8TloCyfzpjX/A/IRUHuGS49AyohtPdQqVjK66EzZvaUI4LwziVW+/iw133CLsCN1/03wl5BgiX1Y=
X-Received: by 2002:ac2:4e88:0:b0:4a2:2fa8:9bd8 with SMTP id
 o8-20020ac24e88000000b004a22fa89bd8mr3318832lfr.621.1666211894995; Wed, 19
 Oct 2022 13:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA_hi1VHNVetOKkpUXuYtJ4akdVZxwBqSXf76Zvx=YB6Xg@mail.gmail.com>
In-Reply-To: <CAFEAcA_hi1VHNVetOKkpUXuYtJ4akdVZxwBqSXf76Zvx=YB6Xg@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 19 Oct 2022 16:38:03 -0400
Message-ID: <CAFn=p-aoe1QQMXkgdu_yKxb4jCTahsM1K-Fo+vtXOwG=8=_=Lw@mail.gmail.com>
Subject: Re: has anybody looked at the long-standing intermittent raspi2
 avocado test failure?
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Oct 18, 2022 at 6:23 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> If you run this single avocado test:
>
> while ./build/x86/tests/venv/bin/avocado run
> build/x86/tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2_initrd
> ; do true; done
>
> then on my machine it will fail within 4 or 5 iterations. Has anybody
> looked into this? Looking at a log from a failed test
> https://people.linaro.org/~peter.maydell/raspi-avocado-fail.log
> what seems to happen is that the test sends the "halt" command to
> the guest. The DEBUG log reports a transition from RUNNING to
> DISCONNECTING and the QMP connection disconnects, so presumably
> the guest really did exit -- or is that something the test framework
> is doing from its end?

The avocado test calls self.vm.wait(), which goes down this call
chain, all in QEMUMachine (machine.py):

wait()
.shutdown()
.._do_shutdown()
..._soft_shutdown()
...._early_cleanup()
...._close_qmp_connection()

QEMUMachine._early_cleanup, as you've noticed, closes the console
socket right away. It has this to say on the matter:

# If we keep the console socket open, we may deadlock waiting
# for QEMU to exit, while QEMU is waiting for the socket to
# become writable.

If we leave it open, QEMU is not guaranteed to close, and the
synchronous code in machine.py isn't good enough to poll both. This
was one motivation for switching the QMP library to asyncio, but those
changes haven't hit machine.py yet. I am hoping to have it done soon,
but some other tasks of finalizing splitting out the QMP library
itself took priority in my time budget before returning to converting
more utilities to asyncio.

Next, the QMP connection itself is closed, which is that transition
from RUNNING to DISCONNECTING you see from the "protocol" module in
Avocado's log.
(Avocado is truncating the full module names here; the real source
module names are "qemu.qmp.protocol", "qemu.qmp.qmp_client", and
"qemu.machine.machine".)

>                        Anyway, the next thing that happens is
> that after a 30s timeout something (the avocado framework?) sends
> the QEMU process a SIGTERM, and there's a bunch of timeout related
> python backtraces in the log.

It looks like the subprocess wait in _soft_shutdown never returns. We
assume that because wait() was called that the caller is expecting the
VM to exit and has presumably already issued a "quit" or "halt" or
equivalent, so the Machine code does not issue any further commands to
ensure this happens.

At this point, my guess is that -- based on your later issue filings
-- the "halt" command isn't actually getting processed because of the
rapid console disconnect, so the machine.py code deadlocks waiting for
QEMU to exit when it never will.

>
> In comparison, with a pass
> https://people.linaro.org/~peter.maydell/raspi-avocado-pass.log
> the transition from DISCONNECTING to IDLE is followed within about
> 5 seconds by a test pass.
>
> So:
>
> (1) has anybody looked at what's happening in this test in
> particular?
> (2) is it possible for avocado to log all of the communication
> on the serial console? Currently the logging of what the guest
> prints cuts out early (in both success and failure cases),
> and what the test case sends to the guest is not logged at all

The output logging being truncated is due to other problems as you've
noticed in later issue filings.

I think that Input logging could be added by overriding
ConsoleSocket.send() in console_socket.py; see
https://docs.python.org/3/library/socket.html#socket.socket.send for
signature and use _drain_socket and/or recv() as a reference basis.
You might want to not write to the same logfile to avoid an
unreadable, interleaved mess. The data buffers here are, I think, not
line-based and may not produce coherent interleaved output.

Naive and untested:
```
    def send(self, data: bytes, flags: int = 0) -> bytes:
        self._some_other_logfile.write(data)
        self._some_other_logfile.flush()
        return super().send(data, flags)
```

I am working on replacing machine.py with an async version which
should solve some of the socket problems; but if you want a band-aid
in the meantime I'm happy to take any patches to improve what we have
in the short-term. I will probably focus my own efforts on just
getting the rewrite in.

> (3) what's the best way to debug this to figure out what's
> actually happening?
>
> I tried passing timeout=None to the self.vm.wait() call in
> test_arm_raspi2_initrd(), which the comments in machine.py
> is supposed to mean "wait forever", but that didn't actually
> seem to change the timeout. (I had the idea of looking at
> the status of the QEMU process etc at that point.)

Hm ... The stack trace for the TimeoutExpired exception sure makes it
look like the Machine appliance is hitting its own timeout (Should be
at about 30 seconds -- matches what you observed), but if that's the
case, passing timeout=None should have alleviated that -- up until you
hit the Avocado timeout, at least.

I'd expect the traceback output and failure mode to look a little
different depending on which component decides to time out.

>
> thanks
> -- PMM
>

"Thanks for the analysis, but, like, what are you going to do to fix
any of this?"

Long term, an asyncio version of machine.py will help alleviate these
kinds of race conditions when dealing with multiple sockets from
Python as our testing requirements become more complex.

Short term, I'm not sure... I think removing the early socket close
code will just cause new race condition deadlocks elsewhere. I
recommend adding some kind of wait or flush to the socket code after
sending a "halt" to ensure that the command goes through. You could
also decide not to send "halt" and just use vm.shutdown() directly,
which will use QMP to issue 'quit', which always waits to get a
command success acknowledgment from QEMU which should avoid the
problem too.


