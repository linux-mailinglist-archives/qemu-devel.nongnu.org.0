Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9763D88DF
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 09:32:42 +0200 (CEST)
Received: from localhost ([::1]:43462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8e3V-0002kc-CW
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 03:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m8e1r-0001dU-Bz
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 03:30:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m8e1n-0000YO-Uw
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 03:30:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627457455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gBzmiE2KaP1Rkx4ybMUdQ6OFEaFkTJDJ5ZMf+LCZDks=;
 b=EGN3oVidKODlklfxucdMHs4SBfpGahklgvcLGjrCbhGqxqvIOKrhesa9gRPNGpRi45n/3e
 94NjIyHn/mcerwqgQr/o3i1d85OmXv6s3MmJr572K1iwOIb+LovqJQEg7ifKXv/7Xiw06o
 A5BAji5ksliI6KeRkapDG/yM0ZC+/I8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-qJ-pu2T7MqCdRRxlq1c_-A-1; Wed, 28 Jul 2021 03:30:50 -0400
X-MC-Unique: qJ-pu2T7MqCdRRxlq1c_-A-1
Received: by mail-ed1-f71.google.com with SMTP id
 n24-20020aa7c7980000b02903bb4e1d45aaso801047eds.15
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 00:30:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gBzmiE2KaP1Rkx4ybMUdQ6OFEaFkTJDJ5ZMf+LCZDks=;
 b=jaLNrOrWeKWU+E7H7wPVeVPld5hYOkwFFywoJeBZ/khE5tOE+1zP+k0tnYJA8yoKxg
 KsisVTQyo7cCSVXKHgLJVE/A001ylkv/cQgguY1UKM8AcLgFoe9L3EzxZOUYV7pfcRPo
 tgRfW1xwYhrPNr48CsYNZmIb8wlQ+D2iMElosLZFSOvzFAxF8sOLjgVrXdJ66bgoFC0R
 8DYj7geCZWouW+GNaMVakwcIP9VDjTBkamsr0e4RyYcDpdzDBEg0oQrTI4jEpJMK00/j
 ZPStGZqbSI9uiI4t6P919BGnrr4ln8OSY9AONNZdHHWYVdK/HbsPf0Em6qTjp0q+TSJt
 XGtg==
X-Gm-Message-State: AOAM533KEIqH5DJgGahoWO1BLTnYLrzlalDMI5qZxWySkItyFYXWFN/z
 Yk02l5c99bonEZFfjqxGLJhhdkpeYr/aoZDD+MzNI3rYAuVSuGXgi5tMuYEGZo6tjmCvdr98ahu
 JUhS9xJgItCMXYfM=
X-Received: by 2002:a05:6402:170d:: with SMTP id
 y13mr4083408edu.228.1627457449059; 
 Wed, 28 Jul 2021 00:30:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIPD61KneKnMpS6mbHSyOaSwiQcu3JMUJX83HwyFObdeqXpzvjKPm1SBdhQyu2ZD3VBppUXQ==
X-Received: by 2002:a05:6402:170d:: with SMTP id
 y13mr4083394edu.228.1627457448889; 
 Wed, 28 Jul 2021 00:30:48 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id n17sm2220109edr.84.2021.07.28.00.30.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 00:30:48 -0700 (PDT)
Subject: Re: [PATCH] target/arm: kvm: use RCU_READ_LOCK_GUARD() in
 kvm_arch_fixup_msi_route()
To: Hamza Mahfooz <someguy@effective-light.com>, qemu-devel@nongnu.org
References: <20210727235201.11491-1-someguy@effective-light.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e84e3fe7-e644-7059-22cc-ddefd8bfc8c4@redhat.com>
Date: Wed, 28 Jul 2021 09:30:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727235201.11491-1-someguy@effective-light.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/07/21 01:52, Hamza Mahfooz wrote:
> As per commit 5626f8c6d468 ("rcu: Add automatically released rcu_read_lock
> variants"), RCU_READ_LOCK_GUARD() should be used instead of
> rcu_read_{un}lock().
> 
> Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
> ---

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

>   target/arm/kvm.c | 17 ++++++++---------
>   1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index d8381ba224..5d55de1a49 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -998,7 +998,6 @@ int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
>       hwaddr xlat, len, doorbell_gpa;
>       MemoryRegionSection mrs;
>       MemoryRegion *mr;
> -    int ret = 1;
>   
>       if (as == &address_space_memory) {
>           return 0;
> @@ -1006,15 +1005,19 @@ int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
>   
>       /* MSI doorbell address is translated by an IOMMU */
>   
> -    rcu_read_lock();
> +    RCU_READ_LOCK_GUARD();
> +
>       mr = address_space_translate(as, address, &xlat, &len, true,
>                                    MEMTXATTRS_UNSPECIFIED);
> +
>       if (!mr) {
> -        goto unlock;
> +        return 1;
>       }
> +
>       mrs = memory_region_find(mr, xlat, 1);
> +
>       if (!mrs.mr) {
> -        goto unlock;
> +        return 1;
>       }
>   
>       doorbell_gpa = mrs.offset_within_address_space;
> @@ -1025,11 +1028,7 @@ int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
>   
>       trace_kvm_arm_fixup_msi_route(address, doorbell_gpa);
>   
> -    ret = 0;
> -
> -unlock:
> -    rcu_read_unlock();
> -    return ret;
> +    return 0;
>   }
>   
>   int kvm_arch_add_msi_route_post(struct kvm_irq_routing_entry *route,
> 


