Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0742A43945F
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 12:58:50 +0200 (CEST)
Received: from localhost ([::1]:34320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mexgn-0002C8-0B
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 06:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mexer-0007p9-09
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:56:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mexeo-00043Y-UR
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:56:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635159406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nHvfItxWfEtMzRu8Na0a1zSIVIhx2d5joBNHOgPeunI=;
 b=Th/nFRYr3/hqJtEvDWKppQX0/P0tTWNpo7LNWW2JfnBIOI3IG3d3UtStxNDBr0EBdpJTz4
 IusgF9IE+vQGs/SEsGTuiaOq93sRgnnhY/HqB3MnvsFE8Mj87gyy3XvLhsFAOOjDsX4GEW
 QrFCqbExVml4F9RXBThqFhzKXAyd5X8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-KOzuIuSqPhO96Yhzt0y1FQ-1; Mon, 25 Oct 2021 06:56:44 -0400
X-MC-Unique: KOzuIuSqPhO96Yhzt0y1FQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 u14-20020a05600c19ce00b0030d8549d49aso5698512wmq.0
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 03:56:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nHvfItxWfEtMzRu8Na0a1zSIVIhx2d5joBNHOgPeunI=;
 b=C3NxMRvuaq7/GfQ2ozgI74knsNEG94KRHs0rzsqViXTe4vOxkM5CzotaGRPG+p4tlo
 Xu6Oj0a4EBtGbpdLY3HlgEymBTX0Cskn1AqXf2rutNx5GzqyJXS6dkZN6dvS7Yvlm84g
 Zwg1NaZxooTgjIz724xYIK5PJzQEFmLQgBuOSOmoZ9kO2bSsUgJZo+K+UV+9tlSgGyGO
 67xKEyQpbTtSlur5BM7LzdiT1NpqsGCDh+L4p66ScUklhCNmZnxJQLRcSRl3TSFRnOsM
 XkbPQS4fL8+jlQaCz8lOqX44OGe70wX72K0RpuYByScCucLWI5G1GFnpJL0BitvyfAE/
 v/mg==
X-Gm-Message-State: AOAM532DJPsNlX7UYK2OT+4r3TjUomNpzesIrPDJ6JqqrjmOmznqiB/9
 1z0bxuvpq/cWLGkhW0op8sFG0jwV2tchTZmFKTVLsbfiethZVB9B02b2KurTVMKjDr3j4LTUrud
 U9tmA5Gq/teWss9w=
X-Received: by 2002:adf:e0c1:: with SMTP id m1mr22919907wri.241.1635159403842; 
 Mon, 25 Oct 2021 03:56:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGlk3lhGE0W0w12VJaVEH44KaF0hsFQGuOBP/H9scvjtlpPGKmqu42Y/0wdS84saS++12KWQ==
X-Received: by 2002:adf:e0c1:: with SMTP id m1mr22919888wri.241.1635159403719; 
 Mon, 25 Oct 2021 03:56:43 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id u1sm9592603wrt.97.2021.10.25.03.56.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 03:56:43 -0700 (PDT)
Message-ID: <3554676c-c763-11b6-ac68-211e3006a42b@redhat.com>
Date: Mon, 25 Oct 2021 12:56:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] hvf: Avoid mapping regions < PAGE_SIZE as ram
To: Alexander Graf <agraf@csgraf.de>, Cameron Esfahani <dirty@apple.com>
References: <20211025082558.96864-1-agraf@csgraf.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211025082558.96864-1-agraf@csgraf.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.846, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On 10/25/21 10:25, Alexander Graf wrote:
> HVF has generic memory listener code that adds all RAM regions as HVF RAM
> regions. However, HVF can only handle page aligned, page granule regions.
> 
> So let's ignore regions that are not page aligned and sized. They will be
> trapped as MMIO instead.
> 
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  accel/hvf/hvf-accel-ops.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
> index 6bf319d34c..090155853a 100644
> --- a/accel/hvf/hvf-accel-ops.c
> +++ b/accel/hvf/hvf-accel-ops.c
> @@ -135,6 +135,12 @@ static void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
>          }
>      }
>  
> +    if (int128_get64(section->size) & (qemu_real_host_page_size - 1) ||
> +        section->offset_within_address_space & (qemu_real_host_page_size - 1)) {

Could we use QEMU_IS_ALIGNED() instead?

> +        /* Not page aligned, so we can not map as RAM */
> +        add = false;
> +    }
> +
>      mem = hvf_find_overlap_slot(
>              section->offset_within_address_space,
>              int128_get64(section->size));
> 


