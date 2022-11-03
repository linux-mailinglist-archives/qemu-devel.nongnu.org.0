Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3713A618AB2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 22:37:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqhsh-0000pn-Um; Thu, 03 Nov 2022 17:36:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqhsf-0000oG-7H
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 17:36:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqhsY-0008Ir-1q
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 17:36:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667511360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k6cQY3wPeGHGwuwbOc1SrICBNDRZS1aKP6in79NujAM=;
 b=Apo+/3/C2LFxjU5PoviVPTW7bgL4Qaj/WZS0AkT8Cm+Y/hZJBSKkWbamm7kkohFXsnzIkK
 HV55J2ByXstCxRNe+8fqnGdazcJg9FF1SEmbkDzE4ythFJxLps2CDgLjiTKh0Ov+UkvXx6
 nDtvrFQr+UdF3p0DXdTln9IZ/1cQzJU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-61-A4GVlmiRNTWUdf9CUvOQxA-1; Thu, 03 Nov 2022 17:35:59 -0400
X-MC-Unique: A4GVlmiRNTWUdf9CUvOQxA-1
Received: by mail-wm1-f71.google.com with SMTP id
 h8-20020a1c2108000000b003cf550bfc8dso3232814wmh.2
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 14:35:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k6cQY3wPeGHGwuwbOc1SrICBNDRZS1aKP6in79NujAM=;
 b=Z4fzM39OAtbwrdVtw90+gfR90PRuoqo4WJvMpWKb9NBnKj6VZ0Pe0MJyjdix5TJzet
 bKTK5QkM7eeR6Ury1PO9iXhGBMEGzpr7fG8yX2YVBtTIuFg2+sivdt41h1NvFDxSAx5C
 U5A61U48RBrtnC434g6bwPwYRccca0Fbr7FaDxNiw4wa0rcWQ8pqv21bwE9d5EcFTFme
 HZs0NxbaWyZKAKLqXkpt1XGL7W/y2ZwYfuwq50NMtwcEmelcZ226WkF1dwPnurD2CdBy
 wP/fH5EOSlf2XdDt1hxiHqwFcqBy19CjOAEVbUZFnSZu6kCPiFT/B1FVs4TILAqhfwtd
 /fPA==
X-Gm-Message-State: ACrzQf3bs1CdmqUnv51bzdsGG2XMCgY8UwoUZOSyZ2rXCUDUE95ByxFS
 tldERCM/on0+EPfsCgYl29BpZREXEWjN8vxCAlquNervv4RozjYdrcG+D7Rkabbo6vaR6Aj3fi0
 qy0HnR93cqOjsuCE=
X-Received: by 2002:adf:fcc3:0:b0:236:a9c2:ad20 with SMTP id
 f3-20020adffcc3000000b00236a9c2ad20mr20265921wrs.365.1667511357963; 
 Thu, 03 Nov 2022 14:35:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6KhEDzZZAbGhZojpaGQGzm6xrFnt4fq0kUIeLCemrrVQEwa6GA+Bz1l9MrRk3ND62E1Z8nSQ==
X-Received: by 2002:adf:fcc3:0:b0:236:a9c2:ad20 with SMTP id
 f3-20020adffcc3000000b00236a9c2ad20mr20265908wrs.365.1667511357715; 
 Thu, 03 Nov 2022 14:35:57 -0700 (PDT)
Received: from redhat.com ([2a03:c5c0:207f:d94c:f9b1:7ebe:4f98:3ca])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c4f9100b003c701c12a17sm1074873wmq.12.2022.11.03.14.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 14:35:57 -0700 (PDT)
Date: Thu, 3 Nov 2022 17:35:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, slp@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:virtiofs" <virtio-fs@redhat.com>
Subject: Re: [PATCH  v4 10/22] hw/virtio: move vm_running check to
 virtio_device_started
Message-ID: <20221103173542-mutt-send-email-mst@kernel.org>
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
 <20220802095010.3330793-11-alex.bennee@linaro.org>
 <20221103123856-mutt-send-email-mst@kernel.org>
 <87o7tnkfqy.fsf@linaro.org>
 <20221103162957-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221103162957-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Thu, Nov 03, 2022 at 04:30:48PM -0400, Michael S. Tsirkin wrote:
> On Thu, Nov 03, 2022 at 07:18:30PM +0000, Alex Bennée wrote:
> > 
> > "Michael S. Tsirkin" <mst@redhat.com> writes:
> > 
> > > On Tue, Aug 02, 2022 at 10:49:58AM +0100, Alex Bennée wrote:
> > >> All the boilerplate virtio code does the same thing (or should at
> > >> least) of checking to see if the VM is running before attempting to
> > >> start VirtIO. Push the logic up to the common function to avoid
> > >> getting a copy and paste wrong.
> > >> 
> > >> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> > >
> > > How bad is it if we drop this?
> > 
> > 
> > I assume it will break gpio. Why do we want to drop this now? It has
> > been merged awhile. However there was a follow-up patch which tweaked
> > the order of checks in virtio_device_started.
> 
> And that follow up patch trips up UBSAN:
> 
> https://gitlab.com/mitsirkin/qemu/-/pipelines/684763327
> 


And more specifically this

https://gitlab.com/mitsirkin/qemu/-/jobs/3269957848

