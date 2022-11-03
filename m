Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8536184E5
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:40:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqdGJ-0006TE-2h; Thu, 03 Nov 2022 12:40:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqdGH-0006Rm-3Z
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 12:40:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqdGE-0003SR-5H
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 12:40:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667493609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0hrsy5+L2Exj6iVbIfqWTcZsRpMwyDAKBKAmTVmPwuY=;
 b=jEaOe7RNCaUBBO4EkltiA0PG1lvhykRmag1lB9eUIbuDcEc/k9844N6lh/C8xgCfGeDh/q
 8Ai8LseKb1BzP2mlm00o/yy+zhPcWDuNUUdX81718XIT+XWVLre8MyzlRoCfIs+C1qPR0H
 L5uA9fd80jBTj1QbG2bxFiELvJAmNl4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-151-xiK4pgNtMfyHq35hagBqqA-1; Thu, 03 Nov 2022 12:39:57 -0400
X-MC-Unique: xiK4pgNtMfyHq35hagBqqA-1
Received: by mail-wm1-f70.google.com with SMTP id
 s7-20020a1cf207000000b003cf56bad2e2so703275wmc.9
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 09:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0hrsy5+L2Exj6iVbIfqWTcZsRpMwyDAKBKAmTVmPwuY=;
 b=pJt0mctZ5F9yklaY2qDMCfedih4rFQfQnh1CV2GLsAWvaYId/XGTevDoeFFBy0kEod
 k8AGqRBJwftgBaQ8dUYWotzKTrtvQuUhE02BIRBRxXcgkdE3IrEwvK3Ss52jxoLUSatP
 wbVDlLQ4RnjlA1/dD/minT69QshZMkIJ6dI9EWfo0UvyKxfOZ3i4pEVpobpLUqvLI2Yr
 vA8ixIJFZo5anw22GwjJ8DKNpNGMjxMnJSfDRiDakMM65lFbsWwWIygyKqt6cyGtneKG
 iUaDqM3RTccoufpgrMxe8eIadL5FctE9l55tsuxCzOUMNednQBSUVKPRADzwS7rEZHfe
 1phQ==
X-Gm-Message-State: ACrzQf2YI3yB/7VRr4vtVu3FtDnHm0rJgv4N8eHdqsF9pLX7xK4m1w1G
 TlaXRzByWOEAm+5tp6Vhrhh1Uv7W0F56oVCNpjjrzpDnRvA/nAtfTlxGcXZg22qL4LpiEDF7NpG
 YNugNIjnBaHDJb/4=
X-Received: by 2002:adf:f943:0:b0:232:ce6b:40d4 with SMTP id
 q3-20020adff943000000b00232ce6b40d4mr20093960wrr.453.1667493596378; 
 Thu, 03 Nov 2022 09:39:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6h0j5pU3c8G9I5iJoeBWTHdoLFPoml4kZOs0esX+OH9dBQErOVcf1QiP7zkOTdsg6tAQI9UQ==
X-Received: by 2002:adf:f943:0:b0:232:ce6b:40d4 with SMTP id
 q3-20020adff943000000b00232ce6b40d4mr20093931wrr.453.1667493596063; 
 Thu, 03 Nov 2022 09:39:56 -0700 (PDT)
Received: from redhat.com ([2.55.58.252]) by smtp.gmail.com with ESMTPSA id
 n18-20020a05600c465200b003b497138093sm227351wmo.47.2022.11.03.09.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 09:39:55 -0700 (PDT)
Date: Thu, 3 Nov 2022 12:39:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, slp@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "open list:virtiofs" <virtio-fs@redhat.com>
Subject: Re: [PATCH v4 11/22] hw/virtio: move vhd->started check into helper
 and add FIXME
Message-ID: <20221103123932-mutt-send-email-mst@kernel.org>
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
 <20220802095010.3330793-12-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220802095010.3330793-12-alex.bennee@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Aug 02, 2022 at 10:49:59AM +0100, Alex Bennée wrote:
> The `started` field is manipulated internally within the vhost code
> except for one place, vhost-user-blk via f5b22d06fb (vhost: recheck
> dev state in the vhost_migration_log routine). Mark that as a FIXME
> because it introduces a potential race. I think the referenced fix
> should be tracking its state locally.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

And I guess this for good measure.

