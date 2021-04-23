Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E4D369170
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 13:45:04 +0200 (CEST)
Received: from localhost ([::1]:51416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZuF5-0004cX-JT
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 07:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lZuDG-00048k-J2
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 07:43:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lZuDA-0004R9-Ap
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 07:43:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619178183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y+0OyCaxFL2j0gb0EGrpX16/O5YlTCPU5PWIfR0m3yI=;
 b=PFB3OMBr1WlTEME3+nn6tOcmloJAnmvF5KJDnIlb5xVTo5J4DYfV7iMLqjGjmdQrW6fsdz
 TmXj2kNHSFuXy4+GVF5/JZLKqRdE2MFr9EGvn21/boPKe3dk2APe9uXd/r6h/B21seHsZ7
 LznpZ4BNe2gceG8PoBGKbRulP0RQxn8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-B_aj2zSiNTqtOQDd7efv5g-1; Fri, 23 Apr 2021 07:43:00 -0400
X-MC-Unique: B_aj2zSiNTqtOQDd7efv5g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C6FA18397A5;
 Fri, 23 Apr 2021 11:42:59 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-167.ams2.redhat.com
 [10.36.113.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03F3C10023AC;
 Fri, 23 Apr 2021 11:42:54 +0000 (UTC)
Date: Fri, 23 Apr 2021 13:42:52 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: [PATCH v2] vfio-ccw: Permit missing IRQs
Message-ID: <20210423134252.264059e5.cohuck@redhat.com>
In-Reply-To: <20210421152053.2379873-1-farman@linux.ibm.com>
References: <20210421152053.2379873-1-farman@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 qemu-devel@nongnu.org, Matthew Rosato <mjrosato@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 21 Apr 2021 17:20:53 +0200
Eric Farman <farman@linux.ibm.com> wrote:

> Commit 690e29b91102 ("vfio-ccw: Refactor ccw irq handler") changed
> one of the checks for the IRQ notifier registration from saying
> "the host needs to recognize the only IRQ that exists" to saying
> "the host needs to recognize ANY IRQ that exists."
> 
> And this worked fine, because the subsequent change to support the
> CRW IRQ notifier doesn't get into this code when running on an older
> kernel, thanks to a guard by a capability region. The later addition
> of the REQ(uest) IRQ by commit b2f96f9e4f5f ("vfio-ccw: Connect the
> device request notifier") broke this assumption because there is no
> matching capability region. Thus, running new QEMU on an older
> kernel fails with:
> 
>   vfio: unexpected number of irqs 2
> 
> Let's adapt the message here so that there's a better clue of what
> IRQ is missing.
> 
> Furthermore, let's make the REQ(uest) IRQ not fail when attempting
> to register it, to permit running vfio-ccw on a newer QEMU with an
> older kernel.
> 
> Fixes: b2f96f9e4f5f ("vfio-ccw: Connect the device request notifier")
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
> ---
> 
> Notes:
>     v1->v2:
>      - Keep existing "invalid number of IRQs" message with adapted text [CH]
>      - Move the "is this an error" test to the registration of the IRQ in
>        question, rather than making it allowable for any IRQ mismatch [CH]
>      - Drop Fixes tag for initial commit [EF]
>     
>     v1: https://lore.kernel.org/qemu-devel/20210419184906.2847283-1-farman@linux.ibm.com/
> 
>  hw/vfio/ccw.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
> index b2df708e4b..400bc07fe2 100644
> --- a/hw/vfio/ccw.c
> +++ b/hw/vfio/ccw.c
> @@ -412,8 +412,8 @@ static void vfio_ccw_register_irq_notifier(VFIOCCWDevice *vcdev,
>      }
>  
>      if (vdev->num_irqs < irq + 1) {
> -        error_setg(errp, "vfio: unexpected number of irqs %u",
> -                   vdev->num_irqs);
> +        error_setg(errp, "vfio: IRQ %u not available (number of irqs %u)",
> +                   irq, vdev->num_irqs);
>          return;
>      }
>  
> @@ -696,13 +696,15 @@ static void vfio_ccw_realize(DeviceState *dev, Error **errp)
>  
>      vfio_ccw_register_irq_notifier(vcdev, VFIO_CCW_REQ_IRQ_INDEX, &err);
>      if (err) {
> -        goto out_req_notifier_err;
> +        /*
> +         * Report this error, but do not make it a failing condition.
> +         * Lack of this IRQ in the host does not prevent normal operation.
> +         */
> +        error_report_err(err);
>      }
>  
>      return;
>  
> -out_req_notifier_err:
> -    vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_CRW_IRQ_INDEX);
>  out_crw_notifier_err:
>      vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_IO_IRQ_INDEX);
>  out_io_notifier_err:

Patch looks good to me, but now I'm wondering: Is calling
vfio_ccw_unregister_irq_notifier() for an unregistered irq actually
safe? I think it is (our notifiers are always present, and we should
handle any ioctl failure gracefully), but worth a second look. In fact,
we already unregister the crw irq unconditionally, so we would likely
already have seen any problems for that one, so I assume all is good.


