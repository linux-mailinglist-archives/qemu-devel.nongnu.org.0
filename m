Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFABB414F69
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 19:51:14 +0200 (CEST)
Received: from localhost ([::1]:55690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT6Oo-0005pu-0t
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 13:51:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mT6N5-0004jP-K3
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 13:49:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mT6N2-0006Y4-7H
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 13:49:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632332963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8R2eWgo3mCPiEWKHImVoU3s0Qt0O78iy+gHqpXKDMHg=;
 b=Ag07l4jLOAcBPXgy08f5PMjSH8BISpFcZxHWZ3NGnZCCw7EE04gLvZDd+bE4A/TshlKUM5
 Y6Z3qfmDFq7fmG6SXXJthZfZldme8mgOvhqpi/w/LyrcsIdAnS4XuiDMVtKiCYaiwv7yB5
 0Yum6r0WiiSNefvjClMXaBHTJ4Ou5Ec=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-OnR8R5W_Plulwg3c1sqa7w-1; Wed, 22 Sep 2021 13:49:22 -0400
X-MC-Unique: OnR8R5W_Plulwg3c1sqa7w-1
Received: by mail-wr1-f72.google.com with SMTP id
 c15-20020a5d4ccf000000b0015dff622f39so2829538wrt.21
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 10:49:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=8R2eWgo3mCPiEWKHImVoU3s0Qt0O78iy+gHqpXKDMHg=;
 b=BuQO0wJGBRy0wMxlixPhW6luDOpH0SLZSGIQvzgiqeXSYy05QLzhJta/5w+awnBqO+
 kgyc4DJO4hw4DUwJlKHzcgMMHiOIbfZ2sqSazV1V+xI+eCcaptFCW9L3+qc0HWe6jwv+
 wE4wSFBVAuMfTH8oeSS+mZqDIauy6K08PMkroEOYumg+UR8pCMJGl9ZEvhT4KHXa7kM6
 RFq9LzeBpOAJvGmqejOJqrgOGs3RiDmbD38H20/MEMzoALdo85VzseEf6eN0ng+UT/ND
 zeVK9P62ouPUvdMNFkB04BHFtI54moaDM1iqjc0NSvo/+vR5TFxbH25OIZQYS3WMAYPQ
 RLmw==
X-Gm-Message-State: AOAM530yfN2NUaMZZk/vaNHn3/MC4igsT0tweU0taVeehyh6mDZM4sFA
 gbUfL7bV+Y3TmZSiS6cWeGwkpRMSM0FRcHDYpFOBxeXfHUUjHdHSl5dQIXK6bMMSo3D9bgi3FBS
 +DzyynWnG7Dv8ijs=
X-Received: by 2002:a05:6000:1844:: with SMTP id
 c4mr187152wri.355.1632332961339; 
 Wed, 22 Sep 2021 10:49:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDZycGgzlG5PLVo/6Isj0bTJcO/O5J4WdjAYiBchkHxW5ecBClNDAyi9t+1qZPrUoaXfO12g==
X-Received: by 2002:a05:6000:1844:: with SMTP id
 c4mr187105wri.355.1632332961083; 
 Wed, 22 Sep 2021 10:49:21 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64dd.dip0.t-ipconnect.de. [91.12.100.221])
 by smtp.gmail.com with ESMTPSA id m4sm3482985wrx.81.2021.09.22.10.49.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 10:49:20 -0700 (PDT)