> ---
>  include/hw/virtio/vhost.h      | 12 ++++++++++++
>  hw/block/vhost-user-blk.c      | 10 ++++++++--
>  hw/scsi/vhost-scsi.c           |  4 ++--
>  hw/scsi/vhost-user-scsi.c      |  2 +-
>  hw/virtio/vhost-user-fs.c      |  3 ++-
>  hw/virtio/vhost-user-i2c.c     |  4 ++--
>  hw/virtio/vhost-user-rng.c     |  4 ++--
>  hw/virtio/vhost-user-vsock.c   |  2 +-
>  hw/virtio/vhost-vsock-common.c |  3 ++-
>  hw/virtio/vhost-vsock.c        |  2 +-
>  10 files changed, 33 insertions(+), 13 deletions(-)
> 
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index 586c5457e2..61b957e927 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -94,6 +94,7 @@ struct vhost_dev {
>      uint64_t protocol_features;
>      uint64_t max_queues;
>      uint64_t backend_cap;
> +    /* @started: is the vhost device started? */
>      bool started;
>      bool log_enabled;
>      uint64_t log_size;
> @@ -165,6 +166,17 @@ int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
>   */
>  void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
>  
> +/**
> + * vhost_dev_is_started() - report status of vhost device
> + * @hdev: common vhost_dev structure
> + *
> + * Return the started status of the vhost device
> + */
> +static inline bool vhost_dev_is_started(struct vhost_dev *hdev)
> +{
> +    return hdev->started;
> +}
> +
>  /**
>   * vhost_dev_start() - start the vhost device
>   * @hdev: common vhost_dev structure
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index 9117222456..2bba42478d 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -229,7 +229,7 @@ static void vhost_user_blk_set_status(VirtIODevice *vdev, uint8_t status)
>          return;
>      }
>  
> -    if (s->dev.started == should_start) {
> +    if (vhost_dev_is_started(&s->dev) == should_start) {
>          return;
>      }
>  
> @@ -286,7 +286,7 @@ static void vhost_user_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
>          return;
>      }
>  
> -    if (s->dev.started) {
> +    if (vhost_dev_is_started(&s->dev)) {
>          return;
>      }
>  
> @@ -415,6 +415,12 @@ static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
>               * the vhost migration code. If disconnect was caught there is an
>               * option for the general vhost code to get the dev state without
>               * knowing its type (in this case vhost-user).
> +             *
> +             * FIXME: this is sketchy to be reaching into vhost_dev
> +             * now because we are forcing something that implies we
> +             * have executed vhost_dev_stop() but that won't happen
> +             * until vhost_user_blk_stop() gets called from the bh.
> +             * Really this state check should be tracked locally.
>               */
>              s->dev.started = false;
>          }
> diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
> index 3059068175..bdf337a7a2 100644
> --- a/hw/scsi/vhost-scsi.c
> +++ b/hw/scsi/vhost-scsi.c
> @@ -120,7 +120,7 @@ static void vhost_scsi_set_status(VirtIODevice *vdev, uint8_t val)
>          start = false;
>      }
>  
> -    if (vsc->dev.started == start) {
> +    if (vhost_dev_is_started(&vsc->dev) == start) {
>          return;
>      }
>  
> @@ -147,7 +147,7 @@ static int vhost_scsi_pre_save(void *opaque)
>  
>      /* At this point, backend must be stopped, otherwise
>       * it might keep writing to memory. */
> -    assert(!vsc->dev.started);
> +    assert(!vhost_dev_is_started(&vsc->dev));
>  
>      return 0;
>  }
> diff --git a/hw/scsi/vhost-user-scsi.c b/hw/scsi/vhost-user-scsi.c
> index 1b2f7eed98..bc37317d55 100644
> --- a/hw/scsi/vhost-user-scsi.c
> +++ b/hw/scsi/vhost-user-scsi.c
> @@ -49,7 +49,7 @@ static void vhost_user_scsi_set_status(VirtIODevice *vdev, uint8_t status)
>      VHostSCSICommon *vsc = VHOST_SCSI_COMMON(s);
>      bool start = (status & VIRTIO_CONFIG_S_DRIVER_OK) && vdev->vm_running;
>  
> -    if (vsc->dev.started == start) {
> +    if (vhost_dev_is_started(&vsc->dev) == start) {
>          return;
>      }
>  
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index d2bebba785..ad0f91c607 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -20,6 +20,7 @@
>  #include "hw/virtio/virtio-bus.h"
>  #include "hw/virtio/virtio-access.h"
>  #include "qemu/error-report.h"
> +#include "hw/virtio/vhost.h"
>  #include "hw/virtio/vhost-user-fs.h"
>  #include "monitor/monitor.h"
>  #include "sysemu/sysemu.h"
> @@ -124,7 +125,7 @@ static void vuf_set_status(VirtIODevice *vdev, uint8_t status)
>      VHostUserFS *fs = VHOST_USER_FS(vdev);
>      bool should_start = virtio_device_started(vdev, status);
>  
> -    if (fs->vhost_dev.started == should_start) {
> +    if (vhost_dev_is_started(&fs->vhost_dev) == should_start) {
>          return;
>      }
>  
> diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
> index b930cf6d5e..bc58b6c0d1 100644
> --- a/hw/virtio/vhost-user-i2c.c
> +++ b/hw/virtio/vhost-user-i2c.c
> @@ -95,7 +95,7 @@ static void vu_i2c_set_status(VirtIODevice *vdev, uint8_t status)
>      VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
>      bool should_start = virtio_device_started(vdev, status);
>  
> -    if (i2c->vhost_dev.started == should_start) {
> +    if (vhost_dev_is_started(&i2c->vhost_dev) == should_start) {
>          return;
>      }
>  
> @@ -174,7 +174,7 @@ static void vu_i2c_disconnect(DeviceState *dev)
>      }
>      i2c->connected = false;
>  
> -    if (i2c->vhost_dev.started) {
> +    if (vhost_dev_is_started(&i2c->vhost_dev)) {
>          vu_i2c_stop(vdev);
>      }
>  }
> diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
> index a9c1c4bc79..bc1f36c5ac 100644
> --- a/hw/virtio/vhost-user-rng.c
> +++ b/hw/virtio/vhost-user-rng.c
> @@ -92,7 +92,7 @@ static void vu_rng_set_status(VirtIODevice *vdev, uint8_t status)
>      VHostUserRNG *rng = VHOST_USER_RNG(vdev);
>      bool should_start = virtio_device_started(vdev, status);
>  
> -    if (rng->vhost_dev.started == should_start) {
> +    if (vhost_dev_is_started(&rng->vhost_dev) == should_start) {
>          return;
>      }
>  
> @@ -160,7 +160,7 @@ static void vu_rng_disconnect(DeviceState *dev)
>  
>      rng->connected = false;
>  
> -    if (rng->vhost_dev.started) {
> +    if (vhost_dev_is_started(&rng->vhost_dev)) {
>          vu_rng_stop(vdev);
>      }
>  }
> diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
> index 22c1616ebd..7b67e29d83 100644
> --- a/hw/virtio/vhost-user-vsock.c
> +++ b/hw/virtio/vhost-user-vsock.c
> @@ -57,7 +57,7 @@ static void vuv_set_status(VirtIODevice *vdev, uint8_t status)
>      VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
>      bool should_start = virtio_device_started(vdev, status);
>  
> -    if (vvc->vhost_dev.started == should_start) {
> +    if (vhost_dev_is_started(&vvc->vhost_dev) == should_start) {
>          return;
>      }
>  
> diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
> index 7394818e00..29b9ab4f72 100644
> --- a/hw/virtio/vhost-vsock-common.c
> +++ b/hw/virtio/vhost-vsock-common.c
> @@ -14,6 +14,7 @@
>  #include "hw/virtio/virtio-access.h"
>  #include "qemu/error-report.h"
>  #include "hw/qdev-properties.h"
> +#include "hw/virtio/vhost.h"
>  #include "hw/virtio/vhost-vsock.h"
>  #include "qemu/iov.h"
>  #include "monitor/monitor.h"
> @@ -199,7 +200,7 @@ int vhost_vsock_common_pre_save(void *opaque)
>       * At this point, backend must be stopped, otherwise
>       * it might keep writing to memory.
>       */
> -    assert(!vvc->vhost_dev.started);
> +    assert(!vhost_dev_is_started(&vvc->vhost_dev));
>  
>      return 0;
>  }
> diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
> index 8031c164a5..7dc3c73931 100644
> --- a/hw/virtio/vhost-vsock.c
> +++ b/hw/virtio/vhost-vsock.c
> @@ -73,7 +73,7 @@ static void vhost_vsock_set_status(VirtIODevice *vdev, uint8_t status)
>      bool should_start = virtio_device_started(vdev, status);
>      int ret;
>  
> -    if (vvc->vhost_dev.started == should_start) {
> +    if (vhost_dev_is_started(&vvc->vhost_dev) == should_start) {
>          return;
>      }
>  
> -- 
> 2.30.2


