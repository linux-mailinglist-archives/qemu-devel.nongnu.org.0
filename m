Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB3068F632
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 18:55:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPofE-0002Q7-Nq; Wed, 08 Feb 2023 12:55:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Pi03=6E=zx2c4.com=Jason@kernel.org>)
 id 1pPofA-0002NL-QZ
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:55:20 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Pi03=6E=zx2c4.com=Jason@kernel.org>)
 id 1pPof7-0002Cq-0O
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:55:20 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DEDE961792
 for <qemu-devel@nongnu.org>; Wed,  8 Feb 2023 17:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54928C4339E
 for <qemu-devel@nongnu.org>; Wed,  8 Feb 2023 17:55:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="gF45GKbE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1675878908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NX9PPmf+UtKBiMc3Pr/UMujDXNlvFeRU34FW2V7wq6I=;
 b=gF45GKbEv6ZbWqxPeiHLMoSQ0koS1/PGV52YmqX2tzqerzYlpj5he+/YL3r+yBFN6c2lC4
 t4dtav52gRboJWQGSXsv/ZNWL5spo1XYeYTKPjAfgv5HtEHaUgygrgWOrZaISlB6RWLPmY
 wju/kmo2kKYs93vCZya150FmU+wXKMI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 63267c7a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Wed, 8 Feb 2023 17:55:08 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id x4so23035732ybp.1
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 09:55:07 -0800 (PST)
X-Gm-Message-State: AO0yUKXxCWhdiAWSbEvc/8BYVoLKWyt/kZDNcEiRVO/N14QX0oRSXXmt
 +P+92qfnUQ5UIehi5tHoY9DKvQct2g3drbXHRzI=
X-Google-Smtp-Source: AK7set8WhMTDtwuneLf6Ea9rnPzajeUh0PcK6xC4f6mhoGkI2eEn/DGqu0qN6G8FPBWZUUh6dpohxbiwV1LwZ0pcNBg=
X-Received: by 2002:a5b:6c5:0:b0:88f:946:bd98 with SMTP id
 r5-20020a5b06c5000000b0088f0946bd98mr1067931ybq.24.1675878906349; 
 Wed, 08 Feb 2023 09:55:06 -0800 (PST)
MIME-Version: 1.0
References: <Y69fUstLKNv/RLd7@zx2c4.com>
 <20221230220725.618763-1-Jason@zx2c4.com>
 <Y+Pf0q6LmQKN+FHo@dev-arch.thelio-3990X>
In-Reply-To: <Y+Pf0q6LmQKN+FHo@dev-arch.thelio-3990X>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 8 Feb 2023 14:54:41 -0300
X-Gmail-Original-Message-ID: <CAHmME9pQ6yvRQzzT_k0vmDFi4QioCfgryCebhvfNCWNP_tkddQ@mail.gmail.com>
Message-ID: <CAHmME9pQ6yvRQzzT_k0vmDFi4QioCfgryCebhvfNCWNP_tkddQ@mail.gmail.com>
Subject: Re: [PATCH qemu v3] x86: don't let decompressed kernel image clobber
 setup_data
To: Nathan Chancellor <nathan@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: pbonzini@redhat.com, ebiggers@kernel.org, x86@kernel.org, 
 linux-kernel@vger.kernel.org, qemu-devel@nongnu.org, ardb@kernel.org, 
 kraxel@redhat.com, hpa@zytor.com, bp@alien8.de, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=Pi03=6E=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

Hi Nathan (and MST),

