Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDA3434676
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 10:07:21 +0200 (CEST)
Received: from localhost ([::1]:39000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md6d5-0002I5-Lz
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 04:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1md6b9-00016A-Bv
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 04:05:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1md6b6-0007EK-GL
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 04:05:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634717115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hwWPIg0vwvy7V3XTnW2cfbDyNpTX7D7BIv9wmbJB/ic=;
 b=HM81HsH5lgpt3LpSVS5gxBovebkKusKDKNyptHBr/upjOAEuf0ra0pkVtsTP2bpkxJEOzG
 uOQAfTwHEHjK4I46bGFkCk/7EPs1vJnSLw63NDYx3vSMqdAymDQuhwpk6yGk7dVROgQ17K
 6op3WYBAliFXCKXHPXjIud/l7dQNqFA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-bNFkPHqMPPOqofNNweWFsA-1; Wed, 20 Oct 2021 04:05:14 -0400
X-MC-Unique: bNFkPHqMPPOqofNNweWFsA-1
Received: by mail-wm1-f71.google.com with SMTP id
 c5-20020a05600c0ac500b0030dba7cafc9so3754782wmr.5
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 01:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hwWPIg0vwvy7V3XTnW2cfbDyNpTX7D7BIv9wmbJB/ic=;
 b=3zkoQjLJDvtbE7L1iZj4iaj3ugrc+tEJdnnJ3AdFyCwTeWykjVRwVGpsHq+O+n9Iu8
 VCKEiurQ7mRHxmGarARNNjFiJHG2cDfboS+HtmxtzQqLu4Xejnf0i7K8rq3Xh3gPKGNt
 L7B+9Jf06v0THNDd+8pXG92FpR2uux/sLn80jluI6RSOSz5Dwk+DMy/ADiFqEIIdCiW1
 QBpIYsqDBg2sji3mZi7+CSogld8fzUPq8d8d/bLB20DR8Wkm40DVhcYG2eMtAzVWS6SQ
 5sUDqBry6T5UgzYabWaHnNKc0naCGY2laeAaeeGD6I6wWTXdLNlMmPsAh1rymf0kLtFF
 XJtw==
X-Gm-Message-State: AOAM53168yAUAedVTGiPUfVVcREmwoHWaF5+76dHy1USr+c2FVVohtBg
 Qxg/NqJmxyDKEIYv0328dmm6j8k/S3J7ev5lng+ApEroQNCjekP0Bxeke41A8rhM9yc3Rn3T0LA
 GNyPYlXTovYX3Meg=
X-Received: by 2002:a5d:60cf:: with SMTP id x15mr1744227wrt.363.1634717113380; 
 Wed, 20 Oct 2021 01:05:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgE+UeKc6lNwa0jiNee1p/XeaUWZa198hjjkHvnBBOhQLLZzYfUmxWOnq0KJj9YZ0f29wmzg==
X-Received: by 2002:a5d:60cf:: with SMTP id x15mr1744207wrt.363.1634717113247; 
 Wed, 20 Oct 2021 01:05:13 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id o10sm1408905wmq.46.2021.10.20.01.05.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 01:05:12 -0700 (PDT)
Subject: Re: [PATCH v8 7/8] hw/arm/virt-acpi-build: Generate PPTT table
To: Yanan Wang <wangyanan55@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20211014132206.19220-1-wangyanan55@huawei.com>
 <20211014132206.19220-8-wangyanan55@huawei.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <66786f13-6603-1cdd-7ce7-b1c77f617ac8@redhat.com>
Date: Wed, 20 Oct 2021 10:05:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211014132206.19220-8-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.074, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 wanghaibin.wang@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On 10/14/21 3:22 PM, Yanan Wang wrote:
> Generate PPTT table for Arm virt machines.
Generate the Processor Properties Topology Table (PPTT) for ARM virt
machines supporting it (>= 6.2)
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 6cec97352b..658a0a5d39 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -875,13 +875,19 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      dsdt = tables_blob->len;
>      build_dsdt(tables_blob, tables->linker, vms);
>  
> -    /* FADT MADT GTDT MCFG SPCR pointed to by RSDT */
> +    /* FADT MADT PPTT GTDT MCFG SPCR pointed to by RSDT */
>      acpi_add_table(table_offsets, tables_blob);
>      build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
>  
>      acpi_add_table(table_offsets, tables_blob);
>      build_madt(tables_blob, tables->linker, vms);
>  
> +    if (!vmc->no_cpu_topology) {
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_pptt(tables_blob, tables->linker, ms,
> +                   vms->oem_id, vms->oem_table_id);
> +    }
> +
>      acpi_add_table(table_offsets, tables_blob);
>      build_gtdt(tables_blob, tables->linker, vms);
>  
> 

Besides
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric


