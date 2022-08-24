Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C0B59F2AD
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 06:32:18 +0200 (CEST)
Received: from localhost ([::1]:39252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQi3u-00026i-0x
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 00:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQhzf-0004f9-L5
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 00:27:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQhzd-0003xx-Ou
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 00:27:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661315273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/3bKK11CLKH1XbdLLTBc0QOp9x9ducOVaT5k+ovg6AI=;
 b=f95DGaDI1O8JUir30TPmBcP61h6STnwjnQBOYBlNVxbMxfzyUcHRodOdVuvGR3eVzom9dr
 9+ZIv+r+o3jIMBM6PoTxCYE3oyRHb4OdSL5JeD/2fAN7EeoFXJXIZHyvhJPLBrlTbe1VQe
 BeY7CuBk5/+NmzcMTtFdyg7824LuPMw=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-97-QjPI8bEgOiGBVQk3RFxYUQ-1; Wed, 24 Aug 2022 00:27:51 -0400
X-MC-Unique: QjPI8bEgOiGBVQk3RFxYUQ-1
Received: by mail-pg1-f199.google.com with SMTP id
 f186-20020a636ac3000000b0042af745d56cso1507135pgc.17
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 21:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=/3bKK11CLKH1XbdLLTBc0QOp9x9ducOVaT5k+ovg6AI=;
 b=2zTIIexK4NjgQbpdT8GEMVQcGUhCsjjp2iyw0TamD5cHDaAj9JKW2LGFE0vCJiOrQ2
 6UCpPsWx6vPWsVi4PVxMWcS0IKhBCapaoAnZejzNf8SJwsd3gPjY+n66mUeIZCr9ZiyC
 36BmsJAwrwmPEcI7GRRONP26nljGQatSc1r9Fa5EJKh4wcwnQST0EfsoyXjofrxM/XTm
 MhPne85OCzMiBxfaitfGDzXlCpvBpUvLZj6ypZh8DmlwIh4mDnXqQiyTDUSK7hDNdqLz
 Qi8UsdfPDDcEZOa7p5KKe+OsnLKRt87rjEn8l08wOTf0fiIDipezkz2a284LbKz5HrN4
 kCoQ==
X-Gm-Message-State: ACgBeo1Vxgt6MK8TW+kzWpgx4ufP0eHse6pG9PsMs14as72gPxB2oUfw
 0s8qNxL7UyYhGGg+255v1LbiA+GQAUTXbnzF2luqN/Ym4r1lHsJwTrAJiA97PLuNsYnFGsj3Z4w
 V8KW0AVz3XwJ+FcI=
X-Received: by 2002:a17:90a:4801:b0:1fa:98ec:fa2 with SMTP id
 a1-20020a17090a480100b001fa98ec0fa2mr6293448pjh.41.1661315270427; 
 Tue, 23 Aug 2022 21:27:50 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6bPbi9gTeoP4lImQORadBedtWoZfao7RncumVNvtHkPUn8E96mOL2bQRdxgtnmWKtfSpxavg==
X-Received: by 2002:a17:90a:4801:b0:1fa:98ec:fa2 with SMTP id
 a1-20020a17090a480100b001fa98ec0fa2mr6293416pjh.41.1661315270050; 
 Tue, 23 Aug 2022 21:27:50 -0700 (PDT)
Received: from [10.72.13.242] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 fh12-20020a17090b034c00b001f4f76033f9sm212097pjb.49.2022.08.23.21.27.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 21:27:49 -0700 (PDT)
Message-ID: <7debe883-819a-f083-aa72-8b9e05ca5be8@redhat.com>
Date: Wed, 24 Aug 2022 12:27:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH 4/5] virtio-net: Update virtio-net curr_queue_pairs in
 vdpa backends
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Gautam Dawar <gdawar@xilinx.com>, Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>
References: <20220819171329.3597027-1-eperezma@redhat.com>
 <20220819171329.3597027-5-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220819171329.3597027-5-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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


在 2022/8/20 01:13, Eugenio Pérez 写道:
> It was returned as error before. Instead of it, simply update the
> corresponding field so qemu can send it in the migration data.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---


Looks correct.

Adding Si Wei for double check.

Thanks


>   hw/net/virtio-net.c | 17 ++++++-----------
>   1 file changed, 6 insertions(+), 11 deletions(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index dd0d056fde..63a8332cd0 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -1412,19 +1412,14 @@ static int virtio_net_handle_mq(VirtIONet *n, uint8_t cmd,
>           return VIRTIO_NET_ERR;
>       }
>   
> -    /* Avoid changing the number of queue_pairs for vdpa device in
> -     * userspace handler. A future fix is needed to handle the mq
> -     * change in userspace handler with vhost-vdpa. Let's disable
> -     * the mq handling from userspace for now and only allow get
> -     * done through the kernel. Ripples may be seen when falling
> -     * back to userspace, but without doing it qemu process would
> -     * crash on a recursive entry to virtio_net_set_status().
> -     */
> +    n->curr_queue_pairs = queue_pairs;
>       if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
> -        return VIRTIO_NET_ERR;
> +        /*
> +         * Avoid updating the backend for a vdpa device: We're only interested
> +         * in updating the device model queues.
> +         */
> +        return VIRTIO_NET_OK;
>       }
> -
> -    n->curr_queue_pairs = queue_pairs;
>       /* stop the backend before changing the number of queue_pairs to avoid handling a
>        * disabled queue */
>       virtio_net_set_status(vdev, vdev->status);


