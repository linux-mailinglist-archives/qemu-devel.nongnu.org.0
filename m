Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D52423F86
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 15:39:11 +0200 (CEST)
Received: from localhost ([::1]:53590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY78Y-0006oJ-AJ
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 09:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1mY77V-000687-Gf
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 09:38:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1mY77S-0005vs-SP
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 09:38:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633527481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q0iyJ4mr5YLuMO/XrupJJanajWpbtWCUHYBTcXdU/K0=;
 b=VpiXl567auMJFTrQ4YyJMKaM4Ao3B3y1AaL2IwZSnnNcue5XJHzFMVHVlAwqrCTQqi+20O
 mw6t9OS7RuKMrmDyOXxcodQaJFkQBGwaUjZchcn0UhdanUOM0dYeTMhIalhvZOaVNRUJhL
 2CEG5iXIIYSJMfcqIloO0ZOqrBTQUf0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-BZc3A8gGP9y4o_h-Ksf0Tw-1; Wed, 06 Oct 2021 09:38:00 -0400
X-MC-Unique: BZc3A8gGP9y4o_h-Ksf0Tw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16A6E1023F4F;
 Wed,  6 Oct 2021 13:37:59 +0000 (UTC)
Received: from titinator (unknown [10.39.194.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 83B069AA22;
 Wed,  6 Oct 2021 13:37:51 +0000 (UTC)
References: <20210930153037.1194279-1-vgoyal@redhat.com>
 <20210930153037.1194279-7-vgoyal@redhat.com>
User-agent: mu4e 1.5.13; emacs 27.2
From: Christophe de Dinechin <dinechin@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [Virtio-fs] [PATCH 06/13] vhost-user-fs: Use helpers to
 create/cleanup virtqueue
Date: Wed, 06 Oct 2021 15:35:30 +0200
In-reply-to: <20210930153037.1194279-7-vgoyal@redhat.com>
Message-ID: <lywnmqi89e.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dinechin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dinechin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 miklos@szeredi.hu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021-09-30 at 11:30 -04, Vivek Goyal <vgoyal@redhat.com> wrote...
> Add helpers to create/cleanup virtuqueues and use those helpers. I will

Typo, virtuqueues -> virtqueues

Also, while I'm nitpicking, virtqueue could be plural in commit description ;-)

> need to reconfigure queues in later patches and using helpers will allow
> reusing the code.
>
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  hw/virtio/vhost-user-fs.c | 87 +++++++++++++++++++++++----------------
>  1 file changed, 52 insertions(+), 35 deletions(-)
>
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index c595957983..d1efbc5b18 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -139,6 +139,55 @@ static void vuf_set_status(VirtIODevice *vdev, uint8_t status)
>      }
>  }
>
> +static void vuf_handle_output(VirtIODevice *vdev, VirtQueue *vq)
> +{
> +    /*
> +     * Not normally called; it's the daemon that handles the queue;
> +     * however virtio's cleanup path can call this.
> +     */
> +}
> +
> +static void vuf_create_vqs(VirtIODevice *vdev)
> +{
> +    VHostUserFS *fs = VHOST_USER_FS(vdev);
> +    unsigned int i;
> +
> +    /* Hiprio queue */
> +    fs->hiprio_vq = virtio_add_queue(vdev, fs->conf.queue_size,
> +                                     vuf_handle_output);
> +
> +    /* Request queues */
> +    fs->req_vqs = g_new(VirtQueue *, fs->conf.num_request_queues);
> +    for (i = 0; i < fs->conf.num_request_queues; i++) {
> +        fs->req_vqs[i] = virtio_add_queue(vdev, fs->conf.queue_size,
> +                                          vuf_handle_output);
> +    }
> +
> +    /* 1 high prio queue, plus the number configured */
> +    fs->vhost_dev.nvqs = 1 + fs->conf.num_request_queues;
> +    fs->vhost_dev.vqs = g_new0(struct vhost_virtqueue, fs->vhost_dev.nvqs);
> +}
> +
> +static void vuf_cleanup_vqs(VirtIODevice *vdev)
> +{
> +    VHostUserFS *fs = VHOST_USER_FS(vdev);
> +    unsigned int i;
> +
> +    virtio_delete_queue(fs->hiprio_vq);
> +    fs->hiprio_vq = NULL;
> +
> +    for (i = 0; i < fs->conf.num_request_queues; i++) {
> +        virtio_delete_queue(fs->req_vqs[i]);
> +    }
> +
> +    g_free(fs->req_vqs);
> +    fs->req_vqs = NULL;
> +
> +    fs->vhost_dev.nvqs = 0;
> +    g_free(fs->vhost_dev.vqs);
> +    fs->vhost_dev.vqs = NULL;
> +}
> +
>  static uint64_t vuf_get_features(VirtIODevice *vdev,
>                                   uint64_t features,
>                                   Error **errp)
> @@ -148,14 +197,6 @@ static uint64_t vuf_get_features(VirtIODevice *vdev,
>      return vhost_get_features(&fs->vhost_dev, user_feature_bits, features);
>  }
>
> -static void vuf_handle_output(VirtIODevice *vdev, VirtQueue *vq)
> -{
> -    /*
> -     * Not normally called; it's the daemon that handles the queue;
> -     * however virtio's cleanup path can call this.
> -     */
> -}
> -
>  static void vuf_guest_notifier_mask(VirtIODevice *vdev, int idx,
>                                              bool mask)
>  {
> @@ -175,7 +216,6 @@ static void vuf_device_realize(DeviceState *dev, Error **errp)
>  {
>      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>      VHostUserFS *fs = VHOST_USER_FS(dev);
> -    unsigned int i;
>      size_t len;
>      int ret;
>
> @@ -222,18 +262,7 @@ static void vuf_device_realize(DeviceState *dev, Error **errp)
>      virtio_init(vdev, "vhost-user-fs", VIRTIO_ID_FS,
>                  sizeof(struct virtio_fs_config));
>
> -    /* Hiprio queue */
> -    fs->hiprio_vq = virtio_add_queue(vdev, fs->conf.queue_size, vuf_handle_output);
> -
> -    /* Request queues */
> -    fs->req_vqs = g_new(VirtQueue *, fs->conf.num_request_queues);
> -    for (i = 0; i < fs->conf.num_request_queues; i++) {
> -        fs->req_vqs[i] = virtio_add_queue(vdev, fs->conf.queue_size, vuf_handle_output);
> -    }
> -
> -    /* 1 high prio queue, plus the number configured */
> -    fs->vhost_dev.nvqs = 1 + fs->conf.num_request_queues;
> -    fs->vhost_dev.vqs = g_new0(struct vhost_virtqueue, fs->vhost_dev.nvqs);
> +    vuf_create_vqs(vdev);
>      ret = vhost_dev_init(&fs->vhost_dev, &fs->vhost_user,
>                           VHOST_BACKEND_TYPE_USER, 0, errp);
>      if (ret < 0) {
> @@ -244,13 +273,8 @@ static void vuf_device_realize(DeviceState *dev, Error **errp)
>
>  err_virtio:
>      vhost_user_cleanup(&fs->vhost_user);
> -    virtio_delete_queue(fs->hiprio_vq);
> -    for (i = 0; i < fs->conf.num_request_queues; i++) {
> -        virtio_delete_queue(fs->req_vqs[i]);
> -    }
> -    g_free(fs->req_vqs);
> +    vuf_cleanup_vqs(vdev);
>      virtio_cleanup(vdev);
> -    g_free(fs->vhost_dev.vqs);
>      return;
>  }
>
> @@ -258,7 +282,6 @@ static void vuf_device_unrealize(DeviceState *dev)
>  {
>      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>      VHostUserFS *fs = VHOST_USER_FS(dev);
> -    int i;
>
>      /* This will stop vhost backend if appropriate. */
>      vuf_set_status(vdev, 0);
> @@ -267,14 +290,8 @@ static void vuf_device_unrealize(DeviceState *dev)
>
>      vhost_user_cleanup(&fs->vhost_user);
>
> -    virtio_delete_queue(fs->hiprio_vq);
> -    for (i = 0; i < fs->conf.num_request_queues; i++) {
> -        virtio_delete_queue(fs->req_vqs[i]);
> -    }
> -    g_free(fs->req_vqs);
> +    vuf_cleanup_vqs(vdev);
>      virtio_cleanup(vdev);
> -    g_free(fs->vhost_dev.vqs);
> -    fs->vhost_dev.vqs = NULL;
>  }
>
>  static const VMStateDescription vuf_vmstate = {


--
Cheers,
Christophe de Dinechin (IRC c3d)


