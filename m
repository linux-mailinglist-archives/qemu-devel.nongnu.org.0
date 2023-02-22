Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C1369EDBB
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 05:02:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUgJY-0002lc-2q; Tue, 21 Feb 2023 23:01:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pUgJT-0002l7-LJ
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 23:01:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pUgJS-0002Zz-6l
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 23:01:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677038460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fmRayasExJeNhhzK+HSfTytMdHkE5pgyyCiwSyMtjIA=;
 b=HGXQudnguWtSD6fGRvakeB5veCZp1X4nBQcqMaxhuoTio9XzIx32N6hIscmEZR9rOEB4SG
 JH22GRSq093Ch1mbBIWgogUpMdFwNAzYofJYBbCb2XWUiw3ga4+83RiJ3dOKflCKHCDxsZ
 nNQ6S/LOoXIACdGLNQojWxikZwBbuuE=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-638-qwSuUo93MQeK5qAAcvAhmg-1; Tue, 21 Feb 2023 23:00:58 -0500
X-MC-Unique: qwSuUo93MQeK5qAAcvAhmg-1
Received: by mail-pl1-f199.google.com with SMTP id
 j18-20020a170903025200b00198aa765a9dso3296698plh.6
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 20:00:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fmRayasExJeNhhzK+HSfTytMdHkE5pgyyCiwSyMtjIA=;
 b=PfeA3z72gQO5vTOyRMq0v/4AmqivokyReBKeSRMrGUk8pcWFKSEEULuT1LIJywPj6u
 Bsiuw8l1t9xu72jX5ZKz4fhfp1ofNLLc8OyxJ2vJt63IWBbxh7DL3B4OJ5aA+ojHcUd4
 u9dl30R5E/DBmdP1HCROWobNpR56sVatE+pbRgtpjiM2ROo2vsr58aypYm0CKx+u0/63
 c0V7eE8oNvJNVVGAZdHFnrKYNmkd0iVwmq7PxXfG3oJzSDdxDlZqW2A1Otnn12UvN9HR
 26E2eQfOxshylDrjoG+bF0iwoMhMFTAr2qX6xKEn1uLXO6jh9ERiygl40MeTa6RprWFf
 Iuww==
X-Gm-Message-State: AO0yUKU8xXfxmzWsljkULd/fr4gQ60Q31qho1MX2VYIik2YzICabB4Pn
 Qzv87zmH7676SNvV6mj7AK9B5oA3MYY1qvHCzhvbESilwe2dK0QNsPAyEncuFOP/9N76KeCEm19
 O/oUe/RtsTtbWw0w=
X-Received: by 2002:a17:902:d4cb:b0:19a:b033:2bb0 with SMTP id
 o11-20020a170902d4cb00b0019ab0332bb0mr10410782plg.46.1677038457462; 
 Tue, 21 Feb 2023 20:00:57 -0800 (PST)
X-Google-Smtp-Source: AK7set/pqa7UCHaDJihAZdavmu87pdCyEwLp/aYzCk/mPBK8E7A3NJteJReXb07+0MI8F4XPc6po1w==
X-Received: by 2002:a17:902:d4cb:b0:19a:b033:2bb0 with SMTP id
 o11-20020a170902d4cb00b0019ab0332bb0mr10410765plg.46.1677038457197; 
 Tue, 21 Feb 2023 20:00:57 -0800 (PST)
Received: from [10.72.13.76] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a1709026b8200b0019c61616f82sm5188337plk.230.2023.02.21.20.00.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 20:00:56 -0800 (PST)
Message-ID: <de141eaa-6cc4-e942-9fff-de4dcee8625f@redhat.com>
Date: Wed, 22 Feb 2023 12:00:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 09/13] vdpa net: block migration if the device has CVQ
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
 <20230208094253.702672-10-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20230208094253.702672-10-eperezma@redhat.com>
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
> Devices with CVQ needs to migrate state beyond vq state.  Leaving this
> to future series.


I may miss something but what is missed to support CVQ/MQ?

Thanks


>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   net/vhost-vdpa.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index bca13f97fd..309861e56c 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -955,11 +955,17 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>       }
>   
>       if (has_cvq) {
> +        VhostVDPAState *s;
> +
>           nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
>                                    vdpa_device_fd, i, 1, false,
>                                    opts->x_svq, iova_range);
>           if (!nc)
>               goto err;
> +
> +        s = DO_UPCAST(VhostVDPAState, nc, nc);
> +        error_setg(&s->vhost_vdpa.dev->migration_blocker,
> +                   "net vdpa cannot migrate with MQ feature");
>       }
>   
>       return 0;


