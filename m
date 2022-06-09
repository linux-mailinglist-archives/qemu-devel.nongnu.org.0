Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B4C54518E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 18:08:15 +0200 (CEST)
Received: from localhost ([::1]:33564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzKhi-0008E5-8v
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 12:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nzK4q-0007lP-5q
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:28:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nzK4f-0000mB-4k
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:28:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654788472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dh8EqDpYN27bTfu/4TgN7mfFjY+/rHzaKxeC1+p0ySo=;
 b=hqirz7WF7KfPAnehR6dWYZAmn96D2JNlOwd/9y4RhdVvMIDouYk6vaW5tz7/J+HuVfapiX
 V18WoYWD4o1b/CaZChx6umhOnIQLHmc5eCDpwaHifF3liSJFo9UTAB9U1cxDVrzG0WnnH8
 YJgVfLWXhem/446zOGZg5HU34FIZf6E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-ycmiTfUBPYKZgoJBSVAdGQ-1; Thu, 09 Jun 2022 11:27:49 -0400
X-MC-Unique: ycmiTfUBPYKZgoJBSVAdGQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75D2A1C1826F;
 Thu,  9 Jun 2022 15:27:48 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA4DF492C3B;
 Thu,  9 Jun 2022 15:27:45 +0000 (UTC)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Ari Sundholm <ari@tuxera.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Fam Zheng <fam@euphon.net>,
 Jeff Cody <codyprime@gmail.com>, qemu-block@nongnu.org,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Alberto Faria <afaria@redhat.com>
Subject: [PATCH v5 00/10] Implement bdrv_{pread, pwrite, pwrite_sync,
 pwrite_zeroes}() using generated_co_wrapper
Date: Thu,  9 Jun 2022 16:27:34 +0100
Message-Id: <20220609152744.3891847-1-afaria@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Start by making the interfaces of analogous non-coroutine and coroutine
functions consistent with each other, then implement the non-coroutine
ones using generated_co_wrapper.

For the bdrv_pwrite_sync() case, also add the missing
bdrv_co_pwrite_sync() function.

Changes v4 --> v5:
- Picking up a few R-b from v3 that I forgot. Sorry for the noise.

Changes v3 --> v4:
- Removed `assert(bytes <= SIZE_MAX)` from bdrv_co_{pread,pwrite}()
  (undoing v3) since bdrv_check_request32(), which is called further
  down the stack, will cause -EIO to be returned if bytes > SIZE_MAX.
- Audited callers to make sure bdrv_{pread,pwrite}() now returning -EIO
  instead of -EINVAL when 'bytes' is negative doesn't break things.
  Still, would appreciate it if someone more accustomed to the code base
  were able to double-check this.

Changes v2 --> v3:
- Add `assert(bytes <= SIZE_MAX)` to bdrv_co_{pread,pwrite}().

Changes v1 --> v2:
- Drop unnecessary assignments to ret in vhdx_log_peek_hdr(),
  vhdx_log_read_sectors(), and vhdx_log_write_sectors().
- Simplify vdi_co_pwritev() return expression.
- Add patch making crypto block callbacks return 0 on success.
- Clarify in commit message that bdrv_pwrite_zeroes() now calls
  trace_bdrv_co_pwrite_zeroes() and clears the BDRV_REQ_MAY_UNMAP flag
  when appropriate, which it didn't previously.
- Use _co_ functions in the implementation of bdrv_co_pwrite_sync().
- Add patch converting uses of bdrv_pwrite_sync() into
  bdrv_co_pwrite_sync() when the callers are already coroutine_fn.
- Add patch making qcow2_mark_dirty() use bdrv_pwrite_sync() instead of
  calling bdrv_pwrite() and bdrv_flush() separately.

Alberto Faria (10):
  block: Add a 'flags' param to bdrv_{pread,pwrite,pwrite_sync}()
  block: Change bdrv_{pread,pwrite,pwrite_sync}() param order
  block: Make bdrv_{pread,pwrite}() return 0 on success
  crypto: Make block callbacks return 0 on success
  block: Make bdrv_co_pwrite() take a const buffer
  block: Make 'bytes' param of bdrv_co_{pread,pwrite,preadv,pwritev}()
    an int64_t
  block: Implement bdrv_{pread,pwrite,pwrite_zeroes}() using
    generated_co_wrapper
  block: Add bdrv_co_pwrite_sync()
  block: Use bdrv_co_pwrite_sync() when caller is coroutine_fn
  block/qcow2: Use bdrv_pwrite_sync() in qcow2_mark_dirty()

 block/blklogwrites.c             |  6 +--
 block/bochs.c                    | 10 ++--
 block/cloop.c                    | 12 ++---
 block/coroutines.h               |  4 +-
 block/crypto.c                   | 56 +++++++++++-----------
 block/dmg.c                      | 36 +++++++-------
 block/io.c                       | 55 ++--------------------
 block/parallels-ext.c            |  6 +--
 block/parallels.c                | 12 ++---
 block/qcow.c                     | 41 ++++++++--------
 block/qcow2-bitmap.c             | 14 +++---
 block/qcow2-cache.c              |  9 ++--
 block/qcow2-cluster.c            | 19 ++++----
 block/qcow2-refcount.c           | 58 ++++++++++++-----------
 block/qcow2-snapshot.c           | 53 ++++++++++-----------
 block/qcow2.c                    | 80 ++++++++++++++++----------------
 block/qed.c                      | 13 ++----
 block/vdi.c                      | 16 +++----
 block/vhdx-log.c                 | 23 +++++----
 block/vhdx.c                     | 36 +++++++-------
 block/vmdk.c                     | 70 +++++++++++++---------------
 block/vpc.c                      | 23 ++++-----
 block/vvfat.c                    | 11 +++--
 crypto/block-luks.c              |  8 ++--
 crypto/block.c                   |  6 +--
 include/block/block-io.h         | 22 ++++++---
 include/block/block_int-io.h     |  4 +-
 include/crypto/block.h           | 32 ++++++-------
 tests/unit/test-block-iothread.c | 12 ++---
 tests/unit/test-crypto-block.c   | 38 +++++++--------
 30 files changed, 370 insertions(+), 415 deletions(-)

-- 
2.35.3


