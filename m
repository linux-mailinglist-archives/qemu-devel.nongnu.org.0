Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B05AB53872E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 20:20:33 +0200 (CEST)
Received: from localhost ([::1]:44538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvk0G-0001oJ-Op
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 14:20:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nvjrJ-0006ld-8Z
 for qemu-devel@nongnu.org; Mon, 30 May 2022 14:11:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nvjrG-0001Rm-8M
 for qemu-devel@nongnu.org; Mon, 30 May 2022 14:11:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653934273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZkEpUe96pcu1BI7Yq5ji82kGAJ1FCgHW/YEY0wcKBNU=;
 b=OgL1lMXyXa5NDWaqSph4AJ28CJK2RMH6eb122u8FM6dXrk+bolXtGKCArtcMe66bGO7qdL
 h0t5WbG5fbLk7Wkh5UiBcV9e4V7lTAwA4hrkB8xPEPI4o+qh9q9IA/3iF0f6uVdH4jigGi
 4xfr2NweDN45Xqw+Tt7I4pKobFRFXR8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-GZ04yXb_PiSqfzXJiWNMSg-1; Mon, 30 May 2022 14:11:10 -0400
X-MC-Unique: GZ04yXb_PiSqfzXJiWNMSg-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg7-20020a05600c3c8700b0039468585269so4905247wmb.3
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 11:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ZkEpUe96pcu1BI7Yq5ji82kGAJ1FCgHW/YEY0wcKBNU=;
 b=4QGzXzScamkUwFG/A8mNNaAArlyokYKNj2QDedDiVAaudyKJ7OjHCs4OvXb/7fxM1L
 pPd/fELIDu+Zh0Q/wG5SklBOD91vfWPvBmKk/hkFB8QjUfjEBBmcBEenHOZWByx7tkdW
 6W1GHwz7qUSRxFbLS6fA3WAlg+w1VaFZZnWORhYPVOCTP+DXmuAQXcenNlTH+zDrWawy
 hiVZGxIP3kdnyAjDYDMtWUXMsymtRpCML19VuZqYlk9lX/yExhvU1YlQm30OfuQwnb/f
 TUGnL+UpVB+Zh0ri5o7rJofXrkxxUSs+e+OT5M/KPU96hc1TsiDS1x4NcKTkOglKz9W/
 M3KA==
X-Gm-Message-State: AOAM532FgBMWYq8T31bY9TEWmCZ5ZUIei2KaQ2u4cBvW/yeOeSYDa2Fw
 rT7BV1oawBtgyUuh1TG7sjxrQELtt7B0e4PwlIqfxC4ZrpKjEzWvEMkkXBOV0B2oRFkdk6UmJXn
 jql1wENAabwmZo8k=
X-Received: by 2002:a05:600c:34d4:b0:394:91a8:104b with SMTP id
 d20-20020a05600c34d400b0039491a8104bmr20035103wmq.134.1653934268500; 
 Mon, 30 May 2022 11:11:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDqPkt75/BuT6mnIxYRkPcrYhHUtUA117LtA6Iyphcohw8qrINvgLM6twGpHmzF1Vu9P05nw==
X-Received: by 2002:a05:600c:34d4:b0:394:91a8:104b with SMTP id
 d20-20020a05600c34d400b0039491a8104bmr20035078wmq.134.1653934268182; 
 Mon, 30 May 2022 11:11:08 -0700 (PDT)
Received: from redhat.com ([2.52.157.68]) by smtp.gmail.com with ESMTPSA id
 l17-20020a05600c4f1100b003973c4bb19bsm20921wmq.16.2022.05.30.11.11.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 11:11:07 -0700 (PDT)
Date: Mon, 30 May 2022 14:11:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Lev Kujawski <lkujaw@member.fsf.org>, qemu-trival@nongnu.org,
 John Snow <jsnow@redhat.com>, "open list:IDE" <qemu-block@nongnu.org>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: Re: [PATCH 4/4] hw/ide/piix: Ignore writes of hardwired PCI command
 register bits
Message-ID: <20220530140956-mutt-send-email-mst@kernel.org>
References: <20220528204702.167912-1-lkujaw@member.fsf.org>
 <20220528204702.167912-4-lkujaw@member.fsf.org>
 <d80d1bbe-982c-90d8-4a54-ebab6dd36e4a@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d80d1bbe-982c-90d8-4a54-ebab6dd36e4a@amsat.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Mon, May 30, 2022 at 03:33:18PM +0200, Philippe Mathieu-Daudé wrote:
> On 28/5/22 22:47, Lev Kujawski wrote:
> > One method to enable PCI bus mastering for IDE controllers, often used
> > by x86 firmware, is to write 0x7 to the PCI command register.  Neither
> > the PIIX3 specification nor actual hardware (a Tyan S1686D system)
> > permit modification of the Memory Space Enable (MSE) bit, 1, and thus
> > the command register would be left in an unspecified state without
> > this patch.
> > 
> > Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
> > ---
> >   hw/ide/piix.c | 25 +++++++++++++++++++++++++
> >   1 file changed, 25 insertions(+)
> > 
> > diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> > index 76ea8fd9f6..f1d1168ecd 100644
> > --- a/hw/ide/piix.c
> > +++ b/hw/ide/piix.c
> > @@ -25,6 +25,8 @@
> >    * References:
> >    *  [1] 82371FB (PIIX) AND 82371SB (PIIX3) PCI ISA IDE XCELERATOR,
> >    *      290550-002, Intel Corporation, April 1997.
> > + *  [2] 82371AB PCI-TO-ISA / IDE XCELERATOR (PIIX4), 290562-001,
> > + *      Intel Corporation, April 1997.
> >    */
> >   #include "qemu/osdep.h"
> > @@ -32,6 +34,7 @@
> >   #include "migration/vmstate.h"
> >   #include "qapi/error.h"
> >   #include "qemu/module.h"
> > +#include "qemu/range.h"
> >   #include "sysemu/block-backend.h"
> >   #include "sysemu/blockdev.h"
> >   #include "sysemu/dma.h"
> > @@ -220,6 +223,26 @@ static void pci_piix_ide_exitfn(PCIDevice *dev)
> >       }
> >   }
> > +static void piix_pci_config_write(PCIDevice *d, uint32_t addr,
> > +                                  uint32_t val, int l)
> > +{
> > +    /*
> > +     * Mask all IDE PCI command register bits except for Bus Master
> > +     * Function Enable (bit 2) and I/O Space Enable (bit 1), as the
> > +     * remainder are hardwired to 0 [1, p.48] [2, p.89-90].
> > +     *
> > +     * NOTE: According to the PIIX3 datasheet [1], the Memory Space
> > +     * Enable (MSE bit) is hardwired to 1, but this is contradicted by
> > +     * actual PIIX3 hardware, the datasheet itself (viz., Default
> > +     * Value: 0000h), and the PIIX4 datasheet [2].
> > +     */
> > +    if (range_covers_byte(addr, l, PCI_COMMAND)) {
> > +        val &= ~(0xfffa << ((PCI_COMMAND - addr) << 3));
> 
> Watch out, len can be 1/2/4.


If there are bits hardwired to 0 the right way to do it is
by clearing a bit in wmask. Might need machine compat machinery
for this.

> > +    }
> > +
> > +    pci_default_write_config(d, addr, val, l);
> > +}
> > +
> >   /* NOTE: for the PIIX3, the IRQs and IOports are hardcoded */
> >   static void piix3_ide_class_init(ObjectClass *klass, void *data)
> >   {
> > @@ -232,6 +255,7 @@ static void piix3_ide_class_init(ObjectClass *klass, void *data)
> >       k->vendor_id = PCI_VENDOR_ID_INTEL;
> >       k->device_id = PCI_DEVICE_ID_INTEL_82371SB_1;
> >       k->class_id = PCI_CLASS_STORAGE_IDE;
> > +    k->config_write = piix_pci_config_write;
> >       set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> >       dc->hotpluggable = false;
> >   }
> > @@ -260,6 +284,7 @@ static void piix4_ide_class_init(ObjectClass *klass, void *data)
> >       k->vendor_id = PCI_VENDOR_ID_INTEL;
> >       k->device_id = PCI_DEVICE_ID_INTEL_82371AB;
> >       k->class_id = PCI_CLASS_STORAGE_IDE;
> > +    k->config_write = piix_pci_config_write;
> >       set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> >       dc->hotpluggable = false;
> >   }


