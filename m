Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B7232D088
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 11:18:09 +0100 (CET)
Received: from localhost ([::1]:55182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHl3Y-0003yc-64
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 05:18:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lHl1X-0002Yl-RA
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 05:16:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lHl1T-0001KX-FE
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 05:16:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614852957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t0z3uTdKZnAzw46gDA/ThJCp7PJIZ1qTTQRRsoCx3sc=;
 b=dbcfhb1nW8EFk9PiB+O4oLe0iBcwyeJGbXwCwFf1ZN6WLEhxEpB4gvRihD/fY/QXL9lJGO
 XECT/CxTIEa73ejVWuW2911ZQeWGtSPKSctjJ6G90K2FIB+Vt+xJOQLtBPJCzBDuuUqZUf
 0yfV3IFWBsktNrM7Hpz82ysa1fzGhFg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-k_MILDsXOfumk5TIz57-5w-1; Thu, 04 Mar 2021 05:15:55 -0500
X-MC-Unique: k_MILDsXOfumk5TIz57-5w-1
Received: by mail-ed1-f69.google.com with SMTP id o15so8370623edv.7
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 02:15:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t0z3uTdKZnAzw46gDA/ThJCp7PJIZ1qTTQRRsoCx3sc=;
 b=KwEY6lptedto6Yd5BkSNxZPEy13m/0VxiRPbG2RhkCMo0sWeXChIOCmk24AGyNONF1
 0LG4LrttEQuSA1r4Pj08WSJPsIzcaYkfFzkJMn30ZoO959WRzzGqfvMXdXGZLDczFYkK
 ho0+0xJlT0Ld7bh3bQ/DC84gE/8vD/hgbKbCdDum2oBlj/ycktiNbb7cbqFMMFLpvzUQ
 EEStkxfLJ5V4bjKv/Gcssb7TPxFq6rbj/CVXndhd9Kd2U77381a7ir8CR3VD6jtoBxaA
 rgPqI1aZuuzSxMaTPYvhxmoXNs8mUXHWWhndRSSiPGzl17edNyQfUVKXZtWyLzAF2bK0
 LECg==
X-Gm-Message-State: AOAM530IqOKGv2DTGIM8Csdv6wxyDj6AUsgtKX+AQ3+uIaWix2tIZyCz
 S+T/dw6deh9d5GcnQkGPc78ngTXzvBwFvzeHfLSAQ2AfKuVUuyCPBxIjXsf2HIXWIhg1nLtL0bq
 SsbVA8bzWhVNzARA=
X-Received: by 2002:aa7:d547:: with SMTP id u7mr3493398edr.347.1614852954005; 
 Thu, 04 Mar 2021 02:15:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxX1uUJVlzMZKU11INnsQT7x7z5+LmOiXKJrwC2sibcDkXQWdAAPnfYcV6232xtZYyTQYlvhw==
X-Received: by 2002:aa7:d547:: with SMTP id u7mr3493382edr.347.1614852953772; 
 Thu, 04 Mar 2021 02:15:53 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id u16sm10484343edq.4.2021.03.04.02.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 02:15:53 -0800 (PST)
Date: Thu, 4 Mar 2021 11:15:51 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH] KVM: x86: do not fail if software breakpoint has already
 been removed
Message-ID: <20210304101551.dfwakttdq5zgt52h@steredhat>
References: <20210301111725.18434-1-pbonzini@redhat.com>
 <dd9b1ebe28be1df2a4b1715f60d451c0c6fb915f.camel@redhat.com>
 <20210302145211.lha24tib3dtg6qig@steredhat>
 <f15720be8e4982b21c4604db180a25cd41bcf824.camel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f15720be8e4982b21c4604db180a25cd41bcf824.camel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 03, 2021 at 02:07:24PM +0200, Maxim Levitsky wrote:
>On Tue, 2021-03-02 at 15:52 +0100, Stefano Garzarella wrote:
>> On Mon, Mar 01, 2021 at 02:56:40PM +0200, Maxim Levitsky wrote:
>> > On Mon, 2021-03-01 at 12:17 +0100, Paolo Bonzini wrote:
>> > > If kvm_arch_remove_sw_breakpoint finds that a software breakpoint does not
>> > > have an INT3 instruction, it fails.  This can happen if one sets a
>> > > software breakpoint in a kernel module and then reloads it.  gdb then
>> > > thinks the breakpoint cannot be deleted and there is no way to add it
>> > > back.
>> > >
>> > > Suggested-by: Maxim Levitsky <mlevitsk@redhat.com>
>> > > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> > > ---
>> > >  target/i386/kvm/kvm.c | 9 +++++++--
>> > >  1 file changed, 7 insertions(+), 2 deletions(-)
>> > >
>> > > diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
>> > > index 0b5755e42b..c8d61daf68 100644
>> > > --- a/target/i386/kvm/kvm.c
>> > > +++ b/target/i386/kvm/kvm.c
>> > > @@ -4352,8 +4352,13 @@ int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
>> > >  {
>> > >      uint8_t int3;
>> > >
>> > > -    if (cpu_memory_rw_debug(cs, bp->pc, &int3, 1, 0) || int3 != 0xcc ||
>> > > -        cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 1, 1)) {
>> > > +    if (cpu_memory_rw_debug(cs, bp->pc, &int3, 1, 0)) {
>> > > +        return -EINVAL;
>> > > +    }
>> > > +    if (int3 != 0xcc) {
>> > > +        return 0;
>> > > +    }
>> > > +    if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 1, 1)) {
>> > >          return -EINVAL;
>> > >      }
>> > >      return 0;
>> >
>> > There still remains a philosopical question if kvm_arch_remove_sw_breakpoint
>> > should always return 0, since for the usual case of kernel debugging where
>> > a breakpoint is in unloaded module, the above will probably still fail
>> > as paging for this module is removed as well by the kernel.
>> > It is still better though so:
>> >
>> > Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
>> >
>> > Note that I managed to make lx-symbols to work in a very stable way
>> > with attached WIP patch I hacked on this Sunday.
>> > I will send a cleaned up version of it to upstream when I have time.
>> >
>> > Since I make gdb unload the symbols, it works even without this patch.
>> >
>> > Added Stefano Garzarella to CC as I know that he tried to make this work as well.
>> > https://lkml.org/lkml/2020/10/5/514
>>
>> Thanks Maxim for CCing me!
>>
>> Just a report when I tried these patches, but I'm not sure they are
>> related.
>>
>> I found that gdb 10 has some problem with QEMU:
>>
>>      $ gdb --version
>>      GNU gdb (GDB) Fedora 10.1-2.fc33
>>
>>      (gdb) lx-symbols
>>      loading vmlinux
>>      scanning for modules in linux/build
>>      ../../gdb/dwarf2/frame.c:1085: internal-error: Unknown CFA rule.
>>
>> With gdb 9 'lx-symbols' works well, but I still have some issue when I
>> put a breakpoint to a symbol not yet loaded (vsock_core_register in this
>> example), then I load the module (vsock_loopback in this example) in the
>> guest.
>>
>> Whit your patch gdb stuck after loading the symbols of the first new
>> module:
>>      (gdb) b vsock_core_register
>>      Function "vsock_core_register" not defined.
>>      Make breakpoint pending on future shared library load? (y or [n]) y
>>      Breakpoint 1 (vsock_core_register) pending.
>>      (gdb) c
>>      Continuing.
>>      loading @0xffffffffc00a1000: linux/build/net/vmw_vsock/vsock.ko
>>
>> Without your patch, gdb loops infinitely reloading the new module:
>>      refreshing all symbols to reload module 'vsock'
>>      loading vmlinux
>>      loading @0xffffffffc00a1000: linux/build/net/vmw_vsock/vsock.ko
>>      loading @0xffffffffc00ad000: linux/build/drivers/net/tun.ko
>>      loading @0xffffffffc007e000: linux/build/net/bridge/bridge.ko
>>      loading @0xffffffffc0077000: linux/build/net/802/stp.ko
>>      loading @0xffffffffc0007000: linux/build/net/llc/llc.ko
>>      loading @0xffffffffc0013000: linux/build/net/sunrpc/sunrpc.ko
>>      loading @0xffffffffc000d000: linux/build/net/ipv4/netfilter/ip_tables.ko
>>      loading @0xffffffffc0000000: linux/build/net/netfilter/x_tables.ko
>>      refreshing all symbols to reload module 'vsock'
>>      loading vmlinux
>>      loading @0xffffffffc00a1000: linux/build/net/vmw_vsock/vsock.ko
>>      loading @0xffffffffc00ad000: linux/build/drivers/net/tun.ko
>>      ...
>>
>> I'll try to get a better look at what's going on.
>
>Let me then explain what I found:
>
>First of all initial execution of lx-symbols works and always worked for me
>(I use gdb 9 though from fedora 32 (9.1-7.fc32))
>
>
>Then a special breakpoint is placed on do_init_module
>(it is hidden from the user)
>
>Once it is hit two things can happen:
>
>1. if a not yet seen module is loaded,
>   (module that wasn't loaded last time all symbols were reloaded)
>   its symbols are loaded to gdb with 'add-symbol-file' command.
>
>2. if module that was already loaded to gdb, is loaded (see above),
> then 'big hammer' is used:
>
> a. all existing breakpoints (including the hidden one)
>    are disabled since reloading everything
>    indeed messes up the gdb state
>
> b. the executable's symbols (the kernel) are reloaded,
>    which makes gdb unload all symbols, and then all symbols are loaded
>    again (in the same way as lx-symbols works),
>    including the symbols of currently loading module.
>
> c. all breakpoints are enabled again
>
>
>Now the issue that you originally reported on LKML is because the (1)
>apparently also messes up the software breakpoints state in gdb,
>and that makes gdb to not to temporary remove the breakpoint
>in do_init_module once the execution is resumed, and then
>the guest starts executing garbage (bytes after 'int3' instruction).
>
>The second issue is that (2), aka the big hammer isn't really needed.
>GDB does have (maybe this is recent command?) a 'remove-symbol-file'
>command.
>
>So it is possible to do remove-symbol-file/add-symbol-file'
>on known module reload instead of reloading everything.
>
>But this has a small issue. The issue is that such known module
>was already reloaded, so all int3 instructions that gdb placed into
>it are already gone, so sofware breakpoints placed to it won't work
>This is what the patch that Paulo sent fixes.
>
>However it is even better to create another hidden breakpoint on module removal
>path (I used free_module for that) and unload the symbols there.
>This allows the gdb to cleanly remove all software breakpoints
>in that module, show them again as pending, and even re-install
>them again once the module is loaded again.
>
>So those are the two changes I made:
>
>1. I added a breakpoint on module removal which also does
>  a. disable all breakpoints
>  b. unload the module's symbols
>  c. enable all breakpoints
>
>2. On module load I also do
>  a. disable all breakpoints
>  b. load the module's symbols
>  c. enable all breakpoints
>
>
>There is still an issue that both 'load' and 'unload' breakpoint
>can hit more that once.
>This happens because these are software breakpoints and
>load/unload code in the kernel is executed with interrupts enabled.
>
>So what is happening is that once the hidden breakpoint is hit, gdb script
>attached to it is done, and VM is resumed, gdb does more or less this:
>
>a. remove the breakpoint
>b. do a single step
>c. re-install the breakpoint.
>
>However the single step more often than not, lands us into an interrupt
>handler, and so once the handler is finished we end up re-executing the
>instruction on which breakpoint was set.
>On a single vCPU it works more or less (with several tries) on my machine,
>but with many vCPUs, I can end up in live lock like state
>when the above prevents the VM from progressing.
>
>I think we can fix this on kvm side by not injecting interrupts
>when single step is done.

Thank you so much for this detailed description, very much appreciated!

>
>In fact the below patch works for me,
>Not only it fixes the live lock but makes these hidden breakpoints
>hit only once in my testing.
>
>diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
>index eec62c0dafc36..8b7a4e27bcf66 100644
>--- a/arch/x86/kvm/x86.c
>+++ b/arch/x86/kvm/x86.c
>@@ -8501,6 +8501,12 @@ static void inject_pending_event(struct kvm_vcpu *vcpu, bool *req_immediate_exit
>                        goto busy;
>        }
>
>+       /*
>+        * Don't inject interrupts while single stepping to make guest debug easier
>+        */
>+       if (vcpu->guest_debug & KVM_GUESTDBG_SINGLESTEP)
>+               can_inject = false;
>+
>
>With this patch lx-symbols works almost perfectly for me (on AMD).

I'll try this patch!

>
>The only remaing issue (that might be not easy to fix)
>is that I still can't place breakpoints in __init module code.
>That code is physically removed from the kernel once the module is done loading,
>and it seems that its debug info isn't correct to even make a hardware
>breakpoint work on it.
>(gdb shows very small addresses for these symbols).
>
>As for why this doesn't work for you I have 3 theories:
>
>1. The whole 'reload symbols on breakpoint' is forbidden
>by gdb in the manual, that is one of the reasons that I had
>to disable software breakpoints prior to doing this.
>There might be other things that break in different gdb versions.
>I don't see a way to make it work without doing this.

Maybe this can also be the reason why gdb 10 doesn't work for me.
I should investigate further.

>
>2. Maybe you test that on Intel and something is broken there
>   on KVM level (I tested only AMD).

Yes, I'm on Intel.

>
>3. Maybe you debug a nested guest? I haven't tested if guest debug
>works fine in this configuration.

Nope, I'm not debugging nested guest in that case.

Thanks for your help,
Stefano


