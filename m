Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5C04B3768
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 19:32:33 +0100 (CET)
Received: from localhost ([::1]:35446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIxCB-0007aF-Pk
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 13:32:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nIxAn-0006G1-B0
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 13:31:07 -0500
Received: from [2a00:1450:4864:20::42e] (port=44864
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nIxAj-0007h6-Mm
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 13:31:04 -0500
Received: by mail-wr1-x42e.google.com with SMTP id u1so6634726wrg.11
 for <qemu-devel@nongnu.org>; Sat, 12 Feb 2022 10:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sRcSs72jranbX3h85+86CvNzm/Bj9kyiVkNFMuEqOkY=;
 b=BfLmgVIP6bF6y0yQXZbfcXGJxppG5bsgxx/MUF8X85yAIsAKc0shh+84c0DaEneRSs
 UEAA+VVINPQXO0yVJy+oBsqI/E1JyFCN9qJDCmCWpGU1QLew8NeP7K9V5GktQZ4sHY1+
 GoMo6PQpXD+rUtoFz2OCVbqoXKbPNq29d02vOn5pWBlIpwJHC2llYzN4wEC2F5+XFjJF
 ywp5/JAzl1Lh6btNGpDPxhuQq8NauIQ0Wlwv8Iz0ZvMoB+EC1Fkbwi24d5l6X6//puym
 67Q7d5axcYqj1QCm3aOtzKKQNTcB2lJ29R4hBd4yj6C+uZFPw3e+6Tkey2QzgS7drBQY
 ZFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sRcSs72jranbX3h85+86CvNzm/Bj9kyiVkNFMuEqOkY=;
 b=egRdxn9TBAy97/KjKm2etH/3F53qPYczr4Ja28sHPl9STV/ZzDVngjfvA3RWLtYqz9
 B38nEGbOkjYqjOM7m9b5Y4JN4Mow1qJEY7noHfl32boR00+NIJcRpWKnM5OWOWdBOfoE
 dBPmpAM73KtcPjfuZ/CWB3scXprPz8cKZpnbVRkQLgSCyZyama0cYiHeSEIqialMTZ+e
 VUwD2BtrY4j7Wf3PwnhFNamE8dwLRRGSgqY4XUnFvNMhvNI+rYiS8sxvAUevcTP7Ykqh
 nksJnWC09Tellrq9N29Hb+ZHMQGYu8kpCb8HMetl8LzjvAg0GosgYnopFDjG+CzI7Grn
 onjg==
X-Gm-Message-State: AOAM531rN1Rz0Ze2rfH4nTLVk/KgLOKWU790KnD/AndTZHOpfrqtqwCO
 orG1T45+zZ2EMHIcKu//MrVt6qdl0uN2pdyZpok1Xw==
X-Google-Smtp-Source: ABdhPJx7U1WEs3oIrcHZAVgnM0Zo64+rOUxWaZGx2mYplgVLL72HGW6psZ7grJIOUK4zpUw+svmaMaq+ki6diqgXB4w=
X-Received: by 2002:a5d:4ac7:: with SMTP id y7mr5782832wrs.521.1644690654783; 
 Sat, 12 Feb 2022 10:30:54 -0800 (PST)
MIME-Version: 1.0
References: <20220212113519.69527-1-shentey@gmail.com>
 <20220212113519.69527-5-shentey@gmail.com>
 <ebb5f8ad-64dc-8349-4d1c-7d8b623d60b2@eik.bme.hu>
 <CAFEAcA9BBFHH7eqzB_zW-VDZWuXDEkYUb=P1ocPn_UyaZZFZ3w@mail.gmail.com>
 <c389b3a-bde6-9dae-557b-b8db541d1a@eik.bme.hu>
In-Reply-To: <c389b3a-bde6-9dae-557b-b8db541d1a@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 12 Feb 2022 18:30:43 +0000
Message-ID: <CAFEAcA_N6cuszzr+Afn2ed47t5tWTaayYqu3Nx2wuR8jVciP_Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] isa/piix4: Fix PCI IRQ levels to be preserved in
 VMState
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 12 Feb 2022 at 17:02, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> On Sat, 12 Feb 2022, Peter Maydell wrote:
> > On Sat, 12 Feb 2022 at 13:42, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> >> By the way the corresponding member in struct PIIXState in
> >> include/hw/southbridge/piix.h has a comment saying:
> >>
> >>      /* This member isn't used. Just for save/load compatibility */
> >>      int32_t pci_irq_levels_vmstate[PIIX_NUM_PIRQS];
> >>
> >> and only seems to be filled in piix3_pre_save() but never used. So what's
> >> the point of this then? Maybe piix3 also uses a bitmap to store these
> >> levels instead? There's a uint64_t pic_levels member above the unused
> >> array but I haven't checked the implementation.
> >
> > I think what has happened here is that originally piix3 used
> > the same implementation piix4 currently does -- where it stores
> > locally the value of the (incoming) PCI IRQ levels, and then when it wants
> > to know the value of the (outgoing) PIC IRQ levels it loops round
> > to effectively OR together all the PCI IRQ levels for those PCI
> > IRQs which are configured to that particular PIC interrupt.
> >
> > Then in commit e735b55a8c11 (in 2011) piix3 was changed to call
> > pci_bus_get_irq_level() to get the value of a PCI IRQ rather than
> > looking at its local cache of that information in the pci_irq_levels[]
> > array. This is the source of the "save/load compatibility" thing --
> > before doing a vmsave piix3_pre_save() fills in that field so that
> > it appears in the outbound data stream and thus a migration from
> > a new QEMU to an old pre-e735b55a8c11 QEMU will still work. (This
> > was important at the time, but could probably be cleaned up now.)
> >
> > The next commit after that one is ab431c283e7055bcd, which
> > is an optimization that fixes the equivalent of the "XXX: optimize"
> > marker in the gt64120_pci_set_irq()/piix4 code -- this does
> > something slightly more complicated involving the pic_levels
> > field, in order to avoid having to do the "loop over all the
> > PCI IRQ levels" whenever it needs to set/reset a PIC interrupt.
> >
> > We could pick up one or both (or none!) of these two changes
> > for the piix4 code. (If we're breaking migration compat anyway
> > we wouldn't need to include the save-load compat part of
> > the first change.)
>
> I'm not sure I fully get this. Currently (before this series) PIIX4State
> does not seem to have any fields to store irq state (in hw/isa/piix4.c):
>
> struct PIIX4State {
>      PCIDevice dev;
>      qemu_irq cpu_intr;
>      qemu_irq *isa;
>
>      RTCState rtc;
>      /* Reset Control Register */
>      MemoryRegion rcr_mem;
>      uint8_t rcr;
> };
>
> Patch 1 in this series introduces that by moving it from MaltaState. Then
> we could have a patch 2 to clean it up and change to the way piix3 does it
> and skip introducing the saving of this array into the migration state. It
> may still break migration but not sure if MaltaState was saved already so
> this may be already missing from migration anyway and if we do the same as
> piix3 then maybe we don't need to change the piix4 state either (as this
> is saved as part of the PCIHost state?) but I don't know much about this
> so maybe I'm wrong.

Yeah, that would work -- we weren't saving the old gt64xxx_pci.c
pci_irq_levels[] global, so we don't break anything that wasn't
already broken by not putting the newly-introduced PIIX4State
array into migration state. Then when we do the equivalent of
e735b55a8c11 the array can just be deleted again. (We can't
conveniently switch to using pci_bus_get_irq_level() before doing
patch 1 of this series, because we need the pointer to the
piix4 device object and gt64120_pci_set_irq() is only passed
a pointer directly to a qemu_irq array.)

> In any case PIIX3 and PIIX4 state seem to be different so there's no
> reason to worry aobut compatibility between them.

Yep, that's right. The only reasons to copy changes from piix3
are (a) because they're worth having in themselves and (b)
because having the two devices be the same is maybe less
confusing. (b)'s a pretty weak reason, and (a) depends on
the individual change. In this case I think making the equivalent
of e735b55a8c11 is worthwhile because it saves us having an
extra array field and migrating it, and the change is pretty
small. For ab431c283e7055bcd you could argue either way -- it's
clearly a better way to structure the irq handling, but it's only
an optimisation, not a bug fix.

-- PMM

