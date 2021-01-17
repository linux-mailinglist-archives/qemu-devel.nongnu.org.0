Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9087C2F9460
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 19:03:47 +0100 (CET)
Received: from localhost ([::1]:38334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1COw-00050j-63
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 13:03:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1CNc-00047s-3B
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 13:02:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1CNZ-0002Vo-B6
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 13:02:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610906539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xK3ziO9AaJLdnMENUqXh/qs7xTQ+JcHpD5bxgsJXGcw=;
 b=K/kcIwI/V1Ao2paxlSB7K1t5C9EOQXlchiPEe5iT1vC9BZiQCduZku3jRsuyt+UCmljqop
 fHyF3kCdEVujfsqGpXRvCRTgmJwpAXBSCfP9rDVKWtD/HOpqNN4sbJ0/ghtqD60Zgt1WNV
 UmD6WsuuXkkBVLaZBvohGnMTOTcjczg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-S_VjiLCYOc2S5narQVGEFA-1; Sun, 17 Jan 2021 13:02:17 -0500
X-MC-Unique: S_VjiLCYOc2S5narQVGEFA-1
Received: by mail-wr1-f69.google.com with SMTP id i4so7142977wrm.21
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 10:02:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xK3ziO9AaJLdnMENUqXh/qs7xTQ+JcHpD5bxgsJXGcw=;
 b=SCpS404sRtnJ1Ksz4QmICRTaXXsnBLbTfgkx3VLJ/3fHFX1RndzdkNv2wEAefT+t2f
 8jMxXX41rDXk48v/O6fpYmB0kdRxR9g/hFt8EIkJtJfydClekl7a8bhyK18EJHrEBmGr
 4WIPaahNllp55lXWYVdHJL8JN+NPijlkTbXnhnnKbUT1h0AYoQ4O69YRbKdStiweIw/o
 Hmhtr8A23j0L+sV58L2l+RvkoQv7crN1xe7BvztmiVi2I7BxR2YKaVE6qh61gFk7UMES
 wn6IQpzFI6GJ3/Rn7oNq/qnIIVVEZ+F0W19OjH1dlX20BZh6bcbWqkBlBmpIDV75WeuH
 Bffw==
X-Gm-Message-State: AOAM531rBEWBKr66CKRrJgySklPdycMLKwLEcXK9TSDyedch7XJ3n5OC
 FCGuBgl8FWH2w5Zg/sX97lK7TeFFaopl2p/FMPnmMYnYGlI0C0G1Jjxn1Lhf5uGojazyJDGkUJ5
 bI6JJKlxdM/WD8Uo=
X-Received: by 2002:adf:ef06:: with SMTP id e6mr22149560wro.231.1610906536238; 
 Sun, 17 Jan 2021 10:02:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9DISw13m5zWPpC9T3orktXTCzyDL4ipGdQz/6ukWYbdWcRbo3DwyLdtnulmiKXw41M6O1aQ==
X-Received: by 2002:adf:ef06:: with SMTP id e6mr22149542wro.231.1610906536062; 
 Sun, 17 Jan 2021 10:02:16 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g192sm11912226wmg.18.2021.01.17.10.02.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jan 2021 10:02:15 -0800 (PST)
Subject: Re: [PATCH v2] softmmu/physmem: Silence GCC 10 maybe-uninitialized
 error
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210117170411.4106949-1-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9fbd25e8-1f4a-b7c6-ac95-7e622ae6c242@redhat.com>
Date: Sun, 17 Jan 2021 19:02:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210117170411.4106949-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.252, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/01/21 18:04, Philippe Mathieu-Daudé wrote:
> When building with GCC 10.2 configured with --extra-cflags=-Os, we get:
> 
>    softmmu/physmem.c: In function ‘address_space_translate_for_iotlb’:
>    softmmu/physmem.c:643:26: error: ‘notifier’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>      643 |         notifier->active = true;
>          |                          ^
>    softmmu/physmem.c:608:23: note: ‘notifier’ was declared here
>      608 |     TCGIOMMUNotifier *notifier;
>          |                       ^~~~~~~~
> 
> Initialize 'notifier' to silence the warning.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v2: Remove pointless assert (Peter Maydell)
> 
> Yet another hole in our CI.
> 
> Supersedes: <20210117160754.4086411-1-f4bug@amsat.org>
> ---
>   softmmu/physmem.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 6301f4f0a5c..cdcd197656f 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -605,7 +605,7 @@ static void tcg_register_iommu_notifier(CPUState *cpu,
>        * when the IOMMU tells us the mappings we've cached have changed.
>        */
>       MemoryRegion *mr = MEMORY_REGION(iommu_mr);
> -    TCGIOMMUNotifier *notifier;
> +    TCGIOMMUNotifier *notifier = NULL;
>       int i;
>   
>       for (i = 0; i < cpu->iommu_notifiers->len; i++) {
> 

Queued, thanks.

Paolo


