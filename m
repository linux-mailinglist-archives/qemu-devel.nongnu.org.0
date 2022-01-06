Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D074863CF
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 12:42:19 +0100 (CET)
Received: from localhost ([::1]:36614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5R9u-0004wO-3T
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 06:42:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5R8U-00040X-6U
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 06:40:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5R8S-00013l-FH
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 06:40:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641469247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KYtYefWvrx7jUGW/MHfPvObAgWWBxNkZBC7vOLLAjIk=;
 b=UFZjkfUpS+K3CYqYnQoOAhnO1BSyphRy/8j8aLoA91MZBeoaXvC/BoXMvZCVwWgBrgP2zN
 0/Tq6m5wxVjgPV6svEwCvWnUkD4ePmp9uy8ckXF6REySScWbnzwcKnQB/rMNZrhIYKtHck
 zsb4w+A9d6gycqPzB/PMgh9wikXNOB8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-aE8xiJydN9CmKdGVkqe2zg-1; Thu, 06 Jan 2022 06:40:46 -0500
X-MC-Unique: aE8xiJydN9CmKdGVkqe2zg-1
Received: by mail-wr1-f70.google.com with SMTP id
 w2-20020adfbac2000000b001a540eeb812so452912wrg.8
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 03:40:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KYtYefWvrx7jUGW/MHfPvObAgWWBxNkZBC7vOLLAjIk=;
 b=NaVD0TZnkckOTUeCuwz5ZbyDv8wYiaZUxzmhrkMx6P+718QLF/o1UUXsPd7RuugCLZ
 rqTx62PrckMrdN3ckxMM56N3OuXPtN853MY5JyGEO7LvT0NWMVSJuR9LfA+koeOIVVoc
 1+UL3lY+vrO8vb5rGriD22P/NNCxwKKyZhfssgkYe3xvgHSMB9tgD8d/NIn/U3yhT6Dc
 t0wDO0Kjfa/T6QctEZ77B6iNd5mAz9odKbn3AhnQk0FltMu3ye2GM2zwSyYXzXvUdKno
 SQToqfdTX+A9uEirNQNDKWTw/iscSW0wf9KIMVCj4HUktoYe09LKSoFIE+Q4vj8h5CNE
 wbcA==
X-Gm-Message-State: AOAM5308jVr5RfVVeEFAvQeOgLbBSZCy5Rik6rxqJIcANqn2cXDFemPW
 3qyWnJQ+j+0NXXH8JLB9XyvjgRd6Q4nzUCpKVsCMuqQ+X3Db7kso96eiiOvtJ+mO/bgsBJ/CnJy
 naxAxsclJqxWPtfA=
X-Received: by 2002:a5d:6f11:: with SMTP id
 ay17mr12810008wrb.662.1641469245300; 
 Thu, 06 Jan 2022 03:40:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyruYF3D3VP8F9WeRz+ZcKA5Fd7nqEqnxi14SMcJVpIxHERAMlRZJn+SZVHYanvenzDieG+Fw==
X-Received: by 2002:a5d:6f11:: with SMTP id
 ay17mr12809992wrb.662.1641469245050; 
 Thu, 06 Jan 2022 03:40:45 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id 6sm1100532wmo.42.2022.01.06.03.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 03:40:44 -0800 (PST)
Date: Thu, 6 Jan 2022 06:40:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v5 2/3] acpi: tpm: Add missing device identification
 objects
Message-ID: <20220106063835-mutt-send-email-mst@kernel.org>
References: <20220104175806.872996-1-stefanb@linux.ibm.com>
 <20220104175806.872996-3-stefanb@linux.ibm.com>
 <20220106093636.7fc7755f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106093636.7fc7755f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-devel@nongnu.org,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 06, 2022 at 09:36:36AM +0100, Igor Mammedov wrote:
> On Tue,  4 Jan 2022 12:58:05 -0500
> Stefan Berger <stefanb@linux.ibm.com> wrote:
> 
> > Add missing TPM device identification objects _STR and _UID. They will
> > appear as files 'description' and 'uid' under Linux sysfs.
> > 
> > Following inspection of sysfs entries for hardware TPMs we chose
> > uid '1'.
> 
> My guess would be that buy default (in case of missing UID), OSPM
> will start enumerate from 0. So I think 0 is more safer choice
> when it comes to compatibility.
> 
> Can you smoke test TPM with Windows, and check if adding UID doesn't
> break anything if VM actually uses TMP (though I'm not sure how to
> check it on Windows, maybe install Windows 11 without this patch
> and then see if it still boots pre-installed VM and nothing is broken
> after this patch)?

Given out experience with these things, I would add compat
machinery and avoid changing things for existing machine types.
Should be sufficient to address these concerns right Igor?

> 
> > Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> > Cc: Michael S. Tsirkin <mst@redhat.com>
> > Cc: Igor Mammedov <imammedo@redhat.com>
> > Cc: Ani Sinha <ani@anisinha.ca>
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/708
> > Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> > Reviewed-by: Ani Sinha <ani@anisinha.ca>
> > Reviewed-by: Shannon Zhao <shannon.zhaosl@gmail.com>
> > Message-id: 20211223022310.575496-3-stefanb@linux.ibm.com
> > ---
> >  hw/arm/virt-acpi-build.c | 1 +
> >  hw/i386/acpi-build.c     | 7 +++++++
> >  2 files changed, 8 insertions(+)
> > 
> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > index d0f4867fdf..f2514ce77c 100644
> > --- a/hw/arm/virt-acpi-build.c
> > +++ b/hw/arm/virt-acpi-build.c
> > @@ -229,6 +229,7 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
> >  
> >      Aml *dev = aml_device("TPM0");
> >      aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
> > +    aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device")));
> >      aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> >  
> >      Aml *crs = aml_resource_template();
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index 8383b83ee3..05740b7f15 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -1812,11 +1812,15 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> >                      dev = aml_device("TPM");
> >                      aml_append(dev, aml_name_decl("_HID",
> >                                                    aml_string("MSFT0101")));
> > +                    aml_append(dev,
> > +                               aml_name_decl("_STR",
> > +                                             aml_string("TPM 2.0 Device")));
> >                  } else {
> >                      dev = aml_device("ISA.TPM");
> >                      aml_append(dev, aml_name_decl("_HID",
> >                                                    aml_eisaid("PNP0C31")));
> >                  }
> > +                aml_append(dev, aml_name_decl("_UID", aml_int(1)));
> >  
> >                  aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
> >                  crs = aml_resource_template();
> > @@ -1844,12 +1848,15 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> >      if (TPM_IS_CRB(tpm)) {
> >          dev = aml_device("TPM");
> >          aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
> > +        aml_append(dev, aml_name_decl("_STR",
> > +                                      aml_string("TPM 2.0 Device")));
> >          crs = aml_resource_template();
> >          aml_append(crs, aml_memory32_fixed(TPM_CRB_ADDR_BASE,
> >                                             TPM_CRB_ADDR_SIZE, AML_READ_WRITE));
> >          aml_append(dev, aml_name_decl("_CRS", crs));
> >  
> >          aml_append(dev, aml_name_decl("_STA", aml_int(0xf)));
> > +        aml_append(dev, aml_name_decl("_UID", aml_int(1)));
> >  
> >          tpm_build_ppi_acpi(tpm, dev);
> >  


