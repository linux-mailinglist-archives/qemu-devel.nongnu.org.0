Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 404D944BDC2
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 10:26:00 +0100 (CET)
Received: from localhost ([::1]:39934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkjri-0006Dk-UE
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 04:25:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mkjqJ-0005EP-Pn
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 04:24:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mkjqG-0003Tb-UY
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 04:24:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636536266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SVVGPNEAyVqGYYnxBUr0FKy0AlNi0LQj4Fzcteyyfxk=;
 b=IVu99SP54HtWogWmmdded7jC+G/X0TdKGW7gSoDNyZauZ/6KSnwpKQ6/8k1ZWOKFUkKnaq
 94iypfCGUKRwtd9kmf4cDSwaixqk6jQVX9x4+V13w432UH15skBc+WftCafvq4lAxhVHPd
 TIK3b87TIn6lZCOjzFq5MZOMZlZ/P6k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-sJbj4lQKNy-omXADGuNo4A-1; Wed, 10 Nov 2021 04:24:25 -0500
X-MC-Unique: sJbj4lQKNy-omXADGuNo4A-1
Received: by mail-wm1-f71.google.com with SMTP id
 144-20020a1c0496000000b003305ac0e03aso2800980wme.8
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 01:24:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SVVGPNEAyVqGYYnxBUr0FKy0AlNi0LQj4Fzcteyyfxk=;
 b=fsbxTl/32uvDnfeRe0A/uSDF1YY/9YTHAoiP+0PB+iZMVqJ+Gtx28KSzJYZOJJUcfB
 63OdViaQgNpvnypVOQDO93sYraOutF4w1Zjk15nz+O/pflB6MYm8+F3NzuHyezACNSZY
 tb1ezIYV8n7MT6r/HJ3i2ktMTuswD0mlsiTAYNEaXv5aOVhaURGt9rEhn/pyrHVRcz+9
 sHjzy0oqE4/b6FH96QX0grm7nqFcmbvZTm2eXwENgPMNdYYF4Oprx5rNO0xyUJHbzCBK
 aH6ORLj7dyW9FzaK3/LbF24xxHI/DgG/j/85ozc1v1PaoR6MR34aMemFvxidMiZsvgIe
 keOg==
X-Gm-Message-State: AOAM533K/yjls89+CjrFLX7f2X0hNOb3ec6DGrI1GVmnHaxQc3s4MjrR
 BR9SxXwQ05QRog3VwOoytIUXR8+w6/Sv4sPdpQsbtydQK7uaSR6ggcUOCU1ckDpmnuCeZF3P3E3
 r0T3f8oqd0zKmwUo=
X-Received: by 2002:adf:e109:: with SMTP id t9mr17144475wrz.387.1636536264340; 
 Wed, 10 Nov 2021 01:24:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzAtQpgqIQzNixRTEE/0q4OCtHYJse4vp61ois7RztIvg6bes38ghvHwlL7vjDjtsHJV9LZbw==
X-Received: by 2002:adf:e109:: with SMTP id t9mr17144432wrz.387.1636536264009; 
 Wed, 10 Nov 2021 01:24:24 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id c5sm19302285wrd.13.2021.11.10.01.24.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 01:24:23 -0800 (PST)
Subject: Re: [PATCH] acpi: tpm: Add missing device identification objects
To: Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20211109004615.993911-1-stefanb@linux.vnet.ibm.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <4584426c-6bd3-c2f7-74cd-d22b35a2e4f6@redhat.com>
Date: Wed, 10 Nov 2021 10:24:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211109004615.993911-1-stefanb@linux.vnet.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.678, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, marcandre.lureau@redhat.com,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan,

On 11/9/21 1:46 AM, Stefan Berger wrote:
> From: Stefan Berger <stefanb@linux.ibm.com>
> 
> Add missing device identification objects _STR and _UID. They will appear
> as files 'description' and 'uid' under Linux sysfs.
> 
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Ani Sinha <ani@anisinha.ca>
> Fixes: #708
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>  hw/arm/virt-acpi-build.c | 1 +
>  hw/i386/acpi-build.c     | 4 ++++
>  2 files changed, 5 insertions(+)
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
> index a3ad6abd33..d6d3541407 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1808,6 +1808,10 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>                      dev = aml_device("TPM");
>                      aml_append(dev, aml_name_decl("_HID",
>                                                    aml_string("MSFT0101")));
> +                    aml_append(dev,
> +                               aml_name_decl("_STR",
> +                                             aml_string("TPM 2.0 Device")));
> +                    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>                  } else {
>                      dev = aml_device("ISA.TPM");
>                      aml_append(dev, aml_name_decl("_HID",
> 


