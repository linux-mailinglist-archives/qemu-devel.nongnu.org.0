Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C1735A27A
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 17:59:21 +0200 (CEST)
Received: from localhost ([::1]:37694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUtXU-00052u-P0
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 11:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lUtVg-0004CP-KB
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 11:57:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lUtVd-0003QZ-Vn
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 11:57:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617983844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nMiAWaUKVxKc6ZgyjnfHtXEmImY3x3rTp4rkzf6DRYs=;
 b=X3Puw5ZtWMor+iP7yO+zmqEyrY3+3zEfKyAVm50CwtfK7BYi3K5xhicAMaNpvYnYqs4IG7
 LsNV+THSd1aWmyyxnEEA4w55guXCER9zsw6Ti2ihIoRjdQxCxpTW7qpJA5EVYZ8UT68Qkp
 BqpP5jmOchcJFOPTcvMFflaGRtbsSD4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-5BeDcIAhNVSeb8sMUORx8Q-1; Fri, 09 Apr 2021 11:57:20 -0400
X-MC-Unique: 5BeDcIAhNVSeb8sMUORx8Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD6BD1B18BC0;
 Fri,  9 Apr 2021 15:57:18 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-67.rdu2.redhat.com [10.10.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA7761B472;
 Fri,  9 Apr 2021 15:56:57 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 45B0B22054F; Fri,  9 Apr 2021 11:56:57 -0400 (EDT)
Date: Fri, 9 Apr 2021 11:56:57 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Anton Kuchin <antonkuchin@yandex-team.ru>
Subject: Re: [Virtio-fs] [PATCH] vhost-user-fs: fix features handling
Message-ID: <20210409155657.GE1111800@redhat.com>
References: <20210408195534.647895-1-antonkuchin@yandex-team.ru>
MIME-Version: 1.0
In-Reply-To: <20210408195534.647895-1-antonkuchin@yandex-team.ru>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 08, 2021 at 10:55:34PM +0300, Anton Kuchin wrote:
> Make virtio-fs take into account server capabilities.
> 
> Just returning requested features assumes they all of then are implemented
> by server and results in setting unsupported configuration if some of them
> are absent.
> 
> Signed-off-by: Anton Kuchin <antonkuchin@yandex-team.ru>

[CC stefan and qemu-devel.]

Can you give more details of what problem exactly you are facing. Or
this fix is about avoiding a future problem where device can refuse
to support a feature qemu is requesting for.

IIUC, this patch is preparing a list of features vhost-user-fs device
can support. Then it calls vhost_get_features() which makes sure that
all these features are support by real vhost-user device (hdev->features).
If not, then corresponding feature is reset and remaining features
are returned to caller.

This feature negotion bit is called in so many places that I am kind of
lost that who should be doing what. Will leave it to Stefan who
understands it much better.


> ---
>  hw/virtio/vhost-user-fs.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index ac4fc34b36..6cf983ba0e 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -24,6 +24,14 @@
>  #include "monitor/monitor.h"
>  #include "sysemu/sysemu.h"
>  
> +static const int user_feature_bits[] = {
> +    VIRTIO_F_VERSION_1,
> +    VIRTIO_RING_F_INDIRECT_DESC,
> +    VIRTIO_RING_F_EVENT_IDX,
> +    VIRTIO_F_NOTIFY_ON_EMPTY,
> +    VHOST_INVALID_FEATURE_BIT
> +};
> +
>  static void vuf_get_config(VirtIODevice *vdev, uint8_t *config)
>  {
>      VHostUserFS *fs = VHOST_USER_FS(vdev);
> @@ -129,11 +137,12 @@ static void vuf_set_status(VirtIODevice *vdev, uint8_t status)
>  }
>  
>  static uint64_t vuf_get_features(VirtIODevice *vdev,
> -                                      uint64_t requested_features,
> -                                      Error **errp)
> +                                 uint64_t features,

Will it make sense to keep the name requested_features. This kind of
makes it clear that caller is requesting these features.

I feel there should be few lines of comments also to make it clear
what this function is actually doing.

Vivek

> +                                 Error **errp)
>  {
> -    /* No feature bits used yet */
> -    return requested_features;
> +    VHostUserFS *fs = VHOST_USER_FS(vdev);
> +
> +    return vhost_get_features(&fs->vhost_dev, user_feature_bits, features);
>  }
>  
>  static void vuf_handle_output(VirtIODevice *vdev, VirtQueue *vq)
> -- 
> 2.25.1
> 
> 
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://listman.redhat.com/mailman/listinfo/virtio-fs


