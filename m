Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D15A168F6A9
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 19:11:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPouP-0007vy-3N; Wed, 08 Feb 2023 13:11:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPouL-0007v7-Ra
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 13:11:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPouJ-00047A-HD
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 13:11:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675879857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w9/f/MOvQp5IAgOQDRaxUjgUOW0JDTw4EI3n537Ih6U=;
 b=IQuatSUtlAVsL9i6EC8pZ64rb3yBWYHCTA9acXX/MLfpgWo7gwIy3HLInrgUimbhqpLAHN
 0VsTOF0HsI1Sj/Z5fl5aCPZtW4Ffh4y5rsZ2J4tcDWeESjUNP/efVi5K/XjaXdM90L0Ybz
 AjtHXZdpgpja+KBzmM1mivbtRp+KDqw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-346-RMWwf455OC-AOcsKpcf9Aw-1; Wed, 08 Feb 2023 13:10:56 -0500
X-MC-Unique: RMWwf455OC-AOcsKpcf9Aw-1
Received: by mail-ed1-f72.google.com with SMTP id
 g25-20020aa7c859000000b004a3fe4cbb0cso12838163edt.17
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 10:10:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w9/f/MOvQp5IAgOQDRaxUjgUOW0JDTw4EI3n537Ih6U=;
 b=VIUZSAnNE7ykYtKl8JxUhStd481NDNOnUW/dIg3nneiQYbRGZpuiHQdCQgl/9fYjL7
 GfAVW4yy6xjS1LCB1xyrBTU4xQCm2zHMeQY1ZuEf4ikSaIV7qDlWlHeyEdyVUM76DtA9
 CSA2f5T7UwdSk8bAxKaM2gtpGRBX74po+CZEiKYmKcnep2ww0D1aVlkAtSdukVrZ7EmJ
 Fnm4fBRPAi66T83hevQyFY6uX0PRk9Hvlxoy4fp/YSincm8Nnu83TrmBY7ngkA0WAoZM
 +9+n9K+4wj0SspyEWqFJIPH79H00xsvqcnOtRqXuXKcsa8FYgYvbDp3GeyHlBKnSsWRi
 3Sdg==
X-Gm-Message-State: AO0yUKUEKcarskQQUOE9nD0u3z4TYw1WLjNClxPG7Z+inpbdfsx3w58d
 JzlJFdOXP3S/cpAtQpfcLDzOHZsjsnDY0bMML7YdNZKIQLPau12rlv3SOqxwWbwuMvhAsy8Qj+a
 Hnj3jYDuu6MQqsiE=
X-Received: by 2002:a50:8746:0:b0:4a0:e234:5351 with SMTP id
 6-20020a508746000000b004a0e2345351mr9582159edv.15.1675879855088; 
 Wed, 08 Feb 2023 10:10:55 -0800 (PST)
X-Google-Smtp-Source: AK7set8KbCd/jX0TGW03RDuhZNYyg1q2LUeQ1QMJZ7jKfoCOrGy4UjA3Z4M5GoaTHaEqDrf7ZXxdew==
X-Received: by 2002:a50:8746:0:b0:4a0:e234:5351 with SMTP id
 6-20020a508746000000b004a0e2345351mr9582140edv.15.1675879854844; 
 Wed, 08 Feb 2023 10:10:54 -0800 (PST)
Received: from redhat.com ([2.52.132.212]) by smtp.gmail.com with ESMTPSA id
 v21-20020a50d595000000b004aaa09d50adsm6415207edi.94.2023.02.08.10.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 10:10:54 -0800 (PST)
Date: Wed, 8 Feb 2023 13:10:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Nathan Chancellor <nathan@kernel.org>, pbonzini@redhat.com,
 ebiggers@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 qemu-devel@nongnu.org, ardb@kernel.org, kraxel@redhat.com,
 hpa@zytor.com, bp@alien8.de, philmd@linaro.org
Subject: Re: [PATCH qemu v3] x86: don't let decompressed kernel image clobber
 setup_data
Message-ID: <20230208130835-mutt-send-email-mst@kernel.org>
References: <Y69fUstLKNv/RLd7@zx2c4.com>
 <20221230220725.618763-1-Jason@zx2c4.com>
 <Y+Pf0q6LmQKN+FHo@dev-arch.thelio-3990X>
 <CAHmME9pQ6yvRQzzT_k0vmDFi4QioCfgryCebhvfNCWNP_tkddQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHmME9pQ6yvRQzzT_k0vmDFi4QioCfgryCebhvfNCWNP_tkddQ@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Wed, Feb 08, 2023 at 02:54:41PM -0300, Jason A. Donenfeld wrote:
