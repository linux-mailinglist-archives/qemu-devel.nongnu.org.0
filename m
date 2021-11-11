Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC66544DC6C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 21:17:07 +0100 (CET)
Received: from localhost ([::1]:32984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlGVO-0002mZ-GR
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 15:17:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mlGTV-0001w0-DP
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 15:15:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mlGTT-0004Y9-3p
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 15:15:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636661705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3yn3MDNEjPQplmvXGXm7YaXHmndAgb03/3oMPBAZwq8=;
 b=GlRN8oe1PqR9hQiIoIelYkxE2gTJJGWde2P8kRlLmbGvxXULLr+5LKg6SWRnur7XKrSL1c
 nrel75DuhJtc460T3bbCwQmu+5F1hVIeCe/q1jxxHR72whbPOT4FJU6JfcJ3CE8WodvRKz
 AR2B0rAUyvC2PvTTIj2szcjRxK8qDS8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-HyuShC-MO1Wie4Htog8oqQ-1; Thu, 11 Nov 2021 15:15:02 -0500
X-MC-Unique: HyuShC-MO1Wie4Htog8oqQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 z21-20020a05640240d500b003e3340a215aso6325699edb.10
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 12:15:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3yn3MDNEjPQplmvXGXm7YaXHmndAgb03/3oMPBAZwq8=;
 b=PzRdRukrCxCWINQKY2jC2VlT159kp8CSJ4d5hhtXro/ICrbb5lY7kLgPRxuXCEFTja
 Nv8lBT9PfAYa9AbWz57BSqN64HrafYaIawwAiWkqUoV0ozkKDT6X+7Jhznx0d4UHurp9
 7QK8XXZh2Nx0ckc71Jqk+giOb+kDIvMKazDsTjzchMb9zUawDiyeLL7GjUkwsvCIPWIA
 cCvsy7N6f3J6enKclxPl5HLv1IDuHCX4l8qTkVHt36gjG0gaugYo9fYoWV9cUAWshKuM
 NxDSjzMChcIMfObd8+cVEAQQn3kWqjopQOzZ1iVJY40EThaPkbfV1mNBPuctokFB94gs
 sgFw==
X-Gm-Message-State: AOAM533gEfhn1tDRV/pdqIlXzil6g6Sbk7i1tho2rBpZfw6o1nvDmFry
 ong0VBbqowaumpkDifZ+u+xPIEFyb+aoVVwke40OCVHjSL9m462g4vTzqTYqt5tcFc3/CARaTKC
 8n/sNE8qZiKCvyBk=
X-Received: by 2002:a05:6402:416:: with SMTP id
 q22mr13427379edv.382.1636661701620; 
 Thu, 11 Nov 2021 12:15:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzorBaPYGUx2Td6n6N4GUuHoWMfZY49jHUEBdFcMLIL8Jby6kqUcZeQFdmVWS8JMMsw3koC5w==
X-Received: by 2002:a05:6402:416:: with SMTP id
 q22mr13427319edv.382.1636661701315; 
 Thu, 11 Nov 2021 12:15:01 -0800 (PST)
Received: from redhat.com ([2.55.135.246])
 by smtp.gmail.com with ESMTPSA id sc7sm2060330ejc.50.2021.11.11.12.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 12:15:00 -0800 (PST)
Date: Thu, 11 Nov 2021 15:14:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Roman Kagan <rvkagan@yandex-team.ru>
Subject: Re: [PATCH 00/10] vhost: stick to -errno error return convention
Message-ID: <20211111151419-mutt-send-email-mst@kernel.org>
References: <20211111153354.18807-1-rvkagan@yandex-team.ru>
MIME-Version: 1.0
In-Reply-To: <20211111153354.18807-1-rvkagan@yandex-team.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, Hanna Reitz <hreitz@redhat.com>,
 yc-core@yandex-team.ru,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 11, 2021 at 06:33:44PM +0300, Roman Kagan wrote:
> Error propagation between the generic vhost code and the specific backends is
> not quite consistent: some places follow "return -1 and set errno" convention,
> while others assume "return negated errno".  Furthermore, not enough care is
> taken not to clobber errno.
> 
> As a result, on certain code paths the errno resulting from a failure may get
> overridden by another function call, and then that zero errno inidicating
> success is propagated up the stack, leading to failures being lost.  In
> particular, we've seen errors in the communication with a vhost-user-blk slave
> not trigger an immediate connection drop and reconnection, leaving it in a
> broken state.
> 
> Rework error propagation to always return negated errno on errors and
> correctly pass it up the stack.

Looks like something we want post release. I'll tag it
but pls ping me after the release to help make sure
it's not lost.


> Roman Kagan (10):
>   vhost-user-blk: reconnect on any error during realize
>   chardev/char-socket: tcp_chr_recv: don't clobber errno
>   chardev/char-socket: tcp_chr_sync_read: don't clobber errno
>   chardev/char-fe: don't allow EAGAIN from blocking read
>   vhost-backend: avoid overflow on memslots_limit
>   vhost-backend: stick to -errno error return convention
>   vhost-vdpa: stick to -errno error return convention
>   vhost-user: stick to -errno error return convention
>   vhost: stick to -errno error return convention
>   vhost-user-blk: propagate error return from generic vhost
> 
>  chardev/char-fe.c         |   7 +-
>  chardev/char-socket.c     |  17 +-
>  hw/block/vhost-user-blk.c |   4 +-
>  hw/virtio/vhost-backend.c |   4 +-
>  hw/virtio/vhost-user.c    | 401 +++++++++++++++++++++-----------------
>  hw/virtio/vhost-vdpa.c    |  37 ++--
>  hw/virtio/vhost.c         |  98 +++++-----
>  7 files changed, 307 insertions(+), 261 deletions(-)
> 
> -- 
> 2.33.1
> 


