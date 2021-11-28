Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4A6460A64
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Nov 2021 22:49:02 +0100 (CET)
Received: from localhost ([::1]:48690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrS2f-0006Gr-6p
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 16:49:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mrS1G-0005Sk-OF
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 16:47:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mrS1D-0003BX-CW
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 16:47:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638136049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=63k0Tr1PVQkYSrQioNfLzfQtm3O2PuFgip8yW4dEQDI=;
 b=FFauwNZ10oDACmjX0/8H7rKcj6/0LzlqCxrigTq3Dc69xM9jOi+2ZRpK7dmsrpWuoUgUY3
 rYmr/6CN7yTMja2i4AkkuTgj6ly1Bb4gaOZGlrCmFIPbLdxOFebgpARVuPM7D89sXRznzV
 CqFBWF+W7rlSRv9fW8m2hHzDes02KZc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-9qeZG-VON_eVNfXSXlRDqg-1; Sun, 28 Nov 2021 16:47:28 -0500
X-MC-Unique: 9qeZG-VON_eVNfXSXlRDqg-1
Received: by mail-ed1-f69.google.com with SMTP id
 y9-20020aa7c249000000b003e7bf7a1579so11931351edo.5
 for <qemu-devel@nongnu.org>; Sun, 28 Nov 2021 13:47:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=63k0Tr1PVQkYSrQioNfLzfQtm3O2PuFgip8yW4dEQDI=;
 b=XudFSRK2hi36UrcSyzDLlZjwe16PHMuoCVyQ6zp3Xer4umD1XpASgJQu4OFYSQ6Gfo
 slg3r/oXVCkOBGLlhrNUuTSlWDbcuoRJZurDzs1okS7an5PAnYsvRKDUvNEwZOWqb6Bl
 hP6IqKO83effC+uGos5MwY34x3NJEqcpu41ajBS6lG8djNCrM3er94KScpYkkRsKHL+g
 2uS385Ens3s0LgHFEj3Q35TF65ADsj8EtH9j1iAcccb/gCFsgfb2dsdJxuHb+EbEJo+O
 ANFiW/O4gp0y/RPaUQotE5akozzJrj2zQ4CkzTbI4uXqitJLb5Bmzx7w2TMOBfFMaKfV
 lPwA==
X-Gm-Message-State: AOAM531VZZT2iazSfUyR7BjxtIkRo6R0h0vhHLSry44Mt408x2WU0g8T
 643gfQFeBHFuPnxjCM+ZtrpGr9UgoVesdOsaTMD2pbToBjyz7MTk4+BXPXHxvGEs4opsRZnw31T
 JEvN9ChtncVWxLYU=
X-Received: by 2002:a50:fe1a:: with SMTP id f26mr67534686edt.132.1638136047278; 
 Sun, 28 Nov 2021 13:47:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzktKAjw4kzUVuc3lBA84DnUTBSW2LgDSu+n86WH1hWio/6baZkI0fGUZmhO658pm3BNv8mMA==
X-Received: by 2002:a50:fe1a:: with SMTP id f26mr67534643edt.132.1638136046914; 
 Sun, 28 Nov 2021 13:47:26 -0800 (PST)
Received: from redhat.com ([45.15.19.35])
 by smtp.gmail.com with ESMTPSA id e19sm7640432edu.47.2021.11.28.13.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 13:47:25 -0800 (PST)
Date: Sun, 28 Nov 2021 16:47:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Roman Kagan <rvkagan@yandex-team.ru>
Subject: Re: [PATCH 00/10] vhost: stick to -errno error return convention
Message-ID: <20211128164607-mutt-send-email-mst@kernel.org>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Roman,
if there are bugfixes here I'll be happy to take them right now.
The wholesale rework seems inappropriate for 6.2, I'll be
happy to tag it for after 6.2. Pls ping me aftre release to help
make sure it's not lost.


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


