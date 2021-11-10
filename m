Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A851844C11F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 13:20:06 +0100 (CET)
Received: from localhost ([::1]:45162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkmaD-00071z-Hv
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 07:20:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mkmYB-0004pb-Q6
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 07:17:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mkmY7-0006ZN-EB
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 07:17:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636546674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1fF845SalTj5Ls8nGl5fz5nT3i1pWHyvzhtxPrCaCNQ=;
 b=GGptXemB1UIk+MUakxRL0L1Tq2uTxGXYatu+hZvbGLLfJ24Tdxc8gA6XME2SNHatJV1tzm
 cjCZw0Cu4PPi1ojRG0JbRC5IcfEt4VtKceGgLkbvKh+5RhfweQElA2r2wCVmW75V9Zz9he
 I5Zy34ytJeGDhLRfqsQE1tFasSOJMIk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-61pzmL5iNR6H7HZCR3NtzQ-1; Wed, 10 Nov 2021 07:17:53 -0500
X-MC-Unique: 61pzmL5iNR6H7HZCR3NtzQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 d11-20020a50cd4b000000b003da63711a8aso2123545edj.20
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 04:17:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1fF845SalTj5Ls8nGl5fz5nT3i1pWHyvzhtxPrCaCNQ=;
 b=wdAwrjfgR+fezzc/ZpzcxodStHoiFkIRw+m83NI+YPL9/66Pe2wz9kG+XC4lBQpi1F
 HUwtAIoMn9jgDy2BmlJvflKR8WL9OtrZNB9pVJuyXNRFX9WpahVv921lT3ZKAi4nUlTe
 7bz0dn1GZaNCo9XD0GZaRvk6ISIbbIqZw9O4E9QNKujw7V4+kS0SOcolBwlhNyXKZqEQ
 BNBWqAohlhzUf5B8a9PMHXF3eII7pyfuV9ACbax+Tn29zpO092SwBfzrY/PrRvULdvBT
 tX8/E1K4Bp3M+FLHyBrYnClhDXRTG3BPnOM5r4qlM6xEnBoyW6NRchiX8GaSMdw3MGIa
 OHlA==
X-Gm-Message-State: AOAM533rduIzKRK26e/vzqNPXl4Ao0jfs+3zvlG5WVFkNppKSsr2uIs7
 ZIBM4u3xXUOmkqZ4qILqBm+7Mh0KDEdTMZlENMhk8pZm2jOT+szfgPb1eWboJ+m9liLLl485ctB
 cPsZDCzKe0El2RY8=
X-Received: by 2002:a17:907:728a:: with SMTP id
 dt10mr19503595ejc.526.1636546672440; 
 Wed, 10 Nov 2021 04:17:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdvm8t/+EBoGceemVy+wyt7PIoF1qH7wDjHGCXhJziMvJL6srOYLH66HxmCG0eLzJU3wTr7w==
X-Received: by 2002:a17:907:728a:: with SMTP id
 dt10mr19503563ejc.526.1636546672211; 
 Wed, 10 Nov 2021 04:17:52 -0800 (PST)
Received: from redhat.com ([2.55.133.41])
 by smtp.gmail.com with ESMTPSA id p3sm11448528ejy.94.2021.11.10.04.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 04:17:51 -0800 (PST)
Date: Wed, 10 Nov 2021 07:17:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v2 2/3] acpi: tpm: Add missing device identification
 objects
Message-ID: <20211110071602-mutt-send-email-mst@kernel.org>
References: <20211109140152.3310657-1-stefanb@linux.ibm.com>
 <20211109140152.3310657-3-stefanb@linux.ibm.com>
 <20211109091432-mutt-send-email-mst@kernel.org>
 <5f10eeed-e83c-e2c8-b4bb-23116fdcbc51@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <5f10eeed-e83c-e2c8-b4bb-23116fdcbc51@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Cc: Ani Sinha <ani@anisinha.ca>, marcandre.lureau@redhat.com,
 Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 09, 2021 at 09:26:46AM -0500, Stefan Berger wrote:
