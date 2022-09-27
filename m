Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FED5EB73C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 03:53:19 +0200 (CEST)
Received: from localhost ([::1]:41420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oczmf-0000iH-SK
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 21:53:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1oczix-0006ks-Ut; Mon, 26 Sep 2022 21:49:27 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:54912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1ocziv-0006V7-0F; Mon, 26 Sep 2022 21:49:27 -0400
Received: by mail-wm1-x32c.google.com with SMTP id iv17so5618410wmb.4;
 Mon, 26 Sep 2022 18:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=hoiryJPmGl5Er+ZL60lPwMneSSG19Thb7YmdjmuEOj8=;
 b=dogXk3J1RQUJK+YBHQmDql6hK0EryPNP/P5RgnPGzz3zoF/6wPEZc1Vaiwd3PL51vk
 p3dwjjmLxXx8SVHrJQY+BQmNRNwVzWTmM4n0+UPCR7bby/IyoB0WRGZMRfLVfbL5gjAp
 cXUIUdK+bIlOgmpBBMDx6QOMK4MNunZXO8xno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=hoiryJPmGl5Er+ZL60lPwMneSSG19Thb7YmdjmuEOj8=;
 b=nvVlvZlF39auhXLpkQY0WmAojWlu1HKIYT0UJPZqfKiSH+8C7rGeBMLb/pv0/ZbkWa
 gPVIJR9Vdt6wCBBvKW31MxyThk6lPa730hrWZbFhrRBYwTHPEkuf8VmH4+QAf9pAZlM1
 ws0FBJkiHV/KdoMIkcIaHwn28L8BNUTEl+DMJOEdder4rcuA74n58Z+JI405nrurO83I
 A7aWcTDhuth7QTKofCXycIGxmAiuNFHmwYTBwhQ9fRkU5CFaPdURv3X3+85oXqKlhQe+
 x3ZfdwmGFgYAZXuzPkxaXov/YR9oHVV6LaiYtEcOX8YJ8pc5mBM9ftnHXi+xEc4UEi50
 4cDw==
X-Gm-Message-State: ACrzQf0WT/An3gbmFtHibqMsk0BER0+j0u7CUW+8K9YuNS50/m79I3Us
 TIbZ9E/5bJPFscQcrI/PM2Bk+XFE53rqzJwAujg=
X-Google-Smtp-Source: AMsMyM5KQQCzx4vwiasZT7iLFgdQAwOk2u8zJ+p5mqFsUYn3tsDCn+9foEzbXsHAKXd8YMbcRjRqq0fPRMF7dGv43Xc=
X-Received: by 2002:a05:600c:a48:b0:3b3:3256:63c with SMTP id
 c8-20020a05600c0a4800b003b33256063cmr886201wmq.34.1664243359670; Mon, 26 Sep
 2022 18:49:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220926062608.3930789-1-clg@kaod.org>
 <44c772eb-cf7a-c6ac-8eed-8cc35501e46a@kaod.org>
In-Reply-To: <44c772eb-cf7a-c6ac-8eed-8cc35501e46a@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 27 Sep 2022 01:49:07 +0000
Message-ID: <CACPK8XduDO=ORw1rj5E2bdzCigv3+_UR5SNF3FA8oJPnBr=S8w@mail.gmail.com>
Subject: Re: [RFC PATCH] ast2600: Fix CPU features
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=joel.stan@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, 26 Sept 2022 at 07:05, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 9/26/22 08:26, C=C3=A9dric Le Goater wrote:
> > Currently, the CPU features exposed to the AST2600 QEMU machines are :
> >
> >    half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva idivt
> >    vfpd32 lpae evtstrm
> >
> > But, the features of the Cortex A7 CPU on the Aspeed AST2600 A3 SoC
> > are :
> >
> >    half thumb fastmult vfp edsp vfpv3 vfpv3d16 tls vfpv4 idiva idivt
> >    lpae evtstrm
> >
> > The vfpv3d16 feature bit is common to both vfpv3 and vfpv4, and for
> > this SoC, QEMU should advertise a VFPv4 unit with 16 double-precision
> > registers, and not 32 registers.
> >
> > Drop neon support and hack the default mvfr0 register value of the
> > cortex A7 to advertise 16 registers.
> >
> > How can that be done cleanly ? Should we :
> >
> >   * introduce a new A7 CPU with its own _initfn routine ?
> >   * introduce a new CPU property to set the number of "Advanced SIMD
> >     and floating-point" registers in arm_cpu_realizefn() ?
>
> This is a note in the Cortex A7 MPCore Technical reference saying :
>
> "When FPU option is selected without NEON, the FPU is VFPv4-D16 and uses =
16
> double-precision registers. When the FPU is implemented with NEON, the FP=
U is
> VFPv4-D32 and uses 32 double-precision registers. This register bank is s=
hared
> with NEON."

The datasheet only has this to say:

"1.2GHz dual-core ARM Cortex A7 (r0p5) 32-bit CPU with FPU"

With no details about the FPU. The hardware is a golden reference though:

 fpsid: 41023075
 mvfr0: 10110221
 mvfr1: 11000011

$ bitfield mvfr0 0x10110221
decoding as Media and VFP Feature Register 0
0x10110221 [269550113]
      A_SIMD registers: 0x1 [16 x 64-bit registers]
      Single precision: 0x2 [Supported, VFPv4 or VFPv3]
      Double precision: 0x2 [Supported, VFPv4 or VFPv3]
VFP exception trapping: 0x0 [Not supported]
                Divide: 0x1 [Hardware divide is supported]
           Square Root: 0x1 [Hardware square root supported]
         Short vectors: 0x0 [Not supported]
    VFP Rounding Modes: 0x1 [All modes supported]

$ bitfield mvfr1 0x11000011
decoding as Media and VFP Feature Register 1
0x11000011 [285212689]
               FZ: 0x1
       D_NaN mode: 0x1
A_SIMD load/store: 0x0
   A_SIMD integer: 0x0
      A_SIMD SPFP: 0x0
      A_SIMD HPFP: 0x0
         VFP HPFP: 0x2
      A_SIMD FMAC: 0x1

As you say, no NEON  and 16 64-bit registers.

>
> Could we deduce the number of registers from the availability of the NEON
> feature, on A7 only ?

We certainly should make the NEON property match the mvfr1 value.
Linux tests for NEON with this:

   (fmrx(MVFR1) & 0x000fff00) =3D=3D 0x00011100)

