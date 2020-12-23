Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EB22E1D9E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 15:55:55 +0100 (CET)
Received: from localhost ([::1]:36390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ks5YP-0006jQ-V4
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 09:55:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ks5X2-0006Ir-IS
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 09:54:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ks5Wx-0005Aa-3c
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 09:54:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608735261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qj41B5mb8d3n7qKLuyI59p0D8Pvhu8npRLC2Ves8xIg=;
 b=LDJqYobmXwEb0FvH89wV5z9Vdk3bCsXOdaiUf+AwmM0txvql331YsbFt5Vm5rsnFjY7k42
 0IvMsWhTxI6R8Wzobhy94j0y1vtReFGkdRpj1q6Yqb5lOkDYGCz2RJKu0QzUXwR5vWx/xY
 x8plV5bIAA1SLHrTFQjjlgaNuSMVWOk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-VW3xk_EhNE-Lx6Am5fXdTw-1; Wed, 23 Dec 2020 09:54:17 -0500
X-MC-Unique: VW3xk_EhNE-Lx6Am5fXdTw-1
Received: by mail-wr1-f70.google.com with SMTP id r11so12574599wrs.23
 for <qemu-devel@nongnu.org>; Wed, 23 Dec 2020 06:54:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qj41B5mb8d3n7qKLuyI59p0D8Pvhu8npRLC2Ves8xIg=;
 b=tJPhasz95cKsEOGjyj29hg6/LhOCZzD+kXOxFNMFGlvhVayCtm9Ci/EIpePHCGZcTT
 ovIxcvIxVUXedY0WnEG4eCmd2p+zApVsnPqrR8Y0b6sQz2lcbvfats/22+ZgSVEupgo3
 jJ96E7g/wIVY6FtIf50E6/P+Brz3QuGVVJi45rwz2HCxBU42lwMW1+ZCUHnA/nZeMIYF
 3ZSRYBk+tw2vJRnKx8rt47Jsis6JPT4J3ZSA5jrHTVzXvZOjRRckVxjPVcuUdysbj2XV
 CJY7zGfZwBR01o71wRfXaSSyYM2fw0fjxtQsvrINbSfDHDPDyQM0xPCjqEO7EdDDQu9M
 Jltg==
X-Gm-Message-State: AOAM531whLVqhMlabTEs9VFwdvg5QaBsKO//7j2aA5dE9W3NJofeoIjV
 S+NlajK+BGN05wI4eXHnwL7kMOleWDSQv2oC30E0hwwg1mT9TtUN/svEdlyu/5m+VGAA8uidfMI
 nSwqdO5hwIpDFhOY=
X-Received: by 2002:adf:eec7:: with SMTP id a7mr30012861wrp.45.1608735255274; 
 Wed, 23 Dec 2020 06:54:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5ytgf/th1zNw4xDy8U3PNRUTK1yWrprdD19UFtkStENpkMMr20lTL1dYPtrjz5OlqZC6A+w==
X-Received: by 2002:adf:eec7:: with SMTP id a7mr30012836wrp.45.1608735254944; 
 Wed, 23 Dec 2020 06:54:14 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id z63sm93979wme.8.2020.12.23.06.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Dec 2020 06:54:14 -0800 (PST)
Date: Wed, 23 Dec 2020 15:54:11 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: scripts/gdb: issues when loading modules after lx-symbols
Message-ID: <CAGxU2F402ZZXQPXO9B8VU16SjcWu64cG79rXBoUrXQad=f2k5A@mail.gmail.com>
References: <CAGxU2F7+Tf+hJxxadT_Rw01O43RU9RsasJiVLpukbhvo1w++fA@mail.gmail.com>
 <9e247182-2cc3-9fac-e12e-9743ef24ec43@siemens.com>
 <20201005081451.ajtm6rctimrg5frr@steredhat>
 <0b862e95-c2a7-ad00-5f57-8d958e4af20c@siemens.com>
 <20201005092953.zu7pn2lveo3j2w4s@steredhat>
 <1aef313c-e399-0f56-17a7-f73c9a189200@siemens.com>
 <20201005110517.s42jo7mvagpzti6b@steredhat>
 <f77ff95a-1c63-3243-af3a-d37aeca1f788@siemens.com>
 <20201005130326.ihis6aj62ejdjz5n@steredhat>
MIME-Version: 1.0
In-Reply-To: <20201005130326.ihis6aj62ejdjz5n@steredhat>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu devel list <qemu-devel@nongnu.org>,
 kernel list <linux-kernel@vger.kernel.org>, kvm <kvm@vger.kernel.org>,
 Kieran Bingham <kbingham@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 5, 2020 at 3:03 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
> On Mon, Oct 05, 2020 at 01:48:35PM +0200, Jan Kiszka wrote:
> > On 05.10.20 13:05, Stefano Garzarella wrote:
> > > On Mon, Oct 05, 2020 at 11:45:41AM +0200, Jan Kiszka wrote:
> > >> On 05.10.20 11:29, Stefano Garzarella wrote:
> > >>> On Mon, Oct 05, 2020 at 10:33:30AM +0200, Jan Kiszka wrote:
> > >>>> On 05.10.20 10:14, Stefano Garzarella wrote:
> > >>>>> On Sun, Oct 04, 2020 at 08:52:37PM +0200, Jan Kiszka wrote:
> > >>>>>> On 01.10.20 16:31, Stefano Garzarella wrote:
> > >>>>>>> Hi,
> > >>>>>>> I had some issues with gdb scripts and kernel modules in Linux 5.9-rc7.
> > >>>>>>>
> > >>>>>>> If the modules are already loaded, and I do 'lx-symbols', all work fine.
> > >>>>>>> But, if I load a kernel module after 'lx-symbols', I had this issue:
> > >>>>>>>
> > >>>>>>> [ 5093.393940] invalid opcode: 0000 [#1] SMP PTI
> > >>>>>>> [ 5093.395134] CPU: 0 PID: 576 Comm: modprobe Not tainted 5.9.0-rc7-ste-00010-gf0b671d9608d-dirty #2
> > >>>>>>> [ 5093.397566] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.13.0-2.fc32 04/01/2014
> > >>>>>>> [ 5093.400761] RIP: 0010:do_init_module+0x1/0x270
> > >>>>>>> [ 5093.402553] Code: ff ff e9 cf fe ff ff 0f 0b 49 c7 c4 f2 ff ff ff e9 c1 fe ff ff e8 5f b2 65 00 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 cc <1f> 44 00 00 55 ba 10 00 00 00 be c0 0c 00 00 48 89 e5 41 56 41 55
> > >>>>>>> [ 5093.409505] RSP: 0018:ffffc90000563d18 EFLAGS: 00010246
> > >>>>>>> [ 5093.412056] RAX: 0000000000000000 RBX: ffffffffc010a0c0 RCX: 0000000000004ee3
> > >>>>>>> [ 5093.414472] RDX: 0000000000004ee2 RSI: ffffea0001efe188 RDI: ffffffffc010a0c0
> > >>>>>>> [ 5093.416349] RBP: ffffc90000563e50 R08: 0000000000000000 R09: 0000000000000002
> > >>>>>>> [ 5093.418044] R10: 0000000000000096 R11: 00000000000008a4 R12: ffff88807a0d1280
> > >>>>>>> [ 5093.424721] R13: ffffffffc010a110 R14: ffff88807a0d1300 R15: ffffc90000563e70
> > >>>>>>> [ 5093.427138] FS:  00007f018f632740(0000) GS:ffff88807dc00000(0000) knlGS:0000000000000000
> > >>>>>>> [ 5093.430037] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > >>>>>>> [ 5093.432279] CR2: 000055fbe282b239 CR3: 000000007922a006 CR4: 0000000000170ef0
> > >>>>>>> [ 5093.435096] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > >>>>>>> [ 5093.436765] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > >>>>>>> [ 5093.439689] Call Trace:
> > >>>>>>> [ 5093.440954]  ? load_module+0x24b6/0x27d0
> > >>>>>>> [ 5093.443212]  ? __kernel_read+0xd6/0x150
> > >>>>>>> [ 5093.445140]  __do_sys_finit_module+0xd3/0xf0
> > >>>>>>> [ 5093.446877]  __x64_sys_finit_module+0x1a/0x20
> > >>>>>>> [ 5093.449098]  do_syscall_64+0x38/0x50
> > >>>>>>> [ 5093.450877]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> > >>>>>>> [ 5093.456153] RIP: 0033:0x7f018f75c43d
> > >>>>>>> [ 5093.457728] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 2b 6a 0c 00 f7 d8 64 89 01 48
> > >>>>>>> [ 5093.466349] RSP: 002b:00007ffd7f080368 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> > >>>>>>> [ 5093.470613] RAX: ffffffffffffffda RBX: 0000557e5c96f9c0 RCX: 00007f018f75c43d
> > >>>>>>> [ 5093.474747] RDX: 0000000000000000 RSI: 0000557e5c964288 RDI: 0000000000000003
> > >>>>>>> [ 5093.478049] RBP: 0000000000040000 R08: 0000000000000000 R09: 0000000000000000
> > >>>>>>> [ 5093.481298] R10: 0000000000000003 R11: 0000000000000246 R12: 0000000000000000
> > >>>>>>> [ 5093.483725] R13: 0000557e5c964288 R14: 0000557e5c96f950 R15: 0000557e5c9775c0
> > >>>>>>> [ 5093.485778] Modules linked in: virtio_vdpa(+) vdpa sunrpc kvm_intel kvm irqbypass virtio_blk virtio_rng rng_core [last unloaded: virtio_vdpa]
> > >>>>>>> [ 5093.488695] ---[ end trace 23712ecebc11f53c ]---
> > >>>>>>>
> > >>>>>>> Guest kernel: Linux 5.9-rc7
> > >>>>>>> gdb: GNU gdb (GDB) Fedora 9.1-6.fc32
> > >>>>>>> I tried with QEMU 4.2.1 and the latest master branch: same issue.
> > >>>>>>>
> > >>>>>>>
> > >>>>>>> I did some digging, and skipping the gdb 'add-symbol-file' command in symbol.py
> > >>>>>>> avoid the issue, but of course I don't have the symbols loaded:
> > >>>>>>>
> > >>>>>>>     diff --git a/scripts/gdb/linux/symbols.py b/scripts/gdb/linux/symbols.py
> > >>>>>>>     index 1be9763cf8bb..eadfaa4d4907 100644
> > >>>>>>>     --- a/scripts/gdb/linux/symbols.py
> > >>>>>>>     +++ b/scripts/gdb/linux/symbols.py
> > >>>>>>>     @@ -129,7 +129,7 @@ lx-symbols command."""
> > >>>>>>>                      filename=module_file,
> > >>>>>>>                      addr=module_addr,
> > >>>>>>>                      sections=self._section_arguments(module))
> > >>>>>>>     -            gdb.execute(cmdline, to_string=True)
> > >>>>>>>     +            #gdb.execute(cmdline, to_string=True)
> > >>>>>>>                  if module_name not in self.loaded_modules:
> > >>>>>>>                      self.loaded_modules.append(module_name)
> > >>>>>>>              else:
> > >>>>>>>
> > >>>>>>> I tried several modules and this happens every time after '(gdb) lx-symbols'.
> > >>>>>>>
> > >>>>>>> Do you have any hints?
> > >>>>>>>
> > >>>>>> I assume you are debugging a kernel inside QEMU/KVM, right?
> > >>>>>
> > >>>>> Right!
> > >>>>>
> > >>>>>>                                                             Does it work
> > >>>>>> without -enable-kvm?
> > >>>>>
> > >>>>> Yes, disabling kvm it works.
> > >>>>>
> > >>>>
> > >>>> OK, there it is, still...
> > >>>> What may also "work" is going down to single core.
> > >>>
> > >>> No, I tried with single core and kvm enabled and I have the same issue.
> > >>>
> > >>>>
> > >>>>>>
> > >>>>>> Debugging guests in KVM mode at least was unstable for a long time. I
> > >>>>>> avoided setting soft-BPs - which is what the script does for the sake of
> > >>>>>> tracking modules loading -, falling back to hw-BPs, as I had no time to
> > >>>>>> debug that further. /Maybe/ that's the issue here.
> > >>>>>
> > >>>>> Thanks for the suggestion, I'll try to have a look.
> > >>>>>
> > >>>>
> > >>>> Would be great if this issue could finally be resolved. And then covered
> > >>>> by the kvm-unit tests. Those still succeed, I think.
> > >>>
> > >>> Yeah, I'm a bit busy, but I'll try to find a fix.
> > >>>
> > >>> Just an update, I tried to follow your suggestion using hw-BPs, but
> > >>> unfortunately the gdb python module doesn't provide an easy way to set
> > >>> them, so I hacked a bit gdb forcing hw-BPs and with this patch applied
> > >>> to gdb I don't see the issue anymore:
> > >>>
> > >>> diff --git a/gdb/python/py-breakpoint.c b/gdb/python/py-breakpoint.c
> > >>> index 7369c91ad9..df8ec92049 100644
> > >>> --- a/gdb/python/py-breakpoint.c
> > >>> +++ b/gdb/python/py-breakpoint.c
> > >>> @@ -57,7 +57,7 @@ struct pybp_code
> > >>>  static struct pybp_code pybp_codes[] =
> > >>>  {
> > >>>    { "BP_NONE", bp_none},
> > >>> -  { "BP_BREAKPOINT", bp_breakpoint},
> > >>> +  { "BP_BREAKPOINT", bp_hardware_breakpoint},
> > >>>    { "BP_WATCHPOINT", bp_watchpoint},
> > >>>    { "BP_HARDWARE_WATCHPOINT", bp_hardware_watchpoint},
> > >>>    { "BP_READ_WATCHPOINT", bp_read_watchpoint},
> > >>> @@ -383,7 +383,7 @@ bppy_get_location (PyObject *self, void *closure)
> > >>>
> > >>>    BPPY_REQUIRE_VALID (obj);
> > >>>
> > >>> -  if (obj->bp->type != bp_breakpoint)
> > >>> +  if (obj->bp->type != bp_hardware_breakpoint)
> > >>>      Py_RETURN_NONE;
> > >>>
> > >>>    const char *str = event_location_to_string (obj->bp->location.get ());
> > >>> @@ -730,7 +730,7 @@ bppy_init (PyObject *self, PyObject *args, PyObject *kwargs)
> > >>>                                     "temporary","source", "function",
> > >>>                                     "label", "line", "qualified", NULL };
> > >>>    const char *spec = NULL;
> > >>> -  enum bptype type = bp_breakpoint;
> > >>> +  enum bptype type = bp_hardware_breakpoint;
> > >>>    int access_type = hw_write;
> > >>>    PyObject *internal = NULL;
> > >>>    PyObject *temporary = NULL;
> > >>> @@ -792,7 +792,7 @@ bppy_init (PyObject *self, PyObject *args, PyObject *kwargs)
> > >>>      {
> > >>>        switch (type)
> > >>>         {
> > >>> -       case bp_breakpoint:
> > >>> +       case bp_hardware_breakpoint:
> > >>>           {
> > >>>             event_location_up location;
> > >>>             symbol_name_match_type func_name_match_type
> > >>> @@ -834,7 +834,7 @@ bppy_init (PyObject *self, PyObject *args, PyObject *kwargs)
> > >>>             create_breakpoint (python_gdbarch,
> > >>>                                location.get (), NULL, -1, NULL,
> > >>>                                0,
> > >>> -                              temporary_bp, bp_breakpoint,
> > >>> +                              temporary_bp, bp_hardware_breakpoint,
> > >>>                                0,
> > >>>                                AUTO_BOOLEAN_TRUE,
> > >>>                                ops,
> > >>> @@ -1007,7 +1007,7 @@ gdbpy_breakpoint_created (struct breakpoint *bp)
> > >>>    if (!user_breakpoint_p (bp) && bppy_pending_object == NULL)
> > >>>      return;
> > >>>
> > >>> -  if (bp->type != bp_breakpoint
> > >>> +  if (bp->type != bp_hardware_breakpoint
> > >>>        && bp->type != bp_watchpoint
> > >>>        && bp->type != bp_hardware_watchpoint
> > >>>        && bp->type != bp_read_watchpoint
> > >>>
> > >>> Of course it is an hack, but it's a starting point :-)
> > >>>
> > >>
> > >> There are two key differences with soft vs. hard BPs:
> > >>
> > >>  - guest code modification to inject and remove INT3 (looking at your
> > >>    panic, this might be the first thing to check)
> > >>  - different exception vectors and their reflection to or filtering from
> > >>    the guest
> > >>
> > >> Both are similar in that the need to step over the intercepted
> > >> instruction in order to resume - except that soft BP needs a
> > >> remove-step-restore-INT3 cycle.
> > >
> > > Thanks for the explanation!
> > >
> > >>
> > >> You should try debugging that without the lx-symbols script, just by
> > >> adding soft BPs and watching what happens to the guest, what becomes
> > >> incorrectly visible to it. Report, and maybe KVM folks can jump in
> > >> (adding the list).
> > >
> > > It works well. Also using lx-symbols, without loading new modules in the
> > > guest after it, I can debug the guest kernel with soft-BP.
> >
> > Even if putting the BP manually at the same location as lx-symbols does?
>
> Yes. I put the BP manually and I did 'continue' after the break without
> panic.
>
> > BTW, that location is sane?
>
> Yes, it seems sane.
>
> >
> > >
> > > The issue with soft-BP seems related to 'add-symbol-file' commands;
> > > if I skip it in the python script, I don't have the panic.
> >
> > So, it's the pattern of stopping at a soft-BP, reloading symbols,
> > resuming after the BP?
>
> Yes, but only if the module X was not loaded.
>
> I just tried the following pattern and I don't have the panic:
>
> guest$ modprobe X
>                                     (gdb) lx-symbols
>                                     loading vmlinux
>                                     scanning for modules in /linux/build
>                                     loading @0xffffffffc0147000: X.ko
>                                     (gdb) c
>                                     Continuing.
> guest$ rmmod X
> guest$ modprobe X
>                                     refreshing all symbols to reload module 'X'
>                                     loading vmlinux
>                                     loading @0xffffffffc0147000: X.ko
>
>


Just an update if someone hits the same issue and needs a simple
workaround.
I didn't find a proper solution, but with this patch applied I didn't
have the panic in the guest, also using kvm and soft BP:

diff --git a/scripts/gdb/linux/symbols.py b/scripts/gdb/linux/symbols.py
index 1be9763cf8bb..94d017a6e944 100644
--- a/scripts/gdb/linux/symbols.py
+++ b/scripts/gdb/linux/symbols.py
@@ -40,12 +40,9 @@ if hasattr(gdb, 'Breakpoint'):
             pagination = show_pagination.endswith("on.\n")
             gdb.execute("set pagination off")
 
-            if module_name in cmd.loaded_modules:
-                gdb.write("refreshing all symbols to reload module "
-                          "'{0}'\n".format(module_name))
-                cmd.load_all_symbols()
-            else:
-                cmd.load_module_symbols(module)
+            gdb.write("refreshing all symbols to load module "
+                      "'{0}'\n".format(module_name))
+            cmd.load_all_symbols()
 
             # restore pagination state
             gdb.execute("set pagination %s" % ("on" if pagination else "off"))

Cheers,
Stefano


