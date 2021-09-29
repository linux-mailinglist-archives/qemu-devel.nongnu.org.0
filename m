Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 367D041CDDC
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 23:13:44 +0200 (CEST)
Received: from localhost ([::1]:42996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVgta-0000fQ-Fa
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 17:13:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mVgsh-0008Px-Jw
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 17:12:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mVgsd-0003fA-CE
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 17:12:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632949961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/xg17MaPNWl0iMfcqF32TSrsfGAsNbSLsXuvt2M9lfY=;
 b=ADpCQsuiI8FCayFVmBxK6xHLGa/HRsqslXqbAIlHEWFCeCqHZa8Jcp9mK5AC3gMJDdFbVb
 4ROJC8BCD31ACzgqJWBA5uqbsFPh3e6PIySAO/Yp7KfVp+sUkpcEJY5AcUlDKbmHavbYNS
 HnPPmkvlxT4xcAla8NIt1POT11ZDQ2c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-_AbF92rPOOqdHK_qABk-Bg-1; Wed, 29 Sep 2021 17:12:37 -0400
X-MC-Unique: _AbF92rPOOqdHK_qABk-Bg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80E301006AA3
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 21:12:36 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-87.phx2.redhat.com [10.3.113.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3BEAE19C59
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 21:12:36 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/19] NBD patches through 2021-09-27
Date: Wed, 29 Sep 2021 16:12:10 -0500
Message-Id: <20210929211229.4163263-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 6b54a31bf7b403672a798b6443b1930ae6c74dea:

  Merge remote-tracking branch 'remotes/jsnow-gitlab/tags/python-pull-request' into staging (2021-09-28 13:07:32 +0100)

are available in the Git repository at:

  https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2021-09-27-v2

for you to fetch changes up to 1af7737871fb3b66036f5e520acb0a98fc2605f7:

  block/nbd: check that received handle is valid (2021-09-29 13:46:33 -0500)

v2: defer problematic selinux patch; sending cover letter only since
remaining patches are unchanged

----------------------------------------------------------------
nbd patches for 2021-09-27

- Vladimir Sementsov-Ogievskiy: Rework coroutines of qemu NBD client
  to improve reconnect support
- Eric Blake: Relax server in regards to NBD_OPT_LIST_META_CONTEXT
- Vladimir Sementsov-Ogievskiy: Plumb up 64-bit bulk-zeroing support
  in block layer, in preparation for future NBD spec extensions
- Nir Soffer: Default to writeback cache in qemu-nbd

----------------------------------------------------------------
Eric Blake (1):
      nbd/server: Allow LIST_META_CONTEXT without STRUCTURED_REPLY

Nir Soffer (1):
      qemu-nbd: Change default cache mode to writeback

Vladimir Sementsov-Ogievskiy (17):
      block/io: bring request check to bdrv_co_(read,write)v_vmstate
      qcow2: check request on vmstate save/load path
      block: use int64_t instead of uint64_t in driver read handlers
      block: use int64_t instead of uint64_t in driver write handlers
      block: use int64_t instead of uint64_t in copy_range driver handlers
      block: make BlockLimits::max_pwrite_zeroes 64bit
      block: use int64_t instead of int in driver write_zeroes handlers
      block/io: allow 64bit write-zeroes requests
      block: make BlockLimits::max_pdiscard 64bit
      block: use int64_t instead of int in driver discard handlers
      block/io: allow 64bit discard requests
      nbd/client-connection: nbd_co_establish_connection(): fix non set errp
      block/nbd: nbd_channel_error() shutdown channel unconditionally
      block/nbd: move nbd_recv_coroutines_wake_all() up
      block/nbd: refactor nbd_recv_coroutines_wake_all()
      block/nbd: drop connection_co
      block/nbd: check that received handle is valid

 docs/tools/qemu-nbd.rst          |   6 +-
 include/block/block_int.h        |  66 +++---
 block/io.c                       |  44 +++-
 block/blkdebug.c                 |  12 +-
 block/blklogwrites.c             |  16 +-
 block/blkreplay.c                |   8 +-
 block/blkverify.c                |   8 +-
 block/bochs.c                    |   4 +-
 block/cloop.c                    |   4 +-
 block/commit.c                   |   2 +-
 block/copy-before-write.c        |  15 +-
 block/copy-on-read.c             |  19 +-
 block/crypto.c                   |   8 +-
 block/curl.c                     |   3 +-
 block/dmg.c                      |   4 +-
 block/file-posix.c               |  35 ++--
 block/file-win32.c               |   8 +-
 block/filter-compress.c          |  15 +-
 block/gluster.c                  |  13 +-
 block/iscsi.c                    |  58 +++--
 block/mirror.c                   |   8 +-
 block/nbd.c                      | 443 ++++++++++++---------------------------
 block/nfs.c                      |  12 +-
 block/null.c                     |  18 +-
 block/nvme.c                     |  48 ++++-
 block/preallocate.c              |  14 +-
 block/qcow.c                     |  16 +-
 block/qcow2-cluster.c            |  14 +-
 block/qcow2.c                    |  70 +++++--
 block/qed.c                      |   9 +-
 block/quorum.c                   |  11 +-
 block/raw-format.c               |  36 ++--
 block/rbd.c                      |  20 +-
 block/throttle.c                 |  18 +-
 block/vdi.c                      |   8 +-
 block/vmdk.c                     |  14 +-
 block/vpc.c                      |   8 +-
 block/vvfat.c                    |   8 +-
 nbd/client-connection.c          |   1 +
 nbd/client.c                     |   2 -
 nbd/server.c                     |   2 +-
 qemu-nbd.c                       |   6 +-
 tests/unit/test-bdrv-drain.c     |  16 +-
 tests/unit/test-block-iothread.c |  21 +-
 block/trace-events               |  10 +-
 45 files changed, 585 insertions(+), 596 deletions(-)

-- 
2.31.1


