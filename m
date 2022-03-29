Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F734EA8D0
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 09:53:44 +0200 (CEST)
Received: from localhost ([::1]:57452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ6fe-0005rh-Sr
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 03:53:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nZ6cd-00053s-Hs
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 03:50:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nZ6ca-0007o6-3g
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 03:50:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648540230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w5HBz1ct9ogGhqUsssT39NVYwzileEwI74w7mcME0EE=;
 b=Evkq2WbEhdfYvzKSdV4i3JsKpAddSFGsgGcPVwelTCwGyX8Rc4J2XM+BmmWDpIKPyAHMIE
 LkKOMzSOIFt3+zWFBiufzi+Z6IsUz3C8gx2JGIdjLms7vF0mCn/qC+lo31Pwy6TXkd/Sxs
 EkvYAjdsr2GGUlq+gG4fYz99T/4uNFw=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-ltnl8GFgM6SlRmEZeZeWwg-1; Tue, 29 Mar 2022 03:50:28 -0400
X-MC-Unique: ltnl8GFgM6SlRmEZeZeWwg-1
Received: by mail-lj1-f197.google.com with SMTP id
 s24-20020a2e98d8000000b00249800e5b87so7137487ljj.22
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 00:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w5HBz1ct9ogGhqUsssT39NVYwzileEwI74w7mcME0EE=;
 b=a52caTtrNVt5lSRcuE/M1tt1zUc8nwVek1Gzk0eY2rPlgn9HZyf6sM+iY6IRtD9DUb
 U2NYJ0Rm1gGq/i9u0HOXZg9naer+w1IyrVqGr7/+qHQMkBs0360ssuZBEyxGvcN30OiQ
 /t62cJxMmhMWnly4R+HQ2X6azlOs01gM/bSF67ay1N+KmZsTfbcxhKqo+fdVeKM9RInn
 AMy2q2iadFFYkWeJK2khcdVGm+3+myHLDE9Q6rT0sVrnaMEjpke+T4ZIAYX/tfTitAxu
 +HFmYEnIHP3oF6boyfdvOvFDP5LVatLfjYjb2jYQf+ueTMruI9dek629JwRLwVDga/VK
 e65g==
X-Gm-Message-State: AOAM532a+ftW1D9tIbZab98YLuuK1+7d9KXT61iaKWJMwNCgciVSy6pK
 gh5ImuE3zm0ua8H358dqjBdTUxRYdXEXx4/BC8f+bhmfuVwz7xtYRwaOIj7/5USz1dVVVdV4aP+
 FE6XsVJgFJ8hT/FuaoIdJD0qIa3Iq/5E=
X-Received: by 2002:ac2:51b6:0:b0:44a:6da1:b193 with SMTP id
 f22-20020ac251b6000000b0044a6da1b193mr1467056lfk.587.1648540226957; 
 Tue, 29 Mar 2022 00:50:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWuRl0Ff7QSXLiyHz38Juz681Z3j5nRXHcnjrdbFZWo/H8alPmyklN2vo9wQjAr/UepCId96PHmMaoxbh9JsA=
X-Received: by 2002:ac2:51b6:0:b0:44a:6da1:b193 with SMTP id
 f22-20020ac251b6000000b0044a6da1b193mr1467034lfk.587.1648540226682; Tue, 29
 Mar 2022 00:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220329073602.754456-1-pbonzini@redhat.com>
In-Reply-To: <20220329073602.754456-1-pbonzini@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 29 Mar 2022 15:50:15 +0800
Message-ID: <CACGkMEu9b5qBwWjcPQrKzTZFQj6Nc34yj8sbf_rwjkiLWVU37g@mail.gmail.com>
Subject: Re: [PATCH for-7.0] virtio: fix --enable-vhost-user build on non-Linux
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 29, 2022 at 3:36 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The vhost-shadow-virtqueue.c build requires include files from
> linux-headers/, so it cannot be built on non-Linux systems.

We need decouple this dependency in the future.

> Fortunately it is only needed by vhost-vdpa, so move it there.

Acked-by: Jason Wang <jasowang@redhat.com>

>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/virtio/meson.build | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
> index 6047670804..67dc77e00f 100644
> --- a/hw/virtio/meson.build
> +++ b/hw/virtio/meson.build
> @@ -11,9 +11,9 @@ softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-stub.c'))
>
>  virtio_ss = ss.source_set()
>  virtio_ss.add(files('virtio.c'))
> -virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-backend.c', 'vhost-shadow-virtqueue.c', 'vhost-iova-tree.c'))
> +virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-backend.c', 'vhost-iova-tree.c'))
>  virtio_ss.add(when: 'CONFIG_VHOST_USER', if_true: files('vhost-user.c'))
> -virtio_ss.add(when: 'CONFIG_VHOST_VDPA', if_true: files('vhost-vdpa.c'))
> +virtio_ss.add(when: 'CONFIG_VHOST_VDPA', if_true: files('vhost-shadow-virtqueue.c', 'vhost-vdpa.c'))
>  virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-balloon.c'))
>  virtio_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('virtio-crypto.c'))
>  virtio_ss.add(when: ['CONFIG_VIRTIO_CRYPTO', 'CONFIG_VIRTIO_PCI'], if_true: files('virtio-crypto-pci.c'))
> --
> 2.35.1
>
>


