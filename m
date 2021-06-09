Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B09DB3A1A47
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:57:51 +0200 (CEST)
Received: from localhost ([::1]:46394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr0aU-0005YB-NK
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lr0Ym-0002ib-VP
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:56:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lr0Yk-0006qH-He
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:56:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623254161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9SWs0PFlLw26HnFvPAD40q/LFvbeZfF8f5EErIiwqII=;
 b=HkPKSmGH7fOeKpg7fZg4bVB/oSZxIuQZoHdaMW+jQP/NRbZz9mLgzvHHF57XVJSyRMuWR4
 k7KpYToBmcBhEur3CpHeedr2RA1oIZ016SdXK6GVMi+oFGyaCwNFnLiY0Nr9AQC3KKJIM1
 tgQ4sI5OB/zvasZBIpO8PoT0ky/wHvk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-yWYs2VKjPsSjw-zjsGw-gA-1; Wed, 09 Jun 2021 11:56:00 -0400
X-MC-Unique: yWYs2VKjPsSjw-zjsGw-gA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C3FE19251A2
 for <qemu-devel@nongnu.org>; Wed,  9 Jun 2021 15:55:59 +0000 (UTC)
Received: from localhost (ovpn-114-102.ams2.redhat.com [10.36.114.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7996819C46;
 Wed,  9 Jun 2021 15:55:52 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v2 0/9] virtiofsd: Allow using file handles instead of O_PATH
 FDs
Date: Wed,  9 Jun 2021 17:55:42 +0200
Message-Id: <20210609155551.44437-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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

v1 cover letter for an overview:
https://listman.redhat.com/archives/virtio-fs/2021-June/msg00033.html

In v2, I (tried to) fix the bug Dave found, which is that
get_file_handle() indiscriminately opened the given dirfd/name
combination to get an O_RDONLY fd without checking whether we’re
actually allowed to open dirfd/name; namely, we don’t allow ourselves to
open files that aren’t regular files or directories.

So that openat(.., O_RDONLY) is changed to an openat(..., O_PATH), and
then check the file type with the statx() we’re doing anyway.  If the
file is OK to open, we reopen it O_RDONLY with the help of
/proc/self/fd, like we always do.

(This only affects patch 8.)


git-backport-diff against v1:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/9:[----] [--] 'virtiofsd: Add TempFd structure'
002/9:[----] [--] 'virtiofsd: Use lo_inode_open() instead of openat()'
003/9:[----] [--] 'virtiofsd: Add lo_inode_fd() helper'
004/9:[----] [--] 'virtiofsd: Let lo_fd() return a TempFd'
005/9:[----] [--] 'virtiofsd: Let lo_inode_open() return a TempFd'
006/9:[----] [--] 'virtiofsd: Add lo_inode.fhandle'
007/9:[----] [--] 'virtiofsd: Add inodes_by_handle hash table'
008/9:[0045] [FC] 'virtiofsd: Optionally fill lo_inode.fhandle'
009/9:[----] [--] 'virtiofsd: Add lazy lo_do_find()'


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
 tools/virtiofsd/passthrough_ll.c      | 836 +++++++++++++++++++++-----
 tools/virtiofsd/passthrough_seccomp.c |   2 +
 3 files changed, 694 insertions(+), 147 deletions(-)

-- 
2.31.1


