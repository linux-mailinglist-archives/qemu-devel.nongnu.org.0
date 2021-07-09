Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 845763C1F24
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:56:17 +0200 (CEST)
Received: from localhost ([::1]:57802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1jUm-0006wz-J0
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m1jI9-0007Rx-7D
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 01:43:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m1jI3-0005Df-NQ
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 01:43:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625809386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GbU7Pgs2DWjpNySZssO3MTruLqF6t3LpfzaEIMysvGU=;
 b=hFBtJ2zpqAnVirYR7ha85f61avP0b7ie7moRldOYmKyBEcGNQC1osWS/zqw2hbjF1wVjGu
 ApReUx4R8m1h8DlQszQf5AI87DNroEWKVuRQWJY+2XjPXK6TMSSUYGVfsfMjH0wfTrGFbs
 +Y454IcBGr1oASaTD6RicahyG8iQSbc=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-4x5DJ3HIPj2wK3D9YtWxyw-1; Fri, 09 Jul 2021 01:43:05 -0400
X-MC-Unique: 4x5DJ3HIPj2wK3D9YtWxyw-1
Received: by mail-pj1-f72.google.com with SMTP id
 o11-20020a17090a420bb029016eed2aa304so5020593pjg.2
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 22:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=GbU7Pgs2DWjpNySZssO3MTruLqF6t3LpfzaEIMysvGU=;
 b=Jr3w7E6gqt84ncx+9iyR+6KQ8M2WuphVKEM3F6pXoZ4tVSFweqQxUFI+rF3n16EIPB
 aV9RKo5CgfxyKpjX+8XH9Ypm4BrOE2KHbnCDqL+cAUZE7jXx35C+JBGvhbIDtdtQSkbt
 FpnDjxD6zYdKmwo3QQAT6l3XmrF1J2nDE9svCOW//rMfPD7HGtf+2llJIZWsHGR+sJ9d
 r/R+rZS+kXX53qFpImcizuSun8Rt9TL5NDD5tPAbhBNFl7TyPx3tzzhUnCEv/5Baq0NG
 vENVMMJMlXW8L7nOYzmmDcBPv8wmDCPZOZozOBc1hqnsbMy8sdHsFARKWFyZ2lOTAEAr
 EA6Q==
X-Gm-Message-State: AOAM532671PZa9Tsf8drkn47xSTdLEg1XhvzYMj48fY/JtghEt3Hul7i
 RuMcevV058sceD6vXLDsGS8Oq9WOPlsOa/+BfvzstnZ04nXjcXpA7C05MA7PJnAKqf8NgjPaGzy
 2qEpGF1O57xTWRNTDcbJ4EMOSXc2CnSQ5BCF/vNEhpxRqmB21ALzU5AfnqomSg+IxMoQ=
X-Received: by 2002:aa7:96e7:0:b029:326:8fb0:29a2 with SMTP id
 i7-20020aa796e70000b02903268fb029a2mr11314434pfq.13.1625809383796; 
 Thu, 08 Jul 2021 22:43:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnCnW331BInL+DX2Vppn727tbQOkwlosZ8ndUyFCMJAj4w3KFTN/TB54L2dvG6V1Nx76gypQ==
X-Received: by 2002:aa7:96e7:0:b029:326:8fb0:29a2 with SMTP id
 i7-20020aa796e70000b02903268fb029a2mr11314402pfq.13.1625809383521; 
 Thu, 08 Jul 2021 22:43:03 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id r10sm5445073pga.48.2021.07.08.22.43.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 22:43:03 -0700 (PDT)
Subject: Re: [PATCH v8 6/9] virtio-mmio: add support for configure interrupt
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210706072030.32365-1-lulu@redhat.com>
 <20210706072030.32365-7-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <75abaf98-12da-b707-bf40-9c7ad298d6bd@redhat.com>
Date: Fri, 9 Jul 2021 13:43:00 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706072030.32365-7-lulu@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/7/6 ÏÂÎç3:20, Cindy Lu Ð´µÀ:
> Add configure interrupt support for virtio-mmio bus. This
> interrupt will working while backend is vhost-vdpa
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>   hw/virtio/virtio-mmio.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
>
> diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
> index 342c918ea7..6c786db071 100644
> --- a/hw/virtio/virtio-mmio.c
> +++ b/hw/virtio/virtio-mmio.c
> @@ -670,7 +670,29 @@ static int virtio_mmio_set_guest_notifier(DeviceState *d, int n, bool assign,
>   
>       return 0;
>   }
> +static int virtio_mmio_set_config_notifier(DeviceState *d, bool assign)
> +{


We had similar issue as previous patch.

We need use "virtio_mmio_set_config_guest_notifier()."

Thanks


> +    VirtIOMMIOProxy *proxy = VIRTIO_MMIO(d);
> +    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> +    VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
>   
> +    EventNotifier *notifier = virtio_get_config_notifier(vdev);
> +    int r = 0;
> +    if (assign) {
> +        r = event_notifier_init(notifier, 0);
> +        if (r < 0) {
> +            return r;
> +        }
> +        virtio_set_config_notifier_fd_handler(vdev, true, false);
> +    } else {
> +        virtio_set_config_notifier_fd_handler(vdev, false, false);
> +        event_notifier_cleanup(notifier);
> +    }
> +    if (vdc->guest_notifier_mask && vdev->use_guest_notifier_mask) {
> +        vdc->guest_notifier_mask(vdev, VIRTIO_CONFIG_IRQ_IDX, !assign);
> +    }
> +    return r;
> +}
>   static int virtio_mmio_set_guest_notifiers(DeviceState *d, int nvqs,
>                                              bool assign)
>   {
> @@ -692,6 +714,10 @@ static int virtio_mmio_set_guest_notifiers(DeviceState *d, int nvqs,
>               goto assign_error;
>           }
>       }
> +    r = virtio_mmio_set_config_notifier(d, assign);
> +    if (r < 0) {
> +        goto assign_error;
> +    }
>   
>       return 0;
>   


