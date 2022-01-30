Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A08594A34DA
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 08:22:32 +0100 (CET)
Received: from localhost ([::1]:58886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nE4Xf-0003uh-Dz
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 02:22:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nE42q-0004vG-CO
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 01:50:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nE42n-0002EG-L6
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 01:50:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643525436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bzZVcP/vnAaeDpsixBNZqpLgN2oQGxF+rhswlTNK7r4=;
 b=EM11Xh3AmHaWNMUWO0nDqnjTOJyRUJe35QtLS2PfFcLHweWplL0C/qlgKXkuTiCdmBU7W+
 G1Y0EnzywTf8j5Vhyi5SPq1ayBXOYqUHMcuYUD+a0IzfOoNVSayF4QfssKMog6/u1dez7o
 As14kAFETZ+2cPuV5qUg5nOlUN6L4iw=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-1Y0TL1vwPfC2HJq0aB5FwA-1; Sun, 30 Jan 2022 01:50:33 -0500
X-MC-Unique: 1Y0TL1vwPfC2HJq0aB5FwA-1
Received: by mail-pg1-f199.google.com with SMTP id
 c75-20020a63354e000000b003408e4153d1so6245629pga.9
 for <qemu-devel@nongnu.org>; Sat, 29 Jan 2022 22:50:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bzZVcP/vnAaeDpsixBNZqpLgN2oQGxF+rhswlTNK7r4=;
 b=dZMljdO1kqsv6aVJTMUwCVcMW9rHx15pFHDMwKAZlWDWDAOiD7JVNwsKPsvykmf2Lv
 UYGlfv/2UUsdD1kiaZQwBSLKfxR5qar72P731zpe4DzoR1580SSy9ubicIu0ReZiBkxC
 b7B4cLDt4BtuF8ln2qG5UyF6fq+0n/o5uNL5QFGCChxgPbsitmv0HqGJ51ltiE5pLeR/
 7j+HqMwGoJWAUn88uvjb4AA9+uGhvsLOYQ+2kRd7Yhys5utkArfjzc/zbQmDldKthdPJ
 YPYTIvYjIzVPGGfjFntCLGvq5FG56/vnRdaCZao+UUQlebUOLGr+u4AzZhCNygIVrkpC
 H4Xw==
X-Gm-Message-State: AOAM530lDGakLDjL0TD/LgBz8HIqKZc7Suh/NnMIQfBpXZdqOTbDmGv1
 GN8gEXDjuW4iS/mZ0ZKQoix0xb9vHSHyqZoa7lte115bC8YOzqmWLkw27pbdSSUgp8/z9gHkGAn
 smO4+nZWyKsG3h6E=
X-Received: by 2002:a17:902:d50d:: with SMTP id
 b13mr15497339plg.170.1643525432308; 
 Sat, 29 Jan 2022 22:50:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJypCazowZawvAJp3qjD1ARehRzwfZT99zuv2/XaiFEaIcwm835UkiPxGRUs90B9rmw57wev6w==
X-Received: by 2002:a17:902:d50d:: with SMTP id
 b13mr15497312plg.170.1643525432077; 
 Sat, 29 Jan 2022 22:50:32 -0800 (PST)
Received: from [10.72.12.243] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id lt17sm6796189pjb.41.2022.01.29.22.50.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Jan 2022 22:50:31 -0800 (PST)
Message-ID: <42664143-6d0c-b107-ec90-8e6336bae29b@redhat.com>
Date: Sun, 30 Jan 2022 14:50:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 28/31] vdpa: Expose VHOST_F_LOG_ALL on SVQ
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-29-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220121202733.404989-29-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.098,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/1/22 上午4:27, Eugenio Pérez 写道:
> SVQ is able to log the dirty bits by itself, so let's use it to not
> block migration.
>
> Also, ignore set and clear of VHOST_F_LOG_ALL on set_features if SVQ is
> enabled. Even if the device supports it, the reports would be nonsense
> because SVQ memory is in the qemu region.
>
> The log region is still allocated. Future changes might skip that, but
> this series is already long enough.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-vdpa.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index fb0a338baa..75090d65e8 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -1022,6 +1022,9 @@ static int vhost_vdpa_get_features(struct vhost_dev *dev, uint64_t *features)
>       if (ret == 0 && v->shadow_vqs_enabled) {
>           /* Filter only features that SVQ can offer to guest */
>           vhost_svq_valid_guest_features(features);
> +
> +        /* Add SVQ logging capabilities */
> +        *features |= BIT_ULL(VHOST_F_LOG_ALL);
>       }
>   
>       return ret;
> @@ -1039,8 +1042,25 @@ static int vhost_vdpa_set_features(struct vhost_dev *dev,
>   
>       if (v->shadow_vqs_enabled) {
>           uint64_t dev_features, svq_features, acked_features;
> +        uint8_t status = 0;
>           bool ok;
>   
> +        ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status);
> +        if (unlikely(ret)) {
> +            return ret;
> +        }
> +
> +        if (status & VIRTIO_CONFIG_S_DRIVER_OK) {
> +            /*
> +             * vhost is trying to enable or disable _F_LOG, and the device
> +             * would report wrong dirty pages. SVQ handles it.
> +             */


I fail to understand this comment, I'd think there's no way to disable 
dirty page tracking for SVQ.

Thanks


> +            return 0;
> +        }
> +
> +        /* We must not ack _F_LOG if SVQ is enabled */
> +        features &= ~BIT_ULL(VHOST_F_LOG_ALL);
> +
>           ret = vhost_vdpa_get_dev_features(dev, &dev_features);
>           if (ret != 0) {
>               error_report("Can't get vdpa device features, got (%d)", ret);


