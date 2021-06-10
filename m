Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EE63A3222
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 19:31:13 +0200 (CEST)
Received: from localhost ([::1]:51038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrOWO-0003H3-Kr
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 13:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1lrOVB-0002Ev-GV
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 13:29:57 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:34497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1lrOV6-0006Nv-Jb
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 13:29:55 -0400
Received: by mail-oi1-x22c.google.com with SMTP id u11so2942269oiv.1
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 10:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DmME4KhcGrsFskZ3hxDvxnMR/gGx8qcZCpJkjepoSkw=;
 b=PxGmRFSX3SHYZYC/W1stgT9G7BpbolzWK0T/pAUQpLSE3u7YrChNeU6NpVqCfU7FFL
 aHp7NbhTN11sO/UFoC4mkGIKEUZC9kJoBmUzDfIPfGWE7CKJrP2SBvPd1k1Pks9KA044
 Q6pMbYzLJQ6SeE467ewqGNro/ZZ+TwF1HJ3Wn7taOed3JWhhmaCHoMANzIU0eWfT8hOF
 Dm/vR6ElsurfSnXFBtJsRwzwgXfDlxLXZo6dNj78ASMekbtAODANeWjgd7Ov+8ty0roL
 YYFzyqWW1ESkW8I9MLtlrSKp8RnrOi8QQIAPSpPtPM9wGwC3EGBLNoqDQa1wkGwYMnBO
 WNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DmME4KhcGrsFskZ3hxDvxnMR/gGx8qcZCpJkjepoSkw=;
 b=U9ctJ7GuDXdGrO1wuOaMBtoaNb1YjvvB2rEMoYwkseK1U9tWRmeo/0Mg6nJM+9l96N
 w9IeANzsz0Wp5q2lLhoW+l189pq3FDAr1+8B5WJc9fUeMJan7AACSDK45e4Lalhz3Rbn
 ZOkuXaxA52gBoSvpv3DqZ6wAwTaMn29TliFAfHQE/guZpgBUpQrrslPO6ONx5ZjE3xRA
 kXYOrV9gCKNLGo679/6tlioVc9x8s4Hn9lOj1Y793AQaf81lvI5yDtGKtag8gyLgjvGG
 loBbmfEjQrXiFkwvLjyDBocDhVIHS7XoGOH7un0fHZ0fq4VCONM+TnLS5I5CA9BS5a5z
 NpFA==
X-Gm-Message-State: AOAM530/RdUTsj0C5ZE+Jvd5QJhEtK97JT0BjGSyFO+0IVeAsKESibL2
 TZ98thL8tcw8sQN981sWRm+M3A1Hz17kwHMXe5L9Qw==
X-Google-Smtp-Source: ABdhPJwVbAny4pQjGV05ZNxF6/UrKD96E2GFdVqn1vOod/oWz9LRA/mpq5GTicVutSUroQxbRv4YwpB+YsSDiTEWFDw=
X-Received: by 2002:aca:e0d6:: with SMTP id x205mr4217329oig.109.1623346190984; 
 Thu, 10 Jun 2021 10:29:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210610001424.209158-1-jiang.wang@bytedance.com>
 <20210610094039.2ek3som6fxcgjtyw@steredhat>
In-Reply-To: <20210610094039.2ek3som6fxcgjtyw@steredhat>
From: "Jiang Wang ." <jiang.wang@bytedance.com>
Date: Thu, 10 Jun 2021 10:29:40 -0700
Message-ID: <CAP_N_Z9B9SfyoSmW18RDxRWh6yv9WWWL1LpsZhhSkshQpi5s6A@mail.gmail.com>
Subject: Re: Re: [RFC v1] virtio/vsock: add two more queues for datagram types
To: Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=jiang.wang@bytedance.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 2:40 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> On Thu, Jun 10, 2021 at 12:14:24AM +0000, Jiang Wang wrote:
> >Datagram sockets are connectionless and unreliable.
> >The sender does not know the capacity of the receiver
> >and may send more packets than the receiver can handle.
> >
> >Add two more dedicate virtqueues for datagram sockets,
> >so that it will not unfairly steal resources from
> >stream and future connection-oriented sockets.
> >
> >The virtio spec patch is here:
> >https://www.spinics.net/lists/linux-virtualization/msg50027.html
> >
> >Here is the link for the linux kernel git repo with patches
> >to support dgram sockets:
> >https://github.com/Jiang1155/linux/tree/vsock-dgram-v1
> >
> >Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
> >---
> > configure                                     | 13 +++++++++++++
> > hw/virtio/vhost-vsock-common.c                | 11 ++++++++++-
> > hw/virtio/vhost-vsock.c                       |  8 +++++---
> > include/hw/virtio/vhost-vsock-common.h        | 10 +++++++++-
> > include/standard-headers/linux/virtio_vsock.h |  3 +++
> > meson.build                                   |  1 +
> > 6 files changed, 41 insertions(+), 5 deletions(-)
> >
> >diff --git a/configure b/configure
> >index 9f016b06b5..6455b283a5 100755
> >--- a/configure
> >+++ b/configure
> >@@ -343,6 +343,7 @@ vhost_net="$default_feature"
> > vhost_crypto="$default_feature"
> > vhost_scsi="$default_feature"
> > vhost_vsock="$default_feature"
> >+vhost_vsock_dgram="no"
> > vhost_user="no"
> > vhost_user_blk_server="auto"
> > vhost_user_fs="$default_feature"
> >@@ -1272,6 +1273,10 @@ for opt do
> >   ;;
> >   --enable-vhost-vsock) vhost_vsock="yes"
> >   ;;
> >+  --disable-vhost-vsock-dgram) vhost_vsock_dgram="no"
> >+  ;;
> >+  --enable-vhost-vsock-dgram) vhost_vsock_dgram="yes"
> >+  ;;
>
> I don't think we should add a configuration option to enable/disable the
> dgram support at build time.
>
> I think we should do it at runtime looking at the features negiotated.
>
> Take a look at virtio_net_set_multiqueue().

Got it. Will check. Thanks.

> Thanks,
> Stefano
>

