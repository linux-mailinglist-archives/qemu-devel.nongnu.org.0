Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5A43765B5
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 15:03:16 +0200 (CEST)
Received: from localhost ([::1]:51154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf08R-0005Iq-9e
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 09:03:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lezrO-0007PD-Ti
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:45:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lezrE-000238-Vj
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:45:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620391527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y1ndFbfVUNPwJGn8/puFKFnmEy9J3vuq+fhsdsVlGeM=;
 b=Y4ZErPDv9/t/oBv/mxpZF6+f4Bz9g9YeoVMILMQbnEXxPHLs4lCf0KOCfp03JYnVeAZqml
 P5MWCJMv5056xfZWGLnRnigMvkeTEb0SrpqOmWd1zEbbd+IJqFmnMq6ZwgiZKuVkOAh5Cd
 55jEmIvOd7LTkVY0YpunB5c3YmO5XjY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-o4TrLmuXO96uxws5k3a0og-1; Fri, 07 May 2021 08:45:24 -0400
X-MC-Unique: o4TrLmuXO96uxws5k3a0og-1
Received: by mail-wr1-f69.google.com with SMTP id
 93-20020adf80e60000b0290106fab45006so3548948wrl.20
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 05:45:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y1ndFbfVUNPwJGn8/puFKFnmEy9J3vuq+fhsdsVlGeM=;
 b=oj8qCU+CexleOhA6VW7ivail1G1McsfuV3HY2Hjma+nv0sZG2ZuhHHT4flZIyLJ1NP
 Ky6qH6a47EfSJWDHyt85uD5Hz2HiHJa511xMDW0TwFadYYKuKgkmPe4tlQUoa3YuGTzw
 +Bh/afKBz3pWj9IYGBYWYoTW+0qIbPm9rItQmKXLOra0D2apkzCwwOGZ/Uxxy4S6q3wh
 XRymvE1teT2om8tcCfLFWioXBPOFACSzSd382DImmr5SNwirBIBNCzArz+sfQjGD15Gb
 lo/Lc2UFHp+9WmEDA/MxNnPjnBhO4UH0TekzN0GL3/SZvWfbk9hPaY9Q162yYurMzUh4
 HChA==
X-Gm-Message-State: AOAM531vFgcjyezs74x6qrv1GWoglB3tLaBN1g2tKuHFraG8NTNrH2U1
 gAFkeQ6O68iQRYzmhXS1GvrlrAVgT5NlCaDpYib+4Jg0qiHbecPZlvQQ8y+udDN2T1tZe+e5B9i
 05QsSnbg16OMAhrc=
X-Received: by 2002:a1c:29c3:: with SMTP id p186mr6339284wmp.150.1620391522848; 
 Fri, 07 May 2021 05:45:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwj9Hg1zcxD2iifFyO/OOjzTzKeE1pYrmisXjryROGOD5BR6lzBTBe1Uhk1mbZMmbmv2L64Dg==
X-Received: by 2002:a1c:29c3:: with SMTP id p186mr6339267wmp.150.1620391522605; 
 Fri, 07 May 2021 05:45:22 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q19sm13002657wmc.44.2021.05.07.05.45.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 05:45:22 -0700 (PDT)
Subject: Re: [RESEND PATCH 01/32] memory: Add RAM_PROTECTED flag to skip IOMMU
 mappings
To: Yang Zhong <yang.zhong@intel.com>
References: <20210430062455.8117-1-yang.zhong@intel.com>
 <20210430062455.8117-2-yang.zhong@intel.com>
 <b216c2e4-abcb-d7bd-b461-96b731472b4d@redhat.com>
 <20210507052443.GA23130@yangzhon-Virtual>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <14990ed0-6e94-1c80-d8e0-d863b05d3d6d@redhat.com>
Date: Fri, 7 May 2021 14:45:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210507052443.GA23130@yangzhon-Virtual>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: seanjc@google.com, kai.huang@intel.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/05/21 07:24, Yang Zhong wrote:
>    Paolo, i will revert this patch, but in order to disable sgx epc memory region
>    as DMA target, we still need to skip this memory region while adding this memory
>    region.
> 
>    So, my plan is to revert this patch, and then add one new bool variable in the
>    struct MemoryRegion.
> 
>    The new patch as below and it will be as patch 2 in the next version
> 
>    diff --git a/backends/hostmem-epc.c b/backends/hostmem-epc.c
>    index 0c98812f0d..316e1ee688 100644
>    --- a/backends/hostmem-epc.c
>    +++ b/backends/hostmem-epc.c
>    @@ -67,6 +67,7 @@ void sgx_memory_backend_reset(HostMemoryBackend *backend, int fd,
>         }
> 
>         sgx_epc_backend_memory_alloc(backend, errp);
>    +    mr->sgx_epc_device = true;
>    }
> 
>    static void sgx_epc_backend_instance_init(Object *obj)
>    diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>    index 5bc5d29358..7a53855436 100644
>    --- a/hw/vfio/common.c
>    +++ b/hw/vfio/common.c
>    @@ -538,7 +538,7 @@ static bool vfio_listener_skipped_section(MemoryRegionSection *section)
>     {
>         return (!memory_region_is_ram(section->mr) &&
>                 !memory_region_is_iommu(section->mr)) ||
>    +            section->mr->sgx_epc_device ||
>                 /*
>                  * Sizing an enabled 64-bit BAR can cause spurious mappings to
>                  * addresses in the upper part of the 64-bit address space.  These
>     diff --git a/include/exec/memory.h b/include/exec/memory.h
>     index 2816e52be3..9bba0a1590 100644
>     --- a/include/exec/memory.h
>     +++ b/include/exec/memory.h
>     @@ -463,6 +463,7 @@ struct MemoryRegion {
>          bool readonly; /* For RAM regions */
>          bool nonvolatile;
>          bool rom_device;
>     +    bool sgx_epc_device;
>          bool flush_coalesced_mmio;
>          uint8_t dirty_log_mask;
>          bool is_iommu;
>     
>    If this patch is not suitable to skip this memory region, any suggestion is
>    appreciated, thanks!

No, you can keep RAM_PROTECTED.  I was just remarking on the new bool 
argument, and suggesting passing the flags (RAM_SHARED and 
RAM_PROTECTED) directly  tot he memory_region_init* functions.

Paolo


