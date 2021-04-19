Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8E13646DD
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 17:16:02 +0200 (CEST)
Received: from localhost ([::1]:52936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYVd3-0003xZ-LJ
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 11:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lYVZQ-0000nt-QC
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:12:17 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:32646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lYVZO-0008AB-ON
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:12:16 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-YtWCrPicMbmJTQp1742Lag-1; Mon, 19 Apr 2021 11:11:59 -0400
X-MC-Unique: YtWCrPicMbmJTQp1742Lag-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C9DD802B7E;
 Mon, 19 Apr 2021 15:11:58 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-134.ams2.redhat.com [10.36.112.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D48335C1CF;
 Mon, 19 Apr 2021 15:11:42 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [for-6.1 0/2] virtiofsd: Add support for FUSE_SYNCFS request
Date: Mon, 19 Apr 2021 17:11:40 +0200
Message-Id: <20210419151142.276439-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Miklos Szeredi <miklos@szeredi.hu>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FUSE_SYNCFS allows the client to flush the host page cache.=0D
This isn't available in upstream linux yet, but the following=0D
tree can be used to test:=0D
=0D
https://gitlab.com/gkurz/linux/-/tree/virtio-fs-sync=0D
=0D
Greg Kurz (2):=0D
  Update linux headers to 5.12-rc8 + FUSE_SYNCFS=0D
  virtiofsd: Add support for FUSE_SYNCFS request=0D
=0D
 include/standard-headers/drm/drm_fourcc.h     | 23 ++++-=0D
 include/standard-headers/linux/ethtool.h      | 54 ++++++-----=0D
 include/standard-headers/linux/fuse.h         | 14 ++-=0D
 include/standard-headers/linux/input.h        |  2 +-=0D
 .../standard-headers/rdma/vmw_pvrdma-abi.h    |  7 ++=0D
 linux-headers/asm-generic/unistd.h            |  4 +-=0D
 linux-headers/asm-mips/unistd_n32.h           |  1 +=0D
 linux-headers/asm-mips/unistd_n64.h           |  1 +=0D
 linux-headers/asm-mips/unistd_o32.h           |  1 +=0D
 linux-headers/asm-powerpc/kvm.h               |  2 +=0D
 linux-headers/asm-powerpc/unistd_32.h         |  1 +=0D
 linux-headers/asm-powerpc/unistd_64.h         |  1 +=0D
 linux-headers/asm-s390/unistd_32.h            |  1 +=0D
 linux-headers/asm-s390/unistd_64.h            |  1 +=0D
 linux-headers/asm-x86/kvm.h                   |  1 +=0D
 linux-headers/asm-x86/unistd_32.h             |  1 +=0D
 linux-headers/asm-x86/unistd_64.h             |  1 +=0D
 linux-headers/asm-x86/unistd_x32.h            |  1 +=0D
 linux-headers/linux/kvm.h                     | 89 +++++++++++++++++++=0D
 linux-headers/linux/vfio.h                    | 27 ++++++=0D
 tools/virtiofsd/fuse_lowlevel.c               | 19 ++++=0D
 tools/virtiofsd/fuse_lowlevel.h               | 13 +++=0D
 tools/virtiofsd/passthrough_ll.c              | 29 ++++++=0D
 tools/virtiofsd/passthrough_seccomp.c         |  1 +=0D
 24 files changed, 268 insertions(+), 27 deletions(-)=0D
=0D
--=20=0D
2.26.3=0D
=0D


