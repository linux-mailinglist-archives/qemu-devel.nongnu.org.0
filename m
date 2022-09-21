Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AFE5BFAC8
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 11:23:59 +0200 (CEST)
Received: from localhost ([::1]:46218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oavxV-0008PX-TT
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 05:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=I7lL=ZY=zx2c4.com=Jason@kernel.org>)
 id 1oavq0-0001X3-Jc
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 05:16:13 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:46732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=I7lL=ZY=zx2c4.com=Jason@kernel.org>)
 id 1oavpy-00073p-Pf
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 05:16:12 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7C68A6302D
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 09:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C88FC43140
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 09:16:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="WmZmpU3c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1663751766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WmQX/AvJfeY73pfC7y1E+d7B5gbCsDb02Um00OTu7no=;
 b=WmZmpU3c++Tt1LufoMYZb42rIYaNP73kWPu3hFc4ZTIx8nsMsLyaaOfTV/Y0xMsIvVk4ad
 6mvwRIAr6Zir2ng2b8utj6dC9iBWCslGRVo0tC9WOWm8tMMiFc6E4vtHOiS1aepcls8xrD
 glRdyzkekzA+R4SWPF1fz5VDa4whqSc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 840bd669
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Wed, 21 Sep 2022 09:16:06 +0000 (UTC)
Received: by mail-vk1-f180.google.com with SMTP id bi53so2803446vkb.12
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 02:16:06 -0700 (PDT)
X-Gm-Message-State: ACrzQf0p3NxEWZwwRRJJB8StASvFUg3vOSnVQT6gHi74IXnmPtIpqbln
 JF2Z+PmSK7v25IWUu2j0Y/g2AZ+eRYMgB1HRSuU=
X-Google-Smtp-Source: AMsMyM52zAfZG/5wzBj/+XoTOiVMz4tNia373keRYODCeU+yrV7gcs3rhB4KaFpvdAy68DiipNkewo/WfAA7zVqluMo=
X-Received: by 2002:a1f:24b:0:b0:3a3:ad4:a3b2 with SMTP id
 72-20020a1f024b000000b003a30ad4a3b2mr8895388vkc.13.1663751765456; 
 Wed, 21 Sep 2022 02:16:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220913234135.255426-1-Jason@zx2c4.com>
 <20220921051314-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220921051314-mutt-send-email-mst@kernel.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 21 Sep 2022 11:15:54 +0200
X-Gmail-Original-Message-ID: <CAHmME9ohQgt313K8e-3oNTZFb4TFNdTiua-6mJV5C5rvzeVbQA@mail.gmail.com>
Message-ID: <CAHmME9ohQgt313K8e-3oNTZFb4TFNdTiua-6mJV5C5rvzeVbQA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] x86: return modified setup_data only if read as
 memory, not as file
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=I7lL=ZY=zx2c4.com=Jason@kernel.org;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 21, 2022 at 11:15 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Sep 14, 2022 at 12:41:34AM +0100, Jason A. Donenfeld wrote:
> > If setup_data is being read into a specific memory location, then
> > generally the setup_data address parameter is read first, so that the
> > caller knows where to read it into. In that case, we should return
> > setup_data containing the absolute addresses that are hard coded and
> > determined a priori. This is the case when kernels are loaded by BIOS,
> > for example. In contrast, when setup_data is read as a file, then we
> > shouldn't modify setup_data, since the absolute address will be wrong b=
y
> > definition. This is the case when OVMF loads the image.
> >
> > This allows setup_data to be used like normal, without crashing when EF=
I
> > tries to use it.
> >
> > (As a small development note, strangely, fw_cfg_add_file_callback() was
> > exported but fw_cfg_add_bytes_callback() wasn't, so this makes that
> > consistent.)
> >
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Laurent Vivier <laurent@vivier.eu>
> > Cc: Michael S. Tsirkin <mst@redhat.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Peter Maydell <peter.maydell@linaro.org>
> > Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > Cc: Richard Henderson <richard.henderson@linaro.org>
> > Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > ---
> >  hw/i386/x86.c             | 37 +++++++++++++++++++++++++++----------
> >  hw/nvram/fw_cfg.c         | 12 ++++++------
> >  include/hw/nvram/fw_cfg.h | 22 ++++++++++++++++++++++
> >  3 files changed, 55 insertions(+), 16 deletions(-)
> >
> > diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> > index 050eedc0c8..933bbdd836 100644
> > --- a/hw/i386/x86.c
> > +++ b/hw/i386/x86.c
> > @@ -764,6 +764,18 @@ static bool load_elfboot(const char *kernel_filena=
me,
> >      return true;
> >  }
> >
> > +struct setup_data_fixup {
> > +    void *pos;
> > +    hwaddr val;
> > +    uint32_t addr;
> > +};
> > +
>
> btw
>
>         typedef struct SetupDataFixup {
>             void *pos;
>             hwaddr val;
>             uint32_t addr;
>         } SetupDataFixup;
>
>
> and use typedef everywhere.

Okay no problem. Will do for v5.

Jason

