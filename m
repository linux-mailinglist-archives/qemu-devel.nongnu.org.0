Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8D4421287
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 17:20:14 +0200 (CEST)
Received: from localhost ([::1]:52754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXPlF-0005oj-Dd
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 11:20:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXPhk-0002sc-Ae
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 11:16:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXPhi-0002VR-Iu
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 11:16:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633360593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S3rJvRKfLV6INkxv+5dRvtmzOju1p7dDxs66Ih3U0SE=;
 b=NLypKrFsMQPnlp5cE6p1IChfaYoucKca3U+QoCS3qWWShxMKP09bXJY0DIXGdRF+T+WoMR
 r/im1FewWF+hepaqqBCLVvaE2reD54oUtpAgh1XAp+ANOZLf0DJ9R5wgTwOdSbS7nL3OXm
 wDBU8Bsh34uM2A3P3890qL+rB02tWBo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-i2UUEdUsNl2z9T4eKU24ag-1; Mon, 04 Oct 2021 11:16:29 -0400
X-MC-Unique: i2UUEdUsNl2z9T4eKU24ag-1
Received: by mail-ed1-f71.google.com with SMTP id
 u17-20020a50d511000000b003daa3828c13so17497936edi.12
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 08:16:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=S3rJvRKfLV6INkxv+5dRvtmzOju1p7dDxs66Ih3U0SE=;
 b=u5Y8ct6VyFpncyb6kZy37W6vvb/hKIzDaLWPBZGT2LM8CrcLfN93P4aJSGCi3C3H9i
 GgnyMBTH0ZQDeDFntGSeFw7u9S0jNoz6VY6ycDP89QPmE/S2LLvlftKHyJF6Z8hACdp9
 Z82kHm0wgL/r+ObmKoVD1Mc23U0qSnVdbgqmgAXrBBEHVeAovverpk20cj/YpdTyeuxB
 4MQIdUd/Tsce0BkGid90Iz1UVwKZq/qr+8A1rg+3g2rQYL60GSkIeURB8sBwx8KHZP1l
 LwH8khTx6GFt7cdy6znqkhQIzWyTvXsewO9u+MwyRSQ0Y3G8BdXGU0AQzSsI4GcJG+3/
 efnQ==
X-Gm-Message-State: AOAM532eIQ7nzJ4LWTYUIopaLFQ9ejKk+z7onjbgKpTut9cAi1/ES+ly
 CHHdrRj/K1gI0KzlMD4W2wzJ75q5IbgYhT4+0NcHzrLPbDGbyuCvlek1htoKPsl6cHkhIhG2Tlt
 9ZMYpvBybeWrUy20=
X-Received: by 2002:a50:9d0e:: with SMTP id v14mr19587501ede.230.1633360588548; 
 Mon, 04 Oct 2021 08:16:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAoU8sMR7CzhNRYOWtDe39gHjSNoNGyR1dACE1Z5d7hK0S4mXGRRB6ccUuyaZJ3wQ9K2KG/g==
X-Received: by 2002:a50:9d0e:: with SMTP id v14mr19587352ede.230.1633360587274; 
 Mon, 04 Oct 2021 08:16:27 -0700 (PDT)
Received: from redhat.com (93-172-224-64.bb.netvision.net.il. [93.172.224.64])
 by smtp.gmail.com with ESMTPSA id
 z4sm7552651edb.16.2021.10.04.08.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 08:16:26 -0700 (PDT)
Date: Mon, 4 Oct 2021 11:16:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Subject: Re: [PATCH v0 1/2] vhost-user-blk: add a new vhost-user-virtio-blk
 type
Message-ID: <20211004111133-mutt-send-email-mst@kernel.org>
References: <20211004150731.191270-1-den-plotnikov@yandex-team.ru>
 <20211004150731.191270-2-den-plotnikov@yandex-team.ru>
MIME-Version: 1.0
In-Reply-To: <20211004150731.191270-2-den-plotnikov@yandex-team.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, yc-core@yandex-team.ru, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, raphael.norwitz@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 04, 2021 at 06:07:30PM +0300, Denis Plotnikov wrote:
> Adding the new vhost-user-blk type instead of modifying the existing one
> is convenent. It ease to differ the new virtio-blk-compatible vhost-user-blk
> device from the existing non-compatible one using qemu machinery without any
> other modifiactions. That gives all the variety of qemu device related
> constraints out of box.

Convenient for the developer maybe, but isn't it confusing for the user?
I don't really understand this paragraph. E.g. what are the constraints
here?



> 
> Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
> ---
>  hw/block/vhost-user-blk.c          | 63 ++++++++++++++++++++++++++++++
>  include/hw/virtio/vhost-user-blk.h |  2 +
>  2 files changed, 65 insertions(+)
> 
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index ba13cb87e520..877fe54e891f 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -30,6 +30,7 @@
>  #include "hw/virtio/virtio-access.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/runstate.h"
> +#include "migration/qemu-file-types.h"
>  
>  #define REALIZE_CONNECTION_RETRIES 3
>  
> @@ -612,9 +613,71 @@ static const TypeInfo vhost_user_blk_info = {
>      .class_init = vhost_user_blk_class_init,
>  };
>  
> +/*
> + * this is the same as vmstate_virtio_blk
> + * we use it to allow virtio-blk <-> vhost-user-virtio-blk migration
> + */
> +static const VMStateDescription vmstate_vhost_user_virtio_blk = {
> +    .name = "virtio-blk",
> +    .minimum_version_id = 2,
> +    .version_id = 2,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_VIRTIO_DEVICE,
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
> +static void vhost_user_virtio_blk_save(VirtIODevice *vdev, QEMUFile *f)
> +{
> +    /*
> +     * put a zero byte in the stream to be compatible with virtio-blk
> +     */
> +    qemu_put_sbyte(f, 0);
> +}
> +
> +static int vhost_user_virtio_blk_load(VirtIODevice *vdev, QEMUFile *f,
> +                                      int version_id)
> +{
> +    if (qemu_get_sbyte(f)) {
> +        /*
> +         * on virtio-blk -> vhost-user-virtio-blk migration we don't expect
> +         * to get any infilght requests in the migration stream because
> +         * we can't load them yet.
> +         * TODO: consider putting those inflight requests to inflight region
> +         */
> +        error_report("%s: can't load in-flight requests",
> +                     TYPE_VHOST_USER_VIRTIO_BLK);
> +        return -EINVAL;
> +    }
> +
> +    return 0;
> +}
> +
> +static void vhost_user_virtio_blk_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
> +
> +    /* override vmstate of vhost_user_blk */
> +    dc->vmsd = &vmstate_vhost_user_virtio_blk;

So can't we do something like this in vhost_user_blk_class_init:

	if qemu >= 6.2
		dc->vmsd = &vmstate_vhost_user_virtio_blk;
	else
		dc->vmsd = &vmstate_vhost_user_blk

?

> +
> +    /* adding callbacks to be compatible with virtio-blk migration stream */
> +    vdc->save = vhost_user_virtio_blk_save;
> +    vdc->load = vhost_user_virtio_blk_load;
> +}
> +
> +static const TypeInfo vhost_user_virtio_blk_info = {
> +    .name = TYPE_VHOST_USER_VIRTIO_BLK,
> +    .parent = TYPE_VHOST_USER_BLK,
> +    .instance_size = sizeof(VHostUserBlk),
> +    /* instance_init is the same as in parent type */
> +    .class_init = vhost_user_virtio_blk_class_init,
> +};
> +
>  static void virtio_register_types(void)
>  {
>      type_register_static(&vhost_user_blk_info);
> +    type_register_static(&vhost_user_virtio_blk_info);
>  }
>  
>  type_init(virtio_register_types)
> diff --git a/include/hw/virtio/vhost-user-blk.h b/include/hw/virtio/vhost-user-blk.h
> index 7c91f15040eb..d81f18d22596 100644
> --- a/include/hw/virtio/vhost-user-blk.h
> +++ b/include/hw/virtio/vhost-user-blk.h
> @@ -23,6 +23,8 @@
>  #include "qom/object.h"
>  
>  #define TYPE_VHOST_USER_BLK "vhost-user-blk"
> +#define TYPE_VHOST_USER_VIRTIO_BLK "vhost-user-virtio-blk"
> +
>  OBJECT_DECLARE_SIMPLE_TYPE(VHostUserBlk, VHOST_USER_BLK)
>  
>  #define VHOST_USER_BLK_AUTO_NUM_QUEUES UINT16_MAX
> -- 
> 2.25.1


