Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F27E3A283B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 11:24:56 +0200 (CEST)
Received: from localhost ([::1]:51200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrGvn-0001mn-EB
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 05:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lrGuS-0000yz-SB
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 05:23:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lrGuR-0000pd-6X
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 05:23:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623317010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EZvq8xJ4xI5zLzAg1YU99mNGP6huA++lgvtxWdMhKYQ=;
 b=fpc9hrUIxI7u14/rV47wGUJmxkE5qevNe839F7cDXWAjPd0adJznIImPcVB86DRQqdSPes
 wyCPZyXEHWzWQ6BRhu3hhIRDyBW3VREMUw6abTf8qrzWfsP5wz5rCKsRjtDoYT2qJj3GOo
 JdY/e6TLv0UCznbXf/dEaSjDRrtdc18=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-QYAu-wWzN_md-YbmDmK_4g-1; Thu, 10 Jun 2021 05:23:29 -0400
X-MC-Unique: QYAu-wWzN_md-YbmDmK_4g-1
Received: by mail-ed1-f72.google.com with SMTP id
 p24-20020aa7c8980000b0290393c37fdcb8so2735561eds.6
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 02:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EZvq8xJ4xI5zLzAg1YU99mNGP6huA++lgvtxWdMhKYQ=;
 b=csw85QZwpsVa3Wc/poiMQlv2cklIIfflPoSOGc6Jf9tnoWl57TM4HwVLZ2TvXT8zQ9
 QgfY7bYn46zl+LIkuIbUW2UZbtOsHZuyfG/4JMR9Iv61yqLAtn5GJ9nBcNgU043ALE7g
 74PIuBx1r/YvIc0PBqF+FzTC8oRq3JXol2TV6o0iTEkwK/6oJkBvAV9qOJZOu3jlGDkI
 fPK26oOoaDkRRiqZ0cOJ2LPZyV7jgB1PXKMomb0+zbaLgH/lrTXXeHqqiPXK1JTrMqSt
 8mpgHXwH+LLSguuI8/CPdUJEKOrmEUtfq9bEFOFU7uUal+nvaJbkzgHvU3J8HwVcYWSY
 Ecpg==
X-Gm-Message-State: AOAM53280WrxQzRVBH3BP2N+7//XTKpC0Jy8MN3KSKLz/LuGl4BZxvgU
 EWA0SCjenT4OTj0VcZqStpJcXHXvXVnLvawVuhcrCEDHNO4Xizdd5vDE0nNi39lyfJCtkBpF1Ro
 4fVOGXStDxgnJyjc=
X-Received: by 2002:a17:906:2612:: with SMTP id
 h18mr3599164ejc.417.1623317007955; 
 Thu, 10 Jun 2021 02:23:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQzeopRCERI+jO0/go+r15G94bkhQu8fgTouwCJ+TGoh5/CxacJLlSqzsKKmvL2sOxs1ae2A==
X-Received: by 2002:a17:906:2612:: with SMTP id
 h18mr3599149ejc.417.1623317007790; 
 Thu, 10 Jun 2021 02:23:27 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id gz25sm791850ejb.0.2021.06.10.02.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 02:23:27 -0700 (PDT)
Date: Thu, 10 Jun 2021 11:23:25 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 7/7] vhost-user-blk: Implement reconnection during realize
Message-ID: <20210610092325.fdxph26pfog7qczg@steredhat>
References: <20210609154658.350308-1-kwolf@redhat.com>
 <20210609154658.350308-8-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210609154658.350308-8-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 09, 2021 at 05:46:58PM +0200, Kevin Wolf wrote:
>Commit dabefdd6 removed code that was supposed to try reconnecting
>during .realize(), but actually just crashed and had several design
>problems.
>
>This adds the feature back without the crash in simple cases while also
>fixing some design problems: Reconnection is now only tried if there was
>a problem with the connection and not an error related to the content
>(which would fail again the same way in the next attempt). Reconnection
>is limited to three attempts (four with the initial attempt) so that we
>won't end up in an infinite loop if a problem is permanent. If the
>backend restarts three times in the very short time window of device
>initialisation, we have bigger problems and erroring out is the right
>course of action.
>
>In the case that a connection error occurs and we reconnect, the error
>message is printed using error_report_err(), but otherwise ignored.
>
>Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>---
> hw/block/vhost-user-blk.c | 14 +++++++++++++-
> 1 file changed, 13 insertions(+), 1 deletion(-)
>
>diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
>index e49d2e4c83..f75a42bc62 100644
>--- a/hw/block/vhost-user-blk.c
>+++ b/hw/block/vhost-user-blk.c
>@@ -455,8 +455,10 @@ static int vhost_user_blk_realize_connect(VHostUserBlk *s, Error **errp)
>
> static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
> {
>+    ERRP_GUARD();
>     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>     VHostUserBlk *s = VHOST_USER_BLK(vdev);
>+    int retries;
>     int i, ret;
>
>     if (!s->chardev.chr) {
>@@ -498,7 +500,17 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
>     s->inflight = g_new0(struct vhost_inflight, 1);
>     s->vhost_vqs = g_new0(struct vhost_virtqueue, s->num_queues);
>
>-    ret = vhost_user_blk_realize_connect(s, errp);
>+    retries = 3;

Maybe we can add a macro for this with a comment with the information 
provided in this commit message.

Thanks,
Stefano


