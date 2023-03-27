Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 939626C9FB6
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 11:34:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgjEo-0001Pe-P7; Mon, 27 Mar 2023 05:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pgjEf-0001PE-Vg
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 05:33:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pgjEe-000665-JU
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 05:33:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679909631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MCtUcZ57n91Jh1uvVROJvUNWirPDZ2/kvdQnYCFsei8=;
 b=c7KFzPA3zPvj0VyPvIKzzTTGSHs6tQ9zaz1yz/7ytAvWbT66c15rzLuVp26ZbQ6MRpIsHg
 LeZpGdgkRXSaVfvxXE9NtglUppVbA9kZZCvH148iXQwLqvK09qMF5FOnB7tpK/No8Ro2VK
 0IYLiUESn47JTO7euSX+JCQyIJ93oNw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-U2oCBBUiP2Ktd8WHl362fA-1; Mon, 27 Mar 2023 05:33:49 -0400
X-MC-Unique: U2oCBBUiP2Ktd8WHl362fA-1
Received: by mail-qt1-f200.google.com with SMTP id
 h6-20020ac85846000000b003e3c23d562aso5658706qth.1
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 02:33:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679909628;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MCtUcZ57n91Jh1uvVROJvUNWirPDZ2/kvdQnYCFsei8=;
 b=V0AHDWYeLN5W05QgfenyshLy5WmoPmS636c0q8SmE0mOxijIuxSoFgwqFxpoFGJKDU
 05IEOV+VsP0/3adugX47v2qExjgJNQyRZMCWXHbTMs8U9VwWJ+bVLShWDh6z6CxgHm+f
 xZdTqzMPyAYDgU+c/vyBqGXO63TMq0H5zK884HX21m8x/ZRjJLirNzFzMW9aiEvdBIUg
 dTla7QugEO6zk38fbSP25CF+Du9ZFyD+4mXF+lrEAA9IRp5o83/GUjRoYTjFEqdaGpEv
 ZBFy27sMZSL59G0UwyQS5f+rOMilSSBwG628TWFrE9fUWJ52JNeO1+tcBQsnqlpkjTvQ
 FfQg==
X-Gm-Message-State: AO0yUKXkKNHUnDbaZ/GTFnJ9Uq4MdEJiQ93qp1wN1F9fmD4e3xsgPVC5
 LlWkUKYbpVYFrkbBMTpNDyk4Gng4Wc1H7lD20sh14BN6Y+iO0xPHs7BVgPYWqGJlQ4lhBZle/PN
 5em/lgQKLVyGwp0g=
X-Received: by 2002:a05:6214:29ee:b0:571:698:eac9 with SMTP id
 jv14-20020a05621429ee00b005710698eac9mr29907697qvb.18.1679909628198; 
 Mon, 27 Mar 2023 02:33:48 -0700 (PDT)
X-Google-Smtp-Source: AK7set9UcjC/zS93fslToyoQ9khpInmYWQZPFYyvjHlBEJlnyGGvUQTw4tadATHgIawmD9tBpQtSfQ==
X-Received: by 2002:a05:6214:29ee:b0:571:698:eac9 with SMTP id
 jv14-20020a05621429ee00b005710698eac9mr29907673qvb.18.1679909627968; 
 Mon, 27 Mar 2023 02:33:47 -0700 (PDT)
Received: from sgarzare-redhat (host-82-53-134-98.retail.telecomitalia.it.
 [82.53.134.98]) by smtp.gmail.com with ESMTPSA id
 m12-20020ad44a0c000000b005dd8b93456dsm2810453qvz.5.2023.03.27.02.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 02:33:47 -0700 (PDT)
Date: Mon, 27 Mar 2023 11:33:41 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 alvaro.karsz@solid-run.com, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>,
 si-wei.liu@oracle.com, 
 Eli Cohen <eli@mellanox.com>, Shannon Nelson <snelson@pensando.io>, 
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Cindy Lu <lulu@redhat.com>, longpeng2@huawei.com,
 Harpreet Singh Anand <hanand@xilinx.com>
Subject: Re: [PATCH for 8.1 v2 1/6] vdpa: Remove status in reset tracing
Message-ID: <alimhoppq3zmgqubewekqpyivvjpoqzpsfnpkfucmmnk74udqe@6caya2y5iq55>
References: <20230323195404.1247326-1-eperezma@redhat.com>
 <20230323195404.1247326-2-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230323195404.1247326-2-eperezma@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Mar 23, 2023 at 08:53:59PM +0100, Eugenio Pérez wrote:
>It is always 0 and it is not useful to route call through file
>descriptor.
>
>Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>---
> hw/virtio/vhost-vdpa.c | 2 +-
> hw/virtio/trace-events | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>index bc6bad23d5..bbabea18f3 100644
>--- a/hw/virtio/vhost-vdpa.c
>+++ b/hw/virtio/vhost-vdpa.c
>@@ -716,7 +716,7 @@ static int vhost_vdpa_reset_device(struct vhost_dev *dev)
>     uint8_t status = 0;
>
>     ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
>-    trace_vhost_vdpa_reset_device(dev, status);
>+    trace_vhost_vdpa_reset_device(dev);
>     v->suspended = false;
>     return ret;
> }
>diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
>index 8f8d05cf9b..6265231683 100644
>--- a/hw/virtio/trace-events
>+++ b/hw/virtio/trace-events
>@@ -44,7 +44,7 @@ vhost_vdpa_set_mem_table(void *dev, uint32_t nregions, uint32_t padding) "dev: %
> vhost_vdpa_dump_regions(void *dev, int i, uint64_t guest_phys_addr, uint64_t memory_size, uint64_t userspace_addr, uint64_t flags_padding) "dev: %p %d: guest_phys_addr: 0x%"PRIx64" memory_size: 0x%"PRIx64" userspace_addr: 0x%"PRIx64" flags_padding: 0x%"PRIx64
> vhost_vdpa_set_features(void *dev, uint64_t features) "dev: %p features: 0x%"PRIx64
> vhost_vdpa_get_device_id(void *dev, uint32_t device_id) "dev: %p device_id %"PRIu32
>-vhost_vdpa_reset_device(void *dev, uint8_t status) "dev: %p status: 0x%"PRIx8
>+vhost_vdpa_reset_device(void *dev) "dev: %p"
> vhost_vdpa_get_vq_index(void *dev, int idx, int vq_idx) "dev: %p idx: %d vq idx: %d"
> vhost_vdpa_set_vring_ready(void *dev) "dev: %p"
> vhost_vdpa_dump_config(void *dev, const char *line) "dev: %p %s"
>-- 
>2.31.1
>


