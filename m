Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 132F84F25A7
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 09:49:06 +0200 (CEST)
Received: from localhost ([::1]:44292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbdw0-0000mP-FY
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 03:49:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nbdtK-00080E-J5
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 03:46:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nbdtG-0002qh-Ph
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 03:46:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649144773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r7khth0+SH89+eK20AWxD68QAYIq1XblOs/cDTbv0Yg=;
 b=gFpS+j4l6GpoesSxd3gwOh1fugjiSPBZE0ieZiYBHt5DdcU5CawiNSo9auu1ZNrT2A8L0I
 7OjQYKJ5dK82GZECh1DbIGI8yyp4HlkKgEQ/4/diLCpr+rtMr9tLD8TF1h2J3UXMzdpMOt
 /tNdsi45WbvgMHGGFl34crlNBCGWMhI=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-1XlR66MmPUi8JH2bKc6f3w-1; Tue, 05 Apr 2022 03:46:11 -0400
X-MC-Unique: 1XlR66MmPUi8JH2bKc6f3w-1
Received: by mail-qv1-f71.google.com with SMTP id
 o1-20020a0c9001000000b00440e415a3a2so9917637qvo.13
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 00:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=r7khth0+SH89+eK20AWxD68QAYIq1XblOs/cDTbv0Yg=;
 b=wmzVUs7EneDWGGBiBoVeUrcQtvG6Hv5H5SWS4kAOT5iBGLIGQZzG+VE8FOZQEnar/X
 TeY/ZX01KfZdpDv5V5W801PkagE4dEhp20umN3sL5zoaA0+0MszyI+hO1+TTPjLGdjoX
 4uWAsCgQnsuTuy8Oakz69BJj/vHpxuufp5PPY1XpgEVJK61bVEY8PgffAVGDXo+45nxM
 rGqDUd63SLdIUkwtvzdLOrSYHlh4Ndv3clgUt9bKGANc2iE12LfELlhcDVXcU6opj4to
 2k/iKaKY6NP+hamScddv5dNoBZxqDy+jOQLXgGKFnDII6OLAaPG2r6q8Yk/tElMJXCSJ
 ktfQ==
X-Gm-Message-State: AOAM531v13XyOf2JMRl7NFVZFsIsDGl6hQKmoaouT/TmcDJ7I89qD61X
 9NchMPFUT6A2VAbp23BExQ3oiWUaKFIEsnwR2orwQ3H3VQQdcBOvIcXGKwJLSmx1WrgMzx8N2/Q
 FhlAF4kil3w53hjc=
X-Received: by 2002:a37:c20b:0:b0:67b:3585:4687 with SMTP id
 i11-20020a37c20b000000b0067b35854687mr1303010qkm.280.1649144770512; 
 Tue, 05 Apr 2022 00:46:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjxTc6YxzfGWEnkXU6MpKjXosnrxmjMXHXvseB62BiStCFVjQiydKlCgEYhOYoDAcAtK6wGA==
X-Received: by 2002:a37:c20b:0:b0:67b:3585:4687 with SMTP id
 i11-20020a37c20b000000b0067b35854687mr1303001qkm.280.1649144770288; 
 Tue, 05 Apr 2022 00:46:10 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-128.retail.telecomitalia.it.
 [79.46.200.128]) by smtp.gmail.com with ESMTPSA id
 o21-20020ac85a55000000b002e16389b501sm10133981qta.96.2022.04.05.00.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 00:46:09 -0700 (PDT)
Date: Tue, 5 Apr 2022 09:46:04 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: Re: [PATCH] vdpa: Add missing tracing to batch mapping functions
Message-ID: <20220405074604.ialrjxr7ccjxebg4@sgarzare-redhat>
References: <20220405063628.853745-1-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220405063628.853745-1-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 05, 2022 at 08:36:28AM +0200, Eugenio Pérez wrote:
>These functions were not traced properly.
>
>Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>---
> hw/virtio/vhost-vdpa.c | 2 ++
> hw/virtio/trace-events | 2 ++
> 2 files changed, 4 insertions(+)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>index 8adf7c0b92..9e5fe15d03 100644
>--- a/hw/virtio/vhost-vdpa.c
>+++ b/hw/virtio/vhost-vdpa.c
>@@ -129,6 +129,7 @@ static void vhost_vdpa_listener_begin_batch(struct vhost_vdpa *v)
>         .iotlb.type = VHOST_IOTLB_BATCH_BEGIN,
>     };
>
>+    trace_vhost_vdpa_listener_begin_batch(v, fd, msg.type, msg.iotlb.type);
>     if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
>         error_report("failed to write, fd=%d, errno=%d (%s)",
>                      fd, errno, strerror(errno));
>@@ -163,6 +164,7 @@ static void vhost_vdpa_listener_commit(MemoryListener *listener)
>     msg.type = v->msg_type;
>     msg.iotlb.type = VHOST_IOTLB_BATCH_END;
>
>+    trace_vhost_vdpa_listener_commit(v, fd, msg.type, msg.iotlb.type);
>     if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
>         error_report("failed to write, fd=%d, errno=%d (%s)",
>                      fd, errno, strerror(errno));
>diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
>index a5102eac9e..333348d9d5 100644
>--- a/hw/virtio/trace-events
>+++ b/hw/virtio/trace-events
>@@ -25,6 +25,8 @@ vhost_user_postcopy_waker_nomatch(const char *rb, uint64_t rb_offset) "%s + 0x%"
> # vhost-vdpa.c
> vhost_vdpa_dma_map(void *vdpa, int fd, uint32_t msg_type, uint64_t iova, uint64_t size, uint64_t uaddr, uint8_t perm, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" uaddr: 0x%"PRIx64" perm: 0x%"PRIx8" type: %"PRIu8
> vhost_vdpa_dma_unmap(void *vdpa, int fd, uint32_t msg_type, uint64_t iova, uint64_t size, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" type: %"PRIu8
>+vhost_vdpa_listener_begin_batch(void *v, int fd, uint32_t msg_type, uint8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
>+vhost_vdpa_listener_commit(void *v, int fd, uint32_t msg_type, uint8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
> vhost_vdpa_listener_region_add(void *vdpa, uint64_t iova, uint64_t llend, void *vaddr, bool readonly) "vdpa: %p iova 0x%"PRIx64" llend 0x%"PRIx64" vaddr: %p read-only: %d"
> vhost_vdpa_listener_region_del(void *vdpa, uint64_t iova, uint64_t llend) "vdpa: %p iova 0x%"PRIx64" llend 0x%"PRIx64
> vhost_vdpa_add_status(void *dev, uint8_t status) "dev: %p status: 0x%"PRIx8
>--
>2.27.0
>
>


