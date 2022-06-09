Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3922F544E8F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 16:18:34 +0200 (CEST)
Received: from localhost ([::1]:52848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzIzX-0008Oh-VP
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 10:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nzHBZ-0005HU-2f
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 08:22:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nzHBW-0006zv-6h
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 08:22:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654777365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wl/djausEhOtuoQoTTWpa7r4GRYtWBpbw6DGvHJ9jgg=;
 b=RE1ORZ9dBqM5EC9KljqpVFIAfLiweC3D5v76LC/Kjlft8phB7f7XJ4Twy7zKiWcbZ2ku58
 gHPdMYDjLR9CL0JZwm9YgUM3vb/++4LBWmMSUKHuOo2ih6drhzwe88ZnP8S7chRMK2sR4M
 ToA6tChkDfhcD0hFX6PzlWSeu7QHfVo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-Dk0oOYjOOuOc57v-AqZ_dg-1; Thu, 09 Jun 2022 08:22:42 -0400
X-MC-Unique: Dk0oOYjOOuOc57v-AqZ_dg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7621397968E
 for <qemu-devel@nongnu.org>; Thu,  9 Jun 2022 12:22:41 +0000 (UTC)
Received: from localhost (unknown [10.39.192.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CA5D456CD9;
 Thu,  9 Jun 2022 12:22:41 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, thuth@redhat.com
Subject: Re: [PATCH 4/4] virtio-mmio: cleanup reset
In-Reply-To: <20220609091534.1416909-5-pbonzini@redhat.com>
Organization: Red Hat GmbH
References: <20220609091534.1416909-1-pbonzini@redhat.com>
 <20220609091534.1416909-5-pbonzini@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Thu, 09 Jun 2022 14:22:40 +0200
Message-ID: <87ilpa9gbz.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 09 2022, Paolo Bonzini <pbonzini@redhat.com> wrote:

> Make virtio_mmio_soft_reset reset the virtio device, which is performed by
> both the "soft" and the "hard" reset; and then call virtio_mmio_soft_reset
> from virtio_mmio_reset to emphasize that the latter is a superset of the
> former.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/virtio/virtio-mmio.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
> index 6d81a26473..d240efef97 100644
> --- a/hw/virtio/virtio-mmio.c
> +++ b/hw/virtio/virtio-mmio.c
> @@ -72,12 +72,12 @@ static void virtio_mmio_soft_reset(VirtIOMMIOProxy *proxy)
>  {
>      int i;
>  
> -    if (proxy->legacy) {
> -        return;
> -    }
> +    virtio_bus_reset(&proxy->bus);
>  
> -    for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
> -        proxy->vqs[i].enabled = 0;
> +    if (!proxy->legacy) {
> +        for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
> +            proxy->vqs[i].enabled = 0;
> +        }
>      }
>  }

The more I look at this, the more confused I get.

The current code calls soft_reset when the driver sets the status to 0,
after already having called virtio_reset(). But doesn't virtio_reset()
ultimately already trigger the virtio-mmio reset routine, which sets
enabled to 0 for all queues? Why do that again? (And why is soft_reset a
"soft reset"?)

Maybe I'm missing something obvious, or it is simply -ENOCOFFEE on my side.

>  
> @@ -376,7 +376,7 @@ static void virtio_mmio_write(void *opaque, hwaddr offset, uint64_t value,
>              return;
>          }
>          if (value == 0) {
> -            virtio_bus_reset(&vdev->bus);
> +            virtio_mmio_soft_reset(proxy);
>          } else {
>              virtio_queue_set_addr(vdev, vdev->queue_sel,
>                                    value << proxy->guest_page_shift);
> @@ -432,7 +432,6 @@ static void virtio_mmio_write(void *opaque, hwaddr offset, uint64_t value,
>          }
>  
>          if (vdev->status == 0) {
> -            virtio_reset(vdev);
>              virtio_mmio_soft_reset(proxy);
>          }
>          break;
> @@ -627,7 +626,8 @@ static void virtio_mmio_reset(DeviceState *d)
>      VirtIOMMIOProxy *proxy = VIRTIO_MMIO(d);
>      int i;
>  
> -    virtio_bus_reset(&proxy->bus);
> +    virtio_mmio_soft_reset(proxy);
> +
>      proxy->host_features_sel = 0;
>      proxy->guest_features_sel = 0;
>      proxy->guest_page_shift = 0;
> @@ -636,7 +636,6 @@ static void virtio_mmio_reset(DeviceState *d)
>          proxy->guest_features[0] = proxy->guest_features[1] = 0;
>  
>          for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
> -            proxy->vqs[i].enabled = 0;
>              proxy->vqs[i].num = 0;
>              proxy->vqs[i].desc[0] = proxy->vqs[i].desc[1] = 0;
>              proxy->vqs[i].avail[0] = proxy->vqs[i].avail[1] = 0;


