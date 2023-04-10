Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B09816DC8A3
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 17:40:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pltcp-00044Y-Er; Mon, 10 Apr 2023 11:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1pltch-00041o-1f; Mon, 10 Apr 2023 11:40:08 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1pltce-0001ny-NO; Mon, 10 Apr 2023 11:40:02 -0400
Received: from mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:7f29:0:640:9a2b:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 7FEFE600C7;
 Mon, 10 Apr 2023 18:39:47 +0300 (MSK)
Received: from [IPV6:2a02:6b8:83:11:14df:f716:b8ed:439d] (unknown
 [2a02:6b8:83:11:14df:f716:b8ed:439d])
 by mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id VdWFrr0OcW20-Jnn3RuaA; Mon, 10 Apr 2023 18:39:46 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.com;
 s=default; 
 t=1681141186; bh=3OCwzW6XOm3K9lJaXxUxJBXZPopaPJWt2tW9UwkVWc4=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=Cc9D1+dHxj/BVFMRvsTsijL54Ggv9d//IjguzPmmEKpPcao0d6j7fBsVxcOtp38gF
 tds8+y/t/QIXVTDZBUOEj11AuXKcGbZlCEEde8g9n0LeCvhpYuOPByplodxkLisXEO
 VWoM/9U3egyeu3IajnjfiMC1/FzBk6MigJJgse48=
Authentication-Results: mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.com
Message-ID: <fcc6073f-280b-580e-b6f7-bc176a64e810@yandex-team.com>
Date: Mon, 10 Apr 2023 17:39:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] block/vhost-user-blk: Fix hang on boot for some odd guests
To: Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: Yongji Xie <xieyongji@baidu.com>, Chai Wen <chaiwen@baidu.com>,
 Ni Xun <nixun@baidu.com>, d-tatianin@yandex-team.com,
 yc-core@yandex-team.com, vsementsov@yandex-team.com
References: <20230410083509.3311-1-arbn@yandex-team.com>
Content-Language: en-US
From: Andrey Ryabinin <arbn@yandex-team.com>
In-Reply-To: <20230410083509.3311-1-arbn@yandex-team.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=arbn@yandex-team.com; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.246,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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



On 4/10/23 10:35, Andrey Ryabinin wrote:
> Some guests hang on boot when using the vhost-user-blk-pci device,
> but boot normally when using the virtio-blk device. The problem occurs
> because the guest advertises VIRTIO_F_VERSION_1 but kicks the virtqueue
> before setting VIRTIO_CONFIG_S_DRIVER_OK, causing vdev->start_on_kick to
> be false in vhost_user_blk_handle_output() and preventing the device from
> starting.
> 
> Fix this by removing the check for vdev->start_on_kick to ensure
> that the device starts after the kick. This aligns the behavior of
> 'vhost-user-blk-pci' device with 'virtio-blk' as it does the similar
> thing in its virtio_blk_handle_output() function.
> 
> Fixes: 110b9463d5c8 ("vhost-user-blk: start vhost when guest kicks")
> Signed-off-by: Andrey Ryabinin <arbn@yandex-team.com>
> ---
>  hw/block/vhost-user-blk.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index aff4d2b8cbd..448ead448f3 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -279,10 +279,6 @@ static void vhost_user_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
>      Error *local_err = NULL;
>      int i, ret;
>  
> -    if (!vdev->start_on_kick) {
> -        return;
> -    }
> -
>      if (!s->connected) {
>          return;
>      }


After looking a bit closer to this ->start_on_kick thing ( commit badaf79cfdbd ("virtio: Introduce started flag to VirtioDevice")
and follow ups) I'm starting to think that removing it entirely would be the right thing to do here.
The whole reason for it was to add special case for !VIRTIO_F_VERSION_1 guests.
If we making start on kick thing for misbehaving VIRTIO_F_VERSION_1 guests too, than the flag is no longer required,
so we can do following:

