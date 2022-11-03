Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2F46184E6
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:40:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqdFs-00062V-FL; Thu, 03 Nov 2022 12:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqdFg-0005vx-Ji
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 12:39:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqdFe-0003D2-91
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 12:39:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667493572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bwof9DIo8kT8YoUl7GwKE1offG/zMvTQoyZ75q7UOTI=;
 b=I3KfOKMQHh4JkALy9fPfh0jAkQeSD+AFCcEHVTU/2vtB1zzdcolkSPp58JRYYF6NDamber
 kXvRo5tfazUwVBeDUlAtVkqZd8mJDUmUPhGvVuP+WGZnGlThizweDLGuYYiFIYWohWHJoc
 4FygtzEY60OcsJuiwlnVWlznfnkc05w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-584-y04rpbNfPwqhLqNJop4KSQ-1; Thu, 03 Nov 2022 12:39:31 -0400
X-MC-Unique: y04rpbNfPwqhLqNJop4KSQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 d23-20020adfa417000000b002364a31b7c9so664130wra.15
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 09:39:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bwof9DIo8kT8YoUl7GwKE1offG/zMvTQoyZ75q7UOTI=;
 b=fuSsC0MXCYgkf72raIfTgO5MZnJAClCtc4Pi9wujus4pX2hWITnxpVIgTkBUCrexlS
 leBHQwYgeUZOsQemtRK3Nc+UgOUcCoFymjqK6grNIIBz1sgFNdfHU/UzCHQeSOIXEBzH
 LOFx8doCu+Pems7wLgIl3sf7aIDvkpF+6ivU+W5ioBf83j2To4qvYdes82PjUR/BlCfT
 UR94Tyr7M4++Dblr8F3ewce84xRDV4cBgRhUuW+4jCT7+dr4JAWMQ4sYr7uwAPs1q7+P
 TPi1vpnp8nyyoSB9fHa/bXyl4b5NbDSZbcKlAL+iQuQW6U+CcHfCTBOhQ213z2ZxKDnB
 YU/g==
X-Gm-Message-State: ACrzQf3v7TpUBuJIhDXcskxPuFV+mJYBbF6NQjUI+pM5lIaHL+6PXbOw
 DRV6XRmiFxw7CdrWnNoaAjfPDx+XYFWZGZztR6Cez00Gxn+2F1xkAsaIDdV7+0IoCe0aoUjNBXM
 RO9lVeS8KaTHMMxE=
X-Received: by 2002:adf:fb84:0:b0:21a:10f2:1661 with SMTP id
 a4-20020adffb84000000b0021a10f21661mr19291775wrr.2.1667493570055; 
 Thu, 03 Nov 2022 09:39:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5x+ED/VEw4e+v20w+w9vso9hX+vvvB1/2yPwdbGkopOqDE1Rfram/XKkGR3ZNv3920AfGgGg==
X-Received: by 2002:adf:fb84:0:b0:21a:10f2:1661 with SMTP id
 a4-20020adffb84000000b0021a10f21661mr19291758wrr.2.1667493569770; 
 Thu, 03 Nov 2022 09:39:29 -0700 (PDT)
Received: from redhat.com ([2.55.58.252]) by smtp.gmail.com with ESMTPSA id
 n1-20020a1ca401000000b003cf66a2d433sm279957wme.33.2022.11.03.09.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 09:39:28 -0700 (PDT)
Date: Thu, 3 Nov 2022 12:39:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, slp@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:virtiofs" <virtio-fs@redhat.com>
Subject: Re: [PATCH  v4 10/22] hw/virtio: move vm_running check to
 virtio_device_started
Message-ID: <20221103123856-mutt-send-email-mst@kernel.org>
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
 <20220802095010.3330793-11-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220802095010.3330793-11-alex.bennee@linaro.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Aug 02, 2022 at 10:49:58AM +0100, Alex Bennée wrote:
> All the boilerplate virtio code does the same thing (or should at
> least) of checking to see if the VM is running before attempting to
> start VirtIO. Push the logic up to the common function to avoid
> getting a copy and paste wrong.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

How bad is it if we drop this?

