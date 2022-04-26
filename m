Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F112510556
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 19:24:28 +0200 (CEST)
Received: from localhost ([::1]:52680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOvL-0007F3-9C
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 13:24:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1njOax-0004G0-Kh
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 13:03:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1njOat-0000RX-Gq
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 13:03:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650992597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NbbGaYeceReeetz7ZUGKpvCTwkNSLttAMyz0jr2e0to=;
 b=f8gfSmN9SEokWM81Cuuoyr+Dixo9Vt74fxWD20pe50w5kTtf9Gr3i/1eegMcU0GnYatfoM
 WaQNSmZfrxyaRf/Aju6Ml94q94h119RPLgBFp5dmAFlWMdeiFqtfZnUpV2MaDXNxfuZiFc
 X90QkmE0Q8cNEzI9MEET4OyqzkhIYn8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-Y2HHCLagP9Ks3c8gIIbmZA-1; Tue, 26 Apr 2022 13:03:14 -0400
X-MC-Unique: Y2HHCLagP9Ks3c8gIIbmZA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4B39801E80;
 Tue, 26 Apr 2022 17:03:13 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 254C5C3597B;
 Tue, 26 Apr 2022 17:03:12 +0000 (UTC)
Date: Tue, 26 Apr 2022 19:03:10 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [PATCH v4 4/6] vduse-blk: implements vduse-blk export
Message-ID: <Ymglzs0iKKUFiFNW@redhat.com>
References: <20220406075921.105-1-xieyongji@bytedance.com>
 <20220406075921.105-5-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220406075921.105-5-xieyongji@bytedance.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block@nongnu.org, mst@redhat.com, eblake@redhat.com,
 jasowang@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 mlureau@redhat.com, stefanha@redhat.com, jsnow@redhat.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 06.04.2022 um 09:59 hat Xie Yongji geschrieben:
> This implements a VDUSE block backends based on
> the libvduse library. We can use it to export the BDSs
> for both VM and container (host) usage.
> 
> The new command-line syntax is:
> 
> $ qemu-storage-daemon \
>     --blockdev file,node-name=drive0,filename=test.img \
>     --export vduse-blk,node-name=drive0,id=vduse-export0,writable=on
> 
> After the qemu-storage-daemon started, we need to use
> the "vdpa" command to attach the device to vDPA bus:
> 
> $ vdpa dev add name vduse-export0 mgmtdev vduse
> 
> Also the device must be removed via the "vdpa" command
> before we stop the qemu-storage-daemon.
> 
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>

The request handling code is almos the same as for the vhost-user-blk
export. I wonder if we could share this code instead of copying.

The main difference seems to be that you chose not to support discard
and write_zeroes yet. I'm curious if there is a reason why the
vhost-user-blk code wouldn't work for vdpa there?

> +    features = vduse_get_virtio_features() |
> +               (1ULL << VIRTIO_BLK_F_SIZE_MAX) |
> +               (1ULL << VIRTIO_BLK_F_SEG_MAX) |
> +               (1ULL << VIRTIO_BLK_F_TOPOLOGY) |
> +               (1ULL << VIRTIO_BLK_F_BLK_SIZE);
> +
> +    if (num_queues > 1) {
> +        features |= 1ULL << VIRTIO_BLK_F_MQ;
> +    }
> +    if (!vblk_exp->writable) {
> +        features |= 1ULL << VIRTIO_BLK_F_RO;
> +    }

VIRTIO_BLK_F_FLUSH seems to be missing even though the flush command is
implemented.

(This is not a full review yet, just two or three things I noticed while
having a quick look.)

Kevin