> 
> 
> > >
> > >> ---
> > >>  include/hw/virtio/virtio.h   | 5 +++++
> > >>  hw/virtio/vhost-user-fs.c    | 6 +-----
> > >>  hw/virtio/vhost-user-i2c.c   | 6 +-----
> > >>  hw/virtio/vhost-user-rng.c   | 6 +-----
> > >>  hw/virtio/vhost-user-vsock.c | 6 +-----
> > >>  hw/virtio/vhost-vsock.c      | 6 +-----
> > >>  6 files changed, 10 insertions(+), 25 deletions(-)
> > >> 
> > >> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> > >> index 9bb2485415..74e7ad5a92 100644
> > >> --- a/include/hw/virtio/virtio.h
> > >> +++ b/include/hw/virtio/virtio.h
> > >> @@ -100,6 +100,7 @@ struct VirtIODevice
> > >>      VirtQueue *vq;
> > >>      MemoryListener listener;
> > >>      uint16_t device_id;
> > >> +    /* @vm_running: current VM running state via virtio_vmstate_change() */
> > >>      bool vm_running;
> > >>      bool broken; /* device in invalid state, needs reset */
> > >>      bool use_disabled_flag; /* allow use of 'disable' flag when needed */
> > >> @@ -376,6 +377,10 @@ static inline bool virtio_device_started(VirtIODevice *vdev, uint8_t status)
> > >>          return vdev->started;
> > >>      }
> > >>  
> > >> +    if (!vdev->vm_running) {
> > >> +        return false;
> > >> +    }
> > >> +
> > >>      return status & VIRTIO_CONFIG_S_DRIVER_OK;
> > >>  }
> > >>  
> > >> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> > >> index e513e4fdda..d2bebba785 100644
> > >> --- a/hw/virtio/vhost-user-fs.c
> > >> +++ b/hw/virtio/vhost-user-fs.c
> > >> @@ -122,11 +122,7 @@ static void vuf_stop(VirtIODevice *vdev)
> > >>  static void vuf_set_status(VirtIODevice *vdev, uint8_t status)
> > >>  {
> > >>      VHostUserFS *fs = VHOST_USER_FS(vdev);
> > >> -    bool should_start = status & VIRTIO_CONFIG_S_DRIVER_OK;
> > >> -
> > >> -    if (!vdev->vm_running) {
> > >> -        should_start = false;
> > >> -    }
> > >> +    bool should_start = virtio_device_started(vdev, status);
> > >>  
> > >>      if (fs->vhost_dev.started == should_start) {
> > >>          return;
> > >> diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
> > >> index 6020eee093..b930cf6d5e 100644
> > >> --- a/hw/virtio/vhost-user-i2c.c
> > >> +++ b/hw/virtio/vhost-user-i2c.c
> > >> @@ -93,11 +93,7 @@ static void vu_i2c_stop(VirtIODevice *vdev)
> > >>  static void vu_i2c_set_status(VirtIODevice *vdev, uint8_t status)
> > >>  {
> > >>      VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
> > >> -    bool should_start = status & VIRTIO_CONFIG_S_DRIVER_OK;
> > >> -
> > >> -    if (!vdev->vm_running) {
> > >> -        should_start = false;
> > >> -    }
> > >> +    bool should_start = virtio_device_started(vdev, status);
> > >>  
> > >>      if (i2c->vhost_dev.started == should_start) {
> > >>          return;
> > >> diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
> > >> index 3a7bf8e32d..a9c1c4bc79 100644
> > >> --- a/hw/virtio/vhost-user-rng.c
> > >> +++ b/hw/virtio/vhost-user-rng.c
> > >> @@ -90,11 +90,7 @@ static void vu_rng_stop(VirtIODevice *vdev)
> > >>  static void vu_rng_set_status(VirtIODevice *vdev, uint8_t status)
> > >>  {
> > >>      VHostUserRNG *rng = VHOST_USER_RNG(vdev);
> > >> -    bool should_start = status & VIRTIO_CONFIG_S_DRIVER_OK;
> > >> -
> > >> -    if (!vdev->vm_running) {
> > >> -        should_start = false;
> > >> -    }
> > >> +    bool should_start = virtio_device_started(vdev, status);
> > >>  
> > >>      if (rng->vhost_dev.started == should_start) {
> > >>          return;
> > >> diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
> > >> index 0f8ff99f85..22c1616ebd 100644
> > >> --- a/hw/virtio/vhost-user-vsock.c
> > >> +++ b/hw/virtio/vhost-user-vsock.c
> > >> @@ -55,11 +55,7 @@ const VhostDevConfigOps vsock_ops = {
> > >>  static void vuv_set_status(VirtIODevice *vdev, uint8_t status)
> > >>  {
> > >>      VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
> > >> -    bool should_start = status & VIRTIO_CONFIG_S_DRIVER_OK;
> > >> -
> > >> -    if (!vdev->vm_running) {
> > >> -        should_start = false;
> > >> -    }
> > >> +    bool should_start = virtio_device_started(vdev, status);
> > >>  
> > >>      if (vvc->vhost_dev.started == should_start) {
> > >>          return;
> > >> diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
> > >> index 0338de892f..8031c164a5 100644
> > >> --- a/hw/virtio/vhost-vsock.c
> > >> +++ b/hw/virtio/vhost-vsock.c
> > >> @@ -70,13 +70,9 @@ static int vhost_vsock_set_running(VirtIODevice *vdev, int start)
> > >>  static void vhost_vsock_set_status(VirtIODevice *vdev, uint8_t status)
> > >>  {
> > >>      VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
> > >> -    bool should_start = status & VIRTIO_CONFIG_S_DRIVER_OK;
> > >> +    bool should_start = virtio_device_started(vdev, status);
> > >>      int ret;
> > >>  
> > >> -    if (!vdev->vm_running) {
> > >> -        should_start = false;
> > >> -    }
> > >> -
> > >>      if (vvc->vhost_dev.started == should_start) {
> > >>          return;
> > >>      }
> > >> -- 
> > >> 2.30.2
> > 
> > 
> > -- 
> > Alex Bennée


