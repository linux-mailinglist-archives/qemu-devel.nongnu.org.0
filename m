Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4685C2D14E5
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 16:40:20 +0100 (CET)
Received: from localhost ([::1]:36550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmIcc-0002HW-Pj
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 10:40:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kmIaY-0001Bz-QL
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 10:38:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kmIaU-0000Jm-Gx
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 10:38:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607355485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KkiLjMggtKD7XEXxYEV7wcY6OCwl9L2NMhF2xynTaIk=;
 b=SxRGAi0vhVNx5XrH5qTTkmbOJrvBny1kV18rPM/2gKXYs7mkyE4v5sUfQMmGcTi1fRP56p
 REq2xzulWTFfQm0s/ZhWu7zy7VxTSQ9Clq2pWn3tWzMGgaPoGkOnsotu8U4oFzxmUxVZej
 n9YoEMUI+GW08frU53CzveOlPy2olos=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-2QSpXQHJMxWr6LYbeIvcTQ-1; Mon, 07 Dec 2020 10:38:03 -0500
X-MC-Unique: 2QSpXQHJMxWr6LYbeIvcTQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69462858183;
 Mon,  7 Dec 2020 15:38:02 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-161.ams2.redhat.com [10.36.113.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EEF6D5D9D0;
 Mon,  7 Dec 2020 15:37:54 +0000 (UTC)
Date: Mon, 7 Dec 2020 16:37:53 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH 1/2] virtio-blk: Acquire context while switching them on
 dataplane start
Message-ID: <20201207153753.GD5281@merkur.fritz.box>
References: <20201204165347.73542-1-slp@redhat.com>
 <20201204165347.73542-2-slp@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201204165347.73542-2-slp@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 04.12.2020 um 17:53 hat Sergio Lopez geschrieben:
> On dataplane start, acquire the new AIO context before calling
> 'blk_set_aio_context', releasing it immediately afterwards. This
> prevents reaching the AIO context attach/detach notifier functions
> without having acquired it first.
> 
> It was also the only place where 'blk_set_aio_context' was called with
> an unprotected AIO context.
> 
> Signed-off-by: Sergio Lopez <slp@redhat.com>
> ---
>  hw/block/dataplane/virtio-blk.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
> index 37499c5564..034e43cb1f 100644
> --- a/hw/block/dataplane/virtio-blk.c
> +++ b/hw/block/dataplane/virtio-blk.c
> @@ -214,7 +214,9 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
>      vblk->dataplane_started = true;
>      trace_virtio_blk_data_plane_start(s);
>  
> +    aio_context_acquire(s->ctx);
>      r = blk_set_aio_context(s->conf->conf.blk, s->ctx, &local_err);
> +    aio_context_release(s->ctx);

bdrv_set_aio_context_ignore() is documented like this:

 * The caller must own the AioContext lock for the old AioContext of bs, but it
 * must not own the AioContext lock for new_context (unless new_context is the
 * same as the current context of bs).

Doesn't this patch lock the new context instead of the old one?

Kevin


