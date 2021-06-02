Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A23398487
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 10:49:55 +0200 (CEST)
Received: from localhost ([::1]:33896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loMZW-0005Uh-3O
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 04:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1loMYE-0004Lt-VH
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 04:48:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1loMYC-0008Df-PU
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 04:48:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622623711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B0fS3amoKXDjX2Nq1rP7N8TvBLlRZPXWAOBVcA3zd8A=;
 b=A2j7oHLpfHHuT08seiFRSbQzkveXPkI2CPw6hHF2D5H0gw3YjXSvycfZ2wmpNRAf4n8JKo
 XhHoi8ACNZALTnQu2xv2OJUY1b8AqXv8tsh4ua0QAYNSIo30Uu3TYLy6aBz8qZnfG4nFCI
 6NMA5hOUeMOKWz2DQquIOioDReMrtoI=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-83J-EO0TMtCoptc0Oo_Vyw-1; Wed, 02 Jun 2021 04:48:30 -0400
X-MC-Unique: 83J-EO0TMtCoptc0Oo_Vyw-1
Received: by mail-pj1-f71.google.com with SMTP id
 v10-20020a17090a7c0ab029015f673a4c30so1229650pjf.5
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 01:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=B0fS3amoKXDjX2Nq1rP7N8TvBLlRZPXWAOBVcA3zd8A=;
 b=UBXIrPVXW+NGYG7b4Yqp8X/kBjz57SEB+xKgKAJ9BPtqxqcidzCKtp+USI0B8s8GZE
 n0ckD+LpOmJxN516Kfmjbts/JUpUotD8dU0O7Gd+kl+EtZ+WxdQmuV6bacJ6yK2WwPgt
 TMnUDQQie3HBfqDZQoqzzgiiIvWNKKTASoNfrW03zktgiyHne3vCGcowLtbtncuVXMmB
 oHWjyCPcjFlWsQYh2rl1X0VzqzruXKVQHTX1HVyAhiqvB0oELsSMkNxAL6aHwmaAp7C1
 FZ/qDcPHuBpQ8kEO5ARCghXAY0V6DzOyrKP7/AQryeMNddGc3ZkPH0nJGArWaf048Yjb
 qUjw==
X-Gm-Message-State: AOAM530i2+Hpk3A8K/19bJEqS9dwePV9hdVNOEi5ZWyx7vNmtYsYuJei
 SstJ5/2lg4nCVWbNQEyWXf23DqPzDd3CLsgYZ3kNpa+EQmZWJJfTue9a68NIlvsIxWqrztDZ758
 8yBsNbLpbL1RXhpI=
X-Received: by 2002:a17:90a:5998:: with SMTP id
 l24mr2832761pji.64.1622623709563; 
 Wed, 02 Jun 2021 01:48:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqJOCyjbbChGf0P0gsbTmMWg/7XuX7DoNUIzCD+x4GoF8QBC7bO1LWUT74qL0H6Q7+xGTngA==
X-Received: by 2002:a17:90a:5998:: with SMTP id
 l24mr2832741pji.64.1622623709311; 
 Wed, 02 Jun 2021 01:48:29 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id w26sm17144967pgl.50.2021.06.02.01.48.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 01:48:28 -0700 (PDT)
Subject: Re: [PATCH 1/2] vhost-vdpa: don't initialize backend_features
To: Gautam Dawar <gdawar@xilinx.com>, "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20210602033127.40149-1-jasowang@redhat.com>
 <BY5PR02MB69805AC4C88DFE9E5172D8BDB13D9@BY5PR02MB6980.namprd02.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <af3abe28-69e3-326a-4867-4afc42856f43@redhat.com>
Date: Wed, 2 Jun 2021 16:48:19 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <BY5PR02MB69805AC4C88DFE9E5172D8BDB13D9@BY5PR02MB6980.namprd02.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
 "lulu@redhat.com" <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gautam:

在 2021/6/2 下午3:38, Gautam Dawar 写道:
> Hi Jason,
>
> Pls see my comments inline marked by GD>>
>
> Regards,
> Gautam
>
> -----Original Message-----
> From: Jason Wang <jasowang@redhat.com>
> Sent: Wednesday, June 2, 2021 9:01 AM
> To: mst@redhat.com; qemu-devel@nongnu.org
> Cc: Gautam Dawar <gdawar@xilinx.com>; lulu@redhat.com; Jason Wang <jasowang@redhat.com>; qemu-stable@nongnu.org
> Subject: [PATCH 1/2] vhost-vdpa: don't initialize backend_features
>
> We used to initialize backend_features during vhost_vdpa_init() regardless whether or not it was supported by vhost. This will lead the unsupported features like VIRTIO_F_IN_ORDER to be included and set to the vhost-vdpa during vhost_dev_start. Because the VIRTIO_F_IN_ORDER is not supported by vhost-vdpa so it won't be advertised to guest which will break the datapath.
>
> Fix this by not initializing the backend_features, so the acked_features could be built only from guest features via vhost_net_ack_features().
>
> Fixes: 108a64818e69b ("vhost-vdpa: introduce vhost-vdpa backend")
> Cc: qemu-stable@nongnu.org
> Cc: Gautam Dawar <gdawar@xilinx.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>   hw/virtio/vhost-vdpa.c | 3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c index 01d2101d09..5fe43a4eb5 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -275,15 +275,12 @@ static void vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)  static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque)  {
>       struct vhost_vdpa *v;
> -    uint64_t features;
>       assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
>       trace_vhost_vdpa_init(dev, opaque);
>   
>       v = opaque;
>       v->dev = dev;
>       dev->opaque =  opaque ;
> -    vhost_vdpa_call(dev, VHOST_GET_FEATURES, &features);
> -    dev->backend_features = features;
> [GD>>] Should this be initialized with 0 here? I am not sure if  memory allocated for struct vhost_dev is initialized with 0.


See vhost_net_init:

     struct vhost_net *net = g_new0(struct vhost_net, 1);

vhost_dev is embedded in the vhost_net structure. So I think it should 
be zero.

Thanks


>       v->listener = vhost_vdpa_memory_listener;
>       v->msg_type = VHOST_IOTLB_MSG_V2;
>   
> --
> 2.25.1
>


