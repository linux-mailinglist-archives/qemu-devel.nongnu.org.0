Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EB32DB13D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 17:23:35 +0100 (CET)
Received: from localhost ([::1]:50936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpD6s-00082g-TP
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 11:23:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangjiachen.jaycee@bytedance.com>)
 id 1kpD53-0006h8-St
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 11:21:41 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:34482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangjiachen.jaycee@bytedance.com>)
 id 1kpD4y-00036o-1V
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 11:21:38 -0500
Received: by mail-pl1-x644.google.com with SMTP id t6so11301829plq.1
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 08:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bqpP+QK4GIBCdeAY8wBqv5k9tOk5+xF27b2NprepG5o=;
 b=hB7RvfOTd2iQQz542/4Thlmv/jt2Hxn7Ck7mctLiZ4b7a1dMhJZS5PqUBiAjNcDZWr
 12W2TfHjbaU01IcOHnbpVf07esRgsB0heZBd25H3D0G5XdOordFSmv1BzMqhTpR4CiAh
 kxXcUUWUL46rATlG0QL5iQJQSqidSq5dCHlNwXAquniWfgL/i7D9tm914yITLzI/ciZk
 VIl5bYBtuL+eu5lD8NDaIP1f8zb/AHJov2ccrV9gDtqdFWMrA7WzuKMUYASK9OWbGJOn
 ZZJi5jNolh3+8jJxYISv9Zxrhk8sfftkVv4HSYuKbDdLPNyWvkClZiI7Oe4WYr95YXsK
 TGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bqpP+QK4GIBCdeAY8wBqv5k9tOk5+xF27b2NprepG5o=;
 b=BFa4m4Txqw3bJeBe4kaC9ZXmJj+ssk/TOaPvmqAD6SHOC+PwDfFJK+bMDuHgoSNPXq
 3psWya3ZlVWHhPeY9nMbvMKP7nYOyIwPmx/flnrVlfcqWDsy8tzdI4bbgF26myZT8fVn
 SSft4VH5CI9q45i1G7Cvvqb6qL4av92kMOXIn6l9+s2sN2r5dMAimp1EgW1Ri0M2r7H5
 AvC5w72ZnMM9a4sf3tpci35CQOd8OXKcvuznbghabxEbe4NQawZXzm4Kpnt2eUHjh0v2
 nhCIhIEYW3rW6/2QR6s9cX95FwhpSIMn3j3uelowdMZZNsO6kwb2cm3BRxZuAlla8t0c
 l/Hg==
X-Gm-Message-State: AOAM531QGPXxlDnSGXbsZPqI9YeXCcckaO+geuuhKILLDaqCTwdJlBdV
 wvRGXVhDTepfN4eeGYQ6fUDSSA==
X-Google-Smtp-Source: ABdhPJzeal4ve2HHD3wgW3BSa4WpLVlXl+UTN7mBcZagwN6vKM6foCbpXcrm28MWgOpUiLKN0UfgBw==
X-Received: by 2002:a17:90a:fe8:: with SMTP id
 95mr30047020pjz.114.1608049293347; 
 Tue, 15 Dec 2020 08:21:33 -0800 (PST)
Received: from localhost.localdomain ([139.177.225.246])
 by smtp.gmail.com with ESMTPSA id c10sm24273508pfo.159.2020.12.15.08.21.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Dec 2020 08:21:31 -0800 (PST)
From: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
To: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Xie Yongji <xieyongji@bytedance.com>
Subject: [RFC PATCH 0/9] Support for Virtio-fs daemon crash reconnection
Date: Wed, 16 Dec 2020 00:21:10 +0800
Message-Id: <20201215162119.27360-1-zhangjiachen.jaycee@bytedance.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=zhangjiachen.jaycee@bytedance.com; helo=mail-pl1-x644.google.com
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
Cc: virtio-fs@redhat.com, Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, all

We implement virtio-fs crash reconnection in this patchset. The crash
reconnection of virtiofsd here is completely transparent to guest, no
remount in guest is needed, even the inflight requests can be handled
normally after reconnection. We are looking forward to any comments. 

Thanks,
Jiachen


OVERVIEW:

To support virtio-fs crash reconnection, we need to support the recovery
of 1) inflight FUSE request, and 2) virtiofsd internal status information.

