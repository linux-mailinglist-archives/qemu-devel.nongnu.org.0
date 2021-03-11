Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B79C033732C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 13:57:44 +0100 (CET)
Received: from localhost ([::1]:51954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKKsp-0007f6-Qx
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 07:57:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1lKKos-0004eg-C6
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:53:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1lKKop-00019U-2M
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:53:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615467213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=88qwKOZ4BrhZnTa+1dZzi1ZIgVcsOlTziM+L/JCtFZ4=;
 b=R1Y3duXXClf/hFSG17KNa3VF29BYLfMI6fef4yAHYWZfX/kY41WwwC+k36sfH2iG6UtGtr
 pXQMMZg/B2K5E50VrNuqc6H91kbyVzEL3ySWKiKzxhyGZQuIRzfSIeZllB+Uos5jzGaNqA
 3XnWm0edF4ZG4Vmp2/EZGd4MOksOu+c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-YC53HYmUM6KSdEvZZ5_pWg-1; Thu, 11 Mar 2021 07:53:18 -0500
X-MC-Unique: YC53HYmUM6KSdEvZZ5_pWg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C563F881D6B
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 12:53:17 +0000 (UTC)
Received: from starship (unknown [10.35.206.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83EF61001281;
 Thu, 11 Mar 2021 12:53:16 +0000 (UTC)
Message-ID: <d273d65ddff3ef75fa643c0270bb172056f4d8d8.camel@redhat.com>
Subject: Re: [PATCH] KVM: x86: do not fail if software breakpoint has
 already been removed
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Date: Thu, 11 Mar 2021 14:53:15 +0200
In-Reply-To: <20210304101551.dfwakttdq5zgt52h@steredhat>
References: <20210301111725.18434-1-pbonzini@redhat.com>
 <dd9b1ebe28be1df2a4b1715f60d451c0c6fb915f.camel@redhat.com>
 <20210302145211.lha24tib3dtg6qig@steredhat>
 <f15720be8e4982b21c4604db180a25cd41bcf824.camel@redhat.com>
 <20210304101551.dfwakttdq5zgt52h@steredhat>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="=-Zggg5BOaSsp6LRwdF1ba"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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

--=-Zggg5BOaSsp6LRwdF1ba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2021-03-04 at 11:15 +0100, Stefano Garzarella wrote:
> On Wed, Mar 03, 2021 at 02:07:24PM +0200, Maxim Levitsky wrote:
> > On Tue, 2021-03-02 at 15:52 +0100, Stefano Garzarella wrote:
> > > On Mon, Mar 01, 2021 at 02:56:40PM +0200, Maxim Levitsky wrote:
> > > > On Mon, 2021-03-01 at 12:17 +0100, Paolo Bonzini wrote:
> > > > > If kvm_arch_remove_sw_breakpoint finds that a software breakpoint does not
> > > > > have an INT3 instruction, it fails.  This can happen if one sets a
> > > > > software breakpoint in a kernel module and then reloads it.  gdb then
> > > > > thinks the breakpoint cannot be deleted and there is no way to add it
> > > > > back.
> > > > > 
> > > > > Suggested-by: Maxim Levitsky <mlevitsk@redhat.com>
> > > > > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > > > > ---
> > > > >  target/i386/kvm/kvm.c | 9 +++++++--
> > > > >  1 file changed, 7 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> > > > > index 0b5755e42b..c8d61daf68 100644
> > > > > --- a/target/i386/kvm/kvm.c
> > > > > +++ b/target/i386/kvm/kvm.c
> > > > > @@ -4352,8 +4352,13 @@ int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
> > > > >  {
> > > > >      uint8_t int3;
> > > > > 
> > > > > -    if (cpu_memory_rw_debug(cs, bp->pc, &int3, 1, 0) || int3 != 0xcc ||
> > > > > -        cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 1, 1)) {
> > > > > +    if (cpu_memory_rw_debug(cs, bp->pc, &int3, 1, 0)) {
> > > > > +        return -EINVAL;
> > > > > +    }
> > > > > +    if (int3 != 0xcc) {
> > > > > +        return 0;
> > > > > +    }
> > > > > +    if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 1, 1)) {
> > > > >          return -EINVAL;
> > > > >      }
> > > > >      return 0;
> > > > 
> > > > There still remains a philosopical question if kvm_arch_remove_sw_breakpoint
> > > > should always return 0, since for the usual case of kernel debugging where
> > > > a breakpoint is in unloaded module, the above will probably still fail
> > > > as paging for this module is removed as well by the kernel.
> > > > It is still better though so:
> > > > 
> > > > Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
> > > > 
> > > > Note that I managed to make lx-symbols to work in a very stable way
> > > > with attached WIP patch I hacked on this Sunday.
> > > > I will send a cleaned up version of it to upstream when I have time.
> > > > 
> > > > Since I make gdb unload the symbols, it works even without this patch.
> > > > 
> > > > Added Stefano Garzarella to CC as I know that he tried to make this work as well.
> > > > https://lkml.org/lkml/2020/10/5/514
> > > 
> > > Thanks Maxim for CCing me!
> > > 
> > > Just a report when I tried these patches, but I'm not sure they are
> > > related.
> > > 
> > > I found that gdb 10 has some problem with QEMU:
> > > 
> > >      $ gdb --version
> > >      GNU gdb (GDB) Fedora 10.1-2.fc33
> > > 
> > >      (gdb) lx-symbols
> > >      loading vmlinux
> > >      scanning for modules in linux/build
> > >      ../../gdb/dwarf2/frame.c:1085: internal-error: Unknown CFA rule.
> > > 
> > > With gdb 9 'lx-symbols' works well, but I still have some issue when I
> > > put a breakpoint to a symbol not yet loaded (vsock_core_register in this
> > > example), then I load the module (vsock_loopback in this example) in the
> > > guest.
> > > 
> > > Whit your patch gdb stuck after loading the symbols of the first new
> > > module:
> > >      (gdb) b vsock_core_register
> > >      Function "vsock_core_register" not defined.
> > >      Make breakpoint pending on future shared library load? (y or [n]) y
> > >      Breakpoint 1 (vsock_core_register) pending.
> > >      (gdb) c
> > >      Continuing.
> > >      loading @0xffffffffc00a1000: linux/build/net/vmw_vsock/vsock.ko
> > > 
> > > Without your patch, gdb loops infinitely reloading the new module:
> > >      refreshing all symbols to reload module 'vsock'
> > >      loading vmlinux
> > >      loading @0xffffffffc00a1000: linux/build/net/vmw_vsock/vsock.ko
> > >      loading @0xffffffffc00ad000: linux/build/drivers/net/tun.ko
> > >      loading @0xffffffffc007e000: linux/build/net/bridge/bridge.ko
> > >      loading @0xffffffffc0077000: linux/build/net/802/stp.ko
> > >      loading @0xffffffffc0007000: linux/build/net/llc/llc.ko
> > >      loading @0xffffffffc0013000: linux/build/net/sunrpc/sunrpc.ko
> > >      loading @0xffffffffc000d000: linux/build/net/ipv4/netfilter/ip_tables.ko
> > >      loading @0xffffffffc0000000: linux/build/net/netfilter/x_tables.ko
> > >      refreshing all symbols to reload module 'vsock'
> > >      loading vmlinux
> > >      loading @0xffffffffc00a1000: linux/build/net/vmw_vsock/vsock.ko
> > >      loading @0xffffffffc00ad000: linux/build/drivers/net/tun.ko
> > >      ...
> > > 
> > > I'll try to get a better look at what's going on.
> > 
> > Let me then explain what I found:
> > 
> > First of all initial execution of lx-symbols works and always worked for me
> > (I use gdb 9 though from fedora 32 (9.1-7.fc32))
> > 
> > 
> > Then a special breakpoint is placed on do_init_module
> > (it is hidden from the user)
> > 
> > Once it is hit two things can happen:
> > 
> > 1. if a not yet seen module is loaded,
> >   (module that wasn't loaded last time all symbols were reloaded)
> >   its symbols are loaded to gdb with 'add-symbol-file' command.
> > 
> > 2. if module that was already loaded to gdb, is loaded (see above),
> > then 'big hammer' is used:
> > 
> > a. all existing breakpoints (including the hidden one)
> >    are disabled since reloading everything
> >    indeed messes up the gdb state
> > 
> > b. the executable's symbols (the kernel) are reloaded,
> >    which makes gdb unload all symbols, and then all symbols are loaded
> >    again (in the same way as lx-symbols works),
> >    including the symbols of currently loading module.
> > 
> > c. all breakpoints are enabled again
> > 
> > 
> > Now the issue that you originally reported on LKML is because the (1)
> > apparently also messes up the software breakpoints state in gdb,
> > and that makes gdb to not to temporary remove the breakpoint
> > in do_init_module once the execution is resumed, and then
> > the guest starts executing garbage (bytes after 'int3' instruction).
> > 
> > The second issue is that (2), aka the big hammer isn't really needed.
> > GDB does have (maybe this is recent command?) a 'remove-symbol-file'
> > command.
> > 
> > So it is possible to do remove-symbol-file/add-symbol-file'
> > on known module reload instead of reloading everything.
> > 
> > But this has a small issue. The issue is that such known module
> > was already reloaded, so all int3 instructions that gdb placed into
> > it are already gone, so sofware breakpoints placed to it won't work
> > This is what the patch that Paulo sent fixes.
> > 
> > However it is even better to create another hidden breakpoint on module removal
> > path (I used free_module for that) and unload the symbols there.
> > This allows the gdb to cleanly remove all software breakpoints
> > in that module, show them again as pending, and even re-install
> > them again once the module is loaded again.
> > 
> > So those are the two changes I made:
> > 
> > 1. I added a breakpoint on module removal which also does
> >  a. disable all breakpoints
> >  b. unload the module's symbols
> >  c. enable all breakpoints
> > 
> > 2. On module load I also do
> >  a. disable all breakpoints
> >  b. load the module's symbols
> >  c. enable all breakpoints
> > 
> > 
> > There is still an issue that both 'load' and 'unload' breakpoint
> > can hit more that once.
> > This happens because these are software breakpoints and
> > load/unload code in the kernel is executed with interrupts enabled.
> > 
> > So what is happening is that once the hidden breakpoint is hit, gdb script
> > attached to it is done, and VM is resumed, gdb does more or less this:
> > 
> > a. remove the breakpoint
> > b. do a single step
> > c. re-install the breakpoint.
> > 
> > However the single step more often than not, lands us into an interrupt
> > handler, and so once the handler is finished we end up re-executing the
> > instruction on which breakpoint was set.
> > On a single vCPU it works more or less (with several tries) on my machine,
> > but with many vCPUs, I can end up in live lock like state
> > when the above prevents the VM from progressing.
> > 
> > I think we can fix this on kvm side by not injecting interrupts
> > when single step is done.
> 
> Thank you so much for this detailed description, very much appreciated!
> 
> > In fact the below patch works for me,
> > Not only it fixes the live lock but makes these hidden breakpoints
> > hit only once in my testing.
> > 
> > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > index eec62c0dafc36..8b7a4e27bcf66 100644
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
> > @@ -8501,6 +8501,12 @@ static void inject_pending_event(struct kvm_vcpu *vcpu, bool *req_immediate_exit
> >                        goto busy;
> >        }
> > 
> > +       /*
> > +        * Don't inject interrupts while single stepping to make guest debug easier
> > +        */
> > +       if (vcpu->guest_debug & KVM_GUESTDBG_SINGLESTEP)
> > +               can_inject = false;
> > +
> > 
> > With this patch lx-symbols works almost perfectly for me (on AMD).
> 
> I'll try this patch!

Note that the patch to disable interrupt injection while single
stepping is wrong, due to some whatever mistake I made while rebasing things.
I attached an updated version.

With it (and the patch to lx-symbols itself which should be applied to the guest kernel),
I was able to run lx-symbols very well on both intel and AMD.

Note that I compile the guest kernel in the guest and install, but then I copy it
to the host, and I run the gdb from there. This is my debug.sh script:


vm adm hmp "gdbserver tcp::2345"
gdb ~/Kernel/vm-fedora/src/vmlinux \
	-ex "target remote :2345" \
	-ex "cd /home/mlevitsk/Kernel/vm-fedora/src" \
	-ex "lx-symbols" \
	-ex "cont"

Note that the debug must start after guest kernel was loaded.

Best regards,
	Maxim Levitsky


> 
> > The only remaing issue (that might be not easy to fix)
> > is that I still can't place breakpoints in __init module code.
> > That code is physically removed from the kernel once the module is done loading,
> > and it seems that its debug info isn't correct to even make a hardware
> > breakpoint work on it.
> > (gdb shows very small addresses for these symbols).
> > 
> > As for why this doesn't work for you I have 3 theories:
> > 
> > 1. The whole 'reload symbols on breakpoint' is forbidden
> > by gdb in the manual, that is one of the reasons that I had
> > to disable software breakpoints prior to doing this.
> > There might be other things that break in different gdb versions.
> > I don't see a way to make it work without doing this.
> 
> Maybe this can also be the reason why gdb 10 doesn't work for me.
> I should investigate further.
> 
> > 2. Maybe you test that on Intel and something is broken there
> >   on KVM level (I tested only AMD).
> 
> Yes, I'm on Intel.
> 
> > 3. Maybe you debug a nested guest? I haven't tested if guest debug
> > works fine in this configuration.
> 
> Nope, I'm not debugging nested guest in that case.
> 
> Thanks for your help,
> Stefano
> 


--=-Zggg5BOaSsp6LRwdF1ba
Content-Disposition: attachment; filename="0001-gdb-rework-gdb-debug-script.patch"
Content-Type: text/x-patch; name="0001-gdb-rework-gdb-debug-script.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSBjMGZlMTkzNTVmNWM5OWJkOGQxZTZjNTM0NWZiMzJmMjU5YmU4MTMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXhpbSBMZXZpdHNreSA8bWxldml0c2tAcmVkaGF0LmNvbT4K
RGF0ZTogU3VuLCAyOCBGZWIgMjAyMSAyMzo1MjowOCArMDIwMApTdWJqZWN0OiBbUEFUQ0ggMS8y
XSBnZGI6IHJld29yayBnZGIgZGVidWcgc2NyaXB0CgpTaWduZWQtb2ZmLWJ5OiBNYXhpbSBMZXZp
dHNreSA8bWxldml0c2tAcmVkaGF0LmNvbT4KLS0tCiBzY3JpcHRzL2dkYi9saW51eC9zeW1ib2xz
LnB5IHwgOTYgKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgNzEgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc2Ny
aXB0cy9nZGIvbGludXgvc3ltYm9scy5weSBiL3NjcmlwdHMvZ2RiL2xpbnV4L3N5bWJvbHMucHkK
aW5kZXggMWJlOTc2M2NmOGJiMi4uMTNmMjFhZmMyMDU5ZCAxMDA2NDQKLS0tIGEvc2NyaXB0cy9n
ZGIvbGludXgvc3ltYm9scy5weQorKysgYi9zY3JpcHRzL2dkYi9saW51eC9zeW1ib2xzLnB5CkBA
IC0xNyw2ICsxNywyNCBAQCBpbXBvcnQgcmUKIAogZnJvbSBsaW51eCBpbXBvcnQgbW9kdWxlcywg
dXRpbHMKIAorZGVmIHNhdmVfc3RhdGUoKToKKyAgICAgICAgYnJlYWtwb2ludHMgPSBbXQorICAg
ICAgICBpZiBoYXNhdHRyKGdkYiwgJ2JyZWFrcG9pbnRzJykgYW5kIG5vdCBnZGIuYnJlYWtwb2lu
dHMoKSBpcyBOb25lOgorICAgICAgICAgICAgZm9yIGJwIGluIGdkYi5icmVha3BvaW50cygpOgor
ICAgICAgICAgICAgICAgIGJyZWFrcG9pbnRzLmFwcGVuZCh7J2JyZWFrcG9pbnQnOiBicCwgJ2Vu
YWJsZWQnOiBicC5lbmFibGVkfSkKKyAgICAgICAgICAgICAgICBicC5lbmFibGVkID0gRmFsc2UK
KworICAgICAgICBzaG93X3BhZ2luYXRpb24gPSBnZGIuZXhlY3V0ZSgic2hvdyBwYWdpbmF0aW9u
IiwgdG9fc3RyaW5nPVRydWUpCisgICAgICAgIHBhZ2luYXRpb24gPSBzaG93X3BhZ2luYXRpb24u
ZW5kc3dpdGgoIm9uLlxuIikKKyAgICAgICAgZ2RiLmV4ZWN1dGUoInNldCBwYWdpbmF0aW9uIG9m
ZiIpCisKKyAgICAgICAgcmV0dXJuIHsiYnJlYWtwb2ludHMiOmJyZWFrcG9pbnRzLCAic2hvd19w
YWdpbmF0aW9uIjogc2hvd19wYWdpbmF0aW9ufQorCitkZWYgbG9hZF9zdGF0ZShzdGF0ZSk6Cisg
ICAgZm9yIGJyZWFrcG9pbnQgaW4gc3RhdGVbImJyZWFrcG9pbnRzIl06CisgICAgICAgIGJyZWFr
cG9pbnRbJ2JyZWFrcG9pbnQnXS5lbmFibGVkID0gYnJlYWtwb2ludFsnZW5hYmxlZCddCisgICAg
Z2RiLmV4ZWN1dGUoInNldCBwYWdpbmF0aW9uICVzIiAlICgib24iIGlmIHN0YXRlWyJzaG93X3Bh
Z2luYXRpb24iXSBlbHNlICJvZmYiKSkKKwogCiBpZiBoYXNhdHRyKGdkYiwgJ0JyZWFrcG9pbnQn
KToKICAgICBjbGFzcyBMb2FkTW9kdWxlQnJlYWtwb2ludChnZGIuQnJlYWtwb2ludCk6CkBAIC0z
MCwyNiArNDgsMzggQEAgaWYgaGFzYXR0cihnZGIsICdCcmVha3BvaW50Jyk6CiAgICAgICAgICAg
ICBtb2R1bGVfbmFtZSA9IG1vZHVsZVsnbmFtZSddLnN0cmluZygpCiAgICAgICAgICAgICBjbWQg
PSBzZWxmLmdkYl9jb21tYW5kCiAKKyAgICAgICAgICAgICMgbW9kdWxlIGFscmVhZHkgbG9hZGVk
LCBmYWxzZSBhbGFybQorICAgICAgICAgICAgaWYgbW9kdWxlX25hbWUgaW4gY21kLmxvYWRlZF9t
b2R1bGVzOgorICAgICAgICAgICAgICAgIHJldHVybiBGYWxzZQorCiAgICAgICAgICAgICAjIGVu
Zm9yY2UgdXBkYXRlIGlmIG9iamVjdCBmaWxlIGlzIG5vdCBmb3VuZAogICAgICAgICAgICAgY21k
Lm1vZHVsZV9maWxlc191cGRhdGVkID0gRmFsc2UKIAogICAgICAgICAgICAgIyBEaXNhYmxlIHBh
Z2luYXRpb24gd2hpbGUgcmVwb3J0aW5nIHN5bWJvbCAocmUtKWxvYWRpbmcuCiAgICAgICAgICAg
ICAjIFRoZSBjb25zb2xlIGlucHV0IGlzIGJsb2NrZWQgaW4gdGhpcyBjb250ZXh0IHNvIHRoYXQg
d2Ugd291bGQKICAgICAgICAgICAgICMgZ2V0IHN0dWNrIHdhaXRpbmcgZm9yIHRoZSB1c2VyIHRv
IGFja25vd2xlZGdlIHBhZ2VkIG91dHB1dC4KLSAgICAgICAgICAgIHNob3dfcGFnaW5hdGlvbiA9
IGdkYi5leGVjdXRlKCJzaG93IHBhZ2luYXRpb24iLCB0b19zdHJpbmc9VHJ1ZSkKLSAgICAgICAg
ICAgIHBhZ2luYXRpb24gPSBzaG93X3BhZ2luYXRpb24uZW5kc3dpdGgoIm9uLlxuIikKLSAgICAg
ICAgICAgIGdkYi5leGVjdXRlKCJzZXQgcGFnaW5hdGlvbiBvZmYiKQorICAgICAgICAgICAgc3Rh
dGUgPSBzYXZlX3N0YXRlKCkKKyAgICAgICAgICAgIGNtZC5sb2FkX21vZHVsZV9zeW1ib2xzKG1v
ZHVsZSkKKyAgICAgICAgICAgIGxvYWRfc3RhdGUoc3RhdGUpCisgICAgICAgICAgICByZXR1cm4g
RmFsc2UKIAotICAgICAgICAgICAgaWYgbW9kdWxlX25hbWUgaW4gY21kLmxvYWRlZF9tb2R1bGVz
OgotICAgICAgICAgICAgICAgIGdkYi53cml0ZSgicmVmcmVzaGluZyBhbGwgc3ltYm9scyB0byBy
ZWxvYWQgbW9kdWxlICIKLSAgICAgICAgICAgICAgICAgICAgICAgICAgIid7MH0nXG4iLmZvcm1h
dChtb2R1bGVfbmFtZSkpCi0gICAgICAgICAgICAgICAgY21kLmxvYWRfYWxsX3N5bWJvbHMoKQot
ICAgICAgICAgICAgZWxzZToKLSAgICAgICAgICAgICAgICBjbWQubG9hZF9tb2R1bGVfc3ltYm9s
cyhtb2R1bGUpCisgICAgY2xhc3MgVW5Mb2FkTW9kdWxlQnJlYWtwb2ludChnZGIuQnJlYWtwb2lu
dCk6CisgICAgICAgIGRlZiBfX2luaXRfXyhzZWxmLCBzcGVjLCBnZGJfY29tbWFuZCk6CisgICAg
ICAgICAgICBzdXBlcihVbkxvYWRNb2R1bGVCcmVha3BvaW50LCBzZWxmKS5fX2luaXRfXyhzcGVj
LCBpbnRlcm5hbD1UcnVlKQorICAgICAgICAgICAgc2VsZi5zaWxlbnQgPSBUcnVlCisgICAgICAg
ICAgICBzZWxmLmdkYl9jb21tYW5kID0gZ2RiX2NvbW1hbmQKIAotICAgICAgICAgICAgIyByZXN0
b3JlIHBhZ2luYXRpb24gc3RhdGUKLSAgICAgICAgICAgIGdkYi5leGVjdXRlKCJzZXQgcGFnaW5h
dGlvbiAlcyIgJSAoIm9uIiBpZiBwYWdpbmF0aW9uIGVsc2UgIm9mZiIpKQorICAgICAgICBkZWYg
c3RvcChzZWxmKToKKyAgICAgICAgICAgIG1vZHVsZSA9IGdkYi5wYXJzZV9hbmRfZXZhbCgibW9k
IikKKyAgICAgICAgICAgIG1vZHVsZV9uYW1lID0gbW9kdWxlWyduYW1lJ10uc3RyaW5nKCkKKyAg
ICAgICAgICAgIGNtZCA9IHNlbGYuZ2RiX2NvbW1hbmQKIAorICAgICAgICAgICAgaWYgbm90IG1v
ZHVsZV9uYW1lIGluIGNtZC5sb2FkZWRfbW9kdWxlczoKKyAgICAgICAgICAgICAgICByZXR1cm4g
RmFsc2UKKworICAgICAgICAgICAgc3RhdGUgPSBzYXZlX3N0YXRlKCkKKyAgICAgICAgICAgIGNt
ZC51bmxvYWRfbW9kdWxlX3N5bWJvbHMobW9kdWxlKQorICAgICAgICAgICAgbG9hZF9zdGF0ZShz
dGF0ZSkKICAgICAgICAgICAgIHJldHVybiBGYWxzZQogCiAKQEAgLTY0LDggKzk0LDkgQEAgbHgt
c3ltYm9scyBjb21tYW5kLiIiIgogICAgIG1vZHVsZV9wYXRocyA9IFtdCiAgICAgbW9kdWxlX2Zp
bGVzID0gW10KICAgICBtb2R1bGVfZmlsZXNfdXBkYXRlZCA9IEZhbHNlCi0gICAgbG9hZGVkX21v
ZHVsZXMgPSBbXQorICAgIGxvYWRlZF9tb2R1bGVzID0ge30KICAgICBicmVha3BvaW50ID0gTm9u
ZQorICAgIHVicmVha3BvaW50ID0gTm9uZQogCiAgICAgZGVmIF9faW5pdF9fKHNlbGYpOgogICAg
ICAgICBzdXBlcihMeFN5bWJvbHMsIHNlbGYpLl9faW5pdF9fKCJseC1zeW1ib2xzIiwgZ2RiLkNP
TU1BTkRfRklMRVMsCkBAIC0xMjksMjEgKzE2MCwzMiBAQCBseC1zeW1ib2xzIGNvbW1hbmQuIiIi
CiAgICAgICAgICAgICAgICAgZmlsZW5hbWU9bW9kdWxlX2ZpbGUsCiAgICAgICAgICAgICAgICAg
YWRkcj1tb2R1bGVfYWRkciwKICAgICAgICAgICAgICAgICBzZWN0aW9ucz1zZWxmLl9zZWN0aW9u
X2FyZ3VtZW50cyhtb2R1bGUpKQorCiAgICAgICAgICAgICBnZGIuZXhlY3V0ZShjbWRsaW5lLCB0
b19zdHJpbmc9VHJ1ZSkKLSAgICAgICAgICAgIGlmIG1vZHVsZV9uYW1lIG5vdCBpbiBzZWxmLmxv
YWRlZF9tb2R1bGVzOgotICAgICAgICAgICAgICAgIHNlbGYubG9hZGVkX21vZHVsZXMuYXBwZW5k
KG1vZHVsZV9uYW1lKQorICAgICAgICAgICAgc2VsZi5sb2FkZWRfbW9kdWxlc1ttb2R1bGVfbmFt
ZV0gPSB7Im1vZHVsZV9maWxlIjogbW9kdWxlX2ZpbGUsCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAibW9kdWxlX2FkZHIiOiBtb2R1bGVfYWRkcn0KICAg
ICAgICAgZWxzZToKICAgICAgICAgICAgIGdkYi53cml0ZSgibm8gbW9kdWxlIG9iamVjdCBmb3Vu
ZCBmb3IgJ3swfSdcbiIuZm9ybWF0KG1vZHVsZV9uYW1lKSkKIAorICAgIGRlZiB1bmxvYWRfbW9k
dWxlX3N5bWJvbHMoc2VsZiwgbW9kdWxlKToKKyAgICAgICAgbW9kdWxlX25hbWUgPSBtb2R1bGVb
J25hbWUnXS5zdHJpbmcoKQorCisgICAgICAgIG1vZHVsZV9maWxlID0gc2VsZi5sb2FkZWRfbW9k
dWxlc1ttb2R1bGVfbmFtZV1bIm1vZHVsZV9maWxlIl0KKyAgICAgICAgbW9kdWxlX2FkZHIgPSBz
ZWxmLmxvYWRlZF9tb2R1bGVzW21vZHVsZV9uYW1lXVsibW9kdWxlX2FkZHIiXQorCisgICAgICAg
IGdkYi53cml0ZSgidW5sb2FkaW5nIEB7YWRkcn06IHtmaWxlbmFtZX1cbiIuZm9ybWF0KAorICAg
ICAgICAgICAgYWRkcj1tb2R1bGVfYWRkciwgZmlsZW5hbWU9bW9kdWxlX2ZpbGUpKQorICAgICAg
ICBjbWRsaW5lID0gInJlbW92ZS1zeW1ib2wtZmlsZSB7ZmlsZW5hbWV9Ii5mb3JtYXQoCisgICAg
ICAgICAgICBmaWxlbmFtZT1tb2R1bGVfZmlsZSkKKworICAgICAgICBnZGIuZXhlY3V0ZShjbWRs
aW5lLCB0b19zdHJpbmc9VHJ1ZSkKKyAgICAgICAgZGVsIHNlbGYubG9hZGVkX21vZHVsZXNbbW9k
dWxlX25hbWVdCisKKwogICAgIGRlZiBsb2FkX2FsbF9zeW1ib2xzKHNlbGYpOgogICAgICAgICBn
ZGIud3JpdGUoImxvYWRpbmcgdm1saW51eFxuIikKIAotICAgICAgICAjIERyb3BwaW5nIHN5bWJv
bHMgd2lsbCBkaXNhYmxlIGFsbCBicmVha3BvaW50cy4gU28gc2F2ZSB0aGVpciBzdGF0ZXMKLSAg
ICAgICAgIyBhbmQgcmVzdG9yZSB0aGVtIGFmdGVyd2FyZC4KLSAgICAgICAgc2F2ZWRfc3RhdGVz
ID0gW10KLSAgICAgICAgaWYgaGFzYXR0cihnZGIsICdicmVha3BvaW50cycpIGFuZCBub3QgZ2Ri
LmJyZWFrcG9pbnRzKCkgaXMgTm9uZToKLSAgICAgICAgICAgIGZvciBicCBpbiBnZGIuYnJlYWtw
b2ludHMoKToKLSAgICAgICAgICAgICAgICBzYXZlZF9zdGF0ZXMuYXBwZW5kKHsnYnJlYWtwb2lu
dCc6IGJwLCAnZW5hYmxlZCc6IGJwLmVuYWJsZWR9KQorICAgICAgICBzdGF0ZSA9IHNhdmVfc3Rh
dGUoKQogCiAgICAgICAgICMgZHJvcCBhbGwgY3VycmVudCBzeW1ib2xzIGFuZCByZWxvYWQgdm1s
aW51eAogICAgICAgICBvcmlnX3ZtbGludXggPSAndm1saW51eCcKQEAgLTE1MywxNSArMTk1LDE0
IEBAIGx4LXN5bWJvbHMgY29tbWFuZC4iIiIKICAgICAgICAgZ2RiLmV4ZWN1dGUoInN5bWJvbC1m
aWxlIiwgdG9fc3RyaW5nPVRydWUpCiAgICAgICAgIGdkYi5leGVjdXRlKCJzeW1ib2wtZmlsZSB7
MH0iLmZvcm1hdChvcmlnX3ZtbGludXgpKQogCi0gICAgICAgIHNlbGYubG9hZGVkX21vZHVsZXMg
PSBbXQorICAgICAgICBzZWxmLmxvYWRlZF9tb2R1bGVzID0ge30KICAgICAgICAgbW9kdWxlX2xp
c3QgPSBtb2R1bGVzLm1vZHVsZV9saXN0KCkKICAgICAgICAgaWYgbm90IG1vZHVsZV9saXN0Ogog
ICAgICAgICAgICAgZ2RiLndyaXRlKCJubyBtb2R1bGVzIGZvdW5kXG4iKQogICAgICAgICBlbHNl
OgogICAgICAgICAgICAgW3NlbGYubG9hZF9tb2R1bGVfc3ltYm9scyhtb2R1bGUpIGZvciBtb2R1
bGUgaW4gbW9kdWxlX2xpc3RdCiAKLSAgICAgICAgZm9yIHNhdmVkX3N0YXRlIGluIHNhdmVkX3N0
YXRlczoKLSAgICAgICAgICAgIHNhdmVkX3N0YXRlWydicmVha3BvaW50J10uZW5hYmxlZCA9IHNh
dmVkX3N0YXRlWydlbmFibGVkJ10KKyAgICAgICAgbG9hZF9zdGF0ZShzdGF0ZSkKIAogICAgIGRl
ZiBpbnZva2Uoc2VsZiwgYXJnLCBmcm9tX3R0eSk6CiAgICAgICAgIHNlbGYubW9kdWxlX3BhdGhz
ID0gW29zLnBhdGguZXhwYW5kdXNlcihwKSBmb3IgcCBpbiBhcmcuc3BsaXQoKV0KQEAgLTE3Nyw4
ICsyMTgsMTMgQEAgbHgtc3ltYm9scyBjb21tYW5kLiIiIgogICAgICAgICAgICAgaWYgc2VsZi5i
cmVha3BvaW50IGlzIG5vdCBOb25lOgogICAgICAgICAgICAgICAgIHNlbGYuYnJlYWtwb2ludC5k
ZWxldGUoKQogICAgICAgICAgICAgICAgIHNlbGYuYnJlYWtwb2ludCA9IE5vbmUKLSAgICAgICAg
ICAgIHNlbGYuYnJlYWtwb2ludCA9IExvYWRNb2R1bGVCcmVha3BvaW50KAotICAgICAgICAgICAg
ICAgICJrZXJuZWwvbW9kdWxlLmM6ZG9faW5pdF9tb2R1bGUiLCBzZWxmKQorICAgICAgICAgICAg
c2VsZi5icmVha3BvaW50ID0gTG9hZE1vZHVsZUJyZWFrcG9pbnQoImtlcm5lbC9tb2R1bGUuYzpk
b19pbml0X21vZHVsZSIsIHNlbGYpCisKKyAgICAgICAgICAgIGlmIHNlbGYudWJyZWFrcG9pbnQg
aXMgbm90IE5vbmU6CisgICAgICAgICAgICAgICAgc2VsZi51YnJlYWtwb2ludC5kZWxldGUoKQor
ICAgICAgICAgICAgICAgIHNlbGYudWJyZWFrcG9pbnQgPSBOb25lCisgICAgICAgICAgICBzZWxm
LnVicmVha3BvaW50ID0gVW5Mb2FkTW9kdWxlQnJlYWtwb2ludCgia2VybmVsL21vZHVsZS5jOmZy
ZWVfbW9kdWxlIiwgc2VsZikKKwogICAgICAgICBlbHNlOgogICAgICAgICAgICAgZ2RiLndyaXRl
KCJOb3RlOiBzeW1ib2wgdXBkYXRlIG9uIG1vZHVsZSBsb2FkaW5nIG5vdCBzdXBwb3J0ZWQgIgog
ICAgICAgICAgICAgICAgICAgICAgICJ3aXRoIHRoaXMgZ2RiIHZlcnNpb25cbiIpCi0tIAoyLjI2
LjIKCg==
--=-Zggg5BOaSsp6LRwdF1ba
Content-Disposition: attachment;
	filename*0=0002-KVM-x86-Guest-debug-don-t-inject-interrupts-while-si.pat;
	filename*1=ch
Content-Type: text/x-patch;
	name="0002-KVM-x86-Guest-debug-don-t-inject-interrupts-while-si.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSA4NjE5ZjdjODM2MTU2YjU3MDRjMzJhY2E3Yjc4MDhlZjM0NDk4OWMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXhpbSBMZXZpdHNreSA8bWxldml0c2tAcmVkaGF0LmNvbT4K
RGF0ZTogV2VkLCAzIE1hciAyMDIxIDEzOjA1OjM0ICswMjAwClN1YmplY3Q6IFtQQVRDSCAyLzJd
IEtWTTogeDg2OiBHdWVzdCBkZWJ1ZzogZG9uJ3QgaW5qZWN0IGludGVycnVwdHMgd2hpbGUKIHNp
bmdsZSBzdGVwcGluZwoKU2lnbmVkLW9mZi1ieTogTWF4aW0gTGV2aXRza3kgPG1sZXZpdHNrQHJl
ZGhhdC5jb20+Ci0tLQogYXJjaC94ODYva3ZtL3g4Ni5jIHwgNiArKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0veDg2LmMgYi9h
cmNoL3g4Ni9rdm0veDg2LmMKaW5kZXggYjE0MGZjZTgyOTI4Ni4uYWIzYTU5ODUyMGZmNCAxMDA2
NDQKLS0tIGEvYXJjaC94ODYva3ZtL3g4Ni5jCisrKyBiL2FyY2gveDg2L2t2bS94ODYuYwpAQCAt
ODU0Miw2ICs4NTQyLDEyIEBAIHN0YXRpYyB2b2lkIGluamVjdF9wZW5kaW5nX2V2ZW50KHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSwgYm9vbCAqcmVxX2ltbWVkaWF0ZV9leGl0CiAJCQlnb3RvIGJ1c3k7
CiAJfQogCisJLyoKKwkgKiBEb24ndCBpbmplY3QgaW50ZXJydXB0cyB3aGlsZSBzaW5nbGUgc3Rl
cHBpbmcgdG8gbWFrZSBndWVzdCBkZWJ1ZyBlYXNpZXIKKwkgKi8KKwlpZiAodmNwdS0+Z3Vlc3Rf
ZGVidWcgJiBLVk1fR1VFU1REQkdfU0lOR0xFU1RFUCkKKwkJcmV0dXJuOworCiAJLyoKIAkgKiBG
aW5hbGx5LCBpbmplY3QgaW50ZXJydXB0IGV2ZW50cy4gIElmIGFuIGV2ZW50IGNhbm5vdCBiZSBp
bmplY3RlZAogCSAqIGR1ZSB0byBhcmNoaXRlY3R1cmFsIGNvbmRpdGlvbnMgKGUuZy4gSUY9MCkg
YSB3aW5kb3ctb3BlbiBleGl0Ci0tIAoyLjI2LjIKCg==
--=-Zggg5BOaSsp6LRwdF1ba--


