Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E327D30DCB7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:28:40 +0100 (CET)
Received: from localhost ([::1]:55862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7J95-0000Tq-Uu
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:28:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7J5W-00057R-Rz
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:24:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7J5U-00008h-Vk
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:24:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612362296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Vf3zGU2kgJQP0nlTEjVCxqAU7klJOwBWeFb0AlELSIY=;
 b=Ky5p0emcJqsRxBgb+82CAAjrILRAAEP5DNGMi68DU+IZ+RqUIrGP5ktN68r9fMg4oyJLyE
 Rkh4AJQ0o5K9m702PqmHxPL7VAHiXrHwDG1leO/rRzWlXGYs3SCKAPtGpFVaHiRdnWFHRb
 bUf4hnJXnK5gAEo3hHgbPbQgrjUfSUU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-V5BAJ4JAMIGBRg9FT-uakw-1; Wed, 03 Feb 2021 09:24:52 -0500
X-MC-Unique: V5BAJ4JAMIGBRg9FT-uakw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1070EDF8A4
 for <qemu-devel@nongnu.org>; Wed,  3 Feb 2021 14:24:52 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D319D19C59
 for <qemu-devel@nongnu.org>; Wed,  3 Feb 2021 14:24:51 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/20] NBD patches for 2021-02-02
Date: Wed,  3 Feb 2021 08:24:16 -0600
Message-Id: <20210203142436.703098-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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

The following changes since commit 8360ebeb4f4a707984cafd1a22c049ec82ddcb4c:

  Merge remote-tracking branch 'remotes/ehabkost-gl/tags/machine-next-pull-request' into staging (2021-02-03 09:54:21 +0000)

are available in the Git repository at:

  https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2021-02-02-v2

for you to fetch changes up to 5082fc82a6bc3fc06a04be47d39777c7cff61e5b:

  nbd: make nbd_read* return -EIO on error (2021-02-03 08:17:12 -0600)

v2: fix accidental inclusion of .rej file from merge resolution
[only affected patches re-sent]

----------------------------------------------------------------
nbd patches for 2021-02-02

- more cleanup from iotest python conversion
- progress towards consistent use of signed 64-bit types through block layer
- fix some crashes related to NBD reconnect

----------------------------------------------------------------
Eric Blake (2):
      iotests: Fix expected whitespace for 185
      block: use int64_t as bytes type in tracked requests

Roman Kagan (3):
      block/nbd: only detach existing iochannel from aio_context
      block/nbd: only enter connection coroutine if it's present
      nbd: make nbd_read* return -EIO on error

Vladimir Sementsov-Ogievskiy (15):
      block: refactor bdrv_check_request: add errp
      util/iov: make qemu_iovec_init_extended() honest
      block: fix theoretical overflow in bdrv_init_padding()
      block/io: refactor bdrv_pad_request(): move bdrv_pad_request() up
      block/io: bdrv_pad_request(): support qemu_iovec_init_extended failure
      block/throttle-groups: throttle_group_co_io_limits_intercept(): 64bit bytes
      block/io: improve bdrv_check_request: check qiov too
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


