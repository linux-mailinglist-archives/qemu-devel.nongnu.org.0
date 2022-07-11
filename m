Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 026D157088E
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 18:52:01 +0200 (CEST)
Received: from localhost ([::1]:53788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAwdb-00054r-S5
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 12:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=G9Ii=XQ=zx2c4.com=Jason@kernel.org>)
 id 1oAwXs-0001LU-RR
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 12:46:08 -0400
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1]:42696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=G9Ii=XQ=zx2c4.com=Jason@kernel.org>)
 id 1oAwXo-0005Jh-29
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 12:46:04 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 3F357CE1282;
 Mon, 11 Jul 2022 16:45:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27798C34115;
 Mon, 11 Jul 2022 16:45:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="YppZTJE0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1657557951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TTPFgBEg+NRhk7UtwOitje7JV7ehsa4iJlwWGGxvTxc=;
 b=YppZTJE0sLDSPPIaaxvl/e3BJWqkCWmKIDqWfgKPP2jEhxLhelzTgwMbZGJ/hm3rjzXIuq
 RCiQYqys5Lu9nk8cODn9wPWD8pZ4Vnqsi8dikYQitXAmtmsIXWHM8xhfVuHt+oCQ4dvYbe
 g2OAws97BxG8+H8eJ041Lq80ojljBJ4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 378cb2cb
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Mon, 11 Jul 2022 16:45:51 +0000 (UTC)
Date: Mon, 11 Jul 2022 18:45:42 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH] hw/riscv: virt: pass random seed to fdt
Message-ID: <YsxTtkdp7p10qzc3@zx2c4.com>
References: <20220613115810.178210-1-Jason@zx2c4.com>
 <CAKmqyKMn+-FXacKrzB7FppQ5WEi-9h+-6w+Ev51j2Qoum4-QKw@mail.gmail.com>
 <CAHmME9rgMnAtPNDQ5hPrZ8ROd_Mgm4C+2PZioJ861HpcLfZL8Q@mail.gmail.com>
 <YsYxM6gmJf7y/nJc@zx2c4.com>
 <CAKmqyKNUC+eiXLqqwSC3AjmqUtBc8p59mAHdumZ2oHiCT8aT0A@mail.gmail.com>
 <CAHmME9o1AaNHacHV8O0Ni+AHdYeQZ9xjt-ygc-wwU=Vu97juCQ@mail.gmail.com>
 <CAKmqyKOJFz7i5sORoZ4sbjeLg_=b3=Nim6zfPRK0Dp1w29KfSQ@mail.gmail.com>
 <CAHmME9qqOVhKOiCc=UVZcj07GwGFcBJB6UdOY5LXpFpy9GA=Rg@mail.gmail.com>
 <CAKmqyKM16Hjwu1kQgvk-18bSszRKTTvpP7oeZx=hwP-m-KsL-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKmqyKM16Hjwu1kQgvk-18bSszRKTTvpP7oeZx=hwP-m-KsL-w@mail.gmail.com>
Received-SPF: pass client-ip=2604:1380:40e1:4800::1;
 envelope-from=SRS0=G9Ii=XQ=zx2c4.com=Jason@kernel.org;
 helo=sin.source.kernel.org
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

Hi Alistair,

On Mon, Jul 11, 2022 at 01:36:28PM +1000, Alistair Francis wrote:
> On Mon, Jul 11, 2022 at 10:28 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > On 7/11/22, Alistair Francis <alistair23@gmail.com> wrote:
> > > On Fri, Jul 8, 2022 at 7:56 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > >>
> > >> Hi Alistair,
> > >>
> > >> On 7/8/22, Alistair Francis <alistair23@gmail.com> wrote:
> > >>
> > >> >> > but I think that's just the way things go unfortunately.
> > >> >
> > >> > Hmm... That's a pain. So there is a bug in older kernels where they
> > >> > won't boot if we specify this?
> > >> >
> > >> > Can you point to the fixes?
> > >>
> > >> Actually, in trying to reproduce this, I don't actually think this is
> > >> affected by those old random.c bugs.
> > >>
> > >>
> > >> >> As for your 5.8 issue, I've been trying to reproduce that to
> > >> >> understand
> > >> >> more about it, but I'm unable to. I've been trying with
> > >> >> nommu_virt_defconfig using my patch ontop of qemu master. Maybe it's
> > >> >> possible in testing this out you were testing the wrong branch?
> > >> >> Anyway,
> > >> >> it'd be nice to get this queued up...
> > >> >
> > >> > Hmm... you can't reproduce it?
> > >>
> > >> No, I can't, and I'm now no longer convinced that there *is* a bug.
> > >> Can you try to repro again and send me detailed reproduction steps?
> > >
> > > I just checked again and I can confirm it is this patch that causes
> > > the regression.
> > >
> > > This is the command line:
> > >
> > > qemu-system-riscv64 \
> > > -machine virt -m 64M \
> > > -cpu rv64,mmu=false \
> > > -serial mon:stdio -serial null -nographic \
> > > -append "root=/dev/vda rw highres=off  console=ttyS0 mem=1G ip=dhcp
> > > earlycon=sbi" \
> > > -device virtio-net-device,netdev=net0,mac=52:54:00:12:34:02 -netdev
> > > user,id=net0 \
> > > -object rng-random,filename=/dev/urandom,id=rng0 -device
> > > virtio-rng-device,rng=rng0 \
> > > -smp 1 -d guest_errors \
> > > -kernel ./images/qemuriscv64/nommu-Image \
> > > -drive
> > > id=disk0,file=./images/qemuriscv64/nommu-rootfs.ext2,if=none,format=raw \
> > > -device virtio-blk-device,drive=disk0 -bios none
> > >
> > > You can access the images from:
> > > https://nextcloud.alistair23.me/index.php/s/a2zrtbT7DjdTx9t
> > >
> >
> > Thanks. Can you send the kernel . config too?
> 
> Unfortunately I don't have it, it should just be the 5.8 no MMU defconfig though

I've reproduced the problem and determined the root cause. This is a
generic issue with the mmio get_cycles() implementation before 5.9 on
no-MMU configs, which was fixed during the 5.9 cycle. I don't believe
that this is the only thing affected on that .0 kernel, where fixes were
ostensibly backported. Given the relative age of risc-v, the fact that
5.8.0 was broken anyway, and that likely nobody is using this kernel in
that configuration without applying updates, I'm pretty sure my patch is
safe to apply. I'd recommend updating the broken kernel in your CI.

Meanwhile, the rng-seed field is part of the DT spec. Holding back the
(virtual) hardware just because some random dot-zero non-LTS release had
a quickly fixed bug seems ridiculous, and the way in which progress gets
held up, hacks accumulate, and generally nothing good gets done. It will
only hamper security, functionality, and boot speed, while helping no
real practical case that can't be fixed in a better way.

So I believe you should apply the rng-seed commit so that the RISC-V
machine honors that DT field.

Regards,
Jason

