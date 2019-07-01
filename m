Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D875209F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 04:30:25 +0200 (CEST)
Received: from localhost ([::1]:55952 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfbE0-0000a7-8M
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 22:30:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54549)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peterx@redhat.com>) id 1hfbD8-00008S-Qh
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 22:29:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1hfbD7-0000wy-Sx
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 22:29:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56018)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1hfbD7-0000w4-N6
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 22:29:29 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DD5B93086202;
 Tue, 25 Jun 2019 02:29:27 +0000 (UTC)
Received: from xz-x1 (unknown [10.66.60.185])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B1B0E60BE2;
 Tue, 25 Jun 2019 02:29:22 +0000 (UTC)
Date: Tue, 25 Jun 2019 10:29:20 +0800
From: Peter Xu <peterx@redhat.com>
To: Li Qiang <liq3ea@163.com>
Message-ID: <20190625022920.GA9750@xz-x1>
References: <20190624151635.22494-1-liq3ea@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190624151635.22494-1-liq3ea@163.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Tue, 25 Jun 2019 02:29:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] ioapic: clear irq_eoi when updating the
 ioapic redirect table entry
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
Cc: pbonzini@redhat.com, liq3ea@gmail.com, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 24, 2019 at 08:16:35AM -0700, Li Qiang wrote:
> irq_eoi is used to count the number of irq injected during eoi
> broadcast. It should be set to 0 when updating the ioapic's redirect
> table entry.
> 
> Suggested-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: Li Qiang <liq3ea@163.com>
> ---
>  hw/intc/ioapic.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/intc/ioapic.c b/hw/intc/ioapic.c
> index 7074489fdf..db9e518602 100644
> --- a/hw/intc/ioapic.c
> +++ b/hw/intc/ioapic.c
> @@ -380,6 +380,7 @@ ioapic_mem_write(void *opaque, hwaddr addr, uint64_t val,
>                  /* restore RO bits */
>                  s->ioredtbl[index] &= IOAPIC_RW_BITS;
>                  s->ioredtbl[index] |= ro_bits;
> +                s->irq_eoi[index] = 0;

It'll be cleared for twice for each ioapic entry because it only
supports 32bit write to these registers.  Though it seems fine, e.g.,
when the guest only want to update the vector info we should still
clear it:

Reviewed-by: Peter Xu <peterx@redhat.com>

>                  ioapic_fix_edge_remote_irr(&s->ioredtbl[index]);
>                  ioapic_service(s);
>              }
> -- 
> 2.17.1
> 
> 

Regards,

-- 
Peter Xu