> 
> On 11/9/21 09:20, Michael S. Tsirkin wrote:
> > On Tue, Nov 09, 2021 at 09:01:51AM -0500, Stefan Berger wrote:
> > > Add missing device identification objects _STR and _UID. They will appear
> > > as files 'description' and 'uid' under Linux sysfs.
> > > 
> > > Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > Cc: Igor Mammedov <imammedo@redhat.com>
> > > Cc: Ani Sinha <ani@anisinha.ca>
> > > Fixes: https://gitlab.com/qemu-project/qemu/-/issues/708
> > > Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> > Do you want this in 6.2?
> 
> Yes.
> 
> 
> > 
> > > ---
> > >   hw/arm/virt-acpi-build.c | 1 +
> > >   hw/i386/acpi-build.c     | 8 ++++++++
> > >   2 files changed, 9 insertions(+)
> > > 
> > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > index 674f902652..09456424aa 100644
> > > --- a/hw/arm/virt-acpi-build.c
> > > +++ b/hw/arm/virt-acpi-build.c
> > > @@ -228,6 +228,7 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
> > >       Aml *dev = aml_device("TPM0");
> > >       aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
> > > +    aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device")));
> > >       aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> > >       Aml *crs = aml_resource_template();
> > > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > > index a3ad6abd33..5bd2160a89 100644
> > > --- a/hw/i386/acpi-build.c
> > > +++ b/hw/i386/acpi-build.c
> > > @@ -1808,11 +1808,15 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> > >                       dev = aml_device("TPM");
> > >                       aml_append(dev, aml_name_decl("_HID",
> > >                                                     aml_string("MSFT0101")));
> > > +                    aml_append(dev,
> > > +                               aml_name_decl("_STR",
> > > +                                             aml_string("TPM 2.0 Device")));
> > 
> > When we support more versions, won't this make us
> > do annoying tricks to say so in the string?
> > Why not just "TPM device" to future-proof it?
> 
> I am not sure what other version there will be and I haven't seen any other
> descriptions than the one reported here:
> 
> https://gitlab.com/qemu-project/qemu/-/issues/708
> 
> That's why I took TPM 2.0 device. My TPM 1.2 machine doesn't report it for a
> TPM 1.2.
> 
> 

ok

> > 
> > > haven                 } else {
> > >                       dev = aml_device("ISA.TPM");
> > >                       aml_append(dev, aml_name_decl("_HID",
> > >                                                     aml_eisaid("PNP0C31")));
> > >                   }
> > > +                aml_append(dev, aml_name_decl("_UID", aml_int(1)));
> > > 
> > The ACPI spec mentions also matching on _CID.
> "6.1.2 _CID (Compatible ID)
> This optional object is used to supply OSPM with a device?s Plug and
> Play-Compatible Device ID. Use _CID
> 
> objects when a device has no other defined hardware standard method to
> report its compatible IDs"
> 
> 
> 6.1.12 _UID (Unique ID)
> This object provides OSPM with a logical device ID that does not change
> across reboots. This object is
> optional, but is required when the device has no other way to report a
> persistent unique device ID. The
> _UID must be unique across all devices with either a common _HID or _CID.
> 
> 
> Is _CID a must-have for TPM now? We have _HID.


the spec says UID is unique for all
devices with a given CID or HID. Does this mean just HID is used
if no CID? Or that all devices without CID must have unique UIDs?

I think the former but just making sure.

> 
> > >                   aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
> > >                   crs = aml_resource_template();
> > > @@ -1840,6 +1844,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> > >       if (TPM_IS_CRB(tpm)) {
> > >           dev = aml_device("TPM");
> > >           aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
> > > +        aml_append(dev, aml_name_decl("_STR",
> > > +                                      aml_string("TPM 2.0 Device")));
> > >           crs = aml_resource_template();
> > >           aml_append(crs, aml_memory32_fixed(TPM_CRB_ADDR_BASE,
> > >                                              TPM_CRB_ADDR_SIZE, AML_READ_WRITE));
> > > @@ -1847,6 +1853,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> > >           aml_append(dev, aml_name_decl("_STA", aml_int(0xf)));
> > > +        aml_append(dev, aml_name_decl("_UID", aml_int(1)));
> > > +
> > >           tpm_build_ppi_acpi(tpm, dev);
> > >           aml_append(sb_scope, dev);
> > > -- 
> > > 2.31.1


