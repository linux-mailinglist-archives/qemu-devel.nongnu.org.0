Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A678D4BAB8E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 22:10:29 +0100 (CET)
Received: from localhost ([::1]:47440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKo2m-0007Fq-CH
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 16:10:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nKo0F-0006Em-Oa
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 16:07:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nKo08-0003nC-5m
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 16:07:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645132061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XFP+Wo+oFOfwR+91Qc1NgVfrZBhELdzfPykAEaWSokw=;
 b=arGHT+2jlyTkpUgINX5RBiGpcKUMuFixPv6DNSP8KHAafw2rmzAyChzy9xk/lJbIO8TpGk
 E2TWRtlkbW/zK4IZDL8/tCE5U7wuq/iEULug7LyXnJMfF1AzppfNrDJsKeVLuy61Kt4meb
 tA9/VJewCA9YvbcPTymAJ2S92NWKQjY=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-_PiMB10bM-a_BDFBXSsLyA-1; Thu, 17 Feb 2022 16:07:39 -0500
X-MC-Unique: _PiMB10bM-a_BDFBXSsLyA-1
Received: by mail-ua1-f69.google.com with SMTP id
 v8-20020ab036a8000000b0033cc15dc051so2590574uat.13
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 13:07:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XFP+Wo+oFOfwR+91Qc1NgVfrZBhELdzfPykAEaWSokw=;
 b=Jj4tzpboP0GjMdI3qbXitSFUk0he0pPLjJfAhCVXsS/tt4GFkw845pgW1+ed7kbJ/B
 pjPZjIpAcwriIFrGXYxyfIcdovUJdiMNibgsDM/TxUYVahYkY9g8CuE9oe8ngWSTUO6L
 Qk615jLuWzHAvUsEZJKXbriWORsPlAYGExsxsT1Sh/C3lxO0En7dx4FUcRRN5OB0sXpO
 MYCtgGyc3NbPC2Ahif3miVOTEcl0xsOd98Cy8bEe4mOOTo3DCRyMPppJou/4MqhCEXZU
 Kq3LU8EALmnBqLRbBM4dkYCE1p4YBduYOxS8ii07yEKKaJKa0yihzgJBy1bV+dqFyJM/
 kuyw==
X-Gm-Message-State: AOAM530+VJS7Tj9YvcKJGNGLt/mlhRGBfVBsljYTiOtmuD96QrHC37U0
 I4+bre4JSVk58AHAIZn4yS8aMOd/I40hmco1myeiQTJV3aCeTT/eldwBDiNfFoaXljL5UK6Tk7D
 UfkfZbjp8AMGosPYh/b44lIpJJI5rP6Y=
X-Received: by 2002:a05:6102:d90:b0:31b:e21b:b500 with SMTP id
 d16-20020a0561020d9000b0031be21bb500mr2071918vst.11.1645132058256; 
 Thu, 17 Feb 2022 13:07:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYigNKY67DEWciF6I7knVAahzJUJRwyDM9iTE/QZpyM9vQ9xM14L91yuX1bQDxuF40Tzzys0X20ySjtpirR58=
X-Received: by 2002:a05:6102:d90:b0:31b:e21b:b500 with SMTP id
 d16-20020a0561020d9000b0031be21bb500mr2071881vst.11.1645132056736; Thu, 17
 Feb 2022 13:07:36 -0800 (PST)
MIME-Version: 1.0
References: <20220205111138.35194-1-liavalb@gmail.com>
 <65ad680-dc5a-6720-7ef4-84d3af3e4998@eik.bme.hu>
 <61d057f7-e877-a8ff-1afc-1960902207e9@gmail.com>
 <3f884dd8-277-b2c-33c4-8258ca8f41d3@eik.bme.hu>
 <2280c5b-fdaf-e1ad-53e8-d3ce73c8dca1@eik.bme.hu>
 <23d97cfa-caaf-634b-19d3-1c411ddbbf57@gmail.com>
In-Reply-To: <23d97cfa-caaf-634b-19d3-1c411ddbbf57@gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 17 Feb 2022 16:07:25 -0500
Message-ID: <CAFn=p-Za4Ax_iAxtD7G+KrcRYC-a1aQxF8FYBSNoc+MzP1Y6pA@mail.gmail.com>
Subject: Re: [PATCH] hw/ide: implement ich6 ide controller support
To: Liav Albani <liavalb@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 14, 2022 at 1:48 PM Liav Albani <liavalb@gmail.com> wrote:
>
> Hello BALATON,
>
> Thank you for helping keeping this patch noticeable to everyone :)
>
> I tried to reach out to John via a private email last Saturday (two days
> ago) so I don't "spam" the mailing list for no good reason.
> It might be that I should actually refrain from doing so and talk to the
> maintainer directly on the mailing list once the patch
> has been submitted to the mailing list.
> I've not yet seen any response from John so I assume it's a matter of
> days before he can take care of this.
>
> Best regards,
> Liav
>
> On 2/14/22 14:26, BALATON Zoltan wrote:
> > On Sat, 5 Feb 2022, BALATON Zoltan wrote:
> >> Hello,
> >
> > Ping? John, do you agree with my comments? Should Liav proceed to send
> > a v2?
> >
> > Thanks,
> > BALATON Zoltan
> >
> >> On Sat, 5 Feb 2022, Liav Albani wrote:
> >>> On 2/5/22 17:48, BALATON Zoltan wrote:
> >>>> On Sat, 5 Feb 2022, Liav Albani wrote:
> >>>>> This type of IDE controller has support for relocating the IO
> >>>>> ports and
> >>>>> doesn't use IRQ 14 and 15 but one allocated PCI IRQ for the
> >>>>> controller.
> >>>>
> >>>> I haven't looked at in detail so only a few comments I've got while
> >>>> reading it. What machine needs this? In QEMU I think we only have
> >>>> piix and ich9 emulated for pc and q35 machines but maybe ich6 is
> >>>> also used by some machine I don't know about. Otherwise it looks
> >>>> odd to have ide part of ich6 but not the other parts of this chip.
> >>>>
> >>> Hi BALATON,
> >>>
> >>> This is my first patch to QEMU and the first time I send patches
> >>> over the mail. I sent my github tree to John Snow (the maintainer of
> >>> the IDE code in QEMU) for advice if I should send them here and I
> >>> was encouraged to do that.
> >>
> >> Welcome and thanks a lot for taking time to contribute and share your
> >> results. In case you're not yet aware, these docs should explain how
> >> patches are handled on the list:
> >>
> >> https://www.qemu.org/docs/master/devel/submitting-a-patch.html
> >>
> >>> For the next time patch I'll put a note on writing a descriptive
> >>> cover letter as it could have put more valuable details on why I
> >>> sent this patch.
> >>>
> >>> There's no such machine type emulating the ICH6 chipset in QEMU.
> >>> However, I wrote this emulation component as a test for the
> >>> SerenityOS kernel because I have a machine from 2009 which has
> >>> an ICH7 southbridge, so, I wanted to emulate such device with QEMU
> >>> to ease development on it.
> >>>
> >>> I found out that Linux with libata was using the controller without
> >>> any noticeable problems, but the SerenityOS kernel struggled to use
> >>> this device, so I decided that
> >>> I should send this patch to get it merged and then I can use it
> >>> locally and maybe other people will benefit from it.
> >>>
> >>> In regard to other components of the ICH6 chipset - I don't think
> >>> it's worth anybody's time to actually implement them as the ICH9
> >>> chipset is quite close to what the ICH6 chipset offers as far as I
> >>> can tell.
> >>> The idea of implementing ich6-ide controller was to enable the
> >>> option of people like me and other OS developers to ensure their
> >>> kernels operate correctly on such type of device,
> >>> which is legacy-free device in the aspect of PCI bus resource
> >>> management but still is a legacy device which belongs to chipsets of
> >>> late 2000s.
> >>
> >> That's OK, maybe a short mention (just one sentence) in the commit
> >> message explaining this would help to understand why this device
> >> model was added.
> >>
> >>>>> Signed-off-by: Liav Albani <liavalb@gmail.com>
> >>>>> ---
> >>>>> hw/i386/Kconfig          |   2 +
> >>>>> hw/ide/Kconfig           |   5 +
> >>>>> hw/ide/bmdma.c           |  83 +++++++++++++++
> >>>>> hw/ide/ich6.c            | 211
> >>>>> +++++++++++++++++++++++++++++++++++++++
> >>>>> hw/ide/meson.build       |   3 +-
> >>>>> hw/ide/piix.c            |  50 +---------
> >>>>> include/hw/ide/pci.h     |   5 +
> >>>>> include/hw/pci/pci_ids.h |   1 +
> >>>>> 8 files changed, 311 insertions(+), 49 deletions(-)
> >>>>> create mode 100644 hw/ide/bmdma.c
> >>>>> create mode 100644 hw/ide/ich6.c
> >>>>>
> >>>>> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> >>>>> index d22ac4a4b9..a18de2d962 100644
> >>>>> --- a/hw/i386/Kconfig
> >>>>> +++ b/hw/i386/Kconfig
> >>>>> @@ -75,6 +75,7 @@ config I440FX
> >>>>>     select PCI_I440FX
> >>>>>     select PIIX3
> >>>>>     select IDE_PIIX
> >>>>> +    select IDE_ICH6
> >>>>>     select DIMM
> >>>>>     select SMBIOS
> >>>>>     select FW_CFG_DMA
> >>>>> @@ -101,6 +102,7 @@ config Q35
> >>>>>     select PCI_EXPRESS_Q35
> >>>>>     select LPC_ICH9
> >>>>>     select AHCI_ICH9
> >>>>> +    select IDE_ICH6
> >>>>>     select DIMM
> >>>>>     select SMBIOS
> >>>>>     select FW_CFG_DMA
> >>>>> diff --git a/hw/ide/Kconfig b/hw/ide/Kconfig
> >>>>> index dd85fa3619..63304325a5 100644
> >>>>> --- a/hw/ide/Kconfig
> >>>>> +++ b/hw/ide/Kconfig
> >>>>> @@ -38,6 +38,11 @@ config IDE_VIA
> >>>>>     select IDE_PCI
> >>>>>     select IDE_QDEV
> >>>>>
> >>>>> +config IDE_ICH6
> >>>>> +    bool
> >>>>> +    select IDE_PCI
> >>>>> +    select IDE_QDEV
> >>>>> +
> >>>>> config MICRODRIVE
> >>>>>     bool
> >>>>>     select IDE_QDEV
> >>>>> diff --git a/hw/ide/bmdma.c b/hw/ide/bmdma.c
> >>>>> new file mode 100644
> >>>>> index 0000000000..979f5974fd
> >>>>> --- /dev/null
> >>>>> +++ b/hw/ide/bmdma.c
> >>>>> @@ -0,0 +1,83 @@
> >>>>> +/*
> >>>>> + * QEMU IDE Emulation: PCI PIIX3/4 support.
> >>>>> + *
> >>>>> + * Copyright (c) 2003 Fabrice Bellard
> >>>>> + * Copyright (c) 2006 Openedhand Ltd.
> >>>>> + *
> >>>>> + * Permission is hereby granted, free of charge, to any person
> >>>>> obtaining a copy
> >>>>> + * of this software and associated documentation files (the
> >>>>> "Software"), to deal
> >>>>> + * in the Software without restriction, including without
> >>>>> limitation the rights
> >>>>> + * to use, copy, modify, merge, publish, distribute, sublicense,
> >>>>> and/or sell
> >>>>> + * copies of the Software, and to permit persons to whom the
> >>>>> Software is
> >>>>> + * furnished to do so, subject to the following conditions:
> >>>>> + *
> >>>>> + * The above copyright notice and this permission notice shall be
> >>>>> included in
> >>>>> + * all copies or substantial portions of the Software.
> >>>>> + *
> >>>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
> >>>>> KIND, EXPRESS OR
> >>>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> >>>>> MERCHANTABILITY,
> >>>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
> >>>>> EVENT SHALL
> >>>>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
> >>>>> DAMAGES OR OTHER
> >>>>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> >>>>> OTHERWISE, ARISING FROM,
> >>>>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> >>>>> DEALINGS IN
> >>>>> + * THE SOFTWARE.
> >>>>> + */
> >>>>> +
> >>>>> +#include "qemu/osdep.h"
> >>>>> +#include "hw/pci/pci.h"
> >>>>> +#include "migration/vmstate.h"
> >>>>> +#include "qapi/error.h"
> >>>>> +#include "qemu/module.h"
> >>>>> +#include "sysemu/block-backend.h"
> >>>>> +#include "sysemu/blockdev.h"
> >>>>> +#include "sysemu/dma.h"
> >>>>> +
> >>>>> +#include "hw/ide/pci.h"
> >>>>> +#include "trace.h"
> >>>>> +
> >>>>> +uint64_t piix_bmdma_read(void *opaque, hwaddr addr, unsigned size)
> >>>>
> >>>> Moving these functions to avoid duplication is a good idea but a
> >>>> couple of points:
> >>>>
> >>>> - Maybe this should be a separate patch just for moving these out
> >>>> then another patch adding ich6 for easier review of separate changes.
> >>>>
> >>> I don't mind splitting this patch into a couple of "commits" (or
> >>> series of diffs? I don't understand the terminology yet) so one
> >>> "commit" will be a preparation - extract the
> >>> functions to a separate file, and the next diff can implement the
> >>> ich6-ide controller.
> >>
> >> See the docs, which should explain how to split up patches and what
> >> should be in one patch. This would be a patch series then. As to
> >> where to move these functions or how to proceed with it wait for John
> >> Snow's reply as he's the maintainer of this part so what he prefers
> >> is the way to go. What I wrote is my opinion but others may have
> >> different views so give them a chance to reply too then once we see
> >> what to do you can send a v2 with the changes that seems to be the
> >> consensus on how to best proceed.
> >>
> >>>> - There are already several bmdma_* functions in pci.c and you add
> >>>> these to pci.h so maybe these should be moved near there in pci.c
> >>>> instead. (Or more of those bmdma_* functions moved in this new file
> >>>> and add its own header?)
> >>>>
> >>> I'm not sure what is the best approach but maybe the latter
> >>> suggestion (new file and its own header) seems quite good to me.
> >>>> - This is not piix specific so the name probably should not say
> >>>> that. Maybe somthing along the lines of pci_default_read_config so
> >>>> bmdma_default_read or similar. In fact it also appears in via.c and
> >>>> a more complex version in cmd646.c which could still reuse
> >>>> functions like these like we do with pci config write. Converting
> >>>> those other two to use the newly split off functions instead of
> >>>> duplicating it could be done in a follow up patch, if you don't
> >>>> want to do that I may look at via-ide but a patch is welcome if you
> >>>> have time for that, unless others think otherwise and we'll take a
> >>>> different route.
> >>>>
> >>> I want to create the best possible patch so if it's desirable to
> >>> rename it to something more generic, that's OK for me.
> >>> I'd like to address some of the issues you mentioned (such as
> >>> avoiding duplicates in how we use bus master DMA in the ide code) in
> >>> future patches though, so if possible, let's keep it simple now :)
> >>
> >> Sure, this could be done afterwards too just noted it when noticed
> >> there are other places that use similar functions so this is a
> >> possible clean up that should be easy to do either as an additional
> >> patch in this series or a separate one later.
> >>
> >> Regards,
> >> BALATON Zoltan
> >>
> >>>>>
> >>>>> +static uint32_t ich6_pci_config_read(PCIDevice *d,
> >>>>> +                                       uint32_t address, int len)
> >>>>> +{
> >>>>> +    return pci_default_read_config(d, address, len);
> >>>>> +}
> >>>>
> >>>> Why do you override this if you have nothing to do in it? Just use
> >>>> pci_default_read_config and only override ich6_pci_config_write
> >>>> where you actually has something to add to the default.
> >>>>
> >>> You're right, I should not override this function. It was probably
> >>> me trying (I uploaded this patch to GitHub about 2 weeks ago so I
> >>> don't remember precisely) to override it for the sake of returning a
> >>> value of 0x8000 when the guest OS tries to figure out if the IDE
> >>> channel is disabled or not in the 0x40 and 0x42 registers in the PCI
> >>> config space of the device.
> >>>> Maybe also wait for a few days for other's comments (especially the
> >>>> maintainer's opinion on this) before sending a v2 so you get all
> >>>> comments and see what to do.
> >>>>
> >>> Thank you very much for putting time into reviewing this! :)
> >>>
> >>> Best regards,
> >>> Liav
> >>>
> >>
>

Hi! Sorry, I am very behind on IDE work and I haven't had the time to
review this in depth. When Liav reached out to ask if the patches
should be sent to the list, I said YES because I think all patches
should be shared with the list, whether or not they make it in or not.

At the moment, I'm going to trust BALATON's analysis until I am able
to give this a much more thorough look, but that might be a little
while yet. I'm happy to take just about anything that doesn't break
existing cases, even if it's fairly experimental support for platforms
we don't normally care about.

Sorry for the non-answer, but I'll try to loop back around soon.

--js


