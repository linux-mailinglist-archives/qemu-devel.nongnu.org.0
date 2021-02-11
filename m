Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9110731866B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 09:46:47 +0100 (CET)
Received: from localhost ([::1]:37514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA7cc-0003ul-3O
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 03:46:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lA7aF-0003Er-T1
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 03:44:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lA7aD-0001bf-Kv
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 03:44:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613033056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XKZV6OL/V/U40Xi1xZxHzs4LLi9AAfnPWWOMjzBlXaI=;
 b=V1YSGWXemgtwl4JuKEGZcnWcRaj97KXJFhMLeb/cbjjd5WgK2FYG6XPt4mNfA+50WxJd6w
 lXT5B4MRZ5WHtd5m+3xYRwBnkezbTIM7CUJAq7Ymeo/xgudewh1MUMgn8cr7AgPsqR88ef
 J3Pny7AjabrPESGzy8AVDYSqrsC5++0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-ixQ0HTxGN62dZ6hN6qioWQ-1; Thu, 11 Feb 2021 03:44:14 -0500
X-MC-Unique: ixQ0HTxGN62dZ6hN6qioWQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DCA2874980;
 Thu, 11 Feb 2021 08:44:13 +0000 (UTC)
Received: from gondolin (ovpn-112-229.ams2.redhat.com [10.36.112.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C79C71001E73;
 Thu, 11 Feb 2021 08:44:08 +0000 (UTC)
Date: Thu, 11 Feb 2021 09:44:06 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Subject: Re: [PATCH] virtio: disable ioeventfd for record/replay
Message-ID: <20210211094406.664520e6.cohuck@redhat.com>
In-Reply-To: <161303249335.948571.16873882207700527766.stgit@pasha-ThinkPad-X280>
References: <161303249335.948571.16873882207700527766.stgit@pasha-ThinkPad-X280>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Feb 2021 11:34:53 +0300
Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> wrote:

> virtio devices support separate iothreads waiting for
> events from file descriptors. These are asynchronous
> events that can't be recorded and replayed, therefore
> this patch disables ioeventfd for all devices when
> record or replay is enabled.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>  hw/virtio/virtio-pci.c |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 094c36aa3e..76fbc111ea 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -37,6 +37,7 @@
>  #include "qemu/range.h"
>  #include "hw/virtio/virtio-bus.h"
>  #include "qapi/visitor.h"
> +#include "sysemu/replay.h"
>  
>  #define VIRTIO_PCI_REGION_SIZE(dev)     VIRTIO_PCI_CONFIG_OFF(msix_present(dev))
>  
> @@ -1746,6 +1747,11 @@ static void virtio_pci_realize(PCIDevice *pci_dev, Error **errp)
>          proxy->flags &= ~VIRTIO_PCI_FLAG_USE_IOEVENTFD;
>      }
>  
> +    /* fd-based ioevents can't be synchronized in record/replay */
> +    if (replay_mode != REPLAY_MODE_NONE) {
> +        proxy->flags &= ~VIRTIO_PCI_FLAG_USE_IOEVENTFD;
> +    }
> +
>      /*
>       * virtio pci bar layout used by default.
>       * subclasses can re-arrange things if needed.
> 
> 

I think you would need to do the same for any device using ioeventfd,
no?


