Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8834F2398
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 08:48:06 +0200 (CEST)
Received: from localhost ([::1]:42236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbcyz-0002W2-IL
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 02:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1nbcud-0001TS-IA
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 02:43:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1nbcuY-00076D-QB
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 02:43:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649141010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3JMINGQtISyCBMhpCQvblygxB7W7C14K6P3ujyyMof4=;
 b=WuZ+69s0rtHKMw455SPy58uPhCuf3Dvt/ryFCG/gYQJkXmpUs7Lisw9nBOSGgZMXVf/WWe
 3RQiq0a6ZNiDh1O4ujKOI9XcVRvkobn+wy2r2WvyBk1qzKhwdjZC/jhYhn/7KiZX/5glP8
 btDlEVxb0dyoSYsVPY5Z/clIKPd5gN4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-DgMfwI1QMjq9VjIorBUW8g-1; Tue, 05 Apr 2022 02:43:28 -0400
X-MC-Unique: DgMfwI1QMjq9VjIorBUW8g-1
Received: by mail-wm1-f69.google.com with SMTP id
 189-20020a1c02c6000000b0038e6c4c6472so869959wmc.1
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 23:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3JMINGQtISyCBMhpCQvblygxB7W7C14K6P3ujyyMof4=;
 b=OmCx9KuIhbFYpArpA2n774RI4LaUiTW9cOQnguxR+xC4PgGG7sN8bcK0WnjENem9vl
 J0tAIFqjZ55D5i89/WhrVfRvo1R3WRW+0JfHWu6SWcVngWu4RlgJa1AOheBOHL4VlFBE
 qL5DOkjnP1WeKvlBnOF0gj9ib1UT/sCnXgDTKgySogFbZ5+lO64OOJMZJWeNamVNz9iN
 niZT+wDaEmmD0bKm6Bx61gKvnj4Sw8zYWEek/i9jA8Q4ms4isRgH/5Hy/QQO8sNeuPwI
 A0tY8l7s4gbOSJiyi8xI7jSfDfv2RQBggOgr5lUjdcgekgjCgTBAO8ShL+mct5IPolwt
 zecA==
X-Gm-Message-State: AOAM531INNl6Ti/wrjV/Zimp6FyUvxgYsL59a3AWAYLvYZsATY7e/PKp
 6M8q5OeA8OzCNduTf5GDWFIKKoCQaoqoAyfmy0e231stK/8tFIvlbW7a3zlY7WOBFqmgUb/L5kv
 gwm7nZ5vJR5cV0OU=
X-Received: by 2002:a5d:6905:0:b0:205:d510:c73a with SMTP id
 t5-20020a5d6905000000b00205d510c73amr1442681wru.275.1649141006868; 
 Mon, 04 Apr 2022 23:43:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3xZGM/APd4UveSBXFR4MSknmrQMC4kf6/18Fju5dGxJjeh96fCpyr39hlRTDlUub9x7+ung==
X-Received: by 2002:a5d:6905:0:b0:205:d510:c73a with SMTP id
 t5-20020a5d6905000000b00205d510c73amr1442654wru.275.1649141006540; 
 Mon, 04 Apr 2022 23:43:26 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.17.26])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a1c7402000000b0038159076d30sm1178631wmc.22.2022.04.04.23.43.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 23:43:26 -0700 (PDT)
Message-ID: <bcd023e3-e5cd-8bb1-5d89-8849b6247573@redhat.com>
Date: Tue, 5 Apr 2022 08:43:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] vdpa: Add missing tracing to batch mapping functions
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220405063628.853745-1-eperezma@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20220405063628.853745-1-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/04/2022 08:36, Eugenio Pérez wrote:
> These functions were not traced properly.
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
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
> --
> 2.27.0
> 

Reviewed-by: Laurent Vivier <lvivier@redhat.com>


