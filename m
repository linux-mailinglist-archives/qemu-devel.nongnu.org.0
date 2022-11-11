Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4779E62583D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 11:26:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otREL-0005iO-5A; Fri, 11 Nov 2022 05:25:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1otREH-0005dk-2a
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 05:25:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1otREF-00077h-FB
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 05:25:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668162342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fL6bsM6CmnOftTV4wzF3nFSlPmH+jCD0TDvthIohEHA=;
 b=Xt5hAiPgP7bjzVwphbr/ER8NIReyndd2zMxicwscg6rKDpUvRYdaBmTJ5EQJpG/t3HQC+1
 lhprUyhasWfwN3Fjfkjpd1bRRcRSNmopF/ab47cSvUom+3hyIHrL5K3QaNCP4/cdNTO1p8
 aXvhh5pmU+GzxuhC5MhiiQ2Ny9OPZM4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-121--tR0dLPDNgeUrVLOAvts1g-1; Fri, 11 Nov 2022 05:25:41 -0500
X-MC-Unique: -tR0dLPDNgeUrVLOAvts1g-1
Received: by mail-qv1-f72.google.com with SMTP id
 mo15-20020a056214330f00b004b96d712bccso3428018qvb.22
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 02:25:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fL6bsM6CmnOftTV4wzF3nFSlPmH+jCD0TDvthIohEHA=;
 b=noLm0Mv/y6De274bBqdPBqssJkEvwDSdrRE1lWNb6YGG4P/NSrvCnN5rGzMxcAFouQ
 yPJVjyQxoVRUcOm4V4dY9X7JxFk4fQ7ZgiJ/pOj/LIBiHFIy1eBehMDg0RuvShHYiMVs
 BtuohWoyvE27GyrzmDx5fkySvvZRVpfd74RktE/z7VQ3MPUJhIIO0bF9m534LuDmBO1I
 K4ytA2jnXMoCnEuWlrWxpwDAAfvlueGzXzPnQdJN2PGk9pMKFMScyTMB635H6Xv3IqyB
 jyxc3STK4lZpZDyC9ZlviyI505NFY6tUKgh7AzjiCsG0ZImB3RM0ZuBe89YHSXxEHMYt
 /bZg==
X-Gm-Message-State: ANoB5pmAwgDt4ANKyb6WOa81X6u9Rq/i9YaYTdqLDUdajxkk99lOEHNo
 xh1DKnmT9gZUiCowlJGjrlc8j9XmtlZkkw6FBt+3rDOe4KdTIQG0wdDF4/Vt9OikOpwDH6AKc8A
 dTR9mtxWg0G0F94g=
X-Received: by 2002:ac8:514e:0:b0:3a5:5987:43dc with SMTP id
 h14-20020ac8514e000000b003a5598743dcmr660888qtn.313.1668162340978; 
 Fri, 11 Nov 2022 02:25:40 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4UWH4CM4QrGU0/LhF14xizWf8oHwmgO6JMucSCu9oPuXz7EuFfvuQSgZcSZGRilAG7nEeUqA==
X-Received: by 2002:ac8:514e:0:b0:3a5:5987:43dc with SMTP id
 h14-20020ac8514e000000b003a5598743dcmr660874qtn.313.1668162340722; 
 Fri, 11 Nov 2022 02:25:40 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 h21-20020ac85155000000b003a50248b89esm1064480qtn.26.2022.11.11.02.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 02:25:40 -0800 (PST)
Date: Fri, 11 Nov 2022 11:25:36 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PULL v4 44/83] acpi: pc: vga: use AcpiDevAmlIf interface to
 build VGA device descriptors
Message-ID: <20221111112536.136896a0@imammedo.users.ipa.redhat.com>
In-Reply-To: <20221111104330.7d735092@imammedo.users.ipa.redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-45-mst@redhat.com>
 <e491b2fe-5959-4837-fce9-a7d2cb2448e6@redhat.com>
 <20221109162607-mutt-send-email-mst@kernel.org>
 <CAFEAcA974tkv531hxgy8cWkOBcxP1WzzHAThAPxUomMbg6ymRg@mail.gmail.com>
 <20221111104330.7d735092@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 11 Nov 2022 10:43:30 +0100
Igor Mammedov <imammedo@redhat.com> wrote:

> On Thu, 10 Nov 2022 09:28:44 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
> 
> > On Wed, 9 Nov 2022 at 21:42, Michael S. Tsirkin <mst@redhat.com> wrote:
> >   
> > > > > diff --git a/hw/display/meson.build b/hw/display/meson.build
> > > > > index adc53dd8b6..7a725ed80e 100644
> > > > > --- a/hw/display/meson.build
> > > > > +++ b/hw/display/meson.build
> > > > > @@ -38,10 +38,21 @@ softmmu_ss.add(when: 'CONFIG_NEXTCUBE', if_true: files('next-fb.c'))
> > > > >   specific_ss.add(when: 'CONFIG_VGA', if_true: files('vga.c'))
> > > > > +if (config_all_devices.has_key('CONFIG_VGA_CIRRUS') or
> > > > > +    config_all_devices.has_key('CONFIG_VGA_PCI') or
> > > > > +    config_all_devices.has_key('CONFIG_VMWARE_VGA') or
> > > > > +    config_all_devices.has_key('CONFIG_ATI_VGA')
> > > > > +   )
> > > > > +  softmmu_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-vga.c'),
> > > > > +                                      if_false: files('acpi-vga-stub.c'))
> > > > > +endif    
> > >
> > > Igor what does  CONFIG_ACPI mean? It depends on the target but this
> > > library is target independent. Is this just always built then?    
> > 
> > That kind of config symbol means "some machine we want to build needs
> > ACPI, so build it". So if you build at least one machine that needs
> > ACPI, CONFIG_ACPI gets defined, and the acpi-specific files are built.
> > If your QEMU configure line and possibly any custom config file
> > mean you're not building any ACPI machines, then CONFIG_ACPI is
> > not defined, and we don't need to build in the acpi-specifics,
> > which makes the binary smaller. For instance if you set
> > --target-list=or1k-softmmu then no machine wants ACPI and
> > CONFIG_ACPI won't get set. If you set --target-list=or1k-softmmu,x86_64-softmmu
> > then the PC machine types want ACPI and CONFIG_ACPI is set.
> > 
> > (Essentially we're opting to make the build faster by building the
> > object file once rather than per-target, at the cost of the
> > executables for the target architectures which don't use the
> > feature being a bit bigger with code they aren't going to use.)
> > 
> > Note that this means that for a machine type which does not use ACPI, it
> > may either:
> >  (1) be being built in the same build as a machine that does use
> >  ACPI, so be linked against the "real" ACPI source files
> >  (2) be being built in a build with no ACPI machines, so be
> >  linked against the stub files
> > 
> > and it also means that the code in the "real" ACPI source files
> > cannot assume that it's being used in a machine which is actually
> > using ACPI.  
> 
[...]

> Even if it were not the case linking 'real' code in this case
> shouldn't have caused issues on machine that do not actually
> invoke it.
Well, aarch64 target is this case wher it has a mix of ACPI and
non-ACPI machines. As mentinod aove this shouldn't be the issue
in this case.
But are there ideas how to deal with such cases cleanly
(modulo tweaking 'real' code to deal with both cases)?


[...]

> 
> > thanks
> > -- PMM
> >   
> 


