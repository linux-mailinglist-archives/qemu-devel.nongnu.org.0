Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 719605004AD
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 05:34:54 +0200 (CEST)
Received: from localhost ([::1]:53984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neqFx-0008G5-42
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 23:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1neqE5-0007U7-1m
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 23:32:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1neqE1-0002OH-NT
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 23:32:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649907172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cjEhdST/mptQHIND2raVaa3xbnup+X9kSZl9CSvu0Eg=;
 b=VVNnB+dPmFLbR7TKTamGUw2DG1feXicoOQooQdGcCvHxiFxK3kLGIEzvNFy/+7xe9YEX8m
 HWxkvmPw/VcEPPFObrGCRbP5Utk+htESelQ/Gqbri50L15CRTJVK/xU3F8YJYKnfPr2j27
 KdoaqGxpTWmmJdip8Mrqv0ktVh8tIiA=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-VqIeIs1nN0u5phZ4P3WEog-1; Wed, 13 Apr 2022 23:32:49 -0400
X-MC-Unique: VqIeIs1nN0u5phZ4P3WEog-1
Received: by mail-pj1-f69.google.com with SMTP id
 38-20020a17090a09a900b001cb95d9ea46so2179288pjo.7
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 20:32:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cjEhdST/mptQHIND2raVaa3xbnup+X9kSZl9CSvu0Eg=;
 b=ZmByaQ5jTqdNIthPVQl99zCxco8Z8f89FNGLlJN6KH+QWGMx8ZZ25gDzKwDzIhs385
 M+ZL6LYYZwmhULnMqjgusemwVrmmDXUXG5wEbzkCzHxEMI/oQqWalHO6QvsGXuTrPycG
 No2aKzx42T3AjpgiH2o70i4RqJpmxrsyC0ZYXtx0zeNYqCxvkzuF1h6lgLRRxmTTz7kd
 l+EqqI1pwCdnhuMVscRetZmZ7wOEICpNfKhaOHIEeqtjKC+v+NOO7oAzypDVONRVazsa
 0jAtBk/YNRu65L8vb0JmioTLhYn8yxRYrKTfAD6syFr7kyImI3zEQb9Kmgw+nAEqVhP3
 oQXg==
X-Gm-Message-State: AOAM532ui7o8N4tqh+RAzNOzUvvelF5TIUqoEzJESpfc3O3ZX68tPB4g
 UIpv7eJqlhVbojoun/e+LKZRrtJ+5atjt1sAoRPyAYM/Gz0gLDfNpJNn0XtUqHHIkrc1mQQ2i7t
 Zf1fljvVpECM6qD0=
X-Received: by 2002:aa7:8154:0:b0:505:68a6:600d with SMTP id
 d20-20020aa78154000000b0050568a6600dmr1909957pfn.35.1649907168479; 
 Wed, 13 Apr 2022 20:32:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3uNQ9H2atu8m1M6BxZC9XIIs9AJe2A19WvuKz8VYvtg2LvPSWL5fOCIUVg0WAt7av+Y8D/g==
X-Received: by 2002:aa7:8154:0:b0:505:68a6:600d with SMTP id
 d20-20020aa78154000000b0050568a6600dmr1909918pfn.35.1649907168052; 
 Wed, 13 Apr 2022 20:32:48 -0700 (PDT)
Received: from [10.72.13.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 rj13-20020a17090b3e8d00b001c77bc09541sm4424491pjb.51.2022.04.13.20.32.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 20:32:47 -0700 (PDT)
Message-ID: <42408335-f21a-1f81-eba0-c89d2d361716@redhat.com>
Date: Thu, 14 Apr 2022 11:32:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v5 01/23] vdpa: Add missing tracing to batch mapping
 functions
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220408133415.1371760-1-eperezma@redhat.com>
 <20220408133415.1371760-2-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220408133415.1371760-2-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
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
 Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Peter Xu <peterx@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/4/8 21:33, Eugenio Pérez 写道:
> These functions were not traced properly.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hw/virtio/vhost-vdpa.c | 2 ++
>   hw/virtio/trace-events | 2 ++
>   2 files changed, 4 insertions(+)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 8adf7c0b92..9e5fe15d03 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -129,6 +129,7 @@ static void vhost_vdpa_listener_begin_batch(struct vhost_vdpa *v)
>           .iotlb.type = VHOST_IOTLB_BATCH_BEGIN,
>       };
>   
> +    trace_vhost_vdpa_listener_begin_batch(v, fd, msg.type, msg.iotlb.type);
>       if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
>           error_report("failed to write, fd=%d, errno=%d (%s)",
>                        fd, errno, strerror(errno));
> @@ -163,6 +164,7 @@ static void vhost_vdpa_listener_commit(MemoryListener *listener)
>       msg.type = v->msg_type;
>       msg.iotlb.type = VHOST_IOTLB_BATCH_END;
>   
> +    trace_vhost_vdpa_listener_commit(v, fd, msg.type, msg.iotlb.type);
>       if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
>           error_report("failed to write, fd=%d, errno=%d (%s)",
>                        fd, errno, strerror(errno));
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index a5102eac9e..333348d9d5 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -25,6 +25,8 @@ vhost_user_postcopy_waker_nomatch(const char *rb, uint64_t rb_offset) "%s + 0x%"
>   # vhost-vdpa.c
>   vhost_vdpa_dma_map(void *vdpa, int fd, uint32_t msg_type, uint64_t iova, uint64_t size, uint64_t uaddr, uint8_t perm, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" uaddr: 0x%"PRIx64" perm: 0x%"PRIx8" type: %"PRIu8
>   vhost_vdpa_dma_unmap(void *vdpa, int fd, uint32_t msg_type, uint64_t iova, uint64_t size, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" type: %"PRIu8
> +vhost_vdpa_listener_begin_batch(void *v, int fd, uint32_t msg_type, uint8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
> +vhost_vdpa_listener_commit(void *v, int fd, uint32_t msg_type, uint8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
>   vhost_vdpa_listener_region_add(void *vdpa, uint64_t iova, uint64_t llend, void *vaddr, bool readonly) "vdpa: %p iova 0x%"PRIx64" llend 0x%"PRIx64" vaddr: %p read-only: %d"
>   vhost_vdpa_listener_region_del(void *vdpa, uint64_t iova, uint64_t llend) "vdpa: %p iova 0x%"PRIx64" llend 0x%"PRIx64
>   vhost_vdpa_add_status(void *dev, uint8_t status) "dev: %p status: 0x%"PRIx8


