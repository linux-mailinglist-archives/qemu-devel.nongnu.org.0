Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BDF3668CB
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 12:04:24 +0200 (CEST)
Received: from localhost ([::1]:50854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ9iY-000569-W9
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 06:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lZ9gT-0004Lv-NQ
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 06:02:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lZ9gG-0006P8-4a
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 06:02:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618999317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JrEu1NKHVr6LjijDqLxfzYJzf0drLT+8NODwm70EHFU=;
 b=VnL3SBjeT7WXxGb9wN+nulMSc0xwjRszlF/M+q4sbwaVwdI9p+hjSS7iG4QMUdh/HbQlus
 bgsQK26rPkyphx0ZFo2CECwkGu1N2jKHTHvjLS/d3EXpdiBd26VWxmgYLuRzg7EzB2xnAk
 /M3JajTlgWkPNBaWHughgq8QsZYKdeo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-g9tYQNpfMrCB1U-DEspX9A-1; Wed, 21 Apr 2021 06:01:55 -0400
X-MC-Unique: g9tYQNpfMrCB1U-DEspX9A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B551384BA52;
 Wed, 21 Apr 2021 10:01:54 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-112-160.ams2.redhat.com
 [10.36.112.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFCB85D9C0;
 Wed, 21 Apr 2021 10:01:49 +0000 (UTC)
Date: Wed, 21 Apr 2021 12:01:46 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: [RFC PATCH] vfio-ccw: Permit missing IRQs
Message-ID: <20210421120146.46572f86.cohuck@redhat.com>
In-Reply-To: <20210419184906.2847283-1-farman@linux.ibm.com>
References: <20210419184906.2847283-1-farman@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-s390x@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 qemu-devel@nongnu.org, Matthew Rosato <mjrosato@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Apr 2021 20:49:06 +0200
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
> Let's simply remove the check (and the less-than-helpful message),
> and make the VFIO_DEVICE_GET_IRQ_INFO ioctl request for the IRQ
> being processed. If it returns with EINVAL, we can treat it as
> an unfortunate mismatch but not a fatal error for the guest.
> 
> Fixes: 690e29b91102 ("vfio-ccw: Refactor ccw irq handler")
> Fixes: b2f96f9e4f5f ("vfio-ccw: Connect the device request notifier")
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
> ---
>  hw/vfio/ccw.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
> index b2df708e4b..cfbfc3d1a2 100644
> --- a/hw/vfio/ccw.c
> +++ b/hw/vfio/ccw.c
> @@ -411,20 +411,19 @@ static void vfio_ccw_register_irq_notifier(VFIOCCWDevice *vcdev,
>          return;
>      }
>  
> -    if (vdev->num_irqs < irq + 1) {
> -        error_setg(errp, "vfio: unexpected number of irqs %u",
> -                   vdev->num_irqs);

Alternative proposal: Change this message to

"vfio: IRQ %u not available (number of irqs %u)"

and still fail this function, while treating a failure of
vfio_ccw_register_irq_notifier(vcdev, VFIO_CCW_REQ_IRQ_INDEX, &err); in
vfio_ccw_realize() as a non-fatal error (maybe log a message).

This allows us to skip doing an ioctl call, of which we already know
that it would fail. Still, we can catch cases where a broken kernel e.g.
provides the crw region, but not the matching irq (I believe something
like that should indeed be a fatal error.)

> -        return;
> -    }
> -
>      argsz = sizeof(*irq_info);
>      irq_info = g_malloc0(argsz);
>      irq_info->index = irq;
>      irq_info->argsz = argsz;
>      if (ioctl(vdev->fd, VFIO_DEVICE_GET_IRQ_INFO,
>                irq_info) < 0 || irq_info->count < 1) {
> -        error_setg_errno(errp, errno, "vfio: Error getting irq info");
> -        goto out_free_info;
> +        if (errno == EINVAL) {
> +            warn_report("Unable to get information about IRQ %u", irq);
> +            goto out_free_info;
> +        } else {
> +            error_setg_errno(errp, errno, "vfio: Error getting irq info");
> +            goto out_free_info;
> +        }
>      }
>  
>      if (event_notifier_init(notifier, 0)) {