> ---
>  include/hw/virtio/virtio.h   | 5 +++++
>  hw/virtio/vhost-user-fs.c    | 6 +-----
>  hw/virtio/vhost-user-i2c.c   | 6 +-----
>  hw/virtio/vhost-user-rng.c   | 6 +-----
>  hw/virtio/vhost-user-vsock.c | 6 +-----
>  hw/virtio/vhost-vsock.c      | 6 +-----
>  6 files changed, 10 insertions(+), 25 deletions(-)
> 
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index 9bb2485415..74e7ad5a92 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -100,6 +100,7 @@ struct VirtIODevice
>      VirtQueue *vq;
>      MemoryListener listener;
>      uint16_t device_id;
> +    /* @vm_running: current VM running state via virtio_vmstate_change() */
>      bool vm_running;
>      bool broken; /* device in invalid state, needs reset */
>      bool use_disabled_flag; /* allow use of 'disable' flag when needed */
> @@ -376,6 +377,10 @@ static inline bool virtio_device_started(VirtIODevice *vdev, uint8_t status)
>          return vdev->started;
>      }
>  
> +    if (!vdev->vm_running) {
> +        return false;
> +    }
> +
>      return status & VIRTIO_CONFIG_S_DRIVER_OK;
>  }
>  
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index e513e4fdda..d2bebba785 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -122,11 +122,7 @@ static void vuf_stop(VirtIODevice *vdev)
>  static void vuf_set_status(VirtIODevice *vdev, uint8_t status)
>  {
>      VHostUserFS *fs = VHOST_USER_FS(vdev);
> -    bool should_start = status & VIRTIO_CONFIG_S_DRIVER_OK;
> -
> -    if (!vdev->vm_running) {
> -        should_start = false;
> -    }
> +    bool should_start = virtio_device_started(vdev, status);
>  
>      if (fs->vhost_dev.started == should_start) {
>          return;
> diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
> index 6020eee093..b930cf6d5e 100644
> --- a/hw/virtio/vhost-user-i2c.c
> +++ b/hw/virtio/vhost-user-i2c.c
> @@ -93,11 +93,7 @@ static void vu_i2c_stop(VirtIODevice *vdev)
>  static void vu_i2c_set_status(VirtIODevice *vdev, uint8_t status)
>  {
>      VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
> -    bool should_start = status & VIRTIO_CONFIG_S_DRIVER_OK;
> -
> -    if (!vdev->vm_running) {
> -        should_start = false;
> -    }
> +    bool should_start = virtio_device_started(vdev, status);
>  
>      if (i2c->vhost_dev.started == should_start) {
>          return;
> diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
> index 3a7bf8e32d..a9c1c4bc79 100644
> --- a/hw/virtio/vhost-user-rng.c
> +++ b/hw/virtio/vhost-user-rng.c
> @@ -90,11 +90,7 @@ static void vu_rng_stop(VirtIODevice *vdev)
>  static void vu_rng_set_status(VirtIODevice *vdev, uint8_t status)
>  {
>      VHostUserRNG *rng = VHOST_USER_RNG(vdev);
> -    bool should_start = status & VIRTIO_CONFIG_S_DRIVER_OK;
> -
> -    if (!vdev->vm_running) {
> -        should_start = false;
> -    }
> +    bool should_start = virtio_device_started(vdev, status);
>  
>      if (rng->vhost_dev.started == should_start) {
>          return;
> diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
> index 0f8ff99f85..22c1616ebd 100644
> --- a/hw/virtio/vhost-user-vsock.c
> +++ b/hw/virtio/vhost-user-vsock.c
> @@ -55,11 +55,7 @@ const VhostDevConfigOps vsock_ops = {
>  static void vuv_set_status(VirtIODevice *vdev, uint8_t status)
>  {
>      VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
> -    bool should_start = status & VIRTIO_CONFIG_S_DRIVER_OK;
> -
> -    if (!vdev->vm_running) {
> -        should_start = false;
> -    }
> +    bool should_start = virtio_device_started(vdev, status);
>  
>      if (vvc->vhost_dev.started == should_start) {
>          return;
> diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
> index 0338de892f..8031c164a5 100644
> --- a/hw/virtio/vhost-vsock.c
> +++ b/hw/virtio/vhost-vsock.c
> @@ -70,13 +70,9 @@ static int vhost_vsock_set_running(VirtIODevice *vdev, int start)
>  static void vhost_vsock_set_status(VirtIODevice *vdev, uint8_t status)
>  {
>      VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
> -    bool should_start = status & VIRTIO_CONFIG_S_DRIVER_OK;
> +    bool should_start = virtio_device_started(vdev, status);
>      int ret;
>  
> -    if (!vdev->vm_running) {
> -        should_start = false;
> -    }
> -
>      if (vvc->vhost_dev.started == should_start) {
>          return;
>      }
> -- 
> 2.30.2


