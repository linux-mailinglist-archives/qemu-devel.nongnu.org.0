Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA16C3AFF36
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 10:25:13 +0200 (CEST)
Received: from localhost ([::1]:59004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvbia-0002aR-Pt
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 04:25:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lvbhh-0001sy-Cu
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 04:24:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lvbhf-0006CK-JF
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 04:24:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624350254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mcjixS3yYgKSXlD1JEUWZkku0aR5Kz2TWcWEGZ9T7x4=;
 b=daB1XNCW+uuYrGrDVfIidN39kgOqk7pvpD9lW18pPTytY9ellWJBiLNTv+GnF2UquTMQqb
 1Uk/QtN7rB9t8/qXNM0l+tQ04D2JVgylq3/wm6+3otWZBRNttJdMeEljuCINZFRQWNJAcD
 jOUzTh1f+5NVupayLj9oOAH2DFGeYEc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-mOtE743YPFqFA3AGeXyukw-1; Tue, 22 Jun 2021 04:24:13 -0400
X-MC-Unique: mOtE743YPFqFA3AGeXyukw-1
Received: by mail-ej1-f69.google.com with SMTP id
 l6-20020a1709062a86b029046ec0ceaf5cso4896160eje.8
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 01:24:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mcjixS3yYgKSXlD1JEUWZkku0aR5Kz2TWcWEGZ9T7x4=;
 b=AEFfuOkHexrgNoBZjI8ldBeW1h9EEXoYfSkQ6vr2Hz7afGrD7cAleuSTC+a7N1YkaX
 0PG59perlxRg1OvF7nx0SLlla80H9gfoqmpEzkxSVZgToOF4t32W7a5jW8paB6Yw6gRS
 IAWpOMu+WNmAzW1iKDywMmhE01ksKTDl5coktu7xxT8/LfdDM1KKoJtYZmzHCLp5GxxR
 +/w3CZU1LvSAC4gim2QCNZkukvjP2bM5wYXR2LMQyHZe7iMdQOvcLb6ztcbDkEuaRXEr
 VAVY45IY2/2gvRMow8i1sjvCDvJTedly9OvPPk0zutGwv6rrnbvDx19BlG4ImTEMOzhZ
 TeaQ==
X-Gm-Message-State: AOAM530ysPVZjfNPbL6xqxGd7rqahACKUCeMYXrXgJ26t+U/UP0/eOdB
 bHwal7c3qdkfwSOhKd5QyM74b5kmDqV7c9EQM0JDUNQ5tI39Rv59R9mARCVswEQCn9hVP3hYR+M
 b72DFkNe9qgq9wxg=
X-Received: by 2002:a05:6402:19b9:: with SMTP id
 o25mr3273777edz.192.1624350252165; 
 Tue, 22 Jun 2021 01:24:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeXXgtgKQmy8DZIvjqtXt5zy39LHgGEITfP5MR/BeDOCGyseD6hzuOnr22u/x7F9XOS0VPRg==
X-Received: by 2002:a05:6402:19b9:: with SMTP id
 o25mr3273757edz.192.1624350251976; 
 Tue, 22 Jun 2021 01:24:11 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id q16sm11884358edt.26.2021.06.22.01.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 01:24:11 -0700 (PDT)
Date: Tue, 22 Jun 2021 10:24:09 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Subject: Re: [RFC PATCH v1] vhost-vsock: SOCK_SEQPACKET feature bit support
Message-ID: <20210622082409.cmjoor4liw4jslqt@steredhat>
References: <20210621140741.2628913-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <20210621140741.2628913-1-arseny.krasnov@kaspersky.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, oxffffaa@gmail.com,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 21, 2021 at 05:07:41PM +0300, Arseny Krasnov wrote:
>This adds processing of VIRTIO_VSOCK_F_SEQPACKET features bit. Guest
>negotiates it with vhost, thus both will know that SOCK_SEQPACKET
>supported by peer.
>
>Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
>---
> hw/virtio/vhost-vsock.c                       | 16 +++++++++++++++-
> include/standard-headers/linux/virtio_vsock.h |  3 +++
> 2 files changed, 18 insertions(+), 1 deletion(-)
>
>diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
>index 8ddfb9abfe..fc8c143df9 100644
>--- a/hw/virtio/vhost-vsock.c
>+++ b/hw/virtio/vhost-vsock.c
>@@ -108,10 +108,23 @@ static uint64_t vhost_vsock_get_features(VirtIODevice *vdev,
>                                          uint64_t requested_features,
>                                          Error **errp)
> {
>-    /* No feature bits used yet */
>+    VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
>+
>+    if (virtio_has_feature(vvc->vhost_dev.features, VIRTIO_VSOCK_F_SEQPACKET)) {
>+        virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_SEQPACKET);
>+    }
>+

I think we can use vhost_get_features(), take a look at 
hw/virtio/vhost-user-vsock.c


>     return requested_features;
> }
>
>+static void vhost_vsock_set_features(VirtIODevice *vdev, uint64_t features)
>+{
>+    VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
>+    const VhostOps *vhost_ops = vvc->vhost_dev.vhost_ops;
>+
>+    vhost_ops->vhost_set_features(&vvc->vhost_dev, features);

Maybe we can avoid vhost_vsock_set_features(), because in 
vhost_vsock_common_start() we have this code that should do the same, 
sice vhost_dev_start() already call vhost_set_features() with the acked 
features:

     vvc->vhost_dev.acked_features = vdev->guest_features;
     ret = vhost_dev_start(&vvc->vhost_dev, vdev);

I'm not sure if it works. Can you try simply removing 
vhost_vsock_set_features()?

Thanks,
Stefano

>+}
>+
> static const VMStateDescription vmstate_virtio_vhost_vsock = {
>     .name = "virtio-vhost_vsock",
>     .minimum_version_id = VHOST_VSOCK_SAVEVM_VERSION,
>@@ -224,6 +237,7 @@ static void vhost_vsock_class_init(ObjectClass *klass, void *data)
>     vdc->realize = vhost_vsock_device_realize;
>     vdc->unrealize = vhost_vsock_device_unrealize;
>     vdc->get_features = vhost_vsock_get_features;
>+    vdc->set_features = vhost_vsock_set_features;
>     vdc->get_config = vhost_vsock_get_config;
>     vdc->set_status = vhost_vsock_set_status;
> }
>diff --git a/include/standard-headers/linux/virtio_vsock.h 
>b/include/standard-headers/linux/virtio_vsock.h
>index be443211ce..5eac522ee2 100644
>--- a/include/standard-headers/linux/virtio_vsock.h
>+++ b/include/standard-headers/linux/virtio_vsock.h
>@@ -38,6 +38,9 @@
> #include "standard-headers/linux/virtio_ids.h"
> #include "standard-headers/linux/virtio_config.h"
>
>+/* The feature bitmap for virtio vsock */
>+#define VIRTIO_VSOCK_F_SEQPACKET       1       /* SOCK_SEQPACKET 
>supported */
>+
> struct virtio_vsock_config {
> 	uint64_t guest_cid;
> } QEMU_PACKED;
>-- 
>2.25.1
>


