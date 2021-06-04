Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5634E39BE30
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:11:41 +0200 (CEST)
Received: from localhost ([::1]:47154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDMC-00040g-E4
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lpCSN-00055j-Hp
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:13:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lpCSI-00040v-Oo
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:13:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622823234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2LcyGfNOMzt4IC4P0p20tqVvDSo/ZQAZLOIc2I9Y1Gc=;
 b=DivFu5gQZTN14isbQSlXe9e2yp42ni+YNkdQjRcWqdMQssQ5WoDWrPlOy4dOOEMF5rHXdH
 qY2VwqLJpvyajYuXZGhH278HvLiqTW8SIqltkHBUSDn/SultYUtVkbAO+rQ8nzQ86vnjbT
 EgUDzoIgE8NB16UEYI37xhyt0rHzW9Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-zcNeKLy3O4WdCWiGFp_zvQ-1; Fri, 04 Jun 2021 12:13:51 -0400
X-MC-Unique: zcNeKLy3O4WdCWiGFp_zvQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC000180FD6D
 for <qemu-devel@nongnu.org>; Fri,  4 Jun 2021 16:13:50 +0000 (UTC)
Received: from localhost (ovpn-114-199.ams2.redhat.com [10.36.114.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EDAF5D74B;
 Fri,  4 Jun 2021 16:13:38 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH 0/9] virtiofsd: Allow using file handles instead of O_PATH FDs
Date: Fri,  4 Jun 2021 18:13:28 +0200
Message-Id: <20210604161337.16048-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is the C virtiofsd equivalent to
https://gitlab.com/virtio-fs/virtiofsd-rs/-/merge_requests/26.  As such,
the summary is pretty much the same:

Storing an O_PATH file descriptor in every lo_inode object means we have
a lot of FDs open, which is sometimes bad.  This series adds an option
(-o inode_file_handles) that will make virtiofsd attempt to generate a
file handle for new inodes and store that instead of an FD.  When an FD
is needed for a given inode, we open the handle.

To accomplish this, lo_inode.fd is should not be accessed directly
anymore, but only through helper functions (mainly lo_inode_fd() and
lo_inode_open()).  A TempFd object is added to hide the difference
between FDs that are bound to the lo_inode object (and so need not be
closed after use) and temporary FDs from open_by_handle_at() (which do
need to be closed after use).

To prevent the problem I spent a long time talking about (if we don’t
have an FD open for every inode, the inode can be deleted, its ID
reused, and then the lookup in lo_data.inodes will find the old deleted
inode), patch 7 adds a second hash table lo_data.inodes_by_handle that
maps file handles to lo_inode objects.  (Because file handles include a
generation ID, so we can discern between the old and the new inode.)

Patch 9 is completely optional, but I just really felt compelled to
write it.


Max Reitz (9):
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
 tools/virtiofsd/passthrough_ll.c      | 809 +++++++++++++++++++++-----
 tools/virtiofsd/passthrough_seccomp.c |   2 +
 3 files changed, 667 insertions(+), 147 deletions(-)

-- 
2.31.1


