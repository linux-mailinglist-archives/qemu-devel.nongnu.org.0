Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F376F67FD5C
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 08:27:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pM25T-00049G-Lc; Sun, 29 Jan 2023 02:26:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pM25S-000495-6Y
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 02:26:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pM25Q-00077s-Jd
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 02:26:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674977207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Klss+mGyIwHi4PGhyqarJZJbQ1zqC6v6FuKEZkW1tuY=;
 b=Oi6av7J6xN6CsW3BKnQry83mVC8irJFQOm8b3xHY8LULs1Wayuk5NsZBqFkWKPTeJ4CThv
 QMfxMwz6K/fF7e2jYuOALyvPG21V48j5ZDQgXOuOfPFpKTAqCUKmqNeFYSvH/IeSNihFtS
 zNDZtH8hSZmBSCdkwfDOcbmXVjqyMlw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-49-dzNGj9hHMT-45xko71jdcQ-1; Sun, 29 Jan 2023 02:26:45 -0500
X-MC-Unique: dzNGj9hHMT-45xko71jdcQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg25-20020a05600c3c9900b003da1f6a7b2dso7394772wmb.1
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 23:26:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Klss+mGyIwHi4PGhyqarJZJbQ1zqC6v6FuKEZkW1tuY=;
 b=qE9bY78gsGbVjuJzeLbj7fj3sLsQWiFOWMxoI+Bl7aFYPouvofxWyKY3q4xkPg5K74
 yPVdXKqfnj5j5apaUHZy1eEKlO/4Btv2nQmcprzl7XJLtNWbkNLLbb9acyPLqN3Fcgs7
 C7p8GmlOWT2x7oHZ/1CvdGMpWNaMXLgWuULy2dddxcptDKXzIls5d5h6RtCzokd/tlW6
 3w8FjSXUBNSCh/W182GHHr3h4U5PDK93k5WYOwZXd/655YbrYtNLPAeiIRKlv+fw/B4A
 uTxZTpl5y2VzRGv0Bs3vzmVjoV89PGaT5aw4aZ/F8UB195kQ7kI0r5FYMgBAQ23XB2fe
 hMmw==
X-Gm-Message-State: AO0yUKXKak3aI23R46drOHlhTYLdPjZdwz6gnUPnVOQqiS8TsosPWQKF
 w/4gp+0qBq5xaUIMv0zmJfPqrv4/njhamq70cHmtJhWS7CJS45G2PGsFJtSj1ujrL5k0GBaEpnM
 rniMt4D4C3EJuceg=
X-Received: by 2002:a05:600c:3b02:b0:3dc:4296:6d56 with SMTP id
 m2-20020a05600c3b0200b003dc42966d56mr6491010wms.30.1674977204867; 
 Sat, 28 Jan 2023 23:26:44 -0800 (PST)
X-Google-Smtp-Source: AK7set+dxeB8F1tmMPN9636el+Rjkn7+JK1ltuo3oLYCPeiY/bAykQbUk4BagCOhBQ5zMTyHtojkpQ==
X-Received: by 2002:a05:600c:3b02:b0:3dc:4296:6d56 with SMTP id
 m2-20020a05600c3b0200b003dc42966d56mr6490999wms.30.1674977204636; 
 Sat, 28 Jan 2023 23:26:44 -0800 (PST)
Received: from redhat.com ([2.52.20.248]) by smtp.gmail.com with ESMTPSA id
 m14-20020a05600c4f4e00b003a3442f1229sm13950012wmq.29.2023.01.28.23.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 23:26:44 -0800 (PST)
Date: Sun, 29 Jan 2023 02:26:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v1 0/2] virtio: fix for assertion failure:
 virtio_net_get_subqueue(nc)->async_tx.elem failed
Message-ID: <20230129022555-mutt-send-email-mst@kernel.org>
References: <20230129025150.119972-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230129025150.119972-1-xuanzhuo@linux.alibaba.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Sun, Jan 29, 2023 at 10:51:48AM +0800, Xuan Zhuo wrote:
> In the current design, we stop the device from operating on the vring
> during per-queue reset by resetting the structure VirtQueue.
> 
> But before the reset operation, when recycling some resources, we should
> stop referencing new vring resources.
> 
> This bug is caused by this reason.
> 
>     https://gitlab.com/qemu-project/qemu/-/issues/1451
> 
> Before we reset the structure, we called the ->queue_reset callback to let the
> device reclaim resources. Here virtio-net tries to release the packets sent
> asynchronously, but during this process virtio_net_flush_tx() will be called,
> and new data will be sent again. This leads to asserted.
> 
>      assert(!virtio_net_get_subqueue(nc)->async_tx.elem);
> 
> This patch set introduce new item "reset" into struct VirtQueue, then device can
> know this virtqueue is per-queue reset state.

Better but I still don't exacctly understand what this state means.
Sent some questions on the patches themselves.
Thanks!


> v1:
>     1. rename "reset" to disabled_by_reset
>     2. add api: virtio_queue_reset_state()
> 
> Xuan Zhuo (2):
>   virtio: struct VirtQueue introduce reset
>   virtio-net: virtio_net_flush_tx() check for per-queue reset
> 
>  hw/net/virtio-net.c        |  3 ++-
>  hw/virtio/virtio.c         | 15 +++++++++++++++
>  include/hw/virtio/virtio.h |  1 +
>  3 files changed, 18 insertions(+), 1 deletion(-)
> 
> --
> 2.32.0.3.g01195cf9f


