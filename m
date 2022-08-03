Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00091588CC9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 15:14:09 +0200 (CEST)
Received: from localhost ([::1]:47438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJECN-0004vC-Cv
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 09:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hVua=YH=zx2c4.com=Jason@kernel.org>)
 id 1oJEAL-00019r-9O
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 09:12:01 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:54702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hVua=YH=zx2c4.com=Jason@kernel.org>)
 id 1oJEAJ-0004ek-0A
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 09:12:00 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 376A061489;
 Wed,  3 Aug 2022 13:11:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D42D6C433C1;
 Wed,  3 Aug 2022 13:11:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="DSFtK+0E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1659532311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pcd92lWiGmDYyq+59g00VfQuOLvFgz6SoDTkfdSHRX0=;
 b=DSFtK+0Eg0CULHhSGQqyTnOwPW1frdAT7PW1nT/mdpV+4jOJ9FkvuwWonHUk4NA6u1SRpC
 4iS2H2RObbFJBZNzaFK7TYedwlj1l7bOtG//2rGZIrieLZ3BQ6riOaqT8ZDUp0daxzXrcQ
 iDR1Ub3TB2wEHsGLhtLqMfAzf6XtRjg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c311b337
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 3 Aug 2022 13:11:51 +0000 (UTC)
Date: Wed, 3 Aug 2022 15:11:48 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=83=C2=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, "Michael S . Tsirkin" <mst@redhat.com>
Subject: Re: [PULL 9/9] hw/i386: pass RNG seed via setup_data entry
Message-ID: <Yup0FIOLLo0thP8u@zx2c4.com>
References: <20220721163621.761513-1-pbonzini@redhat.com>
 <20220721163621.761513-10-pbonzini@redhat.com>
 <dae86884-6cfa-a428-374c-60c42900aade@intel.com>
 <Yukk0YOFgkPwcTzG@zx2c4.com>
 <a3ddd211-a569-4348-c3bb-2ff509fd6ccf@intel.com>
 <Yuk9a0v+CNnzAX37@zx2c4.com>
 <CAHmME9qDNmX7TYio3TxgP_xFL1LGUoKrT6w=OG_1c688ZSdvKg@mail.gmail.com>
 <YupTaZlkyy1/9FUC@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YupTaZlkyy1/9FUC@redhat.com>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=hVua=YH=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Daniel,

On Wed, Aug 03, 2022 at 11:52:25AM +0100, Daniel P. Berrangé wrote:
> On Tue, Aug 02, 2022 at 05:13:26PM +0200, Jason A. Donenfeld wrote:
> > Hi Xiaoyao,
> > 
> > On Tue, Aug 2, 2022 at 5:06 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > >
> > > Hi Xiaoyao,
> > >
> > > On Tue, Aug 02, 2022 at 10:53:07PM +0800, Xiaoyao Li wrote:
> > > > yes, with >= 7.1, pcmc->legacy_no_rng_seed = false by default, and RNG
> > > > seed is used.
> > >
> > > This is intended behavior. Being on by default is basically the whole
> > > point of it. Otherwise it's useless.
> > >
> > > >
> > > > > Either way, this shouldn't cause boot failures.
> > > >
> > > > It does fail booting OVMF with #PF. Below diff can fix the #PF for me.
> > >
> > > Huh, interesting. Sounds like maybe there's a bug I need to fix. Can you
> > > send me some repro instructions, and I'll look into it right away.
> > 
> > I just tried booting Fedora using OVMF and didn't have any problems. I
> > used this command line:
> 
> I managed to reproduce on a Fedora 36 host, using QEMU git master from
> today.
> 
>  $ git clone https://gitlab.com/berrange/tiny-vm-tools
>  $ cd tiny-vm-tools
>  $ ./make-tiny-image.py --run date date
>  tiny-initrd.img
>  Copy lib /lib/ld-musl-x86_64.so.1 -> /tmp/make-tiny-imagebcuv8i_b/lib/ld-musl-x86_64.so.1
>  Copy bin /usr/bin/date -> /tmp/make-tiny-imagebcuv8i_b/bin/date
>  Copy lib /lib64/libc.so.6 -> /tmp/make-tiny-imagebcuv8i_b/lib64/libc.so.6
>  Copy lib /lib64/ld-linux-x86-64.so.2 -> /tmp/make-tiny-imagebcuv8i_b/lib64/ld-linux-x86-64.so.2
> 
>  $ cp /usr/share/edk2/ovmf/OVMF_VARS.fd vars.fd
> 
>  $ ~/src/virt/qemu.git/build/qemu-system-x86_64 \
>    -blockdev node-name=file_ovmf_code,driver=file,filename=/usr/share/edk2/ovmf/OVMF_CODE.fd,auto-read-only=on,discard=unmap \
>    -blockdev node-name=drive_ovmf_code,driver=raw,read-only=on,file=file_ovmf_code \
>    -blockdev node-name=file_ovmf_vars,driver=file,filename=vars.fd,auto-read-only=on,discard=unmap \
>    -blockdev node-name=drive_ovmf_vars,driver=raw,read-only=off,file=file_ovmf_vars  \
>    -machine pc-q35-7.1,pflash0=drive_ovmf_code,pflash1=drive_ovmf_vars \
>    -kernel /boot/vmlinuz-5.18.5-200.fc36.x86_64 \
>    -initrd tiny-initrd.img \
>    -m 8000 \
>    -display none \
>    -nodefaults \
>    -serial stdio \
>    -append 'console=ttyS0 quiet'

Thanks for the info. Very helpful. Looking into it now.

Jason

