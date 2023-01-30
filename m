Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1EE6819FB
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 20:11:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMZXw-0008Vs-PL; Mon, 30 Jan 2023 14:10:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMZXm-0008VP-7V
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 14:10:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMZXc-0003Kc-9p
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 14:10:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675105805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DRtyDnrFbOsBzhyGPdqKiemvG8LsXFfe4j2UkmizAsc=;
 b=akIbntbxm00xcz6VZ97T2TQaJ4zu0iAqqi2e8fYasY5ksKKkE3t5Iu3KHMorlj01mfqRne
 5RHXyUHJ2Yt46jmqzAlUS1E3NvikOREHu/UtYv1wIuqXOOQQ04TUEnBlAR2ZLkheI6Rgrn
 damecmVRd5MvaOrALoxqFbW7yV9MBaw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-552-K4TlnBUYMSqQmsXh2DaLuA-1; Mon, 30 Jan 2023 14:10:03 -0500
X-MC-Unique: K4TlnBUYMSqQmsXh2DaLuA-1
Received: by mail-wr1-f70.google.com with SMTP id
 w16-20020a5d4b50000000b002bfca568cdfso2057449wrs.0
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 11:10:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DRtyDnrFbOsBzhyGPdqKiemvG8LsXFfe4j2UkmizAsc=;
 b=ik2SmLt83DEMwPWBXbAsNJri6Jeov/Nyiu2JymHFafWZcLMEuCd8Q5VIIYuhtFq7OJ
 9zXyP9qIMrSKSkSGF6g9Xsil8VXn8rwjMVyYI+SmUFgawpS1M+EBIYiS0S7/AwpjTtgv
 f7afR4hJnEi4DYBXr5PkaezQD2NNRhdmBchSWAsa94u0z/58PPipu+B48OjCZEjMTqkb
 IPWIc7iHc8u/yft8YsvEwoZ4irrHTNH/VD7TRw93GqQH69JrIbEL/HlowCsA8LVdQQB9
 IJQLwgVfRc8ZP2z2iloNAJaSjBfg5ZE+7cWsGPH5dv43U7b5Tvg4y7+EOqrBNI9Jcejr
 8ohA==
X-Gm-Message-State: AFqh2kor1jBTO/lmnbM1SYSdUAjIA8ZuVRl6JWICmX2YCiWvNXyi3Qe2
 HspL1eVU03JX6KuI5rlt6a9GgaI5ZREXdXzDlT/3oDsmJavZUz2uRZdvSCU4LklRaGqbQaWflxu
 mdJIfTFLZhSM1jso=
X-Received: by 2002:a05:600c:5409:b0:3da:f66a:e866 with SMTP id
 he9-20020a05600c540900b003daf66ae866mr50917484wmb.10.1675105801957; 
 Mon, 30 Jan 2023 11:10:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsjEkoyecHPwl57anGMjwlRRC+vZGuWf3jZR2D1IhKQZB3UKO4prIzX52An3JyXLymlMbGkCg==
X-Received: by 2002:a05:600c:5409:b0:3da:f66a:e866 with SMTP id
 he9-20020a05600c540900b003daf66ae866mr50917471wmb.10.1675105801716; 
 Mon, 30 Jan 2023 11:10:01 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 bi5-20020a05600c3d8500b003db0bb81b6asm14233195wmb.1.2023.01.30.11.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 11:10:01 -0800 (PST)
Date: Mon, 30 Jan 2023 14:09:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, virtio-fs@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] vhost-user-fs: Back up vqs before cleaning up vhost_dev
Message-ID: <20230130140947-mutt-send-email-mst@kernel.org>
References: <20230130140225.77964-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130140225.77964-1-akihiko.odaki@daynix.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Mon, Jan 30, 2023 at 11:02:25PM +0900, Akihiko Odaki wrote:
> vhost_dev_cleanup() clears vhost_dev so back up its vqs member to free
> the memory pointed by the member.
> 
> Fixes: 98fc1ada4c ("virtio: add vhost-user-fs base device")
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/virtio/vhost-user-fs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index f5049735ac..83fc20e49e 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -273,6 +273,7 @@ static void vuf_device_unrealize(DeviceState *dev)
>  {
>      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>      VHostUserFS *fs = VHOST_USER_FS(dev);
> +    struct vhost_virtqueue *vhost_vqs = fs->vhost_dev.vqs;
>      int i;
>  
>      /* This will stop vhost backend if appropriate. */
> @@ -288,8 +289,7 @@ static void vuf_device_unrealize(DeviceState *dev)
>      }
>      g_free(fs->req_vqs);
>      virtio_cleanup(vdev);
> -    g_free(fs->vhost_dev.vqs);
> -    fs->vhost_dev.vqs = NULL;
> +    g_free(vhost_vqs);
>  }
>  
>  static struct vhost_dev *vuf_get_vhost(VirtIODevice *vdev)
> -- 
> 2.39.1


