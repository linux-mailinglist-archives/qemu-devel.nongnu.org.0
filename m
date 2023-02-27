Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACAF6A3C4B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:21:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWYbZ-0001DE-DH; Mon, 27 Feb 2023 03:11:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pWYbR-00013E-N9
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 03:11:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pWYbQ-0005n4-4o
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 03:11:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677485478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hUtR13nE9ADMPfRUasH4TVIIvHusnhAtQQrD5pDjQxw=;
 b=XaohO3YL1UUQ8cLVp/rJlZWQAfczznPgJeSWIc8/VEOnnNau9Z+EzZj8bkglCuyB1DpyY8
 4UnME+Nq/TAkZ4KQlsSVZBr8EdsdKABNYhD/ZWx+i1ppLB01qQzgWdrfJKxR1wti52vQq8
 iiSFKzqEPHl+dVyTbbCbANpf74FpJk0=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-435-b51Dw0DnNg23A014n-RNsQ-1; Mon, 27 Feb 2023 03:11:17 -0500
X-MC-Unique: b51Dw0DnNg23A014n-RNsQ-1
Received: by mail-pf1-f198.google.com with SMTP id
 a10-20020a056a000c8a00b005fc6b117942so94640pfv.2
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 00:11:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hUtR13nE9ADMPfRUasH4TVIIvHusnhAtQQrD5pDjQxw=;
 b=LVEZnHcO9LVH9NBkHjxGeNY9bwLGOBU3y0j2wZQ0AK9L3N7LjeWD+N8ebIpfnvdTfU
 K5WOXQD7vbG5yXyLkktrMAz7Em7SOqvcywszuTlsC83LnRleigNC5O4kdD2Uydtmy5iV
 z7IoQrB3kdRezV6h/SuYd+3JmtU2+pINwRnFnG8kqR4GoOqEtTf+P9jro5xjoVwq7wR0
 93Tr1V2bNoBl1FCcz09OhPBvTftc8HgY0MwV+UW2rX0R5eV0HZXWfi3/32cqy/5lYrma
 Zwtylg0gjO4dzuInU/cPGWBlFy2ES0yqwzs6BEhnFZJ/N4/8YGiE+SwwrLQjhPdaRwnC
 i+XQ==
X-Gm-Message-State: AO0yUKXY0KxrWE8G27C5qKy1r5M2onzQzEENDr5x2ONjL2vjhNmJnsQL
 nM52q0fkMexiIk5e8XS9n9eVl6pNdSAn6Y2DBUBNhDMeoF/A5dlmd3o3V0Wlg7+APW98AZzsaTa
 lB5c7BaPEPquQvOI=
X-Received: by 2002:a05:6a20:3d22:b0:cb:2c8e:14c with SMTP id
 y34-20020a056a203d2200b000cb2c8e014cmr28921264pzi.10.1677485475483; 
 Mon, 27 Feb 2023 00:11:15 -0800 (PST)
X-Google-Smtp-Source: AK7set8BhUGj4vcSwHgyu0gKLYPNZhMCRxlPQM0ZRXhswU/X8LocF0YSDbVhbN1tzMwhbVQS25+x4Q==
X-Received: by 2002:a05:6a20:3d22:b0:cb:2c8e:14c with SMTP id
 y34-20020a056a203d2200b000cb2c8e014cmr28921230pzi.10.1677485475193; 
 Mon, 27 Feb 2023 00:11:15 -0800 (PST)
Received: from [10.72.13.83] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 g66-20020a636b45000000b004ff6b744248sm3471596pgc.48.2023.02.27.00.11.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 00:11:14 -0800 (PST)
Message-ID: <45482a90-1bb6-fc67-3fbd-86833d7d00c1@redhat.com>
Date: Mon, 27 Feb 2023 16:11:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 10/15] vdpa: disable RAM block discard only for the
 first device
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
 <20230224155438.112797-11-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20230224155438.112797-11-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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
> Although it does not make a big difference, its more correct and
> simplifies the cleanup path in subsequent patches.
>
> Move ram_block_discard_disable(false) call to the top of
> vhost_vdpa_cleanup because:
> * We cannot use vhost_vdpa_first_dev after dev->opaque = NULL
>    assignment.
> * Improve the stack order in cleanup: since it is the last action taken
>    in init, it should be the first at cleanup.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-vdpa.c | 25 ++++++++++++++-----------
>   1 file changed, 14 insertions(+), 11 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 71e3dc21fe..27655e7582 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -431,16 +431,6 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
>       trace_vhost_vdpa_init(dev, opaque);
>       int ret;
>   
> -    /*
> -     * Similar to VFIO, we end up pinning all guest memory and have to
> -     * disable discarding of RAM.
> -     */
> -    ret = ram_block_discard_disable(true);
> -    if (ret) {
> -        error_report("Cannot set discarding of RAM broken");
> -        return ret;
> -    }
> -
>       v = opaque;
>       v->dev = dev;
>       dev->opaque =  opaque ;
> @@ -452,6 +442,16 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
>           return 0;
>       }
>   
> +    /*
> +     * Similar to VFIO, we end up pinning all guest memory and have to
> +     * disable discarding of RAM.
> +     */
> +    ret = ram_block_discard_disable(true);
> +    if (ret) {
> +        error_report("Cannot set discarding of RAM broken");
> +        return ret;
> +    }


We seems to lose the chance to free svq allocated by 
vhost_vdpa_init_svq() in this case?

Thanks


> +
>       vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>                                  VIRTIO_CONFIG_S_DRIVER);
>   
> @@ -577,12 +577,15 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev)
>       assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
>       v = dev->opaque;
>       trace_vhost_vdpa_cleanup(dev, v);
> +    if (vhost_vdpa_first_dev(dev)) {
> +        ram_block_discard_disable(false);
> +    }
> +
>       vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
>       memory_listener_unregister(&v->listener);
>       vhost_vdpa_svq_cleanup(dev);
>   
>       dev->opaque = NULL;
> -    ram_block_discard_disable(false);
>   
>       return 0;
>   }


