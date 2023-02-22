Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6C769EDC7
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 05:06:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUgNi-0004Hc-GZ; Tue, 21 Feb 2023 23:05:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pUgNY-0004HE-Vx
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 23:05:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pUgNX-0003KG-2b
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 23:05:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677038714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GFohn0VGV0YYVS1cn/bv1WgUnkGLLWD2wKZ4KHo94yo=;
 b=fftVFrj8ZrDN5BHGu1+k2H4jdQTkneiGuo6n8C5i+Nh5khQONrCqVF4BzNB1M4lq1M5KWw
 Jle2k1DoklX3DhOn1OfxPP4/TPUpHhgVvEXxwlfkFr3Gs87m0VKfMcQo2bNLcLTktlK9Jd
 PpAj8hzXmKjqe6Z4WVCRlGbELfTqbTY=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-528-yryySZqNPkW1egzchEhcRA-1; Tue, 21 Feb 2023 23:05:13 -0500
X-MC-Unique: yryySZqNPkW1egzchEhcRA-1
Received: by mail-pj1-f71.google.com with SMTP id
 qi1-20020a17090b274100b00237423cee67so116262pjb.2
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 20:05:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GFohn0VGV0YYVS1cn/bv1WgUnkGLLWD2wKZ4KHo94yo=;
 b=hNj6hDTQLUMpgw2BmQ+rk63lGyB31FTJY0mKG5+ZNcEtCGGRvJwf2E+TseBDJe/an+
 xE7fUi4G6GFxnHUAoJJFElkIfJSYJCbh1zkpQAW/pRfVpZi866Bah5vmpkb1rTTXeE+t
 2UTbkVeSQzbybUBDFlXu7E6IwRwBazItflV5ZhAMm9iyFo4+ix3po4vunLaWNuiBZzzA
 fYl6uhomIIkAvRcZYEmdjhDf1KMlk0koA0EWetARxc3+/dN7DMaJwnXVvD6kpOmhuia7
 j9whIhMrhDYaLyoibBYeEbBqVuVLeTGgWxzAbVTGmGwurPrpjh54irZ/GFByGOVfdbkR
 GRMg==
X-Gm-Message-State: AO0yUKWe0jZ5fkCBFhQVVkk5E4Gk79A3Vev2iGMkbhKwqXClXSyvwdHg
 aOknCiP0Qf3kArlUQibZtURyh0mAjNIoD2q65JXq8Ykv+xEIgoMO48y86DMcXKgIb8D1Rc2tbXM
 zw5EqXdfCd4V9Rj8=
X-Received: by 2002:a05:6a00:3305:b0:5a8:d438:c72 with SMTP id
 cq5-20020a056a00330500b005a8d4380c72mr5032890pfb.5.1677038712104; 
 Tue, 21 Feb 2023 20:05:12 -0800 (PST)
X-Google-Smtp-Source: AK7set+PyoeAv7/3kKyYOvWuBMNcRY5K+ZpHxCgRE/zwGuRof86URhuuLcOQkSYeRhgU7NK/PTxX/w==
X-Received: by 2002:a05:6a00:3305:b0:5a8:d438:c72 with SMTP id
 cq5-20020a056a00330500b005a8d4380c72mr5032876pfb.5.1677038711811; 
 Tue, 21 Feb 2023 20:05:11 -0800 (PST)
Received: from [10.72.13.76] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a62e50b000000b00586fbbdf6e4sm10221064pff.34.2023.02.21.20.05.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 20:05:11 -0800 (PST)
Message-ID: <c8d6ecc3-87f6-986e-e78d-003000e8a51e@redhat.com>
Date: Wed, 22 Feb 2023 12:05:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 11/13] vdpa: block migration if dev does not have
 _F_SUSPEND
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 alvaro.karsz@solid-run.com, Zhu Lingshan <lingshan.zhu@intel.com>,
 Lei Yang <leiyang@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Shannon Nelson <snelson@pensando.io>, Parav Pandit <parav@mellanox.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org,
 Stefano Garzarella <sgarzare@redhat.com>, si-wei.liu@oracle.com
References: <20230208094253.702672-1-eperezma@redhat.com>
 <20230208094253.702672-12-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20230208094253.702672-12-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


在 2023/2/8 17:42, Eugenio Pérez 写道:
> Next patches enable devices to be migrated even if vdpa netdev has not
> been started with x-svq. However, not all devices are migratable, so we
> need to block migration if we detect that.
>
> Block vhost-vdpa device migration if it does not offer _F_SUSPEND and it
> has not been started with x-svq.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-vdpa.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 84a6b9690b..9d30cf9b3c 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -442,6 +442,27 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
>           return 0;
>       }
>   
> +    /*
> +     * If dev->shadow_vqs_enabled at initialization that means the device has
> +     * been started with x-svq=on, so don't block migration
> +     */
> +    if (dev->migration_blocker == NULL && !v->shadow_vqs_enabled) {
> +        uint64_t backend_features;
> +
> +        /* We don't have dev->backend_features yet */
> +        ret = vhost_vdpa_call(dev, VHOST_GET_BACKEND_FEATURES,
> +                              &backend_features);
> +        if (unlikely(ret)) {
> +            error_setg_errno(errp, -ret, "Could not get backend features");
> +            return ret;
> +        }
> +
> +        if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_SUSPEND))) {
> +            error_setg(&dev->migration_blocker,
> +                "vhost-vdpa backend lacks VHOST_BACKEND_F_SUSPEND feature.");
> +        }


I wonder why not let the device to decide? For networking device, we can 
live without suspend probably.

Thanks


> +    }
> +
>       /*
>        * Similar to VFIO, we end up pinning all guest memory and have to
>        * disable discarding of RAM.


