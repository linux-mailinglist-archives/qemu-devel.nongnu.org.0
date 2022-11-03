Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE42618995
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 21:32:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqgrk-0006Jn-OM; Thu, 03 Nov 2022 16:31:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqgrZ-0006I7-J1
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 16:30:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqgrW-0006NA-3W
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 16:30:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667507450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2GgwpexnHz5zf9KPXCfGh8CbqS+1Ex65u37VYLoUUAs=;
 b=fmR8XS9RPz/Js+9LevBouPyejI+OYvt2puhbaQnwgKdFuugmzX2FR7ubr84Cngrx1u+WMP
 1idQtG9p3xjiXwjkgAxUNP0B1Mq/7SOBcjOFEumwCqB4WyLxL6B0CS4IAQI/Cv8cgJA1hW
 CCVkKUbCQ/oknphi5cHnoBD3eLINvWs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-413-V1DfAnduOMKpdA1YugASXA-1; Thu, 03 Nov 2022 16:30:49 -0400
X-MC-Unique: V1DfAnduOMKpdA1YugASXA-1
Received: by mail-wm1-f69.google.com with SMTP id
 h8-20020a1c2108000000b003cf550bfc8dso3162478wmh.2
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 13:30:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2GgwpexnHz5zf9KPXCfGh8CbqS+1Ex65u37VYLoUUAs=;
 b=aObSmhQoSPyq2oh/8D2Aa/948EnNGcWVIz9umXWkfmXr50hs0+hr4aHK3+giePTW1I
 6CI4VtZbBXLRMKcN8kwT4KNw4NVSUXj3d9V5VMMKrOQBOeHA190oXAAIvaVjr2Jrj6bY
 lRFX8zpQxqScfdqsPUWqMNm1Q42QQtzQrjL85uyfC4mZQINM3GGMMYpixBeAZVWl/mYO
 xp0hXz1utM7511rTk/rJSAowvqB9L38E5NYN4oB4XoBMpnP3qyTuG720MuHtUIB3jnuH
 +85KK9cb4+DTS/DbcdTOQ8Sn6QIvMYE10DW5VCX+Fh76+49/2Pipedd8o7rTUN962K8A
 BL+Q==
X-Gm-Message-State: ACrzQf1XL7bBaUrMBbIwyD44XJOoSBewBBCn0VJ0YwKKYdefbaZbn3es
 ZL8iy7ub2Szw44oN9eHmBxzXyiWfKqYXZauXoTMY4c3web53z7PwaInR3I9w6r8qLZ7q6q1Q/D+
 UTvsXaZPFObyik84=
X-Received: by 2002:adf:d089:0:b0:236:558b:abc8 with SMTP id
 y9-20020adfd089000000b00236558babc8mr19896682wrh.231.1667507448374; 
 Thu, 03 Nov 2022 13:30:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM71g0lTNUcqh8AdKbvbGx3l8qPxp0ezeiWsSv3l5YJ9+0HorLvNdXN/YBccrUZKB8VzS3168Q==
X-Received: by 2002:adf:d089:0:b0:236:558b:abc8 with SMTP id
 y9-20020adfd089000000b00236558babc8mr19896667wrh.231.1667507448125; 
 Thu, 03 Nov 2022 13:30:48 -0700 (PDT)
Received: from redhat.com ([2.55.15.188]) by smtp.gmail.com with ESMTPSA id
 j7-20020a05600c190700b003b477532e66sm9366404wmq.2.2022.11.03.13.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 13:30:44 -0700 (PDT)
Date: Thu, 3 Nov 2022 16:30:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, slp@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:virtiofs" <virtio-fs@redhat.com>
Subject: Re: [PATCH  v4 10/22] hw/virtio: move vm_running check to
 virtio_device_started
Message-ID: <20221103162957-mutt-send-email-mst@kernel.org>
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
 <20220802095010.3330793-11-alex.bennee@linaro.org>
 <20221103123856-mutt-send-email-mst@kernel.org>
 <87o7tnkfqy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87o7tnkfqy.fsf@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Thu, Nov 03, 2022 at 07:18:30PM +0000, Alex Bennée wrote:
> 
> "Michael S. Tsirkin" <mst@redhat.com> writes:
> 
> > On Tue, Aug 02, 2022 at 10:49:58AM +0100, Alex Bennée wrote:
> >> All the boilerplate virtio code does the same thing (or should at
> >> least) of checking to see if the VM is running before attempting to
> >> start VirtIO. Push the logic up to the common function to avoid
> >> getting a copy and paste wrong.
> >> 
> >> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> >
> > How bad is it if we drop this?
> 
> 
> I assume it will break gpio. Why do we want to drop this now? It has
> been merged awhile. However there was a follow-up patch which tweaked
> the order of checks in virtio_device_started.

And that follow up patch trips up UBSAN:

https://gitlab.com/mitsirkin/qemu/-/pipelines/684763327