> Hi Nathan (and MST),
> 
> On Wed, Feb 8, 2023 at 2:45 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > Hi Jason,
> >
> > On Fri, Dec 30, 2022 at 11:07:25PM +0100, Jason A. Donenfeld wrote:
> > > The setup_data links are appended to the compressed kernel image. Since
> > > the kernel image is typically loaded at 0x100000, setup_data lives at
> > > `0x100000 + compressed_size`, which does not get relocated during the
> > > kernel's boot process.
> > >
> > > The kernel typically decompresses the image starting at address
> > > 0x1000000 (note: there's one more zero there than the compressed image
> > > above). This usually is fine for most kernels.
> > >
> > > However, if the compressed image is actually quite large, then
> > > setup_data will live at a `0x100000 + compressed_size` that extends into
> > > the decompressed zone at 0x1000000. In other words, if compressed_size
> > > is larger than `0x1000000 - 0x100000`, then the decompression step will
> > > clobber setup_data, resulting in crashes.
> > >
> > > Visually, what happens now is that QEMU appends setup_data to the kernel
> > > image:
> > >
> > >           kernel image            setup_data
> > >    |--------------------------||----------------|
> > > 0x100000                  0x100000+l1     0x100000+l1+l2
> > >
> > > The problem is that this decompresses to 0x1000000 (one more zero). So
> > > if l1 is > (0x1000000-0x100000), then this winds up looking like:
> > >
> > >           kernel image            setup_data
> > >    |--------------------------||----------------|
> > > 0x100000                  0x100000+l1     0x100000+l1+l2
> > >
> > >                                  d e c o m p r e s s e d   k e r n e l
> > >                      |-------------------------------------------------------------|
> > >                 0x1000000                                                     0x1000000+l3
> > >
> > > The decompressed kernel seemingly overwriting the compressed kernel
> > > image isn't a problem, because that gets relocated to a higher address
> > > early on in the boot process, at the end of startup_64. setup_data,
> > > however, stays in the same place, since those links are self referential
> > > and nothing fixes them up.  So the decompressed kernel clobbers it.
> > >
> > > Fix this by appending setup_data to the cmdline blob rather than the
> > > kernel image blob, which remains at a lower address that won't get
> > > clobbered.
> > >
> > > This could have been done by overwriting the initrd blob instead, but
> > > that poses big difficulties, such as no longer being able to use memory
> > > mapped files for initrd, hurting performance, and, more importantly, the
> > > initrd address calculation is hard coded in qboot, and it always grows
> > > down rather than up, which means lots of brittle semantics would have to
> > > be changed around, incurring more complexity. In contrast, using cmdline
> > > is simple and doesn't interfere with anything.
> > >
> > > The microvm machine has a gross hack where it fiddles with fw_cfg data
> > > after the fact. So this hack is updated to account for this appending,
> > > by reserving some bytes.
> > >
> > > Cc: x86@kernel.org
> > > Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
> > > Cc: H. Peter Anvin <hpa@zytor.com>
> > > Cc: Borislav Petkov <bp@alien8.de>
> > > Cc: Eric Biggers <ebiggers@kernel.org>
> > > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> >
> > I apologize if this has already been reported/fixed already (I did a
> > brief search on lore.kernel.org) or if my terminology is not as precise
> > as it could be, I am a little out of my element here :)
> >
> > After this change as commit eac7a7791b ("x86: don't let decompressed
> > kernel image clobber setup_data") in QEMU master, I am no longer able to
> > boot a kernel directly through OVMF using '-append' + '-initrd' +
> > '-kernel'. Instead, systemd-boot tries to start the distribution's
> > kernel, which fails with:
> >
> >   Error registering initrd: Already started
> >
> > This can be reproduced with just a defconfig Linux kernel (I used
> > 6.2-rc7), the simple buildroot images that ClangBuiltLinux uses for
> > boot testing [1], and OVMF. Prior to this change, the kernel would start
> > up but after, I am dumped into the UEFI shell (as there is no
> > bootloader).
> >
> > The QEMU command I used was:
> >
> > $ qemu-system-x86_64 \
> >     -kernel arch/x86_64/boot/bzImage \
> >     -append "console=ttyS0 earlycon=uart8250,io,0x3f8" \
> >     -drive if=pflash,format=raw,file=/usr/share/edk2/x64/OVMF_CODE.fd,readonly=on
> >     -drive if=pflash,format=raw,file=../boot-utils/images/x86_64/OVMF_VARS.fd \
> 
> Oh no... Without jumping into it, at first glance, I have absolutely
> no idea. I suppose I could start debugging it and probably come up
> with a solution, but...
> 
> @mst - I'm beginning to think that this whole setup_data route is
> cursed. This is accumulating hacks within hacks within hacks. What
> would you think if I just send a patch *removing* all use of
> setup_data (the rng seed and the dtb thing), and then we can gradually
> add that back with an actual overarching design. For example, it'd
> probably make sense to have a separate fwcfg file for setup_data
> rather than trying to mangle and existing one, etc. This way, we
> unbreak the tree, and let the new approach be reviewed more
> reasonably.
> 
> Jason

Yea basically this is close to what I proposed. I can't off-hand figure
out whether just dropping all of this is fine or we need some compat
hacks to enable this in some way for 7.2, and it's pretty late here.
Suggestions welcome.

-- 
MST


