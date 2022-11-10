Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C26BB623B41
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 06:30:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot08W-0003Au-Gw; Thu, 10 Nov 2022 00:30:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ot08T-0003AV-I4
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:29:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ot08R-000718-VN
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:29:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668058195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MIhAVnv+/+S3krzuCVUj1n9SXlWXtXtQLWkbB7aRrMc=;
 b=X4qqQmLtJ25oXlE4q1xo7uJcRJ4lfHUHWlPBCsg9r58xBgSaycHzWHus8kR4avTiZLdIgB
 dhGk6B3S6rfopU862b+YcI3WVD8+kXybpSiDUlMyoY0YvOpngVtzzyPi/grlWWAYHxwPLw
 6DwaLZyA80MGrGWfvXXLBr/ERNV/oI4=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-139-1myyg7N_PEaWq2v4p9nw3A-1; Thu, 10 Nov 2022 00:29:46 -0500
X-MC-Unique: 1myyg7N_PEaWq2v4p9nw3A-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-13ba8947e4cso581497fac.6
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 21:29:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MIhAVnv+/+S3krzuCVUj1n9SXlWXtXtQLWkbB7aRrMc=;
 b=uPkLFnh3iEbtdZFUsNXv99SGArc8JfZFo8gDNhxuS6hmPlcbp5At2h52MWpVfv4Z+0
 vM5MpYpF4h6d3rq9s5aTvMeOoeZT2LIyhxh/9eQjoCRu79n3L5lPxaZLQMZgmpHO00F0
 NsT2LmTcHN6XJIttKlmDKXjrySvEftkdFVB95177u9wIlH0nX1oU1dWg+RJjPaTO6Jaw
 /8lPj/G9RhxacwslMJ2XnwTxtzCiTdLcd7sBKEn/cR/zHnyWg4IYf0AQNAP/DRfQtxiZ
 oQkq9sb3sUgZ5w2h9yhlDe3H7XsYS6Kr13VINGXjxHgmPpfDh3RvoGBNlBqWCMRkFtSx
 ea0w==
X-Gm-Message-State: ACrzQf1+xbnqvAIdj/REr1nKZayVdH2x40JmCCMDhxpOHnYjRnllBIkJ
 NsIG4PlfA9DqPziPQxl6iqcJK+4gHmhSIcjvQ/XvLYB1tzDvksiJGyue63j3JiZ2yqTGIlkt5uP
 6N6ib3IU6hAy4tAAQGTldMCAg0SZ8KhU=
X-Received: by 2002:a05:6871:54e:b0:13b:29b7:e2e8 with SMTP id
 t14-20020a056871054e00b0013b29b7e2e8mr45849457oal.35.1668058185485; 
 Wed, 09 Nov 2022 21:29:45 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5hvq2a3d534EXhf5VZh8Fa4rg/SX3V11YbzbGDsvCqCrH5WxHXv9/kAXS+loSnWVxVAvFpzJXGcRagOwroa2Y=
X-Received: by 2002:a05:6871:54e:b0:13b:29b7:e2e8 with SMTP id
 t14-20020a056871054e00b0013b29b7e2e8mr45849448oal.35.1668058185297; Wed, 09
 Nov 2022 21:29:45 -0800 (PST)
MIME-Version: 1.0
References: <20221108170755.92768-1-eperezma@redhat.com>
 <20221108170755.92768-5-eperezma@redhat.com>
In-Reply-To: <20221108170755.92768-5-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 10 Nov 2022 13:29:33 +0800
Message-ID: <CACGkMEvpXdAfSLXtpEsjsrRQ_iMjLk_PjmYh7p9HpuDpDvH_UA@mail.gmail.com>
Subject: Re: [PATCH v6 04/10] vdpa: add vhost_vdpa_net_valid_svq_features
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Parav Pandit <parav@mellanox.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>, 
 Laurent Vivier <lvivier@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, kvm@vger.kernel.org, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
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

On Wed, Nov 9, 2022 at 1:08 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wro=
te:
>
> It will be reused at vdpa device start so let's extract in its own functi=
on
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

>  net/vhost-vdpa.c | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index e370ecb8eb..d3b1de481b 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -106,6 +106,22 @@ VHostNetState *vhost_vdpa_get_vhost_net(NetClientSta=
te *nc)
>      return s->vhost_net;
>  }
>
> +static bool vhost_vdpa_net_valid_svq_features(uint64_t features, Error *=
*errp)
> +{
> +    uint64_t invalid_dev_features =3D
> +        features & ~vdpa_svq_device_features &
> +        /* Transport are all accepted at this point */
> +        ~MAKE_64BIT_MASK(VIRTIO_TRANSPORT_F_START,
> +                         VIRTIO_TRANSPORT_F_END - VIRTIO_TRANSPORT_F_STA=
RT);
> +
> +    if (invalid_dev_features) {
> +        error_setg(errp, "vdpa svq does not work with features 0x%" PRIx=
64,
> +                   invalid_dev_features);
> +    }
> +
> +    return !invalid_dev_features;
> +}
> +
>  static int vhost_vdpa_net_check_device_id(struct vhost_net *net)
>  {
>      uint32_t device_id;
> @@ -675,15 +691,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const =
char *name,
>      if (opts->x_svq) {
>          struct vhost_vdpa_iova_range iova_range;
>
> -        uint64_t invalid_dev_features =3D
> -            features & ~vdpa_svq_device_features &
> -            /* Transport are all accepted at this point */
> -            ~MAKE_64BIT_MASK(VIRTIO_TRANSPORT_F_START,
> -                             VIRTIO_TRANSPORT_F_END - VIRTIO_TRANSPORT_F=
_START);
> -
> -        if (invalid_dev_features) {
> -            error_setg(errp, "vdpa svq does not work with features 0x%" =
PRIx64,
> -                       invalid_dev_features);
> +        if (!vhost_vdpa_net_valid_svq_features(features, errp)) {
>              goto err_svq;
>          }
>
> --
> 2.31.1
>


