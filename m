Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C452D1C18
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 22:29:39 +0100 (CET)
Received: from localhost ([::1]:38190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmO4g-0006GD-1t
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 16:29:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kmO1y-0005aq-2T
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 16:26:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kmO1u-0004CP-2W
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 16:26:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607376404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pam4TllQXC1PtF5i9JLt4kqRVk8kXc2H72vwsp+Y0GI=;
 b=V2hQuRhvMGy2OkW8GlOG1ZlkHcsqzMFqcV0TRKavbaxnuaHjMGkdIbB/55tPM20+/2pUhy
 KnmvWrVckUAZU9wH/RIifeAoARuAfJQBC72gutXetFuTRVOR7DxbOGZ4ZaakV0V9YOp+4y
 4x7ZQtT7Kxg9Wry5Ikv6l72U8sJ5PFU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-_ZJuJ8w2OYSfsAVNUIyxEA-1; Mon, 07 Dec 2020 16:26:41 -0500
X-MC-Unique: _ZJuJ8w2OYSfsAVNUIyxEA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1212410766C4;
 Mon,  7 Dec 2020 21:26:40 +0000 (UTC)
Received: from localhost (ovpn-120-147.rdu2.redhat.com [10.10.120.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99B13341F8;
 Mon,  7 Dec 2020 21:26:39 +0000 (UTC)
Date: Mon, 7 Dec 2020 16:26:38 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH] target/arm: do not use cc->do_interrupt for KVM directly
Message-ID: <20201207212638.GI1289986@habkost.net>
References: <20201207084042.7690-1-cfontana@suse.de>
 <20201207174916.GD1289986@habkost.net>
 <CAFEAcA_UUs6NJ_JYtNEQ3VubHnvsvo1BBx6=9nVT9GO_QrDwoQ@mail.gmail.com>
 <20201207182842.GE1289986@habkost.net>
 <CAFEAcA9OWLF01hR4qzPwKWAHiDZ9RkSab8rv+0rnkyNhQjAnOg@mail.gmail.com>
 <2e2e0160-7c17-cdfd-93e0-3d2002996108@suse.de>
MIME-Version: 1.0
In-Reply-To: <2e2e0160-7c17-cdfd-93e0-3d2002996108@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Dongjiu Geng <gengdongjiu@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 07, 2020 at 10:06:55PM +0100, Claudio Fontana wrote:
> On 12/7/20 9:56 PM, Peter Maydell wrote:
> > On Mon, 7 Dec 2020 at 18:28, Eduardo Habkost <ehabkost@redhat.com> wrote:
> >> All signs seem to indicate that CPUClass.do_interrupt is
> >> TCG-specific, except for those two lines of code in
> >> target/arm/kvm64.c.  The point of this patch would be to allow us
> >> to separate TCG-specific code from accel-independent code later.
> > 
> > So it's TCG-specific except that we call it from KVM.
> > That doesn't sound very TCG-specific :-)
> > 
> >> Maybe those signs are misleading us, and CPUClass.do_interrupt
> >> shouldn't be TCG-specific.  If that's the case, why arm is the
> >> only architecture that uses CPUClass.do_interrupt outside
> >> TCG-specific code?
> > 
> > So, the purpose of the do_interrupt method is "set the guest
> > CPU state up in the way that the architecture specifies
> > happens when an interrupt is taken" (set the program counter,
> > set things like the syndrome register that says what type
> > of exception happens, etc, etc). For TCG we obviously need
> > to do this for every interrupt/exception that happens.
> > For KVM, in most cases the kernel is responsible for
> > delivering an exception to the guest, because it's the
> > kernel that determines that it needs to do this.
> > The two oddball cases[*] in target/arm are for situations
> > where it is userspace code that has identified that it
> > needs to deliver an exception to the guest. The kernel's
> > KVM API doesn't provide a "please deliver an exception to
> > the guest" function, on the grounds that userspace could
> > do the work itself. So we need to do that work (setting the
> > PC, setting syndrome register, etc, etc). In theory we
> > could have a special version of the function for KVM
> > CPUs only, but since in fact the same code works just
> > fine in KVM and TCG we reuse it.
> > 
> > I know that the macOS Hypervisor.Framework APIs are rather
> > lower-level than KVM (they do less work in the kernel and
> > push more of it onto userspace); it's possible that there
> > we might find more situations where userspace needs to do
> > "make the guest CPU take an exception"; I haven't investigated.
> > 
> > [*] The two special cases are:
> >  (1) the vcpu thread got a SIGBUS indicating a memory error,
> >      and we need to deliver a synchronous external abort
> >      exception to the guest to let it know about the error
> >  (2) the kernel told us about a debug exception (breakpoint,
> >      watchpoint, etc) but it turns out not to be for one of
> >      QEMU's own gdbstub breakpoints/watchpoints, so it
> >      must be one the guest itself has set up, and so we need
> >      to deliver it to the guest
> > 
> > These are fairly obscure, and it wouldn't surprise me if
> > other target archs had picked a different separation of
> > concerns between userspace and the kernel such that userspace
> > didn't need to manually deliver an exception.
> > 
> > thanks
> > -- PMM
> > 
> 
> Hello Peter,
> 
> thank you for the explanation, interesting read.
> 
> As I understand it, for the purpose of code separation,
> we could:
> 
> 1) skip do_interrupt move to the separate tcg_ops structure,
> wait until KVM/ARM uses another approach (if ever)

My understanding is that there's no reason for ARM KVM to use
another approach, and that CPUClass.do_interrupt is not really
TCG-specific.

Do we have any case where the CPUClass.do_interrupt
implementation is really TCG-specific, or it is just a
coincidence that most other accelerators simply don't to call the
method?  It looks like the only cases where the
CPUClass.do_interrupt assignment is conditional on CONFIG_TCG are
i386 and s390x.


> 2) do the move, and just call arm_cpu_do_interrupt() directly,
> since for KVM64 it is the only one that can be assigned to
> cc->do_interrupt().
> 
> Which way would you suggest?
> 
> Thanks,
> 
> Claudio
> 
> 
> 
> 
> 

-- 
Eduardo