---
 hw/block/vhost-user-blk.c  |  4 ----
 hw/virtio/virtio-qmp.c     |  2 +-
 hw/virtio/virtio.c         | 21 ++-------------------
 include/hw/virtio/virtio.h |  5 -----
 4 files changed, 3 insertions(+), 29 deletions(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index aff4d2b8cbd..448ead448f3 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -279,10 +279,6 @@ static void vhost_user_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
     Error *local_err = NULL;
     int i, ret;
 
-    if (!vdev->start_on_kick) {
-        return;
-    }
-
     if (!s->connected) {
         return;
     }
diff --git a/hw/virtio/virtio-qmp.c b/hw/virtio/virtio-qmp.c
index e4d4bece2d7..4865819cd2f 100644
--- a/hw/virtio/virtio-qmp.c
+++ b/hw/virtio/virtio-qmp.c
@@ -773,7 +773,7 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
     status->disabled = vdev->disabled;
     status->use_started = vdev->use_started;
     status->started = vdev->started;
-    status->start_on_kick = vdev->start_on_kick;
+    status->start_on_kick = true;
     status->disable_legacy_check = vdev->disable_legacy_check;
     status->bus_name = g_strdup(vdev->bus_name);
     status->use_guest_notifier_mask = vdev->use_guest_notifier_mask;
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index f35178f5fcd..218584eae85 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2126,7 +2126,6 @@ void virtio_reset(void *opaque)
         k->reset(vdev);
     }
 
-    vdev->start_on_kick = false;
     vdev->started = false;
     vdev->broken = false;
     vdev->guest_features = 0;
@@ -2248,9 +2247,7 @@ static void virtio_queue_notify_vq(VirtQueue *vq)
         trace_virtio_queue_notify(vdev, vq - vdev->vq, vq);
         vq->handle_output(vdev, vq);
 
-        if (unlikely(vdev->start_on_kick)) {
-            virtio_set_started(vdev, true);
-        }
+        virtio_set_started(vdev, true);
     }
 }
 
@@ -2268,9 +2265,7 @@ void virtio_queue_notify(VirtIODevice *vdev, int n)
     } else if (vq->handle_output) {
         vq->handle_output(vdev, vq);
 
-        if (unlikely(vdev->start_on_kick)) {
-            virtio_set_started(vdev, true);
-        }
+        virtio_set_started(vdev, true);
     }
 }
 
@@ -2881,12 +2876,6 @@ int virtio_set_features(VirtIODevice *vdev, uint64_t val)
             }
         }
     }
-    if (!ret) {
-        if (!virtio_device_started(vdev, vdev->status) &&
-            !virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
-            vdev->start_on_kick = true;
-        }
-    }
     return ret;
 }
 
@@ -3039,11 +3028,6 @@ int virtio_load(VirtIODevice *vdev, QEMUFile *f, int version_id)
         }
     }
 
-    if (!virtio_device_started(vdev, vdev->status) &&
-        !virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
-        vdev->start_on_kick = true;
-    }
-
     RCU_READ_LOCK_GUARD();
     for (i = 0; i < num; i++) {
         if (vdev->vq[i].vring.desc) {
@@ -3162,7 +3146,6 @@ void virtio_init(VirtIODevice *vdev, uint16_t device_id, size_t config_size)
             g_malloc0(sizeof(*vdev->vector_queues) * nvectors);
     }
 
-    vdev->start_on_kick = false;
     vdev->started = false;
     vdev->vhost_started = false;
     vdev->device_id = device_id;
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 77c6c55929f..5742876b4fa 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -144,7 +144,6 @@ struct VirtIODevice
      */
     bool use_started;
     bool started;
-    bool start_on_kick; /* when virtio 1.0 feature has not been negotiated */
     bool disable_legacy_check;
     bool vhost_started;
     VMChangeStateEntry *vmstate;
@@ -460,10 +459,6 @@ static inline bool virtio_device_should_start(VirtIODevice *vdev, uint8_t status
 
 static inline void virtio_set_started(VirtIODevice *vdev, bool started)
 {
-    if (started) {
-        vdev->start_on_kick = false;
-    }
-
     if (vdev->use_started) {
         vdev->started = started;
     }
-- 
2.39.2


