Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 793284C558D
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 12:14:31 +0100 (CET)
Received: from localhost ([::1]:52628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNv1y-0006KB-2X
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 06:14:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nNv0o-0005da-ML
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 06:13:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nNv0X-00018a-6a
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 06:13:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645873979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LT1peFWDQmxRvOvRjBFopADwvyM8l3aKFvC5CBsdqKU=;
 b=WhZ23wk/Us+fIfCEW33owZRQN9x7HI14K/Dx7kN2hf6GodRTYCqabY6rzElUPpPQXU4fB2
 XgNNyb9McGpwNoZf/I+t80gqHoJqY3H72pRKIdHhCdURxwZiMUmyCV1G1hlSRB46nQumTa
 u63tDzaIGFn6p3Mk8820ejsYCnJDZ4c=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-NMf0xWviM-qllGdMDtLGGA-1; Sat, 26 Feb 2022 06:12:58 -0500
X-MC-Unique: NMf0xWviM-qllGdMDtLGGA-1
Received: by mail-qv1-f70.google.com with SMTP id
 z27-20020a0ca95b000000b00432d0490c6bso3142339qva.0
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 03:12:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LT1peFWDQmxRvOvRjBFopADwvyM8l3aKFvC5CBsdqKU=;
 b=D3d819HfTeY5YzmC3OYt9ZQRozIwpS/PAjezUQdoSfiJXxNY4UH/6CSjZFSQR2SFX4
 XD4AImz8HiHaiWKlp1XTPqqNcrnrGYKkUBVhMY4WQattxf8q3EvrBOXttKOFBHEDChDy
 C/jGwJtVsPa36A3MjkA71zbnExLGrmH9smxv9HNwYjw5FY/7jf8+K75cw1zNtQKyBFOX
 UDMcUzCI63YlGLOS2ESEwAa2SpB2t34lEIclmsRZXMZI3jnBMURFc5sfDZVYtravHxzb
 0WVIxPzVgVJVzbXyMaiM/tVCtOHtg4wLyIXudQHgx/SZIQ2bv8enW9OThGkGOPGu+fhH
 ZWZw==
X-Gm-Message-State: AOAM533SAJfDaANHtjVIUI1OjCbYUEueV+Rq01D5Wv70JpapsRObzf5L
 xpt/N+79uGbXXJ3jBU0Bqcdkmu4K2aI0KxnFUyDcoxc31NVyhnxGc+O2Za8wWL34o/IkNmZVIKc
 sWDKLzKDxyu7L6URwLaDolfat139GQ8U=
X-Received: by 2002:a37:69c6:0:b0:5e9:6a1f:c357 with SMTP id
 e189-20020a3769c6000000b005e96a1fc357mr7047298qkc.632.1645873977636; 
 Sat, 26 Feb 2022 03:12:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmKq/8fxUQxelhryfIKp/p2QgsHihruWgtZqqt4qDnXuNZQIkKbgO3S6+0EH2log9jFbZN8gbYkWaW/RrJUyw=
X-Received: by 2002:a37:69c6:0:b0:5e9:6a1f:c357 with SMTP id
 e189-20020a3769c6000000b005e96a1fc357mr7047286qkc.632.1645873977406; Sat, 26
 Feb 2022 03:12:57 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-12-eperezma@redhat.com>
 <6219EEBD.1050209@huawei.com>
In-Reply-To: <6219EEBD.1050209@huawei.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Sat, 26 Feb 2022 12:12:21 +0100
Message-ID: <CAJaqyWeLKtuSEvqsDa25Nye6niUoVmgCz9rCWkc_+NgnxHsong@mail.gmail.com>
Subject: Re: [PATCH 11/31] vhost: Add vhost_svq_valid_device_features to
 shadow vq
To: Liuxiangdong <liuxiangdong5@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Michael Tsirkin <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Feb 26, 2022 at 10:31 AM Liuxiangdong <liuxiangdong5@huawei.com> wrote:
>
> Hi, Eugenio.
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c
> b/hw/virtio/vhost-shadow-virtqueue.c
> index 9619c8082c..51442b3dbf 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -45,6 +45,50 @@ const EventNotifier *vhost_svq_get_dev_kick_notifier(
>       return &svq->hdev_kick;
>   }
>
> +/**
> + * Validate the transport device features that SVQ can use with the device
> + *
> + * @dev_features  The device features. If success, the acknowledged
> features.
> + *
> + * Returns true if SVQ can go with a subset of these, false otherwise.
> + */
> +bool vhost_svq_valid_device_features(uint64_t *dev_features)
> +{
> +    bool r = true;
> +
> +    for (uint64_t b = VIRTIO_TRANSPORT_F_START; b <=
> VIRTIO_TRANSPORT_F_END;
> +         ++b) {
> +        switch (b) {
> +        case VIRTIO_F_NOTIFY_ON_EMPTY:
> +        case VIRTIO_F_ANY_LAYOUT:
> +            continue;
>
>
>
> #define VIRTIO_TRANSPORT_F_START    28
> #define VIRTIO_TRANSPORT_F_END        38
>
> #define VIRTIO_F_NOTIFY_ON_EMPTY    24
>
> This case (VIRTIO_F_NOTIFY_ON_EMPTY) may be useless.
>

Hi Xiangdong Liu,

You're right, it's out of the range so it does not make any sense to
check for it. I will delete it in the next version, thank you very
much!

>
> Thanks.
> Xiangdong Liu
>


