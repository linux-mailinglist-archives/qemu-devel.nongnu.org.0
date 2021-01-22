Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00393300DDD
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 21:40:06 +0100 (CET)
Received: from localhost ([::1]:38588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l33Do-0002l2-4c
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 15:39:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l33Cs-00027l-H1
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:38:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l33Co-0008Lm-IC
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:38:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611347932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=97zBbw/kyUun8U1yauWqQ7RcM4AvKniI1Eo0tll2hJw=;
 b=DwIyDCyl7DSY1VIU3h23uiYohGaM547kmee9dpvsmdXfIyIHhbLgDc9GYXA4yDasBP9vbR
 UmGf4ynrXy1uMfowRSQqdSkHYyVhZl3AAbgtmTDQxy2m9AiAtgNDx0DSGF2ayQayIAvihH
 hGRLhSn45xjvfpqY9ELO7SFvsgy7eKc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-Thi65ECwPCqDDqORx0f0ew-1; Fri, 22 Jan 2021 15:38:49 -0500
X-MC-Unique: Thi65ECwPCqDDqORx0f0ew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7399610054FF;
 Fri, 22 Jan 2021 20:38:48 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-81.ams2.redhat.com
 [10.36.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 476AC60BE5;
 Fri, 22 Jan 2021 20:38:42 +0000 (UTC)
Subject: Re: Thread safety of coroutine-sigaltstack
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>
References: <7b8155ad-0942-dc1c-f43c-bb5eb518a278@redhat.com>
 <445268c9-d91f-af5a-3d7e-f4c6f014ca52@redhat.com>
 <62d5d33c-fe2a-228b-146d-632c84d09fd5@redhat.com>
 <30457fa0-6d7c-4e81-2623-8551d8bf2674@redhat.com>
 <20210121160733.GP3125227@redhat.com>
 <CAFEAcA-zVvu+16xxjCvXqeZxZMqppUUb7aQkL-5nBTNY+JeyGg@mail.gmail.com>
 <a944d86c-2871-3301-6f42-f5368a122593@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <7353bcda-6363-6f56-75ad-5e2e9e0dbb16@redhat.com>
Date: Fri, 22 Jan 2021 21:38:41 +0100
MIME-Version: 1.0
In-Reply-To: <a944d86c-2871-3301-6f42-f5368a122593@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/21/21 18:24, Paolo Bonzini wrote:
> On 21/01/21 17:44, Peter Maydell wrote:
>> On Thu, 21 Jan 2021 at 16:10, Daniel P. Berrangé <berrange@redhat.com>
>> wrote:
>>> FWIW The libucontext impl is all ASM based and has coverage for all the
>>> arches we care about:
>>>
>>>     https://github.com/kaniini/libucontext
>>>
>>> so doesn't seem like there's a need for  coroutine-asm if we can rely
>>> on libucontext for portability where neede.
>>
>> The README for that notes a couple of pretty major omissions:
>>   * it doesn't handle floating point registers
>>   * it doesn't do anything about the signal mask
>> I'm pretty sure that not handling the fp regs could cause breakage
>> for Arm at least (depending on what the compiler chooses to do
>> in the functions that work with the ucontext functions). The
>> signal mask stuff might be OK for us because of the carefully
>> limited use we make of the ucontext functions, but it would be
>> a bit of a pain to have to analyse that code for both sets of semantics.
> 
> The lack of signal mask handling is an improvement for us. :)  We want
> the signal mask to be per thread, not per coroutine.

I didn't quite get this when I first read it, but now that I'm digging
through the code, I have a follow-up comment.

According to POSIX, passing savemask=0 to sigsetjmp() may or may not
save the current signal mask, into "env". A nonzero savemask is required
to save the signal mask, but a zero savemask is not forbidden to -- it
is only not required to:

https://pubs.opengroup.org/onlinepubs/9699919799/functions/sigsetjmp.html#tag_16_554_07

    Note that since this function is defined in terms of setjmp(), if
    savemask is zero, it is unspecified whether the signal mask is
    saved.

And I feel that's a bit of a problem, because when we first exit the
trampoline -- executed as a signal handler -- via sigsetjmp(), *all
signals* are masked, and sigsetjmp might actually stash that mask in
"tr_reenter", because savemask=0 does not suffice for forbidding that.

When we reenter the trampoline via siglongjmp(tr_reenter), and
subsequently call coroutine_bootstrap(), it's possible (per POSIX, see
above) that all signals are masked again. And then that could further be
remembered in "self->env", in coroutine_bootstrap(). Which would be
wrong IMO; co-routines in general should receive synchronous signals if
they mess up somewhere (terminating the process).

IOW, just before the call to coroutine_bootstrap(),
coroutine_trampoline() should explicitly restore the signal mask that
was in effect when qemu_coroutine_new() was entered.

Has this been a problem in practice, or should we ignore it?

IOW, should we assume "savemask=0" for *never* saving the signal mask?

The behavior of "savemask=0" is a platform trait that platforms are not
required to document (the behavior is unspecified, not
implementation-defined), so it really boils down to where this code
actually runs...

NB Linux is more specific:

https://man7.org/linux/man-pages/man3/setjmp.3.html

   sigsetjmp() and siglongjmp()
       sigsetjmp() and siglongjmp() also perform nonlocal gotos, but
       provide predictable handling of the process signal mask.

       If, and only if, the savesigs argument provided to sigsetjmp() is
       nonzero, the process's current signal mask is saved in env and
       will be restored if a siglongjmp() is later performed with this
       env.

Cue "and only if".

Thanks
Laszlo

> 
> Floating point however is an issue if they don't save-restore v8-v15
> (for aarch64, I don't remember what the AAPCS32 says).
> 
> Paolo
> 
> 


