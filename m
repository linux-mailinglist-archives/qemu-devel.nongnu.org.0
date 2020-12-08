Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F082D2FC6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 17:35:31 +0100 (CET)
Received: from localhost ([::1]:45040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmfxa-0000qj-Ar
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 11:35:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kmfrG-0006Lv-7Q
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 11:28:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kmfrB-0001KG-Ma
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 11:28:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607444932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jRstijGKu8w9sL+N7mJ1RKkSr78cOBVcAv6jdgTnJiw=;
 b=TlWYydO4b1fPHCydQRIR1AORE+wPaGIvK3f5qUZSN9zewn4/TYu1/CZ8nu6ZNurFRz28iX
 4vSLewtJI+P25P1Gb1LFYmRqIQ+TlgQGamrYMvigHyVQ1VEEfY1TvpQKUGYFHBR2CgIubC
 a2g/LNaB0lyOOfwmdVgx+qK3oPeVAg4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-X0tRFtflO5qTDujxW0AJ4w-1; Tue, 08 Dec 2020 11:28:48 -0500
X-MC-Unique: X0tRFtflO5qTDujxW0AJ4w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4783107ACE6;
 Tue,  8 Dec 2020 16:28:23 +0000 (UTC)
Received: from localhost (ovpn-120-147.rdu2.redhat.com [10.10.120.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E2DE5D6AB;
 Tue,  8 Dec 2020 16:28:23 +0000 (UTC)
Date: Tue, 8 Dec 2020 11:28:21 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] target/arm: do not use cc->do_interrupt for KVM directly
Message-ID: <20201208162821.GK1289986@habkost.net>
References: <CAFEAcA_UUs6NJ_JYtNEQ3VubHnvsvo1BBx6=9nVT9GO_QrDwoQ@mail.gmail.com>
 <20201207182842.GE1289986@habkost.net>
 <CAFEAcA9OWLF01hR4qzPwKWAHiDZ9RkSab8rv+0rnkyNhQjAnOg@mail.gmail.com>
 <2e2e0160-7c17-cdfd-93e0-3d2002996108@suse.de>
 <20201207212638.GI1289986@habkost.net>
 <CAFEAcA_CNHucoBoq9_jWw9HLc_WneYko5s42z853NVJZdLCGuQ@mail.gmail.com>
 <d3113905-fd76-28ee-8e6a-7a8dd5d3a3ee@redhat.com>
 <b1ef6c6c-1803-a877-b4b7-a12b82288160@suse.de>
 <6b6d65af-5814-27f7-e9c4-937c42e8958c@suse.de>
 <b63dbed8-5e37-4b1c-2e5b-86fbd8bd47ba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b63dbed8-5e37-4b1c-2e5b-86fbd8bd47ba@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dongjiu Geng <gengdongjiu@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 08, 2020 at 03:34:03PM +0100, Philippe Mathieu-Daudé wrote:
> On 12/8/20 2:55 PM, Claudio Fontana wrote:
> > On 12/8/20 2:51 PM, Claudio Fontana wrote:
> >> On 12/8/20 2:27 PM, Philippe Mathieu-Daudé wrote:
> >>> On 12/7/20 10:50 PM, Peter Maydell wrote:
> >>>> On Mon, 7 Dec 2020 at 21:26, Eduardo Habkost <ehabkost@redhat.com> wrote:
> >>>>> My understanding is that there's no reason for ARM KVM to use
> >>>>> another approach, and that CPUClass.do_interrupt is not really
> >>>>> TCG-specific.
> >>>>>
> >>>>> Do we have any case where the CPUClass.do_interrupt
> >>>>> implementation is really TCG-specific, or it is just a
> >>>>> coincidence that most other accelerators simply don't to call the
> >>>>> method?  It looks like the only cases where the
> >>>>> CPUClass.do_interrupt assignment is conditional on CONFIG_TCG are
> >>>>> i386 and s390x.
> >>>>
> >>>> Looking at PPC, its kvm_handle_debug() function does a
> >>>> direct call to ppc_cpu_do_interrupt(). So the code of
> >>>> its do_interrupt method must be ok-for-KVM, it's just that
> >>>> it doesn't use the method pointer. (It's doing the same thing
> >>>> Arm is -- if a debug event turns out not to be for QEMU itself,
> >>>> inject a suitable exception into the guest.)
> >>>>
> >>>> So of our 5 KVM-supporting architectures:
> >>>>
> >>>>  * i386 and s390x have kernel APIs for "inject suitable
> >>>>    exception", don't need to call do_interrupt, and make
> >>>>    the cc->do_interrupt assignment only ifdef CONFIG_TCG,
> >>>>    so that the code for do_interrupt need not be compiled
> >>>>    into a KVM-only binary. (In both cases the code for the
> >>>>    function is in a source file that the meson.build puts
> >>>>    into the source list only if CONFIG_TCG)
> >>>>  * ppc and arm both need to use this code even in a KVM
> >>>>    only binary. Neither of them #ifdef the cc->do_interrupt
> >>>>    assignment, because there's not much point at the moment
> >>>>    if you're not going to try to compile out the code.
> >>>>    ppc happens to do a direct function call, and arm happens
> >>>>    to go via the cc->do_interrupt pointer, but I don't
> >>>>    think there's much significance in the choice either way.
> >>>>    In both cases, the only places making the call are within
> >>>>    architecture-specific KVM code.
> >>>>  * mips KVM does neither of these things, probably because it is
> >>>>    not sufficiently featureful to have run into the cases
> >>>>    where you might want to re-inject an exception and it's
> >>>>    not being sufficiently used in production for anybody to
> >>>>    have looked at minimising the amount of code in a
> >>>>    KVM-only QEMU binary for it.
> >>>>
> >>>> So in conclusion we have a basically 50:50 split between
> >>>> "use the same do_interrupt code as TCG" and "have a kernel
> >>>> API to make the kernel do the work", plus one arch that
> >>>> probably hasn't had to make the choice yet.   ¯\_(ツ)_/¯
> >>>
> >>> Why not introduce KVMCpuOperations similar to TCGCpuOperations
> >>> Claudio is introducing, and declare the do_interrupt(CPUState*)
> >>> in both structures?
> >>>
> >>> Then we can assign the same handler to both fields, TCG keeps
> >>> calling cc->tcg->do_interrupt(), KVM calls cc->kvm->do_interrupt().
> >>> This allow building with a particular accelerator, while staying
> >>> compliant with the current 50:50 split...
> >>
> >>
> >> Hi Philippe,
> >>
> >> in principle interesting, but KVMCpuOperations would end up currently containing do_interrupt only..
> >> seems a bit overkill for just one method.
> 
> I don't see this being a problem, if this makes code clearer
> (think about maintainability).
> 
> > I mean, all the others in CPUClass are common between TCG and KVM, I don't see a lot that is KVM-only there that would warrant a KVMCPUOps structure
> > 
> >> Or where you thinking of ways to refactor current kvm code to use methods in CPUClass similarly to what Tcg does?
> >>
> > 
> > But maybe this is where you were going with this?
> 
> No, not really. I'm looking for a design to enforce correctness,
> while keeping the 2 choices Peter mentioned available.
> 
> - "use the same do_interrupt code as TCG":
> 
> cc->tcg.do_interrupt = x86_cpu_do_interrupt;
> cc->kvm.do_interrupt = NULL;
> 
> cc->tcg.do_interrupt = s390_cpu_do_interrupt;
> cc->kvm.do_interrupt = NULL;
> 
> - "have a kernel API to make the kernel do the work"
> 
> cc->tcg.do_interrupt = arm_cpu_do_interrupt;
> cc->kvm.do_interrupt = arm_cpu_do_interrupt;
> 
> cc->tcg.do_interrupt = ppc_cpu_do_interrupt;
> cc->kvm.do_interrupt = ppc_cpu_do_interrupt;
> 
> Looks easy to review, hard to misplace #ifdef'ry.

So, methods that have accel-specific implementations, which is
exactly why we have the CpusAccel struct (renamed to
AccelCpuClass in Claudio's cleanup series).

Is there any reason to not move CPUClass.do_interrupt to
AccelCpuClass.do_interrupt?

-- 
Eduardo


