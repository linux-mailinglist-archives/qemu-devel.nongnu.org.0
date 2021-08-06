Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C693E28CA
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 12:39:15 +0200 (CEST)
Received: from localhost ([::1]:41662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBxFy-0006Aw-II
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 06:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mBxEo-0004oG-2p
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 06:38:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mBxEl-0003rf-Sv
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 06:38:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628246278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S77kgtvDuZwOwRGSJ2jBLMF+aE8h27exsbnuVa77fZY=;
 b=MVZHIdm6XobapgRd68hkpJ24Rcjh6BR/nSbbvjFB21TmR3xb5JF7dzYiatNXCnDFMUIbVO
 zGccUF4OhGdq6I6P7AwF3CI9TbgVEe2mIJdKTeWQML9uBmZYj7eAg8Y+Uy+txWoumpeeHt
 c9cbPRdWAyH0jZNZhVWS1Da8x0eko48=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-J5HYdL77Nr2EYUY1UAXDQg-1; Fri, 06 Aug 2021 06:37:57 -0400
X-MC-Unique: J5HYdL77Nr2EYUY1UAXDQg-1
Received: by mail-wr1-f70.google.com with SMTP id
 c5-20020adfed850000b02901537ecbecc6so2983052wro.19
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 03:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S77kgtvDuZwOwRGSJ2jBLMF+aE8h27exsbnuVa77fZY=;
 b=gZF3FQNXjyPn0Clo/cZwSEA1AEP8/hwYolMrDjtLNJacwuRJo1BUw59y7peQTTdhLU
 MeQQjbJLGc3cf+MDyubc9Bwmh/tNC4ecBEZuF/BHO25t4dalnSrCYve4Tqr5fRA0q0nL
 beinueIhQee/6HqKY8Q1IC7uymgGWTUxyPJtB/mGqN1sXwGsHcaZD59K9/VgPJ9kUonk
 MU/vnLfZPthUJBTny2YNFR5Haew5Y/ziQSXmkHtHDI4biDrfd51E5jMvtvfTwgn2TuYg
 PGs0uwZ1F6G2/pRbYavIcXsR9WRL/6TitrKY2Dz2KcyxZVZFgE6Omh6UEL58whjOYTtH
 V7fA==
X-Gm-Message-State: AOAM532rwv3OLYI0TwsC7m51KDdGHKlSt+XG7Ws6WPPK8zyO21YO9SnC
 yRkVSln5vfff23/JKrCVnDD03w/jSjmDWTOHF283FrJWQm0xtoGE/frMMK+77dS1eilQPaKKen2
 xYGkw5ZTU6fj4bP4=
X-Received: by 2002:a7b:cd83:: with SMTP id y3mr2542783wmj.126.1628246275963; 
 Fri, 06 Aug 2021 03:37:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0xMS7NGEFOXypz3y6CDw23eqeiKW0nKn+KCgH5fHni3jRv3ILSwp2Jd9NNh01JBa1LXMuVw==
X-Received: by 2002:a7b:cd83:: with SMTP id y3mr2542770wmj.126.1628246275828; 
 Fri, 06 Aug 2021 03:37:55 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id y197sm12119797wmc.7.2021.08.06.03.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 03:37:55 -0700 (PDT)
Date: Fri, 6 Aug 2021 12:37:54 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v3] hw/acpi: add an assertion check for non-null return
 from acpi_get_i386_pci_host
Message-ID: <20210806123754.1a1fa8a8@redhat.com>
In-Reply-To: <alpine.DEB.2.22.394.2108051938340.329433@anisinha-lenovo>
References: <20210726165743.232073-1-ani@anisinha.ca>
 <20210805111543.5fb99abf@redhat.com>
 <alpine.DEB.2.22.394.2108051705240.291909@anisinha-lenovo>
 <alpine.DEB.2.22.394.2108051826190.291909@anisinha-lenovo>
 <alpine.DEB.2.22.394.2108051938340.329433@anisinha-lenovo>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, jusual@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 5 Aug 2021 19:42:35 +0530 (IST)
Ani Sinha <ani@anisinha.ca> wrote:

