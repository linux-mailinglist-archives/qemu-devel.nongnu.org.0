Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AB1442873
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 08:31:49 +0100 (CET)
Received: from localhost ([::1]:32810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhoGq-0003HJ-GF
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 03:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhoAs-0007fs-Gl
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 03:25:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhoAo-0001QI-9Z
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 03:25:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635837931;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w7yffhPX+vho+28Gpi8r3quLL7PgmQ1wTBBSs+ie47U=;
 b=hYQ1MHgst6jQr72MZItqA6dR8cbTNdYke8uG/kX2WQMep5IjJbCthv5MtSquzQMQITUUJU
 W7Ic3GKvFKUwM1qDa0qOWz0oSQzU8CX++Cr3FigG+TmFg/wvQSh8vparzh3sD0qeAZP2ww
 ZQClIjjvLQy3JVu3X3mg26O1Hvji+QQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-qmKhj5fGO5egpFjUz-D4BQ-1; Tue, 02 Nov 2021 03:25:30 -0400
X-MC-Unique: qmKhj5fGO5egpFjUz-D4BQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 144-20020a1c0496000000b003305ac0e03aso688226wme.8
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 00:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oAW8XtcxK2uizmVJvFb6uSAJqsymalNgSqRqG6DzS6Q=;
 b=AzqOCstNdTX3H31Fq1coGnZP5N+o/T/H0sam2MjoW/gsUlPFEZcju20kNOJCxdxqPt
 AEup8iak6DPflL1kXF/Xn5xJGyaTWhMO2ULYzzMdjwd4fEWoteujSR8jbexqfJn3XnI9
 WFdQKBldagWmbWaA6zhou3ngGt/txPfVbXu5535YZvlkPjkB1MB8804Hh8BPpQWfDsqR
 3e4hXTGxsr4JaxzUVWA8XEKGj9FjGrfPgV985F8QyYTvzinjQLaU0fwiV1fW9bmovQCm
 T8ojmq9FFGTJ5LR/KLURR1JWi68nTtrG5svbPg3Mw7rgUaXBKT1PASoRyVJ+R30m2aIv
 JkJw==
X-Gm-Message-State: AOAM533SHWwc/E0dYyFGXM7Z2VJmFSV7vAu9JVeKd/Pku9XBXTOjnMqu
 cAulZIZaMcCLE23S9NKky2NN3z9XHMGf9H24wCUK1X7/tAjCjLr9VsH6VJxMvsLqN4GCF46R+qr
 XF7dt0pUwf+bBdKw=
X-Received: by 2002:a7b:c764:: with SMTP id x4mr5007694wmk.78.1635837929475;
 Tue, 02 Nov 2021 00:25:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzY7mrnU1rMP3eWf4zK4fN2TqPgfcUIFlGftElm82BaXeWxJuZBQdoWj7ESLQ+ehdznORIIUg==
X-Received: by 2002:a7b:c764:: with SMTP id x4mr5007664wmk.78.1635837929279;
 Tue, 02 Nov 2021 00:25:29 -0700 (PDT)
Received: from localhost ([188.26.219.88])
 by smtp.gmail.com with ESMTPSA id r15sm18248041wru.9.2021.11.02.00.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 00:25:28 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Eugenio =?utf-8?Q?P=C3=A9rez?= <eperezma@redhat.com>
Subject: Re: [RFC PATCH v5 02/26] vhost: Fix last queue index of devices
 with no cvq
In-Reply-To: <20211029183525.1776416-3-eperezma@redhat.com> ("Eugenio
 =?utf-8?Q?P=C3=A9rez=22's?=
 message of "Fri, 29 Oct 2021 20:35:01 +0200")
References: <20211029183525.1776416-1-eperezma@redhat.com>
 <20211029183525.1776416-3-eperezma@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 02 Nov 2021 08:25:27 +0100
Message-ID: <87a6inow7s.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
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
Reply-To: quintela@redhat.com
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Eric Blake <eblake@redhat.com>, virtualization@lists.linux-foundation.org,
 Parav Pandit <parav@mellanox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eugenio P=C3=A9rez <eperezma@redhat.com> wrote:
> The -1 assumes that all devices with no cvq have an spare vq allocated
> for them, but with no offer of VIRTIO_NET_F_CTRL_VQ. This may not be the
> case, and the device may have a pair number of queues.
                                  ^^^^
even

I know, I know, I am Spanish myself O:-)

> To fix this, just resort to the lower even number of queues.

I don't understand what you try to achieve here.

> Fixes: 049eb15b5fc9 ("vhost: record the last virtqueue index for the
> virtio device")
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/net/vhost_net.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 0d888f29a6..edf56a597f 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -330,7 +330,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState=
 *ncs,
>      NetClientState *peer;
> =20
>      if (!cvq) {
> -        last_index -=3D 1;
> +        last_index &=3D ~1ULL;
>      }

As far as I can see, that is a nop. last_index is defined as an int.

$ cat kk.c
#include <stdio.h>

int main(void)
{
=09int i =3D 7;
=09i &=3D -1ULL;
=09printf("%d\n", i);
=09i =3D 8;
=09i &=3D -1ULL;
=09printf("%d\n", i);
=09i =3D 0;
=09i &=3D -1ULL;
=09printf("%d\n", i);
=09i =3D -2;
=09i &=3D -1ULL;
=09printf("%d\n", i);
=09return 0;
}
$ ./kk
7
8
0
-2


