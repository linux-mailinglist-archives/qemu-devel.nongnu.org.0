Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B14172546
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 18:43:22 +0100 (CET)
Received: from localhost ([::1]:35600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7NBx-00074k-5S
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 12:43:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53536)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j7NB7-0006d3-30
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 12:42:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j7NB5-0003Gc-3m
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 12:42:28 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28402
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j7NB4-0003ER-UY
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 12:42:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582825345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+8XGG15wbDHKRRjs3PRZ1HsT3EsK19FTrlNsbzA/h0w=;
 b=RnvyHP2T1ZNUW24on/hwbNvj/smaTJzbnUmpSxXTSWqwBV70c4JKG9AbzL//IGb/Uw/3UG
 YPsepUR70DAZTiGgjP/hBbHcodigrN1/PZ8bBq8WuMr94oOnGie6TbVoUQDSTiKjcsJ7Db
 5u+s5TOCb6640hQfD+evxxSsXRptrh4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-ORe3IU0JOSaLdamymf0MfA-1; Thu, 27 Feb 2020 12:42:20 -0500
X-MC-Unique: ORe3IU0JOSaLdamymf0MfA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F72118C35AA
 for <qemu-devel@nongnu.org>; Thu, 27 Feb 2020 17:42:19 +0000 (UTC)
