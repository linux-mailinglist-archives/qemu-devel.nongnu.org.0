Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 730B940D4CC
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 10:43:39 +0200 (CEST)
Received: from localhost ([::1]:41270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQmza-0005um-Eo
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 04:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQmx1-0003yi-Kt
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 04:40:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQmwz-0003zc-Nx
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 04:40:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631781656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gJCw2vQbjmLnPTawX37vNeGavFSb9s1kg2sGz5OlmQg=;
 b=I+uf34dt7az3JwLKppxy0DB+YBxgRCDlpLy61i4Hup7VkK1D3C9l1gkeGOBafaNPdKOWDn
 gWeRJdElTDRL2z6B6BqpRcmTRM000rBTdPS771WPvci7xT8haXXgy96gN5LgEIawSOPMcL
 9iEAda0UzhqMmacRz7G4SQpF8XEy0cI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-KtbL96P2MJWR7zmP7gbo6g-1; Thu, 16 Sep 2021 04:40:55 -0400
X-MC-Unique: KtbL96P2MJWR7zmP7gbo6g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9682380124F
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:40:54 +0000 (UTC)
Received: from localhost (unknown [10.39.192.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E6B260C2B;
 Thu, 16 Sep 2021 08:40:46 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v4 00/12] virtiofsd: Allow using file handles instead of
 O_PATH FDs
Date: Thu, 16 Sep 2021 10:40:33 +0200
Message-Id: <20210916084045.31684-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

v1 cover letter for an overview:
https://listman.redhat.com/archives/virtio-fs/2021-June/msg00033.html

v2 cover letter:
https://listman.redhat.com/archives/virtio-fs/2021-June/msg00074.html

v3 cover letter:
https://listman.redhat.com/archives/virtio-fs/2021-July/msg00050.html


Here in v4, there are two main changes:

First, for turning a mount ID into a mount FD, we no longer use the
first inode that’s looked up on the respective mount, but instead look
into /proc/self/mountinfo to get the mount’s root directory and open
that.  Wel also refcount mount FDs now.

In theory, the advantage is that before the mount root directory can be
deleted, all files on the mount must be closed (and deleted), so the
refcounting will lead to the mount FD being closed.  Then, deleting the
mount root would actually result in the inode being deleted, and so with
inotify, the guest could receive a notification about it.

In practice, this is still a mount root (on the host), so it cannot be
deleted (rmdir returns EBUSY).  But that’s effectively just as well,
because this way we open a mount FD that cannot be deleted, and so, we
won’t have to worry about missing guest notifications.

Note that unmounting the virtiofs mount in the guest will lead to all
mount FDs correctly being closed, so the refcounting does work.


Second, I’ve renamed the TempFd objects to reflect what kind of FDs they
contain; i.e. they’re no longer called “inode_fd” or “dir_fd”, but
“path_fd”, “rw_fd”, or “dir_path_fd” instead.
p


Minor changes:
- -o inode_file_handles now auto-adds +dac_read_search to modcaps
- Some fixes


(Quick note: I’ll be on PTO from Sep 20 to Oct 3, so I’ll only be able
to respond to potential reviews after then.)


Exact changes per patch:

Patch 1:
- Added, we want to use the respective mount point as a mount FD, and we
  have to read /proc/self/mountinfo to translate mount IDs to mount
  points

Patch 2:
- Moved the FCHDIR_NOFAIL(lo->root.fd) (changing the CWD back to what it
  was) into the cleanup path, and added a bool `changed_cwd` to keep
  track of when we need to invoke it
- Dropped `open_inode` (`changed_cwd` kind of makes it obsolete)

Patch 3:
- Added temp_fd_copy() to (shallow-)copy a TempFd

Patch 4:
- Forgot an lo_inode_put() in lo_opendir()’s successful return path
- lo_setxattr(): Moved procname[] into the block where it’s used (now
  that it’s generated and used within a single `else` block)

Patch 5:
- Give TempFds a name that reflects what kind of FDs they are, e.g.
  `path_fd` instead of `inode_fd`
- lo_link(): Don’t overwrite errno for the error path, but store such
  values in saverr instead and add a new error path label below the
  existing `saverr = errno;`
- xattr functions: Moved TempFds into local blocks where they are
  actually used (to generate a filename in /proc/self/fd)
  (with the renaming of `inode_fd` to `path_fd`, we are going to need
  distinct variables for both conditional blocks here – one with an
  O_RDONLY FD (`rd_fd`), and one with an O_PATH FD (`path_fd`))

Patch 6:
- Like in patch 5, give TempFds a name to reflect what they are

Patch 7:
- Like in patches 5 and 6, give TempFds a name to reflect what they are
- `lo_setattr` thus has two TempFds now, which sometimes are the same FD
  (and we use `temp_fd_copy()` to copy one into the other)
- lo_opendir(): Close the FD if `fdopendir()` failed

Patch 8:
- Added: We want the mount FD collection to be in lo_data instead of in
  a static global variable, so we need to pass lo_data wherever we might
  need a mount FD

Patch 9:
- Put mount_fds and mount_fds_lock into lo_data
- Have mount_fds values be lo_mount_fd objects (FD + refcount) instead
  of just pure FDs
- Refcount mount FDs (so releasing a file handle now has to go through a
  dedicated function)
- Having a file handle and an O_PATH FD in an lo_inode object is no
  longer mutually exclusive

Patch 10:
- Destroying the inodes_by_handle hash map should depend on whether
  inodes_by_handle is non-NULL, not whether inodes_by_ids is non-NULL
  (i.e. fixed a code typo)

Patch 11:
- Auto-add CAP_DAC_READ_SEARCH with -o inode_file_handles instead of
  requiring the user to do so
- get_file_handle(): Use /proc/self/mountinfo to get a mount’s root
  point and open that as the mount FD instead of using the first inode
  that’s looked up on that mount
- Refcount mount FDs
- Have get_file_handle() return a file handle even if creating a
  corresponding mount FD failed, and so the file handle will not be
  open-able; we can still use this file handle for lookups

Patch 12:
- Rebase conflicts


git-backport-diff against v3:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/12:[down] 'virtiofsd: Keep /proc/self/mountinfo open'
002/12:[0012] [FC] 'virtiofsd: Limit setxattr()'s creds-dropped region'
003/12:[0014] [FC] 'virtiofsd: Add TempFd structure'
004/12:[0004] [FC] 'virtiofsd: Use lo_inode_open() instead of openat()'
005/12:[0109] [FC] 'virtiofsd: Add lo_inode_fd() helper'
006/12:[0030] [FC] 'virtiofsd: Let lo_fd() return a TempFd'
007/12:[0076] [FC] 'virtiofsd: Let lo_inode_open() return a TempFd'
008/12:[down] 'virtiofsd: Pass lo_data to lo_inode_{fd,open}()'
009/12:[0111] [FC] 'virtiofsd: Add lo_inode.fhandle'
010/12:[0002] [FC] 'virtiofsd: Add inodes_by_handle hash table'
011/12:[0235] [FC] 'virtiofsd: Optionally fill lo_inode.fhandle'
012/12:[0006] [FC] 'virtiofsd: Add lazy lo_do_find()'


Hanna Reitz (12):
  virtiofsd: Keep /proc/self/mountinfo open
  virtiofsd: Limit setxattr()'s creds-dropped region
  virtiofsd: Add TempFd structure
  virtiofsd: Use lo_inode_open() instead of openat()
  virtiofsd: Add lo_inode_fd() helper
  virtiofsd: Let lo_fd() return a TempFd
  virtiofsd: Let lo_inode_open() return a TempFd
  virtiofsd: Pass lo_data to lo_inode_{fd,open}()
  virtiofsd: Add lo_inode.fhandle
  virtiofsd: Add inodes_by_handle hash table
  virtiofsd: Optionally fill lo_inode.fhandle
  virtiofsd: Add lazy lo_do_find()

 tools/virtiofsd/helper.c              |    3 +
 tools/virtiofsd/passthrough_ll.c      | 1102 +++++++++++++++++++++----
 tools/virtiofsd/passthrough_seccomp.c |    2 +
 3 files changed, 951 insertions(+), 156 deletions(-)

-- 
2.31.1


