Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBFF69AF10
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 16:09:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT2Ls-0003nI-B1; Fri, 17 Feb 2023 10:08:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pT2Ln-0003ml-3Z
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:08:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pT2Ll-0006uc-56
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:08:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676646515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pQLlW0SzKpk+/gGpOLihZJWnIDB4duq1hf1Un8wH/1U=;
 b=SIwVmJPOtpJVfqU2fM63xJvHteQF3i1r/kbjldS+m/ayEhHuSpnmXDIdDBDkVIE3dzUWro
 TCXvOehF/t1hJsYivBX3FtFC/4wIbI/cyvESJQmYWcIPj/Iz8WLjPSRs8oIW/n/kR9Wi/W
 K+V432qkOHZYPnUd1JPppI4FB4SjAzU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-H0ab6Uo3MXuPenDUNy3EdQ-1; Fri, 17 Feb 2023 10:08:34 -0500
X-MC-Unique: H0ab6Uo3MXuPenDUNy3EdQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A58B80D0E0;
 Fri, 17 Feb 2023 15:08:33 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFDCD4024BDC;
 Fri, 17 Feb 2023 15:08:32 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 00/22] Block layer patches
Date: Fri, 17 Feb 2023 16:08:29 +0100
Message-Id: <20230217150829.283583-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 6dffbe36af79e26a4d23f94a9a1c1201de99c261:

  Merge tag 'migration-20230215-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-02-16 13:09:51 +0000)

are available in the Git repository at:

  https://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to a4d5224c2cb650b5a401d626d3f36e42e6987aa7:

  hbitmap: fix hbitmap_status() return value for first dirty bit case (2023-02-17 14:34:24 +0100)

----------------------------------------------------------------
Block layer patches

- configure: Enable -Wthread-safety if present
- no_co_wrapper to fix bdrv_open*() calls from coroutine context
- curl fixes, including enablement of newer libcurl versions
- MAINTAINERS: drop Vladimir from parallels block driver
- hbitmap: fix hbitmap_status() return value for first dirty bit case
- file-posix: Fix assertion failure in write_zeroes after moving
  bdrv_getlength() to co_wrapper

----------------------------------------------------------------
Andrey Zhadchenko (1):
      hbitmap: fix hbitmap_status() return value for first dirty bit case

Anton Johansson (1):
      block: Handle curl 7.55.0, 7.85.0 version changes

Emanuele Giuseppe Esposito (3):
      util/qemu-thread-posix: use TSA_NO_TSA to suppress clang TSA warnings in FreeBSD
      bsd-user/mmap: use TSA_NO_TSA to suppress clang TSA warnings in FreeBSD
      block/file-posix: don't use functions calling AIO_WAIT_WHILE in worker threads

Hanna Czenczek (1):
      curl: Fix error path in curl_open()

Kevin Wolf (14):
      configure: Enable -Wthread-safety if present
      block-coroutine-wrapper: Introduce no_co_wrapper
      block: Create no_co_wrappers for open functions
      luks: Fix .bdrv_co_create(_opts) to open images with no_co_wrapper
      parallels: Fix .bdrv_co_create(_opts) to open images with no_co_wrapper
      qcow: Fix .bdrv_co_create(_opts) to open images with no_co_wrapper
      qcow2: Fix open/create to open images with no_co_wrapper
      qed: Fix .bdrv_co_create(_opts) to open images with no_co_wrapper
      vdi: Fix .bdrv_co_create(_opts) to open images with no_co_wrapper
      vhdx: Fix .bdrv_co_create(_opts) to open images with no_co_wrapper
      vmdk: Fix .bdrv_co_create(_opts) to open images with no_co_wrapper
      vpc: Fix .bdrv_co_create(_opts) to open images with no_co_wrapper
      block: Fix bdrv_co_create_opts_simple() to open images with no_co_wrapper
      block: Assert non-coroutine context for bdrv_open_inherit()

Stefano Garzarella (1):
      block: temporarily hold the new AioContext of bs_top in bdrv_append()

Vladimir Sementsov-Ogievskiy (1):
      MAINTAINERS: drop Vladimir from parallels block driver

 configure                                   |  1 +
 bsd-user/qemu.h                             |  5 +-
 include/block/block-common.h                | 14 +++++
 include/block/block-global-state.h          | 35 ++++++++----
 include/exec/exec-all.h                     |  5 +-
 include/qemu/hbitmap.h                      |  2 +-
 include/qemu/thread.h                       | 14 +++--
 include/sysemu/block-backend-global-state.h | 21 ++++++--
 block.c                                     | 40 ++++++++++----
 block/crypto.c                              | 19 ++++---
 block/curl.c                                | 50 +++++++++++++----
 block/file-posix.c                          |  2 +-
 block/parallels.c                           | 10 ++--
 block/qcow.c                                | 10 ++--
 block/qcow2.c                               | 43 +++++++--------
 block/qed.c                                 | 10 ++--
 block/vdi.c                                 | 10 ++--
 block/vhdx.c                                | 10 ++--
 block/vmdk.c                                | 22 ++++----
 block/vpc.c                                 | 10 ++--
 util/hbitmap.c                              |  2 +-
 util/qemu-thread-posix.c                    |  2 +-
 scripts/block-coroutine-wrapper.py          | 83 +++++++++++++++++++++++++----
 MAINTAINERS                                 |  2 -
 block/meson.build                           |  1 +
 25 files changed, 295 insertions(+), 128 deletions(-)


