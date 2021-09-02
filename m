Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 310CA3FF0AD
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 18:02:54 +0200 (CEST)
Received: from localhost ([::1]:47432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLpAy-0000db-RT
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 12:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mLp0F-0004N5-S6
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 11:51:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mLp0D-00052A-Um
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 11:51:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630597905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zzmyjxl2fURor1msLQ2OsJ9gkwOPAMYczafXgfPcr+E=;
 b=Bm4+z7pjdMmjOi7JQMvMmi8jcUgqROhzXK7XRjd2jl7uVKbpeZFYs5I+jI715c4nDeHyUb
 Wz4aJkn/NFFWK2rSdFBnhAZyRZcw6V3i56jKiYLqgdvVYaxd4jQ6OhKwa8hNat/1xdpERJ
 /gfKNQ30+fs4E3ex4tAe8OI5BPrBB30=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-0qiD3VpbMRuiVaJjrh5gGA-1; Thu, 02 Sep 2021 11:51:42 -0400
X-MC-Unique: 0qiD3VpbMRuiVaJjrh5gGA-1
Received: by mail-wr1-f71.google.com with SMTP id
 h15-20020adff18f000000b001574654fbc2so698263wro.10
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 08:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zzmyjxl2fURor1msLQ2OsJ9gkwOPAMYczafXgfPcr+E=;
 b=TypN6rnaFiPcMuaOPkL+2NUHUGshHLVjnIhnL5wWgK80nO7HWPCiEtykzg9i6dxsFj
 JrJN3bonkEGQb6mqeqvMpl7RADk0o/kt+9cIWTL0FVyDkEF5dwtM3qW6Vgia4gGXcSsX
 ympwEbKA5nIhzkSWJNdwcdKQWz+XIKoaFjc6smmNIaHNBbvB3/OGlGJDtDwB3TDtzlND
 YZszDLT9dGEJQWIAzTxw97PrEHQ2byrs2ygGzMzucgHIenrDfI8+WSQKdBPvGtKarMO7
 13Y+daQ4hNecP0rQj6jyX4ZdkH6dPrzGgKu1ceQEc711rjtHdJpVqQf4DGe7osmH2Q2V
 id3g==
X-Gm-Message-State: AOAM530GJqFMVZX9B+1W7f0E2hY10sZUqZ10zEoYw8QsfpzilJizP9Bv
 3tTQUmMBtVQ9ay+7GWjfQSTgX3x/TYL9CSx3n1jlebrT8H5LMD65KuHi2W2pG23o8OW7rleWZs7
 m8LbuIoZ6rIXxyOg=
X-Received: by 2002:adf:d4ce:: with SMTP id w14mr4583282wrk.407.1630597901076; 
 Thu, 02 Sep 2021 08:51:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJys8v7lD0Py6s4ACJkv9hd7Cc3yKJOOZMWpdj4Ko09f+7/HRKJyaNFlHTBgT8dsUyFs5seeyg==
X-Received: by 2002:adf:d4ce:: with SMTP id w14mr4583265wrk.407.1630597900913; 
 Thu, 02 Sep 2021 08:51:40 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id e2sm2068791wra.40.2021.09.02.08.51.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 08:51:40 -0700 (PDT)
Subject: Re: [PATCH v2 30/35] acpi: arm/virt: build_spcr: fix invalid cast
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210708154617.1538485-1-imammedo@redhat.com>
 <20210708154617.1538485-31-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <bc3aedd6-854a-41fc-1072-7c87dc0084f7@redhat.com>
Date: Thu, 2 Sep 2021 17:51:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210708154617.1538485-31-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.225, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org,
 mst@redhat.com, shannon.zhaosl@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/8/21 5:46 PM, Igor Mammedov wrote:
> implicit cast to structure uint8_t member didn't raise error when
> assigning value from incorrect enum, but when using build_append_gas()
> (next patch) it will error out with (clang):
>   implicit conversion from enumeration type 'AmlRegionSpace'
>   to different enumeration type 'AmlAddressSpace'
> fix cast error by using correct AML_AS_SYSTEM_MEMORY enum
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

> ---
> CC: drjones@redhat.com
> CC: peter.maydell@linaro.org
> CC: shannon.zhaosl@gmail.com
> CC: qemu-arm@nongnu.org
> ---
>  hw/arm/virt-acpi-build.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index b88ea4b70a..a07540affb 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -361,7 +361,7 @@ build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  
>      spcr->interface_type = 0x3;    /* ARM PL011 UART */
>  
> -    spcr->base_address.space_id = AML_SYSTEM_MEMORY;
> +    spcr->base_address.space_id = AML_AS_SYSTEM_MEMORY;
>      spcr->base_address.bit_width = 8;
>      spcr->base_address.bit_offset = 0;
>      spcr->base_address.access_width = 1;
> 


