Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A48062D36B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 07:25:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovYK4-0006Xp-E1; Thu, 17 Nov 2022 01:24:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ovYK1-0006XN-VW
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 01:24:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ovYK0-00013D-4Q
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 01:24:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668666263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dotBqQixle9Fv+CAJsS4WLtWi7mY07UiSHvQQq1r/W8=;
 b=VXtTEj6dS4ErtmKBpdvNq9sU7YYfSDykZ64+Z8gPn+y2Zg/TOSuDhcVOYeG+DHqp+gtSAz
 F4Bg4Jx12HKwC4yrzDzCt9FED8n84IywZmvL/S4F5LJ3gymvm2m1xJ+QLAQZLXb6aS/trs
 mf7/bnbT7knE+wvpmfUHpHXfK3TdeWU=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-331-hSQ0kwvCMzm8yy79nb9RnA-1; Thu, 17 Nov 2022 01:24:21 -0500
X-MC-Unique: hSQ0kwvCMzm8yy79nb9RnA-1
Received: by mail-pg1-f198.google.com with SMTP id
 f19-20020a63f113000000b0046fde69a09dso750822pgi.10
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 22:24:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dotBqQixle9Fv+CAJsS4WLtWi7mY07UiSHvQQq1r/W8=;
 b=ZW9PKX69ISdkzG44VHgVxCDXFD2W3CpBoDFkAJ+E7t2/gVGKmbGJOa+DeiBipDE2hh
 A/wNagPl5GRPUdpcj2r9U62YcVH2b4sxaUTfZ1L/swLOssS0XFugEZrpzdMFLqtyuiFy
 42GJt+mqVP1nAG+svDX72AgW7MMtplRhUhZ8qYo8o3AwMzoB6DNGsqOhw7urJhtEeiiq
 ZEuBN5TvWqReQbOUANKBuqYZGuwOpaVoFDigRdhaaCLkTvcc285UrmqAM+2mGxxKkxZa
 JRmSYxMHOc3RbXoVzjtBeJV4g2d1gPrGz1a/uh3iJVszVVuOx2eCruopHjG6uJgCRbUY
 8skQ==
X-Gm-Message-State: ANoB5pkMdsVHAtgQgrBeDwg7KUF9puRIWyZYWdZp1QES2hK2jk6k2lQ7
 +NMsDQOIeMK2p09wt4jaBzzt36FL9OpAZ9g7b/QXyU3KltMv2Akq/1BSgWKW5NovsUlY+QpfruG
 5Li0My9qb7/IPWHA=
X-Received: by 2002:a17:90a:8d14:b0:213:e4:3f57 with SMTP id
 c20-20020a17090a8d1400b0021300e43f57mr7079480pjo.204.1668666260744; 
 Wed, 16 Nov 2022 22:24:20 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7JFRfp0oTUPztKaEkbITppFUXEjjDeQ9Y+n/J/QQz14rr0+/jI6u86xVDLPMECSy7qH3Fd4g==
X-Received: by 2002:a17:90a:8d14:b0:213:e4:3f57 with SMTP id
 c20-20020a17090a8d1400b0021300e43f57mr7079446pjo.204.1668666260466; 
 Wed, 16 Nov 2022 22:24:20 -0800 (PST)
Received: from [10.72.13.24] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a170903120600b0018157b415dbsm328428plh.63.2022.11.16.22.24.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Nov 2022 22:24:20 -0800 (PST)
Message-ID: <524ed251-517b-52df-5d84-c9376c4f0a2b@redhat.com>
Date: Thu, 17 Nov 2022 14:24:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH for 8.0 v7 09/10] vdpa: Add shadow_data to vhost_vdpa
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
 <20221116150556.1294049-10-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20221116150556.1294049-10-eperezma@redhat.com>
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


在 2022/11/16 23:05, Eugenio Pérez 写道:
> The memory listener that thells the device how to convert GPA to qemu's
> va is registered against CVQ vhost_vdpa. memory listener translations
> are always ASID 0, CVQ ones are ASID 1 if supported.
>
> Let's tell the listener if it needs to register them on iova tree or
> not.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>

Thanks


> ---
> v7: Rename listener_shadow_vq to shadow_data
> v5: Solve conflict about vhost_iova_tree_remove accepting mem_region by
>      value.
> ---
>   include/hw/virtio/vhost-vdpa.h | 2 ++
>   hw/virtio/vhost-vdpa.c         | 6 +++---
>   net/vhost-vdpa.c               | 1 +
>   3 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
> index e57dfa1fd1..45b969a311 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -40,6 +40,8 @@ typedef struct vhost_vdpa {
>       struct vhost_vdpa_iova_range iova_range;
>       uint64_t acked_features;
>       bool shadow_vqs_enabled;
> +    /* Vdpa must send shadow addresses as IOTLB key for data queues, not GPA */
> +    bool shadow_data;
>       /* IOVA mapping used by the Shadow Virtqueue */
>       VhostIOVATree *iova_tree;
>       GPtrArray *shadow_vqs;
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 1e4e1cb523..852baf8b2c 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -224,7 +224,7 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
>                                            vaddr, section->readonly);
>   
>       llsize = int128_sub(llend, int128_make64(iova));
> -    if (v->shadow_vqs_enabled) {
> +    if (v->shadow_data) {
>           int r;
>   
>           mem_region.translated_addr = (hwaddr)(uintptr_t)vaddr,
> @@ -251,7 +251,7 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
>       return;
>   
>   fail_map:
> -    if (v->shadow_vqs_enabled) {
> +    if (v->shadow_data) {
>           vhost_iova_tree_remove(v->iova_tree, mem_region);
>       }
>   
> @@ -296,7 +296,7 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
>   
>       llsize = int128_sub(llend, int128_make64(iova));
>   
> -    if (v->shadow_vqs_enabled) {
> +    if (v->shadow_data) {
>           const DMAMap *result;
>           const void *vaddr = memory_region_get_ram_ptr(section->mr) +
>               section->offset_within_region +
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 5185ac7042..a9c864741a 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -570,6 +570,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>       s->vhost_vdpa.index = queue_pair_index;
>       s->always_svq = svq;
>       s->vhost_vdpa.shadow_vqs_enabled = svq;
> +    s->vhost_vdpa.shadow_data = svq;
>       s->vhost_vdpa.iova_tree = iova_tree;
>       if (!is_datapath) {
>           s->cvq_cmd_out_buffer = qemu_memalign(qemu_real_host_page_size(),


