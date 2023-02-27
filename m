Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3331A6A3C5C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:24:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWYfb-0003Tz-9G; Mon, 27 Feb 2023 03:15:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pWYfY-0003RC-G3
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 03:15:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pWYfW-0006oH-T0
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 03:15:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677485734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3x69ZsSNpX/akHSADnpdF99h5XqfwdxDqoeGTx5EvYg=;
 b=g0pY4sfzyVCkgO4yftzscc/ez/X5a/u4RKTzHBjt3uFxilP5KNtOlMnSIKLxZp+E+1yV21
 MRk3IP5IeRisiGT6MLu7E4fsLcaVIJRyz3Y63PhDeqKLxynmdGSYiw4xCac89flFh0JF6F
 2zDndDJrZ2MIxP0iwhUP+/S3vXWGuUM=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-222-7ZdnKxAdPEyo0U2aw5Frpg-1; Mon, 27 Feb 2023 03:15:32 -0500
X-MC-Unique: 7ZdnKxAdPEyo0U2aw5Frpg-1
Received: by mail-pl1-f198.google.com with SMTP id
 ki15-20020a170903068f00b0019ce282dc68so3215523plb.6
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 00:15:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3x69ZsSNpX/akHSADnpdF99h5XqfwdxDqoeGTx5EvYg=;
 b=kHx/0OZhkhwNiK2DNWR6E1j7I6Z61bF1imv+1Bdbmyb3m+5QcZshOv/R2koacBpyrI
 ND8rrn9n9+s7jsB42RyoYh/Yid7XWJBWAuJ35udSuYFb7Fg6rIljRHuMILNGGItRzoy1
 ZlyqmBLecrq38TM+wCWhTIML87ZcuwwziWSDsJs7KMIA6VMzHbZr4dV5Wdiww4ORzx+P
 DBamUDZzeZ//37OAo/1hUESgVuJiXfZqzF9/nEFl6PLFsBGan/1povFHdDXHtST1ibvY
 QPrPmumyjRqyR5xZNGqM/dmXg7IYP8WQ+w/k1dtdgt+AT5YfVVcRmA2rdzeWbV5duJZW
 NJ0g==
X-Gm-Message-State: AO0yUKWjAiUqoN5jPJvN+kQDxcHCZXIK53xywcTrfsRBZyJPB/eXYlE9
 nvqFVkpAV64zyM3xbwWxNURgg7ufBSnv8vKvMkrN3ruJY5entfqhULzz5iZWKyfjHGtS3Nc/TeD
 PoUw24P7Qj2bxcGg=
X-Received: by 2002:a05:6a20:430a:b0:cc:9b29:f617 with SMTP id
 h10-20020a056a20430a00b000cc9b29f617mr10837937pzk.0.1677485731419; 
 Mon, 27 Feb 2023 00:15:31 -0800 (PST)
X-Google-Smtp-Source: AK7set83Y7pAHa7WGvY0JfTzfSu+k9WJI1LEuOOjNvfbOzN862xjLYlfp1L5qF55Qa/P2QDQ6TeAgg==
X-Received: by 2002:a05:6a20:430a:b0:cc:9b29:f617 with SMTP id
 h10-20020a056a20430a00b000cc9b29f617mr10837907pzk.0.1677485731153; 
 Mon, 27 Feb 2023 00:15:31 -0800 (PST)
Received: from [10.72.13.83] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 g17-20020aa78751000000b0058837da69edsm3642594pfo.128.2023.02.27.00.15.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 00:15:30 -0800 (PST)
Message-ID: <2367dcff-e8c3-c3ca-378a-e9e67e10710a@redhat.com>
Date: Mon, 27 Feb 2023 16:15:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 12/15] vdpa: block migration if device has unsupported
 features
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
 <20230224155438.112797-13-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20230224155438.112797-13-eperezma@redhat.com>
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
> A vdpa net device must initialize with SVQ in order to be migratable at
> this moment, and initialization code verifies some conditions.  If the
> device is not initialized with the x-svq parameter, it will not expose
> _F_LOG so the vhost subsystem will block VM migration from its
> initialization.
>
> Next patches change this, so we need to verify migration conditions
> differently.
>
> QEMU only supports a subset of net features in SVQ, and it cannot
> migrate state that cannot track or restore in the destination.  Add a
> migration blocker if the device offer an unsupported feature.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
> v3: add mirgation blocker properly so vhost_dev can handle it.
> ---
>   net/vhost-vdpa.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 4f983df000..094dc1c2d0 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -795,7 +795,8 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>                                          int nvqs,
>                                          bool is_datapath,
>                                          bool svq,
> -                                       struct vhost_vdpa_iova_range iova_range)
> +                                       struct vhost_vdpa_iova_range iova_range,
> +                                       uint64_t features)
>   {
>       NetClientState *nc = NULL;
>       VhostVDPAState *s;
> @@ -818,7 +819,10 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>       s->vhost_vdpa.shadow_vqs_enabled = svq;
>       s->vhost_vdpa.iova_range = iova_range;
>       s->vhost_vdpa.shadow_data = svq;
> -    if (!is_datapath) {
> +    if (queue_pair_index == 0) {
> +        vhost_vdpa_net_valid_svq_features(features,
> +                                          &s->vhost_vdpa.migration_blocker);


Since we do validation at initialization, is this necessary to valid 
once again in other places?

Thanks


> +    } else if (!is_datapath) {
>           s->cvq_cmd_out_buffer = qemu_memalign(qemu_real_host_page_size(),
>                                               vhost_vdpa_net_cvq_cmd_page_len());
>           memset(s->cvq_cmd_out_buffer, 0, vhost_vdpa_net_cvq_cmd_page_len());
> @@ -956,7 +960,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>       for (i = 0; i < queue_pairs; i++) {
>           ncs[i] = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
>                                        vdpa_device_fd, i, 2, true, opts->x_svq,
> -                                     iova_range);
> +                                     iova_range, features);
>           if (!ncs[i])
>               goto err;
>       }
> @@ -964,7 +968,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>       if (has_cvq) {
>           nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
>                                    vdpa_device_fd, i, 1, false,
> -                                 opts->x_svq, iova_range);
> +                                 opts->x_svq, iova_range, features);
>           if (!nc)
>               goto err;
>       }


