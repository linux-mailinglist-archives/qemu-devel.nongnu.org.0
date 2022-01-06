Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 750AD48617F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 09:37:57 +0100 (CET)
Received: from localhost ([::1]:47660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5OHU-0005Q3-7z
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 03:37:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n5OGK-0004hr-PE
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 03:36:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n5OGH-000809-6C
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 03:36:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641458199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uTKs8FL/9Tqb9RWNF75ByktxZey553eU5AHV5oEvpLU=;
 b=cv1QMZ2Uzr+Y4ZhGpPzlJfA3isCrJeSoPm3RwyiUDq2mLHs3s/t0tUG/yTxzg8B3ophY76
 NP0veO0kljjDFwG+F2OgPpbEjjleJklHgDVYlQuvcQWFK7Pw9nmNrxrB5w/R77xLKDpDKs
 WHndymvgMnt+6xsfalde0aAdAIPbvO4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-271-GJSIf0L1ODWfN1GICb2QSA-1; Thu, 06 Jan 2022 03:36:38 -0500
X-MC-Unique: GJSIf0L1ODWfN1GICb2QSA-1
Received: by mail-ed1-f71.google.com with SMTP id
 z3-20020a05640240c300b003f9154816ffso1409480edb.9
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 00:36:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uTKs8FL/9Tqb9RWNF75ByktxZey553eU5AHV5oEvpLU=;
 b=kvlIg2wSGc4gaKC7HsjrXsDiGkEB6yU+c7649+hNyWhqJgouqh6DgrB65DLzmk9mxO
 fgZGPpYVzTYN4IGzldIbjT12WsryBCOdGmOat6ZzdvhpqTg+M7qpODjeo3MyhLLAxjeJ
 SpecKe9yauZpW2Ni64/5VQDDXapw9RCW+ZaKUDN3QPPoo2MTVukwjYZzIN0muxWIhtiW
 z9FwxMkvIJTnrde9QN4yZusyEwm+4W3O8b1JtbeBI5TFmMsMwmq7Mnch0XC+NJmWzj3v
 ovfiT+i/GNaCC/yKIOl9Ocf32leeyJoGPIkH0eMRwJMloi8f/MNh44HzspNGeOwMVdxx
 +8LA==
X-Gm-Message-State: AOAM532qWWfd1NwezZBlwRyst7Czhs6Okrxfq1CjemMznQTvN+ab/aGP
 cUXd5Lxwa3q/wo+2X/IodAanQNbUOKQA3N3RGeQwCJcmJ3k10rvKyZM6cDrx38doq/nwfrdtZMi
 qsvVkwBT8sKdBWOg=
X-Received: by 2002:a17:907:7d86:: with SMTP id
 oz6mr43728961ejc.312.1641458197645; 
 Thu, 06 Jan 2022 00:36:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwuMlV6YiNDJKoF3djv5ybOIRa46m3BHUg5Gmhb/KwIfqce+n1z0brw0JITNams+VKlCDTkVg==
X-Received: by 2002:a17:907:7d86:: with SMTP id
 oz6mr43728945ejc.312.1641458197454; 
 Thu, 06 Jan 2022 00:36:37 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id p3sm326060ejo.61.2022.01.06.00.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 00:36:36 -0800 (PST)
Date: Thu, 6 Jan 2022 09:36:36 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v5 2/3] acpi: tpm: Add missing device identification
 objects
Message-ID: <20220106093636.7fc7755f@redhat.com>
In-Reply-To: <20220104175806.872996-3-stefanb@linux.ibm.com>
References: <20220104175806.872996-1-stefanb@linux.ibm.com>
 <20220104175806.872996-3-stefanb@linux.ibm.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue,  4 Jan 2022 12:58:05 -0500
Stefan Berger <stefanb@linux.ibm.com> wrote:

> Add missing TPM device identification objects _STR and _UID. They will
> appear as files 'description' and 'uid' under Linux sysfs.
> 
> Following inspection of sysfs entries for hardware TPMs we chose
> uid '1'.

My guess would be that buy default (in case of missing UID), OSPM
will start enumerate from 0. So I think 0 is more safer choice
when it comes to compatibility.

Can you smoke test TPM with Windows, and check if adding UID doesn't
break anything if VM actually uses TMP (though I'm not sure how to
check it on Windows, maybe install Windows 11 without this patch
and then see if it still boots pre-installed VM and nothing is broken
after this patch)?


> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Ani Sinha <ani@anisinha.ca>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/708
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> Reviewed-by: Ani Sinha <ani@anisinha.ca>
> Reviewed-by: Shannon Zhao <shannon.zhaosl@gmail.com>
> Message-id: 20211223022310.575496-3-stefanb@linux.ibm.com
> ---
>  hw/arm/virt-acpi-build.c | 1 +
>  hw/i386/acpi-build.c     | 7 +++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index d0f4867fdf..f2514ce77c 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -229,6 +229,7 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
>  
>      Aml *dev = aml_device("TPM0");
>      aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
> +    aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device")));
>      aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>  
>      Aml *crs = aml_resource_template();
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 8383b83ee3..05740b7f15 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1812,11 +1812,15 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>                      dev = aml_device("TPM");
>                      aml_append(dev, aml_name_decl("_HID",
>                                                    aml_string("MSFT0101")));
> +                    aml_append(dev,
> +                               aml_name_decl("_STR",
> +                                             aml_string("TPM 2.0 Device")));
>                  } else {
>                      dev = aml_device("ISA.TPM");
>                      aml_append(dev, aml_name_decl("_HID",
>                                                    aml_eisaid("PNP0C31")));
>                  }
> +                aml_append(dev, aml_name_decl("_UID", aml_int(1)));
>  
>                  aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
>                  crs = aml_resource_template();
> @@ -1844,12 +1848,15 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>      if (TPM_IS_CRB(tpm)) {
>          dev = aml_device("TPM");
>          aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
> +        aml_append(dev, aml_name_decl("_STR",
> +                                      aml_string("TPM 2.0 Device")));
>          crs = aml_resource_template();
>          aml_append(crs, aml_memory32_fixed(TPM_CRB_ADDR_BASE,
>                                             TPM_CRB_ADDR_SIZE, AML_READ_WRITE));
>          aml_append(dev, aml_name_decl("_CRS", crs));
>  
>          aml_append(dev, aml_name_decl("_STA", aml_int(0xf)));
> +        aml_append(dev, aml_name_decl("_UID", aml_int(1)));
>  
>          tpm_build_ppi_acpi(tpm, dev);
>  