Fortunately, QEMU's vhost-user reconnection framework already supports
inflight I/O tracking by using VHOST_USER_GET_INFLIGHT_FD and
VHOST_USER_SET_INFLIGHT_FD (see 5ad204bf2 and 5f9ff1eff for details).
As the FUSE requests are transferred by virtqueue I/O requests, by using
the vhost-user inflight I/O tracking, we can recover the inflight FUSE
requests.

To support virtiofsd internal status recovery, we introduce 4 new
vhost-user message types. As shown in the following diagram, two of them
are used to persist shared lo_maps and opened fds to QEMU, the other two
message types are used to restore the status when reconnecting.

                               VHOST_USER_SLAVE_SHM
                               VHOST_USER_SLAVE_FD
    +--------------+       Persist       +--------------------+
    |              <---------------------+                    |
    |     QEMU     |                     |  Virtio-fs Daemon  |
    |              +--------------------->                    |
    +--------------+       Restore       +--------------------+
            VHOST_USER_SET_SHM
            VHOST_USER_SET_FD

Although the 4 newly added message types are to support virtiofsd
reconnection in this patchset, it might be potential in other situation.
So we keep in mind to make them more general when add them to vhost
related source files. VHOST_USER_SLAVE_SHM and VHOST_USER_SET_SHM can be
used for memory sharing between a vhost-user daemon and QEMU,
VHOST_USER_SLAVE_FD and VHOST_USER_SET_FD would be useful if we want to
shared opened fds between QEMU process and vhost-user daemon process.


USAGE and NOTES:

- The commits are rebased to a recent QEMU master commit b4d939133dca0fa2b.

- ",reconnect=1" should be added to the "-chardev socket" of vhost-user-fs-pci
in the QEMU command line, for example:

    qemu-system-x86_64 ... \
    -chardev socket,id=char0,path=/tmp/vhostqemu,reconnect=1 \
    -device vhost-user-fs-pci,queue-size=1024,chardev=char0,tag=myfs \
    ...

- We add new options for virtiofsd to enable or disable crash reconnection.
And some options are not supported by crash reconnection. So add following
options to virtiofsd to enable reconnection:

    virtiofsd ... -o reconnect -o no_mount_ns -o no_flock -o no_posix_lock
    -o no_xattr ...

- The reasons why virtiofsd-side locking, extended attributes, and mount
namespace are not supported is explained in the commit message of the 6th
patch (virtiofsd: Add two new options for crash reconnection).

- The 9th patch is a work-around that will not affect the overall correctness.
We remove the qsort related codes because we found that when resubmit_num is
larger than 64, seccomp will kill the virtiofsd process.

- Support for dax version virtiofsd is very possible and requires almost no
additional change to this patchset.


Jiachen Zhang (9):
  vhost-user-fs: Add support for reconnection of vhost-user-fs backend
  vhost: Add vhost-user message types for sending shared memory and file
    fds
  vhost-user-fs: Support virtiofsd crash reconnection
  libvhost-user: Add vhost-user message types for sending shared memory
    and file fds
  virtiofsd: Convert the struct lo_map array to a more flatten layout
  virtiofsd: Add two new options for crash reconnection
  virtiofsd: Persist/restore lo_map and opened fds to/from QEMU
  virtiofsd: Ensure crash consistency after reconnection
  virtiofsd: (work around) Comment qsort in inflight I/O tracking

 contrib/libvhost-user/libvhost-user.c | 106 +++-
 contrib/libvhost-user/libvhost-user.h |  70 +++
 docs/interop/vhost-user.rst           |  41 ++
 hw/virtio/vhost-user-fs.c             | 334 ++++++++++-
 hw/virtio/vhost-user.c                | 123 ++++
 hw/virtio/vhost.c                     |  42 ++
 include/hw/virtio/vhost-backend.h     |   6 +
 include/hw/virtio/vhost-user-fs.h     |  16 +-
 include/hw/virtio/vhost.h             |  42 ++
 tools/virtiofsd/fuse_lowlevel.c       |  24 +-
 tools/virtiofsd/fuse_virtio.c         |  44 ++
 tools/virtiofsd/fuse_virtio.h         |   1 +
 tools/virtiofsd/helper.c              |   9 +
 tools/virtiofsd/passthrough_helpers.h |   2 +-
 tools/virtiofsd/passthrough_ll.c      | 830 ++++++++++++++++++--------
 tools/virtiofsd/passthrough_seccomp.c |   1 +
 16 files changed, 1413 insertions(+), 278 deletions(-)

-- 
2.20.1


