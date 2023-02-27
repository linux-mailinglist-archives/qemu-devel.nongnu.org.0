Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 791FD6A3C49
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:21:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWXje-0003Xr-DR; Mon, 27 Feb 2023 02:15:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pWXjY-0003Wz-W7
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 02:15:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pWXjQ-000545-9W
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 02:15:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677482115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7SySw8/CNyrMF5cRsCFPlxbhx3jjhT+MiUqznIwp8Ks=;
 b=OFxC0Y5VLbelvgOIjzQ7mW7PuY77kr/IN1Fp34t2lTOGksIv/yynhaD3S5FbIrKSGrr7YN
 98IuL+UYAGjaGbkSJHWpf8f33jrp9QzhR28muyIEhyr9Z6Hdx9PXymEuhKtGMe9d9i9EUG
 E+GcfRqYZ/lz6Rla3Z+nSMm5rtjqyNs=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-340-Ng0dRZF0Nb-T-UnALVByxQ-1; Mon, 27 Feb 2023 02:15:11 -0500
X-MC-Unique: Ng0dRZF0Nb-T-UnALVByxQ-1
Received: by mail-pj1-f71.google.com with SMTP id
 mm13-20020a17090b358d00b002377ec65e7aso4716504pjb.7
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 23:15:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7SySw8/CNyrMF5cRsCFPlxbhx3jjhT+MiUqznIwp8Ks=;
 b=6/HZZCwD01TEd/e4NcCk2gqVTVDeMdfubdCnMW5ATJ+FX9dpaHuMlYg7LKJWsTuecy
 iXAalVfjl6G6dUsRQk48i1TQr/bx8xI1v059Mk0fb40eNrYB1STPE/ANrFPRNnwWlH0T
 Ue9ctj8+X04izpRtqWL631PStXk3jNxUfcKaDvlO0SHkwYxYs3mwkr5v8mZASmgkJrGO
 wOYggjcERHqgmmdZ4KbL7C0ERvz8UHcQz+qT2/yOFCh2o3Tib+oD0cfvUkL5CVfMyZ39
 MP+j6t93QnY1/smKsWdqdT2GAc1DpeKfPMf/5GV4zJDyLAZvljkCVqrZwd6Y6HkAg506
 GhFQ==
X-Gm-Message-State: AO0yUKWMZ/3ISDI37Z29/mzzkVKA9PD/X9bKDLtz4Zf4FxjdUQ9fE3Am
 0UebzXsq9qhGC8HMkQN/uxhYl1VGys+Il0RaKzrQabyNlqyAqEnnYZbHbkE5pcT1p1RGq/F+/s4
 qXfVP7Avsy/isIoU=
X-Received: by 2002:a17:902:f9cb:b0:19d:1230:438f with SMTP id
 kz11-20020a170902f9cb00b0019d1230438fmr2198496plb.37.1677482110267; 
 Sun, 26 Feb 2023 23:15:10 -0800 (PST)
X-Google-Smtp-Source: AK7set8Hfo5s9SM/In7JklsCABMu6wxF3hzv3LjCxqeU/OgNKtbhQhlDt88eSLq3Ud5sdgi/jItAIg==
X-Received: by 2002:a17:902:f9cb:b0:19d:1230:438f with SMTP id
 kz11-20020a170902f9cb00b0019d1230438fmr2198465plb.37.1677482109936; 
 Sun, 26 Feb 2023 23:15:09 -0800 (PST)
Received: from [10.72.13.83] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a170902fe0c00b0019a7f493151sm3768774plj.212.2023.02.26.23.15.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Feb 2023 23:15:09 -0800 (PST)
Message-ID: <3c485561-b993-1f4f-8003-073c1e27bc6b@redhat.com>
Date: Mon, 27 Feb 2023 15:15:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 03/15] vdpa: stop svq at vhost_vdpa_dev_start(false)
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Stefano Garzarella <sgarzare@redhat.com>,
 Shannon Nelson <snelson@pensando.io>, Gautam Dawar <gdawar@xilinx.com>,
 Laurent Vivier <lvivier@redhat.com>, alvaro.karsz@solid-run.com,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, si-wei.liu@oracle.com,
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>,
 Eli Cohen <eli@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>
References: <20230224155438.112797-1-eperezma@redhat.com>
 <20230224155438.112797-4-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20230224155438.112797-4-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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


在 2023/2/24 23:54, Eugenio Pérez 写道:
> It used to be done at vhost_vdpa_svq_cleanup, since a device couldn't
> switch to SVQ mode dynamically.  Now that we need to fetch the state and
> trust SVQ will not modify guest's used_idx at migration, stop
> effectively SVQ at suspend time, as a real device would do.
>
> Leaving old vhost_svq_stop call at vhost_vdpa_svq_cleanup, as its
> supported to call it many times and it follows other operations that are
> called redundantly there too:
> * vhost_vdpa_host_notifiers_uninit
> * memory_listener_unregister
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
> v3: New in v3
> ---
>   hw/virtio/vhost-vdpa.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 4f72a52a43..d9260191cc 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -1100,10 +1100,11 @@ static void vhost_vdpa_svqs_stop(struct vhost_dev *dev)
>   
>       for (unsigned i = 0; i < v->shadow_vqs->len; ++i) {
>           VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, i);
> +
> +        vhost_svq_stop(svq);
>           vhost_vdpa_svq_unmap_rings(dev, svq);
>   
>           event_notifier_cleanup(&svq->hdev_kick);
> -        event_notifier_cleanup(&svq->hdev_call);


Any reason we need to not clean callfd? (Not explained in the change 
log, or should be another patch?).

Thanks


>       }
>   }
>   


