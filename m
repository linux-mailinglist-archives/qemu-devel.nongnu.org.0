Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD9F3DBBAE
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 17:07:37 +0200 (CEST)
Received: from localhost ([::1]:34000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9U6q-0004ec-UJ
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 11:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m9U28-0005W9-Nn
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 11:02:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m9U27-0007mf-2H
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 11:02:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627657362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lQcM64hAuUDv7GCUNjb+2qmXNY5NNS7r9NBDlHZyuFc=;
 b=GedhKwzwf0d713ZJoUgwQQt4rewOfttz3tXa9T/nA2TZEpnSAdWDsUJ6dCJAnDc3NXPhBM
 ue5c/G8MO9HJQ/okrVYo0utPKx8mfyWFjIG8Iic1mt1in9nx+OnRyg3KO/fvSnwM/HKyEl
 RXKuy54kOcxISi/17DDcWaflm7z8k+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-KDiVmklBPEK15V2qw3whrg-1; Fri, 30 Jul 2021 11:02:40 -0400
X-MC-Unique: KDiVmklBPEK15V2qw3whrg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B7B6804167
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 15:01:44 +0000 (UTC)
Received: from localhost (unknown [10.39.193.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9597518A50;
 Fri, 30 Jul 2021 15:01:36 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v3 00/10] virtiofsd: Allow using file handles instead of
 O_PATH FDs
Date: Fri, 30 Jul 2021 17:01:24 +0200
Message-Id: <20210730150134.216126-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

v1 cover letter for an overview:
https://listman.redhat.com/archives/virtio-fs/2021-June/msg00033.html

v2 cover letter:
https://listman.redhat.com/archives/virtio-fs/2021-June/msg00074.html

For v3, at first I attempted to have errors related to file handle
generation (name_to_handle_at()) be returned to the guest unless they
are cases where file name generation is simply not supported, and only
then do a fallback to an O_PATH FD, as Vivek has suggested.

However, I found that to be rather complicated.  (Always falling back is
just simpler.)  Furthermore, because we believe that name_to_handle_at()
can rarely fail except for EOPNOTSUPP, there should be little difference
in practice.

Therefore, in v3, I kept the v2 model of always falling back to an
O_PATH FD when an error occurred during handle generation.

What did change in v3 is the following:
- I added patch 1, because f1aa1774dfb happened in the meantime, and
  this is basically what we did for virtiofsd-rs in the form of
  31e7ac63944 (virtiofsd-rs commit hash)

- Patch 4: In lookup_name(), I noticed that I failed to invoke
  lo_inode_put() to match the lo_inode() from the beginning of the
  function in all error paths.  Fixed by adding a common error path.

- Patch 6: Mostly contextual rebase conflicts (partly because of patch
  1), but also one functional change: I Dropped the `assert(fd >= 0)`
  under `if (open_inode)` in lo_setxattr(), because `fd` is dropped by
  this patch (and `inode_fd` is used regardless of the value of
  `open_inode` we can’t assert anything similar on it).

- Patch 8:
  - Fixed the condition to reject results found by st_ino lookup.
    - st_ino on its own is only a valid identifier/key if we have an
      O_PATH fd for its respective lo_inode, because otherwise the inode
      may be unlinked and its st_ino might be reused by some new inode
    - It does not matter whether lo_find()’s caller has supplied a file
      handle for a prior lookup by handle or not, so drop that part of
      the condition
    - Semantically, it does not matter whether the lo_inode has a file
      handle or not – what matters is whether it has an O_PATH fd or
      not.  (The two are linked by a `handle <=> !fd` condition, so that
      part wasn’t technically wrong, just semantically.)
    - In accordance with the last point, I rewrote the comment
      explaining why we have to reject such results.
  - Rebase conflict in lookup_name() because of the fix in patch 4

- Patch 9:
  - Non-functional change in lo_do_lookup() to separate the
    get_file_handle()/openat() part from the do_statx() calls (and have
    the do_statx() calls be side by side) – as a side effect, this makes
    the diff to master slightly smaller.
  - Rebase conflict in lookup_name() because of the fix in patch 4

- Patch 10:
  - Rebase conflict in lookup_name() because of the fix in patch 4


Max Reitz (10):
  virtiofsd: Limit setxattr()'s creds-dropped region
  virtiofsd: Add TempFd structure
  virtiofsd: Use lo_inode_open() instead of openat()
  virtiofsd: Add lo_inode_fd() helper
  virtiofsd: Let lo_fd() return a TempFd
  virtiofsd: Let lo_inode_open() return a TempFd
  virtiofsd: Add lo_inode.fhandle
  virtiofsd: Add inodes_by_handle hash table
  virtiofsd: Optionally fill lo_inode.fhandle
  virtiofsd: Add lazy lo_do_find()

 tools/virtiofsd/helper.c              |   3 +
 tools/virtiofsd/passthrough_ll.c      | 869 +++++++++++++++++++++-----
 tools/virtiofsd/passthrough_seccomp.c |   2 +
 3 files changed, 720 insertions(+), 154 deletions(-)

-- 
2.31.1


