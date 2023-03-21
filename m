Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D98AE6C283D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 03:32:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peRly-0000Fh-5l; Mon, 20 Mar 2023 22:30:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1peRlv-0000Ew-Ah
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 22:30:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1peRlt-0006d1-ST
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 22:30:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679365843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9vYYoD/QlSpZt/ssAg14uOeshV9x7R6DoAQt0OqnYv8=;
 b=ScD7cw8GmpAPqbmiMrY6goslEsIPyZQQGWFP0A6egeGKdH2TxU12V7rHyIHfTSjhQPhJ99
 L70fHP0K3hsnVXDldk8cxbyUYfcQPcXlXNGma8TQgvWWRlQW2CPqH3O1xB8lYpT6XaYRU5
 1CCZPNxQ5RnfGBT9zCzjhysmZp5FZ70=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-rxRBJOjXPiWXkO19-BFv7g-1; Mon, 20 Mar 2023 22:30:42 -0400
X-MC-Unique: rxRBJOjXPiWXkO19-BFv7g-1
Received: by mail-oo1-f72.google.com with SMTP id
 e3-20020a4ad243000000b00536a31d36e6so4150445oos.9
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 19:30:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679365841;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9vYYoD/QlSpZt/ssAg14uOeshV9x7R6DoAQt0OqnYv8=;
 b=AYpJYBOVpOtXlzfrV0Z0nlerCi436hQtnYmJ6QKP6dxzrzPpGQBmpr1Vs82J/05UFA
 +QNpcthtCyV2Vi2iKsEiZ5yVwUaASiPX+LGu9Uxg5iXIpnldBRrOWLdLSE/64b5vZ4CQ
 chIvC4IyLo812lRPC1901336I9jHJd8iWAIt4+TjTuWfPnVovK99vQ/hhRIQLeZxROox
 hgY71oZcgJ763yTKjQPdAXyNQT3v43I6okwRpWxxGBIrYVUb2NtX+xQOjz8EVtPF8jWN
 596npR5WI9HarixtoLwqlHZdQpSvM0OhHA8q/b+mSHui7bGVAhabQMq0b255dQhtN/xU
 7iOw==
X-Gm-Message-State: AO0yUKWo6ykrpnggRbyEx+ePJ/3egqI1vVkFSVgPa95f/7T9qC3xEr7n
 xB8yUGKgES+o5U7h5ifaBrCzW8vptGJCagrXB1sfxTbxGDzj4rqrm3rIU3414jh/l1nAAkpkuDH
 +oyLv83dYU5H9g+9cbfoYrpzAOf3hdKQ=
X-Received: by 2002:a05:6870:17aa:b0:177:b9c0:bcba with SMTP id
 r42-20020a05687017aa00b00177b9c0bcbamr205107oae.3.1679365841482; 
 Mon, 20 Mar 2023 19:30:41 -0700 (PDT)
X-Google-Smtp-Source: AK7set/oP3OQKFm8klz0RCZHhbZdSp3rr64q75mfLH/jfIYETKh+FAtC70t5/aheGGyOKH/KbCGdNGIfjZiLyK7WVEk=
X-Received: by 2002:a05:6870:17aa:b0:177:b9c0:bcba with SMTP id
 r42-20020a05687017aa00b00177b9c0bcbamr205100oae.3.1679365841236; Mon, 20 Mar
 2023 19:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230320161959.650841-1-lulu@redhat.com>
 <20230320161959.650841-2-lulu@redhat.com>
In-Reply-To: <20230320161959.650841-2-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 21 Mar 2023 10:30:30 +0800
Message-ID: <CACGkMEthACNr440rgn0Jcv33==dv7j53eyZw7tY8MhV0mMXXnA@mail.gmail.com>
Subject: Re: [PATCH v14 1/4] vhost: expose function vhost_dev_has_iommu()
To: Cindy Lu <lulu@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org
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

On Tue, Mar 21, 2023 at 12:20=E2=80=AFAM Cindy Lu <lulu@redhat.com> wrote:
>
> To support vIOMMU in vdpa, need to exposed the function
> vhost_dev_has_iommu, vdpa will use this function to check
> if vIOMMU enable.
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

> ---
>  hw/virtio/vhost.c         | 2 +-
>  include/hw/virtio/vhost.h | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index a266396576..fd746b085b 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -107,7 +107,7 @@ static void vhost_dev_sync_region(struct vhost_dev *d=
ev,
>      }
>  }
>
> -static bool vhost_dev_has_iommu(struct vhost_dev *dev)
> +bool vhost_dev_has_iommu(struct vhost_dev *dev)
>  {
>      VirtIODevice *vdev =3D dev->vdev;
>
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index a52f273347..f7f10c8fb7 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -336,4 +336,5 @@ int vhost_dev_set_inflight(struct vhost_dev *dev,
>                             struct vhost_inflight *inflight);
>  int vhost_dev_get_inflight(struct vhost_dev *dev, uint16_t queue_size,
>                             struct vhost_inflight *inflight);
> +bool vhost_dev_has_iommu(struct vhost_dev *dev);
>  #endif
> --
> 2.34.3
>


