Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBB26AB300
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 23:37:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYwxw-0001U9-0X; Sun, 05 Mar 2023 17:36:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pYwxt-0001Tu-Vx
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 17:36:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pYwxr-0006TP-Gu
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 17:36:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678055782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uXWwAr4PCwmAc7WiBNnPqS66nlKOHwbTvhRSd8wGzVM=;
 b=SXSryFVs5pJzvFymHIBv7U+7+PGdnlV0Kq52mdYuPagkSTBr0U6H66MbZBtjRNBPpeeWaR
 TxTO4y/dwNTy4aQd33Ekh2s8EoNRkeVwGdHzrnmddzphwp+nsvUjmvNj5RNY3WrHemT2mI
 ZKQwbrK+QbNvnlCtnHS8h3UjvyrmqbY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-cfVHd9NtPb6bIRpjFGraew-1; Sun, 05 Mar 2023 17:36:20 -0500
X-MC-Unique: cfVHd9NtPb6bIRpjFGraew-1
Received: by mail-qv1-f71.google.com with SMTP id
 s18-20020a0cf792000000b00572c04240f1so4575260qvn.8
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 14:36:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678055780;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uXWwAr4PCwmAc7WiBNnPqS66nlKOHwbTvhRSd8wGzVM=;
 b=hiG4nOajsknl8iR2/Fwt7NWpS2/8/L5+fJN+snVdgwnavN91l7Qs/0zHrEOvN9N4z3
 hTwX2lGX3iIKpjVtF8PBerz3Fnti5ODfC13kABoOCC8Y6bVO1b/Y9v24k2Q+Q8kgiZfW
 w2K/Ywvj2t5Jj0xfkAKfMDUOOkgu1Se6sih5DPSnIDZYo4M2LO83AuQchhWtZ518wkIY
 U3HurlUhFIZyIDV5rZzUaMJWX1WVkpeMAIeIR0yU3KJ5ZDK1FuJ/F2Rzg5xiRR+Bcy/c
 BIghVGcOig6IP9TeecFWHqp9bjTze1BXOgGakKL5PCWn/XtnAw9GpwmwthaTsnXrD+R3
 CnMA==
X-Gm-Message-State: AO0yUKUSnaynPu+bAJg2tJKemWbDOIjRi55mKoih8HKCdtWAGnSpJRSy
 HEDzUobdW16Qn7Op6H/OqOCYG1JYTUL8zaOaHjuegLGMZNCu9Ahk0J8gxBxim6K5GkGK1R29B/B
 U3WD/xZJUqMig5VI=
X-Received: by 2002:ac8:5c90:0:b0:3bf:c93d:4a73 with SMTP id
 r16-20020ac85c90000000b003bfc93d4a73mr17295632qta.1.1678055780202; 
 Sun, 05 Mar 2023 14:36:20 -0800 (PST)
X-Google-Smtp-Source: AK7set/5ogKtFc+va8HvrUVA7DIiNFAsj6c9WCHDy+E/3wb3+U44a4kFrm1KrAyf4ZmWm0Pd2puxxA==
X-Received: by 2002:ac8:5c90:0:b0:3bf:c93d:4a73 with SMTP id
 r16-20020ac85c90000000b003bfc93d4a73mr17295611qta.1.1678055779919; 
 Sun, 05 Mar 2023 14:36:19 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 d82-20020a376855000000b007419eb86df0sm6243627qkc.127.2023.03.05.14.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 14:36:19 -0800 (PST)
Date: Sun, 5 Mar 2023 17:36:18 -0500
From: Peter Xu <peterx@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH] hw/intc/ioapic: Update KVM routes before redelivering
 IRQ, on RTE update
Message-ID: <ZAUZYkChWfwCcfSn@x1n>
References: <e1b97564a7728a5106134bc7063a8c62f134a45e.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e1b97564a7728a5106134bc7063a8c62f134a45e.camel@infradead.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sun, Mar 05, 2023 at 06:43:42PM +0000, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
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
> Fixes: 15eafc2e602f "kvm: x86: add support for KVM_CAP_SPLIT_IRQCHIP"
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Reviewed-by: Peter Xu <peterx@redhat.com>

> ---
> Alternative fixes might have been just to remove the part in
> ioapic_service() which delivers the IRQ via kvm_set_irq() because
> surely delivering as MSI ought to work just fine anyway in all cases?
> That code lacks a comment justifying its existence.

Didn't check all details, but AFAIU there're still some different paths
triggered so at least it looks still clean to use the path it's for.

E.g., I think if someone traces kvm_set_irq() in kernel this specific irq
triggered right after unmasking might seem to be missed misterously (but
actually it was not).

Thanks,

> 
> Or maybe in the specific case shown in the above log, it would have
> sufficed for ioapic_update_kvm_routes() to update the route *even*
> when the IRQ is masked. It's not like it's actually going to get
> triggered unless QEMU deliberately does so, anyway? But that only
> works because the target CPU happens to be in the high word of the
> RTE; if something in the *low* word (vector, perhaps) was changed
> at the same time as the unmask, we'd still trigger with stale data.

-- 
Peter Xu


