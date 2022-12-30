Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8AB659AD7
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 18:09:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBIrK-0000U1-J6; Fri, 30 Dec 2022 12:07:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=ek1s=44=zx2c4.com=Jason@kernel.org>)
 id 1pBIrE-0000TB-Ac
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 12:07:48 -0500
Received: from ams.source.kernel.org ([145.40.68.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=ek1s=44=zx2c4.com=Jason@kernel.org>)
 id 1pBIrC-0003pU-8W
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 12:07:48 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A213EB81A8D
 for <qemu-devel@nongnu.org>; Fri, 30 Dec 2022 17:07:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F57C433EF
 for <qemu-devel@nongnu.org>; Fri, 30 Dec 2022 17:07:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="lcUDeWf4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1672420057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WjxzHUW+ATNpAsgtDaf/I/iJFdkXQhViNn4fOLIII1s=;
 b=lcUDeWf4lKIHAVVyjoGjO8ijI+NNWVxDI27VVjPfGAWwA+LQVx1vyNOwDB8IEG7068c3W4
 pGlYYCgvyZ7/3H3uOuceF2NqW1fXnyblaeuM989wZQoLbpb9PEq6RG2KpHw6S1TGvQinm9
 /6hrWRTQO5i5EZCxX3Nm7e03tVlMgPU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3ad58230
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Fri, 30 Dec 2022 17:07:37 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-45ef306bd74so304494307b3.2
 for <qemu-devel@nongnu.org>; Fri, 30 Dec 2022 09:07:36 -0800 (PST)
X-Gm-Message-State: AFqh2kqQJYkjEeKORSP7tDurNbu/wjUR7YTA5J0Dpgzbd5P9BXwRcmYb
 R/h4rcFer0noiie8m8pH0x/YlfePbKi13OBOlnM=
X-Google-Smtp-Source: AMrXdXvsN2S5QMH5JwSJbK4YGg/FwFOqsInD94Pqq2iqhoozxwTRcxxJ8vkAgXoeUd37EP8apgr/zXKfuzFfEv/NOok=
X-Received: by 2002:a05:690c:a83:b0:36f:de9a:3229 with SMTP id
 ci3-20020a05690c0a8300b0036fde9a3229mr3490284ywb.143.1672420055863; Fri, 30
 Dec 2022 09:07:35 -0800 (PST)
MIME-Version: 1.0
References: <20221228143831.396245-1-Jason@zx2c4.com>
 <6cab26b5-06ae-468d-ac79-ecdecb86ef07@linaro.org>
 <Y6xvJheSYC83voCZ@zx2c4.com> <Y6x1knb8udpSyMSp@zx2c4.com>
 <9188EEE9-2759-4389-B39E-0FEBBA3FA57D@zytor.com>
 <Y6z765zHrQ6Rl/0o@zx2c4.com> <AF921575-0968-434A-8B46-095B78C209C1@zytor.com>
 <Y62MdawGaasXmoVL@zn.tnic> <Y68Js5b0jW/2nLU4@zx2c4.com>
 <Y68Zf/MKmX3Rr18E@zn.tnic>
In-Reply-To: <Y68Zf/MKmX3Rr18E@zn.tnic>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 30 Dec 2022 18:07:24 +0100
X-Gmail-Original-Message-ID: <CAHmME9oPUJemVRvO3HX0q4BJGTFuzbLYANeizuRcNq2=Ykk1Gg@mail.gmail.com>
Message-ID: <CAHmME9oPUJemVRvO3HX0q4BJGTFuzbLYANeizuRcNq2=Ykk1Gg@mail.gmail.com>
Subject: Re: [PATCH qemu] x86: don't let decompressed kernel image clobber
 setup_data
To: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>, pbonzini@redhat.com, ebiggers@kernel.org,
 x86@kernel.org, 
 linux-kernel@vger.kernel.org, qemu-devel@nongnu.org, ardb@kernel.org, 
 kraxel@redhat.com, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=ek1s=44=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Dec 30, 2022 at 6:01 PM Borislav Petkov <bp@alien8.de> wrote:
>
> On Fri, Dec 30, 2022 at 04:54:27PM +0100, Jason A. Donenfeld wrote:
> > > Right, with CONFIG_X86_VERBOSE_BOOTUP=y in a guest here, it says:
> > >
> > > early console in extract_kernel
> > > input_data: 0x000000000be073a8
> > > input_len: 0x00000000008cfc43
> > > output: 0x0000000001000000
> > > output_len: 0x000000000b600a98
> > > kernel_total_size: 0x000000000ac26000
> > > needed_size: 0x000000000b800000
> > > trampoline_32bit: 0x000000000009d000
> > >
> > > so that's a ~9M kernel which gets decompressed at 0x1000000 and the
> > > output len is, what, ~180M which looks like plenty to me...
> >
> > I think you might have misunderstood the thread.
>
> Maybe...
>
> I've been trying to make sense of all the decompression dancing we're doing and
> the diagrams you've drawn and there's a comment over extract_kernel() which
> basically says that the compressed image is at the back of the memory buffer
>
> input_data: 0x000000000be073a8
>
> and we decompress to a smaller address
>
> output: 0x0000000001000000
>
> And, it *looks* like setup_data is at an address somewhere >= 0x1000000 so when
> we start decompressing, we overwrite it.
>
> I guess extract_kernel() could also dump the setup_data addresses so that we can
> verify that...
>
> > First, to reproduce the bug that this patch fixes, you need a kernel with a
> > compressed size of around 16 megs, not 9.
>
> Not only that - you need setup_data to be placed somewhere just so that it gets
> overwritten during decompression. Also, see below.
>
> > Secondly, that crash is well understood and doesn't need to be reproduced;
>
> Is it?
>
> Where do you get the 0x100000 as the starting address of the kernel image?
>
> Because input_data above says that the input address is somewhere higher...

Look closer at the boot process. The compressed image is initially at
0x100000, but it gets relocated to a safer area at the end of
startup_64:

/*
 * Copy the compressed kernel to the end of our buffer
 * where decompression in place becomes safe.
 */
        pushq   %rsi
        leaq    (_bss-8)(%rip), %rsi
        leaq    rva(_bss-8)(%rbx), %rdi
        movl    $(_bss - startup_32), %ecx
        shrl    $3, %ecx
        std
        rep     movsq
        cld
        popq    %rsi

        /*
         * The GDT may get overwritten either during the copy we just did or
         * during extract_kernel below. To avoid any issues, repoint the GDTR
         * to the new copy of the GDT.
         */
        leaq    rva(gdt64)(%rbx), %rax
        leaq    rva(gdt)(%rbx), %rdx
        movq    %rdx, 2(%rax)
        lgdt    (%rax)

/*
 * Jump to the relocated address.
 */
        leaq    rva(.Lrelocated)(%rbx), %rax
        jmp     *%rax

And that address winds up being calculated with a combination of the
image size and the init_size param, so it's safe. Decompression won't
overwrite the compressed kernel.

HOWEVER, qemu currently appends setup_data to the end of the
compressed kernel image, and this part isn't moved, and setup_data
links aren't walked/relocated. So that means the original address
remains, of 0x100000.

Jason

