Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C94626B234D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 12:45:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paEhA-0007lb-UL; Thu, 09 Mar 2023 06:44:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paEh9-0007lS-5z
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 06:44:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paEh7-0005vv-AD
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 06:44:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678362264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qn/g4kkEPEoI2d5ppww3GPMxlEiEHpKOHxs6sXqugRA=;
 b=a4+/FKqjggqO+m7UtetbD+OUIX/bJygNOVpv/Za2+kgR2gG+8YMbWt/XGCWr88PGs1Mf37
 kCykrcKJqZmXqctZpq0nRD0n1zWVhPIzThj1iqBtzqEoR9OD8rRXG3iS7pjZzfJeWvE4f4
 J6Ob3SvCtiwq5q16q2pBc22OnsMPOlk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-NNJb81lnM_aIh32gz_odvg-1; Thu, 09 Mar 2023 06:44:23 -0500
X-MC-Unique: NNJb81lnM_aIh32gz_odvg-1
Received: by mail-ed1-f71.google.com with SMTP id
 u10-20020a056402064a00b004c689813557so2545857edx.10
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 03:44:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678362262;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qn/g4kkEPEoI2d5ppww3GPMxlEiEHpKOHxs6sXqugRA=;
 b=FY5wok8yUqu0CKHwjmTBFM6ceS9+35RGATuy/Mn2OROzr6IbD5Yz4uvTV7aoVDbMZd
 la+dNjuaIkfekWKyoZK2X97GBhKIHrRVwu6t7lMrkYinWKvR7wob7VjMbHgaLtWzFg/6
 MyxyuYLpkPAZwoqTDipkI3QMUemEx2NkNNGYWKqjqN7F5sl+e32RtMygecQFm3gPtoe1
 FqtILZdlZQcykVgv6PQtatBQObPJLAlTA4qFJ4vzoEc1aAoRHd75zDDae21pLRLdASWK
 P8IESETwONdh16blpKpkA0JTgVXbHKOGo9MtF7jAPn2CnhTIKNT7K9xEOKi2Ltb69X0/
 vlXA==
X-Gm-Message-State: AO0yUKUe9jAUDPd0pKIRsx6UI33jXH+YvAsA8FSZyzJlNla41yBR2GMd
 +cBmuFBviDwDc1m1j680DkJ7hMxoN3MnooQLCDxzP/wytex+iKrnNY4jLFvjRZXHX94RugDXHJ1
 sN48R91lYhrzRLco=
X-Received: by 2002:aa7:d742:0:b0:4be:ac45:aaec with SMTP id
 a2-20020aa7d742000000b004beac45aaecmr19420472eds.18.1678362262443; 
 Thu, 09 Mar 2023 03:44:22 -0800 (PST)
X-Google-Smtp-Source: AK7set9Z7CBeMr3d7TW1kIIOyoTzp+GvJyJviQ7AsAN1EsCWQrubtsMGN0MmpNnRSjMkEYX2dyeTgA==
X-Received: by 2002:aa7:d742:0:b0:4be:ac45:aaec with SMTP id
 a2-20020aa7d742000000b004beac45aaecmr19420459eds.18.1678362262108; 
 Thu, 09 Mar 2023 03:44:22 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 s23-20020a50d497000000b004c8948162e8sm9097124edi.67.2023.03.09.03.44.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 03:44:21 -0800 (PST)
Message-ID: <ea2daf78-f48b-8d16-2ac9-11b415631f4b@redhat.com>
Date: Thu, 9 Mar 2023 12:44:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/3] hw/intc/ioapic: Update KVM routes before
 redelivering IRQ, on RTE update
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20230308111952.2728440-1-dwmw2@infradead.org>
 <20230308111952.2728440-2-dwmw2@infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230308111952.2728440-2-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/8/23 12:19, David Woodhouse wrote:
> A Linux guest will perform IRQ migration after the IRQ has happened,
> updating the RTE to point to the new destination CPU and then unmasking
> the interrupt.
> 
> However, when the guest updates the RTE, ioapic_mem_write() calls
> ioapic_service(), which redelivers the pending level interrupt via
> kvm_set_irq(), *before* calling ioapic_update_kvm_routes() which sets
> the new target CPU.
> 
> Thus, the IRQ which is supposed to go to the new target CPU is instead
> misdelivered to the previous target. An example where the guest kernel
> is attempting to migrate from CPU#2 to CPU#0 shows:
> 
> xenstore_read tx 0 path control/platform-feature-xs_reset_watches
> ioapic_set_irq vector: 11 level: 1
> ioapic_set_remote_irr set remote irr for pin 11
> ioapic_service: trigger KVM IRQ 11
> [    0.523627] The affinity mask was 0-3 and the handler is on 2
> ioapic_mem_write ioapic mem write addr 0x0 regsel: 0x27 size 0x4 val 0x26
> ioapic_update_kvm_routes: update KVM route for IRQ 11: fee02000 8021
> ioapic_mem_write ioapic mem write addr 0x10 regsel: 0x26 size 0x4 val 0x18021
> xenstore_reset_watches
> ioapic_set_irq vector: 11 level: 1
> ioapic_mem_read ioapic mem read addr 0x10 regsel: 0x26 size 0x4 retval 0x1c021
> [    0.524569] ioapic_ack_level IRQ 11 moveit = 1
> ioapic_eoi_broadcast EOI broadcast for vector 33
> ioapic_clear_remote_irr clear remote irr for pin 11 vector 33
> ioapic_mem_write ioapic mem write addr 0x0 regsel: 0x26 size 0x4 val 0x26
> ioapic_mem_read ioapic mem read addr 0x10 regsel: 0x26 size 0x4 retval 0x18021
> [    0.525235] ioapic_finish_move IRQ 11 calls irq_move_masked_irq()
> [    0.526147] irq_do_set_affinity for IRQ 11, 0
> [    0.526732] ioapic_set_affinity for IRQ 11, 0
> [    0.527330] ioapic_setup_msg_from_msi for IRQ11 target 0
> ioapic_mem_write ioapic mem write addr 0x0 regsel: 0x26 size 0x4 val 0x27
> ioapic_mem_write ioapic mem write addr 0x10 regsel: 0x27 size 0x4 val 0x0
> ioapic_mem_write ioapic mem write addr 0x0 regsel: 0x27 size 0x4 val 0x26
> ioapic_mem_write ioapic mem write addr 0x10 regsel: 0x26 size 0x4 val 0x18021
> [    0.527623] ioapic_set_affinity returns 0
> [    0.527623] ioapic_finish_move IRQ 11 calls unmask_ioapic_irq()
> ioapic_mem_write ioapic mem write addr 0x0 regsel: 0x26 size 0x4 val 0x26
> ioapic_mem_write ioapic mem write addr 0x10 regsel: 0x26 size 0x4 val 0x8021
> ioapic_set_remote_irr set remote irr for pin 11
> ioapic_service: trigger KVM IRQ 11
> ioapic_update_kvm_routes: update KVM route for IRQ 11: fee00000 8021
> [    0.529571] The affinity mask was 0 and the handler is on 2
> [    xenstore_watch path memory/target token FFFFFFFF92847D40
> 
> There are no other code paths in ioapic_mem_write() which need the KVM
> IRQ routing table to be updated, so just shift the call from the end
> of the function to happen right before the call to ioapic_service()
> and thus deliver the re-enabled IRQ to the right place.
> 
> Alternative fixes might have been just to remove the part in
> ioapic_service() which delivers the IRQ via kvm_set_irq() because
> surely delivering as MSI ought to work just fine anyway in all cases?
> That code lacks a comment justifying its existence.
> 
> Or maybe in the specific case shown in the above log, it would have
> sufficed for ioapic_update_kvm_routes() to update the route *even*
> when the IRQ is masked. It's not like it's actually going to get
> triggered unless QEMU deliberately does so, anyway? But that only
> works because the target CPU happens to be in the high word of the
> RTE; if something in the *low* word (vector, perhaps) was changed
> at the same time as the unmask, we'd still trigger with stale data.
> 
> Fixes: 15eafc2e602f "kvm: x86: add support for KVM_CAP_SPLIT_IRQCHIP"
> Signed-off-by: David Woodhouse <dwmw2@infradead.org>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> ---
>   hw/intc/ioapic.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/hw/intc/ioapic.c b/hw/intc/ioapic.c
> index 6364ecab1b..716ffc8bbb 100644
> --- a/hw/intc/ioapic.c
> +++ b/hw/intc/ioapic.c
> @@ -405,6 +405,7 @@ ioapic_mem_write(void *opaque, hwaddr addr, uint64_t val,
>                   s->ioredtbl[index] |= ro_bits;
>                   s->irq_eoi[index] = 0;
>                   ioapic_fix_edge_remote_irr(&s->ioredtbl[index]);
> +                ioapic_update_kvm_routes(s);
>                   ioapic_service(s);
>               }
>           }
> @@ -417,8 +418,6 @@ ioapic_mem_write(void *opaque, hwaddr addr, uint64_t val,
>           ioapic_eoi_broadcast(val);
>           break;
>       }
> -
> -    ioapic_update_kvm_routes(s);
>   }
>   
>   static const MemoryRegionOps ioapic_io_ops = {

Queued this one, thanks

Paolo


