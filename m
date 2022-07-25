Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BC357FBB0
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 10:51:26 +0200 (CEST)
Received: from localhost ([::1]:56038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFtoD-0003Vi-5J
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 04:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oFtlV-0001S9-Mx
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 04:48:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oFtlS-0005MJ-8V
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 04:48:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658738912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Tg5Qa1pHz3gHsPzahvY/yfZr0zoXJw+EtLVjtO4M4c=;
 b=hOk78Ob2aN62o8Zc9Fn+I2ViYiG3GW72XsIGs73G1FQreGWFVyIXLZIF3D3X7aqSLc7nv9
 4iHIGgk3LEVBiQwUDLe+6VI7RbIUnIKeUBSj8/pWH0oKwjW4WZWwycCENx3FTFz4wV9Fco
 8rWDUGuip/QJAP4/5ZKLB+wSyMzrlN4=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-9o4E5rYtNWaR9PTne4U1wA-1; Mon, 25 Jul 2022 04:48:30 -0400
X-MC-Unique: 9o4E5rYtNWaR9PTne4U1wA-1
Received: by mail-pf1-f197.google.com with SMTP id
 u14-20020a056a00098e00b0052b433b04d6so3556281pfg.12
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 01:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0Tg5Qa1pHz3gHsPzahvY/yfZr0zoXJw+EtLVjtO4M4c=;
 b=RydA5VjkZFGasM6gemyr2R/2nz/HzAN5W+pkOkdk/rzW6qsk7sqv+gROM4O4WGTHSl
 Y6eUkz7SrvQHAfmkgiSmHPnJ4nPT3oLpFJUOl2iWpWlh0shXFCAxqVvmq/a0zcBcPh9X
 8HMgy7Bci6Z3P8XGekhNdKQ+xoj97qYE/8FCEQi3wOrsgljb5im1UAVMxC6dQa8e6X0G
 wlIijB+nvDTbpOlddu8GWxY8KZTQ6LpRxRIJlFguq9HervdwdWpkmmR3RTHophEUyohb
 I8tFbDpZY+5XG9zy9fML777CDQqpTCdvLIIReI83yLg27ctbL6E9R8AoPcCcp2nRWbDI
 QAIA==
X-Gm-Message-State: AJIora8h2iy3kqT9FFXsmjejcqDZD75Q8TA2tjwKZSDgkkljA5LMt1h0
 yF/NdnTkcRvqkIdr9kmxLDchQ7Uej3xNnvdNxy5Xa71UYxvLhIffrT8g25mlbHH6I6R3aRlbnDR
 QH8Q9IuVju3e86Ng=
X-Received: by 2002:a17:902:d2d1:b0:16d:37b3:f8b3 with SMTP id
 n17-20020a170902d2d100b0016d37b3f8b3mr11036969plc.98.1658738909247; 
 Mon, 25 Jul 2022 01:48:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uoKcbzU6AfJAud7muo1xckB1xdS2kPMyZ5ea+CsXyC14+whbBue1hBFUWLlf4FAoOTfZdBAA==
X-Received: by 2002:a17:902:d2d1:b0:16d:37b3:f8b3 with SMTP id
 n17-20020a170902d2d100b0016d37b3f8b3mr11036936plc.98.1658738908869; 
 Mon, 25 Jul 2022 01:48:28 -0700 (PDT)
Received: from [10.72.13.203] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a170903200400b0016c67a3b7d0sm8563753pla.61.2022.07.25.01.48.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 01:48:28 -0700 (PDT)
Message-ID: <8e0e690d-d6af-db2f-5150-480a5d5d6793@redhat.com>
Date: Mon, 25 Jul 2022 16:48:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v4 3/7] vdpa: Make vhost_vdpa_net_cvq_map_elem accept any
 out sg
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Harpreet Singh Anand
 <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Cornelia Huck
 <cohuck@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>
References: <20220722111245.3403062-1-eperezma@redhat.com>
 <20220722111245.3403062-4-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220722111245.3403062-4-eperezma@redhat.com>
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


在 2022/7/22 19:12, Eugenio Pérez 写道:
> So its generic enough to accept any out sg buffer and we can inject
> NIC state messages.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   net/vhost-vdpa.c | 29 +++++++++++++++--------------
>   1 file changed, 15 insertions(+), 14 deletions(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 1b82ac2e07..bbe1830824 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -302,35 +302,36 @@ dma_map_err:
>   }
>   
>   /**
> - * Copy the guest element into a dedicated buffer suitable to be sent to NIC
> + * Maps out sg and in buffer into dedicated buffers suitable to be sent to NIC
>    *
> - * @iov: [0] is the out buffer, [1] is the in one
> + * @dev_iov: [0] is the out buffer, [1] is the in one


This still has assumption on the layout. I wonder if it's better to 
simply use in_sg and out_sg.

Thanks


>    */
> -static bool vhost_vdpa_net_cvq_map_elem(VhostVDPAState *s,
> -                                        VirtQueueElement *elem,
> -                                        struct iovec *iov)
> +static bool vhost_vdpa_net_cvq_map_sg(VhostVDPAState *s,
> +                                      const struct iovec *out, size_t out_num,
> +                                      struct iovec *dev_iov)
>   {
>       size_t in_copied;
>       bool ok;
>   
> -    iov[0].iov_base = s->cvq_cmd_out_buffer;
> -    ok = vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, elem->out_sg, elem->out_num,
> -                                vhost_vdpa_net_cvq_cmd_len(), iov[0].iov_base,
> -                                &iov[0].iov_len, false);
> +    dev_iov[0].iov_base = s->cvq_cmd_out_buffer;
> +    ok = vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, out, out_num,
> +                                vhost_vdpa_net_cvq_cmd_len(),
> +                                dev_iov[0].iov_base, &dev_iov[0].iov_len,
> +                                false);
>       if (unlikely(!ok)) {
>           return false;
>       }
>   
> -    iov[1].iov_base = s->cvq_cmd_in_buffer;
> +    dev_iov[1].iov_base = s->cvq_cmd_in_buffer;
>       ok = vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, NULL, 0,
> -                                sizeof(virtio_net_ctrl_ack), iov[1].iov_base,
> -                                &in_copied, true);
> +                                sizeof(virtio_net_ctrl_ack),
> +                                dev_iov[1].iov_base, &in_copied, true);
>       if (unlikely(!ok)) {
>           vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer);
>           return false;
>       }
>   
> -    iov[1].iov_len = sizeof(virtio_net_ctrl_ack);
> +    dev_iov[1].iov_len = sizeof(virtio_net_ctrl_ack);
>       return true;
>   }
>   
> @@ -434,7 +435,7 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
>       };
>       bool ok;
>   
> -    ok = vhost_vdpa_net_cvq_map_elem(s, elem, dev_buffers);
> +    ok = vhost_vdpa_net_cvq_map_sg(s, elem->out_sg, elem->out_num, dev_buffers);
>       if (unlikely(!ok)) {
>           goto out;
>       }


