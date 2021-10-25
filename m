Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B40439D2E
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 19:13:00 +0200 (CEST)
Received: from localhost ([::1]:40956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf3Wt-0005TL-Ur
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 13:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mf3Vq-00042Q-WF
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 13:11:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mf3Vo-0006xR-RT
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 13:11:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635181911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CKPEd4NczV1D6odKXy7x5l0PfIckL1NIk9t5xKQaHlo=;
 b=gadt4HzstxFgD8aPWNxhtDALNwg4VeW0VmGskXIlfrtu+Kvdu35+zPo3QQtjf8C5TO7GlO
 8SemRZqmIBX7ABRhRcOGVeJNk4egrFMHlrnB76lm+s8fU5h/Mxy6zlojp7d1ouGyTg/lVI
 LXdZz5AK6ETbPjQhzeW1WP/NrVhoxQA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-hC51lgX6MUWJ1Q08HutuZw-1; Mon, 25 Oct 2021 13:11:50 -0400
X-MC-Unique: hC51lgX6MUWJ1Q08HutuZw-1
Received: by mail-ed1-f72.google.com with SMTP id
 j17-20020aa7ca51000000b003dd395c0389so5706676edt.4
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 10:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CKPEd4NczV1D6odKXy7x5l0PfIckL1NIk9t5xKQaHlo=;
 b=6AGIKiDM/TM74eAsHR47ym8XS2Nv66V2y+ItO5wZ1Gu0jdT0uPDSibA9SoNJI01DBZ
 uDp9qbLUmWEg/o8kogRysijSSTNJ37R77sc4DjlNM2kSe6b+Rl6myxbUqEundd1bjXjO
 JniNwh8egAtwZ+NyhqD2Otmv6dwA1BrONv+ODQGpwCY9yVgupQyGxeV1i3ipA1NPdOdB
 ucF39M3iusNNwGWjW8HT5LMYzRjcQ2bxevzbf/w1VjdzrJxqAngIoBgt5hGyuqX+RUAQ
 8TWmRYSZ4KdiIep7YBIflO43PTCIOCEt5pMbNSFHh15UFoKlAloXzRGP0xrArT9HLfoL
 Xgtw==
X-Gm-Message-State: AOAM533SGwQRrJ48StmjSIQIXnTZSm4acheHHWXYxNhkSITHg+xFzTtB
 cK6gx76QnUzceGk+aGCHu36bwsl5LzAI41bwu3uVbe+cFqjfYCFqUrifDQHXzDERgh7T+nsCuZz
 si7/96yIJmfeeg64=
X-Received: by 2002:a50:d0c9:: with SMTP id g9mr11782412edf.132.1635181908883; 
 Mon, 25 Oct 2021 10:11:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqxV1qyEmQPhwDi0Hg2ZL+31lCmxCfnIPLLbj6Tgl9FrIR2ciTob8CRD4zjyO1j8Dz4iPVwg==
X-Received: by 2002:a50:d0c9:: with SMTP id g9mr11782391edf.132.1635181908715; 
 Mon, 25 Oct 2021 10:11:48 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id jt24sm7801329ejb.59.2021.10.25.10.11.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 10:11:48 -0700 (PDT)
Message-ID: <6c9b6035-276c-1e15-7b7f-81094473368b@redhat.com>
Date: Mon, 25 Oct 2021 19:11:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] hvf: Avoid mapping regions < PAGE_SIZE as ram
To: Alexander Graf <agraf@csgraf.de>, Cameron Esfahani <dirty@apple.com>
References: <20211025082558.96864-1-agraf@csgraf.de>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211025082558.96864-1-agraf@csgraf.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/10/21 10:25, Alexander Graf wrote:
> HVF has generic memory listener code that adds all RAM regions as HVF RAM
> regions. However, HVF can only handle page aligned, page granule regions.
> 
> So let's ignore regions that are not page aligned and sized. They will be
> trapped as MMIO instead.
> 
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>   accel/hvf/hvf-accel-ops.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
> index 6bf319d34c..090155853a 100644
> --- a/accel/hvf/hvf-accel-ops.c
> +++ b/accel/hvf/hvf-accel-ops.c
> @@ -135,6 +135,12 @@ static void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
>           }
>       }
>   
> +    if (int128_get64(section->size) & (qemu_real_host_page_size - 1) ||
> +        section->offset_within_address_space & (qemu_real_host_page_size - 1)) {
> +        /* Not page aligned, so we can not map as RAM */
> +        add = false;
> +    }
> +
>       mem = hvf_find_overlap_slot(
>               section->offset_within_address_space,
>               int128_get64(section->size));
> 

Queued, thanks.

Paolo


