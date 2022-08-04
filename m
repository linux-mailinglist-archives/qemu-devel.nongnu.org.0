Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FEA58965C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 05:03:40 +0200 (CEST)
Received: from localhost ([::1]:36708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJR98-0001MO-Ur
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 23:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJR78-0007dx-KA
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 23:01:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJR74-0005Q1-Pj
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 23:01:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659582088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mUZkUzAL/hyC3ByhyQrlSVx7bzH2OgNHBTPcccznWhc=;
 b=THdWgBivRpDZpDZWqQpfXLk0zBAnhYVr802/VpYNjMujl324GRvstazVobmbK2fAE3QU3p
 Q1kO89975I+4idYBYdVv+GBsMZ01H4h5Y3ro/iIq9CQf7TIKcaS/FBNKsGjeszUwSgdUzg
 WDLegi5Un6Qfk9iKh6ja3YnYBHZSTG8=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-3iw49upgPZG9euxlbz12pg-1; Wed, 03 Aug 2022 23:01:26 -0400
X-MC-Unique: 3iw49upgPZG9euxlbz12pg-1
Received: by mail-pj1-f71.google.com with SMTP id
 s4-20020a17090a760400b001f3120342daso8101180pjk.4
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 20:01:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mUZkUzAL/hyC3ByhyQrlSVx7bzH2OgNHBTPcccznWhc=;
 b=Xpo5zbCWPFYssA8A/VLPKPCOn2DU8kHD6cy5veMSFBrHt+OSFOvCjyeCbiXtUhTu3l
 IAJ2ZpPTnjYZDvSdH7li1krO4T5dDWO5gbbiMi4cbUHHxrs8ezz3Umvb/BE8h9ZfOqL3
 zPpatmZ/fgxF5N/OBsrpyBC4RTySxYTYTVAW2SQICPqIsokm1F8NKi7HxbjNucCxWks8
 H9jySoCkMfv9dJM1yPwGsv7SniLnKUOxNX8y69QcvN3T7Ah0Ad+udUzFQuwvetfxOcsw
 uThg7qAzua0YurJtB/QGLeYqWZJ4v4YT6s1lhwfh+X8PuMzeEQU1Z0ZLKWmEo7kkgUL3
 QfBQ==
X-Gm-Message-State: ACgBeo0qMuR2FQturX7fEvIUdw3cDJNS03YFFVvZ93PkIPCwsPUsIDUo
 ZBei3ZRkMyY8PgTWiZX35leeSyM8F8NKRo1LBCnG0i/oc+jpOL6VONseEBVW2AOUHAXN/tOhDWX
 pmqnc+o3Mn17jVNE=
X-Received: by 2002:a05:6a00:1949:b0:52d:a742:ff9c with SMTP id
 s9-20020a056a00194900b0052da742ff9cmr14510212pfk.10.1659582085688; 
 Wed, 03 Aug 2022 20:01:25 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7GgwNaJTrKbCGiPW06sTd+/lL6ZQ0LAPo/4P7k0wuEzgqK7Qx4zsrk8YbfQUGdWyjoOG5Yrw==
X-Received: by 2002:a05:6a00:1949:b0:52d:a742:ff9c with SMTP id
 s9-20020a056a00194900b0052da742ff9cmr14510173pfk.10.1659582085322; 
 Wed, 03 Aug 2022 20:01:25 -0700 (PDT)
Received: from [10.72.12.192] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 w17-20020aa79a11000000b0052e0e6c76f1sm2915764pfj.0.2022.08.03.20.01.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 20:01:24 -0700 (PDT)
Message-ID: <6ca24679-7d2b-a3ab-4c9e-a83745682808@redhat.com>
Date: Thu, 4 Aug 2022 11:01:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v5 02/10] vhost: use SVQ element ndescs instead of opaque
 data for desc validation
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Markus Armbruster <armbru@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
References: <20220802175731.312115-1-eperezma@redhat.com>
 <20220802175731.312115-3-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220802175731.312115-3-eperezma@redhat.com>
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


在 2022/8/3 01:57, Eugenio Pérez 写道:
> Since we're going to allow SVQ to add elements without the guest's
> knowledge and without its own VirtQueueElement, it's easier to check if
> an element is a valid head checking a different thing than the
> VirtQueueElement.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---


Patch looks good to me. But I spot several other issues:

1) vhost_svq_add() use size_t for in_num and out_num, is this intended?
2) do we need to fail vhost_svq_add() if in_num + out_num == 0?

Thanks


>   hw/virtio/vhost-shadow-virtqueue.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index ffd2b2c972..e6eebd0e8d 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -414,7 +414,7 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
>           return NULL;
>       }
>   
> -    if (unlikely(!svq->desc_state[used_elem.id].elem)) {
> +    if (unlikely(!svq->desc_state[used_elem.id].ndescs)) {
>           qemu_log_mask(LOG_GUEST_ERROR,
>               "Device %s says index %u is used, but it was not available",
>               svq->vdev->name, used_elem.id);
> @@ -422,6 +422,7 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
>       }
>   
>       num = svq->desc_state[used_elem.id].ndescs;
> +    svq->desc_state[used_elem.id].ndescs = 0;
>       last_used_chain = vhost_svq_last_desc_of_chain(svq, num, used_elem.id);
>       svq->desc_next[last_used_chain] = svq->free_head;
>       svq->free_head = used_elem.id;


