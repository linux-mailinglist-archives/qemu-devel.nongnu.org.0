Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CDE57DA9E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 09:08:15 +0200 (CEST)
Received: from localhost ([::1]:33538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEmli-0005qW-CI
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 03:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oEmOB-0005xc-S6
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 02:43:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oEmO7-00027k-PU
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 02:43:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658472230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q1wrd1nkWEjo/BtESRWpju7ItVCEb3ncLQluX9Kthkg=;
 b=Queyof5CfNlLz4jnot3hWBbCP4wOdc7YG2OfO3/HPwrm8J+cT/rUahpdN+FgBE8AGugv5K
 w23s6vtxrMmHz7uTTU4BguYejjfG0+oqhTQW6nIHaP1RvA0tpx0VgTcok1pbHqqGI9YGVs
 F66cKa7Cy/7XPLABnJCYZXlgnqOmkCM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-SLb8piqdP-OTNBn96-Djkg-1; Fri, 22 Jul 2022 02:43:43 -0400
X-MC-Unique: SLb8piqdP-OTNBn96-Djkg-1
Received: by mail-wm1-f70.google.com with SMTP id
 h189-20020a1c21c6000000b003a2fdf9bd2aso2057106wmh.8
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 23:43:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Q1wrd1nkWEjo/BtESRWpju7ItVCEb3ncLQluX9Kthkg=;
 b=ba8Nc+p42LToBpt6hcbK1C7rXeBKeaGyUgSq4Km2yE8zRolZrSnY+yN5WlQ6G8KC1L
 jR7j/zpvWprpV1nJw+j6so1y7pimouGchB0sLB7uLnnxOYhrQUujQbzaiWnmHqttovsj
 BuzsYElMSs0pc6bwb/2LBD971r8CaL/MjLf2VBJUkSHhEGUuY7eMF9xK7UaK9/hxaGpM
 XDStUPrq+rmBTXtwzIjw7KOEh8PfZDsnChZlzIudAdGK81oy7lY1LbFICF3FvKsdHU1N
 FhfUrq72AHm7Us1AT9elXWYAI1Xoj3kMc29ctkJQdAUoLTYGzV4hG+EvPh5yihDT9PqR
 dnTQ==
X-Gm-Message-State: AJIora9BJJnk4dwqtJVWljQd3RgT/NGAC9iWPZLg9xsc+8gibvYi6Mbq
 kaoK3SYfAULCzsm8AfS32xZW4A3zYSXdVb1nrRPWdHb0sEyE+ZO/7+ZTXzS5J8xy4re3JUY/7kD
 S5d5bYO2WEDY+l7E=
X-Received: by 2002:a5d:4fc6:0:b0:21e:4535:47ad with SMTP id
 h6-20020a5d4fc6000000b0021e453547admr1273450wrw.368.1658472222103; 
 Thu, 21 Jul 2022 23:43:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uh5E6nRRobvZJqpU2ig8hIhvNVKND5yOQgIbIrNu4XADqlS6y0Fq30vAQVsVW62a/9HOIePg==
X-Received: by 2002:a5d:4fc6:0:b0:21e:4535:47ad with SMTP id
 h6-20020a5d4fc6000000b0021e453547admr1273358wrw.368.1658472219852; 
 Thu, 21 Jul 2022 23:43:39 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:cb00:cd6b:7964:cc7d:b0e6?
 (p200300cbc707cb00cd6b7964cc7db0e6.dip0.t-ipconnect.de.
 [2003:cb:c707:cb00:cd6b:7964:cc7d:b0e6])
 by smtp.gmail.com with ESMTPSA id
 f5-20020adff445000000b0021e5f32ade7sm423104wrp.68.2022.07.21.23.43.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 23:43:39 -0700 (PDT)
Message-ID: <67dedbad-9d24-2c8d-f8a7-98e5387b89ae@redhat.com>
Date: Fri, 22 Jul 2022 08:43:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] memory: Fix wrong end address dump
Content-Language: en-US
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, peterx@redhat.com, f4bug@amsat.org
References: <20220622095912.3430583-1-zhenzhong.duan@intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220622095912.3430583-1-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.06.22 11:59, Zhenzhong Duan wrote:
> The end address of memory region section isn't correctly calculated
> which leads to overflowed mtree dump:
> 
>   Dispatch
>     Physical sections
>       ......
>       #70 @0000000000002000..0000000000011fff io [ROOT]
>       #71 @0000000000005000..0000000000005fff (noname)
>       #72 @0000000000005000..0000000000014fff io [ROOT]
>       #73 @0000000000005658..0000000000005658 vmport
>       #74 @0000000000005659..0000000000015658 io [ROOT]
>       #75 @0000000000006000..0000000000015fff io [ROOT]
> 
> After fix:
>       #70 @0000000000002000..0000000000004fff io [ROOT]
>       #71 @0000000000005000..0000000000005fff (noname)
>       #72 @0000000000005000..0000000000005657 io [ROOT]
>       #73 @0000000000005658..0000000000005658 vmport
>       #74 @0000000000005659..0000000000005fff io [ROOT]
>       #75 @0000000000006000..000000000000ffff io [ROOT]
> 
> Fixes: 5e8fd947e2670 ("memory: Rework "info mtree" to print flat views and dispatch trees")
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>  softmmu/physmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 214cb04c8fc3..cbabd10ac0bf 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -3701,7 +3701,7 @@ void mtree_print_dispatch(AddressSpaceDispatch *d, MemoryRegion *root)
>                      " %s%s%s%s%s",
>              i,
>              s->offset_within_address_space,
> -            s->offset_within_address_space + MR_SIZE(s->mr->size),
> +            s->offset_within_address_space + MR_SIZE(s->size),
>              s->mr->name ? s->mr->name : "(noname)",
>              i < ARRAY_SIZE(names) ? names[i] : "",
>              s->mr == root ? " [ROOT]" : "",

Reviewed-by: David Hildenbrand <david@redhat.com>

I assume this should get picked up soonish.

-- 
Thanks,

David / dhildenb


