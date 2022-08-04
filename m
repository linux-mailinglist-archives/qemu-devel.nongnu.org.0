Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E375896D9
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 06:18:57 +0200 (CEST)
Received: from localhost ([::1]:34632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJSK0-0007SN-5X
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 00:18:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJSIA-000655-S7
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 00:17:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJSI5-0001RR-Kg
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 00:17:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659586616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kdMADfDZ4KXYt5ZhGHmbl9L2FYfgtlpRyLlJhRiOsU0=;
 b=buAB6vHO/F7sfpWi4TvnKXoubNilJx/jlHTdAwBblDGK8ZWyE9HHwQb+MWSgG2wEwb2dWx
 /uEb4Q+yuuCW39OQfync2v9vcHc9CedJO1LuaufAijxpFVVBfXTusq1Qv4mvVZzaA9QLzG
 Vhe+63D3shPd5LGNMY9BJqMLyl//yJA=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-koTt8EJjODiyEoxwoaTsYQ-1; Thu, 04 Aug 2022 00:16:55 -0400
X-MC-Unique: koTt8EJjODiyEoxwoaTsYQ-1
Received: by mail-pg1-f199.google.com with SMTP id
 h9-20020a635749000000b0041ba21b1370so5586292pgm.2
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 21:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kdMADfDZ4KXYt5ZhGHmbl9L2FYfgtlpRyLlJhRiOsU0=;
 b=XkrGPWi/OGMgGoijAskVQRjaOVP33yhDemkZtUMKShsfyThF2BhneB1yLxAt71xCpj
 7JprsU2fFSTpybnNHLkzRD+bk6uulBpYFzbC022bzSA7CloHkj5P9KHEpcG0cL2PRvVX
 IYPs5IiDtjqPzRFWkMg/WkPl1aFR2L3Sjm36mz0WuK6QTdmdwH31MDyI+voQFktp1kLj
 RNNLE1M1rgsirbBSiufhrn7WHN1FeC0tyTCv+jP3ZZZAV6eVupVcUR0Mk8mf5cuKXqA7
 3HYHl5xaW/gqiahga/SgKhKo9uam9v04ABRmcdnhgpKf7zu1AqLK1e8YN1ooLVdfREtJ
 X8Cg==
X-Gm-Message-State: ACgBeo11dnR48RYUZB1hwCpb7+Pn2NC9lT1biljkB7/McThujAte9126
 5DTKjXB1BfIJbiOg4YdgDyQwOLaFEAS5O1oPP7TXiDIrqsBQqYR7Xld6hbCp07W4cZNY5VTUu32
 g9SU3iRp4mRqSilM=
X-Received: by 2002:a62:4e85:0:b0:52b:3245:ba20 with SMTP id
 c127-20020a624e85000000b0052b3245ba20mr109958pfb.5.1659586612997; 
 Wed, 03 Aug 2022 21:16:52 -0700 (PDT)
X-Google-Smtp-Source: AA6agR529kWMwY5YgNlWucvAg50AY1kTjyWVqf5gO8MazImuUeFGnEg1Mud+AHBclPrVXbwsih/paw==
X-Received: by 2002:a62:4e85:0:b0:52b:3245:ba20 with SMTP id
 c127-20020a624e85000000b0052b3245ba20mr109934pfb.5.1659586612684; 
 Wed, 03 Aug 2022 21:16:52 -0700 (PDT)
Received: from [10.72.12.192] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b0016d01c133e1sm2832441plh.248.2022.08.03.21.16.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 21:16:52 -0700 (PDT)
Message-ID: <47e1e277-34e9-b043-0a74-bf2b67391c6a@redhat.com>
Date: Thu, 4 Aug 2022 12:16:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v5 06/10] vdpa: Make vhost_vdpa_net_cvq_map_elem accept
 any out sg
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
 <20220802175731.312115-7-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220802175731.312115-7-eperezma@redhat.com>
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
> So its generic enough to accept any out sg buffer and we can inject
> NIC state messages.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
> v5: Accept out sg instead of dev_buffers[]
> ---
>   net/vhost-vdpa.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 33bf3d6409..2421bca347 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -302,16 +302,16 @@ dma_map_err:
>   }
>   
>   /**
> - * Copy the guest element into a dedicated buffer suitable to be sent to NIC
> + * Maps out sg and in buffer into dedicated buffers suitable to be sent to NIC
>    */
> -static bool vhost_vdpa_net_cvq_map_elem(VhostVDPAState *s,
> -                                        VirtQueueElement *elem,
> -                                        size_t *out_len)
> +static bool vhost_vdpa_net_cvq_map_sg(VhostVDPAState *s,
> +                                      const struct iovec *out, size_t out_num,
> +                                      size_t *out_len)


This still looks not genreal as there's no guarantee that we won't have 
command-in-specific-data. One example is that Ali is working on the 
virtio-net statistics fetching from the control virtqueue.

So it looks to me we'd better have a general bounce_map here that accepts:

1) out_sg and out_num
2) in_sg and in_num

In this level, we'd better not have any special care about the in as the 
ack. And we need do bouncing:

1) for out buffer, during map
2) for in buffer during unmap

Thanks


>   {
>       size_t in_copied;
>       bool ok;
>   
> -    ok = vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, elem->out_sg, elem->out_num,
> +    ok = vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, out, out_num,
>                                   vhost_vdpa_net_cvq_cmd_len(),
>                                   s->cvq_cmd_out_buffer, out_len, false);
>       if (unlikely(!ok)) {
> @@ -435,7 +435,8 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
>       };
>       bool ok;
>   
> -    ok = vhost_vdpa_net_cvq_map_elem(s, elem, &dev_buffers[0].iov_len);
> +    ok = vhost_vdpa_net_cvq_map_sg(s, elem->out_sg, elem->out_num,
> +                                   &dev_buffers[0].iov_len);
>       if (unlikely(!ok)) {
>           goto out;
>       }


