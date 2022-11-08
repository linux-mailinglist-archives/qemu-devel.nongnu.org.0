Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F35620C4F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 10:34:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osKzo-0006hq-4I; Tue, 08 Nov 2022 04:34:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osKzf-0006d8-JI
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 04:34:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osKzd-0006WC-Ji
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 04:34:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667900045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N+lyAqQEyajv+edu2RW1YAR6wK3LN8HMOZ+kHZo9elc=;
 b=Xy6cu5LgdRWFpDQjpXNi647cDGq5tYp7aRDb7JlwtnOFxXpyPwxbqRHy78CEDg1ML94vcY
 gmK5+arr/6ur/EA65Ext4BhTOG0FPIhvtZqecuXDbpSni3uQQR0yhCmvlULdQfSb46ccss
 GNn+esWLJc/M5Dm+enzQgoviN1LzMG8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-481-FRDxhYFuNtG7s79HYWygYA-1; Tue, 08 Nov 2022 04:34:03 -0500
X-MC-Unique: FRDxhYFuNtG7s79HYWygYA-1
Received: by mail-qv1-f70.google.com with SMTP id
 g1-20020ad45101000000b004bb5eb9913fso9330590qvp.16
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 01:34:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N+lyAqQEyajv+edu2RW1YAR6wK3LN8HMOZ+kHZo9elc=;
 b=qcKicgw5rNG3/03wNdCeH8cx5wMRg9Rf9SQkhretrD4Sc8wo1da9bbpAMNzNRrrhnh
 OjK9emLn+iwFwnA/ofQAILXWUs9WT97ifFXAqd6pQ+fHxPJgVGYilKWTp46kn5BN+T8K
 QfQLDI0c0SVzhSj4x30alakFgqN3qhW1s4TLTG+PSHtVLWvGWpnZ+CQJwqAZKWR+laUJ
 wrOvqbLUIKMnEqj4vcw8WzBi3ZlXeUbLc0r8QrL7r5lA89Q3MQxN1gtNv/c2K3ULR4q6
 WXwvb3nL2tlyeVtg8r6W2j6AVi0qjIh6Sq3n2M0h+h1VaeaGMeRKSmZrKdhW1ApUgcg6
 cnQQ==
X-Gm-Message-State: ACrzQf0bHzmouJBW5g28nqsLK1bfGY6YZ0zMn537Ts8iKQHixu6hUxEy
 Ro8ssmY1oSqw/lwQTYWyJVPbmH6y3WrQmgcWK7W854+kPGLY45uHF0cwTkJI2RPIuvIgTphe6Vr
 3ZdSEjsdnWjzodbo=
X-Received: by 2002:a05:622a:148c:b0:3a5:b66:f377 with SMTP id
 t12-20020a05622a148c00b003a50b66f377mr42759252qtx.125.1667900043191; 
 Tue, 08 Nov 2022 01:34:03 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5ZIhp6xDlM64KmnvdwjcMZWAoHMuJAL6ZqQdQ07U1YKDmGNyKeh5oDgXk+P+B9rlNYx5Hp2Q==
X-Received: by 2002:a05:622a:148c:b0:3a5:b66:f377 with SMTP id
 t12-20020a05622a148c00b003a50b66f377mr42759235qtx.125.1667900042730; 
 Tue, 08 Nov 2022 01:34:02 -0800 (PST)
Received: from redhat.com ([138.199.52.3]) by smtp.gmail.com with ESMTPSA id
 r16-20020ac87ef0000000b003996aa171b9sm7675978qtc.97.2022.11.08.01.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 01:34:02 -0800 (PST)
Date: Tue, 8 Nov 2022 04:33:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "open list:virtiofs" <virtio-fs@redhat.com>
Subject: Re: [PATCH  v1 5/9] hw/virtio: introduce virtio_device_should_start
Message-ID: <20221108043313-mutt-send-email-mst@kernel.org>
References: <20221108092308.1717426-1-alex.bennee@linaro.org>
 <20221108092308.1717426-6-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221108092308.1717426-6-alex.bennee@linaro.org>
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

On Tue, Nov 08, 2022 at 09:23:04AM +0000, Alex Bennée wrote:
> The previous fix to virtio_device_started revealed a problem in its
> use by both the core and the device code. The core code should be able
> to handle the device "starting" while the VM isn't running to handle
> the restoration of migration state. To solve this dual use introduce a
> new helper for use by the vhost-user backends who all use it to feed a
> should_start variable.
> 
> We can also pick up a change vhost_user_blk_set_status while we are at
> it which follows the same pattern.
> 
> Fixes: 9f6bcfd99f (hw/virtio: move vm_running check to virtio_device_started)
> Fixes: 27ba7b027f (hw/virtio: add boilerplate for vhost-user-gpio device)
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>

is this the same as the RFC?

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
> 
> 
> 


