Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 759982A2FA5
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Nov 2020 17:22:32 +0100 (CET)
Received: from localhost ([::1]:53448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZcbH-00020U-Fh
	for lists+qemu-devel@lfdr.de; Mon, 02 Nov 2020 11:22:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kZcYq-0007fi-VR
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 11:20:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kZcYp-0007ZP-17
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 11:20:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604333997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lshLmEcwZ3wHcSQa+aToKy4Z6S2HXHwQJy2OzHQOtrw=;
 b=h+pkROFh5Vc3H0c6xBeKA3ZKEUOdfYnt/SNRJ6NLxLDagh4AjA8cdbsA+RYYoPvzUeAjIo
 UGNxi3h6D3uRdkUtM13N7G4oa/BU6UM2WuWPYvLz8ywM8E+UdBhvVeWMaj7YHJU5Xsyme1
 73rqNeUqfpxtQOWknMRyD0D/HgCkhag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-HrtLBSafPdqor99GMzpfcA-1; Mon, 02 Nov 2020 11:19:42 -0500
X-MC-Unique: HrtLBSafPdqor99GMzpfcA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E42DA192CC75
 for <qemu-devel@nongnu.org>; Mon,  2 Nov 2020 16:19:33 +0000 (UTC)
Received: from localhost (unknown [10.40.194.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B23626345;
 Mon,  2 Nov 2020 16:19:01 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/7] virtiofsd: Announce submounts to the guest
Date: Mon,  2 Nov 2020 17:18:52 +0100
Message-Id: <20201102161859.156603-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 03:02:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Miklos Szeredi <mszeredi@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RFC: https://www.redhat.com/archives/virtio-fs/2020-May/msg00024.html
v1: https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg03598.html
v2: https://lists.nongnu.org/archive/html/qemu-devel/2020-10/msg09117.html

Branch: https://github.com/XanClic/qemu.git virtiofs-submounts-v4
Branch: https://git.xanclic.moe/XanClic/qemu.git virtiofs-submounts-v4


Hi,

In an effort to cut this cover letter shorter, I’ll defer to the cover
letter of v2 linked above concerning the general description of this
series, and limit myself to describing the differences from v2:


v3:
- Patch 7:
  - Replace specific has_passwordless_sudo() function by a generic
    has_cmd() function that can check for any shell command whether it
    works or not

  - Let this function catch exceptions, too, so if sudo is not present
    altogether, the test doesn’t fail but is skipped as intended
    [Eduardo]

  - (Add has_cmds() to run multiple instances of has_cmd() in a
    decorator)

  - Skip the test not only if “sudo -n true” doesn’t work, but also
    check for ssh-keygen, bash, losetup, mkfs.xfs, and mount, which are
    some other tools we need that might not be present on the host


git-backport-diff against v2:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/7:[----] [--] 'virtiofsd: Check FUSE_SUBMOUNTS'
002/7:[----] [--] 'virtiofsd: Add attr_flags to fuse_entry_param'
003/7:[----] [--] 'meson.build: Check for statx()'
004/7:[----] [--] 'virtiofsd: Add mount ID to the lo_inode key'
005/7:[----] [--] 'virtiofsd: Announce sub-mount points'
006/7:[----] [--] 'tests/acceptance/boot_linux: Accept SSH pubkey'
007/7:[0042] [FC] 'tests/acceptance: Add virtiofs_submounts.py'


Max Reitz (7):
  virtiofsd: Check FUSE_SUBMOUNTS
  virtiofsd: Add attr_flags to fuse_entry_param
  meson.build: Check for statx()
  virtiofsd: Add mount ID to the lo_inode key
  virtiofsd: Announce sub-mount points
  tests/acceptance/boot_linux: Accept SSH pubkey
  tests/acceptance: Add virtiofs_submounts.py

 meson.build                                   |  16 +
 tools/virtiofsd/fuse_common.h                 |   7 +
 tools/virtiofsd/fuse_lowlevel.h               |   5 +
 tools/virtiofsd/fuse_lowlevel.c               |   5 +
 tools/virtiofsd/helper.c                      |   1 +
 tools/virtiofsd/passthrough_ll.c              | 117 ++++++-
 tools/virtiofsd/passthrough_seccomp.c         |   1 +
 tests/acceptance/boot_linux.py                |  13 +-
 tests/acceptance/virtiofs_submounts.py        | 321 ++++++++++++++++++
 .../virtiofs_submounts.py.data/cleanup.sh     |  46 +++
 .../guest-cleanup.sh                          |  30 ++
 .../virtiofs_submounts.py.data/guest.sh       | 138 ++++++++
 .../virtiofs_submounts.py.data/host.sh        | 127 +++++++
 13 files changed, 811 insertions(+), 16 deletions(-)
 create mode 100644 tests/acceptance/virtiofs_submounts.py
 create mode 100644 tests/acceptance/virtiofs_submounts.py.data/cleanup.sh
 create mode 100644 tests/acceptance/virtiofs_submounts.py.data/guest-cleanup.sh
 create mode 100644 tests/acceptance/virtiofs_submounts.py.data/guest.sh
 create mode 100644 tests/acceptance/virtiofs_submounts.py.data/host.sh

-- 
2.26.2


