Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1731D46807F
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 00:34:18 +0100 (CET)
Received: from localhost ([::1]:43570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtI4H-0002yN-59
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 18:34:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHoW-00024c-VZ
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:18:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHoU-0003IW-58
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:18:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638573477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ddU8sKSfHn9SWFTU2J+B/O09+Qc7onLR5QWM+HKGoFc=;
 b=Mg6PVbshoYErsZU7BYk7QcFDcxOyHCXEN/fMpGkzZsqnr6Xg/YCGS0adpFzJFnhggqohyX
 fImz4I4wmIVkHe7jt4EiJtbPQUIiz/DKsnKMnSJviw6naAonyVlgO/vgulwdjbIsgIUWyy
 /gvYpLjrdTLUakaHWgg8aIgqa2amJgg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-XJxfkzQjMp69cXw4d5-r_Q-1; Fri, 03 Dec 2021 18:17:54 -0500
X-MC-Unique: XJxfkzQjMp69cXw4d5-r_Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50F4F801B10;
 Fri,  3 Dec 2021 23:17:52 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 555705DF2B;
 Fri,  3 Dec 2021 23:17:42 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Subject: [libnbd PATCH 00/13] libnbd patches for NBD_OPT_EXTENDED_HEADERS
Date: Fri,  3 Dec 2021 17:17:28 -0600
Message-Id: <20211203231741.3901263-1-eblake@redhat.com>
In-Reply-To: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_DBL_SPAM=2.5 autolearn=no autolearn_force=no
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
Cc: nsoffer@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, nbd@other.debian.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Available here: https://repo.or.cz/libnbd/ericb.git/shortlog/refs/tags/exthdr-v1

I also want to do followup patches to teach 'nbdinfo --map' and
'nbdcopy' to utilize 64-bit extents.

Eric Blake (13):
  golang: Simplify nbd_block_status callback array copy
  block_status: Refactor array storage
  protocol: Add definitions for extended headers
  protocol: Prepare to send 64-bit requests
  protocol: Prepare to receive 64-bit replies
  protocol: Accept 64-bit holes during pread
  generator: Add struct nbd_extent in prep for 64-bit extents
  block_status: Track 64-bit extents internally
  block_status: Accept 64-bit extents during block status
  api: Add [aio_]nbd_block_status_64
  api: Add three functions for controlling extended headers
  generator: Actually request extended headers
  interop: Add test of 64-bit block status

 lib/internal.h                                |  31 ++-
 lib/nbd-protocol.h                            |  61 ++++-
 generator/API.ml                              | 237 ++++++++++++++++--
 generator/API.mli                             |   3 +-
 generator/C.ml                                |  24 +-
 generator/GoLang.ml                           |  35 ++-
 generator/Makefile.am                         |   3 +-
 generator/OCaml.ml                            |  20 +-
 generator/Python.ml                           |  29 ++-
 generator/state_machine.ml                    |  52 +++-
 generator/states-issue-command.c              |  31 ++-
 .../states-newstyle-opt-extended-headers.c    |  90 +++++++
 generator/states-newstyle-opt-starttls.c      |  10 +-
 generator/states-reply-structured.c           | 220 ++++++++++++----
 generator/states-reply.c                      |  31 ++-
 lib/handle.c                                  |  27 +-
 lib/rw.c                                      | 105 +++++++-
 python/t/110-defaults.py                      |   3 +-
 python/t/120-set-non-defaults.py              |   4 +-
 python/t/465-block-status-64.py               |  56 +++++
 ocaml/helpers.c                               |  22 +-
 ocaml/nbd-c.h                                 |   3 +-
 ocaml/tests/Makefile.am                       |   5 +-
 ocaml/tests/test_110_defaults.ml              |   4 +-
 ocaml/tests/test_120_set_non_defaults.ml      |   5 +-
 ocaml/tests/test_465_block_status_64.ml       |  58 +++++
 tests/meta-base-allocation.c                  | 111 +++++++-
 interop/Makefile.am                           |   6 +
 interop/large-status.c                        | 186 ++++++++++++++
 interop/large-status.sh                       |  49 ++++
 .gitignore                                    |   1 +
 golang/Makefile.am                            |   3 +-
 golang/handle.go                              |   6 +
 golang/libnbd_110_defaults_test.go            |   8 +
 golang/libnbd_120_set_non_defaults_test.go    |  12 +
 golang/libnbd_465_block_status_64_test.go     | 119 +++++++++
 36 files changed, 1511 insertions(+), 159 deletions(-)
 create mode 100644 generator/states-newstyle-opt-extended-headers.c
 create mode 100644 python/t/465-block-status-64.py
 create mode 100644 ocaml/tests/test_465_block_status_64.ml
 create mode 100644 interop/large-status.c
 create mode 100755 interop/large-status.sh
 create mode 100644 golang/libnbd_465_block_status_64_test.go

-- 
2.33.1


