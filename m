Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45977577AA2
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 07:50:03 +0200 (CEST)
Received: from localhost ([::1]:48456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDJdq-0003m4-GJ
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 01:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDJcD-0002PE-TZ
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 01:48:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDJcB-0001PD-4N
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 01:48:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658123297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K4lJjkt4Z9X2W1J6BZoIauIzAvqwMwXf8ErOlZcVabw=;
 b=fqDjUYIQpOi1AfxTZzQx+JGEoH2rbeUaHYpcn0qtUL7mr7DuybkM3Du8V9CjEWn5Zs6hnR
 TApCajjem0GWw6wdBy0j8C7JIhlUrPk5kv45kFp9/X78DkCEPLN7imqgRDFHKZXK4rtIqP
 EI5ccO2vbILPSGIA9LbdEU+GoVGI3X0=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-bP6vujTBOmGFCpMHHNUXmQ-1; Mon, 18 Jul 2022 01:48:16 -0400
X-MC-Unique: bP6vujTBOmGFCpMHHNUXmQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 h37-20020a0565123ca500b004889ff5f804so3897890lfv.19
 for <qemu-devel@nongnu.org>; Sun, 17 Jul 2022 22:48:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=K4lJjkt4Z9X2W1J6BZoIauIzAvqwMwXf8ErOlZcVabw=;
 b=6roFoSIjSnc0drLY1Z6ZYs3c2kBFa5BR6+RVgrXXGfyyATu+kviyVwsQ36lq6kv958
 /0PXThRl4bFWcMk0Z85LlA+S025Qkkf6cyXNKMYcNrSgKBMDgLvnDIbrJFwg5YCCMY4b
 ryK5E5fOoPh987nLwpUdppKMxvf1uzz0X+JbKrWKeRW+b4XkioKSLuRNGk2veN8P99m5
 yhZKqD0Goi+nvc5ACz8v9oOinfFcYtOcoMvpP+sKX738y7tpzALfzoHits8hZHy0LNjd
 TJkzga/LXsKi/1zeNJUJGjnAirguEZtAur4isIgWSc+oqhIKVXM6oP4+Xu5YXo9D48FQ
 vgrA==
X-Gm-Message-State: AJIora/jgCVtPIMVqXBVZ8L2yyihop9nRmx/A8tgNcRP83PRzKKYawtQ
 POeMwfZaomeIp3iRvjwKSasE+34XcK04v6ha0yk45DOtgKcelYl1y876NR87FpcLNUe4jhIsoqJ
 07kCz6bCb6YwxCb84klQcn2upJWXwDvY=
X-Received: by 2002:a05:6512:3d8a:b0:489:c93c:5970 with SMTP id
 k10-20020a0565123d8a00b00489c93c5970mr14238527lfv.575.1658123294904; 
 Sun, 17 Jul 2022 22:48:14 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uBMbvSN3XXTRRo+sFfw4cOIqvVM6VszVcwoDBSoQTX9HBKVfHnCQULvIH3D85GBtUwRwaME9U3JNiBPZ0srvY=
X-Received: by 2002:a05:6512:3d8a:b0:489:c93c:5970 with SMTP id
 k10-20020a0565123d8a00b00489c93c5970mr14238506lfv.575.1658123294657; Sun, 17
 Jul 2022 22:48:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220716113407.2730331-1-eperezma@redhat.com>
 <20220716113407.2730331-2-eperezma@redhat.com>
In-Reply-To: <20220716113407.2730331-2-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 18 Jul 2022 13:48:03 +0800
Message-ID: <CACGkMEt_85xpsJiUTAu8kny4nEVJqHmBJzK2y5Zp5G_oUgXiFw@mail.gmail.com>
Subject: Re: [RFC PATCH 01/12] vhost: Get vring base from vq, not svq
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eli Cohen <eli@mellanox.com>, 
 Parav Pandit <parav@mellanox.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Gautam Dawar <gdawar@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Sat, Jul 16, 2022 at 7:34 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> The SVQ vring used idx usually match with the guest visible one, as long
> as all the guest buffers (GPA) maps to exactly one buffer within qemu's
> VA. However, as we can see in virtqueue_map_desc, a single guest buffer
> could map to many buffers in SVQ vring.
>
> The solution is to stop using the device's used idx and check for the
> last avail idx. Since we cannot report in-flight descriptors with vdpa,
> let's rewind all of them.
>
> Fixes: 6d0b22266633 ("vdpa: Adapt vhost_vdpa_get_vring_base to SVQ")
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/virtio/vhost-vdpa.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 795ed5a049..18820498b3 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -1194,11 +1194,10 @@ static int vhost_vdpa_get_vring_base(struct vhost=
_dev *dev,
>                                         struct vhost_vring_state *ring)
>  {
>      struct vhost_vdpa *v =3D dev->opaque;
> -    int vdpa_idx =3D ring->index - dev->vq_index;
>      int ret;
>
>      if (v->shadow_vqs_enabled) {
> -        VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vqs, v=
dpa_idx);
> +        VirtQueue *vq =3D virtio_get_queue(dev->vdev, ring->index);
>
>          /*
>           * Setting base as last used idx, so destination will see as ava=
ilable
> @@ -1208,7 +1207,10 @@ static int vhost_vdpa_get_vring_base(struct vhost_=
dev *dev,
>           * TODO: This is ok for networking, but other kinds of devices m=
ight
>           * have problems with these retransmissions.
>           */
> -        ring->num =3D svq->last_used_idx;
> +        while (virtqueue_rewind(vq, 1)) {
> +            continue;
> +        }

Will this leak mapped VirtQueueElement?

Thanks

> +        ring->num =3D virtio_queue_get_last_avail_idx(dev->vdev, ring->i=
ndex);
>          return 0;
>      }
>
> --
> 2.31.1
>


