Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC06379333
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 17:57:34 +0200 (CEST)
Received: from localhost ([::1]:46512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg8Hl-0004rV-7G
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 11:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lg8G5-0002qW-Pu
 for qemu-devel@nongnu.org; Mon, 10 May 2021 11:55:50 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:41394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lg8G4-0000eM-5o
 for qemu-devel@nongnu.org; Mon, 10 May 2021 11:55:49 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-Dv24lgUpNayROI3ptof5aQ-1; Mon, 10 May 2021 11:55:44 -0400
X-MC-Unique: Dv24lgUpNayROI3ptof5aQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 537B3100A61E;
 Mon, 10 May 2021 15:55:43 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-152.ams2.redhat.com [10.36.112.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D638819C44;
 Mon, 10 May 2021 15:55:40 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [for-6.1 v3 0/3] virtiofsd: Add support for FUSE_SYNCFS request
Date: Mon, 10 May 2021 17:55:36 +0200
Message-Id: <20210510155539.998747-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
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
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 virtio-fs@redhat.com, Miklos Szeredi <miklos@szeredi.hu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FUSE_SYNCFS allows the client to flush the host page cache.=0D
This isn't available in upstream linux yet, but the following=0D
tree can be used to test:=0D
=0D
https://gitlab.com/gkurz/linux/-/tree/virtio-fs-sync=0D
=0D
v3: - track submounts and do per-submount syncfs() (Vivek)=0D
    - based on new version of FUSE_SYNCFS (still not upstream)=0D
      https://listman.redhat.com/archives/virtio-fs/2021-May/msg00025.html=
=0D
=0D
v2: - based on new version of FUSE_SYNCFS=0D
      https://listman.redhat.com/archives/virtio-fs/2021-April/msg00166.htm=
l=0D
    - propagate syncfs() errors to client (Vivek)=0D
=0D
Greg Kurz (3):=0D
  Update linux headers to 5.13-rc1 + FUSE_SYNCFS=0D
  virtiofsd: Track mounts=0D
  virtiofsd: Add support for FUSE_SYNCFS request=0D
=0D
 .../infiniband/hw/vmw_pvrdma/pvrdma_verbs.h   |  35 -=0D
 include/standard-headers/drm/drm_fourcc.h     |  23 +-=0D
 include/standard-headers/linux/ethtool.h      | 109 ++-=0D
 include/standard-headers/linux/fuse.h         |  27 +-=0D
 include/standard-headers/linux/input.h        |   2 +-=0D
 include/standard-headers/linux/virtio_ids.h   |   2 +=0D
 .../standard-headers/rdma/vmw_pvrdma-abi.h    |   7 +=0D
 linux-headers/asm-generic/unistd.h            |  13 +-=0D
 linux-headers/asm-mips/unistd_n32.h           | 752 +++++++--------=0D
 linux-headers/asm-mips/unistd_n64.h           | 704 +++++++-------=0D
 linux-headers/asm-mips/unistd_o32.h           | 844 ++++++++---------=0D
 linux-headers/asm-powerpc/kvm.h               |   2 +=0D
 linux-headers/asm-powerpc/unistd_32.h         | 857 +++++++++---------=0D
 linux-headers/asm-powerpc/unistd_64.h         | 801 ++++++++--------=0D
 linux-headers/asm-s390/unistd_32.h            |   5 +=0D
 linux-headers/asm-s390/unistd_64.h            |   5 +=0D
 linux-headers/asm-x86/kvm.h                   |   1 +=0D
 linux-headers/asm-x86/unistd_32.h             |   5 +=0D
 linux-headers/asm-x86/unistd_64.h             |   5 +=0D
 linux-headers/asm-x86/unistd_x32.h            |   5 +=0D
 linux-headers/linux/kvm.h                     | 134 +++=0D
 linux-headers/linux/userfaultfd.h             |  36 +-=0D
 linux-headers/linux/vfio.h                    |  35 +=0D
 tools/virtiofsd/fuse_lowlevel.c               |  11 +=0D
 tools/virtiofsd/fuse_lowlevel.h               |  12 +=0D
 tools/virtiofsd/passthrough_ll.c              |  80 +-=0D
 tools/virtiofsd/passthrough_seccomp.c         |   1 +=0D
 27 files changed, 2465 insertions(+), 2048 deletions(-)=0D
=0D
--=20=0D
2.26.3=0D
=0D


