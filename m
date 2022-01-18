Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DF849292B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 16:01:30 +0100 (CET)
Received: from localhost ([::1]:35278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9pzF-0005G7-Ak
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 10:01:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n9otG-0003q2-Bs
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:51:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n9otD-00004q-Ht
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:51:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642513870;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wpyCOtx9cZBw2W9lEvvyvmRvXVUbY2PgYr7UeyQNzpU=;
 b=PH7LruYnbpr04NZXy+sP9isAV3IomL50Nio6wniI9b6HgSj9PP6Ed/eoQ9bCQQ192V596F
 YZqyQJUVI9z0j5lTlmaPe4nVHwyffYc9S/kHubo84XREGwatsKMwCBvr6BxpMNEgRIPrPD
 3ARoxsKu2N5MZ5+RDEZgClhNacomNCg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-zcFa7iIPPtWVhwzGz4dzYg-1; Tue, 18 Jan 2022 08:51:09 -0500
X-MC-Unique: zcFa7iIPPtWVhwzGz4dzYg-1
Received: by mail-wm1-f69.google.com with SMTP id
 l20-20020a05600c1d1400b0034c29cad547so1895536wms.2
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 05:51:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=wpyCOtx9cZBw2W9lEvvyvmRvXVUbY2PgYr7UeyQNzpU=;
 b=k+6AlRLTXHT6365ZoLBV/MFDnb1oCc3Sg2PxT52JfxbwDLF+cdAenrIRsso04ZGyoJ
 y1E/bmZCoXR86/eZibYQMPIAcRuQZrQtXy0OVboMkSGnLDgXS36HrUEH9VvisxpD6eHz
 +qPirLo2dpWHik6lB1gdeuui3NY8YHtLFBga54k9oCFUTX0trXcuZ1WwC8EBKBh7NFFF
 hH9+oScU/T/e+Vm7lnEFQ9E+mQBKfXiwLnii82q1rqfcw1wcMzyQy8d1lU93vd/F18Hg
 LG269+dnWtvo42u9G8+NISewv6iPLKVvc6X6MsGYXkXJb0ZeUoRgx3Cx9rGa6GQfh9Bl
 nOtw==
X-Gm-Message-State: AOAM533MtOsg2a2gsikaV0lPYHNaxmuRmIhE9COKEwsh+aOfhveJcPsh
 X6pYjSp76SdnMxd1pGzhmZiVxmepyNCkpBHeaD/EpJwgot04+xg/Cragl1vIpR/SiEh0q3l+rbN
 SXeywZZV2G+y89S4=
X-Received: by 2002:a5d:6811:: with SMTP id w17mr24307055wru.443.1642513867884; 
 Tue, 18 Jan 2022 05:51:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJww7Eh/gQpLsNa7olEtt9CE0FFbWLusG97SdWpRNeWF6JuwvRVy2BXBTMONwARUG2yJVu5AdQ==
X-Received: by 2002:a5d:6811:: with SMTP id w17mr24307033wru.443.1642513867609; 
 Tue, 18 Jan 2022 05:51:07 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id p4sm2596431wmq.40.2022.01.18.05.51.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 05:51:07 -0800 (PST)
Subject: Re: [PATCH v5 5/6] hw/arm/virt: Disable highmem devices that don't
 fit in the PA range
To: Marc Zyngier <maz@kernel.org>, qemu-devel@nongnu.org
References: <20220114140741.1358263-1-maz@kernel.org>
 <20220114140741.1358263-6-maz@kernel.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <10f21d1f-7f95-d9ba-0803-9d11d461829a@redhat.com>
Date: Tue, 18 Jan 2022 14:51:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220114140741.1358263-6-maz@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Reply-To: eric.auger@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Marc,

On 1/14/22 3:07 PM, Marc Zyngier wrote:
> In order to only keep the highmem devices that actually fit in
> the PA range, check their location against the range and update
> highest_gpa if they fit. If they don't, mark them as disabled.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/virt.c | 34 ++++++++++++++++++++++++++++------
>  1 file changed, 28 insertions(+), 6 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index a427676b50..053791cc44 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1712,21 +1712,43 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
>          base = vms->memmap[VIRT_MEM].base + LEGACY_RAMLIMIT_BYTES;
>      }
>  
> +    /* We know for sure that at least the memory fits in the PA space */
> +    vms->highest_gpa = memtop - 1;
> +
>      for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
>          hwaddr size = extended_memmap[i].size;
> +        bool fits;
>  
>          base = ROUND_UP(base, size);
>          vms->memmap[i].base = base;
>          vms->memmap[i].size = size;
> +
> +        /*
> +         * Check each device to see if they fit in the PA space,
> +         * moving highest_gpa as we go.
> +         *
> +         * For each device that doesn't fit, disable it.
> +         */
> +        fits = (base + size) <= BIT_ULL(pa_bits);
> +        if (fits) {
> +            vms->highest_gpa = base + size - 1;
> +        }
> +
> +        switch (i) {
> +        case VIRT_HIGH_GIC_REDIST2:
> +            vms->highmem_redists &= fits;
> +            break;
> +        case VIRT_HIGH_PCIE_ECAM:
> +            vms->highmem_ecam &= fits;
> +            break;
> +        case VIRT_HIGH_PCIE_MMIO:
> +            vms->highmem_mmio &= fits;
> +            break;
> +        }
> +
>          base += size;
>      }
>  
> -    /*
> -     * If base fits within pa_bits, all good. If it doesn't, limit it
> -     * to the end of RAM, which is guaranteed to fit within pa_bits.
> -     */
> -    vms->highest_gpa = (base <= BIT_ULL(pa_bits) ? base : memtop) - 1;
> -
>      if (device_memory_size > 0) {
>          ms->device_memory = g_malloc0(sizeof(*ms->device_memory));
>          ms->device_memory->base = device_memory_base;