> On Thu, 5 Aug 2021, Ani Sinha wrote:
> 
> >
> >
> > On Thu, 5 Aug 2021, Ani Sinha wrote:
> >  
> > >
> > >
> > > On Thu, 5 Aug 2021, Igor Mammedov wrote:
> > >  
> > > > On Mon, 26 Jul 2021 22:27:43 +0530
> > > > Ani Sinha <ani@anisinha.ca> wrote:
> > > >  
> > > > > All existing code using acpi_get_i386_pci_host() checks for a non-null
> > > > > return value from this function call. Instead of returning early when the value
> > > > > returned is NULL, assert instead. Since there are only two possible host buses
> > > > > for i386 - q35 and i440fx, a null value return from the function does not make
> > > > > sense in most cases and is likely an error situation.
> > > > >
> > > > > Fixes: c0e427d6eb5fef ("hw/acpi/ich9: Enable ACPI PCI hot-plug")
> > > > >
> > > > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > > > ---
> > > > >  hw/acpi/pcihp.c      |  8 ++++++++
> > > > >  hw/i386/acpi-build.c | 15 ++++++---------
> > > > >  2 files changed, 14 insertions(+), 9 deletions(-)
> > > > >
> > > > > changelog:
> > > > > v1: initial patch
> > > > > v2: removed comment addition - that can be sent as a separate patch.
> > > > > v3: added assertion for null host values for all cases except one.
> > > > >
> > > > > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > > > > index f4d706e47d..054ee8cbc5 100644
> > > > > --- a/hw/acpi/pcihp.c
> > > > > +++ b/hw/acpi/pcihp.c
> > > > > @@ -116,6 +116,12 @@ static void acpi_set_pci_info(void)
> > > > >      bsel_is_set = true;
> > > > >
> > > > >      if (!host) {
> > > > > +        /*
> > > > > +         * This function can be eventually called from
> > > > > +         * qemu_devices_reset() -> acpi_pcihp_reset() even
> > > > > +         * for architectures other than i386. Hence, we need
> > > > > +         * to ignore null values for host here.
> > > > > +         */
> > > > >          return;
> > > > >      }  
> > > >
> > > > I suspect it's a MIPS target that call this code unnecessarily.
> > > > It would be better to get rid of this condition altogether.
> > > > Frr that I can suggest to make acpi_pcihp_reset() stub and
> > > > replace pcihp.c with stub (perhaps use acpi-x86-stub.c) when building
> > > > for MIPS.
> > > >
> > > > then a bunch of asserts/ifs won't be necessary,
> > > > just one in acpi_get_i386_pci_host() will be sufficient.
> > > >  
> > >
> > > OK this is a good idea.
> > > I can see that mips-softmmu-config-devices.h has
> > > CONFIG_ACPI_X86 turned on for mips. This does not seem right.
> > >
> > > The issue here is:
> > >
> > > $ grep -R CONFIG_ACPI_X86 *
> > > devices/mips-softmmu/common.mak:CONFIG_ACPI_X86=y
> > >
> > > So after
> > >
> > > -CONFIG_ACPI_X86=y
> > > -CONFIG_PIIX4=y
> > >
> > > (the second one is needed because after removing first one we get:
> > >
> > > /usr/bin/ld: libcommon.fa.p/hw_isa_piix4.c.o: in function `piix4_create':
> > > /home/anisinha/workspace/qemu/build/../hw/isa/piix4.c:269: undefined
> > > reference to `piix4_pm_init'
> > >
> > > This is because in hw/acpi/meson.build, piix4.c is conditional on
> > > CONFIG_ACPI_X86. )
> > >
> > > /usr/bin/ld: libqemu-mips-softmmu.fa.p/hw_mips_gt64xxx_pci.c.o: in
> > > function `gt64120_pci_set_irq':
> > > /home/anisinha/workspace/qemu/build/../hw/mips/gt64xxx_pci.c:1020:
> > > undefined reference to `piix4_dev'
> > > /usr/bin/ld: libqemu-mips-softmmu.fa.p/hw_mips_malta.c.o: in function
> > > `mips_malta_init':
> > > /home/anisinha/workspace/qemu/build/../hw/mips/malta.c:1404: undefined
> > > reference to `piix4_create'
> > >
> > > So should mips be doing piix stuff anyway? Is Piix4 etc not x86 specific?  
> >
> > Apparently this is by design:
> > https://qemu.readthedocs.io/en/stable/system/target-mips.html
> >
> > which means mips malta will continue to use the x86 specific functions
> > like acpi_pcihp_reset(). Creating a stub for this with acpi-x86-stub.c
> > will result in a double symbol definition because CONFIG_PC is off for
> > mips.
> >  
> 
> Also to be noted that there is a stub for acpi_get_i386_pci_host() which
> simply returns NULL. This activates when CONFIG_PC is disabled. It is this
> stub that gets called for mips and hence the check for non-null host is
> needed in acpi_set_pci_info() function.
that were half measures to deal around code that shouldn't be called,
now with pcihp being used by both pc and q35 we don't have reason to
keep around null checks modulo mips calling code that shouldn't be
called there to begin with.


