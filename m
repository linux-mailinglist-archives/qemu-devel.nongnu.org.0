Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9832E575A1C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 06:00:43 +0200 (CEST)
Received: from localhost ([::1]:51770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCCVO-0003Zp-AH
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 00:00:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oCCTv-00027g-1P
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 23:59:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oCCTr-00083k-3o
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 23:59:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657857545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ak7HPJPF1bxANWp//PoDFzvMzaLV2jUksznDRsKmOKk=;
 b=LB1Rdu6boa08Kwl6PQwh/zOtFVohEryTx3EIUZnKUmes0tLroKbLPs3nznMW8gThrswBV0
 OI1goauBpBrDS9vyrNZX2qVYcuKaDTO1bcG64CzV5BH4zU62w479g7w8jpXZwmogxnlW+d
 w0X8CVadJPaVZhWaNS5/JnFBnFR7qqs=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-TZtll8D1MFa07sYUPyHwGA-1; Thu, 14 Jul 2022 23:59:04 -0400
X-MC-Unique: TZtll8D1MFa07sYUPyHwGA-1
Received: by mail-lj1-f198.google.com with SMTP id
 z5-20020a05651c022500b0025d4d99593aso790851ljn.18
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 20:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ak7HPJPF1bxANWp//PoDFzvMzaLV2jUksznDRsKmOKk=;
 b=H6nqt+VG9xCd0x/jSAN0ExgITDKWHtr46vt88zs+D7PFFyqicqEU0CGSNoMywt0bb/
 kcwyTHpnmw6VHUjdi5snRnx4i58YBq4JWAGQGr6QCZEEmf/7rNiz5/ogXfYykfi6+PVW
 bQ9+u0vyFQpGIicGajROLgHUzsjCvBei2ddn6Pcgtq4nmAuwNG7YJzaC36aFtIKE1tmP
 Ywpvk7eUsbCgS+E2DlpoZS1O1R82UpJ/g6gRZftaAkBHfjq2iEVFgfTazXSFuuaMC9ch
 izgHzOTrFfd+0Hb1lMQCLEYtIPCcUoWXuJc6leXVSFZO4DbLKUwjLoMdhGlNnMrwDQza
 tz7w==
X-Gm-Message-State: AJIora/P7uCNjAld7QWkoP/jxvFPciMWvW4fzxwk1Ed+jfH8kcz0wENL
 0RQInE5B9FYwQmSWEYHmuiP+MjBcZnzXICvOe6Efoxvweo6BG7kguzVmO2JcVf1zcMb+g3QAMNJ
 gA7+ZER/Q3lPC/Ei8JzS3g7ipwawYOYc=
X-Received: by 2002:a05:6512:313a:b0:489:caea:7e27 with SMTP id
 p26-20020a056512313a00b00489caea7e27mr7107448lfd.397.1657857542442; 
 Thu, 14 Jul 2022 20:59:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t4rl7UsCUmplvkNEoDQdGrJRPG72PZBteVOEWAztGd0LxuSVNoA2Y//azpQL+heshsJl5JjzgAPfiUY7Ykmxw=
X-Received: by 2002:a05:6512:313a:b0:489:caea:7e27 with SMTP id
 p26-20020a056512313a00b00489caea7e27mr7107422lfd.397.1657857542136; Thu, 14
 Jul 2022 20:59:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220714163150.2536327-1-eperezma@redhat.com>
 <20220714163150.2536327-13-eperezma@redhat.com>
In-Reply-To: <20220714163150.2536327-13-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 15 Jul 2022 11:58:51 +0800
Message-ID: <CACGkMEuHR_R6Jxjvznv1T-d6SGngsYQyfhCNw8-HoTb3FLcX0w@mail.gmail.com>
Subject: Re: [PATCH v2 12/19] vhost: add vhost_svq_poll
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Parav Pandit <parav@mellanox.com>, 
 Laurent Vivier <lvivier@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Eli Cohen <eli@mellanox.com>, Cindy Lu <lulu@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, Jul 15, 2022 at 12:32 AM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
>
> It allows the Shadow Control VirtQueue to wait for the device to use the
> available buffers.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/virtio/vhost-shadow-virtqueue.h |  1 +
>  hw/virtio/vhost-shadow-virtqueue.c | 22 ++++++++++++++++++++++
>  2 files changed, 23 insertions(+)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-=
virtqueue.h
> index 1692541cbb..b5c6e3b3b4 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.h
> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> @@ -89,6 +89,7 @@ void vhost_svq_push_elem(VhostShadowVirtqueue *svq, con=
st SVQElement *elem,
>  int vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
>                    size_t out_num, const struct iovec *in_sg, size_t in_n=
um,
>                    SVQElement *elem);
> +size_t vhost_svq_poll(VhostShadowVirtqueue *svq);
>
>  void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_f=
d);
>  void vhost_svq_set_svq_call_fd(VhostShadowVirtqueue *svq, int call_fd);
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-=
virtqueue.c
> index 5244896358..31a267f721 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -486,6 +486,28 @@ static void vhost_svq_flush(VhostShadowVirtqueue *sv=
q,
>      } while (!vhost_svq_enable_notification(svq));
>  }
>
> +/**
> + * Poll the SVQ for one device used buffer.
> + *
> + * This function race with main event loop SVQ polling, so extra
> + * synchronization is needed.
> + *
> + * Return the length written by the device.
> + */
> +size_t vhost_svq_poll(VhostShadowVirtqueue *svq)
> +{
> +    do {
> +        uint32_t len;
> +        SVQElement *elem =3D vhost_svq_get_buf(svq, &len);
> +        if (elem) {
> +            return len;
> +        }
> +
> +        /* Make sure we read new used_idx */
> +        smp_rmb();

There's already one smp_rmb(0 in vhost_svq_get_buf(). So this seems useless=
?

Thanks

> +    } while (true);
> +}
> +
>  /**
>   * Forward used buffers.
>   *
> --
> 2.31.1
>


