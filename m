Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 144684F5163
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 04:36:11 +0200 (CEST)
Received: from localhost ([::1]:43366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbvWj-0006Sh-Ju
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 22:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nbvV4-0005i0-KQ
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 22:34:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nbvV1-0001ub-UC
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 22:34:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649212461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JEfH59eCzTW51aCh4/1DCQHrAE2meERMIw31zysG1tg=;
 b=ZShgae2uwWMGM5GiLdgEdTlGe2RNhtNgiwNYC80bBXgB0qp51i7uAGKscQYPVdSYZnWQI6
 MZYpQqtY0YyHMqn1NJRC4yMrlAmYusZo954WDbp4g1rdH8y8oJztF7z7K+2H6E9r5QcD91
 ezyIjNxUSf3K6n5dtHi9HASBJ+R8YVk=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-Cse7mS43PfeugEyV9C0evQ-1; Tue, 05 Apr 2022 22:34:20 -0400
X-MC-Unique: Cse7mS43PfeugEyV9C0evQ-1
Received: by mail-pj1-f69.google.com with SMTP id
 d7-20020a17090ad98700b001c6834c71ffso792409pjv.1
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 19:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JEfH59eCzTW51aCh4/1DCQHrAE2meERMIw31zysG1tg=;
 b=vYOwU87MQp3SwzCKXgu1QWDJnOcxHICHZsQoJOCUGWRTOPSTlHQ2ep6VvXxyKsISDr
 /4LUeNaim+5A99YKFTrohobBjxMwbKUnpHZ/GjEdcAHJeJLF1TpEmDZ5QRlOVGbzaDMm
 +hwBpGC8Ne1mqmjUlJEK4z5zlcYBd0Ocq7TT/VtijIc2l0Cg9DkIHm5idY9XJD9AugrP
 Ld8cjI125dZd6U8TcKFV2ehvuHBdfcJ8+yqpcHUtjEKm0MsPYCXFIdcAgO0NkdoT23Zw
 U+ty14BjMst+LK6ZygOERrmH8GYN5IIH0SaOXu2Jabfyczz3UbFn8f5yIT0izvMFctjh
 dePQ==
X-Gm-Message-State: AOAM533D/2fa/4zWWvDK/5M/oIGRL19JBv9Jx3vuWv/Zx3WVNJNVzD2F
 1PZNSUdE6BHplhNSSx/aZg0nKYcuZB05ofn35y8zPesrCcb5VyEu96ojO3+XmtRnVFHzZ/rQgDf
 rplV8MlWtrGRHKjs=
X-Received: by 2002:a17:90b:4a47:b0:1c6:42c6:fef2 with SMTP id
 lb7-20020a17090b4a4700b001c642c6fef2mr7240382pjb.147.1649212459127; 
 Tue, 05 Apr 2022 19:34:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXoI89XPOzb94gM11SrK/WksXiKxp2poiSlhQPjDH8BARpfzONebuEstITIACkPHmNezzYKA==
X-Received: by 2002:a17:90b:4a47:b0:1c6:42c6:fef2 with SMTP id
 lb7-20020a17090b4a4700b001c642c6fef2mr7240351pjb.147.1649212458628; 
 Tue, 05 Apr 2022 19:34:18 -0700 (PDT)
Received: from [10.72.12.58] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 mr10-20020a17090b238a00b001caab109ff3sm3590472pjb.23.2022.04.05.19.34.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Apr 2022 19:34:18 -0700 (PDT)
Message-ID: <120ddabc-08df-853a-3a67-533215827710@redhat.com>
Date: Wed, 6 Apr 2022 10:34:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] vdpa: Add missing tracing to batch mapping functions
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220405063628.853745-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220405063628.853745-1-eperezma@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/4/5 下午2:36, Eugenio Pérez 写道:
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
> --
> 2.27.0
>