On Wed, Feb 8, 2023 at 2:45 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Jason,
>
> On Fri, Dec 30, 2022 at 11:07:25PM +0100, Jason A. Donenfeld wrote:
> > The setup_data links are appended to the compressed kernel image. Since
> > the kernel image is typically loaded at 0x100000, setup_data lives at
> > `0x100000 + compressed_size`, which does not get relocated during the
> > kernel's boot process.
> >
> > The kernel typically decompresses the image starting at address
> > 0x1000000 (note: there's one more zero there than the compressed image
> > above). This usually is fine for most kernels.
> >
> > However, if the compressed image is actually quite large, then
> > setup_data will live at a `0x100000 + compressed_size` that extends int=
o
> > the decompressed zone at 0x1000000. In other words, if compressed_size
> > is larger than `0x1000000 - 0x100000`, then the decompression step will
> > clobber setup_data, resulting in crashes.
> >
> > Visually, what happens now is that QEMU appends setup_data to the kerne=
l
> > image:
> >
> >           kernel image            setup_data
> >    |--------------------------||----------------|
> > 0x100000                  0x100000+l1     0x100000+l1+l2
> >
> > The problem is that this decompresses to 0x1000000 (one more zero). So
> > if l1 is > (0x1000000-0x100000), then this winds up looking like:
> >
> >           kernel image            setup_data
> >    |--------------------------||----------------|
> > 0x100000                  0x100000+l1     0x100000+l1+l2
> >
> >                                  d e c o m p r e s s e d   k e r n e l
> >                      |-------------------------------------------------=
------------|
> >                 0x1000000                                              =
       0x1000000+l3
> >
> > The decompressed kernel seemingly overwriting the compressed kernel
> > image isn't a problem, because that gets relocated to a higher address
> > early on in the boot process, at the end of startup_64. setup_data,
> > however, stays in the same place, since those links are self referentia=
l
> > and nothing fixes them up.  So the decompressed kernel clobbers it.
> >
> > Fix this by appending setup_data to the cmdline blob rather than the
> > kernel image blob, which remains at a lower address that won't get
> > clobbered.
> >
> > This could have been done by overwriting the initrd blob instead, but
> > that poses big difficulties, such as no longer being able to use memory
> > mapped files for initrd, hurting performance, and, more importantly, th=
e
> > initrd address calculation is hard coded in qboot, and it always grows
> > down rather than up, which means lots of brittle semantics would have t=
o
> > be changed around, incurring more complexity. In contrast, using cmdlin=
e
> > is simple and doesn't interfere with anything.
> >
> > The microvm machine has a gross hack where it fiddles with fw_cfg data
> > after the fact. So this hack is updated to account for this appending,
> > by reserving some bytes.
> >
> > Cc: x86@kernel.org
> > Cc: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > Cc: H. Peter Anvin <hpa@zytor.com>
> > Cc: Borislav Petkov <bp@alien8.de>
> > Cc: Eric Biggers <ebiggers@kernel.org>
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
>
> I apologize if this has already been reported/fixed already (I did a
> brief search on lore.kernel.org) or if my terminology is not as precise
> as it could be, I am a little out of my element here :)
>
> After this change as commit eac7a7791b ("x86: don't let decompressed
> kernel image clobber setup_data") in QEMU master, I am no longer able to
> boot a kernel directly through OVMF using '-append' + '-initrd' +
> '-kernel'. Instead, systemd-boot tries to start the distribution's
> kernel, which fails with:
>
>   Error registering initrd: Already started
>
> This can be reproduced with just a defconfig Linux kernel (I used
> 6.2-rc7), the simple buildroot images that ClangBuiltLinux uses for
> boot testing [1], and OVMF. Prior to this change, the kernel would start
> up but after, I am dumped into the UEFI shell (as there is no
> bootloader).
>
> The QEMU command I used was:
>
> $ qemu-system-x86_64 \
>     -kernel arch/x86_64/boot/bzImage \
>     -append "console=3DttyS0 earlycon=3Duart8250,io,0x3f8" \
>     -drive if=3Dpflash,format=3Draw,file=3D/usr/share/edk2/x64/OVMF_CODE.=
fd,readonly=3Don
>     -drive if=3Dpflash,format=3Draw,file=3D../boot-utils/images/x86_64/OV=
MF_VARS.fd \

Oh no... Without jumping into it, at first glance, I have absolutely
no idea. I suppose I could start debugging it and probably come up
with a solution, but...

@mst - I'm beginning to think that this whole setup_data route is
cursed. This is accumulating hacks within hacks within hacks. What
would you think if I just send a patch *removing* all use of
setup_data (the rng seed and the dtb thing), and then we can gradually
add that back with an actual overarching design. For example, it'd
probably make sense to have a separate fwcfg file for setup_data
rather than trying to mangle and existing one, etc. This way, we
unbreak the tree, and let the new approach be reviewed more
reasonably.

Jason

