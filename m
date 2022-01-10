Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0554489E26
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 18:14:36 +0100 (CET)
Received: from localhost ([::1]:49148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6yFf-0001dQ-EP
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 12:14:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n6yEA-0000Di-8e
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 12:13:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n6yE7-0000Fn-D7
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 12:13:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641834774;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=03p6qi4vSMUKe6Ewm0O52FmVWNcm73cafj58jFWwUb4=;
 b=O+P3yJczwHVf9wQbwXn13tZgUTLPVY3X50rNFTUYdgPtw8ETODth9UUx++pYUfd0yZ8u1/
 ptGzgSgFQJQ6pO6Aohc01bMXsTwkVNgMUjtwkoNmOpWL8/1nn8XI2OzmM4Yh7kO6M9leJl
 eH3V6xq/mGa/xMRn17bFp6milcjW2Wg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-rb_HgQWNMZGYkLfBYh3zCw-1; Mon, 10 Jan 2022 12:12:53 -0500
X-MC-Unique: rb_HgQWNMZGYkLfBYh3zCw-1
Received: by mail-wm1-f70.google.com with SMTP id
 20-20020a05600c22d400b00349067fe7b7so305225wmg.5
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 09:12:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=03p6qi4vSMUKe6Ewm0O52FmVWNcm73cafj58jFWwUb4=;
 b=pagibK5j9NzQgg9El0NZ0rL59ExcdnkSxH1lJl/JLnLKzcLh64rsTDwbDuz/1MmJcw
 vcVYebvHng1usO+y64qrWu1MutAEOtLLDX9fo61l8snm9KDNnbZ38746iv0QkAQP8Kp2
 ce9tp2gkSZIdYK43N4/+mwmejaWM+4T3s27PocrcsDZ/H/45BiVtaBKfLtYkyXryhiH0
 sF17Abe2TtP7f6JahZoQXyXvuu+0EezB7sB/pKJAcXHZV2zNBCt8kld9azN8p2GcOeq0
 XeunyTceE2ydTy3Qo0u/PQkqHAvSVNghh2tsFpiq8l+ld1fEFXFZ1tJq04BzOWPv55MX
 1E7A==
X-Gm-Message-State: AOAM533IECZjvHiyU/7pXsjLkmRv3WGe7Um46vs4MJVRKrtIOzqD+r7J
 iJjz67cxSS4XZNamHhM5u3Zvivs+zmPAAFPoJTOlNcO29w9IDzlcdoxfnxzaEUzu3FF6ecQ3m41
 JTt1n1bZIs+k1Yis=
X-Received: by 2002:adf:fac3:: with SMTP id a3mr479974wrs.369.1641834772669;
 Mon, 10 Jan 2022 09:12:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxCFLFbIA8AorqfaYxU8UpegcJfTTKDPwhDdvVaVfqi2b0Bh1NWQH0spzhztlk2tCbDCNxvvg==
X-Received: by 2002:adf:fac3:: with SMTP id a3mr479949wrs.369.1641834772216;
 Mon, 10 Jan 2022 09:12:52 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id l6sm1383751wmq.22.2022.01.10.09.12.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 09:12:51 -0800 (PST)
Subject: Re: [PATCH v4 5/6] hw/arm/virt: Disable highmem devices that don't
 fit in the PA range
To: Marc Zyngier <maz@kernel.org>, qemu-devel@nongnu.org
References: <20220107163324.2491209-1-maz@kernel.org>
 <20220107163324.2491209-6-maz@kernel.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <dad34b51-51e2-37cd-44cd-7ca7c4fe6129@redhat.com>
Date: Mon, 10 Jan 2022 18:12:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220107163324.2491209-6-maz@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
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

On 1/7/22 5:33 PM, Marc Zyngier wrote:
> In order to only keep the highmem devices that actually fit in
> the PA range, check their location against the range and update
> highest_gpa if they fit. If they don't, mark them them as disabled.
s/them them/them
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  hw/arm/virt.c | 34 ++++++++++++++++++++++++++++------
>  1 file changed, 28 insertions(+), 6 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index db4b0636e1..70b4773b3e 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1711,21 +1711,43 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
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
> +            vms->highest_gpa = MAX(vms->highest_gpa, base + size - 1);
why do you need the MAX()?
> +        }
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
Eric


