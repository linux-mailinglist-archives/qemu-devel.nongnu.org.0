Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DEA5004E9
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 06:03:35 +0200 (CEST)
Received: from localhost ([::1]:53344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neqhi-0002cZ-2u
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 00:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1neqfd-0001ax-Sw
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 00:01:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1neqfa-00078Y-Je
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 00:01:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649908881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XkMmaOgC6dg1oxH8dcQMnnNtyXz42hucAwsC7WmLs5o=;
 b=LEvEEKqjzwj0tH9igdn1uUrZOj9et8rqGgupxj2lTsBbyR7rZwY+/7BbZMwrnWZGkjVI5q
 XwKyLpdQADSKY1HKmU48+/G61VB+padQGkiHa7h3AHo8wtH8rcPAh5HTU0ayLpRIv4ICqu
 ph9LP5CbB3NpFPNVyootB397CHGYPbM=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-N1oNBE_mN6ak1VN5KYHexw-1; Thu, 14 Apr 2022 00:01:20 -0400
X-MC-Unique: N1oNBE_mN6ak1VN5KYHexw-1
Received: by mail-pj1-f70.google.com with SMTP id
 oj16-20020a17090b4d9000b001c7552b7546so4835817pjb.8
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 21:01:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XkMmaOgC6dg1oxH8dcQMnnNtyXz42hucAwsC7WmLs5o=;
 b=VsqjomOyc2y+5Nun8alr7ShoIq9+VMnB3/dfIOW8RQ9FhAUbfDl3qfnWS1ou2CX6Vw
 MkTNlkkvPUpz1lAFcG8Vo4GPE4tIzDTqNb6zXuzm80MHIW3BEEWpWBQ8BJ2rmkDLepgc
 aF/Bt8nQJbo0PY6nuFFWDE53tfCsD0/7njETda3L6B88VCJHmZDyRMbPjJqLCvtlSFfu
 n9LyNWIV/QDR360Ll2tOJTW3xMBOyc5BIYvcmcofOTalAQ76UeFgLjd5BL6F5jsMgmjN
 HGmUfn++Et3UnUd5y55L+MF0kHfaPgowLG3W5+5goiNCQbAqtf+TOFFcLxnga5M3VLP1
 iF3w==
X-Gm-Message-State: AOAM530Zo1Cc4JuNmegcfIeT7AvVwBkdfe4Xx0/14B01++gL+1dsQkdH
 mlUJFUO39BK8PXt4rvOmho+s0gvR8Ol29evQ6YgOb6Pvm7jwKIX0IeEYYl22vsKOxzFLTL9+fke
 OHc2Ofe9pGMo8zYU=
X-Received: by 2002:a17:90b:1e4e:b0:1cd:530d:fdc7 with SMTP id
 pi14-20020a17090b1e4e00b001cd530dfdc7mr2140769pjb.209.1649908879593; 
 Wed, 13 Apr 2022 21:01:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtslQFgGdYY+wsSWdK8DFxoU70fB9uxkPdrWq4a5CNW/r7cc6yxUlhtEH08gLBhNPOhBz7NA==
X-Received: by 2002:a17:90b:1e4e:b0:1cd:530d:fdc7 with SMTP id
 pi14-20020a17090b1e4e00b001cd530dfdc7mr2140724pjb.209.1649908879267; 
 Wed, 13 Apr 2022 21:01:19 -0700 (PDT)
Received: from [10.72.13.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a056a00158900b004faad3ae570sm564251pfk.189.2022.04.13.21.01.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 21:01:18 -0700 (PDT)
Message-ID: <57a18f84-67d5-a83c-48db-8defaeb98781@redhat.com>
Date: Thu, 14 Apr 2022 12:01:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v7 05/25] hw/virtio: Replace g_memdup() by g_memdup2()
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220413163206.1958254-1-eperezma@redhat.com>
 <20220413163206.1958254-6-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220413163206.1958254-6-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 Gautam Dawar <gdawar@xilinx.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/4/14 00:31, Eugenio Pérez 写道:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>
> Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538
>
>    The old API took the size of the memory to duplicate as a guint,
>    whereas most memory functions take memory sizes as a gsize. This
>    made it easy to accidentally pass a gsize to g_memdup(). For large
>    values, that would lead to a silent truncation of the size from 64
>    to 32 bits, and result in a heap area being returned which is
>    significantly smaller than what the caller expects. This can likely
>    be exploited in various modules to cause a heap buffer overflow.
>
> Replace g_memdup() by the safer g_memdup2() wrapper.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---


Acked-by: Jason Wang <jasowang@redhat.com>


>   hw/net/virtio-net.c       | 3 ++-
>   hw/virtio/virtio-crypto.c | 6 +++---
>   2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 1067e72b39..e4748a7e6c 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -1443,7 +1443,8 @@ static void virtio_net_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
>           }
>   
>           iov_cnt = elem->out_num;
> -        iov2 = iov = g_memdup(elem->out_sg, sizeof(struct iovec) * elem->out_num);
> +        iov2 = iov = g_memdup2(elem->out_sg,
> +                               sizeof(struct iovec) * elem->out_num);
>           s = iov_to_buf(iov, iov_cnt, 0, &ctrl, sizeof(ctrl));
>           iov_discard_front(&iov, &iov_cnt, sizeof(ctrl));
>           if (s != sizeof(ctrl)) {
> diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
> index dcd80b904d..0e31e3cc04 100644
> --- a/hw/virtio/virtio-crypto.c
> +++ b/hw/virtio/virtio-crypto.c
> @@ -242,7 +242,7 @@ static void virtio_crypto_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
>           }
>   
>           out_num = elem->out_num;
> -        out_iov_copy = g_memdup(elem->out_sg, sizeof(out_iov[0]) * out_num);
> +        out_iov_copy = g_memdup2(elem->out_sg, sizeof(out_iov[0]) * out_num);
>           out_iov = out_iov_copy;
>   
>           in_num = elem->in_num;
> @@ -605,11 +605,11 @@ virtio_crypto_handle_request(VirtIOCryptoReq *request)
>       }
>   
>       out_num = elem->out_num;
> -    out_iov_copy = g_memdup(elem->out_sg, sizeof(out_iov[0]) * out_num);
> +    out_iov_copy = g_memdup2(elem->out_sg, sizeof(out_iov[0]) * out_num);
>       out_iov = out_iov_copy;
>   
>       in_num = elem->in_num;
> -    in_iov_copy = g_memdup(elem->in_sg, sizeof(in_iov[0]) * in_num);
> +    in_iov_copy = g_memdup2(elem->in_sg, sizeof(in_iov[0]) * in_num);
>       in_iov = in_iov_copy;
>   
>       if (unlikely(iov_to_buf(out_iov, out_num, 0, &req, sizeof(req))


