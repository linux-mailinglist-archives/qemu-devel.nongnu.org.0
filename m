Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 199FB2834AC
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 13:10:01 +0200 (CEST)
Received: from localhost ([::1]:58074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPONT-0006Pm-El
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 07:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kPOJ9-0004ou-Ld
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 07:05:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kPOJ6-0003Y6-FM
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 07:05:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601895927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vc2nKKTL02gWU5yWF5ad4llO5nyzuy0j90vj2arUGec=;
 b=UdAMWOl7FJFTaTyh6vQbg4joyeNYrt4PsXZYS2bMpdU/fkw8hMDsepGRQP4WdZxTKjaJdx
 M6pBAJ0xN82BrR5G7A7nGSM94Dli3LzLv3DapCxhyJcD1UlVMWlKVEmAwl1ku5ZIXz/wDw
 bmHW+7k/7vBYG0dIEf8X6dcn/ntz71E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-eRI1j1HHMBmkpXG3iMnOXg-1; Mon, 05 Oct 2020 07:05:22 -0400
X-MC-Unique: eRI1j1HHMBmkpXG3iMnOXg-1
Received: by mail-wm1-f69.google.com with SMTP id m14so1119806wmi.0
 for <qemu-devel@nongnu.org>; Mon, 05 Oct 2020 04:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Vc2nKKTL02gWU5yWF5ad4llO5nyzuy0j90vj2arUGec=;
 b=Vf19adSkgKJDCSFC9jRhzSw34NjoknXOo2j4JZRrB+ziB3c50ANwM6/ra+J5gickZK
 UAC0RTAAVX1EnJTz49Exhy599OrTi9EafpIRYR8FTW+wh2Sp5UkRpx1V8UEREkYQ7Suj
 Agq6bc6mr6ror6Xw77k6TQQC4C4plTsRZjgSL6For+K9us2vIrGBOIvub/dtJldw90Rb
 uXq/hwEMzBy4a8hubPMTBt3AAEpq6F2URIIAMV3CZu8efAyHLpJlievNi/KsmkmPRtwO
 QKenIgzazIsV9ms0jkwSUh4xbcpDtEPGoLzE3flLyhVBoCp7Q1f1nqi+xAf1orhZk32W
 Ozww==
X-Gm-Message-State: AOAM532LVAXVxM1ie++KqeEW+rZSLWDUG0PUiQXDUdIFf/cno3TnyzVD
 YQJ68CQY3D8O/FcljaWuJmVuIN25krFoKDGPp1Uc5POHHLYDqBR7HedSeOVmhkypolO0Nx/HAVA
 1ECNrKdZtRonk+hU=
X-Received: by 2002:adf:e70a:: with SMTP id c10mr6939727wrm.425.1601895921097; 
 Mon, 05 Oct 2020 04:05:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbU23VlU7uR/TNE1pJKXJ/t1RHa4XKD2T/1dnX74xwx1zS0N1BhWjYA+ZfEPnZq7cUxvA/3w==
X-Received: by 2002:adf:e70a:: with SMTP id c10mr6939686wrm.425.1601895920697; 
 Mon, 05 Oct 2020 04:05:20 -0700 (PDT)
Received: from steredhat (host-79-27-201-176.retail.telecomitalia.it.
 [79.27.201.176])
 by smtp.gmail.com with ESMTPSA id q2sm3680492wrw.40.2020.10.05.04.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 04:05:19 -0700 (PDT)
Date: Mon, 5 Oct 2020 13:05:17 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: scripts/gdb: issues when loading modules after lx-symbols
Message-ID: <20201005110517.s42jo7mvagpzti6b@steredhat>
References: <CAGxU2F7+Tf+hJxxadT_Rw01O43RU9RsasJiVLpukbhvo1w++fA@mail.gmail.com>
 <9e247182-2cc3-9fac-e12e-9743ef24ec43@siemens.com>
 <20201005081451.ajtm6rctimrg5frr@steredhat>
 <0b862e95-c2a7-ad00-5f57-8d958e4af20c@siemens.com>
 <20201005092953.zu7pn2lveo3j2w4s@steredhat>
 <1aef313c-e399-0f56-17a7-f73c9a189200@siemens.com>
MIME-Version: 1.0
In-Reply-To: <1aef313c-e399-0f56-17a7-f73c9a189200@siemens.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/05 02:11:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-devel@nongnu.org, linux-kernel@vger.kernel.org,
 kvm <kvm@vger.kernel.org>, Kieran Bingham <kbingham@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 05, 2020 at 11:45:41AM +0200, Jan Kiszka wrote:
> On 05.10.20 11:29, Stefano Garzarella wrote:
> > On Mon, Oct 05, 2020 at 10:33:30AM +0200, Jan Kiszka wrote:
> >> On 05.10.20 10:14, Stefano Garzarella wrote:
> >>> On Sun, Oct 04, 2020 at 08:52:37PM +0200, Jan Kiszka wrote:
> >>>> On 01.10.20 16:31, Stefano Garzarella wrote:
> >>>>> Hi,
> >>>>> I had some issues with gdb scripts and kernel modules in Linux 5.9-rc7.
> >>>>>
> >>>>> If the modules are already loaded, and I do 'lx-symbols', all work fine.
> >>>>> But, if I load a kernel module after 'lx-symbols', I had this issue:
> >>>>>
> >>>>> [ 5093.393940] invalid opcode: 0000 [#1] SMP PTI
> >>>>> [ 5093.395134] CPU: 0 PID: 576 Comm: modprobe Not tainted 5.9.0-rc7-ste-00010-gf0b671d9608d-dirty #2
> >>>>> [ 5093.397566] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.13.0-2.fc32 04/01/2014
> >>>>> [ 5093.400761] RIP: 0010:do_init_module+0x1/0x270
> >>>>> [ 5093.402553] Code: ff ff e9 cf fe ff ff 0f 0b 49 c7 c4 f2 ff ff ff e9 c1 fe ff ff e8 5f b2 65 00 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 cc <1f> 44 00 00 55 ba 10 00 00 00 be c0 0c 00 00 48 89 e5 41 56 41 55
> >>>>> [ 5093.409505] RSP: 0018:ffffc90000563d18 EFLAGS: 00010246
> >>>>> [ 5093.412056] RAX: 0000000000000000 RBX: ffffffffc010a0c0 RCX: 0000000000004ee3
> >>>>> [ 5093.414472] RDX: 0000000000004ee2 RSI: ffffea0001efe188 RDI: ffffffffc010a0c0
> >>>>> [ 5093.416349] RBP: ffffc90000563e50 R08: 0000000000000000 R09: 0000000000000002
> >>>>> [ 5093.418044] R10: 0000000000000096 R11: 00000000000008a4 R12: ffff88807a0d1280
> >>>>> [ 5093.424721] R13: ffffffffc010a110 R14: ffff88807a0d1300 R15: ffffc90000563e70
> >>>>> [ 5093.427138] FS:  00007f018f632740(0000) GS:ffff88807dc00000(0000) knlGS:0000000000000000
> >>>>> [ 5093.430037] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >>>>> [ 5093.432279] CR2: 000055fbe282b239 CR3: 000000007922a006 CR4: 0000000000170ef0
> >>>>> [ 5093.435096] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> >>>>> [ 5093.436765] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> >>>>> [ 5093.439689] Call Trace:
> >>>>> [ 5093.440954]  ? load_module+0x24b6/0x27d0
> >>>>> [ 5093.443212]  ? __kernel_read+0xd6/0x150
> >>>>> [ 5093.445140]  __do_sys_finit_module+0xd3/0xf0
> >>>>> [ 5093.446877]  __x64_sys_finit_module+0x1a/0x20
> >>>>> [ 5093.449098]  do_syscall_64+0x38/0x50
> >>>>> [ 5093.450877]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> >>>>> [ 5093.456153] RIP: 0033:0x7f018f75c43d
> >>>>> [ 5093.457728] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 2b 6a 0c 00 f7 d8 64 89 01 48
> >>>>> [ 5093.466349] RSP: 002b:00007ffd7f080368 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> >>>>> [ 5093.470613] RAX: ffffffffffffffda RBX: 0000557e5c96f9c0 RCX: 00007f018f75c43d
> >>>>> [ 5093.474747] RDX: 0000000000000000 RSI: 0000557e5c964288 RDI: 0000000000000003
> >>>>> [ 5093.478049] RBP: 0000000000040000 R08: 0000000000000000 R09: 0000000000000000
> >>>>> [ 5093.481298] R10: 0000000000000003 R11: 0000000000000246 R12: 0000000000000000
> >>>>> [ 5093.483725] R13: 0000557e5c964288 R14: 0000557e5c96f950 R15: 0000557e5c9775c0
> >>>>> [ 5093.485778] Modules linked in: virtio_vdpa(+) vdpa sunrpc kvm_intel kvm irqbypass virtio_blk virtio_rng rng_core [last unloaded: virtio_vdpa]
> >>>>> [ 5093.488695] ---[ end trace 23712ecebc11f53c ]---
> >>>>>
> >>>>> Guest kernel: Linux 5.9-rc7
> >>>>> gdb: GNU gdb (GDB) Fedora 9.1-6.fc32
> >>>>> I tried with QEMU 4.2.1 and the latest master branch: same issue.
> >>>>>
> >>>>>
> >>>>> I did some digging, and skipping the gdb 'add-symbol-file' command in symbol.py
> >>>>> avoid the issue, but of course I don't have the symbols loaded:
> >>>>>
> >>>>>     diff --git a/scripts/gdb/linux/symbols.py b/scripts/gdb/linux/symbols.py
> >>>>>     index 1be9763cf8bb..eadfaa4d4907 100644
> >>>>>     --- a/scripts/gdb/linux/symbols.py
> >>>>>     +++ b/scripts/gdb/linux/symbols.py
> >>>>>     @@ -129,7 +129,7 @@ lx-symbols command."""
> >>>>>                      filename=module_file,
> >>>>>                      addr=module_addr,
> >>>>>                      sections=self._section_arguments(module))
> >>>>>     -            gdb.execute(cmdline, to_string=True)
> >>>>>     +            #gdb.execute(cmdline, to_string=True)
> >>>>>                  if module_name not in self.loaded_modules:
> >>>>>                      self.loaded_modules.append(module_name)
> >>>>>              else:
> >>>>>
> >>>>> I tried several modules and this happens every time after '(gdb) lx-symbols'.
> >>>>>
> >>>>> Do you have any hints?
> >>>>>
> >>>> I assume you are debugging a kernel inside QEMU/KVM, right?
> >>>
> >>> Right!
> >>>
> >>>>                                                             Does it work
> >>>> without -enable-kvm?
> >>>
> >>> Yes, disabling kvm it works.
> >>>
> >>
> >> OK, there it is, still...
> >> What may also "work" is going down to single core.
> > 
> > No, I tried with single core and kvm enabled and I have the same issue.
> > 
> >>
> >>>>
> >>>> Debugging guests in KVM mode at least was unstable for a long time. I
> >>>> avoided setting soft-BPs - which is what the script does for the sake of
> >>>> tracking modules loading -, falling back to hw-BPs, as I had no time to
> >>>> debug that further. /Maybe/ that's the issue here.
> >>>
> >>> Thanks for the suggestion, I'll try to have a look.
> >>>
> >>
> >> Would be great if this issue could finally be resolved. And then covered
> >> by the kvm-unit tests. Those still succeed, I think.
> > 
> > Yeah, I'm a bit busy, but I'll try to find a fix.
> > 
> > Just an update, I tried to follow your suggestion using hw-BPs, but
> > unfortunately the gdb python module doesn't provide an easy way to set
> > them, so I hacked a bit gdb forcing hw-BPs and with this patch applied
> > to gdb I don't see the issue anymore:
> > 
> > diff --git a/gdb/python/py-breakpoint.c b/gdb/python/py-breakpoint.c
> > index 7369c91ad9..df8ec92049 100644
> > --- a/gdb/python/py-breakpoint.c
> > +++ b/gdb/python/py-breakpoint.c
> > @@ -57,7 +57,7 @@ struct pybp_code
> >  static struct pybp_code pybp_codes[] =
> >  {
> >    { "BP_NONE", bp_none},
> > -  { "BP_BREAKPOINT", bp_breakpoint},
> > +  { "BP_BREAKPOINT", bp_hardware_breakpoint},
> >    { "BP_WATCHPOINT", bp_watchpoint},
> >    { "BP_HARDWARE_WATCHPOINT", bp_hardware_watchpoint},
> >    { "BP_READ_WATCHPOINT", bp_read_watchpoint},
> > @@ -383,7 +383,7 @@ bppy_get_location (PyObject *self, void *closure)
> > 
> >    BPPY_REQUIRE_VALID (obj);
> > 
> > -  if (obj->bp->type != bp_breakpoint)
> > +  if (obj->bp->type != bp_hardware_breakpoint)
> >      Py_RETURN_NONE;
> > 
> >    const char *str = event_location_to_string (obj->bp->location.get ());
> > @@ -730,7 +730,7 @@ bppy_init (PyObject *self, PyObject *args, PyObject *kwargs)
> >                                     "temporary","source", "function",
> >                                     "label", "line", "qualified", NULL };
> >    const char *spec = NULL;
> > -  enum bptype type = bp_breakpoint;
> > +  enum bptype type = bp_hardware_breakpoint;
> >    int access_type = hw_write;
> >    PyObject *internal = NULL;
> >    PyObject *temporary = NULL;
> > @@ -792,7 +792,7 @@ bppy_init (PyObject *self, PyObject *args, PyObject *kwargs)
> >      {
> >        switch (type)
> >         {
> > -       case bp_breakpoint:
> > +       case bp_hardware_breakpoint:
> >           {
> >             event_location_up location;
> >             symbol_name_match_type func_name_match_type
> > @@ -834,7 +834,7 @@ bppy_init (PyObject *self, PyObject *args, PyObject *kwargs)
> >             create_breakpoint (python_gdbarch,
> >                                location.get (), NULL, -1, NULL,
> >                                0,
> > -                              temporary_bp, bp_breakpoint,
> > +                              temporary_bp, bp_hardware_breakpoint,
> >                                0,
> >                                AUTO_BOOLEAN_TRUE,
> >                                ops,
> > @@ -1007,7 +1007,7 @@ gdbpy_breakpoint_created (struct breakpoint *bp)
> >    if (!user_breakpoint_p (bp) && bppy_pending_object == NULL)
> >      return;
> > 
> > -  if (bp->type != bp_breakpoint
> > +  if (bp->type != bp_hardware_breakpoint
> >        && bp->type != bp_watchpoint
> >        && bp->type != bp_hardware_watchpoint
> >        && bp->type != bp_read_watchpoint
> > 
> > Of course it is an hack, but it's a starting point :-)
> > 
> 
> There are two key differences with soft vs. hard BPs:
> 
>  - guest code modification to inject and remove INT3 (looking at your
>    panic, this might be the first thing to check)
>  - different exception vectors and their reflection to or filtering from
>    the guest
> 
> Both are similar in that the need to step over the intercepted
> instruction in order to resume - except that soft BP needs a
> remove-step-restore-INT3 cycle.

Thanks for the explanation!

> 
> You should try debugging that without the lx-symbols script, just by
> adding soft BPs and watching what happens to the guest, what becomes
> incorrectly visible to it. Report, and maybe KVM folks can jump in
> (adding the list).

It works well. Also using lx-symbols, without loading new modules in the
guest after it, I can debug the guest kernel with soft-BP.

The issue with soft-BP seems related to 'add-symbol-file' commands;
if I skip it in the python script, I don't have the panic.

I'll look deeper.

Stefano


