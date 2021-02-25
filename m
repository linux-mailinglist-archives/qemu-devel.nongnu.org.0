Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6A9324DA9
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 11:10:23 +0100 (CET)
Received: from localhost ([::1]:51140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFDbC-0004nl-QD
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 05:10:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFDZr-0004Cc-V3
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:08:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFDZq-0005IJ-FK
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:08:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614247737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xhgvzkmtyIkBwb1U+rc5dxvErTPV0TNESIpIzbyCh6Y=;
 b=CQQhQwmu5pMKifRF2k+6S5zY01rFYIMHTmicWIpiO2lf8tEN93Br1YwSpoKYF9vSveMkje
 NeQRIB0ucpNdR1qJEcfavF8YEIbfABBYYMjih//7EYXvwd0CTMyj0eYBPvUVq4qSqWC4lh
 /pURW6JaXNaDj53ebQrRIffGOu4l3iI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-Rheqou6UNF-WaLn02nGnFw-1; Thu, 25 Feb 2021 05:08:53 -0500
X-MC-Unique: Rheqou6UNF-WaLn02nGnFw-1
Received: by mail-wm1-f71.google.com with SMTP id n6so602611wmd.4
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 02:08:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xhgvzkmtyIkBwb1U+rc5dxvErTPV0TNESIpIzbyCh6Y=;
 b=fEQKLh5E4hKW/fWT/DwBW6LfLT9hb2Tchq61IGJ1MPxhJtNe3WIeJo0jl68C0u6s0a
 guJHwAW/ubgAhFYzgtrK9zgwiv7bO5kTR3oPBPWx0tBR4+nmbkpRlQsaJh+PHqyHJETi
 NV6pZZlzWGbY5opcQsJU70Y+4CAJRvuFm9pR5NtQLYgy6mmedtIagXrPYovg8n8aOw6n
 YVk1TlJUOxYQIFzWi61mP1uVOACJHQC3ZQNhvqEGa4uUWZLAKUWO5JFbqWWwjjU8GuiI
 V7W6NEk2nf2cK0sNYAEKOFVjMMtRy3yoxOxFl2CzeCnswkOOF3rmHeYBVlDlTIOcep+w
 QubA==
X-Gm-Message-State: AOAM533+KEiCNaKEy6N4ZXD6umX6km8rfVnGZ2VlLvT0jX5G+kg2Dbfs
 8dPBXnTSpjUfMl0G2F167f8DMLT002zqSOixy6SUTmQY0NXirmu1VzS26Xzszp23GOCbAEgE6jC
 7aVdIer42oGcSjpM=
X-Received: by 2002:a1c:66c4:: with SMTP id a187mr2069235wmc.164.1614247732687; 
 Thu, 25 Feb 2021 02:08:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtUslqaU0DYiDJOJ7Z+sCytvphXnICdaCDrle/bWtJb6BYknHKXNAdmfhRQTAau48OKtVSJQ==
X-Received: by 2002:a1c:66c4:: with SMTP id a187mr2069212wmc.164.1614247732471; 
 Thu, 25 Feb 2021 02:08:52 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o14sm7239828wri.48.2021.02.25.02.08.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 02:08:51 -0800 (PST)
Subject: Re: [PATCH v2 1/7] intel_iommu: Fix mask may be uninitialized in
 vtd_context_device_invalidate
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 jean-philippe@linaro.org, peterx@redhat.com, jasowang@redhat.com,
 pbonzini@redhat.com
References: <20210225091435.644762-1-eric.auger@redhat.com>
 <20210225091435.644762-2-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2e75abf8-55e4-b5db-7ca2-6e0408bf81e6@redhat.com>
Date: Thu, 25 Feb 2021 11:08:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210225091435.644762-2-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: vivek.gautam@arm.com, shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/21 10:14 AM, Eric Auger wrote:
> With -Werror=maybe-uninitialized configuration we get
> ../hw/i386/intel_iommu.c: In function ‘vtd_context_device_invalidate’:
> ../hw/i386/intel_iommu.c:1888:10: error: ‘mask’ may be used
> uninitialized in this function [-Werror=maybe-uninitialized]
>  1888 |     mask = ~mask;
>       |     ~~~~~^~~~~~~
> 
> Add a g_assert_not_reached() to avoid the error.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/i386/intel_iommu.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index b4f5094259..3206f379f8 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -1884,6 +1884,8 @@ static void vtd_context_device_invalidate(IntelIOMMUState *s,
>      case 3:
>          mask = 7;   /* Mask bit 2:0 in the SID field */
>          break;
> +    default:
> +        g_assert_not_reached();
>      }
>      mask = ~mask;

Unrelated to this patch, but I wonder why we don't directly assign the
correct value of the mask in the switch cases...

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

set the mask
diuse the
>  
> 


