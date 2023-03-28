Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A09796CB775
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 08:46:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph35d-0005vD-PO; Tue, 28 Mar 2023 02:45:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ph35a-0005r5-6c
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 02:45:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ph35Y-00061y-6h
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 02:45:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679985947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j1uzhH0147TU2a3xzMuisixfsEYucKcXusENizwOLCU=;
 b=XtVOeV1lc6LXMB5oSOY2Fo0dohjoC+qQhSI1gBJnqIMRhnyI1JpfLu10GAzIhL1s8WYsF1
 6UiGG0zw7SOMfzLlBenS5sn7vtnVG5CynCJpBF4D5Cd6SbHVIqSRxVrv+oca9wYta9/ZCR
 plLOah2yeFMN7AsQywA/cFxoYdaZKXM=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-GVyO_4AtNBCaOmLX0wnp3g-1; Tue, 28 Mar 2023 02:45:45 -0400
X-MC-Unique: GVyO_4AtNBCaOmLX0wnp3g-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-17e7104c589so6366054fac.19
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 23:45:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679985944;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j1uzhH0147TU2a3xzMuisixfsEYucKcXusENizwOLCU=;
 b=lGlP+SVqmxLHT6M5kQDtIYp/mu4pIfbTHNXGx8QA5w2M2SZUZroi6UK0RO2x70EK7X
 Q3T8+HomtpntIiwgMMT22oRYndS2rz1kSVuxuEifmoJKlc21EWyM7nWrwpz+t51t850W
 DFXfAiM0aOM3HLGaciMCd0x4H4r9gAlh8xIZ12Vh+MSsftyMAGxsUz+kyAXQXUrpCgS6
 gH/Y+XRNM9/t6bxU+UEpTpU4KCn+1KgcUHN2eItmB7/XLgOEtWi8HH5Aohuc8q30QGOD
 SajfkL004zLF1qVusI/Uo53/pAgxRrx0tiJx8OBBh3SrC0knCJJ8lqAU/Irr4JRAICql
 lXuQ==
X-Gm-Message-State: AO0yUKW26PwTAExZvbVHbmcmIFmSOqER9rX8uQDOGOhKwfyLPR90iBoB
 8xXyxxeSk2fE/D/vMxkNeogPJYlBarpbXf1wKr+54NeWUMNX90bBrs15tP77mIBXMZ6iPDc24pY
 Sw0JuJlpuMWBcOG8cCrX/MUH9On0FP5Q=
X-Received: by 2002:a54:438b:0:b0:37f:a2ad:6718 with SMTP id
 u11-20020a54438b000000b0037fa2ad6718mr8077807oiv.3.1679985944197; 
 Mon, 27 Mar 2023 23:45:44 -0700 (PDT)
X-Google-Smtp-Source: AK7set+s+F9+vXD4CbgtiMtTQ7jMHeUrA8qa/qFURM7q+vq83dbWa/y2JD+kZEscqkM+qxvSH6BstvMkBAa1Nm/7k18=
X-Received: by 2002:a54:438b:0:b0:37f:a2ad:6718 with SMTP id
 u11-20020a54438b000000b0037fa2ad6718mr8077800oiv.3.1679985944005; Mon, 27 Mar
 2023 23:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230323195404.1247326-1-eperezma@redhat.com>
 <20230323195404.1247326-2-eperezma@redhat.com>
In-Reply-To: <20230323195404.1247326-2-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 28 Mar 2023 14:45:33 +0800
Message-ID: <CACGkMEvaR73yQ=_gc-kO_EiHrEM=nG2EUGwTqg-9m6fg8ROJcA@mail.gmail.com>
Subject: Re: [PATCH for 8.1 v2 1/6] vdpa: Remove status in reset tracing
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Gautam Dawar <gdawar@xilinx.com>, alvaro.karsz@solid-run.com, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>,
 si-wei.liu@oracle.com, 
 Eli Cohen <eli@mellanox.com>, Shannon Nelson <snelson@pensando.io>, 
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>,
 longpeng2@huawei.com, Harpreet Singh Anand <hanand@xilinx.com>
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

On Fri, Mar 24, 2023 at 3:54=E2=80=AFAM Eugenio P=C3=A9rez <eperezma@redhat=
.com> wrote:
>
> It is always 0 and it is not useful to route call through file
> descriptor.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

> ---
>  hw/virtio/vhost-vdpa.c | 2 +-
>  hw/virtio/trace-events | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index bc6bad23d5..bbabea18f3 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -716,7 +716,7 @@ static int vhost_vdpa_reset_device(struct vhost_dev *=
dev)
>      uint8_t status =3D 0;
>
>      ret =3D vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
> -    trace_vhost_vdpa_reset_device(dev, status);
> +    trace_vhost_vdpa_reset_device(dev);
>      v->suspended =3D false;
>      return ret;
>  }
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index 8f8d05cf9b..6265231683 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -44,7 +44,7 @@ vhost_vdpa_set_mem_table(void *dev, uint32_t nregions, =
uint32_t padding) "dev: %
>  vhost_vdpa_dump_regions(void *dev, int i, uint64_t guest_phys_addr, uint=
64_t memory_size, uint64_t userspace_addr, uint64_t flags_padding) "dev: %p=
 %d: guest_phys_addr: 0x%"PRIx64" memory_size: 0x%"PRIx64" userspace_addr: =
0x%"PRIx64" flags_padding: 0x%"PRIx64
>  vhost_vdpa_set_features(void *dev, uint64_t features) "dev: %p features:=
 0x%"PRIx64
>  vhost_vdpa_get_device_id(void *dev, uint32_t device_id) "dev: %p device_=
id %"PRIu32
> -vhost_vdpa_reset_device(void *dev, uint8_t status) "dev: %p status: 0x%"=
PRIx8
> +vhost_vdpa_reset_device(void *dev) "dev: %p"
>  vhost_vdpa_get_vq_index(void *dev, int idx, int vq_idx) "dev: %p idx: %d=
 vq idx: %d"
>  vhost_vdpa_set_vring_ready(void *dev) "dev: %p"
>  vhost_vdpa_dump_config(void *dev, const char *line) "dev: %p %s"
> --
> 2.31.1
>


