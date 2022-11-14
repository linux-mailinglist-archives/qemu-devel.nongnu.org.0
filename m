Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E99628E4B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:27:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouie0-00024I-11; Mon, 14 Nov 2022 18:13:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouido-0001hU-Le
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouiJC-00033Z-2B
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:52:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ngcXD27AEj6AUFTargWKnxPC2tw6mUXN6suLoL8CxiI=;
 b=i1udhXMbEGnN8tzVcHUmFyykr6cV5BWXT4q4G9MeYeY0d9i8osBbjcqDS8DXzxRqoY4ti/
 BBBlldgSytlYU42zjDqqGjujEfMeACbFLcQfc7j4owA6O1hD9Rwhy50DzJJbmxS8rp0PkP
 HukV949ivn5xh25Bbf8QdmijYVs0NCw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-EUkHWdQUMmGGGOzBtpdYMQ-1; Mon, 14 Nov 2022 17:52:02 -0500
X-MC-Unique: EUkHWdQUMmGGGOzBtpdYMQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D56F687B2A1;
 Mon, 14 Nov 2022 22:52:01 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66CE240E9786;
 Mon, 14 Nov 2022 22:52:01 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v2 00/23] libnbd 64-bit NBD extensions
Date: Mon, 14 Nov 2022 16:51:35 -0600
Message-Id: <20221114225158.2186742-1-eblake@redhat.com>
In-Reply-To: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This series is posted alongside a spec change to NBD, and
interoperable with changes posted to qemu-nbd/qemu-storage-daemon.
The RFC patch at the end is optional; ineroperability with qemu works
only when either both projects omit the RFC patch, or when both
projects include it (if only one of the two RFC projects include it,
the protocol is incompatible between the two, but at least client and
server gracefully detect the bug rather than SEGV'ing).

Eric Blake (23):
  block_status: Refactor array storage
  internal: Refactor layout of replies in sbuf
  protocol: Add definitions for extended headers
  states: Prepare to send 64-bit requests
  states: Prepare to receive 64-bit replies
  states: Break deadlock if server goofs on extended replies
  generator: Add struct nbd_extent in prep for 64-bit extents
  block_status: Track 64-bit extents internally
  block_status: Accept 64-bit extents during block status
  api: Add [aio_]nbd_block_status_64
  api: Add several functions for controlling extended headers
  copy: Update nbdcopy to use 64-bit block status
  dump: Update nbddump to use 64-bit block status
  info: Expose extended-headers support through nbdinfo
  info: Update nbdinfo --map to use 64-bit block status
  examples: Update copy-libev to use 64-bit block status
  ocaml: Add example for 64-bit extents
  generator: Actually request extended headers
  api: Add nbd_[aio_]opt_extended_headers()
  interop: Add test of 64-bit block status
  api: Add nbd_can_block_status_payload()
  api: Add nbd_[aio_]block_status_filter()
  RFC: pread: Accept 64-bit holes

 docs/libnbd.pod                               |  18 +-
 info/nbdinfo.pod                              |  21 +-
 sh/nbdsh.pod                                  |   2 +-
 lib/internal.h                                |  42 +-
 lib/nbd-protocol.h                            | 120 ++--
 generator/API.ml                              | 532 +++++++++++++++---
 generator/API.mli                             |   1 +
 generator/C.ml                                |  24 +-
 generator/GoLang.ml                           |  24 +
 generator/Makefile.am                         |   3 +-
 generator/OCaml.ml                            |  18 +-
 generator/Python.ml                           |  20 +-
 generator/state_machine.ml                    |  50 +-
 generator/states-issue-command.c              |  33 +-
 .../states-newstyle-opt-extended-headers.c    | 110 ++++
 generator/states-newstyle-opt-starttls.c      |   7 +-
 .../states-newstyle-opt-structured-reply.c    |   3 +-
 generator/states-newstyle.c                   |   3 +
 generator/states-reply-simple.c               |   4 +-
 generator/states-reply-structured.c           | 279 ++++++---
 generator/states-reply.c                      |  57 +-
 lib/aio.c                                     |   7 +-
 lib/flags.c                                   |  11 +
 lib/handle.c                                  |  25 +-
 lib/opt.c                                     |  44 ++
 lib/rw.c                                      | 250 +++++++-
 python/t/110-defaults.py                      |   1 +
 python/t/120-set-non-defaults.py              |   2 +
 python/t/465-block-status-64.py               |  56 ++
 ocaml/examples/Makefile.am                    |   3 +-
 ocaml/examples/extents64.ml                   |  42 ++
 ocaml/helpers.c                               |  20 +
 ocaml/nbd-c.h                                 |   3 +-
 ocaml/tests/Makefile.am                       |   1 +
 ocaml/tests/test_110_defaults.ml              |   2 +
 ocaml/tests/test_120_set_non_defaults.ml      |   3 +
 ocaml/tests/test_465_block_status_64.ml       |  58 ++
 tests/Makefile.am                             |   4 +
 tests/meta-base-allocation.c                  | 111 +++-
 tests/pwrite-extended.c                       | 112 ++++
 examples/copy-libev.c                         |  21 +-
 examples/server-flags.c                       |   7 +-
 interop/Makefile.am                           |  18 +
 interop/block-status-payload.c                | 241 ++++++++
 interop/block-status-payload.sh               |  80 +++
 interop/large-status.c                        | 186 ++++++
 interop/large-status.sh                       |  49 ++
 interop/opt-extended-headers.c                | 153 +++++
 interop/opt-extended-headers.sh               |  29 +
 .gitignore                                    |   4 +
 copy/nbd-ops.c                                |  22 +-
 dump/dump.c                                   |  27 +-
 fuzzing/libnbd-fuzz-wrapper.c                 |  22 +-
 golang/Makefile.am                            |   1 +
 golang/handle.go                              |   8 +-
 golang/libnbd_110_defaults_test.go            |   8 +
 golang/libnbd_120_set_non_defaults_test.go    |  12 +
 golang/libnbd_465_block_status_64_test.go     | 119 ++++
 info/can.c                                    |  14 +
 info/info-can.sh                              |  30 +
 info/info-packets.sh                          |  17 +-
 info/main.c                                   |   7 +-
 info/map.c                                    |  67 +--
 info/show.c                                   |   9 +-
 64 files changed, 2920 insertions(+), 357 deletions(-)
 create mode 100644 generator/states-newstyle-opt-extended-headers.c
 create mode 100644 python/t/465-block-status-64.py
 create mode 100644 ocaml/examples/extents64.ml
 create mode 100644 ocaml/tests/test_465_block_status_64.ml
 create mode 100644 tests/pwrite-extended.c
 create mode 100644 interop/block-status-payload.c
 create mode 100755 interop/block-status-payload.sh
 create mode 100644 interop/large-status.c
 create mode 100755 interop/large-status.sh
 create mode 100644 interop/opt-extended-headers.c
 create mode 100755 interop/opt-extended-headers.sh
 create mode 100644 golang/libnbd_465_block_status_64_test.go

-- 
2.38.1


