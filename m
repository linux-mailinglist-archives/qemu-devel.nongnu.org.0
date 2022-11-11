Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10934625729
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 10:45:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otQZZ-00058x-AK; Fri, 11 Nov 2022 04:43:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1otQZX-00058p-DO
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 04:43:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1otQZV-0007Yn-94
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 04:43:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668159815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IFjmZY0GLMdbpsNRTZ8jm0EKaEdY2FvWpNTM7khW6Jc=;
 b=aff3ll8Lo5gRboKMxHJI/3fv0Jl+nAdv5en5z04ePx54GLAFKnSuLjGvGNmpxk3vmwNtyh
 RTI5WKxxj3IUxLLaPQAT9rZ3hQAjEN1q+0U4fpeIHgU7r/+q7hySXrLpz5+WjPATz3Xfzi
 r4GEqPKCp2EBW3AdEJDEPdpzg18MlI0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-516-R5gctIOEOC2WDp_CIGNWCw-1; Fri, 11 Nov 2022 04:43:34 -0500
X-MC-Unique: R5gctIOEOC2WDp_CIGNWCw-1
Received: by mail-qv1-f69.google.com with SMTP id
 b2-20020a0cfe62000000b004bbfb15297dso3350272qvv.19
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 01:43:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IFjmZY0GLMdbpsNRTZ8jm0EKaEdY2FvWpNTM7khW6Jc=;
 b=D2Ay788NZn/kcGHcqXzCBAe7r4iRoXq9RAdYyacCI4PCzJJWb7KwiPfbwRgDuQTwAY
 EcQ1GTlTbsm7ij6THN7KSJjXFEPK9JwbXGoCDK8vQVXLeiHauoieVsyswYiOpgsdn0Fj
 RVnYVSQKMkTYREW0zNN+71pV6mvH+mPYOylO4SHZLz1clVAEaTnTw2Ygr1K/xQiiYeWm
 Np4QOWMErxCTDRaNEh+Vcy/RExcs/h5ab0kxF0ByBxVaunsvL/VuM210a+K6424BuVlR
 BGMff60h7zpLOYel5e3ainmCi3TEPUCUaSzcZlXty/n+b8noWFB+YdFI0EI37/4i5bvs
 VUWQ==
X-Gm-Message-State: ANoB5pkCCKuOobu7wiAmOiI7RJMrxlgmhwAGy1DYpuNwpbyCrdpT5YBn
 SLG84/GPPxNMtNEwathyWEXyK2iHu+zVtMhz7gGqQGyk9NEn2Ghb3V/XH5aHMl43KJ4XZp8yN4V
 TqeNTQMlR1Z+pGgM=
X-Received: by 2002:ac8:5204:0:b0:3a4:f434:8215 with SMTP id
 r4-20020ac85204000000b003a4f4348215mr573313qtn.114.1668159813910; 
 Fri, 11 Nov 2022 01:43:33 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7AGeTujNzhCn2Psedf3HIMU2pRD6LLLVYKmbOat9cbdHVR8GCsUHxvL4TPZK3IvfDyF/ObWg==
X-Received: by 2002:ac8:5204:0:b0:3a4:f434:8215 with SMTP id
 r4-20020ac85204000000b003a4f4348215mr573303qtn.114.1668159813687; 
 Fri, 11 Nov 2022 01:43:33 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 r17-20020ae9d611000000b006ee7e223bb8sm1163334qkk.39.2022.11.11.01.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 01:43:32 -0800 (PST)
Date: Fri, 11 Nov 2022 10:43:30 +0100
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
Message-ID: <20221111104330.7d735092@imammedo.users.ipa.redhat.com>
In-Reply-To: <CAFEAcA974tkv531hxgy8cWkOBcxP1WzzHAThAPxUomMbg6ymRg@mail.gmail.com>
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-45-mst@redhat.com>
 <e491b2fe-5959-4837-fce9-a7d2cb2448e6@redhat.com>
 <20221109162607-mutt-send-email-mst@kernel.org>
 <CAFEAcA974tkv531hxgy8cWkOBcxP1WzzHAThAPxUomMbg6ymRg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Thu, 10 Nov 2022 09:28:44 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Wed, 9 Nov 2022 at 21:42, Michael S. Tsirkin <mst@redhat.com> wrote:
> 
> > > > diff --git a/hw/display/meson.build b/hw/display/meson.build
> > > > index adc53dd8b6..7a725ed80e 100644
> > > > --- a/hw/display/meson.build
> > > > +++ b/hw/display/meson.build
> > > > @@ -38,10 +38,21 @@ softmmu_ss.add(when: 'CONFIG_NEXTCUBE', if_true: files('next-fb.c'))
> > > >   specific_ss.add(when: 'CONFIG_VGA', if_true: files('vga.c'))
> > > > +if (config_all_devices.has_key('CONFIG_VGA_CIRRUS') or
> > > > +    config_all_devices.has_key('CONFIG_VGA_PCI') or
> > > > +    config_all_devices.has_key('CONFIG_VMWARE_VGA') or
> > > > +    config_all_devices.has_key('CONFIG_ATI_VGA')
> > > > +   )
> > > > +  softmmu_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-vga.c'),
> > > > +                                      if_false: files('acpi-vga-stub.c'))
> > > > +endif  
> >
> > Igor what does  CONFIG_ACPI mean? It depends on the target but this
> > library is target independent. Is this just always built then?  
> 
> That kind of config symbol means "some machine we want to build needs
> ACPI, so build it". So if you build at least one machine that needs
> ACPI, CONFIG_ACPI gets defined, and the acpi-specific files are built.
> If your QEMU configure line and possibly any custom config file
> mean you're not building any ACPI machines, then CONFIG_ACPI is
> not defined, and we don't need to build in the acpi-specifics,
> which makes the binary smaller. For instance if you set
> --target-list=or1k-softmmu then no machine wants ACPI and
> CONFIG_ACPI won't get set. If you set --target-list=or1k-softmmu,x86_64-softmmu
> then the PC machine types want ACPI and CONFIG_ACPI is set.
> 
> (Essentially we're opting to make the build faster by building the
> object file once rather than per-target, at the cost of the
> executables for the target architectures which don't use the
> feature being a bit bigger with code they aren't going to use.)
> 
> Note that this means that for a machine type which does not use ACPI, it
> may either:
>  (1) be being built in the same build as a machine that does use
>  ACPI, so be linked against the "real" ACPI source files
>  (2) be being built in a build with no ACPI machines, so be
>  linked against the stub files
> 
> and it also means that the code in the "real" ACPI source files
> cannot assume that it's being used in a machine which is actually
> using ACPI.

Stubs only work because we create per target binaries,
so I'd expect acpi-vga.o and acpi-vga-stub.o being built and
linked accordingly.

Even if it were not the case linking 'real' code in this case
shouldn't have caused issues on machine that do not actually
invoke it.

Michael has already fixed issue removing pixman dependency in stub,
which I haven't noticed (my machines have the library installed
and CI at time of posting was green as well).

> thanks
> -- PMM
> 


