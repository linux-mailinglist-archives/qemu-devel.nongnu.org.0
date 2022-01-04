Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A30483F79
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 10:56:55 +0100 (CET)
Received: from localhost ([::1]:56840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4gYo-0004eA-62
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 04:56:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n4gXI-0003QO-Ok
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 04:55:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n4gXE-0000c2-8I
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 04:55:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641290115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rD9143K30P+n9ziB8253VmvEazBDfhY/4XjEljS4CtY=;
 b=KlJRGOGfZmeiFknJFpT4BQekiq4jGKlMMlLi5t/3fyAsflffIjqJlmojtF3sZ0hAj3mVjc
 JgZ+Ia9MZWgzZZllpu2WxOYWJhACOlJ9aLD1NkPHg9fCfZV819HTqmgL7Ztblrp9sbvOUr
 RBaewHeo9U93BTUx6TsV3L7l44t0uSg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-A58v0ml3N9C_64lyihDVLQ-1; Tue, 04 Jan 2022 04:55:09 -0500
X-MC-Unique: A58v0ml3N9C_64lyihDVLQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 ay24-20020a056402203800b003f8491e499eso24847786edb.21
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 01:55:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rD9143K30P+n9ziB8253VmvEazBDfhY/4XjEljS4CtY=;
 b=e0iCQRJjgScD0kD8f4NTbz3SZd60o9s114jrkF/rwEjQOlCn273s5gAB2pI4Wj/0tN
 YoziOkuSAFlvX7TzOgwHRjC+Ui8aGgFZcC/7H4oeSlU8iJc5xUmrdSBhkjYG+uYl32xS
 og9wL1c/s26C+ohSjwMnQm9vjtpz7NZgxabPXJxW8z0OXp7B+CaNqdnpbcI44DgOkX+m
 PcKLN/Hc6BHuOrZZ9YuJwe0ZsOhQG0+QivGqehJzFGN580fOpr++QtVpX/F5RTRxpG+a
 IK509b05mmXIU3GmCEGR6iM3z41EuoFfZELV0gnd+PERoZAelpr1u5NM9GhRfRAeyfR1
 cQfw==
X-Gm-Message-State: AOAM530/HwAFGgc1t5kn1iLHinCfWAaaimJVuHMbix8zMPZMgPLbviRX
 3emvwqtiqyB6P7EKXrcAPR8+ZdQ4dVm1FYSpj42BswG81avGfBSgCFiH4nvmLO5O+ZLRZqI8vvC
 7PbDWasavSazetQc=
X-Received: by 2002:aa7:cd5a:: with SMTP id v26mr48391256edw.303.1641290108048; 
 Tue, 04 Jan 2022 01:55:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxkhlmDWIqe7GZM2N9iaAJ1S8vOvesROormP/GSUQW3MXULiQ6vJSXivXUsSjehWEvdKxyaQ==
X-Received: by 2002:aa7:cd5a:: with SMTP id v26mr48391240edw.303.1641290107870; 
 Tue, 04 Jan 2022 01:55:07 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id q14sm14717291edd.40.2022.01.04.01.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 01:55:07 -0800 (PST)
Date: Tue, 4 Jan 2022 10:55:06 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v4 2/3] acpi: tpm: Add missing device identification
 objects
Message-ID: <20220104105506.17ed9209@redhat.com>
In-Reply-To: <20211223022310.575496-3-stefanb@linux.ibm.com>
References: <20211223022310.575496-1-stefanb@linux.ibm.com>
 <20211223022310.575496-3-stefanb@linux.ibm.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
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

On Wed, 22 Dec 2021 21:23:09 -0500
Stefan Berger <stefanb@linux.ibm.com> wrote:

> Add missing device identification objects _STR and _UID. They will appear

why, does it break anything or it's just cosmetic?

> as files 'description' and 'uid' under Linux sysfs.
> 
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Ani Sinha <ani@anisinha.ca>
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/708
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> Message-id: 20211110133559.3370990-3-stefanb@linux.ibm.com
> ---
>  hw/arm/virt-acpi-build.c | 1 +
>  hw/i386/acpi-build.c     | 8 ++++++++
>  2 files changed, 9 insertions(+)
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
> index 8383b83ee3..2fb70847cb 100644
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

why it's 1, and not 0 as in virt-arm?

>  
>                  aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
>                  crs = aml_resource_template();
> @@ -1844,6 +1848,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>      if (TPM_IS_CRB(tpm)) {
>          dev = aml_device("TPM");
>          aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
> +        aml_append(dev, aml_name_decl("_STR",
> +                                      aml_string("TPM 2.0 Device")));
>          crs = aml_resource_template();
>          aml_append(crs, aml_memory32_fixed(TPM_CRB_ADDR_BASE,
>                                             TPM_CRB_ADDR_SIZE, AML_READ_WRITE));
> @@ -1851,6 +1857,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>  
>          aml_append(dev, aml_name_decl("_STA", aml_int(0xf)));
>
no necessary ^^^ empty line

> +        aml_append(dev, aml_name_decl("_UID", aml_int(1)));
> +
>          tpm_build_ppi_acpi(tpm, dev);
>  
>          aml_append(sb_scope, dev);


