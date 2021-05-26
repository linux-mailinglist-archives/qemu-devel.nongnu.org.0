Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E69391EAE
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 20:06:05 +0200 (CEST)
Received: from localhost ([::1]:39980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llxut-0000Me-Tr
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 14:06:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1llxbZ-0003OQ-PY
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:46:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1llxbT-0008Ih-3D
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:46:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622051157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mPhJ8W95twLSXFSGPzaLTjVpRwFyAhIgyK1HYst3xNs=;
 b=Eql7I/qIH8OMgW8OLjn19wYH4ozs7/CwaCAYlZvCrY7d7hKb9+uyDMmohF+sxXcJULI64w
 vX+mcYrqxuoKWgSKjSDCqPz5a/2VJffqSx6hIva3u7Y4tYihylR9/cCWaORSq6H5v4wlW8
 8w+hbXOYLv5ASXZtx6xgbFW4Vn/Fe6U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-Ngi11SFtMziRd85jgIvTag-1; Wed, 26 May 2021 13:45:54 -0400
X-MC-Unique: Ngi11SFtMziRd85jgIvTag-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18C371005D4E;
 Wed, 26 May 2021 17:45:54 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-247.ams2.redhat.com
 [10.36.114.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 317585D9C6;
 Wed, 26 May 2021 17:45:46 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, kwolf@redhat.com, vgoyal@redhat.com,
 ma.mandourr@gmail.com, lizhijian@cn.fujitsu.com
Subject: [PULL 00/15] migration/virtiofs/hmp queue
Date: Wed, 26 May 2021 18:45:25 +0100
Message-Id: <20210526174540.290588-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: peterx@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The following changes since commit 0319ad22bd5789e1eaa8a2dd5773db2d2c372f20:

  Merge remote-tracking branch 'remotes/stsquad/tags/pull-testing-and-misc-updates-250521-2' into staging (2021-05-25 17:31:04 +0100)

are available in the Git repository at:

  git://github.com/dagrh/qemu.git tags/pull-migration-20210526a

for you to fetch changes up to e49e49dd73b8b17f5f341b3e11c8b6878c43d3e1:

  migration/rdma: source: poll cm_event from return path (2021-05-26 18:39:32 +0100)

----------------------------------------------------------------
Virtiofs, migration and hmp pull 2021-05-26

Fixes for a loadvm regression from Kevin,
some virtiofsd cleanups from Vivek and Mahmoud, and
some RDMA migration fixups from Li.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

----------------------------------------------------------------
Kevin Wolf (1):
      hmp: Fix loadvm to resume the VM on success instead of failure

Li Zhijian (5):
      migration/rdma: Fix cm_event used before being initialized
      migration/rdma: cleanup rdma in rdma_start_incoming_migration error path
      migration/rdma: Fix rdma_addrinfo res leaks
      migration/rdma: destination: create the return patch after the first accept
      migration/rdma: source: poll cm_event from return path

Mahmoud Mandour (2):
      tools/virtiofsd/buffer.c: replaced a calloc call with GLib's g_try_new0
      tools/virtiofsd/fuse_opt.c: Replaced a malloc with GLib's g_try_malloc

Vivek Goyal (7):
      virtiofsd: Check for EINTR in preadv() and retry
      virtiofsd: Get rid of unreachable code in read
      virtiofsd: Use iov_discard_front() to skip bytes
      virtiofsd: get rid of in_sg_left variable
      virtiofsd: Simplify skip byte logic
      virtiofsd: Check EOF before short read
      virtiofsd: Set req->reply_sent right after sending reply

 migration/rdma.c              | 83 ++++++++++++++++++++++++++++++++++---------
 monitor/hmp-cmds.c            |  2 +-
 tools/virtiofsd/buffer.c      |  4 +--
 tools/virtiofsd/fuse_opt.c    |  4 +--
 tools/virtiofsd/fuse_virtio.c | 81 +++++++++++++----------------------------
 5 files changed, 96 insertions(+), 78 deletions(-)


