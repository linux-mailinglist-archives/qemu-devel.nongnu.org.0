Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2759043978F
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 15:28:23 +0200 (CEST)
Received: from localhost ([::1]:38594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf01V-0003pL-VH
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 09:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mezzY-0001vA-Ph
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 09:26:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mezzW-0005Q1-Me
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 09:26:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635168377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sVt0O+ask24CVlvczR/8M4IeeRhRW0FTZ2zH55NNinY=;
 b=dTCZP/tY064hLGG1y3o3DOTj98wf/ozv8sTMA3qFkgKXPenWEUR6fV84z4lelptx3GEczx
 19nDcYsD234O8MlqYkRBljwFN00AKLg757Bw4C9c/EwuleZQSJ57xUvpF/qmqRu/wkoXD2
 U+WZenQZjzL2CzPx7xeQiVwmt5Gsskc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-IxfjNfcUPI-r2xxNUE2_xQ-1; Mon, 25 Oct 2021 09:26:16 -0400
X-MC-Unique: IxfjNfcUPI-r2xxNUE2_xQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 b81-20020a1c8054000000b0032c9d428b7fso3518133wmd.3
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 06:26:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sVt0O+ask24CVlvczR/8M4IeeRhRW0FTZ2zH55NNinY=;
 b=DrVZfhMXo2b/oTj5iAd8O+VSGg4Dls8LcsxObkOGXU9RDvRk2yPuJXs/agtkpuyjBB
 QvWKLc+hjIasnRiRbwE5K0IgaAUc6qNK2pUzFIUUKOiRB80i7ZTN1bUIwgAA3G3A48mY
 Q4xZszqlHVNg9osLx8fni7A8h7mg6cCNh4LnBRYxsu1zGxbJ2c0w7OcaKCHXOgwxoWPa
 A6KQhR3ojrzyKrTfC8ktuXKRxVS4PZLMVabxbdhHTWAPSoRhQwLHFM+BMx48uKBRFI/Q
 WoEX9ddML5zbZWoXpQTaE9jbpp5plOLWrPGPBoFsDHYTbqZgxDN+wX3JaJTOU1+wDl4d
 Cfsg==
X-Gm-Message-State: AOAM5333+ZmNYGmagpTbDxPhzayLtfXLEu4MTDAoX8pdARo5hdU579Hl
 Fb82O9rJawd8uiCFtHx9LHyevqypbED7T5oqG6UoaNYWioawIcBrFUUBZ1c5RaQ866EYXBZU6S/
 WbY+mOqwfOa4EVp4=
X-Received: by 2002:adf:9c02:: with SMTP id f2mr24260377wrc.329.1635168375020; 
 Mon, 25 Oct 2021 06:26:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxs+qbcMVx1eye8GcDU2mdDQN+otGIIkCHkH6eMw2zjrmog80H7tGu10EUeP8kT5eG5iVGcfw==
X-Received: by 2002:adf:9c02:: with SMTP id f2mr24260340wrc.329.1635168374771; 
 Mon, 25 Oct 2021 06:26:14 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id r1sm11356988wmr.36.2021.10.25.06.26.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 06:26:14 -0700 (PDT)
Message-ID: <5a8c52e0-035f-0c6b-52ad-77c1d1cdf1bb@redhat.com>
Date: Mon, 25 Oct 2021 15:26:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] hvf: Avoid mapping regions < PAGE_SIZE as ram
To: Alexander Graf <agraf@csgraf.de>, Cameron Esfahani <dirty@apple.com>
References: <20211025132147.28308-1-agraf@csgraf.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211025132147.28308-1-agraf@csgraf.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 10/25/21 15:21, Alexander Graf wrote:
> HVF has generic memory listener code that adds all RAM regions as HVF RAM
> regions. However, HVF can only handle page aligned, page granule regions.
> 
> So let's ignore regions that are not page aligned and sized. They will be
> trapped as MMIO instead.
> 
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> 
> ---
> 
> v1 -> v2:
> 
>   - Use QEMU_IS_ALIGNED()
> ---
>  accel/hvf/hvf-accel-ops.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
> index 2b2c411076..54457c76c2 100644
> --- a/accel/hvf/hvf-accel-ops.c
> +++ b/accel/hvf/hvf-accel-ops.c
> @@ -122,6 +122,7 @@ static void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
>      MemoryRegion *area = section->mr;
>      bool writeable = !area->readonly && !area->rom_device;
>      hv_memory_flags_t flags;
> +    uint64_t page_size = qemu_real_host_page_size;
>  
>      if (!memory_region_is_ram(area)) {
>          if (writeable) {
> @@ -135,6 +136,12 @@ static void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
>          }
>      }
>  
> +    if (!QEMU_IS_ALIGNED(int128_get64(section->size), page_size) ||
> +        !QEMU_IS_ALIGNED(section->offset_within_address_space, page_size)) {
> +        /* Not page aligned, so we can not map as RAM */
> +        add = false;
> +    }
> +
>      mem = hvf_find_overlap_slot(
>              section->offset_within_address_space,
>              int128_get64(section->size));
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


