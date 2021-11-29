Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 911634616F6
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 14:47:25 +0100 (CET)
Received: from localhost ([::1]:37790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrh07-0002xW-Dk
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 08:47:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mrgxO-0008UE-6Z
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:44:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mrgxL-0001ik-Um
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:44:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638193470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KAYh8y7YFjNrhFGGh4mY3eAImWZrEQ39cOSgeekO/+o=;
 b=A4PYAFIBVYafnLLo927j2hP1OHa4Ol8lZGp+tBBsDu0z4eoSl9phJtreO23XlhHTZ/uB+a
 suhP069YfiHxHD9d2pe8Oov6vH7jl6trbOrXbYUQJ3KXGWYLv/8CuKqn5d3XXEVrfhXhgW
 XePMjePsbRl+qTVnOMOFM8DH9QC0dtg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-DL_GRnVINd-Zk_Te36qlTg-1; Mon, 29 Nov 2021 08:44:29 -0500
X-MC-Unique: DL_GRnVINd-Zk_Te36qlTg-1
Received: by mail-ed1-f71.google.com with SMTP id
 t9-20020aa7d709000000b003e83403a5cbso13771198edq.19
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 05:44:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KAYh8y7YFjNrhFGGh4mY3eAImWZrEQ39cOSgeekO/+o=;
 b=aGnytnOFqI+SPvqdrQyRKZOkUYO4RlvS5xlbblvlFXInOMoJUVY1CtfkGAN4Ts0Tgw
 vrFCRuaIEfwcJUQqlhqnBofbei3k37FvkKv5VMMhu/OW4h4anZxmttZzSwnJ5ND6ui3h
 j1ETpfRIBvyUoB2VX7A5/leHSxUU4dBIQOrfDMECPoDug/FhQe14Cv9/+PoI/LOoa41m
 GUn18jbbODr7Ml3ltfOgAq7B/3Wt5Fi7Joe+6RGDlCBb4244kSJfgSmPST/GUADLLVaS
 sGJz/ZMclhuG49iCMx0RuLINsLl3deIFu/W61f/khVuD4W1rTQHt9TozheP9QbxEpe0Z
 ZIdQ==
X-Gm-Message-State: AOAM530SV9UxygkexlKdHrEyPseJho0Q3x8EJqQvrksv0RpGAVAPtRS5
 aIV9dbBxMlXevXOaFCOsVh5jOF9BED9b269huYh54jVNa6g9sBaspc9y28rL56O9ehm4bN9xaYN
 jI/2lsstKmvrtjeU=
X-Received: by 2002:a05:6402:516c:: with SMTP id
 d12mr74126079ede.391.1638193468514; 
 Mon, 29 Nov 2021 05:44:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw60q/4u+z3atJmMZWDJi5BhZ9twh9P20EQzXP4D9bDN97B4WZHG54GaPojXL+hBSHZmomOtA==
X-Received: by 2002:a05:6402:516c:: with SMTP id
 d12mr74126033ede.391.1638193468274; 
 Mon, 29 Nov 2021 05:44:28 -0800 (PST)
Received: from steredhat (host-79-46-195-175.retail.telecomitalia.it.
 [79.46.195.175])
 by smtp.gmail.com with ESMTPSA id w7sm9150250ede.66.2021.11.29.05.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 05:44:28 -0800 (PST)
Date: Mon, 29 Nov 2021 14:44:26 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Daniil Tatianin <d-tatianin@yandex-team.ru>
Subject: Re: [PATCH v1] virtio/vhost-vsock: don't double close vhostfd,
 remove redundant cleanup
Message-ID: <20211129134426.26d7r4xxfrolpfb2@steredhat>
References: <20211129125204.1108088-1-d-tatianin@yandex-team.ru>
MIME-Version: 1.0
In-Reply-To: <20211129125204.1108088-1-d-tatianin@yandex-team.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, yc-core@yandex-team.ru, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 29, 2021 at 03:52:04PM +0300, Daniil Tatianin wrote:
>In case of an error during initialization in vhost_dev_init, vhostfd is
>closed in vhost_dev_cleanup. Remove close from err_virtio as it's both
>redundant and causes a double close on vhostfd.
>
>Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
>---
> hw/virtio/vhost-vsock.c | 11 +++++------
> 1 file changed, 5 insertions(+), 6 deletions(-)
>
>diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
>index 478c0c9a87..433d42d897 100644
>--- a/hw/virtio/vhost-vsock.c
>+++ b/hw/virtio/vhost-vsock.c
>@@ -171,6 +171,10 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
>     ret = vhost_dev_init(&vvc->vhost_dev, (void *)(uintptr_t)vhostfd,
>                          VHOST_BACKEND_TYPE_KERNEL, 0, errp);
>     if (ret < 0) {
>+        /*
>+         * vhostfd is closed by vhost_dev_cleanup, which is called
>+         * by vhost_dev_init on initialization error.
>+         */
>         goto err_virtio;
>     }
>
>@@ -183,15 +187,10 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
>     return;
>
> err_vhost_dev:
>-    vhost_dev_cleanup(&vvc->vhost_dev);
>     /* vhost_dev_cleanup() closes the vhostfd passed to vhost_dev_init() */
>-    vhostfd = -1;
>+    vhost_dev_cleanup(&vvc->vhost_dev);
> err_virtio:
>     vhost_vsock_common_unrealize(vdev);
>-    if (vhostfd >= 0) {
>-        close(vhostfd);
>-    }
>-    return;
> }
>
> static void vhost_vsock_device_unrealize(DeviceState *dev)
>-- 
>2.25.1
>
>

Thanks for this patch. It LGTM:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


