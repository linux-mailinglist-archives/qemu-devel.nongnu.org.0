Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 849926FED23
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 09:51:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px13o-0001rm-Ov; Thu, 11 May 2023 03:50:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1px13m-0001rb-QS
 for qemu-devel@nongnu.org; Thu, 11 May 2023 03:49:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1px13l-0006iA-6o
 for qemu-devel@nongnu.org; Thu, 11 May 2023 03:49:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683791396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O+EpTHRhELHsLuG4M4weyK1/CnnqphqB0r0Y4ACpdyY=;
 b=dIclHzezLTnKChqjj8ft0X+5u6ywTX9/yj1Cl1Kb8JXlsniUj7fU3JGAYRuyWITydATYB7
 ZpgOl+TmpLB7B0+ouNxLf5GNRa2C743bcVXdzlzTGYsDxBfDQdA91yTGXOptEPWKJ1uFLq
 8r37InkxHo7lJArNy8PWGY9JoJL3Kp4=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-YA_2XxRdOvOqi2W_u5yV5A-1; Thu, 11 May 2023 03:49:54 -0400
X-MC-Unique: YA_2XxRdOvOqi2W_u5yV5A-1
Received: by mail-yb1-f197.google.com with SMTP id
 3f1490d57ef6-ba2d0b391d3so10086868276.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 00:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683791394; x=1686383394;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O+EpTHRhELHsLuG4M4weyK1/CnnqphqB0r0Y4ACpdyY=;
 b=isTNAkEg99CUv9h7Lxf7RfgZWT+UulbTlBQKikGuUeJf7CrjGBpnruwC5XumVUZrsB
 DYSuiXaCFv4Ldog8fQPNjapkVCywM6EGTuNtJ7U73/U0EUo/gWHDH/hCzDdZCY/6hQhl
 3rq1oQrrDDfCcKb67IYgBlfJi9miITxqXBw/IPeAmGE7X4AL5+MknOD/nAfX88a/I86n
 d2L7Z1vX4BiRGi4FngcWmGEJaOEAG/FAL6i3uiS/7LCUGeORJk4YQSj2DI76j3X56A4t
 UFhmInoHGx2PpjtPL53z4Elighb4UNcni0UP9iNCvI+L+2yvjelcCICyJpt3gbluzHd/
 xfgQ==
X-Gm-Message-State: AC+VfDx/Io3J/I7jcn7pb9ESN4DlYiUv52JS/31thfXBw2VZB1SWpz8k
 POR6g+efOW5jKra1VBjWwXlEv3/iN+vShzUVa3gN2tJAZiTrmPZ0w+sInU5G5WToIoYP8b9S90g
 u7PwDJgfjJG8sQdJBUAxyP3sTd9Son2w=
X-Received: by 2002:a25:2d18:0:b0:ba6:9e94:ed2f with SMTP id
 t24-20020a252d18000000b00ba69e94ed2fmr1493409ybt.25.1683791394178; 
 Thu, 11 May 2023 00:49:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6+Zi587cLi0dFoQA0275dYu4ytMEcWN6t6QN2FD95FBlGuZqmr206kKPCj73WkoKF7OfAgbavt5yRFQdhTqyA=
X-Received: by 2002:a25:2d18:0:b0:ba6:9e94:ed2f with SMTP id
 t24-20020a252d18000000b00ba69e94ed2fmr1493397ybt.25.1683791393895; Thu, 11
 May 2023 00:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230504092843.62493-1-sgarzare@redhat.com>
 <600fa0d6-5c01-c8e9-54d4-6d2695e92015@redhat.com>
In-Reply-To: <600fa0d6-5c01-c8e9-54d4-6d2695e92015@redhat.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Thu, 11 May 2023 09:49:42 +0200
Message-ID: <CAGxU2F7fW1K9g2vyEmUyVxrOUk0Y0=KB1dyAKdAoLwuENWLFGA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] block/blkio: add 'fd' option to
 virtio-blk-vhost-vdpa driver
To: Jonathon Jongsma <jjongsma@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, May 10, 2023 at 6:03=E2=80=AFPM Jonathon Jongsma <jjongsma@redhat.c=
om> wrote:
>
> On 5/4/23 4:28 AM, Stefano Garzarella wrote:
> > v2:
> > - added patch 01 to use monitor_fd_param() in the blkio module
> > - use monitor_fd_param() to parse the fd like vhost devices [Stefan]
> >
> > v1: https://lore.kernel.org/qemu-devel/20230502145050.224615-1-sgarzare=
@redhat.com/
> >
> > The virtio-blk-vhost-vdpa driver in libblkio 1.3.0 supports the new
> > 'fd' property. Let's expose this to the user, so the management layer
> > can pass the file descriptor of an already opened vhost-vdpa character
> > device. This is useful especially when the device can only be accessed
> > with certain privileges.
> >
> > Stefano Garzarella (2):
> >    stubs/monitor: add monitor_fd_param()
> >    block/blkio: add 'fd' option to virtio-blk-vhost-vdpa driver
> >
> >   qapi/block-core.json |  6 ++++-
> >   block/blkio.c        | 53 +++++++++++++++++++++++++++++++++++++++++++=
-
> >   stubs/monitor.c      |  6 +++++
> >   3 files changed, 63 insertions(+), 2 deletions(-)
> >
>
>
> I mentioned this briefly off-list, but I'm following up here just to
> provide a bit more visibility. From libvirt's point of view, it is
> actually much easier if we could pass the fd via the existing 'path'
> parameter (using /dev/fdset/N as the path, for example) due to how we
> construct the commandline for qemu. So if I get a vote, I would
> definitely vote for that approach over adding a new 'fd' property.

Thanks for pointing that out.
Since libvirt will be the main user of this feature, I think it is
fine to support fd passing via `path`, using qemu_open().

I'll send a v3 with that change.

Thanks,
Stefano


