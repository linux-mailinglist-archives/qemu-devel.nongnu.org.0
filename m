Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CA12B5019
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 19:46:35 +0100 (CET)
Received: from localhost ([::1]:47494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kejWM-0007Id-Jl
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 13:46:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kej8r-0000kn-NX
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:22:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kej8p-0003Fj-M9
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:22:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605550935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WTH8Zd5sAmskzAYo30mvhMBg66bSsnSUzhU1/p/F/PA=;
 b=NUnkwL8W5yihws1r2HLhtzhQGieR2jePsVDRAmAFTKQoi4M0ldKMPiR6yB323y8ZmsiXLI
 EgjLmSAKD3Eiru1mwM554MRp9y/tzsLXZHIKAKs1Q+btcd+tFBFt93BcfXG2tlYdZ2V9sg
 n8T7PZYdhPdaMU5yxXT9GoQrZWvm3m8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-Nx-Q4XOANayPo2b_UmaFGQ-1; Mon, 16 Nov 2020 13:22:11 -0500
X-MC-Unique: Nx-Q4XOANayPo2b_UmaFGQ-1
Received: by mail-wr1-f71.google.com with SMTP id x16so6757619wrn.9
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 10:22:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WTH8Zd5sAmskzAYo30mvhMBg66bSsnSUzhU1/p/F/PA=;
 b=KVZfc/5MGCX+dLcQilvIl675j9iXMalIJWGXcRhKP+bd/N/WACq4lnirfSdnxVf8LY
 DAv7XXdfpBB3B9uCUTUs4GdppW4d/41luCMnWwi4LBWR0gOzoyG962C6DbXAWIBywZKW
 XqKTjl1mc+tpH6eM/R5zOdaqAp0qlqE5Zci68pUMKWL1fOkHE3s274Sk25GfYGaGFWQb
 U3LljJyO9scMSTDLpsCJnd5zZd3S0wlxhu7tAH8ey1d71cNy4eSH7dnB14W9XvAKQs+B
 bUZqTkqOR3qGQxf9toaFybh3HbPIQVa3G7yFoZwoSGtg5kELJwucIHmQivSFJJ32TieE
 Duqg==
X-Gm-Message-State: AOAM530WrcsNq/GzTFhoFdFagLc4vurDelReVtCfSYpxVgwxGKju9G6Q
 zdV+OmXv8L9YWc/ryBJSEPZ6kyUxz+JgB/WABb/CyTNAIo0pGAES7OVzEW6GiuiTxSgm7IC/NuH
 A5tCiCZOTkyCQC3A=
X-Received: by 2002:a5d:5222:: with SMTP id i2mr21960365wra.247.1605550929808; 
 Mon, 16 Nov 2020 10:22:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzygKN/jKZPOR2Tp8R1RkidCe1Eg2IUxg/VtBLvORkfaFPUmdDs+xVTr36C8G5FbkcJI0uy0Q==
X-Received: by 2002:a5d:5222:: with SMTP id i2mr21960352wra.247.1605550929645; 
 Mon, 16 Nov 2020 10:22:09 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p10sm24465695wre.2.2020.11.16.10.22.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 10:22:08 -0800 (PST)
Subject: Re: [PATCH] memory: Skip dirty tracking for un-migratable memory
 regions
To: Zenghui Yu <yuzenghui@huawei.com>, qemu-devel@nongnu.org
References: <20201116132210.1730-1-yuzenghui@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5f5cc5a8-c5e4-4a69-5fdd-7020459d9d17@redhat.com>
Date: Mon, 16 Nov 2020 19:22:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116132210.1730-1-yuzenghui@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: cohuck@redhat.com, kwankhede@nvidia.com, alex.williamson@redhat.com,
 qemu-arm@nongnu.org, wanghaibin.wang@huawei.com, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/11/20 14:22, Zenghui Yu wrote:
> It makes no sense to track dirty pages for those un-migratable memory
> regions (e.g., Memory BAR region of the VFIO PCI device) and doing so
> will potentially lead to some unpleasant issues during migration [1].
> 
> Skip dirty tracking for those regions by evaluating if the region is
> migratable before setting dirty_log_mask (DIRTY_MEMORY_MIGRATION).
> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg03757.html
> 
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> ---
>   softmmu/memory.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 71951fe4dc..aa393f1bb0 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1806,7 +1806,10 @@ bool memory_region_is_ram_device(MemoryRegion *mr)
>   uint8_t memory_region_get_dirty_log_mask(MemoryRegion *mr)
>   {
>       uint8_t mask = mr->dirty_log_mask;
> -    if (global_dirty_log && (mr->ram_block || memory_region_is_iommu(mr))) {
> +    RAMBlock *rb = mr->ram_block;
> +
> +    if (global_dirty_log && ((rb && qemu_ram_is_migratable(rb)) ||
> +                             memory_region_is_iommu(mr))) {
>           mask |= (1 << DIRTY_MEMORY_MIGRATION);
>       }
>       return mask;
> 

Queued, thanks.

Paolo


