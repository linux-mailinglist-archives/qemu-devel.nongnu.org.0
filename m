Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 481A3695934
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 07:32:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRoqW-0003xU-Cn; Tue, 14 Feb 2023 01:31:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pRoqU-0003xC-2o
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 01:31:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pRoqS-0005t0-5t
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 01:31:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676356275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YpkrvpHcZkLy9iXzSCQbgGo5ommAhfg4uLlW3j4Hs8g=;
 b=Qsm2NThLmoNDGYqoonQK4Unswzft86EHLLSNa4lVBhMhzx0CrRCXOh2mUE8Uc7LNUdxn0H
 BtZ3YYgwua2SkRYDSNp1kQhXTm7AfywY4JSh7xNWxauoLYumEz9/hxrn4IgtJ7YIC/vxpy
 3/Fy0h//mMgFjMKSlUhvj1Bz3TSA0Wc=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-177-Fh2No-YzNRCk1lDp3ou8kg-1; Tue, 14 Feb 2023 01:31:13 -0500
X-MC-Unique: Fh2No-YzNRCk1lDp3ou8kg-1
Received: by mail-oi1-f197.google.com with SMTP id
 u9-20020a544389000000b00363be5d9f42so2920758oiv.15
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 22:31:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YpkrvpHcZkLy9iXzSCQbgGo5ommAhfg4uLlW3j4Hs8g=;
 b=2pzjfWRA5ZRpBklT+I805eos3kCHS8+5RsEKhNIeY+VZ8tnNzGRmXhNLgCybzXvJTc
 9tnQj02PpQRnQ6kVnMxp1o9WzN7xug/Rx4MukeS/byvzoEsYIzjQSJhAXvGQ9mpYzTi2
 w3pDnUZf7EH/LvXa1IIqDrrKXD8k/KwEerjvaYpJQMFKLI3OdTJofjgypWK+89AIKYBN
 QunXXJqYJin/gT+pdqW+GQZlE1FGT+j2+i1vx5q4s5HsB0BYO01s8DuddHMP+yfv6bH1
 2qQ7Wqt/OwpOCzmLdkYl+mQ6MB/gmy9ACcX/TNRAf0YuXsDU3MEk3EOpvFqRt7/3IQUX
 fKKA==
X-Gm-Message-State: AO0yUKXW+A3zdqNyS/mCeGDzPqtlwK8Mays7v7IDfgdxmudZ4QuweJPv
 pR6o3kN0h4SwLjeZ6Nw9kMM7x6zbZ2LVuupgPj3qOtOBe5B/arwE4BYlx9EWu7IGAuC+jycXUXG
 J4R2enlJD9kNX8Xdxa4HFv/2lbTUSu+w=
X-Received: by 2002:a05:6830:1107:b0:68d:a306:4550 with SMTP id
 w7-20020a056830110700b0068da3064550mr42845otq.91.1676356272095; 
 Mon, 13 Feb 2023 22:31:12 -0800 (PST)
X-Google-Smtp-Source: AK7set9sJXGyG8U7Igm3gRLZgWldbdL0uNagT/QzuTvhuqxwz1AZJrW/buy6Yufa0L06tB/Kgqej7d1P2FkJwpdfNpo=
X-Received: by 2002:a05:6830:1107:b0:68d:a306:4550 with SMTP id
 w7-20020a056830110700b0068da3064550mr42836otq.91.1676356271921; Mon, 13 Feb
 2023 22:31:11 -0800 (PST)
MIME-Version: 1.0
References: <20230213191929.1547497-1-eperezma@redhat.com>
In-Reply-To: <20230213191929.1547497-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 14 Feb 2023 14:31:00 +0800
Message-ID: <CACGkMEsQe=zcfmK=rMH=u6RgHkkBFs+tJO7gT0v_bWwJ_N+z6Q@mail.gmail.com>
Subject: Re: [PATCH] vhost: accept VIRTIO_F_ORDER_PLATFORM as a valid SVQ
 feature
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, Gautam Dawar <gdawar@xilinx.com>, 
 Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Cindy Lu <lulu@redhat.com>, 
 longpeng2@huawei.com, Eli Cohen <eli@mellanox.com>, alvaro.karsz@solid-run.com,
 Lei Yang <leiyang@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Feb 14, 2023 at 3:19 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> VIRTIO_F_ORDER_PLATFORM indicates that memory accesses by the driver and
> the device are ordered in a way described by the platform.  Since vDPA
> devices may be backed by a hardware devices, let's allow
> VIRTIO_F_ORDER_PLATFORM.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/virtio/vhost-shadow-virtqueue.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-=
virtqueue.c
> index 4307296358..6bb1998f12 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -34,6 +34,7 @@ bool vhost_svq_valid_features(uint64_t features, Error =
**errp)
>          switch (b) {
>          case VIRTIO_F_ANY_LAYOUT:
>          case VIRTIO_RING_F_EVENT_IDX:
> +        case VIRTIO_F_ORDER_PLATFORM:

Do we need to add this bit to vdpa_feature_bits[] as well?

Thanks

>              continue;
>
>          case VIRTIO_F_ACCESS_PLATFORM:
> --
> 2.31.1
>


