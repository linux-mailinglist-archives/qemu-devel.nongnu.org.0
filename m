Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 839F46A4AF1
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 20:35:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWjGq-0004aD-To; Mon, 27 Feb 2023 14:34:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1pWjGo-0004ZD-Su
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 14:34:46 -0500
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1pWjGn-00040j-6V
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 14:34:46 -0500
Received: by mail-qt1-x834.google.com with SMTP id y10so3307105qtj.2
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 11:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=UxB8z3mtqggDrfKfAyXD296gYjpE7EXKlac4LreLs8I=;
 b=koShRH4R2omKZKrI71mFaUs4G/ATN18YacoVvN5wHgSv0mvDjnnU3LlfQNlKD57mE3
 xc2SjvDQRupoMIKHwNPUoZEX47QeD0OIbgdJYfHMXLTOqPjBU9tFJsbqFeu9kaIDdPPc
 2AtrvQPrjXPxoJQpozAzg/s6pbF/Ftphqc1lZC1EeO4EUmrIh3yPRwFw/KijAJL3UiBx
 O9HrwiRDuUrDY5/b7fgDCNPviqiLR78nWAP9EJsi4OQvH/mRI7LvvY8xnj5Q5cmIF0H1
 KFkFlUPmBNtiPuPxqT+WwN+bc/1wG4C+UwfZz3BpqOHCuiuQnQO7yH19GqWeCyoP4E2c
 Y3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UxB8z3mtqggDrfKfAyXD296gYjpE7EXKlac4LreLs8I=;
 b=w7A1MruzehFLMdndj1u6wyYlZ3mTlxTl/NsqTPw/qrrB6wZuR1mxMsBC9JjoXgitPA
 ouyXHZl8JBNvQfcAqtZwKi5KQy5jVf4Nq0YL6Gs534kKRphg8UXUCQvbhbtG+7xRbN8X
 MdkRUr9UGNAZFKuPBIdXD15nPmmfiq+NSfUtG5dVh64u3IR/X1JfZR+HGDwZRo7qT4DX
 ejaeU3Gf5xtr6DKHaCTgEbxUy1nEYGjoSdo7Xo4v6ufV4ZQtGcpYjPyPUNHqWA5GOAwM
 zm2D4G28miQQiMco4MHZQ+wHXoURM1klyKJaQEFAb6rgadNmYNtsYh/ih4bvCpT26ZNU
 ejZQ==
X-Gm-Message-State: AO0yUKUXnKlzjeYCuZOFWBtBUPBxzcsbWEQ2EzJhsboQEJ2VmAMKLcaa
 fzXHELYi/6LFj2Euy/SqoQ==
X-Google-Smtp-Source: AK7set/sfDfaDUlDYYK9h14OcDZ02z3CrT6mgnvqTG0SVxBAcjXsyY3I3g4sf4g7A643rUwFz5x9Xw==
X-Received: by 2002:ac8:5c04:0:b0:3b9:b70c:9697 with SMTP id
 i4-20020ac85c04000000b003b9b70c9697mr878771qti.5.1677526483583; 
 Mon, 27 Feb 2023 11:34:43 -0800 (PST)
Received: from serve.minyard.net ([47.184.176.248])
 by smtp.gmail.com with ESMTPSA id
 r141-20020a37a893000000b00742301f1bfbsm5396768qke.45.2023.02.27.11.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 11:34:42 -0800 (PST)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:6a0a:c43f:155a:c0db])
 by serve.minyard.net (Postfix) with ESMTPSA id DCD091800BF;
 Mon, 27 Feb 2023 19:34:41 +0000 (UTC)
Date: Mon, 27 Feb 2023 13:34:40 -0600
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
Message-ID: <Y/0F0FOvJkSwEdLU@minyard.net>
References: <20230213173033.98762-1-shentey@gmail.com>
 <20230213173033.98762-6-shentey@gmail.com>
 <Y/E0KN6slRJucBms@minyard.net>
 <be6582a8-1032-a96f-8468-d5e2aeba938b@linaro.org>
 <Y/IwhKc27n2wOzr2@minyard.net>
 <fbcf0be7-28ba-4ec7-3533-ba6fd45d0409@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fbcf0be7-28ba-4ec7-3533-ba6fd45d0409@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=tcminyard@gmail.com; helo=mail-qt1-x834.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

On Mon, Feb 27, 2023 at 12:53:23PM +0100, Philippe Mathieu-Daudé wrote:
> On 19/2/23 15:21, Corey Minyard wrote:
> > On Sun, Feb 19, 2023 at 02:45:44PM +0100, Philippe Mathieu-Daudé wrote:
> > > On 18/2/23 21:25, Corey Minyard wrote:
> > > > On Mon, Feb 13, 2023 at 06:30:26PM +0100, Bernhard Beschow wrote:
> > > > > ich9_smb_init() is a legacy init function, so modernize the code.
> > > > > 
> > > > > Note that the smb_io_base parameter was unused.
> > > > 
> > > > Acked-by: Corey Minyard <cminyard@mvista.com>
> > > > 
> > > > > 
> > > > > Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> > > > > ---
> > > > >    include/hw/i386/ich9.h |  1 -
> > > > >    hw/i2c/smbus_ich9.c    | 13 +++----------
> > > > >    hw/i386/pc_q35.c       | 11 ++++++++---
> > > > >    3 files changed, 11 insertions(+), 14 deletions(-)
> > > > > 
> > > > > diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
> > > > > index 05464f6965..52ea116f44 100644
> > > > > --- a/include/hw/i386/ich9.h
> > > > > +++ b/include/hw/i386/ich9.h
> > > > > @@ -9,7 +9,6 @@
> > > > >    #include "qom/object.h"
> > > > >    void ich9_lpc_pm_init(PCIDevice *pci_lpc, bool smm_enabled);
> > > > > -I2CBus *ich9_smb_init(PCIBus *bus, int devfn, uint32_t smb_io_base);
> > > > >    void ich9_generate_smi(void);
> > > > > diff --git a/hw/i2c/smbus_ich9.c b/hw/i2c/smbus_ich9.c
> > > > > index d29c0f6ffa..f0dd3cb147 100644
> > > > > --- a/hw/i2c/smbus_ich9.c
> > > > > +++ b/hw/i2c/smbus_ich9.c
> > > > > @@ -105,6 +105,9 @@ static void ich9_smbus_realize(PCIDevice *d, Error **errp)
> > > > >        pm_smbus_init(&d->qdev, &s->smb, false);
> > > > >        pci_register_bar(d, ICH9_SMB_SMB_BASE_BAR, PCI_BASE_ADDRESS_SPACE_IO,
> > > > >                         &s->smb.io);
> > > > > +
> > > > > +    s->smb.set_irq = ich9_smb_set_irq;
> > > > > +    s->smb.opaque = s;
> > > 
> > > Corey, shouldn't we expand pm_smbus_init() to take set_irq / opaque
> > > arguments?
> > 
> > That would be nice, but the other two user of this function,
> > hw/isa/vt82c686.c and hw/acpi/piix4.c, don't use these fields.
> > I doubt we are getting any new users.  I'm fine either way, but the
> > value is not large.
> 
> The value is in enforcing stricter APIs (providing good examples).

I agree, and the change would be good, but IMHO it's beyond the scope of
this change and would slow things down.

I'll prepare a patch that does this.

Thanks,

-corey

> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> 

