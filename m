Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3BC36D5DD
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 12:38:22 +0200 (CEST)
Received: from localhost ([::1]:45608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbhaH-0008BN-N5
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 06:38:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lbhZK-0007lH-C7
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 06:37:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lbhZH-0007XB-OI
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 06:37:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619606239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TDqZglnospdYeWYlY4rc9oaa0XX6zoclC3sI4eobB3k=;
 b=KxgHgVpGcFwH2ZXEe/3ELWsRrl98e7iOzROQgacSynoQrnC7iH5MlzA3Vf7idNN2CpdKmr
 mfKrrlVc9xO6Eth24IgqY3AXckrlGhrt0swC+L/DkF0MxV7kDz3OXnf/DXDOoQrzPfIgLA
 uG/OBiwokv9O7oSylevH9MxwcvHnkkY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-SqYMU61tOA2X52FaIMYYNQ-1; Wed, 28 Apr 2021 06:37:17 -0400
X-MC-Unique: SqYMU61tOA2X52FaIMYYNQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02E841966326;
 Wed, 28 Apr 2021 10:37:16 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-113.ams2.redhat.com
 [10.36.113.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7F9D1001901;
 Wed, 28 Apr 2021 10:37:14 +0000 (UTC)
Date: Wed, 28 Apr 2021 12:37:12 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: [PATCH] vfio-ccw: Attempt to clean up all IRQs on error
Message-ID: <20210428123712.49f49156.cohuck@redhat.com>
In-Reply-To: <20210427142511.2125733-1-farman@linux.ibm.com>
References: <20210427142511.2125733-1-farman@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Matthew Rosato <mjrosato@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Apr 2021 16:25:11 +0200
Eric Farman <farman@linux.ibm.com> wrote:

> The vfio_ccw_unrealize() routine makes an unconditional attempt to
> unregister every IRQ notifier, though they may not have been registered
> in the first place (when running on an older kernel, for example).
> 
> Let's mirror this behavior in the error cleanups in vfio_ccw_realize()
> so that if/when new IRQs are added, it is less confusing to recognize
> the necessary procedures. The worst case scenario would be some extra
> messages about an undefined IRQ, but since this is an error exit that
> won't be the only thing to worry about.

I'm wondering whether we should downgrade the moan during unregister
from error to warn; the code deals with it gracefully, and we're not
losing any functionality.

Patch looks good.

> 
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
> ---
>  hw/vfio/ccw.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
> index 400bc07fe2..169438c3b8 100644
> --- a/hw/vfio/ccw.c
> +++ b/hw/vfio/ccw.c
> @@ -690,7 +690,7 @@ static void vfio_ccw_realize(DeviceState *dev, Error **errp)
>      if (vcdev->crw_region) {
>          vfio_ccw_register_irq_notifier(vcdev, VFIO_CCW_CRW_IRQ_INDEX, &err);
>          if (err) {
> -            goto out_crw_notifier_err;
> +            goto out_irq_notifier_err;
>          }
>      }
>  
> @@ -705,7 +705,9 @@ static void vfio_ccw_realize(DeviceState *dev, Error **errp)
>  
>      return;
>  
> -out_crw_notifier_err:
> +out_irq_notifier_err:
> +    vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_REQ_IRQ_INDEX);
> +    vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_CRW_IRQ_INDEX);
>      vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_IO_IRQ_INDEX);
>  out_io_notifier_err:
>      vfio_ccw_put_region(vcdev);


