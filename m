Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1657D2EC246
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 18:32:51 +0100 (CET)
Received: from localhost ([::1]:34446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxCfy-0006VO-2u
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 12:32:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxCe9-0005qf-DP
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 12:31:01 -0500
Received: from mail-oi1-f172.google.com ([209.85.167.172]:37889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxCe7-0001qH-UN
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 12:30:57 -0500
Received: by mail-oi1-f172.google.com with SMTP id x13so4247826oic.5
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 09:30:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Coe2ZfFbPuyoy2rzmfLfiVVnHU9VCuQ4e3Afri5ObJM=;
 b=XXd4HiKDo9Oa5xMM703ryMFCVV5UR1SfGV6YmCbSi/DoCIRR677H5xT+FHrKgg3j8x
 ll8OFLM8BB0Ayg5SMgh7oeVdZeSUXUw01j+yTLarhY75CdD6HZeYuLsdTxHBxvxC6mgC
 1ufwSlsFFZVWOJU0D5UPSLQtPVa8tzN8BoS9jgYJKCTWMt7ylHt6TU6WH+PuzQvIsuxc
 rx46PKR3n9p2NrhrEMOP6N+TpLxZcNKvo6J4jUID7XHvLIAtrd8FSGGHHd/hgyBlbkwH
 sr3U08QltXArlz2Yp/2DaKjZsdYRJn+3rJOay+89YlDP76MQN0pNcA9/zwDEC5TVe5U0
 uhrw==
X-Gm-Message-State: AOAM533mHWud3NiI0T8gkoVQV1qcCEuaZGE34avFp5UmKARwO/A8X8kE
 q45C2dusOzuRHzCEvXgeaxTp6CklQQi8yRtGhzs=
X-Google-Smtp-Source: ABdhPJxpPtEPf5Es0kaFrIrALAaiTUg7njgaWJiO5AEs+kA0y1Gs+xVL9dkvH2ecrMACkGsDikio82L/yXVB+CTrW70=
X-Received: by 2002:aca:58d6:: with SMTP id m205mr3829439oib.121.1609954254619; 
 Wed, 06 Jan 2021 09:30:54 -0800 (PST)
MIME-Version: 1.0
References: <20201215064200.28751-1-jiaxun.yang@flygoat.com>
 <20201215064631.30504-1-jiaxun.yang@flygoat.com>
 <105f0d1b-ca44-b7bc-aa11-7179f7d7d081@amsat.org>
In-Reply-To: <105f0d1b-ca44-b7bc-aa11-7179f7d7d081@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Wed, 6 Jan 2021 18:30:43 +0100
Message-ID: <CAAdtpL4gB7qhR68UzFDLMX07qMQPY7xRT36F3eOxhGSN9rng6Q@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] hw/mips/boston: Use bootloader helper to set GCRs
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.167.172;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f172.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Huacai Chen <chenhuacai@kernel.org>, Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 6, 2021 at 6:28 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> On 12/15/20 7:46 AM, Jiaxun Yang wrote:
> > Translate embedded assembly into IO writes which is more
> > readable.
> >
> > Also hardcode cm_base at boot time instead of reading from CP0.
> >
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > ---
> >  hw/mips/boston.c | 45 ++++++++++++---------------------------------
> >  1 file changed, 12 insertions(+), 33 deletions(-)
> >
> > diff --git a/hw/mips/boston.c b/hw/mips/boston.c
> > index b622222c7d..9f08aa7285 100644
> > --- a/hw/mips/boston.c
> > +++ b/hw/mips/boston.c
> > @@ -281,42 +281,21 @@ static void gen_firmware(uint32_t *p, hwaddr kern=
el_entry, hwaddr fdt_addr,
> >      const uint32_t gic_base =3D 0x16120000;
> >      const uint32_t cpc_base =3D 0x16200000;
> >
> > -    /* Move CM GCRs */
> >      if (is_64b) {
> > -        stl_p(p++, 0x40287803);                 /* dmfc0 $8, CMGCRBase=
 */
> > -        stl_p(p++, 0x00084138);                 /* dsll $8, $8, 4 */
> > +        bl_gen_write_u64(&p, cm_base,
> > +                    cpu_mips_phys_to_kseg1(NULL, GCR_BASE_ADDR + GCR_B=
ASE_OFS));
> > +        bl_gen_write_u64(&p, gic_base | GCR_GIC_BASE_GICEN_MSK,
> > +                    cpu_mips_phys_to_kseg1(NULL, cm_base + GCR_GIC_BAS=
E_OFS));
> > +        bl_gen_write_u64(&p, cpc_base | GCR_CPC_BASE_CPCEN_MSK,
> > +                    cpu_mips_phys_to_kseg1(NULL, cm_base + GCR_CPC_BAS=
E_OFS));
> >      } else {
> > -        stl_p(p++, 0x40087803);                 /* mfc0 $8, CMGCRBase =
*/
> > -        stl_p(p++, 0x00084100);                 /* sll  $8, $8, 4 */
> > +        bl_gen_write_u32(&p, cm_base,
> > +                    cpu_mips_phys_to_kseg1(NULL, GCR_BASE_ADDR + GCR_B=
ASE_OFS));
> > +        bl_gen_write_u32(&p, gic_base | GCR_GIC_BASE_GICEN_MSK,
> > +                    cpu_mips_phys_to_kseg1(NULL, cm_base + GCR_GIC_BAS=
E_OFS));
> > +        bl_gen_write_u32(&p, cpc_base | GCR_CPC_BASE_CPCEN_MSK,
> > +                    cpu_mips_phys_to_kseg1(NULL, cm_base + GCR_CPC_BAS=
E_OFS));
> >      }
>
> What about simplifying adding bl_gen_write_target_ulong() or
> bl_gen_write_ulong()?

bl_gen_store_ulong() similarly to bl_gen_load_ulong()?

