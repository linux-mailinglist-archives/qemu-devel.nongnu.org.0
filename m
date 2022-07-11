Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F3C56D22F
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 02:30:45 +0200 (CEST)
Received: from localhost ([::1]:52796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAhK0-00009Y-Qw
	for lists+qemu-devel@lfdr.de; Sun, 10 Jul 2022 20:30:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=G9Ii=XQ=zx2c4.com=Jason@kernel.org>)
 id 1oAhHY-0006jC-7F
 for qemu-devel@nongnu.org; Sun, 10 Jul 2022 20:28:12 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:42452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=G9Ii=XQ=zx2c4.com=Jason@kernel.org>)
 id 1oAhHV-0007ls-TU
 for qemu-devel@nongnu.org; Sun, 10 Jul 2022 20:28:11 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EB3FAB80CF4
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 00:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D488C3411E
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 00:27:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="TjH8W2fw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1657499277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1tx3uOx4u6hlVF1ZBT/AYrQCKWwMaASnhfBb4ktehvw=;
 b=TjH8W2fwrwOPe/185t3ewblccirfSSSM7Pxm7UI5AeKrkWIHAm+MiEVGbSErOfLVa4OE8p
 gpVoqh5CA7OIi6diseawfE/w76sXz1mQADly24rQJpp3d7m5ySapQqWW6kD5jZfnrTsfwM
 2K44IT1cH0IxM5Lt+SMbYBST2YApffM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5528c778
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Mon, 11 Jul 2022 00:27:57 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id n7so3641800ioo.7
 for <qemu-devel@nongnu.org>; Sun, 10 Jul 2022 17:27:56 -0700 (PDT)
X-Gm-Message-State: AJIora9uGKjPbNgubaNoZIEN0iwHB+0OOGGk0pGVamYteCUag+rMx/n2
 pCVQjzOThlP43HKitjSXVF8B5h26aHHRpw7d0LI=
X-Google-Smtp-Source: AGRyM1uPLnVgDP5i3E2KM1rZoVLRVZAJuXXRxW8DLyPgze+Qr8i50sMV2omL3HtNWKEosGNIDIQ83gphcVxI5PWZGtQ=
X-Received: by 2002:a6b:2ad5:0:b0:67b:817a:c281 with SMTP id
 q204-20020a6b2ad5000000b0067b817ac281mr4031702ioq.24.1657499275985; Sun, 10
 Jul 2022 17:27:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6e02:20e5:0:0:0:0 with HTTP; Sun, 10 Jul 2022 17:27:55
 -0700 (PDT)
In-Reply-To: <CAKmqyKOJFz7i5sORoZ4sbjeLg_=b3=Nim6zfPRK0Dp1w29KfSQ@mail.gmail.com>
References: <20220613115810.178210-1-Jason@zx2c4.com>
 <CAKmqyKMn+-FXacKrzB7FppQ5WEi-9h+-6w+Ev51j2Qoum4-QKw@mail.gmail.com>
 <CAHmME9rgMnAtPNDQ5hPrZ8ROd_Mgm4C+2PZioJ861HpcLfZL8Q@mail.gmail.com>
 <YsYxM6gmJf7y/nJc@zx2c4.com>
 <CAKmqyKNUC+eiXLqqwSC3AjmqUtBc8p59mAHdumZ2oHiCT8aT0A@mail.gmail.com>
 <CAHmME9o1AaNHacHV8O0Ni+AHdYeQZ9xjt-ygc-wwU=Vu97juCQ@mail.gmail.com>
 <CAKmqyKOJFz7i5sORoZ4sbjeLg_=b3=Nim6zfPRK0Dp1w29KfSQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 11 Jul 2022 02:27:55 +0200
X-Gmail-Original-Message-ID: <CAHmME9qqOVhKOiCc=UVZcj07GwGFcBJB6UdOY5LXpFpy9GA=Rg@mail.gmail.com>
Message-ID: <CAHmME9qqOVhKOiCc=UVZcj07GwGFcBJB6UdOY5LXpFpy9GA=Rg@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: pass random seed to fdt
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=G9Ii=XQ=zx2c4.com=Jason@kernel.org;
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

On 7/11/22, Alistair Francis <alistair23@gmail.com> wrote:
> On Fri, Jul 8, 2022 at 7:56 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>>
>> Hi Alistair,
>>
>> On 7/8/22, Alistair Francis <alistair23@gmail.com> wrote:
>>
>> >> > but I think that's just the way things go unfortunately.
>> >
>> > Hmm... That's a pain. So there is a bug in older kernels where they
>> > won't boot if we specify this?
>> >
>> > Can you point to the fixes?
>>
>> Actually, in trying to reproduce this, I don't actually think this is
>> affected by those old random.c bugs.
>>
>>
>> >> As for your 5.8 issue, I've been trying to reproduce that to
>> >> understand
>> >> more about it, but I'm unable to. I've been trying with
>> >> nommu_virt_defconfig using my patch ontop of qemu master. Maybe it's
>> >> possible in testing this out you were testing the wrong branch?
>> >> Anyway,
>> >> it'd be nice to get this queued up...
>> >
>> > Hmm... you can't reproduce it?
>>
>> No, I can't, and I'm now no longer convinced that there *is* a bug.
>> Can you try to repro again and send me detailed reproduction steps?
>
> I just checked again and I can confirm it is this patch that causes
> the regression.
>
> This is the command line:
>
> qemu-system-riscv64 \
> -machine virt -m 64M \
> -cpu rv64,mmu=false \
> -serial mon:stdio -serial null -nographic \
> -append "root=/dev/vda rw highres=off  console=ttyS0 mem=1G ip=dhcp
> earlycon=sbi" \
> -device virtio-net-device,netdev=net0,mac=52:54:00:12:34:02 -netdev
> user,id=net0 \
> -object rng-random,filename=/dev/urandom,id=rng0 -device
> virtio-rng-device,rng=rng0 \
> -smp 1 -d guest_errors \
> -kernel ./images/qemuriscv64/nommu-Image \
> -drive
> id=disk0,file=./images/qemuriscv64/nommu-rootfs.ext2,if=none,format=raw \
> -device virtio-blk-device,drive=disk0 -bios none
>
> You can access the images from:
> https://nextcloud.alistair23.me/index.php/s/a2zrtbT7DjdTx9t
>

Thanks. Can you send the kernel . config too?

Jason