> >
> >> ---
> >>  include/hw/virtio/virtio.h   | 5 +++++
> >>  hw/virtio/vhost-user-fs.c    | 6 +-----
> >>  hw/virtio/vhost-user-i2c.c   | 6 +-----
> >>  hw/virtio/vhost-user-rng.c   | 6 +-----
> >>  hw/virtio/vhost-user-vsock.c | 6 +-----
> >>  hw/virtio/vhost-vsock.c      | 6 +-----
> >>  6 files changed, 10 insertions(+), 25 deletions(-)
> >> 
> >> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> >> index 9bb2485415..74e7ad5a92 100644
> >> --- a/include/hw/virtio/virtio.h
> >> +++ b/include/hw/virtio/virtio.h
> >> @@ -100,6 +100,7 @@ struct VirtIODevice
> >>      VirtQueue *vq;
> >>      MemoryListener listener;
> >>      uint16_t device_id;
> >> +    /* @vm_running: current VM running state via virtio_vmstate_change() */
> >>      bool vm_running;
> >>      bool broken; /* device in invalid state, needs reset */
> >>      bool use_disabled_flag; /* allow use of 'disable' flag when needed */
> >> @@ -376,6 +377,10 @@ static inline bool virtio_device_started(VirtIODevice *vdev, uint8_t status)
> >>          return vdev->started;
> >>      }
> >>  
> >> +    if (!vdev->vm_running) {
> >> +        return false;
> >> +    }
> >> +
> >>      return status & VIRTIO_CONFIG_S_DRIVER_OK;
> >>  }
> >>  
> >> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> >> index e513e4fdda..d2bebba785 100644
> >> --- a/hw/virtio/vhost-user-fs.c
> >> +++ b/hw/virtio/vhost-user-fs.c
> >> @@ -122,11 +122,7 @@ static void vuf_stop(VirtIODevice *vdev)
> >>  static void vuf_set_status(VirtIODevice *vdev, uint8_t status)
> >>  {
> >>      VHostUserFS *fs = VHOST_USER_FS(vdev);
> >> -    bool should_start = status & VIRTIO_CONFIG_S_DRIVER_OK;
> >> -
> >> -    if (!vdev->vm_running) {
> >> -        should_start = false;
> >> -    }
> >> +    bool should_start = virtio_device_started(vdev, status);
> >>  
> >>      if (fs->vhost_dev.started == should_start) {
> >>          return;
> >> diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
> >> index 6020eee093..b930cf6d5e 100644
> >> --- a/hw/virtio/vhost-user-i2c.c
> >> +++ b/hw/virtio/vhost-user-i2c.c
> >> @@ -93,11 +93,7 @@ static void vu_i2c_stop(VirtIODevice *vdev)
> >>  static void vu_i2c_set_status(VirtIODevice *vdev, uint8_t status)
> >>  {
> >>      VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
> >> -    bool should_start = status & VIRTIO_CONFIG_S_DRIVER_OK;
> >> -
> >> -    if (!vdev->vm_running) {
> >> -        should_start = false;
> >> -    }
> >> +    bool should_start = virtio_device_started(vdev, status);
> >>  
> >>      if (i2c->vhost_dev.started == should_start) {
> >>          return;
> >> diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
> >> index 3a7bf8e32d..a9c1c4bc79 100644
> >> --- a/hw/virtio/vhost-user-rng.c
> >> +++ b/hw/virtio/vhost-user-rng.c
> >> @@ -90,11 +90,7 @@ static void vu_rng_stop(VirtIODevice *vdev)
> >>  static void vu_rng_set_status(VirtIODevice *vdev, uint8_t status)
> >>  {
> >>      VHostUserRNG *rng = VHOST_USER_RNG(vdev);
> >> -    bool should_start = status & VIRTIO_CONFIG_S_DRIVER_OK;
> >> -
> >> -    if (!vdev->vm_running) {
> >> -        should_start = false;
> >> -    }
> >> +    bool should_start = virtio_device_started(vdev, status);
> >>  
> >>      if (rng->vhost_dev.started == should_start) {
> >>          return;
> >> diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
> >> index 0f8ff99f85..22c1616ebd 100644
> >> --- a/hw/virtio/vhost-user-vsock.c
> >> +++ b/hw/virtio/vhost-user-vsock.c
> >> @@ -55,11 +55,7 @@ const VhostDevConfigOps vsock_ops = {
> >>  static void vuv_set_status(VirtIODevice *vdev, uint8_t status)
> >>  {
> >>      VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
> >> -    bool should_start = status & VIRTIO_CONFIG_S_DRIVER_OK;
> >> -
> >> -    if (!vdev->vm_running) {
> >> -        should_start = false;
> >> -    }
> >> +    bool should_start = virtio_device_started(vdev, status);
> >>  
> >>      if (vvc->vhost_dev.started == should_start) {
> >>          return;
> >> diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
> >> index 0338de892f..8031c164a5 100644
> >> --- a/hw/virtio/vhost-vsock.c
> >> +++ b/hw/virtio/vhost-vsock.c
> >> @@ -70,13 +70,9 @@ static int vhost_vsock_set_running(VirtIODevice *vdev, int start)
> >>  static void vhost_vsock_set_status(VirtIODevice *vdev, uint8_t status)
> >>  {
> >>      VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
> >> -    bool should_start = status & VIRTIO_CONFIG_S_DRIVER_OK;
> >> +    bool should_start = virtio_device_started(vdev, status);
> >>      int ret;
> >>  
> >> -    if (!vdev->vm_running) {
> >> -        should_start = false;
> >> -    }
> >> -
> >>      if (vvc->vhost_dev.started == should_start) {
> >>          return;
> >>      }
> >> -- 
> >> 2.30.2
> 
> 
> -- 
> Alex Bennée