Received: from [10.36.116.59] (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 79D9D101D48A;
 Thu, 27 Feb 2020 17:42:11 +0000 (UTC)
Subject: Re: [PATCH v1.1 4/5] KVM: Kick resamplefd for split kernel irqchip
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20200227170048.236599-1-peterx@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <5e69c385-b27c-61d4-5856-21bcf5e9c8f5@redhat.com>
Date: Thu, 27 Feb 2020 18:42:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200227170048.236599-1-peterx@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 2/27/20 6:00 PM, Peter Xu wrote:
> This is majorly only for X86 because that's the only one that supports
> split irqchip for now.
> 
> When the irqchip is split, we face a dilemma that KVM irqfd will be
> enabled, however the slow irqchip is still running in the userspace.
> It means that the resamplefd in the kernel irqfds won't take any
> effect and it can miss to ack INTx interrupts on EOIs.
Won't it always fail to ack INTx? With the above sentence I understand
it can work sometimes?
> 
> One example is split irqchip with VFIO INTx, which will break if we
> use the VFIO INTx fast path.
> 
> This patch can potentially supports the VFIO fast path again for INTx,
> that the IRQ delivery will still use the fast path, while we don't
> need to trap MMIOs in QEMU for the device to emulate the EIOs (see the
> callers of vfio_eoi() hook).  However the EOI of the INTx will still
> need to be done from the userspace by caching all the resamplefds in
> QEMU and kick properly for IOAPIC EOI broadcast.
If I understand correctly this is a one way fast path? Fast path is on
the trigger side only: VFIO -> KVM but not on the deactivation side,
trapped by the userspace IOAPIC where you directly notify the UNMASK
eventfd from userspace. Is that correct?
> 
> When the userspace is responsible for the resamplefd kickup, don't
> register it on the kvm_irqfd anymore, because on newer kernels (after
> commit 654f1f13ea56, 5.2+) the KVM_IRQFD will fail if with both split
> irqchip and resamplefd.  This will make sure that the fast path will
> work for all supported kernels.
> 
> https://patchwork.kernel.org/patch/10738541/#22609933
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
> v1.1 changelog:
> - when resamplefd is going to be kicked from userspace, don't register
>   it again in KVM_IRQFD.  Tested against upstream kernel.
> 
>  accel/kvm/kvm-all.c    | 74 ++++++++++++++++++++++++++++++++++++++++--
>  accel/kvm/trace-events |  1 +
>  hw/intc/ioapic.c       | 11 +++++--
>  include/sysemu/kvm.h   |  4 +++
>  4 files changed, 86 insertions(+), 4 deletions(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index d49b74512a..b766b6e93c 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -159,9 +159,62 @@ static const KVMCapabilityInfo kvm_required_capabilites[] = {
>  static NotifierList kvm_irqchip_change_notifiers =
>      NOTIFIER_LIST_INITIALIZER(kvm_irqchip_change_notifiers);
>  
> +struct KVMResampleFd {
> +    int gsi;
> +    EventNotifier *resample_event;
> +    QLIST_ENTRY(KVMResampleFd) node;
> +};
> +typedef struct KVMResampleFd KVMResampleFd;
> +
> +/*
> + * Only used with split irqchip where we need to do the resample fd
> + * kick for the kernel from userspace.
> + */
> +static QLIST_HEAD(, KVMResampleFd) kvm_resample_fd_list =
> +    QLIST_HEAD_INITIALIZER(kvm_resample_fd_list);
> +
>  #define kvm_slots_lock(kml)      qemu_mutex_lock(&(kml)->slots_lock)
>  #define kvm_slots_unlock(kml)    qemu_mutex_unlock(&(kml)->slots_lock)
>  
> +static inline void kvm_resample_fd_remove(int gsi)
> +{
> +    KVMResampleFd *rfd;
> +
> +    QLIST_FOREACH(rfd, &kvm_resample_fd_list, node) {
> +        if (rfd->gsi == gsi) {
> +            QLIST_REMOVE(rfd, node);
> +            break;
> +        }
> +    }
> +}
> +
> +static inline void kvm_resample_fd_insert(int gsi, EventNotifier *event)
> +{
> +    KVMResampleFd *rfd = g_new0(KVMResampleFd, 1);
> +
> +    rfd->gsi = gsi;
> +    rfd->resample_event = event;
> +
> +    QLIST_INSERT_HEAD(&kvm_resample_fd_list, rfd, node);
> +}
> +
> +void kvm_resample_fd_notify(int gsi)
> +{
> +    KVMResampleFd *rfd;
> +
> +    if (!kvm_irqchip_is_split()) {
> +        return;
> +    }
> +
> +    QLIST_FOREACH(rfd, &kvm_resample_fd_list, node) {
> +        if (rfd->gsi == gsi) {
> +            event_notifier_set(rfd->resample_event);
> +            trace_kvm_resample_fd_notify(gsi);
> +            break;
> +        }
> +    }
> +}
> +
>  int kvm_get_max_memslots(void)
>  {
>      KVMState *s = KVM_STATE(current_accel());
> @@ -1642,8 +1695,25 @@ static int kvm_irqchip_assign_irqfd(KVMState *s, EventNotifier *event,
>      };
>  
>      if (rfd != -1) {
> -        irqfd.flags |= KVM_IRQFD_FLAG_RESAMPLE;
> -        irqfd.resamplefd = rfd;
> +        assert(assign);
> +        if (kvm_irqchip_is_split()) {
> +            /*
> +             * When the slow irqchip (e.g. IOAPIC) is in the
> +             * userspace, resamplefd will not work because the EOI of
> +             * the interrupt will be delivered to userspace instead,
s/delivered to userspace/handled in userspace
> +             * the KVM resample fd kick is skipped.  The userspace
> +             * needs to remember the resamplefd and kick it when we
> +             * receive EOI of this IRQ.
Practically we now talk about a VFIO ACTION_UNMASK classical eventfd
As such isn't it a bit weird to handle those normal UNMASK eventfds in
the KVM code?


> +             */
> +            kvm_resample_fd_insert(virq, resample);
> +        } else {
> +            irqfd.flags |= KVM_IRQFD_FLAG_RESAMPLE;
> +            irqfd.resamplefd = rfd;
> +        }
> +    } else if (!assign) {
> +        if (kvm_irqchip_is_split()) {
> +            kvm_resample_fd_remove(virq);
> +        }
>      }
>  
>      if (!kvm_irqfds_enabled()) {
> diff --git a/accel/kvm/trace-events b/accel/kvm/trace-events
> index 4fb6e59d19..a68eb66534 100644
> --- a/accel/kvm/trace-events
> +++ b/accel/kvm/trace-events
> @@ -16,4 +16,5 @@ kvm_set_ioeventfd_mmio(int fd, uint64_t addr, uint32_t val, bool assign, uint32_
>  kvm_set_ioeventfd_pio(int fd, uint16_t addr, uint32_t val, bool assign, uint32_t size, bool datamatch) "fd: %d @0x%x val=0x%x assign: %d size: %d match: %d"
>  kvm_set_user_memory(uint32_t slot, uint32_t flags, uint64_t guest_phys_addr, uint64_t memory_size, uint64_t userspace_addr, int ret) "Slot#%d flags=0x%x gpa=0x%"PRIx64 " size=0x%"PRIx64 " ua=0x%"PRIx64 " ret=%d"
>  kvm_clear_dirty_log(uint32_t slot, uint64_t start, uint32_t size) "slot#%"PRId32" start 0x%"PRIx64" size 0x%"PRIx32
> +kvm_resample_fd_notify(int gsi) "gsi %d"
>  
> diff --git a/hw/intc/ioapic.c b/hw/intc/ioapic.c
> index 15747fe2c2..8c75465c62 100644
> --- a/hw/intc/ioapic.c
> +++ b/hw/intc/ioapic.c
> @@ -236,8 +236,15 @@ void ioapic_eoi_broadcast(int vector)
>          for (n = 0; n < IOAPIC_NUM_PINS; n++) {
>              entry = s->ioredtbl[n];
>  
> -            if ((entry & IOAPIC_VECTOR_MASK) != vector ||
> -                ((entry >> IOAPIC_LVT_TRIGGER_MODE_SHIFT) & 1) != IOAPIC_TRIGGER_LEVEL) {
> +            if ((entry & IOAPIC_VECTOR_MASK) != vector) {
> +                continue;
> +            }
> +
> +            /* Kick resamplefd if KVM is bypassed */
> +            kvm_resample_fd_notify(n);
KVM is bypassed on the deactivation path but still we call
kvm_resample_fd_notify().
> +
> +            if (((entry >> IOAPIC_LVT_TRIGGER_MODE_SHIFT) & 1) !=
> +                IOAPIC_TRIGGER_LEVEL) {
>                  continue;
>              }
>  
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index 141342de98..b67552c047 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -555,4 +555,8 @@ int kvm_set_one_reg(CPUState *cs, uint64_t id, void *source);
>  int kvm_get_one_reg(CPUState *cs, uint64_t id, void *target);
>  struct ppc_radix_page_info *kvm_get_radix_page_info(void);
>  int kvm_get_max_memslots(void);
> +
> +/* Notify resamplefd for EOI of specific level triggered interrupts */
> +void kvm_resample_fd_notify(int gsi);
> +
>  #endif
> 
Thanks

Eric


