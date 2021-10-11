Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F95E42877E
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 09:11:40 +0200 (CEST)
Received: from localhost ([::1]:35496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZpTH-0002RQ-FC
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 03:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mZpRE-0001bQ-Vk
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 03:09:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mZpRD-0000ar-Ku
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 03:09:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633936171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=khc/tvIdKIoA9knrPZpjiSLEP82Gnlag1a0g2epACgc=;
 b=MHayM9pMW2xwlhqDJg4Kjqh9nJW4iIYbsgu00EwKprnEIqKFHbTufRroDY1iyD8Rxb1Gwr
 h6A0c5lByLuis5giBMIZFdVTEeARzBj/dH4ryy6N18+VNLNBJLbeW95UPQ3kmy2sfIcMvD
 bnadpvmZqJbYyx/HXKY0gzF2ycyfVEI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-72F2qNd2MHmBnbz0dUh79g-1; Mon, 11 Oct 2021 03:09:28 -0400
X-MC-Unique: 72F2qNd2MHmBnbz0dUh79g-1
Received: by mail-wr1-f69.google.com with SMTP id
 10-20020a5d47aa000000b001610cbda93dso1278694wrb.23
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 00:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=khc/tvIdKIoA9knrPZpjiSLEP82Gnlag1a0g2epACgc=;
 b=VOL8xe4ofCbtwjfTyaBJAm3RKLtl2nIwLDO8ciDtZIomX38YAVwABSonkHQ0C3YwEy
 F+nwwEnXEO4Yq8oDt2khm2xgSJh5zDkMxQCl8Z+FyFT0xdzTID+OFItoTn+SsVpWfw9N
 DLZquGg+3i2PS/5Sv529k/ESZQfFEcea6CmMODj2Jc8SVrBrOEi5a6j8QMMYVYra+JeA
 6dQWGbCX5MtG+TcKfYHNRS7QW+LT1/Xe6rGp64U1bKOMLJuvd6hxymwCkJPB6EgeV5w3
 Z34vdqg5qCUh3ifHCwlZBgSxpP1lDDt+DmAe/XD0Wa/zoUyZM88FVA4xZ+gNcnIYdzd3
 ebSA==
X-Gm-Message-State: AOAM533NBfzeCEzm63jdopWcHy8b13gGUkgkoY2OfAhZOUI06eHm8qn1
 q1H2priqMWPbdMpAV1HXkExvLS/kxp/QC02wn4q777m68Xtry/6JvJeEqt5Jw0da2+tol6OX0p1
 DJO2kYZTC/9Y0mYM=
X-Received: by 2002:a1c:9a4d:: with SMTP id c74mr18772072wme.139.1633936166794; 
 Mon, 11 Oct 2021 00:09:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+ZZCROK8nhXsiRLM+Em8LYrWNVr3r1dAKwbD1SdULd9brFs3fty6mUsGQoicsGsh0nsSHYw==
X-Received: by 2002:a1c:9a4d:: with SMTP id c74mr18772058wme.139.1633936166629; 
 Mon, 11 Oct 2021 00:09:26 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64ba.dip0.t-ipconnect.de. [91.12.100.186])
 by smtp.gmail.com with ESMTPSA id k18sm2945905wmi.2.2021.10.11.00.09.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 00:09:26 -0700 (PDT)
Subject: Re: [RFC PATCH v1 2/2] s390x/kvm: Pass SIGP Stop flags
To: Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>
References: <20211008203811.1980478-1-farman@linux.ibm.com>
 <20211008203811.1980478-3-farman@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <0addcdbc-50cb-420d-5864-af3a8a894321@redhat.com>
Date: Mon, 11 Oct 2021 09:09:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211008203811.1980478-3-farman@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Janosch Frank <frankja@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.10.21 22:38, Eric Farman wrote:
> When building a Stop IRQ to pass to KVM, we should incorporate
> the flags if handling the SIGP Stop and Store Status order.
> With that, KVM can reject other orders that are submitted for
> the same CPU while the operation is fully processed.
> 
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
> Acked-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>   target/s390x/kvm/kvm.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
> index 5b1fdb55c4..701b9ddc88 100644
> --- a/target/s390x/kvm/kvm.c
> +++ b/target/s390x/kvm/kvm.c
> @@ -2555,6 +2555,10 @@ void kvm_s390_stop_interrupt(S390CPU *cpu)
>           .type = KVM_S390_SIGP_STOP,
>       };
>   
> +    if (cpu->env.sigp_order == SIGP_STOP_STORE_STATUS) {
> +        irq.u.stop.flags = KVM_S390_STOP_FLAG_STORE_STATUS;
> +    }
> +

KVM_S390_STOP_FLAG_STORE_STATUS tells KVM to perform the store status as 
well ... is that really what we want?

Maybe we want a different (more generic) way to tell KVM that a CPU is 
temporarily busy for SIGP orders?

-- 
Thanks,

David / dhildenb


