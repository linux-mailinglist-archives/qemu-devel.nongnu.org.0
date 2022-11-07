Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DD561F61A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 15:33:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os3AT-0006XD-8B; Mon, 07 Nov 2022 09:32:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1os39n-0006Sp-2v
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 09:31:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1os39k-0008Um-Ok
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 09:31:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667831480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o+BiyqSIN6bQM7eL5LrpMMYau2SG+/acp453XbUBpE8=;
 b=LHNlD2vARWn86qBXMvICj47ThH+kgVtaO1PpbkPu0VUrZIGAyewz1oPP7YbYXRpGgl8GLa
 VBxyKuB6zYsLCFtblV76mtwzo3+jkFTxJoAfK6vx4pwtMnTFvwZJQAGk324Q8qQ9G9QcdW
 LyzoRKyfLXrH3bWh1tXUdSvZJDUMpAQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-491-ZKSy5kHNOiWJHgni0gzwKw-1; Mon, 07 Nov 2022 09:31:19 -0500
X-MC-Unique: ZKSy5kHNOiWJHgni0gzwKw-1
Received: by mail-wr1-f70.google.com with SMTP id
 n13-20020adf8b0d000000b0023658a75751so2861819wra.23
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 06:31:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o+BiyqSIN6bQM7eL5LrpMMYau2SG+/acp453XbUBpE8=;
 b=ZYrQA+zGkFcM5jnBtSMwaF3yQpKtkU+3HqAceCNEhq5y/U8Mqke3UexL4sIteXSrYu
 GpDv3QutQdwu1XVutVYDfOnpvXg4848jnrJrJ/2MbLFdPkvdvGXM+CuVeBhkUT4k7QvY
 lEFkGPZzI8Iw43r84PlZJD8N/pn+b1DLh5tAsR4CM0qkVfRQGXRV1B6cIszKz2Tig0q6
 1mxPn3lXcB8BHANoaqlZFRiXFXL1sna7bBhvvSJ86Elpwy0a1yJuXlW3Tk+NELNCLPR8
 GCUjdtM8sof1ULDJzM2/OWosjLy8sQeEv7KNRqjdydEIH4aELVGevZ/Nhkb0AXSfU2a1
 EEyQ==
X-Gm-Message-State: ACrzQf2kfD0SOWmE1yKjSBlkCXz+WymSvZ9+juDAaLjpDDl+E/biutWC
 kxzdshhXEN2H7dKSZGQ4ct16WkuetSCuqtUe8A4R/M5ztVqP58de0QAsAUH537FcEoZyyAEUMMZ
 JmEbIl6xr2iFpvcw=
X-Received: by 2002:a5d:45d0:0:b0:236:8201:1cb7 with SMTP id
 b16-20020a5d45d0000000b0023682011cb7mr31419019wrs.417.1667831476852; 
 Mon, 07 Nov 2022 06:31:16 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4EuyDoCxxOyjS1AXtbfW7eGDZ5w/yLX+9E9nDinzRgbrbcnm6axTkoUHyPWg77iQHQXkyHDw==
X-Received: by 2002:a5d:45d0:0:b0:236:8201:1cb7 with SMTP id
 b16-20020a5d45d0000000b0023682011cb7mr31418990wrs.417.1667831476541; 
 Mon, 07 Nov 2022 06:31:16 -0800 (PST)
Received: from redhat.com ([169.150.226.212]) by smtp.gmail.com with ESMTPSA id
 bu12-20020a056000078c00b0023655e51c33sm7691994wrb.4.2022.11.07.06.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 06:31:15 -0800 (PST)
Date: Mon, 7 Nov 2022 09:31:10 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "open list:virtiofs" <virtio-fs@redhat.com>
Subject: Re: [RFC PATCH] hw/virtio: introduce virtio_device_should_start
Message-ID: <20221107091939-mutt-send-email-mst@kernel.org>
References: <20221107121407.1010913-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221107121407.1010913-1-alex.bennee@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Mon, Nov 07, 2022 at 12:14:07PM +0000, Alex Bennée wrote:
> The previous fix to virtio_device_started revealed a problem in its
> use by both the core and the device code. The core code should be able
> to handle the device "starting" while the VM isn't running to handle
> the restoration of migration state. To solve this duel use introduce a

dual use ;)

> new helper for use by the vhost-user backends who all use it to feed a
> should_start variable.
> 
> We can also pick up a change vhost_user_blk_set_status while we are at
> it which follows the same pattern.
> 
> Fixes: 9f6bcfd99f (hw/virtio: move vm_running check to virtio_device_started)
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>

Thanks, gitlab ci seems to have passed this.

I think I'll add 27ba7b027f0f06479091bcfbcd308a6b272563a4 to the Fixes
tag too.

