Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2B53A6445
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 13:21:25 +0200 (CEST)
Received: from localhost ([::1]:34706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lskei-0000kc-S3
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 07:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lskar-0002HT-98
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 07:17:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lskYu-0002B5-No
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 07:17:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623669323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vglj3t5O0O9G9kpqRBBaaaeDAWBN7m5v7ELtwisrl5E=;
 b=WjNMsK2g0WG4pie/AWGxPvJag+aqNFFCpgaeNlp4brXhMbCN5Ds5dE3hpJwgFZNa0vdYyL
 KJ3bZ70/ynWQB4MFC9uyMgnqlVZ+Fdz51EQZMVU2WEo3wy1uFdWvhhCrn0+Z3YtKNgHLca
 /uqUk/LfR8Erkh3t1E6KITjlF8B/Xgg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-at6Jb_ZpMOiaVcV5tNVeig-1; Mon, 14 Jun 2021 07:15:22 -0400
X-MC-Unique: at6Jb_ZpMOiaVcV5tNVeig-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D4F51850605;
 Mon, 14 Jun 2021 11:15:21 +0000 (UTC)
Received: from localhost (ovpn-113-175.ams2.redhat.com [10.36.113.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63E3D60E3A;
 Mon, 14 Jun 2021 11:15:17 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [PATCH v2] s390x/css: Selectively copy sense data to IRB
In-Reply-To: <20210611202151.615410-1-farman@linux.ibm.com>
Organization: Red Hat GmbH
References: <20210611202151.615410-1-farman@linux.ibm.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Mon, 14 Jun 2021 13:15:15 +0200
Message-ID: <87sg1ky9x8.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 11 2021, Eric Farman <farman@linux.ibm.com> wrote:

> The SCHIB.PMCW.CSENSE bit is used to determine whether the
> IRB should be set up with sense data, but that bit only
> indicates whether sense data is requested, not if it was
> provided by the device. For virtual devices, this is fine.
>
> For passthrough devices, hardware would present sense data
> in IRB.ECW, but that field is only valid if IRB.SCSW.E and
> IRB.ERW.S were also set.

An important point is that IRB.ERW.S implies IRB.SCSW.E, I guess?

If I parse the table regarding the ecw in the POP correctly, we might
also have model-dependent information stored, in which case we would
need to indicate zero sense data in the erw that we build.

>
> Let's only build the sense data in the IRB if the first byte
> of sense is nonzero (indicating it may have come from a virtual
> device), or the IRB.SCSW.E bit is already set (indicating it
> came from the hardware). That way, the guest driver can read
> the sense data if valid, or respond with a Sense CCW to get
> the sense data if it wants/needs.

Hm, would it be possible that we get junk instead of proper sense data
from the hardware, if IRB.ERW.S is not set? E.g. some residual
data. That would potentially trigger the first condition.

Maybe we really need to special case virtual vs. passthrough devices
here. We can assume that a virtual device with a unit check always has
proper sense data available. For passthrough devices, maybe we need to
copy esw etc. from the irb we got hardware, and not try to construct it
ourselves?

>
> Fixes: df1fe5bb4924 ("s390: Virtual channel subsystem support.")
> Fixes: 334e76850bbb ("vfio/ccw: update sense data if a unit check is pending")
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
> ---
>
> Notes:
>     v1->v2:
>      - [MR] Add Fixes: tags
>      - [CH] Reinstate the memcpy(sch->sense_data, irb.ecw) in vfio_ccw
>      - [CH] Look at IRB.SCSW.E before copying sense into guest IRB
>     
>     v1: https://lore.kernel.org/qemu-devel/20210610202011.391029-1-farman@linux.ibm.com/
>
>  hw/s390x/css.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/hw/s390x/css.c b/hw/s390x/css.c
> index bed46f5ec3..8935f948d5 100644
> --- a/hw/s390x/css.c
> +++ b/hw/s390x/css.c
> @@ -1659,9 +1659,15 @@ int css_do_tsch_get_irb(SubchDev *sch, IRB *target_irb, int *irb_len)
>          } else {
>              irb.esw[0] = 0x00800000;
>          }
> -        /* If a unit check is pending, copy sense data. */
> +        /*
> +         * If a unit check is pending and concurrent sense
> +         * is requested, copy the sense data if the sense
> +         * data is plausibly valid.
> +         */
>          if ((schib->scsw.dstat & SCSW_DSTAT_UNIT_CHECK) &&
> -            (schib->pmcw.chars & PMCW_CHARS_MASK_CSENSE)) {
> +            (schib->pmcw.chars & PMCW_CHARS_MASK_CSENSE) &&
> +            ((schib->scsw.flags & SCSW_FLAGS_MASK_ECTL) ||
> +             (sch->sense_data[0] != 0))) {
>              int i;
>  
>              irb.scsw.flags |= SCSW_FLAGS_MASK_ESWF | SCSW_FLAGS_MASK_ECTL;
> -- 
> 2.25.1


