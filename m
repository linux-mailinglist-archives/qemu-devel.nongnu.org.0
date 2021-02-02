Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9F530CF50
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 23:48:39 +0100 (CET)
Received: from localhost ([::1]:46690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l74TO-0000vS-U9
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 17:48:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74QW-0007FX-HP
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:45:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74QT-0005nT-Ep
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:45:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612305936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SK245ApsSh36sSlCCi5oHDjcFtLRUz5mIlLXjRDekv8=;
 b=Zf2TE1QaP+v0Bot42qxzWGsELaLhJzG8DQKTg1NXNTOcp8A1N1VjJz5bTLe/AYCFCVTOi3
 uNVPk3qrJEs2OLyR2iyF7eKV3ozNykDKBF6c716dEy0DaNGT30FQZnqvM8gGXQWlzQSCDe
 il4l/b2PDVY9MM4k7KclPBd0Ca8mgQc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-Wt-vlioOOueHCQibFHpp6Q-1; Tue, 02 Feb 2021 17:45:33 -0500
X-MC-Unique: Wt-vlioOOueHCQibFHpp6Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 324A751DB
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 22:45:32 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0200B10016F9
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 22:45:31 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/20] NBD patches for 2021-02-02
Date: Tue,  2 Feb 2021 16:45:09 -0600
Message-Id: <20210202224529.642055-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 77f3804ab7ed94b471a14acb260e5aeacf26193f:

  Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2021-02-02 16:47:51 +0000)

are available in the Git repository at:

  https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2021-02-02

for you to fetch changes up to bb1b0015dfc77bd8b82d8be806f8822d19e749b8:

  nbd: make nbd_read* return -EIO on error (2021-02-02 16:30:50 -0600)

----------------------------------------------------------------
nbd patches for 2021-02-02

- more cleanup from iotest python conversion
- progress towards consistent use of signed 64-bit types through block layer
- fix some crashes related to NBD reconnect

----------------------------------------------------------------
Eric Blake (1):
      iotests: Fix expected whitespace for 185

Roman Kagan (3):
      block/nbd: only detach existing iochannel from aio_context
      block/nbd: only enter connection coroutine if it's present
      nbd: make nbd_read* return -EIO on error

Vladimir Sementsov-Ogievskiy (16):
      block: refactor bdrv_check_request: add errp
      util/iov: make qemu_iovec_init_extended() honest
      block: fix theoretical overflow in bdrv_init_padding()
      block/io: refactor bdrv_pad_request(): move bdrv_pad_request() up
      block/io: bdrv_pad_request(): support qemu_iovec_init_extended failure
      block/throttle-groups: throttle_group_co_io_limits_intercept(): 64bit bytes
      block/io: improve bdrv_check_request: check qiov too
      block: use int64_t as bytes type in tracked requests
      block/io: use int64_t bytes in driver wrappers
      block/io: support int64_t bytes in bdrv_co_do_pwrite_zeroes()
      block/io: support int64_t bytes in bdrv_aligned_pwritev()
      block/io: support int64_t bytes in bdrv_co_do_copy_on_readv()
      block/io: support int64_t bytes in bdrv_aligned_preadv()
      block/io: support int64_t bytes in bdrv_co_p{read,write}v_part()
      block/io: support int64_t bytes in read/write wrappers
      block/io: use int64_t bytes in copy_range

 include/block/block.h           |  17 +--
 include/block/block_int.h       |  26 ++--
 include/block/nbd.h             |   7 +-
 include/block/throttle-groups.h |   2 +-
 include/qemu/iov.h              |   2 +-
 block/io.c                      | 274 ++++++++++++++++++++++++++++------------
 block/blkverify.c               |   2 +-
 block/file-posix.c              |   2 +-
 block/nbd.c                     |  25 ++--
 block/throttle-groups.c         |   5 +-
 tests/test-write-threshold.c    |   5 +-
 util/iov.c                      |  25 +++-
 block/trace-events              |  12 +-
 tests/qemu-iotests/185.out      |   2 +-
 tests/qemu-iotests/206.out      |   2 +-
 15 files changed, 275 insertions(+), 133 deletions(-)

-- 
2.30.0