> ---
>  include/hw/virtio/virtio.h   | 18 ++++++++++++++++++
>  hw/block/vhost-user-blk.c    |  6 +-----
>  hw/virtio/vhost-user-fs.c    |  2 +-
>  hw/virtio/vhost-user-gpio.c  |  2 +-
>  hw/virtio/vhost-user-i2c.c   |  2 +-
>  hw/virtio/vhost-user-rng.c   |  2 +-
>  hw/virtio/vhost-user-vsock.c |  2 +-
>  hw/virtio/vhost-vsock.c      |  2 +-
>  8 files changed, 25 insertions(+), 11 deletions(-)
> 
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index f41b4a7e64..3191c618f3 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -389,6 +389,24 @@ static inline bool virtio_device_started(VirtIODevice *vdev, uint8_t status)
>          return vdev->started;
>      }
>  
> +    return status & VIRTIO_CONFIG_S_DRIVER_OK;
> +}
> +
> +/**
> + * virtio_device_should_start() - check if device startable
> + * @vdev - the VirtIO device
> + * @status - the devices status bits
> + *
> + * This is similar to virtio_device_started() but also encapsulates a
> + * check on the VM status which would prevent a device starting
> + * anyway.
> + */
> +static inline bool virtio_device_should_start(VirtIODevice *vdev, uint8_t status)
> +{
> +    if (vdev->use_started) {
> +        return vdev->started;
> +    }
> +
>      if (!vdev->vm_running) {
>          return false;
>      }
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index 13bf5cc47a..8feaf12e4e 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -222,14 +222,10 @@ static void vhost_user_blk_stop(VirtIODevice *vdev)
>  static void vhost_user_blk_set_status(VirtIODevice *vdev, uint8_t status)
>  {
>      VHostUserBlk *s = VHOST_USER_BLK(vdev);
> -    bool should_start = virtio_device_started(vdev, status);
> +    bool should_start = virtio_device_should_start(vdev, status);
>      Error *local_err = NULL;
>      int ret;
>  
> -    if (!vdev->vm_running) {
> -        should_start = false;
> -    }
> -
>      if (!s->connected) {
>          return;
>      }
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index ad0f91c607..1c40f42045 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -123,7 +123,7 @@ static void vuf_stop(VirtIODevice *vdev)
>  static void vuf_set_status(VirtIODevice *vdev, uint8_t status)
>  {
>      VHostUserFS *fs = VHOST_USER_FS(vdev);
> -    bool should_start = virtio_device_started(vdev, status);
> +    bool should_start = virtio_device_should_start(vdev, status);
>  
>      if (vhost_dev_is_started(&fs->vhost_dev) == should_start) {
>          return;
> diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
> index 8b40fe450c..677d1c7730 100644
> --- a/hw/virtio/vhost-user-gpio.c
> +++ b/hw/virtio/vhost-user-gpio.c
> @@ -152,7 +152,7 @@ static void vu_gpio_stop(VirtIODevice *vdev)
>  static void vu_gpio_set_status(VirtIODevice *vdev, uint8_t status)
>  {
>      VHostUserGPIO *gpio = VHOST_USER_GPIO(vdev);
> -    bool should_start = virtio_device_started(vdev, status);
> +    bool should_start = virtio_device_should_start(vdev, status);
>  
>      trace_virtio_gpio_set_status(status);
>  
> diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
> index bc58b6c0d1..864eba695e 100644
> --- a/hw/virtio/vhost-user-i2c.c
> +++ b/hw/virtio/vhost-user-i2c.c
> @@ -93,7 +93,7 @@ static void vu_i2c_stop(VirtIODevice *vdev)
>  static void vu_i2c_set_status(VirtIODevice *vdev, uint8_t status)
>  {
>      VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
> -    bool should_start = virtio_device_started(vdev, status);
> +    bool should_start = virtio_device_should_start(vdev, status);
>  
>      if (vhost_dev_is_started(&i2c->vhost_dev) == should_start) {
>          return;
> diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
> index bc1f36c5ac..8b47287875 100644
> --- a/hw/virtio/vhost-user-rng.c
> +++ b/hw/virtio/vhost-user-rng.c
> @@ -90,7 +90,7 @@ static void vu_rng_stop(VirtIODevice *vdev)
>  static void vu_rng_set_status(VirtIODevice *vdev, uint8_t status)
>  {
>      VHostUserRNG *rng = VHOST_USER_RNG(vdev);
> -    bool should_start = virtio_device_started(vdev, status);
> +    bool should_start = virtio_device_should_start(vdev, status);
>  
>      if (vhost_dev_is_started(&rng->vhost_dev) == should_start) {
>          return;
> diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
> index 7b67e29d83..9431b9792c 100644
> --- a/hw/virtio/vhost-user-vsock.c
> +++ b/hw/virtio/vhost-user-vsock.c
> @@ -55,7 +55,7 @@ const VhostDevConfigOps vsock_ops = {
>  static void vuv_set_status(VirtIODevice *vdev, uint8_t status)
>  {
>      VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
> -    bool should_start = virtio_device_started(vdev, status);
> +    bool should_start = virtio_device_should_start(vdev, status);
>  
>      if (vhost_dev_is_started(&vvc->vhost_dev) == should_start) {
>          return;
> diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
> index 7dc3c73931..aa16d584ee 100644
> --- a/hw/virtio/vhost-vsock.c
> +++ b/hw/virtio/vhost-vsock.c
> @@ -70,7 +70,7 @@ static int vhost_vsock_set_running(VirtIODevice *vdev, int start)
>  static void vhost_vsock_set_status(VirtIODevice *vdev, uint8_t status)
>  {
>      VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
> -    bool should_start = virtio_device_started(vdev, status);
> +    bool should_start = virtio_device_should_start(vdev, status);
>      int ret;
>  
>      if (vhost_dev_is_started(&vvc->vhost_dev) == should_start) {
> -- 
> 2.34.1


