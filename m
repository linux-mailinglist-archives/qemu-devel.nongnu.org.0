Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CA33C1F0C
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:44:51 +0200 (CEST)
Received: from localhost ([::1]:50788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1jJi-00084Q-9C
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:44:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m1izN-0004nE-MP
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 01:23:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m1izM-0004hA-6e
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 01:23:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625808227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5D+EToDAJQhJC8kVEchfcfbI2sOBmm92mCxEsoeyDYo=;
 b=H1eebe2afWgpCqtSSnWO6A5ej9EOe35WTfPhNfhlcpPpXRJM/BFf9xKp591PTFN/Ly7D0W
 6u2vmnf/bxjyGfpWA5+L4AGHqhy/HjNRKsbrZz+JE9Uqk6wlFZer7wENaU+34qCUOZc8RY
 70EhAnIUl3mqEFzzMM/4/QJziYT4XX0=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-8uAEkSrXPnukkg0XswUc9Q-1; Fri, 09 Jul 2021 01:23:46 -0400
X-MC-Unique: 8uAEkSrXPnukkg0XswUc9Q-1
Received: by mail-pj1-f72.google.com with SMTP id
 q9-20020a17090a0649b029016ffc6b9665so7675308pje.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 22:23:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=5D+EToDAJQhJC8kVEchfcfbI2sOBmm92mCxEsoeyDYo=;
 b=MpphJ51pKiVwuFj+jM04S57N3P/0226ZtwHbd/vT2W6qD60kc7s+ng2wcvwo7u6MUo
 xOfVtLO6SJYFAo9ctJ44+mEZqaTqwA/rxjN/iO6V6/hXDTVgX4ZJjfCq1eKtdE03E/gf
 EmMBMpyd566gNVziZ+8S1Igat5rWWGGko5Bj17YnoFsOazZjlBhhnZgaIBfhy4lCamGG
 Cm/ytFowFx7ZFwXv59YFYwY9mPUYlZ+kNOejnE0HjfewvBbl8uOTxHTp0Do5S0Cv/STU
 cwzzqBRV6rjXFugEtNhVQ+0nXpPU7OMXG9XkrMbWo2gRvhsI5iyhh45sVqk+TUA2T5Vc
 M7Xw==
X-Gm-Message-State: AOAM5336L+1eQ961vEJQZW8zLcotGtcAzL7h8eyNUb4OR56v0sWTJ4kL
 aZRG3KUTUtMmhR28PM/P/GKuGtk7DqAKvuNRTAo90QEvSpXJNV3hXM3qY3m1CQVxxJUnCT7ldtw
 uo9h1L37PEIJ1SVkhSTgx5nWNK9nyPJXzq7DQ3tF3bTL3FIp50seecBY3rqm3OIuJsiA=
X-Received: by 2002:a63:1214:: with SMTP id h20mr35138735pgl.355.1625808225156; 
 Thu, 08 Jul 2021 22:23:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDFVlywo3MFqiC9DNQoOBgzKbSmzNgvjvJ8sWeHFXbM0+dbUj88a21E/B4BD+Hmv0jeVSqeg==
X-Received: by 2002:a63:1214:: with SMTP id h20mr35138718pgl.355.1625808224932; 
 Thu, 08 Jul 2021 22:23:44 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id d2sm5547287pgh.59.2021.07.08.22.23.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 22:23:44 -0700 (PDT)
Subject: Re: [PATCH v8 3/9] vhost: add new call back function for config
 interrupt
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210706072030.32365-1-lulu@redhat.com>
 <20210706072030.32365-4-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <0ab1982d-5014-7fe5-64c1-b0b6a7c00df8@redhat.com>
Date: Fri, 9 Jul 2021 13:23:41 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706072030.32365-4-lulu@redhat.com>
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
> To support configure interrupt, we need to
> add a new call back function for config interrupt.
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   include/hw/virtio/vhost-backend.h | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
> index 8a6f8e2a7a..8ade8e0bd2 100644
> --- a/include/hw/virtio/vhost-backend.h
> +++ b/include/hw/virtio/vhost-backend.h
> @@ -125,6 +125,8 @@ typedef int (*vhost_get_device_id_op)(struct vhost_dev *dev, uint32_t *dev_id);
>   
>   typedef bool (*vhost_force_iommu_op)(struct vhost_dev *dev);
>   
> +typedef int (*vhost_set_config_call_op)(struct vhost_dev *dev,
> +                                       int fd);
>   typedef struct VhostOps {
>       VhostBackendType backend_type;
>       vhost_backend_init vhost_backend_init;
> @@ -170,6 +172,7 @@ typedef struct VhostOps {
>       vhost_vq_get_addr_op  vhost_vq_get_addr;
>       vhost_get_device_id_op vhost_get_device_id;
>       vhost_force_iommu_op vhost_force_iommu;
> +    vhost_set_config_call_op vhost_set_config_call;
>   } VhostOps;
>   
>   extern const VhostOps user_ops;


