Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DBB42093F
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 12:18:24 +0200 (CEST)
Received: from localhost ([::1]:34412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXL39-0000Kl-Ct
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 06:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mXKWY-0000bd-JX
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:44:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mXKWS-00068c-Hr
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:44:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633340675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SoUkTtOv9XP49TsrzDlI8hEqaw7q+N7J/SxBu7RAHCQ=;
 b=fHBHGlAQcH7HITOeeZSlw+Af8RP5uM/cjf3Wr82ThRUhaX6roe/OO4zVUFT3q4U9gjVfZ8
 uLFSbjKMy801VJu4JI9lwHfk1e5ULduBITt5HHWEprWmDnOoC7zAMWK0ve8aRpd0tEPwWR
 LtaCGYNqH3jl2HlmlYihGg2xAy86dzI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-2kGjzbiZMMqfB7M-og96hQ-1; Mon, 04 Oct 2021 05:44:34 -0400
X-MC-Unique: 2kGjzbiZMMqfB7M-og96hQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 d13-20020adfa34d000000b00160aa1cc5f1so750300wrb.14
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 02:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SoUkTtOv9XP49TsrzDlI8hEqaw7q+N7J/SxBu7RAHCQ=;
 b=xs0SHPkQWzYM0p29k28leEs2Ft0/2w2LpxA7DMR7URQz33mwpxADgncGzby1yLN4IR
 ajHM+6tc8ERX/XtxzIDFNywkPfgKSlMkowYgVshdh4miHj0g5l1ksgllIOo1zLEmUoJG
 UTU7t5sxwsZtrM+cPQcmr1St0mSAlz4MbqcGQv/+9l8JyuI7GU42BFafPlxt9t+cmwHb
 P52GFKBTjl3vO5jFZAXKP+CKwpVc4AFmgqukLBPs9oHdqpKra+WaNvWr0bKl7mXE3T1p
 MVeRUmUqO4JyAmemgyBScYrNTDMx27+5mhZ2eaOrptwhFArLXfiUI4fYUch50EJcvwoU
 47rQ==
X-Gm-Message-State: AOAM531iQKGuo2XYyrntrFCXZ1kE8dFQnWEQ8wbwHBenFH5yYZ6CGk0I
 qnegK/Eob3SIfF5kBqgPf1QVAT1B6Q15APlcZfz+sJlu0A4FlImG5F0AIkovcAQKw8gnFBfIYZf
 1cGBKI4Z0IvqgMfQ=
X-Received: by 2002:adf:9bc4:: with SMTP id e4mr13142417wrc.257.1633340673283; 
 Mon, 04 Oct 2021 02:44:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2LrCY7HSrjxs2GPwETmmHaFihgfaSnx78iosQ5U6+ikTJPgF0cMge7tL/mMpTCWF7VZGUEw==
X-Received: by 2002:adf:9bc4:: with SMTP id e4mr13142407wrc.257.1633340673145; 
 Mon, 04 Oct 2021 02:44:33 -0700 (PDT)
Received: from gator (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id n17sm6794152wrw.16.2021.10.04.02.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 02:44:32 -0700 (PDT)
Date: Mon, 4 Oct 2021 11:44:31 +0200
From: Andrew Jones <drjones@redhat.com>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 3/5] hw/arm/virt: Honor highmem setting when computing
 the memory map
Message-ID: <20211004094431.2dewqj3hf2vjiil7@gator>
References: <20211003164605.3116450-1-maz@kernel.org>
 <20211003164605.3116450-4-maz@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211003164605.3116450-4-maz@kernel.org>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Oct 03, 2021 at 05:46:03PM +0100, Marc Zyngier wrote:
> Even when the VM is configured with highmem=off, the highest_gpa
> field includes devices that are above the 4GiB limit.
> Similarily, nothing seem to check that the memory is within
> the limit set by the highmem=off option.
> 
> This leads to failures in virt_kvm_type() on systems that have
> a crippled IPA range, as the reported IPA space is larger than
> what it should be.
> 
> Instead, honor the user-specified limit to only use the devices
> at the lowest end of the spectrum, and fail if we have memory
> crossing the 4GiB limit.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  hw/arm/virt.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index bcf58f677d..9d2abdbd5f 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1628,6 +1628,11 @@ static void virt_set_memmap(VirtMachineState *vms)
>          exit(EXIT_FAILURE);
>      }
>  
> +    if (!vms->highmem &&
> +        vms->memmap[VIRT_MEM].base + ms->maxram_size > 4 * GiB) {
> +        error_report("highmem=off, but memory crosses the 4GiB limit\n");
> +        exit(EXIT_FAILURE);
> +    }
>      /*
>       * We compute the base of the high IO region depending on the
>       * amount of initial and device memory. The device memory start/size
> @@ -1657,7 +1662,9 @@ static void virt_set_memmap(VirtMachineState *vms)
>          vms->memmap[i].size = size;
>          base += size;
>      }
> -    vms->highest_gpa = base - 1;
> +    vms->highest_gpa = (vms->highmem ?
> +                        base :
> +                        vms->memmap[VIRT_MEM].base + ms->maxram_size) - 1;
>      if (device_memory_size > 0) {
>          ms->device_memory = g_malloc0(sizeof(*ms->device_memory));
>          ms->device_memory->base = device_memory_base;
> -- 
> 2.30.2
>

Reviewed-by: Andrew Jones <drjones@redhat.com>


