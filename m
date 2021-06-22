Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C62D13B07A8
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 16:42:14 +0200 (CEST)
Received: from localhost ([::1]:42728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvhbR-0005Nf-BG
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 10:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lvhag-0004iN-58
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 10:41:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lvhad-0005Fn-Hm
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 10:41:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624372882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C1VVKBdnF40Ch93vnzXa8uB6Y4/88EXk01b/5+6nDC0=;
 b=VdqUQo7xWLv+12APjHUFRsYthp6M26nGXACYa89II3krBtM8wE9I2gdika+BPrkS+I1bhE
 N7D1Dn+2DjuJBWOPKGNhpcW1EY5NQOtzIyC2d0Avxm6CO+tXVh5WZLfHuXx1Z3fQHTlOaV
 YtzcJ1aAD5igWzWY9kb5PEgtVtLjnUU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-G0SwFIiGOPSILOJcHhiQTg-1; Tue, 22 Jun 2021 10:41:20 -0400
X-MC-Unique: G0SwFIiGOPSILOJcHhiQTg-1
Received: by mail-ed1-f69.google.com with SMTP id
 cb4-20020a0564020b64b02903947455afa5so7812935edb.9
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 07:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=C1VVKBdnF40Ch93vnzXa8uB6Y4/88EXk01b/5+6nDC0=;
 b=j2vgEobvD0QHXpOttchraKtd7yWzma468QnQeAc98P2iMpoGQtRquYcm5Dk8DXDiMh
 4zwqVzwfyDLMbFwGBz3zNohrbGg6qKWjvTIymBOVbjIGCNBKU8YZ8Stqg5lTN7UJiLum
 PoJsea9fQb7l9CP8bOvpgTNXbF0xrxYqfhM05V3EqBcv3uxCDQuEJjKg353kEPq9e7Oa
 A6fQBPoYd3fUyFoEO1oHLKPtXrT4/WPWLiN6UqRIAhmogtr+bysBBr4S8km1KwjUnata
 in27TdM5P5SlYFv3lXR51kfpuQU6bBcYuYMTaFrmLpIARD1StMdATb+71gjuemJr2aW8
 9wUQ==
X-Gm-Message-State: AOAM5339z8hb0Be4qXW+da2InebRRgtzF59E/2swo4Mn8TJVP1W/3UQV
 mfHJrPolXJTbD7qHtmTBdjH8yEpN47nv42K4DMBwloURvRO5P3aL2ylLSXUacoASydCb1AERc1N
 LvemsCrThYC0nKXM=
X-Received: by 2002:a50:ff0a:: with SMTP id a10mr5469536edu.273.1624372879669; 
 Tue, 22 Jun 2021 07:41:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLWnVS616Rhp1fuyXXFGKHyJW3Nr8xCFXRTak7V7ONSzETX96rUMEig0apIS+UumRFV4qSrQ==
X-Received: by 2002:a50:ff0a:: with SMTP id a10mr5469499edu.273.1624372879431; 
 Tue, 22 Jun 2021 07:41:19 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id m7sm12019092edc.46.2021.06.22.07.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 07:41:19 -0700 (PDT)
Date: Tue, 22 Jun 2021 16:41:17 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Subject: Re: [PATCH v2] vhost-vsock: SOCK_SEQPACKET feature bit support
Message-ID: <20210622144117.owtroypg4litbeem@steredhat>
References: <20210622121631.2916319-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <20210622121631.2916319-1-arseny.krasnov@kaspersky.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
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

On Tue, Jun 22, 2021 at 03:16:31PM +0300, Arseny Krasnov wrote:
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
>index c8f0699b4f..0406a5d3dc 100644
>--- a/hw/virtio/vhost-vsock.c
>+++ b/hw/virtio/vhost-vsock.c
>@@ -103,12 +103,20 @@ static void vhost_vsock_set_status(VirtIODevice *vdev, uint8_t status)
>     }
> }
>

If you have to resend, better move this to the beginning of the file, 
right after the includes.

>+const int feature_bits[] = {
>+    VIRTIO_VSOCK_F_SEQPACKET,
>+    VHOST_INVALID_FEATURE_BIT
>+};
>+
> static uint64_t vhost_vsock_get_features(VirtIODevice *vdev,
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

LGTM:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


