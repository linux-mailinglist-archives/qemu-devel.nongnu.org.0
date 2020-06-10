Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1611F50A9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jun 2020 10:58:46 +0200 (CEST)
Received: from localhost ([::1]:45592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiwZJ-0008Lk-CI
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 04:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1jiwYB-00073b-R8
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 04:57:35 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:35611
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1jiwYA-00017O-DD
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 04:57:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591779452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0C3IwQrjdul57CeGsZsGB61/Yv7641qRfURWZER/EZY=;
 b=fWAzhjaOJD04E9P2eJVRoV8Duur2c+Sz9i/3uo09QXkURx9CQ5yFhA80IF6suvmuwvnDAM
 6OBz7ZOJgBRUuxgzdEClPYu0mLhXCR5aXu/bnZ+Fy5cRW5JoCqp5fy8zwBzmlAYXGN95Ih
 MLLGxJ3lEu+33bE/sVvHSbXTQw+hkac=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-2K5MAeNJOf2sDtPJcMqoCg-1; Wed, 10 Jun 2020 04:57:30 -0400
X-MC-Unique: 2K5MAeNJOf2sDtPJcMqoCg-1
Received: by mail-wm1-f69.google.com with SMTP id h6so225860wmb.7
 for <qemu-devel@nongnu.org>; Wed, 10 Jun 2020 01:57:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0C3IwQrjdul57CeGsZsGB61/Yv7641qRfURWZER/EZY=;
 b=KWUzAa86SyMJPSTF9S1WMrzTMAaEW3ggHmoWZwHloioQ7A79Bw0SOaRZNco6SjzGVV
 5H1J9q3wHCRxtTlmpmIb0ZoWjLwL30uxkX8hq8rJAC2mMr3lI02LU4DOT7S12hal7ueq
 kAXD7XbUGNMnxedyN6VXvvwJFPjcJr/o+3qCjG73kMTb1De8iV50Wx6ZC4/09sQf3kDA
 gZGB0/aYophdFjTTihvSaIBUjkw5sDCWiM45dyWurJlrz0T+7WcdMuTXIgw9yh+62ogm
 hKgVwKNAfr2MYtx5rQ84NpfkYnCCuEllLOrJikJSk2ogZ4Ix555en3kUdxSYpHbqwxhc
 8SCg==
X-Gm-Message-State: AOAM532VpcwOLCo2GsGBDrr9/pKk6D8U8dopo0Ny5DK14HiKbDKV5ObM
 KuQLL8j77VBT7X4V8lFiTZ/T/RP7W+UkyW/sFQmQ7Z8BbeVjYx/KKQ5Si2JYOcQL7+Gap9lrD7F
 KwjMmxrbRmYt8P6Y=
X-Received: by 2002:adf:ce8d:: with SMTP id r13mr2581721wrn.178.1591779449238; 
 Wed, 10 Jun 2020 01:57:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyDYqFIoZDraFGJn3e5+Xrhza5ONlKoIQ5S9VriLjI5iucszh9mM//wUieriDWL6ajLTz5ZA==
X-Received: by 2002:adf:ce8d:: with SMTP id r13mr2581692wrn.178.1591779448978; 
 Wed, 10 Jun 2020 01:57:28 -0700 (PDT)
Received: from steredhat (host-79-49-207-108.retail.telecomitalia.it.
 [79.49.207.108])
 by smtp.gmail.com with ESMTPSA id j190sm6145478wmb.33.2020.06.10.01.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 01:57:28 -0700 (PDT)
Date: Wed, 10 Jun 2020 10:57:26 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2] virtio-pci: fix queue_enable write
Message-ID: <20200610085726.jerorykxbycoesyu@steredhat>
References: <20200610054351.15811-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200610054351.15811-1-jasowang@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 23:51:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 10, 2020 at 01:43:51PM +0800, Jason Wang wrote:
> Spec said: The driver uses this to selectively prevent the device from
> executing requests from this virtqueue. 1 - enabled; 0 - disabled.
> 
> Though write 0 to queue_enable is forbidden by the spec, we should not
> assume that the value is 1.
> 
> Fix this by ignore the write value other than 1.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
> Changes from V1:
> - fix typo
> - warn wrong value through virtio_error
> ---
>  hw/virtio/virtio-pci.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index d028c17c24..7bc8c1c056 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1273,16 +1273,20 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
>          virtio_queue_set_vector(vdev, vdev->queue_sel, val);
>          break;
>      case VIRTIO_PCI_COMMON_Q_ENABLE:
> -        virtio_queue_set_num(vdev, vdev->queue_sel,
> -                             proxy->vqs[vdev->queue_sel].num);
> -        virtio_queue_set_rings(vdev, vdev->queue_sel,
> +        if (val == 1) {

Does it have to be 1 or can it be any value other than 0?

Thanks,
Stefano

> +            virtio_queue_set_num(vdev, vdev->queue_sel,
> +                                 proxy->vqs[vdev->queue_sel].num);
> +            virtio_queue_set_rings(vdev, vdev->queue_sel,
>                         ((uint64_t)proxy->vqs[vdev->queue_sel].desc[1]) << 32 |
>                         proxy->vqs[vdev->queue_sel].desc[0],
>                         ((uint64_t)proxy->vqs[vdev->queue_sel].avail[1]) << 32 |
>                         proxy->vqs[vdev->queue_sel].avail[0],
>                         ((uint64_t)proxy->vqs[vdev->queue_sel].used[1]) << 32 |
>                         proxy->vqs[vdev->queue_sel].used[0]);
> -        proxy->vqs[vdev->queue_sel].enabled = 1;
> +            proxy->vqs[vdev->queue_sel].enabled = 1;
> +        } else {
> +            virtio_error(vdev, "wrong value for queue_enable %"PRIx64, val);
> +        }
>          break;
>      case VIRTIO_PCI_COMMON_Q_DESCLO:
>          proxy->vqs[vdev->queue_sel].desc[0] = val;
> -- 
> 2.20.1
> 
> 