https://elixir.bootlin.com/linux/v5.19/source/arch/arm/vfp/vfpmodule.c#L812

Cheers,

Joel

> >
> > This problem was raised by a buildroot rootfs compiled with vfpv4.
> > Boot went fine under QEMU but on real HW, user space binaries had
> > issues with output. Compiling buildroot with vfpv4d16 fixed it and
> > I didn't dig further. Nevertheless, it would be nice to catch such
> > issues with QEMU.
> >
> > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> > ---
> >   hw/arm/aspeed_ast2600.c | 2 ++
> >   target/arm/cpu_tcg.c    | 2 +-
> >   2 files changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> > index dcdc9bc54456..af987fd418ec 100644
> > --- a/hw/arm/aspeed_ast2600.c
> > +++ b/hw/arm/aspeed_ast2600.c
> > @@ -330,6 +330,8 @@ static void aspeed_soc_ast2600_realize(DeviceState =
*dev, Error **errp)
> >
> >           object_property_set_int(OBJECT(&s->cpu[i]), "cntfrq", 1125000=
000,
> >                                   &error_abort);
> > +        object_property_set_bool(OBJECT(&s->cpu[i]), "neon", false,
> > +                                &error_abort);
> >           object_property_set_link(OBJECT(&s->cpu[i]), "memory",
> >                                    OBJECT(s->memory), &error_abort);
> >
> > diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
> > index 98b5ba216041..b3f93783a061 100644
> > --- a/target/arm/cpu_tcg.c
> > +++ b/target/arm/cpu_tcg.c
> > @@ -545,7 +545,7 @@ static void cortex_a7_initfn(Object *obj)
> >       cpu->kvm_target =3D QEMU_KVM_ARM_TARGET_CORTEX_A7;
> >       cpu->midr =3D 0x410fc075;
> >       cpu->reset_fpsid =3D 0x41023075;
> > -    cpu->isar.mvfr0 =3D 0x10110222;
> > +    cpu->isar.mvfr0 =3D 0x10110221; /* SIMDREG =3D=3D 0x1 -> 16 regist=
ers */
> >       cpu->isar.mvfr1 =3D 0x11111111;
> >       cpu->ctr =3D 0x84448003;
> >       cpu->reset_sctlr =3D 0x00c50078;
>

