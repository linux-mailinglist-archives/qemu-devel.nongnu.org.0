Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE63484609
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 17:37:22 +0100 (CET)
Received: from localhost ([::1]:51682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4moL-00047v-1L
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 11:37:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n4mm8-0003L7-Vy
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 11:35:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n4mm5-0004pM-I8
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 11:35:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641314100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y6xbBS5r2rgvYYSEfnMk/9lYY3msopCETMdRrlSLNqQ=;
 b=Jx/kzbMGq9faN8XY8Nt0ljsXI7Io1sxmOlchLoqmc9kYhY9RpM+EqUnnQNK4bKagvOUX00
 JVKFVerR2e4+mpoPXFEF5Wty/NE3rpxG1c6J6r27hcIsNnYbtdBWJJGV5bKxzEbXvHMgUq
 I11VWgvjlAthW/3itLZPRHtrXskIa8Q=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-xRPnpH-0OvCD7hrFJbEABw-1; Tue, 04 Jan 2022 11:34:59 -0500
X-MC-Unique: xRPnpH-0OvCD7hrFJbEABw-1
Received: by mail-wr1-f71.google.com with SMTP id
 v15-20020adf8b4f000000b001a24c46d6ceso11917264wra.15
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 08:34:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y6xbBS5r2rgvYYSEfnMk/9lYY3msopCETMdRrlSLNqQ=;
 b=dxsy3ksnGIp6zAhmb5qcp8Fx2x+EIP9MhrTL/Q42e8JLPCxZa+belpniBaPH+ySV4T
 /ihlHKJxc7O7MpEzwSAoB9hDdqh9xZNIQDBC3LXTdBIwIxRHeQ8+wTI1VNskPTh3I4EN
 4JYe3kRS1xP7WNDM+SSl3Zu/QjRKclPtpkvYiaPjffxOzwbrfdGGqRAHxMVtknnVnyLR
 zRAXu44VGQ6JrwcrzjTKF8siagOsfA62CiQiapBcmTlcw1S37snWx91vdrv0dqL87IHR
 zP+QrB3cwSxwgM+eITT2MSsXkfqoqiubSj0M/Ou9FJR+gJDQAkGh94irfu0IOONZX94M
 H/3A==
X-Gm-Message-State: AOAM531X1OfoAFRzYikyc3f6ne9LtGjSznLLN7W0TyYOmsw2lPRS6ahP
 PyurpZNjAqdwrmyYYvjc9MYdM64CtG2BPB+yJwJwkQXZjAM+MU+ku3CtY4jFPvULWSIjopGIdqs
 C702Rj31jc5oH280=
X-Received: by 2002:a5d:5610:: with SMTP id l16mr20458095wrv.418.1641314097985; 
 Tue, 04 Jan 2022 08:34:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxovzfh+U7fY+fblW9tS++JiWNzkpQDZDsWSJYuV5rhD62FkS2tq5fPl50PdnHoysUKSX+3rQ==
X-Received: by 2002:a5d:5610:: with SMTP id l16mr20458076wrv.418.1641314097711; 
 Tue, 04 Jan 2022 08:34:57 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id t12sm44324780wrs.72.2022.01.04.08.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 08:34:57 -0800 (PST)
Date: Tue, 4 Jan 2022 17:34:56 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v4 2/3] acpi: tpm: Add missing device identification
 objects
Message-ID: <20220104173456.5aaa0ea9@redhat.com>
In-Reply-To: <1b32e29a-36fc-7275-e856-97a12585e0a3@linux.ibm.com>
References: <20211223022310.575496-1-stefanb@linux.ibm.com>
 <20211223022310.575496-3-stefanb@linux.ibm.com>
 <20220104105506.17ed9209@redhat.com>
 <1b32e29a-36fc-7275-e856-97a12585e0a3@linux.ibm.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 4 Jan 2022 09:48:32 -0500
Stefan Berger <stefanb@linux.ibm.com> wrote:

> On 1/4/22 04:55, Igor Mammedov wrote:
> > On Wed, 22 Dec 2021 21:23:09 -0500
> > Stefan Berger <stefanb@linux.ibm.com> wrote:
> >  
> >> Add missing device identification objects _STR and _UID. They will appear  
> > why, does it break anything or it's just cosmetic?  
> 
> I don't know about whether any software needs these entries but it's 
> driven by this:
> 
> https://gitlab.com/qemu-project/qemu/-/issues/708
> 
> 
> >  
> >> as files 'description' and 'uid' under Linux sysfs.
> >>
> >> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> >> Cc: Michael S. Tsirkin <mst@redhat.com>
> >> Cc: Igor Mammedov <imammedo@redhat.com>
> >> Cc: Ani Sinha <ani@anisinha.ca>
> >> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/708
> >> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> >> Message-id: 20211110133559.3370990-3-stefanb@linux.ibm.com
> >> ---
> >>   hw/arm/virt-acpi-build.c | 1 +
> >>   hw/i386/acpi-build.c     | 8 ++++++++
> >>   2 files changed, 9 insertions(+)
> >>
> >> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> >> index d0f4867fdf..f2514ce77c 100644
> >> --- a/hw/arm/virt-acpi-build.c
> >> +++ b/hw/arm/virt-acpi-build.c
> >> @@ -229,6 +229,7 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
> >>   
> >>       Aml *dev = aml_device("TPM0");
> >>       aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
> >> +    aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device")));
> >>       aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> >>   
> >>       Aml *crs = aml_resource_template();
> >> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> >> index 8383b83ee3..2fb70847cb 100644
> >> --- a/hw/i386/acpi-build.c
> >> +++ b/hw/i386/acpi-build.c
> >> @@ -1812,11 +1812,15 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> >>                       dev = aml_device("TPM");
> >>                       aml_append(dev, aml_name_decl("_HID",
> >>                                                     aml_string("MSFT0101")));
> >> +                    aml_append(dev,
> >> +                               aml_name_decl("_STR",
> >> +                                             aml_string("TPM 2.0 Device")));
> >>                   } else {
> >>                       dev = aml_device("ISA.TPM");
> >>                       aml_append(dev, aml_name_decl("_HID",
> >>                                                     aml_eisaid("PNP0C31")));
> >>                   }
> >> +                aml_append(dev, aml_name_decl("_UID", aml_int(1)));  
> > why it's 1, and not 0 as in virt-arm?  
> 
> Marc-Andre and I looked at machines with hardware TPMs and that's what 
> we found there as well, a '1'.

perhaps mention that in commit message

> 
> 
> >  
> >>   
> >>                   aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
> >>                   crs = aml_resource_template();
> >> @@ -1844,6 +1848,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> >>       if (TPM_IS_CRB(tpm)) {
> >>           dev = aml_device("TPM");
> >>           aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
> >> +        aml_append(dev, aml_name_decl("_STR",
> >> +                                      aml_string("TPM 2.0 Device")));
> >>           crs = aml_resource_template();
> >>           aml_append(crs, aml_memory32_fixed(TPM_CRB_ADDR_BASE,
> >>                                              TPM_CRB_ADDR_SIZE, AML_READ_WRITE));
> >> @@ -1851,6 +1857,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> >>   
> >>           aml_append(dev, aml_name_decl("_STA", aml_int(0xf)));
> >>  
> > no necessary ^^^ empty line  
> fixed
> >  
> >> +        aml_append(dev, aml_name_decl("_UID", aml_int(1)));
> >> +
> >>           tpm_build_ppi_acpi(tpm, dev);
> >>   
> >>           aml_append(sb_scope, dev);  
> 


