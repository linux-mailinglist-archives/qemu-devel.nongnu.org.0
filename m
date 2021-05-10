Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5D3379352
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 18:04:04 +0200 (CEST)
Received: from localhost ([::1]:57860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg8O2-0004Kf-U6
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 12:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lg8J3-0008EE-Gs
 for qemu-devel@nongnu.org; Mon, 10 May 2021 11:58:53 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:60690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lg8J2-00013C-2U
 for qemu-devel@nongnu.org; Mon, 10 May 2021 11:58:53 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-xF9t8Ye-MUm4kxt_D1nlfA-1; Mon, 10 May 2021 11:58:49 -0400
X-MC-Unique: xF9t8Ye-MUm4kxt_D1nlfA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F33D5107ACE8;
 Mon, 10 May 2021 15:58:48 +0000 (UTC)
Received: from bahia.lan (ovpn-112-152.ams2.redhat.com [10.36.112.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F244360BD8;
 Mon, 10 May 2021 15:58:36 +0000 (UTC)
Date: Mon, 10 May 2021 17:58:35 +0200
From: Greg Kurz <groug@kaod.org>
To: <qemu-devel@nongnu.org>
Subject: Re: [for-6.1 v3 0/3] virtiofsd: Add support for FUSE_SYNCFS request
Message-ID: <20210510175835.3ee2d4cf@bahia.lan>
In-Reply-To: <20210510155539.998747-1-groug@kaod.org>
References: <20210510155539.998747-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: kvm@vger.kernel.org, "Michael S.
 Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Miklos Szeredi <miklos@szeredi.hu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Of course, I forgot to drop the for-6.1 prefix in git publish...

On Mon, 10 May 2021 17:55:36 +0200
Greg Kurz <groug@kaod.org> wrote:

> FUSE_SYNCFS allows the client to flush the host page cache.
> This isn't available in upstream linux yet, but the following
> tree can be used to test:
>=20
> https://gitlab.com/gkurz/linux/-/tree/virtio-fs-sync
>=20
> v3: - track submounts and do per-submount syncfs() (Vivek)
>     - based on new version of FUSE_SYNCFS (still not upstream)
>       https://listman.redhat.com/archives/virtio-fs/2021-May/msg00025.htm=
l
>=20
> v2: - based on new version of FUSE_SYNCFS
>       https://listman.redhat.com/archives/virtio-fs/2021-April/msg00166.h=
tml
>     - propagate syncfs() errors to client (Vivek)
>=20
> Greg Kurz (3):
>   Update linux headers to 5.13-rc1 + FUSE_SYNCFS
>   virtiofsd: Track mounts
>   virtiofsd: Add support for FUSE_SYNCFS request
>=20
>  .../infiniband/hw/vmw_pvrdma/pvrdma_verbs.h   |  35 -
>  include/standard-headers/drm/drm_fourcc.h     |  23 +-
>  include/standard-headers/linux/ethtool.h      | 109 ++-
>  include/standard-headers/linux/fuse.h         |  27 +-
>  include/standard-headers/linux/input.h        |   2 +-
>  include/standard-headers/linux/virtio_ids.h   |   2 +
>  .../standard-headers/rdma/vmw_pvrdma-abi.h    |   7 +
>  linux-headers/asm-generic/unistd.h            |  13 +-
>  linux-headers/asm-mips/unistd_n32.h           | 752 +++++++--------
>  linux-headers/asm-mips/unistd_n64.h           | 704 +++++++-------
>  linux-headers/asm-mips/unistd_o32.h           | 844 ++++++++---------
>  linux-headers/asm-powerpc/kvm.h               |   2 +
>  linux-headers/asm-powerpc/unistd_32.h         | 857 +++++++++---------
>  linux-headers/asm-powerpc/unistd_64.h         | 801 ++++++++--------
>  linux-headers/asm-s390/unistd_32.h            |   5 +
>  linux-headers/asm-s390/unistd_64.h            |   5 +
>  linux-headers/asm-x86/kvm.h                   |   1 +
>  linux-headers/asm-x86/unistd_32.h             |   5 +
>  linux-headers/asm-x86/unistd_64.h             |   5 +
>  linux-headers/asm-x86/unistd_x32.h            |   5 +
>  linux-headers/linux/kvm.h                     | 134 +++
>  linux-headers/linux/userfaultfd.h             |  36 +-
>  linux-headers/linux/vfio.h                    |  35 +
>  tools/virtiofsd/fuse_lowlevel.c               |  11 +
>  tools/virtiofsd/fuse_lowlevel.h               |  12 +
>  tools/virtiofsd/passthrough_ll.c              |  80 +-
>  tools/virtiofsd/passthrough_seccomp.c         |   1 +
>  27 files changed, 2465 insertions(+), 2048 deletions(-)
>=20


