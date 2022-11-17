Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BCF62D359
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 07:17:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovYC4-0004TP-2j; Thu, 17 Nov 2022 01:16:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ovYBz-0004Rt-Sf
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 01:16:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ovYBx-0007VE-AC
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 01:16:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668665763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W+WY7fE+dg2X2iyU5DPd7eZ0r72bXN9Iad6U2vbxRTA=;
 b=T5td74R7SW1nwOpYQeUjCis6YnJw0yiUrjVoUQgA7DdVwHn7hSTZzXAEEmTfT5fUpe6znc
 28akU4xo432+ap/H3ThiDDqcU1J4w+5j45FtHfTnCnzy8JtLTHRdXAHwpRLTOvSeol+dMT
 KYTB+8uKRoR05GFBhJDzgWLZqLso13Y=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-116-a3goDAf6O4qVXx5EcSIJrw-1; Thu, 17 Nov 2022 01:16:02 -0500
X-MC-Unique: a3goDAf6O4qVXx5EcSIJrw-1
Received: by mail-pl1-f198.google.com with SMTP id
 o7-20020a170902d4c700b001868cdac9adso698337plg.13
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 22:16:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W+WY7fE+dg2X2iyU5DPd7eZ0r72bXN9Iad6U2vbxRTA=;
 b=i802P0Y+bgzKla2yfP0yiD93JEl/GbdJStvjG24z2xc0AGTd7uoxNBZUyQf3QGU/fQ
 smjH1OG2AzKmAg+A4YmaVY1ey9VqJes58vv1Qv9Vl0iiyboUJvEULjRB04akrbV2PpXj
 O0jSX7SIzD2Viesn2UWTTkmlkSo54wxkD3h4swMk+I3nk/BxxXlKzmp/rJYvHTI6DRXg
 3gYHRIuGEN0+NtaJ2z/OUOgzsnNHPHysSGRLYmDN/PEA9vp/Vz/oqjHcCBwoi9grQArE
 VPkIu22tBIBmYSgxVDaZbO6g1MydjWh1gl/C5P9IgprTWwC/f6W4Zy/R9UzQsy+8Enao
 o4Ng==
X-Gm-Message-State: ANoB5pkvESrGvsKfje76jfZ3voHgnqizDkEjlYJW/YtYQHUR48DnZSdi
 JLFvJ/189e3CnY4+DlRscl4LB3tpGv7UoHAdPhbX1aASp5Bjyjodw1oUsKrC5J7Wm93FW1PlzMq
 CqeuIU14KaeeC8K4=
X-Received: by 2002:a17:902:aa08:b0:188:e878:b5f6 with SMTP id
 be8-20020a170902aa0800b00188e878b5f6mr1252640plb.150.1668665761011; 
 Wed, 16 Nov 2022 22:16:01 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6Gnau1gRHMne9NkEleqkHKmBOFGSfeA0NerNOykI8lxUX7dHM8OB+NczGWBZu3yu7/vhYG4g==
X-Received: by 2002:a17:902:aa08:b0:188:e878:b5f6 with SMTP id
 be8-20020a170902aa0800b00188e878b5f6mr1252615plb.150.1668665760681; 
 Wed, 16 Nov 2022 22:16:00 -0800 (PST)
Received: from [10.72.13.24] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a170902f55000b001869f2120absm196256plf.294.2022.11.16.22.15.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Nov 2022 22:16:00 -0800 (PST)
Message-ID: <400412ca-813a-3a59-c054-16576b5ae61d@redhat.com>
Date: Thu, 17 Nov 2022 14:15:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH for 8.0 v7 08/10] vdpa: Store x-svq parameter in
 VhostVDPAState
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Parav Pandit
 <parav@mellanox.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Laurent Vivier <lvivier@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, kvm@vger.kernel.org
References: <20221116150556.1294049-1-eperezma@redhat.com>
 <20221116150556.1294049-9-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20221116150556.1294049-9-eperezma@redhat.com>
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


在 2022/11/16 23:05, Eugenio Pérez 写道:
> CVQ can be shadowed two ways:
> - Device has x-svq=on parameter (current way)
> - The device can isolate CVQ in its own vq group
>
> QEMU needs to check for the second condition dynamically, because CVQ
> index is not known at initialization time. Since this is dynamic, the
> CVQ isolation could vary with different conditions, making it possible
> to go from "not isolated group" to "isolated".
>
> Saving the cmdline parameter in an extra field so we never disable CVQ
> SVQ in case the device was started with cmdline.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>

Thanks


> ---
>   net/vhost-vdpa.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 89b01fcaec..5185ac7042 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -38,6 +38,8 @@ typedef struct VhostVDPAState {
>       void *cvq_cmd_out_buffer;
>       virtio_net_ctrl_ack *status;
>   
> +    /* The device always have SVQ enabled */
> +    bool always_svq;
>       bool started;
>   } VhostVDPAState;
>   
> @@ -566,6 +568,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>   
>       s->vhost_vdpa.device_fd = vdpa_device_fd;
>       s->vhost_vdpa.index = queue_pair_index;
> +    s->always_svq = svq;
>       s->vhost_vdpa.shadow_vqs_enabled = svq;
>       s->vhost_vdpa.iova_tree = iova_tree;
>       if (!is_datapath) {


