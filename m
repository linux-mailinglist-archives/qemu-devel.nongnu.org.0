Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFC62D1BB2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 22:09:25 +0100 (CET)
Received: from localhost ([::1]:46116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmNl6-0004fx-HC
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 16:09:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmNiw-0003gP-TR
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 16:07:14 -0500
Received: from mx2.suse.de ([195.135.220.15]:51022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmNiq-00066E-W2
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 16:07:08 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B2B26ACF9;
 Mon,  7 Dec 2020 21:06:56 +0000 (UTC)
Subject: Re: [PATCH] target/arm: do not use cc->do_interrupt for KVM directly
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201207084042.7690-1-cfontana@suse.de>
 <20201207174916.GD1289986@habkost.net>
 <CAFEAcA_UUs6NJ_JYtNEQ3VubHnvsvo1BBx6=9nVT9GO_QrDwoQ@mail.gmail.com>
 <20201207182842.GE1289986@habkost.net>
 <CAFEAcA9OWLF01hR4qzPwKWAHiDZ9RkSab8rv+0rnkyNhQjAnOg@mail.gmail.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <2e2e0160-7c17-cdfd-93e0-3d2002996108@suse.de>
Date: Mon, 7 Dec 2020 22:06:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9OWLF01hR4qzPwKWAHiDZ9RkSab8rv+0rnkyNhQjAnOg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Dongjiu Geng <gengdongjiu@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 9:56 PM, Peter Maydell wrote:
> On Mon, 7 Dec 2020 at 18:28, Eduardo Habkost <ehabkost@redhat.com> wrote:
>> All signs seem to indicate that CPUClass.do_interrupt is
>> TCG-specific, except for those two lines of code in
>> target/arm/kvm64.c.  The point of this patch would be to allow us
>> to separate TCG-specific code from accel-independent code later.
> 
> So it's TCG-specific except that we call it from KVM.
> That doesn't sound very TCG-specific :-)
> 
>> Maybe those signs are misleading us, and CPUClass.do_interrupt
>> shouldn't be TCG-specific.  If that's the case, why arm is the
>> only architecture that uses CPUClass.do_interrupt outside
>> TCG-specific code?
> 
> So, the purpose of the do_interrupt method is "set the guest
> CPU state up in the way that the architecture specifies
> happens when an interrupt is taken" (set the program counter,
> set things like the syndrome register that says what type
> of exception happens, etc, etc). For TCG we obviously need
> to do this for every interrupt/exception that happens.
> For KVM, in most cases the kernel is responsible for
> delivering an exception to the guest, because it's the
> kernel that determines that it needs to do this.
> The two oddball cases[*] in target/arm are for situations
> where it is userspace code that has identified that it
> needs to deliver an exception to the guest. The kernel's
> KVM API doesn't provide a "please deliver an exception to
> the guest" function, on the grounds that userspace could
> do the work itself. So we need to do that work (setting the
> PC, setting syndrome register, etc, etc). In theory we
> could have a special version of the function for KVM
> CPUs only, but since in fact the same code works just
> fine in KVM and TCG we reuse it.
> 
> I know that the macOS Hypervisor.Framework APIs are rather
> lower-level than KVM (they do less work in the kernel and
> push more of it onto userspace); it's possible that there
> we might find more situations where userspace needs to do
> "make the guest CPU take an exception"; I haven't investigated.
> 
> [*] The two special cases are:
>  (1) the vcpu thread got a SIGBUS indicating a memory error,
>      and we need to deliver a synchronous external abort
>      exception to the guest to let it know about the error
>  (2) the kernel told us about a debug exception (breakpoint,
>      watchpoint, etc) but it turns out not to be for one of
>      QEMU's own gdbstub breakpoints/watchpoints, so it
>      must be one the guest itself has set up, and so we need
>      to deliver it to the guest
> 
> These are fairly obscure, and it wouldn't surprise me if
> other target archs had picked a different separation of
> concerns between userspace and the kernel such that userspace
> didn't need to manually deliver an exception.
> 
> thanks
> -- PMM
> 

Hello Peter,

thank you for the explanation, interesting read.

As I understand it, for the purpose of code separation,
we could:

1) skip do_interrupt move to the separate tcg_ops structure, wait until KVM/ARM uses another approach (if ever)
2) do the move, and just call arm_cpu_do_interrupt() directly, since for KVM64 it is the only one that can be assigned to cc->do_interrupt().

Which way would you suggest?

Thanks,

Claudio






