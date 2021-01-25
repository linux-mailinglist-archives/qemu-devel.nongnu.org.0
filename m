Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A78302EB1
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 23:10:53 +0100 (CET)
Received: from localhost ([::1]:47930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4A4S-0008DX-A5
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 17:10:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l4A23-0007hG-IC
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 17:08:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l4A1z-0007op-2V
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 17:08:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611612498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9HY3qhnj/ffo+wVNvyFDPJVCIIf4WQCEGLPZnyD+V1I=;
 b=XPwt2vrvslzaF44JRAHGcaTj1AI7TfalhwcPvb8WqplVmz1dYZG8JDBtTIUk+Z+CQvAgKI
 lFBIvQyv7cDvVdKEgkYAB+CTeDkQBac3aUhHNPDWFNgUmHauNAB9Ju0AVZPgoHSfwpZvB9
 hRWCmPFymqFRLNUXA9Pm+1lL7fBF+Ls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-Q5CfdzxONQCXpiLHOFnhmw-1; Mon, 25 Jan 2021 17:08:15 -0500
X-MC-Unique: Q5CfdzxONQCXpiLHOFnhmw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84187107ACE4
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 22:08:14 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D39819C47;
 Mon, 25 Jan 2021 22:08:09 +0000 (UTC)
Subject: Re: [PATCH] coroutine-sigaltstack: Keep SIGUSR2 handler up
From: Laszlo Ersek <lersek@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-devel@nongnu.org
References: <20210122102041.27031-1-mreitz@redhat.com>
 <d68e5cc9-d6ba-2dac-04ad-49d5509cd836@redhat.com>
 <eef8237e-293a-b6e6-20be-fa004509fa05@redhat.com>
 <1121a803-98e7-6d41-119c-3d82717976ec@redhat.com>
 <cba8919b-0480-3520-6ad6-920bf9d4186e@redhat.com>
 <063dd2a6-a3ae-0d7c-3e29-96a08a6d9a3d@redhat.com>
 <88cba59c-f644-7474-03b7-90208697bcb6@redhat.com>
Message-ID: <46d5fa39-9f71-39a2-6085-0f508071b370@redhat.com>
Date: Mon, 25 Jan 2021 23:08:09 +0100
MIME-Version: 1.0
In-Reply-To: <88cba59c-f644-7474-03b7-90208697bcb6@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/25/21 22:13, Laszlo Ersek wrote:
> On 01/23/21 23:13, Paolo Bonzini wrote:
>> On 22/01/21 22:26, Laszlo Ersek wrote:
>>> That seems bogus, per POSIX, given that all signals except SIGUSR2 are
>>> included in the mask passed to sigsuspend().
>>
>> What happens if you get a SIGSTOP at exactly the wrong time?  (Yeah I
>> know how incredibly unlikely that would be).
> 
> Nothing; it is impossible to ignore or catch SIGSTOP:
> 
> https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/signal.h.html
> 
> And therefore it is also impossible to block it (but an attempt to block
> it will not cause issues); see e.g.
> 
> https://pubs.opengroup.org/onlinepubs/9699919799/functions/sigsuspend.html
> 
> ("It is not possible to block signals that cannot be ignored. This is
> enforced by the system without causing an error to be indicated.")
> 
> So the process will simply stop executing.
> 
> 
> The more interesting question is SIGCONT. SIGCONT will always behave
> like it should:
> 
> https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/signal.h.html
> 
> The interesting part is that it's possible to install a handler for
> SIGCONT, which will act *in addition* to the normal SIGCONT effect.
> 
> Such a handler is actually useful for (e.g.) restarting timers that may
> have been thrown off while the process was not scheduled for a while
> (due to SIGSTOP).
> 
> If there is no handler installed for SIGCONT, nothing particular happens
> when it is delivered (the process doesn't notice).

Sorry, I need to correct my terminology here (no change to my
description of the behavior, just the terms) -- basically SIGCONT
resumes the target process (if stopped) as soon as it is generated (=
made pending) for the target process; the disposition and/or masking of
SIGCONT in the target has no effect on this.

If a handler and/or masking are used in the target process, those only
affect delivery; and in that case, delivery of SIGCONT is no different
from that of other signals.

In the end, SIGCONT first resumes the process (if stopped), regardless
of disposition / masking, and *then* it is delivered, subject to
disposition and masking. (If SIGCONT is not blocked but it is caught,
then of course generation and delivery are indistinguishable in the
target process.)

(A program I had written earlier relied on this specifically, for
restarting a timer -- it would block SIGCONT at all times, except in a
very tight "event fetch" call, such as pselect(). So there could easily
be sections of code that would run with SIGCONT actively pending. In
fact, async SIGCONT could be used to force a timer restart, without ever
sending SIGSTOP!)

So the short paragraph I'm quoting right above is inaccurate because, if
no handler is installed, SIGCONT is not "delivered" at all.

Thanks
Laszlo

> 
> QEMU does seem to install a SIGCONT handler, in "chardev/char-stdio.c".
> But that's not a problem (at least with the patch I had attached)
> because the mask that sigsuspend() puts in place, temporarily, for
> unblocking SIGUSR2, also blocks SIGCONT (together with everything else).
> If a STOP/CONT occurs exactly then, then SIGCONT will resume the
> process, but the handler for SIGCONT will run precisely *after*
> sigsuspend() -- including the SIGUSR2 handling -- returns, and SIGCONT
> becomes unblocked by virtue of sigsuspend() restoring the original mask.
> 
> (Side comment: I'm not convinced the existent SIGCONT handling in
> "chardev/char-stdio.c" is safe, regardless of the topic at hand --
> SIGCONT does not seem to be masked for all threads except one, and so
> any thread could execute term_stdio_handler(). While the only called
> function in that is tcsetattr(), which is async signal safe, I don't
> know whether accessing "stdio_echo_state" and "stdio_allow_signal" is
> also safe. It may be.)
> 
> 
> BTW, the signal(7) Linux manual documents spurious wakeups for
> sigtimedwait(2) and sigwaitinfo(2), indeed in connection with SIGCONT.
> However, sigsuspend() is not listed in that section (I had checked):
> 
> https://man7.org/linux/man-pages/man7/signal.7.html
> 
>    Interruption of system calls and library functions by stop signals
>        On Linux, even in the absence of signal handlers, certain
>        blocking interfaces can fail with the error EINTR after the
>        process is stopped by one of the stop signals and then resumed
>        via SIGCONT.  This behavior is not sanctioned by POSIX.1, and
>        doesn't occur on other systems.
> 
>        The Linux interfaces that display this behavior are:
> 
>        * "Input" socket interfaces, when a timeout (SO_RCVTIMEO) has
>          been set on the socket using setsockopt(2): accept(2), recv(2),
>          recvfrom(2), recvmmsg(2) (also with a non-NULL timeout
>          argument), and recvmsg(2).
> 
>        * "Output" socket interfaces, when a timeout (SO_RCVTIMEO) has
>          been set on the socket using setsockopt(2): connect(2),
>          send(2), sendto(2), and sendmsg(2), if a send timeout
>          (SO_SNDTIMEO) has been set.
> 
>        * epoll_wait(2), epoll_pwait(2).
> 
>        * semop(2), semtimedop(2).
> 
>        * sigtimedwait(2), sigwaitinfo(2).
> 
>        * Linux 3.7 and earlier: read(2) from an inotify(7) file
>          descriptor
> 
>        * Linux 2.6.21 and earlier: futex(2) FUTEX_WAIT,
>          sem_timedwait(3), sem_wait(3).
> 
>        * Linux 2.6.8 and earlier: msgrcv(2), msgsnd(2).
> 
>        * Linux 2.4 and earlier: nanosleep(2).
> 
> If other host OSes that QEMU supports have similar non-conformance
> notes, and sigsuspend() is affected on them, then removing the loop
> around sigsuspend() is unsafe.
> 
> I only know where to check POSIX and the Linux manuals.
> 
> 
>> BTW if we are in a mood for cleanup, there's no reason to use
>> pthread_key_t instead of __thread + qemu_thread_atexit_add (adding a
>> Notifier to struct CoroutineThreadState).  That would fix the issue with
>> async-signal safety of pthread_getspecific.
>>
>> (It makes sense for the function not to be async-signal safe since it
>> can in principle allocate memory for the data.  In practice it's most
>> likely okay if the function has been called before on this thread).
> 
> This is a good idea, but with the patch I had attached, it's not urgent
> -- pthread_getspecific is only called from a safe context. Per POSIX,
> there is a problem only when an unsafe function is executed while the
> signal interrupts an unsafe function:
> 
> https://pubs.opengroup.org/onlinepubs/9699919799/functions/V2_chap02.html#tag_15_04_03_03
> 
>     In the presence of signals, all functions defined by this volume of
>     POSIX.1-2017 shall behave as defined when called from or interrupted
>     by a signal-catching function, with the exception that when a signal
>     interrupts an unsafe function or equivalent (such as the processing
>     equivalent to exit() performed after a return from the initial call
>     to main()) and the signal-catching function calls an unsafe
>     function, the behavior is undefined.
> 
> And with the proposed patch, the only function that can be interrupted
> by SIGUSR2 is sigsuspend(), and sigsuspend() is listed in the table of
> safe functions.
> 
> Thanks
> Laszlo
> 


