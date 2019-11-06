Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF59F12EC
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Nov 2019 10:52:38 +0100 (CET)
Received: from localhost ([::1]:54562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSHzR-0007Rh-R2
	for lists+qemu-devel@lfdr.de; Wed, 06 Nov 2019 04:52:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34234)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1iSHyO-0006E9-1S
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 04:51:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1iSHyM-00044O-KE
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 04:51:31 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29879
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1iSHyM-00044K-GR
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 04:51:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573033890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H07O5MhifX+SyOo7deyM1HCJTFRz437wQNK/NQ47qqU=;
 b=hKBNrMws6ij8TnN6C9Ma1mICMPd+8bJ5zXVLTzfeCQkAgouX2vab15YOd5Zih6B/2muCQX
 N6Z2xeq6LCvAV3x4uAzJ7fxdMzCH38H75929DvG4gkuLWxaW2C8pjXpE7X2R7Jaa+o4Peb
 tr12v5vY+REVH26Mex6vBDZnfLziKxI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-D2z0XxgJPDqcbsTxn64f0Q-1; Wed, 06 Nov 2019 04:51:26 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D64A107ACC3;
 Wed,  6 Nov 2019 09:51:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-69.ams2.redhat.com
 [10.36.116.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C049627064;
 Wed,  6 Nov 2019 09:51:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CEB7E17535; Wed,  6 Nov 2019 10:51:22 +0100 (CET)
Date: Wed, 6 Nov 2019 10:51:22 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: guest / host buffer sharing ...
Message-ID: <20191106095122.jju7eo57scfoat6a@sirius.home.kraxel.org>
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <20191106084344.GB189998@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20191106084344.GB189998@stefanha-x1.localdomain>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: D2z0XxgJPDqcbsTxn64f0Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: geoff@hostfission.com, virtio-dev@lists.oasis-open.org,
 Alex Lau <alexlau@chromium.org>, Alexandre Courbot <acourbot@chromium.org>,
 qemu-devel@nongnu.org, Tomasz Figa <tfiga@chromium.org>,
 Keiichi Watanabe <keiichiw@chromium.org>,
 David Stevens <stevensd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
 Dylan Reid <dgreid@chromium.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Dmitry Morozov <dmitry.morozov@opensynergy.com>,
 Pawel Osciak <posciak@chromium.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > Reason is:  Meanwhile I'm wondering whenever "just use virtio-gpu
> > resources" is really a good answer for all the different use cases
> > we have collected over time.  Maybe it is better to have a dedicated
> > buffer sharing virtio device?  Here is the rough idea:
>=20
> My concern is that buffer sharing isn't a "device".  It's a primitive
> used in building other devices.  When someone asks for just buffer
> sharing it's often because they do not intend to upstream a
> specification for their device.

Well, "vsock" isn't a classic device (aka nic/storage/gpu/...) either.
It is more a service to allow communication between host and guest

That buffer sharing device falls into the same category.  Maybe it even
makes sense to build that as virtio-vsock extension.  Not sure how well
that would work with the multi-transport architecture of vsock though.

> If this buffer sharing device's main purpose is for building proprietary
> devices without contributing to VIRTIO, then I don't think it makes
> sense for the VIRTIO community to assist in its development.

One possible use case would be building a wayland proxy, using vsock for
the wayland protocol messages and virtio-buffers for the shared buffers
(wayland client window content).

It could also simplify buffer sharing between devices (feed decoded
video frames from decoder to gpu), although in that case it is less
clear that it'll actually simplify things because virtio-gpu is
involved anyway.

We can't prevent people from using that for proprietary stuff (same goes
for vsock).

There is the option to use virtio-gpu instead, i.e. add support to qemu
to export dma-buf handles for virtio-gpu resources to other processes
(such as a wayland proxy).  That would provide very similar
functionality (and thereby create the same loophole).

> VIRTIO recently gained a shared memory resource concept for access to
> host memory.  It is being used in virtio-pmem and virtio-fs (and
> virtio-gpu?).

virtio-gpu is in progress still unfortunately (all kinds of fixes for
the qemu drm drivers and virtio-gpu guest driver refactoring kept me
busy for quite a while ...).

> If another flavor of shared memory is required it can be
> added to the spec and new VIRTIO device types can use it.  But it's not
> clear why this should be its own device.

This is not about host memory, buffers are in guest ram, everything else
would make sharing those buffers between drivers inside the guest (as
dma-buf) quite difficult.

> My question would be "what is the actual problem you are trying to
> solve?".

Typical use cases center around sharing graphics data between guest
and host.

cheers,
  Gerd


