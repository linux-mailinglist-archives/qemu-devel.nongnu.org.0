Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DBF44AF5E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 15:22:36 +0100 (CET)
Received: from localhost ([::1]:52646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkS1D-0003CH-6c
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 09:22:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mkRzU-0002XF-Rf
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 09:20:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mkRzS-0002wI-M6
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 09:20:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636467645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nQX6Bcymem5BqLq2je9YVRNzFj0d9e1GxQD/zOE0trU=;
 b=L5xreidURdZjKPwwZqT+aYjYnyeiG5vZy3f/iB+F7gXmESv7Zxv2Qctz23BCwkBpN0/a5/
 JmLQtLC39fpoRz7TsMzVaxIiqPm68WVQEqbQArAxrfdOGqwqnmjs8LloZF4bAr85R7zoPK
 aQIUqrdtQSkp/zwboRHUrWuvjVH1xeI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-bGNQVg_tOKuheGwrWBzwyg-1; Tue, 09 Nov 2021 09:20:44 -0500
X-MC-Unique: bGNQVg_tOKuheGwrWBzwyg-1
Received: by mail-ed1-f70.google.com with SMTP id
 s6-20020a056402520600b003e2dea4f9b4so15036965edd.12
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 06:20:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nQX6Bcymem5BqLq2je9YVRNzFj0d9e1GxQD/zOE0trU=;
 b=Nz8bWYrVuD2N1eFlFnxS6ANeeyk5IhqSo97QKuy9DjPL4SIb1iTnW6hOuaWspIKziH
 PyXBrVrAz2rgPXmh8rh0yrezq8mHdhqxjql2rpUSVYMtC+d6mkuR1AUJBLH/7a8vg/Al
 aYviayLfUtTORy3VDZ68ZsrjXFRiRtFRAKnwEc9B49/amDigUctamovJyXp0YDpNVbbP
 /H22i1bYjEA4IzysPbdFl+uhFogcKBZmNFiIY2iO2A09cj9we/3SQ+rhwD7RFpO4+H20
 Hm3DqqYdr/uunoyoLcM3ESHKPK5Eh9kY3ZTV7ki9ykRhx5bBtXTfEf/bUSTNuV6YInEB
 RXZg==
X-Gm-Message-State: AOAM532icPORvyhQy2QO16WRklNH9AKMhNP7sbGZ3q4BTnyAfsXrtkqB
 tSSSBBgrc/v/lfr6XfigoFhpAJPpyd9mZMn/riSy7Mt+hpmAaL0HCSLe0ZxgC1evsPiDUrts2v2
 0Yrjo5vH98Bf3BFc=
X-Received: by 2002:a05:6402:1102:: with SMTP id
 u2mr10625491edv.124.1636467643323; 
 Tue, 09 Nov 2021 06:20:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4vdNXjMSbnDYbIHs2c4vZL8yG4Biewz4X2LcixGDE5Pi3Y7c3jaHSHjcK5/R806Vo2GjlBA==
X-Received: by 2002:a05:6402:1102:: with SMTP id
 u2mr10625449edv.124.1636467643103; 
 Tue, 09 Nov 2021 06:20:43 -0800 (PST)
Received: from redhat.com ([2.55.133.41])
 by smtp.gmail.com with ESMTPSA id p6sm11023454edx.60.2021.11.09.06.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 06:20:42 -0800 (PST)
Date: Tue, 9 Nov 2021 09:20:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v2 2/3] acpi: tpm: Add missing device identification
 objects
Message-ID: <20211109091432-mutt-send-email-mst@kernel.org>
References: <20211109140152.3310657-1-stefanb@linux.ibm.com>
 <20211109140152.3310657-3-stefanb@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20211109140152.3310657-3-stefanb@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 09, 2021 at 09:01:51AM -0500, Stefan Berger wrote:
> Add missing device identification objects _STR and _UID. They will appear
> as files 'description' and 'uid' under Linux sysfs.
> 
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Ani Sinha <ani@anisinha.ca>
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/708
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>

Do you want this in 6.2?

> ---
>  hw/arm/virt-acpi-build.c | 1 +
>  hw/i386/acpi-build.c     | 8 ++++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 674f902652..09456424aa 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -228,6 +228,7 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
>  
>      Aml *dev = aml_device("TPM0");
>      aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
> +    aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device")));
>      aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>  
>      Aml *crs = aml_resource_template();
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index a3ad6abd33..5bd2160a89 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1808,11 +1808,15 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>                      dev = aml_device("TPM");
>                      aml_append(dev, aml_name_decl("_HID",
>                                                    aml_string("MSFT0101")));
> +                    aml_append(dev,
> +                               aml_name_decl("_STR",
> +                                             aml_string("TPM 2.0 Device")));


When we support more versions, won't this make us
do annoying tricks to say so in the string?
Why not just "TPM device" to future-proof it?

>                  } else {
>                      dev = aml_device("ISA.TPM");
>                      aml_append(dev, aml_name_decl("_HID",
>                                                    aml_eisaid("PNP0C31")));
>                  }
> +                aml_append(dev, aml_name_decl("_UID", aml_int(1)));
>

The ACPI spec mentions also matching on _CID.

  
>                  aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
>                  crs = aml_resource_template();
> @@ -1840,6 +1844,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>      if (TPM_IS_CRB(tpm)) {
>          dev = aml_device("TPM");
>          aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
> +        aml_append(dev, aml_name_decl("_STR",
> +                                      aml_string("TPM 2.0 Device")));
>          crs = aml_resource_template();
>          aml_append(crs, aml_memory32_fixed(TPM_CRB_ADDR_BASE,
>                                             TPM_CRB_ADDR_SIZE, AML_READ_WRITE));
> @@ -1847,6 +1853,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>  
>          aml_append(dev, aml_name_decl("_STA", aml_int(0xf)));
>  
> +        aml_append(dev, aml_name_decl("_UID", aml_int(1)));
> +
>          tpm_build_ppi_acpi(tpm, dev);
>  
>          aml_append(sb_scope, dev);
> -- 
> 2.31.1


