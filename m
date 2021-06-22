Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 075E33B07F5
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 16:56:29 +0200 (CEST)
Received: from localhost ([::1]:55638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvhpE-000652-3s
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 10:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lvhnF-0004oI-Gy
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 10:54:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lvhnD-0005L7-SO
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 10:54:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624373662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YzY/ElsXzzSG0xvINKG5lngA9xilpsJjnJnx2HK+pPQ=;
 b=Iah7Cf0vOTrZpFcVo/O/PckBa6S+GeElZjo61kL9DNsO+jf4yqiO8ohwSPz4vNVkeE80a1
 gizAKfo5n2P4cCjOeSqjCitdg7mqcZp76p1cv7cxfTWuVt3H3Lv9uZVo894sN/YS65pwS+
 n9Qk6gAlFgcW+4NvHAth/aEjnEWQzu8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-DQphZphxNYeIIZo63Io1oQ-1; Tue, 22 Jun 2021 10:54:21 -0400
X-MC-Unique: DQphZphxNYeIIZo63Io1oQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 p23-20020aa7cc970000b02903948bc39fd5so7555293edt.13
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 07:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YzY/ElsXzzSG0xvINKG5lngA9xilpsJjnJnx2HK+pPQ=;
 b=bRArw4nhmFjgJIGvqHap+0cPU0zjxt+nfPyGjejB3TN8POy6Wubq+ilwTy/14U/tUM
 KeBX2G5T2CXhbNIgj2IeetcefA5SwDWBLucwgnDkPF/XSZZWxjHud/fAcibZoo/p/L8S
 hXnpvoQn9h0p5+rBL6u4vFZh8HC46077ZJYSPDjs0gUVB03UZRCCk4RrQAZgrYxxbsSm
 TpINtQnaW3M9cqz2exqZ3cfDRQOqgKimJkKKlYaPwO45pHsJHlGOqfWnmIxVRoo1/8Cy
 EaeDSfsHmcn3ypu50X352/S/IEyc+u5pGWYPyuNxR75L5lBLR2kFyvOTspN5V67W5ipd
 J1vQ==
X-Gm-Message-State: AOAM533YzCTmBMa5ypw6ZArnWTsiymjFHGaP4b1v2W5MRmfgyHTalElp
 58eNSB86XgX6wcWAh4qwcRIH4STIrH9QLTva50V/7mpVIsdK/lGYpOCiu1rmZkatNwZaSmNWycT
 7muggpVvOiYpvmmw=
X-Received: by 2002:aa7:c614:: with SMTP id h20mr5509577edq.67.1624373660027; 
 Tue, 22 Jun 2021 07:54:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyh9M71D11WKeGXqB8uElfTPPeijN/J0oyuFct2FRdYMYrz6XpdKofrW85Dm2MoiXiQuBrm3A==
X-Received: by 2002:aa7:c614:: with SMTP id h20mr5509557edq.67.1624373659877; 
 Tue, 22 Jun 2021 07:54:19 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id hg9sm6189603ejc.91.2021.06.22.07.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 07:54:19 -0700 (PDT)
Date: Tue, 22 Jun 2021 16:54:17 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Subject: Re: [PATCH v3] vhost-vsock: SOCK_SEQPACKET feature bit support
Message-ID: <20210622145417.mmeicxdiha4rlds2@steredhat>
References: <20210622144747.2949134-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <20210622144747.2949134-1-arseny.krasnov@kaspersky.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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

On Tue, Jun 22, 2021 at 05:47:47PM +0300, Arseny Krasnov wrote:
>This adds processing of VIRTIO_VSOCK_F_SEQPACKET features bit. Guest
>negotiates it with vhost, thus both will know that SOCK_SEQPACKET
>supported by peer.
>
>Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
>---
> hw/virtio/vhost-vsock.c                       | 12 ++++++++++--
> include/standard-headers/linux/virtio_vsock.h |  3 +++
> 2 files changed, 13 insertions(+), 2 deletions(-)
>
>diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
>index c8f0699b4f..e6339747b3 100644
>--- a/hw/virtio/vhost-vsock.c
>+++ b/hw/virtio/vhost-vsock.c
>@@ -20,6 +20,11 @@
> #include "hw/virtio/vhost-vsock.h"
> #include "monitor/monitor.h"
>
>+const int feature_bits[] = {
>+    VIRTIO_VSOCK_F_SEQPACKET,
>+    VHOST_INVALID_FEATURE_BIT
>+};
>+
> static void vhost_vsock_get_config(VirtIODevice *vdev, uint8_t *config)
> {
>     VHostVSock *vsock = VHOST_VSOCK(vdev);
>@@ -107,8 +112,11 @@ static uint64_t vhost_vsock_get_features(VirtIODevice *vdev,
>                                          uint64_t requested_features,
>                                          Error **errp)
> {
>-    /* No feature bits used yet */
>-    return requested_features;
>+    VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
>+
>+    virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_SEQPACKET);
>+    return vhost_get_features(&vvc->vhost_dev, feature_bits,
>+                                requested_features);
> }
>
> static const VMStateDescription vmstate_virtio_vhost_vsock = {
>diff --git a/include/standard-headers/linux/virtio_vsock.h b/include/standard-headers/linux/virtio_vsock.h
>index be443211ce..5eac522ee2 100644
>--- a/include/standard-headers/linux/virtio_vsock.h
>+++ b/include/standard-headers/linux/virtio_vsock.h
>@@ -38,6 +38,9 @@
> #include "standard-headers/linux/virtio_ids.h"
> #include "standard-headers/linux/virtio_config.h"
>
>+/* The feature bitmap for virtio vsock */
>+#define VIRTIO_VSOCK_F_SEQPACKET       1       /* SOCK_SEQPACKET supported */
>+
> struct virtio_vsock_config {
> 	uint64_t guest_cid;
> } QEMU_PACKED;
>-- 
>2.25.1
>

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


