Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DCD61DC22
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 17:46:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMJB-0006jf-Dz; Sat, 05 Nov 2022 12:46:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMJ8-0006ee-NX
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 12:46:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMJ7-0003I2-2N
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 12:46:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667666768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gkoNaw3s3sQYRjoCwLnnEJf4S2B4oPx/fVflBdJ7+N8=;
 b=XHeZWuGSdnBa7cXktwCzd6yoPmc6Cob/+QLcE91bsNfCMSBgv9gTebrfY40daZp+aBFHki
 HFJ0ayG9nl2/e55pAovgr9vB455ZgaTle5aUZQS+UWlQ3d1ObXTCW0LQoJ76iZpHsQDv52
 BrrcRAP3ME2PkzflCdZjQlNQjdIK/Tg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-495-95-ei6apP2ikuSAxZxdZIQ-1; Sat, 05 Nov 2022 12:46:07 -0400
X-MC-Unique: 95-ei6apP2ikuSAxZxdZIQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay19-20020a05600c1e1300b003cf758f1617so5204433wmb.5
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 09:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gkoNaw3s3sQYRjoCwLnnEJf4S2B4oPx/fVflBdJ7+N8=;
 b=hhZzTt4R3ZRYhCCiykHnBhum0+Kpt2YlLlFGrDjzQaQpt9P1HKkMMxru0PuKxhVoTS
 6wJB/5MYYK5wUDN5cIzQM6ULIa/jTT7pwjCt4Idf4sjpO0MGXa0hDIjSpuOCcrTWc99S
 /qFQrqE3Qu33ddmmU0Q1xAWK2u7RZ3V4d7FYpH2ugCLZo2D47Q/j2lwTwHTrwt/eqXPk
 x6OG60RT1F/VCXr+R13vRohsZpU1QDd9IlFCmB4NvqDnH3Q0tianSZ5wYE+dRRs2wczt
 d91yvX2qSztMI9WJnXWNp1+qlAZM5hwyk3R+13VDsMxGKorZHJPgehGcw3aKqb1YTVdi
 DRmQ==
X-Gm-Message-State: ACrzQf0fBhPkZdFCCmOfsoZyucWDCmw4moWXLLIVif2y9XvKr/jlPZp7
 aC9kFSsXssU6gfqiswGrWp0mL4aphrtUDNbckYkMrq62vqyjQKEgaBZ86XQIGpPBWk2s1mEKbDT
 MayKXg72IEj3w1HgnSNxGwqealjb7c2sti6du+/Ok8ELZbl2S6+fuxp/LQLf1
X-Received: by 2002:a7b:cb49:0:b0:3b4:b08a:89b with SMTP id
 v9-20020a7bcb49000000b003b4b08a089bmr27243461wmj.173.1667666765502; 
 Sat, 05 Nov 2022 09:46:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4mHCRl1epRAzCMXrFf31IEEgKnz3t6+4/dkA/hefE8Qzn7kxd2fsuTPoUk6d0I57a84jsC8A==
X-Received: by 2002:a7b:cb49:0:b0:3b4:b08a:89b with SMTP id
 v9-20020a7bcb49000000b003b4b08a089bmr27243442wmj.173.1667666765214; 
 Sat, 05 Nov 2022 09:46:05 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 k28-20020a5d525c000000b0022e653f5abbsm2498529wrc.69.2022.11.05.09.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 09:46:04 -0700 (PDT)
Date: Sat, 5 Nov 2022 12:45:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, virtio-fs@redhat.com,
 Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PULL 07/55] hw/virtio: move vm_running check to
 virtio_device_started
Message-ID: <20221105093645-mutt-send-email-mst@kernel.org>
References: <20221010172813.204597-1-mst@redhat.com>
 <20221010172813.204597-8-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221010172813.204597-8-mst@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 10, 2022 at 01:29:10PM -0400, Michael S. Tsirkin wrote:
> From: Alex Bennée <alex.bennee@linaro.org>
> 
> All the boilerplate virtio code does the same thing (or should at
> least) of checking to see if the VM is running before attempting to
> start VirtIO. Push the logic up to the common function to avoid
> getting a copy and paste wrong.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20220802095010.3330793-11-alex.bennee@linaro.org>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

So, looking at the resulting code, I missed the fact that this function
is also used in virtio core.  So this patch does not do what it's saying
it does (just refactor code).
Instead it completely changes the meaning for virtio core.
I thunk we should revert upstream, however, gpio has grown a
dependency on this since then.
Alex, could you take a look please?

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
> MST
> 


