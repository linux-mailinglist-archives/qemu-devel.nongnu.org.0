Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A5D587ED9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 17:15:12 +0200 (CEST)
Received: from localhost ([::1]:35524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oItc0-0007Yy-01
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 11:15:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=YGwI=YG=zx2c4.com=Jason@kernel.org>)
 id 1oItak-0006AB-Ih
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 11:13:54 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:59720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=YGwI=YG=zx2c4.com=Jason@kernel.org>)
 id 1oItai-0005E9-NV
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 11:13:54 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BF89CB81F28
 for <qemu-devel@nongnu.org>; Tue,  2 Aug 2022 15:13:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 411D8C433B5
 for <qemu-devel@nongnu.org>; Tue,  2 Aug 2022 15:13:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="bWabEEDv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1659453225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v4afMucyPQg8WbqmjueGMD977RBNmZAhm3Z1GzWLoAQ=;
 b=bWabEEDv0LVfZseZDeB5kcrhV9ebQFPff7x/K3aIOaNn7wWKwNaBM6MDtwbdTU1QOO6lYf
 odvZHLdt6VWIq/FWyX1SXAO4ZLr/Vdy9ztg7uyBHCVfi9TOFto/oOjSlIJZTnCEn1Pp9EU
 C1VV5yFLxAtxCggRrPVqacYJcTXqh+8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bc40f37b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Tue, 2 Aug 2022 15:13:45 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id 204so22885227yba.1
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 08:13:43 -0700 (PDT)
X-Gm-Message-State: ACgBeo0T/SUx49xSswY46bDmGEHc2jNkWmaf7iLdOrbzLYVrnp6fYzZO
 IPZ9hRdjiL5i7seMVuTcU+KSATXgy45vHfPPrEs=
X-Google-Smtp-Source: AA6agR6KHdUULK/s3X2FzAxitTk60zHQXvSp3Qelkc9nJOwrcQMtC5WgZQY/W+nJ943Cur/qEdgaFPq42/KNXneHAHg=
X-Received: by 2002:a05:6902:72f:b0:67a:35e6:60d8 with SMTP id
 l15-20020a056902072f00b0067a35e660d8mr1544647ybt.515.1659453223068; Tue, 02
 Aug 2022 08:13:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220721163621.761513-1-pbonzini@redhat.com>
 <20220721163621.761513-10-pbonzini@redhat.com>
 <dae86884-6cfa-a428-374c-60c42900aade@intel.com> <Yukk0YOFgkPwcTzG@zx2c4.com>
 <a3ddd211-a569-4348-c3bb-2ff509fd6ccf@intel.com> <Yuk9a0v+CNnzAX37@zx2c4.com>
In-Reply-To: <Yuk9a0v+CNnzAX37@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 2 Aug 2022 17:13:26 +0200
X-Gmail-Original-Message-ID: <CAHmME9qDNmX7TYio3TxgP_xFL1LGUoKrT6w=OG_1c688ZSdvKg@mail.gmail.com>
Message-ID: <CAHmME9qDNmX7TYio3TxgP_xFL1LGUoKrT6w=OG_1c688ZSdvKg@mail.gmail.com>
Subject: Re: [PULL 9/9] hw/i386: pass RNG seed via setup_data entry
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=83=C2=A9?= <f4bug@amsat.org>, 
 Laurent Vivier <laurent@vivier.eu>, "Michael S . Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=YGwI=YG=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
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

Hi Xiaoyao,

On Tue, Aug 2, 2022 at 5:06 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Xiaoyao,
>
> On Tue, Aug 02, 2022 at 10:53:07PM +0800, Xiaoyao Li wrote:
> > yes, with >= 7.1, pcmc->legacy_no_rng_seed = false by default, and RNG
> > seed is used.
>
> This is intended behavior. Being on by default is basically the whole
> point of it. Otherwise it's useless.
>
> >
> > > Either way, this shouldn't cause boot failures.
> >
> > It does fail booting OVMF with #PF. Below diff can fix the #PF for me.
>
> Huh, interesting. Sounds like maybe there's a bug I need to fix. Can you
> send me some repro instructions, and I'll look into it right away.

I just tried booting Fedora using OVMF and didn't have any problems. I
used this command line:

qemu-system-x86_64 -machine q35 -enable-kvm -cpu host,-rdrand,-rdseed
-smp cores=8 -drive file=disk.qcow2,if=virtio -net nic,model=virtio
-net user,hostfwd=tcp::19230-:22 -m 8G -vga qxl -device
virtio-serial-pci -device
virtserialport,chardev=spicechannel0,name=com.redhat.spice.
0 -chardev spicevmc,id=spicechannel0,name=vdagent -spice
unix,addr=/tmp/vm_spice_fedora.socket,disable-ticketing,playback-compression=off,agen
t-mouse=on,seamless-migration,gl=on -device
virtserialport,chardev=spicechannel1,name=org.spice-space.webdav.0
-chardev spiceport,id=spicechan
nel1,name=org.spice-space.webdav.0 -global
driver=cfi.pflash01,property=secure,value=on -drive
if=pflash,format=raw,unit=0,file=OVMF_CODE.secb
oot.fd,readonly=on -drive if=pflash,format=raw,file=OVMF_VARS.secboot.fd

Can you tell me what you're using and give me some links with various
images and such? Doing the straight forward thing doesn't reproduce it
for me.

Thanks,
Jason

