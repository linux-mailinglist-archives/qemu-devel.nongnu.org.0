Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE7143B7D5
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 19:03:52 +0200 (CEST)
Received: from localhost ([::1]:58218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfPra-0001sU-U5
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 13:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfPoo-0008GD-44
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 13:00:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfPom-0003JE-8n
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 13:00:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635267654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FjIWdpmqhHEfmE4RsEMKe1oOAeYq8uJidunwW8zbheY=;
 b=dcmVVz10VFMJt9SvUx4M+3Tf1we0qPP34u9KxsiQp5rQ4StW5mJyxswuWq1VYnAjxIz4D8
 WdvqDujfUSwPeS0TPUuDjNMLVXuy5GUeLN6uy0Ozch0WTpAwj9jkJ996z53QQcwNtgegRT
 SPDF34dBA8QsdUl5IFFmbTz0JoeQIvI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-7ni8cFmVOaaV552darbO_g-1; Tue, 26 Oct 2021 13:00:53 -0400
X-MC-Unique: 7ni8cFmVOaaV552darbO_g-1
Received: by mail-wr1-f72.google.com with SMTP id
 y9-20020a5d6209000000b001684625427eso3017093wru.7
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 10:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FjIWdpmqhHEfmE4RsEMKe1oOAeYq8uJidunwW8zbheY=;
 b=md6cyx3Bk3za/uObxgWcr8f7dKnmWDP6v72dxU3A2gcJmvoCM7dPTZ/B7PbdblBu7/
 zhqq2ioJI3ujN2sXJ3wlZVogRWQgPAy5EZ7ftznbeGJCY+J8GU6jJ1ZSofSwie3P2wzl
 0+N6E0oZSVXHWQPF7Jq+jhIhed3QEwRYgqWXRx+fHITJSKE4TimLcB+tLv5VBat+Whw1
 /RVANRi8qHWQpDvXEIfbv+NRv9ofW3ewFI5s+dv1wcl3nGT+D1WQesI0DW3vRmqdMXex
 98zx9oY4a3+n3SE9SNsKgtWCPPimCLqUibpJZHX0AX2p2/NVW3A5TKchaljTGeuj3USi
 h6QA==
X-Gm-Message-State: AOAM533I4VoNSHEahdd5eL2ufJ5EuJsByArsm10/nwuB8siFTOixmWux
 0z51a9GqOxshDcxr8DUyMRu3xP5uOGexIS25WX9BDeQbFvBg4JZ4sktPm/aD3fC2lTggVzTJXFZ
 wFvC7Fg8waWH9jOU=
X-Received: by 2002:a7b:ce8f:: with SMTP id q15mr4339855wmj.136.1635267652255; 
 Tue, 26 Oct 2021 10:00:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOjS50cb0rbleEPMzqZ3CveKponSba0mEULg/lX/g4w1rwmP9ha++ZBKKl8/filhNilvUzfg==
X-Received: by 2002:a7b:ce8f:: with SMTP id q15mr4339833wmj.136.1635267652094; 
 Tue, 26 Oct 2021 10:00:52 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id k15sm4099846wrx.13.2021.10.26.10.00.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 10:00:51 -0700 (PDT)
Message-ID: <c2ab26d6-b7bd-a92b-cae8-1a66992dd94f@redhat.com>
Date: Tue, 26 Oct 2021 19:00:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 2/3] memory: Make memory_region_is_mapped() succeed
 when mapped via an alias
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20211026160649.47545-1-david@redhat.com>
 <20211026160649.47545-3-david@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211026160649.47545-3-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.215, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 18:06, David Hildenbrand wrote:
> memory_region_is_mapped() currently does not return "true" when a memory
> region is mapped via an alias.
> 
> Assuming we have:
>     alias (A0) -> alias (A1) -> region (R0)
> Mapping A0 would currently only make memory_region_is_mapped() succeed
> on A0, but not on A1 and R0.
> 
> Let's fix that by adding a "mapped_via_alias" counter to memory regions and
> updating it accordingly when an alias gets (un)mapped.
> 
> I am not aware of actual issues, this is rather a cleanup to make it
> consistent.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/exec/memory.h |  1 +
>  softmmu/memory.c      | 12 +++++++++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index a185b6dcb8..35382d9870 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -707,6 +707,7 @@ struct MemoryRegion {
>      const MemoryRegionOps *ops;
>      void *opaque;
>      MemoryRegion *container;
> +    int mapped_via_alias; /* Mapped via an alias, container might be NULL */
>      Int128 size;
>      hwaddr addr;
>      void (*destructor)(MemoryRegion *mr);
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index e5826faa0c..17ca896c38 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -2524,8 +2524,13 @@ static void memory_region_add_subregion_common(MemoryRegion *mr,
>                                                 hwaddr offset,
>                                                 MemoryRegion *subregion)
>  {
> +    MemoryRegion *alias;
> +
>      assert(!subregion->container);
>      subregion->container = mr;
> +    for (alias = subregion->alias; alias; alias = alias->alias) {
> +        alias->mapped_via_alias++;
> +    }
>      subregion->addr = offset;
>      memory_region_update_container_subregions(subregion);
>  }
> @@ -2550,9 +2555,14 @@ void memory_region_add_subregion_overlap(MemoryRegion *mr,
>  void memory_region_del_subregion(MemoryRegion *mr,
>                                   MemoryRegion *subregion)
>  {
> +    MemoryRegion *alias;
> +
>      memory_region_transaction_begin();
>      assert(subregion->container == mr);
>      subregion->container = NULL;
> +    for (alias = subregion->alias; alias; alias = alias->alias) {
> +        alias->mapped_via_alias--;

           assert(alias->mapped_via_alias >= 0);

> +    }
>      QTAILQ_REMOVE(&mr->subregions, subregion, subregions_link);
>      memory_region_unref(subregion);
>      memory_region_update_pending |= mr->enabled && subregion->enabled;
> @@ -2649,7 +2659,7 @@ static FlatRange *flatview_lookup(FlatView *view, AddrRange addr)
>  
>  bool memory_region_is_mapped(MemoryRegion *mr)
>  {
> -    return mr->container ? true : false;
> +    return !!mr->container || mr->mapped_via_alias;
>  }
>  
>  /* Same as memory_region_find, but it does not add a reference to the
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


