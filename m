Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F5D588AD5
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 12:54:40 +0200 (CEST)
Received: from localhost ([::1]:49610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJC1P-0005xk-9X
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 06:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJBzR-0004P4-Ph
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 06:52:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJBzP-0007XW-BL
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 06:52:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659523953;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=s1JxZTPBe0mMJFP4rXiUYMnW0GZj4+T40Dpgpf3XJ5g=;
 b=aK50WmB1aHdhpzfqtJHUQ5sNusPJa5xmjPPdsbGCpxHbtbYqH321DR/XOmfJY8eG008THF
 KwQdDW1ya5GDQzsaamWySz8BYrVdj/6R8SL6T2HZIVMr40c0JLndEwEhxhhgbJ2YCad3LC
 GDfpIuAn7AO6FK7gif2I1Jni8kEf/XY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-dR02uss0Mom_rgZZYAjlng-1; Wed, 03 Aug 2022 06:52:30 -0400
X-MC-Unique: dR02uss0Mom_rgZZYAjlng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BE753821C0B;
 Wed,  3 Aug 2022 10:52:30 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.173])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 166A72026D4C;
 Wed,  3 Aug 2022 10:52:27 +0000 (UTC)
Date: Wed, 3 Aug 2022 11:52:25 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=83=C2=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, "Michael S . Tsirkin" <mst@redhat.com>
Subject: Re: [PULL 9/9] hw/i386: pass RNG seed via setup_data entry
Message-ID: <YupTaZlkyy1/9FUC@redhat.com>
References: <20220721163621.761513-1-pbonzini@redhat.com>
 <20220721163621.761513-10-pbonzini@redhat.com>
 <dae86884-6cfa-a428-374c-60c42900aade@intel.com>
 <Yukk0YOFgkPwcTzG@zx2c4.com>
 <a3ddd211-a569-4348-c3bb-2ff509fd6ccf@intel.com>
 <Yuk9a0v+CNnzAX37@zx2c4.com>
 <CAHmME9qDNmX7TYio3TxgP_xFL1LGUoKrT6w=OG_1c688ZSdvKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHmME9qDNmX7TYio3TxgP_xFL1LGUoKrT6w=OG_1c688ZSdvKg@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 02, 2022 at 05:13:26PM +0200, Jason A. Donenfeld wrote:
> Hi Xiaoyao,
> 
> On Tue, Aug 2, 2022 at 5:06 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > Hi Xiaoyao,
> >
> > On Tue, Aug 02, 2022 at 10:53:07PM +0800, Xiaoyao Li wrote:
> > > yes, with >= 7.1, pcmc->legacy_no_rng_seed = false by default, and RNG
> > > seed is used.
> >
> > This is intended behavior. Being on by default is basically the whole
> > point of it. Otherwise it's useless.
> >
> > >
> > > > Either way, this shouldn't cause boot failures.
> > >
> > > It does fail booting OVMF with #PF. Below diff can fix the #PF for me.
> >
> > Huh, interesting. Sounds like maybe there's a bug I need to fix. Can you
> > send me some repro instructions, and I'll look into it right away.
> 
> I just tried booting Fedora using OVMF and didn't have any problems. I
> used this command line:

I managed to reproduce on a Fedora 36 host, using QEMU git master from
today.

 $ git clone https://gitlab.com/berrange/tiny-vm-tools
 $ cd tiny-vm-tools
 $ ./make-tiny-image.py --run date date
 tiny-initrd.img
 Copy lib /lib/ld-musl-x86_64.so.1 -> /tmp/make-tiny-imagebcuv8i_b/lib/ld-musl-x86_64.so.1
 Copy bin /usr/bin/date -> /tmp/make-tiny-imagebcuv8i_b/bin/date
 Copy lib /lib64/libc.so.6 -> /tmp/make-tiny-imagebcuv8i_b/lib64/libc.so.6
 Copy lib /lib64/ld-linux-x86-64.so.2 -> /tmp/make-tiny-imagebcuv8i_b/lib64/ld-linux-x86-64.so.2

 $ cp /usr/share/edk2/ovmf/OVMF_VARS.fd vars.fd

 $ ~/src/virt/qemu.git/build/qemu-system-x86_64 \
   -blockdev node-name=file_ovmf_code,driver=file,filename=/usr/share/edk2/ovmf/OVMF_CODE.fd,auto-read-only=on,discard=unmap \
   -blockdev node-name=drive_ovmf_code,driver=raw,read-only=on,file=file_ovmf_code \
   -blockdev node-name=file_ovmf_vars,driver=file,filename=vars.fd,auto-read-only=on,discard=unmap \
   -blockdev node-name=drive_ovmf_vars,driver=raw,read-only=off,file=file_ovmf_vars  \
   -machine pc-q35-7.1,pflash0=drive_ovmf_code,pflash1=drive_ovmf_vars \
   -kernel /boot/vmlinuz-5.18.5-200.fc36.x86_64 \
   -initrd tiny-initrd.img \
   -m 8000 \
   -display none \
   -nodefaults \
   -serial stdio \
   -append 'console=ttyS0 quiet'

It results in OVMF crashing and displaying this dump on console:

!!!! X64 Exception Type - 0D(#GP - General Protection)  CPU Apic ID - 00000000 !!!!
ExceptionData - 0000000000000000
RIP  - 0000000077EA6BBE, CS  - 0000000000000038, RFLAGS - 0000000000000206
RAX  - 28006E6F69746163, RCX - 0000000000000000, RDX - 41CBF4FA982C298B
RBX  - 000000007D9C3000, RSP - 000000007FEDF8E0, RBP - 0000000000000000
RSI  - 0000000000000000, RDI - 000000007D9C3000
R8   - 000000007D9C2F18, R9  - 000000007FEDF980, R10 - 0000000000000000
R11  - 0000000000000006, R12 - 28006E6F69746163, R13 - 000000007FEDF980
R14  - 000000007734F000, R15 - 000000007FEDFD01
DS   - 0000000000000030, ES  - 0000000000000030, FS  - 0000000000000030
GS   - 0000000000000030, SS  - 0000000000000030
CR0  - 0000000080010033, CR2 - 0000000000000000, CR3 - 000000007FC01000
CR4  - 0000000000000668, CR8 - 0000000000000000
DR0  - 0000000000000000, DR1 - 0000000000000000, DR2 - 0000000000000000
DR3  - 0000000000000000, DR6 - 00000000FFFF0FF0, DR7 - 0000000000000400
GDTR - 000000007F9DE000 0000000000000047, LDTR - 0000000000000000
IDTR - 000000007F40F018 0000000000000FFF,   TR - 0000000000000000
FXSAVE_STATE - 000000007FEDF540
!!!! Find image based on IP(0x77EA6BBE) (No PDB)  (ImageBase=000000007734F000, EntryPoint=0000000077EA65FC) !!!!



Changing to pc-q35-7.0 makes it work and prints current 'date' output
before shutting down.

Similarly adding  'pcmc->legacy_no_rng_seed = true;' for 7.1 machine
type also makes it work.

Turning on isa-debugcon for OVMF doesn't show anything especially
unsual - just a slightly different kernel image size, due to the
RNG seed having been added.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


