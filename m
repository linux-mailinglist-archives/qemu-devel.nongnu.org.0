Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B443617EBC4
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 23:13:08 +0100 (CET)
Received: from localhost ([::1]:50592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBQe3-0004yQ-8g
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 18:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51695)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.williamson@redhat.com>) id 1jBQcG-0003g8-4N
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 18:11:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.williamson@redhat.com>) id 1jBQcE-000692-0b
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 18:11:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46121
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
 id 1jBQcD-00068P-SO
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 18:11:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583791872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vUDbQQ+O5V1qIpV6Jt8YTlr+PjTOYrH4ypGOvGl4ftQ=;
 b=BUfye7sKyvJN6uo9WFYHJmWdFxRjiSEDZO6nPNK/Dnk9FxajNafbYIIIXyw6WLd7rPiYli
 Dd7+2HpYTxKY1U+nyBXzy7997SfxtwoIsfOg+l7c+9m26Ymvx+Dk9VM7UhgAZ3/KVKlfIM
 VCXxrIeVG9GM5dru05QvrcxQE/Ki8Dg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-nI4Ov686MIueZDetMhedxw-1; Mon, 09 Mar 2020 18:11:09 -0400
X-MC-Unique: nI4Ov686MIueZDetMhedxw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10914107ACC9
 for <qemu-devel@nongnu.org>; Mon,  9 Mar 2020 22:11:08 +0000 (UTC)
Received: from w520.home (ovpn-116-28.phx2.redhat.com [10.3.116.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4C5D5C1C3;
 Mon,  9 Mar 2020 22:11:02 +0000 (UTC)
Date: Mon, 9 Mar 2020 16:10:59 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v2 4/5] KVM: Kick resamplefd for split kernel irqchip
Message-ID: <20200309161059.7c1cc49e@w520.home>
In-Reply-To: <20200228161503.382656-5-peterx@redhat.com>
References: <20200228161503.382656-1-peterx@redhat.com>
 <20200228161503.382656-5-peterx@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 28 Feb 2020 11:15:02 -0500
Peter Xu <peterx@redhat.com> wrote:

> This is majorly only for X86 because that's the only one that supports
> split irqchip for now.
> 
> When the irqchip is split, we face a dilemma that KVM irqfd will be
> enabled, however the slow irqchip is still running in the userspace.
> It means that the resamplefd in the kernel irqfds won't take any
> effect and it will miss to ack INTx interrupts on EOIs.
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
> 
> This is tricky because in this case the userspace ioapic irr &
> remote-irr will be bypassed.  However such a change will greatly boost
> performance for assigned devices using INTx irqs (TCP_RR boosts 46%
> after this patch applied).
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
>  accel/kvm/kvm-all.c    | 85 +++++++++++++++++++++++++++++++++++++++++-
>  accel/kvm/trace-events |  1 +
>  hw/intc/ioapic.c       | 23 +++++++++++-
>  include/sysemu/kvm.h   |  7 ++++
>  4 files changed, 112 insertions(+), 4 deletions(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index d49b74512a..89771ea114 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -159,9 +159,65 @@ static const KVMCapabilityInfo kvm_required_capabilites[] = {
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
> +            g_free(rfd);
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
> +bool kvm_resample_fd_notify(int gsi)
> +{
> +    KVMResampleFd *rfd;
> +
> +    if (!kvm_irqchip_is_split()) {
> +        return false;
> +    }
> +
> +    QLIST_FOREACH(rfd, &kvm_resample_fd_list, node) {
> +        if (rfd->gsi == gsi) {
> +            event_notifier_set(rfd->resample_event);
> +            trace_kvm_resample_fd_notify(gsi);
> +            return true;
> +        }
> +    }
> +
> +    return false;
> +}
> +
>  int kvm_get_max_memslots(void)
>  {
>      KVMState *s = KVM_STATE(current_accel());
[snip]  
> diff --git a/hw/intc/ioapic.c b/hw/intc/ioapic.c
> index 15747fe2c2..13921b333d 100644
> --- a/hw/intc/ioapic.c
> +++ b/hw/intc/ioapic.c
> @@ -236,8 +236,27 @@ void ioapic_eoi_broadcast(int vector)
>          for (n = 0; n < IOAPIC_NUM_PINS; n++) {
>              entry = s->ioredtbl[n];
>  
> -            if ((entry & IOAPIC_VECTOR_MASK) != vector ||
> -                ((entry >> IOAPIC_LVT_TRIGGER_MODE_SHIFT) & 1) != IOAPIC_TRIGGER_LEVEL) {
> +            if ((entry & IOAPIC_VECTOR_MASK) != vector) {
> +                continue;
> +            }
> +
> +            /*
> +             * When IOAPIC is in the userspace while APIC is still in
> +             * the kernel (i.e., split irqchip), we have a trick to
> +             * kick the resamplefd logic for registered irqfds from
> +             * userspace to deactivate the IRQ.  When that happens, it
> +             * means the irq bypassed userspace IOAPIC (so the irr and
> +             * remote-irr of the table entry should be bypassed too
> +             * even if interrupt come), then we don't need to clear
> +             * the remote-IRR and check irr again because they'll
> +             * always be zeros.
> +             */
> +            if (kvm_resample_fd_notify(n)) {
> +                continue;
> +            }

It seems the problem I reported is here.  In my configuration virtio-blk
and an assigned e1000e share an interrupt.  virtio-blk is initializing
and apparently triggers an interrupt.  The vfio-pci device is
configured for INTx though not active yet, but kvm_resample_fd_notify()
kicks the fd here, so we continue.  If I remove the continue here both
devices seem to work, but I don't claim to understand the condition
we're trying to continue for here yet.  This series needs more testing
with shared interrupts.  Thanks,

Alex