Subject: Re: [RFC PATCH v2 11/16] softmmu/memory: add
 memory_region_try_add_subregion function
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <20210922161405.140018-12-damien.hedde@greensocs.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <8ff0d8c9-94f1-cc21-a9f9-bb5fcd1cc3e7@redhat.com>
Date: Wed, 22 Sep 2021 19:49:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210922161405.140018-12-damien.hedde@greensocs.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 mirela.grujic@greensocs.com, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Markus Armbruster <armbru@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 mark.burton@greensocs.com, edgari@xilinx.com,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.09.21 18:14, Damien Hedde wrote:
> It allows to try to add a subregion to a memory region with error
> handling. Like memory_region_add_subregion_overlap, it handles
> priority as well.
> Apart the error handling, the behavior is the same. It can be used
> to do the simple memory_region_add_subregion() (with no overlap) by
> setting the priority parameter to 0.
> 
> This commit is a preparation to further use this function in the
> context of qmp command which needs error handling support.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
> 
> Adding a new function is obviously not ideal. But there is ~900
> occurrences of memory_region_add_subregion[_overlap] calls in the code
> base. We do not really see an alternative here.
> ---
>   include/exec/memory.h | 22 ++++++++++++++++++++++
>   softmmu/memory.c      | 22 ++++++++++++++--------
>   2 files changed, 36 insertions(+), 8 deletions(-)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index c3d417d317..422e1eda67 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -2162,6 +2162,28 @@ void memory_region_add_subregion_overlap(MemoryRegion *mr,
>                                            MemoryRegion *subregion,
>                                            int priority);
>   
> +/**
> + * memory_region_try_add_subregion: Add a subregion to a container
> + *                                  with error handling.
> + *
> + * Behaves like memory_region_add_subregion_overlap(), but errors are
> + * reported if the subregion cannot be added.
> + *
> + * @mr: the region to contain the new subregion; must be a container
> + *      initialized with memory_region_init().
> + * @offset: the offset relative to @mr where @subregion is added.
> + * @subregion: the subregion to be added.
> + * @priority: used for resolving overlaps; highest priority wins.
> + * @errp: pointer to Error*, to store an error if it happens.
> + *
> + * Returns: True in case of success, false otherwise.
> + */
> +bool memory_region_try_add_subregion(MemoryRegion *mr,
> +                                     hwaddr offset,
> +                                     MemoryRegion *subregion,
> +                                     int priority,
> +                                     Error **errp);
> +
>   /**
>    * memory_region_get_ram_addr: Get the ram address associated with a memory
>    *                             region
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index bfedaf9c4d..eac61f8236 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -2513,22 +2513,28 @@ done:
>       memory_region_transaction_commit();
>   }
>   
> -static void memory_region_add_subregion_common(MemoryRegion *mr,
> -                                               hwaddr offset,
> -                                               MemoryRegion *subregion)
> +bool memory_region_try_add_subregion(MemoryRegion *mr,
> +                                     hwaddr offset,
> +                                     MemoryRegion *subregion,
> +                                     int priority,
> +                                     Error **errp)
>   {
> -    assert(!subregion->container);
> +    if (subregion->container) {
> +        error_setg(errp, "The memory region is already in another region");
> +        return false;
> +    }
> +    subregion->priority = priority;
>       subregion->container = mr;
>       subregion->addr = offset;
>       memory_region_update_container_subregions(subregion);
> +    return true;
>   }
>   
>   void memory_region_add_subregion(MemoryRegion *mr,
>                                    hwaddr offset,
>                                    MemoryRegion *subregion)
>   {
> -    subregion->priority = 0;
> -    memory_region_add_subregion_common(mr, offset, subregion);
> +    memory_region_try_add_subregion(mr, offset, subregion, 0, &error_abort);
>   }
>   
>   void memory_region_add_subregion_overlap(MemoryRegion *mr,
> @@ -2536,8 +2542,8 @@ void memory_region_add_subregion_overlap(MemoryRegion *mr,
>                                            MemoryRegion *subregion,
>                                            int priority)
>   {
> -    subregion->priority = priority;
> -    memory_region_add_subregion_common(mr, offset, subregion);
> +    memory_region_try_add_subregion(mr, offset, subregion, priority,
> +                                    &error_abort);
>   }
>   
>   void memory_region_del_subregion(MemoryRegion *mr,
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


