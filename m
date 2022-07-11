Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C6F56D764
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 10:06:29 +0200 (CEST)
Received: from localhost ([::1]:54910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAoR1-0005dG-Kt
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 04:06:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oAoLE-0001BO-Km
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 04:00:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oAoLB-0008FY-N1
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 04:00:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657526424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vfYKBHIFNYPxrP9+9cPqwTghgrC6hjhiqSSvju+Ed2s=;
 b=Ctt42od4ozgilUAiuX6BX/JbbGtZX1ckS+zjvt4NPIOYhClWEoKvD00FfLviOu2haKVyw/
 Kqw1zCtcnpAohZqDmSlM0Kev5ppAQ0P6gBlWbzQ+wsncYIyftj+YKUZSs3YfsabudJaBvl
 FS7Ewd8IJHVEBLt5hk2MVQzWZz90aHs=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-wTXX_DUKOgGTtB69ejG9RA-1; Mon, 11 Jul 2022 04:00:23 -0400
X-MC-Unique: wTXX_DUKOgGTtB69ejG9RA-1
Received: by mail-pg1-f198.google.com with SMTP id
 f9-20020a636a09000000b00401b6bc63beso1586694pgc.23
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 01:00:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vfYKBHIFNYPxrP9+9cPqwTghgrC6hjhiqSSvju+Ed2s=;
 b=ywJj/egUAjrPtoX6irtDTvMpmRw9eP7H482YP+P5mkQpN16Y5TZju1KWD7/m/iwmZr
 qNLwnjmjaEAHhLnUGAG7tM8PE2c1FX/Jcu5wu5LNVXFHWuXDjb8m8saWlcR/oEMLytbO
 4oDn06ewULAlzJQL+3ouwTTcGrAfLn5P5GLaFYSVPJVlOLdiEFXRQ0dUZ9joZkwmMBLo
 yDRKyws6gUw40mR+PUDw3stM4U5iENWBTWIbemVwaXtXdMBCL7ZugyLkX4fOCW5Sm/k7
 H5zbznr66SUKKZpILbX5qmw2v+1DrpxpBuuLarXOZGC3YZ2ulOx/uRHS/A9yhV6A1xzN
 zl6A==
X-Gm-Message-State: AJIora//6pFMKELTvzsSTR00RRC5vGKn39rXKt8RT2HF0kRZSyXErT3p
 LewZvGTpaWZ5gH711BfzQNzDp/Jp0dIAXK8iDAWq3C/umUlycXav8Jn5cN0bedIkR8xIBB/6dL7
 tNZz0IBYvzPwSR6c=
X-Received: by 2002:a17:902:d2c8:b0:16c:58d:727e with SMTP id
 n8-20020a170902d2c800b0016c058d727emr17094912plc.76.1657526422520; 
 Mon, 11 Jul 2022 01:00:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sw/sPRaDtB638suUlq5Yoyx6yjluDNiyWYwrvjX4aYYnZztVeBg3AgZ6UCxYzgN7Uf6vxjmw==
X-Received: by 2002:a17:902:d2c8:b0:16c:58d:727e with SMTP id
 n8-20020a170902d2c800b0016c058d727emr17094883plc.76.1657526422228; 
 Mon, 11 Jul 2022 01:00:22 -0700 (PDT)
Received: from [10.72.13.214] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a170903245100b0016c2ccb0ec3sm4044576pls.19.2022.07.11.01.00.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 01:00:21 -0700 (PDT)
Message-ID: <48852cd1-fe92-81a1-8c35-ec1d8956f1a8@redhat.com>
Date: Mon, 11 Jul 2022 16:00:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [RFC PATCH v9 08/23] vhost: Decouple vhost_svq_add_split from
 VirtQueueElement
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eric Blake <eblake@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Cindy Lu <lulu@redhat.com>
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-9-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220706184008.1649478-9-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/7/7 02:39, Eugenio Pérez 写道:
> VirtQueueElement comes from the guest, but we're heading SVQ to be able
> to inject element without the guest's knowledge.
>
> To do so, make this accept sg buffers directly, instead of using
> VirtQueueElement.
>
> Add vhost_svq_add_element to maintain element convenience
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-shadow-virtqueue.c | 38 +++++++++++++++++++++---------
>   1 file changed, 27 insertions(+), 11 deletions(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index 2fc5789b73..46d3c1d74f 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -172,30 +172,32 @@ static bool vhost_svq_vring_write_descs(VhostShadowVirtqueue *svq, hwaddr *sg,
>   }
>   
>   static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
> -                                VirtQueueElement *elem, unsigned *head)
> +                                const struct iovec *out_sg, size_t out_num,
> +                                const struct iovec *in_sg, size_t in_num,
> +                                unsigned *head)
>   {
>       unsigned avail_idx;
>       vring_avail_t *avail = svq->vring.avail;
>       bool ok;
> -    g_autofree hwaddr *sgs = g_new(hwaddr, MAX(elem->out_num, elem->in_num));
> +    g_autofree hwaddr *sgs = NULL;


Is this change a must for this patch? (looks not related to the 
decoupling anyhow)

Other looks good.

Thanks


>   
>       *head = svq->free_head;
>   
>       /* We need some descriptors here */
> -    if (unlikely(!elem->out_num && !elem->in_num)) {
> +    if (unlikely(!out_num && !in_num)) {
>           qemu_log_mask(LOG_GUEST_ERROR,
>                         "Guest provided element with no descriptors");
>           return false;
>       }
>   
> -    ok = vhost_svq_vring_write_descs(svq, sgs, elem->out_sg, elem->out_num,
> -                                     elem->in_num > 0, false);
> +    sgs = g_new(hwaddr, MAX(out_num, in_num));
> +    ok = vhost_svq_vring_write_descs(svq, sgs, out_sg, out_num, in_num > 0,
> +                                     false);
>       if (unlikely(!ok)) {
>           return false;
>       }
>   
> -    ok = vhost_svq_vring_write_descs(svq, sgs, elem->in_sg, elem->in_num, false,
> -                                     true);
> +    ok = vhost_svq_vring_write_descs(svq, sgs, in_sg, in_num, false, true);
>       if (unlikely(!ok)) {
>           /* TODO unwind out_sg */
>           return false;
> @@ -223,10 +225,13 @@ static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
>    * takes ownership of the element: In case of failure, it is free and the SVQ
>    * is considered broken.
>    */
> -static bool vhost_svq_add(VhostShadowVirtqueue *svq, VirtQueueElement *elem)
> +static bool vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
> +                          size_t out_num, const struct iovec *in_sg,
> +                          size_t in_num, VirtQueueElement *elem)
>   {
>       unsigned qemu_head;
> -    bool ok = vhost_svq_add_split(svq, elem, &qemu_head);
> +    bool ok = vhost_svq_add_split(svq, out_sg, out_num, in_sg, in_num,
> +                                  &qemu_head);
>       if (unlikely(!ok)) {
>           g_free(elem);
>           return false;
> @@ -250,6 +255,18 @@ static void vhost_svq_kick(VhostShadowVirtqueue *svq)
>       event_notifier_set(&svq->hdev_kick);
>   }
>   
> +static bool vhost_svq_add_element(VhostShadowVirtqueue *svq,
> +                                  VirtQueueElement *elem)
> +{
> +    bool ok = vhost_svq_add(svq, elem->out_sg, elem->out_num, elem->in_sg,
> +                            elem->in_num, elem);
> +    if (ok) {
> +        vhost_svq_kick(svq);
> +    }
> +
> +    return ok;
> +}
> +
>   /**
>    * Forward available buffers.
>    *
> @@ -302,12 +319,11 @@ static void vhost_handle_guest_kick(VhostShadowVirtqueue *svq)
>                   return;
>               }
>   
> -            ok = vhost_svq_add(svq, elem);
> +            ok = vhost_svq_add_element(svq, g_steal_pointer(&elem));
>               if (unlikely(!ok)) {
>                   /* VQ is broken, just return and ignore any other kicks */
>                   return;
>               }
> -            vhost_svq_kick(svq);
>           }
>   
>           virtio_queue_set_notification(svq->vq, true);


