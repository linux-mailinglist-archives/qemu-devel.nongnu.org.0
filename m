Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A72123DCFD9
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 06:51:14 +0200 (CEST)
Received: from localhost ([::1]:45624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAPuz-0007a6-8I
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 00:51:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mAPu8-0006qw-1U
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 00:50:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mAPu5-0004zG-24
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 00:50:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627879815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CR36PlQvwcc6Edo6BYnBwo0frAxa/1HGx/ySpBgaKiA=;
 b=XL8xNTQTp9I/hJfB57/5ThvXf9lZF+/eawPzjkU+/vgyR82MvQ9a+EWK6kBlpsD0qfanmb
 pV/h9ClscwcoLLWrvo3PDisXhPFR8bYuuxftk222Pqlll4RJuKBfM1HID4rjRhOHV4X95Y
 wW928/EjGquWWLL4/6WzJLfhuQjv+hg=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-gBhYtLAeOKepwpgN2VaxaQ-1; Mon, 02 Aug 2021 00:50:14 -0400
X-MC-Unique: gBhYtLAeOKepwpgN2VaxaQ-1
Received: by mail-pj1-f69.google.com with SMTP id
 s1-20020a17090a8801b02901756faa6840so15929533pjn.2
 for <qemu-devel@nongnu.org>; Sun, 01 Aug 2021 21:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=CR36PlQvwcc6Edo6BYnBwo0frAxa/1HGx/ySpBgaKiA=;
 b=TE+JURWPbKIjetBOioF7Fln15AJPZCgeU7vw0ijZCUodr04RXrtZMuZ7J0mA9eu0bG
 Y7Po2eDhkjhZz42w8NwQgHGSdmrj4b/1fW7pjqlzfLaWrRzZfv2+p6tvlSfctAsg6575
 leaAk8OwIkT2v4lwFm6AlXE7bZpznxEsxkqamlY3dmXtzASDBqvn6QD7xDTDMXtr84lY
 J2x11Pk8Umxp3rC7V/3ULoJEdhRMHKyUipBfECdDvfoBXJ9Q2XZ0u+FBL2yY3SeKtuMj
 Xuczjnrm2xO6BN2ClMQn+dymdMxUWoLkc8Yi/QBJTkjG5uQb1K3J+3N6TY8qxWQQAGaF
 S67w==
X-Gm-Message-State: AOAM532mJIpr0Y9DwEGb4dbmgeJpUhQZ4X+FfbmXL9ntmD7UeQ+3kFwE
 AqvoYdjkvyp+IkXC6FoTaJm9Li5Wv/QzJ+G8XyxnO+YsmsVpiC9NbY5q2X+mPHjMc1hB253soQT
 eewxqnYukmEzAslw=
X-Received: by 2002:a63:e605:: with SMTP id g5mr1366911pgh.124.1627879813501; 
 Sun, 01 Aug 2021 21:50:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAWHrwnei9Dyg9Zvq10tp7rrNq2+Yj9rfzCGP3ZulFK2xaTB427FaWtzt9HnOcOo8G7j2UoA==
X-Received: by 2002:a63:e605:: with SMTP id g5mr1366900pgh.124.1627879813293; 
 Sun, 01 Aug 2021 21:50:13 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id y4sm3719268pjw.57.2021.08.01.21.50.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Aug 2021 21:50:12 -0700 (PDT)
Subject: Re: [PATCH 1/2] virtio: add a way to disable a queue
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20210729191910.317114-1-lvivier@redhat.com>
 <20210729191910.317114-2-lvivier@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c9b273fb-797b-4810-bb4c-d99d5173fe6c@redhat.com>
Date: Mon, 2 Aug 2021 12:50:08 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210729191910.317114-2-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.08, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Jens Freimann <jfreimann@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/7/30 ÉÏÎç3:19, Laurent Vivier Ð´µÀ:
> Add virtio_queue_disable()/virtio_queue_enable() to disable/enable a queue
> by setting vring.num to 0 (or num_default).
> This is needed to be able to disable a guest driver from the host side


I suspect this won't work correclty for vhost.

And I believe we should only do this after the per queue 
enabling/disabling is supported by the spec.

(only MMIO support that AFAIK)

Thanks


>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>   include/hw/virtio/virtio.h |  2 ++
>   hw/virtio/virtio.c         | 10 ++++++++++
>   2 files changed, 12 insertions(+)
>
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index 8bab9cfb7507..6a3f71b4cd88 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -251,6 +251,8 @@ void virtio_config_modern_writel(VirtIODevice *vdev,
>                                    uint32_t addr, uint32_t data);
>   void virtio_queue_set_addr(VirtIODevice *vdev, int n, hwaddr addr);
>   hwaddr virtio_queue_get_addr(VirtIODevice *vdev, int n);
> +void virtio_queue_enable(VirtIODevice *vdev, int n);
> +void virtio_queue_disable(VirtIODevice *vdev, int n);
>   void virtio_queue_set_num(VirtIODevice *vdev, int n, int num);
>   int virtio_queue_get_num(VirtIODevice *vdev, int n);
>   int virtio_queue_get_max_num(VirtIODevice *vdev, int n);
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 874377f37a70..fa5228c1a2d6 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -2244,6 +2244,16 @@ void virtio_queue_set_rings(VirtIODevice *vdev, int n, hwaddr desc,
>       virtio_init_region_cache(vdev, n);
>   }
>   
> +void virtio_queue_disable(VirtIODevice *vdev, int n)
> +{
> +    vdev->vq[n].vring.num = 0;
> +}
> +
> +void virtio_queue_enable(VirtIODevice *vdev, int n)
> +{
> +    vdev->vq[n].vring.num = vdev->vq[n].vring.num_default;
> +}
> +
>   void virtio_queue_set_num(VirtIODevice *vdev, int n, int num)
>   {
>       /* Don't allow guest to flip queue between existent and


