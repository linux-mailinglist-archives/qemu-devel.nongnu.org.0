Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0DF3A3CCB
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 09:16:45 +0200 (CEST)
Received: from localhost ([::1]:48430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrbPI-0000FD-Ul
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 03:16:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lrbOO-0007tg-LZ
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 03:15:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lrbOM-0001OZ-Ie
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 03:15:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623395745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ntNDCQm7TWKfsHNURUhNgU2ikvZ/L0tsCKMJzR4QQoA=;
 b=bLgmCVj5BgTXEHHxQelE4bEgW6MWEun0m5O4bbW6LXlEkD+BNhsjylF+oRJrxnHeKhnfu8
 bL1YQPgghmZgJ58jTX65A3HOxpb88egSvFxF85Hl58cqSwpqJ77LtrPf/R5IfzyZbmqN72
 SCGKT1JyFfOcjBUUo2wT0R0dWuFn8t0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-oa-XITGENAibNmLbAHe9Fw-1; Fri, 11 Jun 2021 03:15:41 -0400
X-MC-Unique: oa-XITGENAibNmLbAHe9Fw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F096100C661;
 Fri, 11 Jun 2021 07:15:40 +0000 (UTC)
Received: from localhost (ovpn-113-95.ams2.redhat.com [10.36.113.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC7DF10016FC;
 Fri, 11 Jun 2021 07:15:31 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [PATCH 1/1] vfio-ccw: Keep passthrough sense data intact
In-Reply-To: <20210610202011.391029-2-farman@linux.ibm.com>
Organization: Red Hat GmbH
References: <20210610202011.391029-1-farman@linux.ibm.com>
 <20210610202011.391029-2-farman@linux.ibm.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Fri, 11 Jun 2021 09:15:30 +0200
Message-ID: <87lf7gzxbh.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10 2021, Eric Farman <farman@linux.ibm.com> wrote:

> For virtual devices, there is space for sense data to be built
> and later copied into the IRB's ECW space once a TSCH is handled.
>
> For passthrough devices, the IRB is passed up from hardware.
> There might already be sense data in the ECW, in which case it
> would be unusual to overwrite the IRB ESW/ECW data with itself.
>
> In either case, if there isn't sense data, then an explicit SENSE
> operation might be needed from the guest driver. Regardless,
> fabricating sense data out of zeros seems like it would result
> in unexpected behavior.
>
> Let's remove the copying of the ECW/sense data in the vfio-ccw
> driver, and adapt the check in the TSCH handler to look for
> non-zero data in the local sense data before building a sense
> data response in the IRB.
>
> This fixes a "dasdfmt -M quick" command issued within a guest.
>
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
> ---
>  hw/s390x/css.c | 3 ++-
>  hw/vfio/ccw.c  | 6 ------
>  2 files changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/hw/s390x/css.c b/hw/s390x/css.c
> index bed46f5ec3..29234daa27 100644
> --- a/hw/s390x/css.c
> +++ b/hw/s390x/css.c
> @@ -1661,7 +1661,8 @@ int css_do_tsch_get_irb(SubchDev *sch, IRB *target_irb, int *irb_len)
>          }
>          /* If a unit check is pending, copy sense data. */
>          if ((schib->scsw.dstat & SCSW_DSTAT_UNIT_CHECK) &&
> -            (schib->pmcw.chars & PMCW_CHARS_MASK_CSENSE)) {
> +            (schib->pmcw.chars & PMCW_CHARS_MASK_CSENSE) &&
> +            (sch->sense_data[0] != 0)) {
>              int i;
>  
>              irb.scsw.flags |= SCSW_FLAGS_MASK_ESWF | SCSW_FLAGS_MASK_ECTL;
> diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
> index 139a3d9d1b..a4dc4acb34 100644
> --- a/hw/vfio/ccw.c
> +++ b/hw/vfio/ccw.c
> @@ -371,12 +371,6 @@ static void vfio_ccw_io_notifier_handler(void *opaque)
>      copy_scsw_to_guest(&s, &irb.scsw);
>      schib->scsw = s;
>  
> -    /* If a uint check is pending, copy sense data. */
> -    if ((schib->scsw.dstat & SCSW_DSTAT_UNIT_CHECK) &&
> -        (schib->pmcw.chars & PMCW_CHARS_MASK_CSENSE)) {

If I'm reading the PoP correctly, turning on concurrent sense only means
that we may have sense data already available, but not that it's
guaranteed. Would it be enough to look at the relevant bit in the erw
and only copy sense data if it is actually set (here and/or above)?

> -        memcpy(sch->sense_data, irb.ecw, sizeof(irb.ecw));
> -    }
> -
>  read_err:
>      css_inject_io_interrupt(sch);
>  }


