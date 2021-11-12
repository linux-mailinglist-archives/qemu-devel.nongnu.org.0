Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1173544E3DD
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 10:33:22 +0100 (CET)
Received: from localhost ([::1]:48652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlSvw-000878-Mu
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 04:33:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mlSuw-0007QZ-JM
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 04:32:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mlSut-0003DY-B5
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 04:32:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636709533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IGqIOaYOVVDlA03zMXxsS+TDWYGOiD9fi9k1v1Jwf24=;
 b=girWlm0XbkbrO2vkgoYxH4yEbWY/TU87zmyLFnVmaGJBXTka0vGYlX4EBcAJR8Ymh9T4yk
 +db0GY3Xurej7jphaJWDKW6X8RgWCi6RjKJ8/40SYiYB316PZt6nFRpjNFMaJky4U1nTJ3
 gHNdGg0j/yos9iAVmhWmPtdMzPAEQ3c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-8yFnRX0hPP6zcb2Y9QfxAA-1; Fri, 12 Nov 2021 04:32:12 -0500
X-MC-Unique: 8yFnRX0hPP6zcb2Y9QfxAA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA66D101F004;
 Fri, 12 Nov 2021 09:32:10 +0000 (UTC)
Received: from [10.39.193.118] (unknown [10.39.193.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BA035F4F5;
 Fri, 12 Nov 2021 09:31:50 +0000 (UTC)
Message-ID: <e4b6e45f-dddd-8401-8d7b-9d9cc4f1def0@redhat.com>
Date: Fri, 12 Nov 2021 10:31:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 4/6] kvm: irqchip: extract
 kvm_irqchip_add_deferred_msi_route
Content-Language: en-US
To: "Longpeng(Mike)" <longpeng2@huawei.com>, alex.williamson@redhat.com
References: <20211103081657.1945-1-longpeng2@huawei.com>
 <20211103081657.1945-5-longpeng2@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211103081657.1945-5-longpeng2@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.449, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: arei.gonglei@huawei.com, qemu-devel@nongnu.org, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/3/21 09:16, Longpeng(Mike) wrote:
> Extract a common helper that add MSI route for specific vector
> but does not commit immediately.
> 
> Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>

I think adding the new function is not necessary; I have no problem 
moving the call to kvm_irqchip_commit_routes to the callers.  Perhaps 
you can have an API like this:

typedef struct KVMRouteChange {
     KVMState *s;
     int changes;
} KVMRouteChange;

KVMRouteChange kvm_irqchip_begin_route_changes(KVMState *s)
{
     return (KVMRouteChange) { .s = s, .changes = 0 };
}

void kvm_irqchip_commit_route_changes(KVMRouteChange *c)
{
     if (c->changes) {
         kvm_irqchip_commit_routes(c->s);
         c->changes = 0;
    }
}

int kvm_irqchip_add_msi_route(KVMRouteChange *c, int vector, PCIDevice *dev)
{
     KVMState *s = c->s;
     ...
     kvm_add_routing_entry(s, &kroute);
     kvm_arch_add_msi_route_post(&kroute, vector, dev);
     c->changes++;

     return virq;
}

so it's harder for the callers to "forget" kvm_irqchip_commit_route_changes.

Paolo

> ---
>   accel/kvm/kvm-all.c  | 15 +++++++++++++--
>   include/sysemu/kvm.h |  6 ++++++
>   2 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index db8d83b..8627f7c 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -1953,7 +1953,7 @@ int kvm_irqchip_send_msi(KVMState *s, MSIMessage msg)
>       return kvm_set_irq(s, route->kroute.gsi, 1);
>   }
>   
> -int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
> +int kvm_irqchip_add_deferred_msi_route(KVMState *s, int vector, PCIDevice *dev)
>   {
>       struct kvm_irq_routing_entry kroute = {};
>       int virq;
> @@ -1996,7 +1996,18 @@ int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
>   
>       kvm_add_routing_entry(s, &kroute);
>       kvm_arch_add_msi_route_post(&kroute, vector, dev);
> -    kvm_irqchip_commit_routes(s);
> +
> +    return virq;
> +}
> +
> +int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
> +{
> +    int virq;
> +
> +    virq = kvm_irqchip_add_deferred_msi_route(s, vector, dev);
> +    if (virq >= 0) {
> +        kvm_irqchip_commit_routes(s);
> +    }
>   
>       return virq;
>   }
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index a1ab1ee..8de0d9a 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -476,6 +476,12 @@ void kvm_init_cpu_signals(CPUState *cpu);
>    * @return: virq (>=0) when success, errno (<0) when failed.
>    */
>   int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev);
> +/**
> + * Add MSI route for specific vector but does not commit to KVM
> + * immediately
> + */
> +int kvm_irqchip_add_deferred_msi_route(KVMState *s, int vector,
> +                                       PCIDevice *dev);
>   int kvm_irqchip_update_msi_route(KVMState *s, int virq, MSIMessage msg,
>                                    PCIDevice *dev);
>   void kvm_irqchip_commit_routes(KVMState *s);
> 


