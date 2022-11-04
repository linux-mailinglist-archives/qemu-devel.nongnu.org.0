Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7282E619238
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 08:52:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqrTe-0007Jf-MP; Fri, 04 Nov 2022 03:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1oqrTb-0007Gp-Jp
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 03:50:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1oqrTZ-0006EI-OW
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 03:50:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667548252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=5DIDB02RoLJeVgOhAsehjEdd8Pcfth91OCX955GthBk=;
 b=ZThFtYE3pEqkhzcDqBE+mb0aw9zcMwL0sP0rPpOgZXv/77zNSE79QKpGNH8827H737PTas
 ZfBGg0tY52V+kKKFuuoIfixdKkEAHAZjgiVSUoIqx7pNH3BdC/masoUHb3C7Zg7E3jfHqV
 //w9xpnFY4l06XTFnvwJK5m69YkmU2Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-cZGx9v1lMimbzp0tbOutTQ-1; Fri, 04 Nov 2022 03:50:49 -0400
X-MC-Unique: cZGx9v1lMimbzp0tbOutTQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0EDAA8582B9;
 Fri,  4 Nov 2022 07:50:49 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.2.16.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3845C140EBF5;
 Fri,  4 Nov 2022 07:50:47 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: virtio-fs@redhat.com
Cc: qemu-devel@nongnu.org, Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>,
 Vivek Goyal <vgoyal@redhat.com>, Dr. David Alan Gilbert
 <dgilbert@redhat.com>, Miklos Szeredi <mszeredi@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>
Subject: Use of unshare(CLONE_FS) in virtiofsd
Date: Fri, 04 Nov 2022 08:50:45 +0100
Message-ID: <87r0yj17l6.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=fweimer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

I've got a proposed extension for glibc's pthread_create which allows
the creation of threads with a dedicated current working
directory/umask/chroot:

  [PATCH 0/2] Introduce per-thread file system properties on Linux
  <https://sourceware.org/pipermail/libc-alpha/2022-October/142640.html>

I expect that glibc integration will work around the seccomp issue
mentioned in a comment (also brought up by the Samba people for their
use) because glibc will perform the unshare directly during the clone
system call, and not via a separate system call.

I see that unshare(CLONE_FS) was introduced in this commit:

commit bdfd66788349acc43cd3f1298718ad491663cfcc
Author: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
Date:   Thu Feb 27 14:59:27 2020 +0900

    virtiofsd: Fix xattr operations
    
    Current virtiofsd has problems about xattr operations and
    they does not work properly for directory/symlink/special file.
    
    The fundamental cause is that virtiofsd uses openat() + f...xattr()
    systemcalls for xattr operation but we should not open symlink/special
    file in the daemon. Therefore the function is restricted.
    
    Fix this problem by:
     1. during setup of each thread, call unshare(CLONE_FS)
     2. in xattr operations (i.e. lo_getxattr), if inode is not a regular
        file or directory, use fchdir(proc_loot_fd) + ...xattr() +
        fchdir(root.fd) instead of openat() + f...xattr()
    
        (Note: for a regular file/directory openat() + f...xattr()
         is still used for performance reason)
    
    With this patch, xfstests generic/062 passes on virtiofs.
    
    This fix is suggested by Miklos Szeredi and Stefan Hajnoczi.
    The original discussion can be found here:
      https://www.redhat.com/archives/virtio-fs/2019-October/msg00046.html
    
    Signed-off-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
    Message-Id: <20200227055927.24566-3-misono.tomohiro@jp.fujitsu.com>
    Acked-by: Vivek Goyal <vgoyal@redhat.com>
    Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
    Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Now the question has come up on the libc-coord list why the *at
interfaces are not used in such cases:

  <https://www.openwall.com/lists/libc-coord/2022/10/24/3>

Clearly the kernel lacks support for fgetxattrat today.  The usual
recommendation for emulating it is to use openat with O_PATH, and then
use getxattr on the virtual /proc/self/fd path.  This needs an
additional system call (openat, getxattr, close instead of fchdir,
getxattr), but it avoids the unshare(CLONE_FS) call behind libc's back.
The directory entries in /proc/self/fd present as symbolic links, but
are not implemented as such by the kernel: there is no separate pathname
lookup for already-open O_PATH descriptors, so there is no race.

Thoughts?

Thanks,
Florian


