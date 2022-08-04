Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D290589CBB
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 15:33:08 +0200 (CEST)
Received: from localhost ([::1]:57500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJayJ-0001DD-0A
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 09:33:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org>)
 id 1oJaZm-0005fh-Oi
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 09:07:55 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:43692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org>)
 id 1oJaZj-0000co-Gk
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 09:07:46 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2C5E9617C5
 for <qemu-devel@nongnu.org>; Thu,  4 Aug 2022 13:07:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C72C433C1
 for <qemu-devel@nongnu.org>; Thu,  4 Aug 2022 13:07:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="jLH9m/iO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1659618458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SHpXpetfvhI+GjnukjzJ1jUP7ZppZWoiQjyERBvsIpk=;
 b=jLH9m/iOLfK7M4SeZFboVPJ7KnujIvuz6hNU8BLjuz51GhWsR378jGDNCM1abrdlRZcWyR
 AKlLKcrA/J4dywy5LngXkOQZj7LADb84m1BCd0NzjvebHC15mms8HQE7jZPJ8qS+xPoapt
 XdvL/mAyRufO221/TKx5M20su+X1JTE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7ea95aea
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Thu, 4 Aug 2022 13:07:38 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-328a1cff250so17991887b3.6
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 06:07:37 -0700 (PDT)
X-Gm-Message-State: ACgBeo2IPeToypJ74XJdwtdJiGe5Eja5D9rzmbiOvt/ldBY4bpmO0bnP
 p/9n9aZMoqPzec7mw/BZ4yWj3Wx3TgLDPceHAQk=
X-Google-Smtp-Source: AA6agR6n0CErDYOCo4pVtebQuVAsWeuo9kEQV1vFNfq9HNitnVeH04jMWbTZmh+Z1vA8B14eFAa7YJMCegzthfMCuro=
X-Received: by 2002:a0d:ca85:0:b0:328:3048:530f with SMTP id
 m127-20020a0dca85000000b003283048530fmr1612943ywd.414.1659618456702; Thu, 04
 Aug 2022 06:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <YusVVLNbLgsk49PK@zx2c4.com>
 <20220804004411.1343158-1-Jason@zx2c4.com>
 <YuvBaxwcWPGvW0gZ@redhat.com>
In-Reply-To: <YuvBaxwcWPGvW0gZ@redhat.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 4 Aug 2022 15:07:25 +0200
X-Gmail-Original-Message-ID: <CAHmME9p-3ssXmyX6D=Ji9mBHqFoB8yeQgfWx=U1qfm1si9q3aQ@mail.gmail.com>
Message-ID: <CAHmME9p-3ssXmyX6D=Ji9mBHqFoB8yeQgfWx=U1qfm1si9q3aQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/i386: place setup_data at fixed place in memory
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Ard Biesheuvel <ardb@kernel.org>, 
 linux-efi <linux-efi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org;
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

On Thu, Aug 4, 2022 at 2:54 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Thu, Aug 04, 2022 at 02:44:11AM +0200, Jason A. Donenfeld wrote:
> > The boot parameter header refers to setup_data at an absolute address,
> > and each setup_data refers to the next setup_data at an absolute addres=
s
> > too. Currently QEMU simply puts the setup_datas right after the kernel
> > image, and since the kernel_image is loaded at prot_addr -- a fixed
> > address knowable to QEMU apriori -- the setup_data absolute address
> > winds up being just `prot_addr + a_fixed_offset_into_kernel_image`.
> >
> > This mostly works fine, so long as the kernel image really is loaded at
> > prot_addr. However, OVMF doesn't load the kernel at prot_addr, and
> > generally EFI doesn't give a good way of predicting where it's going to
> > load the kernel. So when it loads it at some address !=3D prot_addr, th=
e
> > absolute addresses in setup_data now point somewhere bogus, causing
> > crashes when EFI stub tries to follow the next link.
> >
> > Fix this by placing setup_data at some fixed place in memory, relative
> > to real_addr, not as part of the kernel image, and then pointing the
> > setup_data absolute address to that fixed place in memory. This way,
> > even if OVMF or other chains relocate the kernel image, the boot
> > parameter still points to the correct absolute address.
> >
> > Fixes: 3cbeb52467 ("hw/i386: add device tree support")
> > Reported-by: Xiaoyao Li <xiaoyao.li@intel.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Richard Henderson <richard.henderson@linaro.org>
> > Cc: Peter Maydell <peter.maydell@linaro.org>
> > Cc: Michael S. Tsirkin <mst@redhat.com>
> > Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Ard Biesheuvel <ardb@kernel.org>
> > Cc: linux-efi@vger.kernel.org
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > ---
> >  hw/i386/x86.c | 38 ++++++++++++++++++++------------------
> >  1 file changed, 20 insertions(+), 18 deletions(-)
> >
> > diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> > index 050eedc0c8..8b853abf38 100644
> > --- a/hw/i386/x86.c
> > +++ b/hw/i386/x86.c
>
>
> >      if (!legacy_no_rng_seed) {
> > -        setup_data_offset =3D QEMU_ALIGN_UP(kernel_size, 16);
> > -        kernel_size =3D setup_data_offset + sizeof(struct setup_data) =
+ RNG_SEED_LENGTH;
> > -        kernel =3D g_realloc(kernel, kernel_size);
> > -        setup_data =3D (struct setup_data *)(kernel + setup_data_offse=
t);
> > +        setup_data_item_len =3D sizeof(struct setup_data) + RNG_SEED_L=
ENGTH;
> > +        setup_datas =3D g_realloc(setup_datas, setup_data_total_len + =
setup_data_item_len);
> > +        setup_data =3D (struct setup_data *)(setup_datas + setup_data_=
total_len);
> >          setup_data->next =3D cpu_to_le64(first_setup_data);
> > -        first_setup_data =3D prot_addr + setup_data_offset;
> > +        first_setup_data =3D setup_data_base + setup_data_total_len;
> > +        setup_data_total_len +=3D setup_data_item_len;
> >          setup_data->type =3D cpu_to_le32(SETUP_RNG_SEED);
> >          setup_data->len =3D cpu_to_le32(RNG_SEED_LENGTH);
> >          qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH)=
;
> >      }
> >
> > -    /* Offset 0x250 is a pointer to the first setup_data link. */
> > -    stq_p(header + 0x250, first_setup_data);
> > +    if (first_setup_data) {
> > +            /* Offset 0x250 is a pointer to the first setup_data link.=
 */
> > +            stq_p(header + 0x250, first_setup_data);
> > +            rom_add_blob("setup_data", setup_datas, setup_data_total_l=
en, setup_data_total_len,
> > +                         setup_data_base, NULL, NULL, NULL, NULL, fals=
e);
> > +    }
>
> The boot measurements with AMD SEV now succeed, but I'm a little
> worried about the implications of adding this ROM, when a few lines
> later here we're discarding the 'header' changes for AMD SEV. Is
> this still going to operate correctly in the guest OS if we've
> discarded the header changes below ?

I'll add a !sev_enabled() condition to that block too, so it also
skips adding the ROM, for v3.

Jason

