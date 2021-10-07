Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2EA424E0C
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 09:23:23 +0200 (CEST)
Received: from localhost ([::1]:33734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYNkP-0003o6-Om
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 03:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mYNaD-0001MN-Od
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 03:12:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mYNaB-0002Iz-WB
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 03:12:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633590767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nIYg9Hf7gWgxHqxaeuqdywWFpfqJG4aemKy5Bbp+HOs=;
 b=Hk5wmv06d47BHK092G5BW3aPG9qbl5dGB4X8/CVcIkIP3JnNzA7AAqqDj8U1yoAGNKMrjm
 bCtcjsI0rN0ubQSi+624w1Hsu8AIvLmhPyQNCU6KBkKRsZQQmvR21Bx5BOREMu5eaVad7r
 ODze+cm4gHE5Fco3H+Ep6ir7vR5R5S8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-FQu1fhlJMfut357zSA7hJA-1; Thu, 07 Oct 2021 03:12:44 -0400
X-MC-Unique: FQu1fhlJMfut357zSA7hJA-1
Received: by mail-ed1-f72.google.com with SMTP id
 2-20020a508e02000000b003d871759f5dso4991305edw.10
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 00:12:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nIYg9Hf7gWgxHqxaeuqdywWFpfqJG4aemKy5Bbp+HOs=;
 b=2TyY50mpGYzojBALeReZ8O+4NDJj+mfZQZP6GNTSoGEkT6MusI1sfr8NPlGR5Kso4V
 E3Ahzrxor40QgnaePO/Gk7IR2dwpQ4/axmVZTXiRQ+8LriJUtzY6hW4k/JRaq6KT9NoT
 BP5FFRP0+gQJXq1OgOwbIUO5T/JnJobSiMbiOgjDk95wZJdUn6GGoHFcmiyWhZeGL+Be
 gyA6/a+t5oxu8bZeye8IINEUHcg79/OIPncepJb44gjU12lwIGF2ZWhEHtjvcvRbxmRg
 UjXK2wsII51Wc4y6x1lvoPsw6v0MwWNENm465b1KimfwKR98gS6k+7ghEF0eHbrTTvGp
 5iKg==
X-Gm-Message-State: AOAM532Yy9arqPhJFytsosJaFuu1gsgseRkAgNUIXXEFuAHI8hV2fIdI
 eoZfFyWDbqi7ZbUKTo/ieBbf1LkrlrOFbmfOmZA4Uf58FRzSQcwv/MGHcZP0CUWahWo4UTKol/Q
 y3LLcogQOXIFWC5o=
X-Received: by 2002:a50:d9c9:: with SMTP id x9mr4019839edj.179.1633590763202; 
 Thu, 07 Oct 2021 00:12:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCbLQ19bweW3Pxs0iNTYsrk2NvktPW6/yHrxFdDnmYJUMADgb170bz2YGW6IDkYRpROglSzw==
X-Received: by 2002:a50:d9c9:: with SMTP id x9mr4019805edj.179.1633590762982; 
 Thu, 07 Oct 2021 00:12:42 -0700 (PDT)
Received: from gator.home (cst2-174-28.cust.vodafone.cz. [31.30.174.28])
 by smtp.gmail.com with ESMTPSA id g23sm10963000edt.1.2021.10.07.00.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 00:12:42 -0700 (PDT)
Date: Thu, 7 Oct 2021 09:12:40 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v7 7/8] hw/arm/virt-acpi-build: Generate PPTT table
Message-ID: <20211007071240.oguohccws63w6ljs@gator.home>
References: <20211007030746.10420-1-wangyanan55@huawei.com>
 <20211007030746.10420-8-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20211007030746.10420-8-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, wanghaibin.wang@huawei.com,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 07, 2021 at 11:07:45AM +0800, Yanan Wang wrote:
> Generate PPTT table for Arm virt machines.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
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
> -- 
> 2.19.1
>

Reviewed-by: Andrew Jones <drjones@redhat.com>


