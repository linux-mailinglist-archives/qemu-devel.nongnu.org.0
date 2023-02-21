Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7110A69DA78
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 06:41:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pULOP-0007P8-DB; Tue, 21 Feb 2023 00:40:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pULOG-0007Or-Vl
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 00:40:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pULOF-0002gV-Eg
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 00:40:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676958034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xhU90GNw6OZQxVjr6vg0gPZqUqSvGTjZ+hkuVjE7ZXg=;
 b=Dukt++ROhfsBmB81Ifw7yJN9kgE0hP5TI8SpAHALCfMklD5Zs4QQxTCcGqvwqzZWk91cCt
 x9y2hK0xnv40CpVkJ6gJEuqclZjQOaQtxTu9gaWmc5uiSOvxi64bIOJ0R22TC1YL3Bs6mw
 7Qqm4mmUpbfJCBMJdSpvQ1CPqj0ORKU=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-74-nOyV1Xa4MNWTJyGONBBqIw-1; Tue, 21 Feb 2023 00:40:32 -0500
X-MC-Unique: nOyV1Xa4MNWTJyGONBBqIw-1
Received: by mail-pl1-f197.google.com with SMTP id
 kn13-20020a170903078d00b0019c3296ecafso2402807plb.4
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 21:40:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xhU90GNw6OZQxVjr6vg0gPZqUqSvGTjZ+hkuVjE7ZXg=;
 b=guTfEMRqMdMJYgOkJuXw8wuyBxZ2FvkIaMEaPVAPjibFtNdB8jSTYao5VJjXmqNWBK
 5YqUxmflTotZZym7aVhS2VfxkYcQNzxnsQct1ggGMehqzTZhqR9JUrDmvocN58BFhYip
 dlhoAxws04hcdnKB3n0r4kwYhGre2DPxbhdjXCjQ9E61bFokifOsDfGlvqLjaLgvYeLv
 aKMtYsfFys/rx+au0/LAGvr0v8T4cZNNPCs0Y9ps2LuXUJRDvnSEBkP1YKwoMHlnrI2d
 Z5FtqZAvQbBzm9jO47AnDWW98RG/5Co1+S/BN4+u34m39ZnNgjykfe0AX3SPXsUXcEkj
 1+dA==
X-Gm-Message-State: AO0yUKVuNLxaHAgNLwfn8Nq4e4XBafSXjLGaQuStWkW8jjFO4c2HPjFk
 95Zrav0GCZUvbGeerxofLlR7iIaHnWclTspkgJ2hwv1ebocGxGXjr6JlvPjdMCUo21qY5Nbh3WC
 lIXsF4Hap2SskQeg=
X-Received: by 2002:a05:6a20:a026:b0:c7:2138:1011 with SMTP id
 p38-20020a056a20a02600b000c721381011mr2121253pzj.2.1676958031410; 
 Mon, 20 Feb 2023 21:40:31 -0800 (PST)
X-Google-Smtp-Source: AK7set/mBE8YsmwdzUWPJ03jLtGvc8GYsIvxkeQyn154JB4YkxwRzHNUZYhXxkeJD4Mqr4498hxFig==
X-Received: by 2002:a05:6a20:a026:b0:c7:2138:1011 with SMTP id
 p38-20020a056a20a02600b000c721381011mr2121217pzj.2.1676958031102; 
 Mon, 20 Feb 2023 21:40:31 -0800 (PST)
Received: from [10.72.12.235] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a63bf08000000b004fbb6200482sm333990pgf.41.2023.02.20.21.40.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 21:40:30 -0800 (PST)
Message-ID: <cbec89c4-6637-8ec2-20c1-1caa59e3849a@redhat.com>
Date: Tue, 21 Feb 2023 13:40:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 05/13] vdpa: rewind at get_base, not set_base
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 alvaro.karsz@solid-run.com, Zhu Lingshan <lingshan.zhu@intel.com>,
 Lei Yang <leiyang@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Shannon Nelson <snelson@pensando.io>, Parav Pandit <parav@mellanox.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org,
 Stefano Garzarella <sgarzare@redhat.com>, si-wei.liu@oracle.com
References: <20230208094253.702672-1-eperezma@redhat.com>
 <20230208094253.702672-6-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20230208094253.702672-6-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


在 2023/2/8 17:42, Eugenio Pérez 写道:
> At this moment it is only possible to migrate to a vdpa device running
> with x-svq=on. As a protective measure, the rewind of the inflight
> descriptors was done at the destination. That way if the source sent a
> virtqueue with inuse descriptors they are always discarded.
>
> Since this series allows to migrate also to passthrough devices with no
> SVQ, the right thing to do is to rewind at the source so the base of
> vrings are correct.
>
> Support for inflight descriptors may be added in the future.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>

Thanks


> ---
>   hw/virtio/vhost-vdpa.c | 24 +++++++++++++-----------
>   1 file changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 26e38a6aab..d99db0bd03 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -1211,18 +1211,7 @@ static int vhost_vdpa_set_vring_base(struct vhost_dev *dev,
>                                          struct vhost_vring_state *ring)
>   {
>       struct vhost_vdpa *v = dev->opaque;
> -    VirtQueue *vq = virtio_get_queue(dev->vdev, ring->index);
>   
> -    /*
> -     * vhost-vdpa devices does not support in-flight requests. Set all of them
> -     * as available.
> -     *
> -     * TODO: This is ok for networking, but other kinds of devices might
> -     * have problems with these retransmissions.
> -     */
> -    while (virtqueue_rewind(vq, 1)) {
> -        continue;
> -    }
>       if (v->shadow_vqs_enabled) {
>           /*
>            * Device vring base was set at device start. SVQ base is handled by
> @@ -1241,6 +1230,19 @@ static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
>       int ret;
>   
>       if (v->shadow_vqs_enabled) {
> +        VirtQueue *vq = virtio_get_queue(dev->vdev, ring->index);
> +
> +        /*
> +         * vhost-vdpa devices does not support in-flight requests. Set all of
> +         * them as available.
> +         *
> +         * TODO: This is ok for networking, but other kinds of devices might
> +         * have problems with these retransmissions.
> +         */
> +        while (virtqueue_rewind(vq, 1)) {
> +            continue;
> +        }
> +
>           ring->num = virtio_queue_get_last_avail_idx(dev->vdev, ring->index);
>           return 0;
>       }


