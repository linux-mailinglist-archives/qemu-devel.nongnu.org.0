Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC1C4481D7
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 15:34:42 +0100 (CET)
Received: from localhost ([::1]:54254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk5jM-0007Fx-GK
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 09:34:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mk5f7-0002NF-Md
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 09:30:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mk5f3-0005ki-GO
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 09:30:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636381811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O7obqSqtG+4nZkznQ2+J5RnBIezVqiyp0oRu4Daq504=;
 b=CQAb0RmpiNCWJgxhCr8fc8Uo/LTpx3Ea8+m0ft1kfkGFBJpZY/uCW8QDID7EDxWXZJR/nr
 JiVIuxF8dR/EaSBi+7LUkmrUEvsV7fUgEtzH+y+XmUI1P1tptHVN7qOHIjQ0Ogs+lg7oNJ
 dyxspvtZaSu7aTbc5h+v0GB0d3FCUbw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-isoJBu4ZP-yINsKp5FUpJg-1; Mon, 08 Nov 2021 09:30:10 -0500
X-MC-Unique: isoJBu4ZP-yINsKp5FUpJg-1
Received: by mail-wm1-f71.google.com with SMTP id
 m18-20020a05600c3b1200b0033283ea5facso3594736wms.1
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 06:30:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=O7obqSqtG+4nZkznQ2+J5RnBIezVqiyp0oRu4Daq504=;
 b=D2gF3SxLbrpopLqffAvrMFF9c2e0CZQAnrVp/zI36Fh6OUTlT6xMzLGZs8Pvcb8kwz
 o+4hvu9BQ7iMEl45VvhfOlO8ZFejpWaE6vlRZkVaZVraXjd6y6Y9zAaQcw6vEAqRxE2h
 q7h2KazF2OvGZpSSAH+cP3wdFSqVieI0XgDjVxlrbxVNJ5l4LYtmDYUcAVfUB4XFG7GC
 uL9b/XKpyvEN+Hfl+j4hG3ziIlLaAF2J+BWcmdxdUdyQkP8yH6kjpRrj8BmgHr4m45Nu
 exbONK2+XZv1gVuX9B21sq3/5R+7N4AiMZdb/bY57QLtph/UZ5Ujqno8UdM85rZcCgY2
 Rf4Q==
X-Gm-Message-State: AOAM531deKrobLDYtjzNpebTW9vsc3+6dJlugZirQf6tdgH2W4rjZBya
 F7+YSWYTisUbXutoAoV0rUHNK57RXIwIPJ9y6xa6+wB2oYUM0gyluqTHQof/80l39YnSS3ElGKW
 y+C+7bQZI7WKTEu8=
X-Received: by 2002:a5d:68cb:: with SMTP id p11mr231256wrw.262.1636381809406; 
 Mon, 08 Nov 2021 06:30:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTI6seka0Rvi/OMIubixF8QblHYkviENk/lTBRzhSu71CVbAmnMaTkC1WR5DitKyk+cSIT7A==
X-Received: by 2002:a5d:68cb:: with SMTP id p11mr231220wrw.262.1636381809152; 
 Mon, 08 Nov 2021 06:30:09 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c79sm16890978wme.43.2021.11.08.06.30.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 06:30:08 -0800 (PST)
Message-ID: <b0787bca-8321-059e-d360-1e0a0af31228@redhat.com>
Date: Mon, 8 Nov 2021 15:30:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] hw/acpi: Set memory regions to native endian as a work
 around
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <20211108130934.59B48748F52@zero.eik.bme.hu>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211108130934.59B48748F52@zero.eik.bme.hu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.06, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 14:05, BALATON Zoltan wrote:
> When using ACPI on big endian machine (such as ppc/pegasos2 which has
> a VT8231 south bridge with ACPI) writes to ACPI registers come out
> byte swapped. This may be caused by a bug in memory subsystem but
> until that is fixed setting the ACPI memory regions to native endian
> makes it usable for big endian machines. This fixes ACPI shutdown with
> pegasos2 when using the board firmware for now.
> This could be reverted when the memory layer is fixed.

What is the path to the swapped writes?  Even just a backtrace might be 
enough to understand what's going on, and especially where the bug is.

Paolo

> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/acpi/core.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/acpi/core.c b/hw/acpi/core.c
> index 1e004d0078..543e4a7875 100644
> --- a/hw/acpi/core.c
> +++ b/hw/acpi/core.c
> @@ -461,7 +461,7 @@ static const MemoryRegionOps acpi_pm_evt_ops = {
>       .impl.min_access_size = 2,
>       .valid.min_access_size = 1,
>       .valid.max_access_size = 2,
> -    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
>   };
>   
>   void acpi_pm1_evt_init(ACPIREGS *ar, acpi_update_sci_fn update_sci,
> @@ -531,7 +531,7 @@ static const MemoryRegionOps acpi_pm_tmr_ops = {
>       .impl.min_access_size = 4,
>       .valid.min_access_size = 1,
>       .valid.max_access_size = 4,
> -    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
>   };
>   
>   void acpi_pm_tmr_init(ACPIREGS *ar, acpi_update_sci_fn update_sci,
> @@ -608,7 +608,7 @@ static const MemoryRegionOps acpi_pm_cnt_ops = {
>       .impl.min_access_size = 2,
>       .valid.min_access_size = 1,
>       .valid.max_access_size = 2,
> -    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
>   };
>   
>   void acpi_pm1_cnt_init(ACPIREGS *ar, MemoryRegion *parent,
> 


