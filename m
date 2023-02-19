Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DB669C0A8
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Feb 2023 15:23:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTkZn-0007Rb-KR; Sun, 19 Feb 2023 09:22:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1pTkZm-0007RG-3B
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 09:22:02 -0500
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1pTkZk-0008LB-CG
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 09:22:01 -0500
Received: by mail-qt1-x829.google.com with SMTP id cf6so418273qtb.4
 for <qemu-devel@nongnu.org>; Sun, 19 Feb 2023 06:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=I6waxacrasib0o38v5WvJGHloEcEByhaPNus0wEYp1Y=;
 b=PQqr6uGBfxyr4rb8MEQ2OXvqSHbvbwhRYf+o4b19b1OhZ5GTy+95Jfb0oQNdfatC1s
 Yz1aBhoocdk26ziw+VqyD3/V8YWh/GglcUEqoBKz7NUZ5dXp57J0t52a/9SjAmiYx6OW
 FHc7CVPbBCqawOCzQIzhB3CCE+7R2LJdM99MolHZYbpmIZ1kmcWIOqjP5T+gEz3CQWm/
 uxiBWUKJgG23MqKYTp96hnB6b+WG3Tt/aTRc0H0TXb0UMYHTzeWhKhrmoPr085GjCbjW
 FwdSaHezGFuBePBDIlyrK+jzzEA0Sx+neiE9eTih/OaVMRWz1+Cb3Hs03mNzI1Cf9van
 kFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I6waxacrasib0o38v5WvJGHloEcEByhaPNus0wEYp1Y=;
 b=h9va1CtEiAl526zNjdtnMlMrJwY/K+dos8pZ00JKPYh1tH2yGv5aQjxGhGrStiDsC8
 xANMkKno8wsWj0K3y3pn2VaZIkQLFznAjYnSBzu8vBYqwA9xq4CBSYKZ3YpxCLA0r/Gv
 XMMNk42C0VKnnFEF/sWzCK6CR6fxjVNHnOO83F8jMPrlsNfoYiwjz+eBzMVl4oVYlybL
 Wr9S2u44fDJT4ftcyz5EA+e0JvziYxBuJpDRejOvac/6OMjPUp7W3HBmI0B/OGjq8HDJ
 101vL4cEEEbIiNp+1kFI3SJwXMWEhVsSPQNc6u3fOERDoeHHTlNnTz8vf7lRp/EVbETO
 3u0Q==
X-Gm-Message-State: AO0yUKUrJM+7x5a5+7g8CaKxitJrk7R9E0G7SAGhw9bnyNySWknkGNSZ
 ELtIAZQGyGxQXtuUM3KBCQ==
X-Google-Smtp-Source: AK7set9zBpl30u/Cu/n9Prc8hLrcI0CYC4xHg+5eu5GFCx8yQzH5YxpU4wFWsl54dabfKuC0nxYO/Q==
X-Received: by 2002:a05:622a:1310:b0:3b9:c153:f169 with SMTP id
 v16-20020a05622a131000b003b9c153f169mr7824082qtk.0.1676816519283; 
 Sun, 19 Feb 2023 06:21:59 -0800 (PST)
Received: from serve.minyard.net ([47.189.91.183])
 by smtp.gmail.com with ESMTPSA id
 y29-20020ac8705d000000b003b86d5c4fbbsm7044976qtm.1.2023.02.19.06.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 06:21:58 -0800 (PST)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:cfc7:6a28:d9c8:fe22])
 by serve.minyard.net (Postfix) with ESMTPSA id 422461800E8;
 Sun, 19 Feb 2023 14:21:57 +0000 (UTC)
Date: Sun, 19 Feb 2023 08:21:56 -0600
From: Corey Minyard <minyard@acm.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 05/12] hw/i2c/smbus_ich9: Inline ich9_smb_init() and
 remove it
Message-ID: <Y/IwhKc27n2wOzr2@minyard.net>
References: <20230213173033.98762-1-shentey@gmail.com>
 <20230213173033.98762-6-shentey@gmail.com>
 <Y/E0KN6slRJucBms@minyard.net>
 <be6582a8-1032-a96f-8468-d5e2aeba938b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be6582a8-1032-a96f-8468-d5e2aeba938b@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=tcminyard@gmail.com; helo=mail-qt1-x829.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Reply-To: minyard@acm.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, Feb 19, 2023 at 02:45:44PM +0100, Philippe Mathieu-Daudé wrote:
> On 18/2/23 21:25, Corey Minyard wrote:
> > On Mon, Feb 13, 2023 at 06:30:26PM +0100, Bernhard Beschow wrote:
> > > ich9_smb_init() is a legacy init function, so modernize the code.
> > > 
> > > Note that the smb_io_base parameter was unused.
> > 
> > Acked-by: Corey Minyard <cminyard@mvista.com>
> > 
> > > 
> > > Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> > > ---
> > >   include/hw/i386/ich9.h |  1 -
> > >   hw/i2c/smbus_ich9.c    | 13 +++----------
> > >   hw/i386/pc_q35.c       | 11 ++++++++---
> > >   3 files changed, 11 insertions(+), 14 deletions(-)
> > > 
> > > diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
> > > index 05464f6965..52ea116f44 100644
> > > --- a/include/hw/i386/ich9.h
> > > +++ b/include/hw/i386/ich9.h
> > > @@ -9,7 +9,6 @@
> > >   #include "qom/object.h"
> > >   void ich9_lpc_pm_init(PCIDevice *pci_lpc, bool smm_enabled);
> > > -I2CBus *ich9_smb_init(PCIBus *bus, int devfn, uint32_t smb_io_base);
> > >   void ich9_generate_smi(void);
> > > diff --git a/hw/i2c/smbus_ich9.c b/hw/i2c/smbus_ich9.c
> > > index d29c0f6ffa..f0dd3cb147 100644
> > > --- a/hw/i2c/smbus_ich9.c
> > > +++ b/hw/i2c/smbus_ich9.c
> > > @@ -105,6 +105,9 @@ static void ich9_smbus_realize(PCIDevice *d, Error **errp)
> > >       pm_smbus_init(&d->qdev, &s->smb, false);
> > >       pci_register_bar(d, ICH9_SMB_SMB_BASE_BAR, PCI_BASE_ADDRESS_SPACE_IO,
> > >                        &s->smb.io);
> > > +
> > > +    s->smb.set_irq = ich9_smb_set_irq;
> > > +    s->smb.opaque = s;
> 
> Corey, shouldn't we expand pm_smbus_init() to take set_irq / opaque
> arguments?

That would be nice, but the other two user of this function,
hw/isa/vt82c686.c and hw/acpi/piix4.c, don't use these fields.
I doubt we are getting any new users.  I'm fine either way, but the
value is not large.

-corey

> 
> > >   }
> 

