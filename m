Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 015A3403A65
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 15:14:34 +0200 (CEST)
Received: from localhost ([::1]:36724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNxPN-0000xN-0c
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 09:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mNxLd-0002aK-LO
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 09:10:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mNxLX-0007hw-Od
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 09:10:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631106634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4Tu2qSao2o0N56tGLZHvT0NeCGinHawN9xiHRzAgbBg=;
 b=Tlw/kjc2ZuRzPG0SjXkokVuD6bLxOyTbhRqG6WH6O4IAQxjYG5Ft3g17Z4ELzFCm9xoaK0
 KlAVnvhvkyWgXcv/ujj+sQeJ4N5pim5UkHJdhWlFI27qD3YChNPXQBMTH+Gi2E7WwLPN/O
 jxQY5OYSro2vWAtA7Ce0+GE+96F3/dg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-0ljJywvpNvmK0-bP8YFqiQ-1; Wed, 08 Sep 2021 09:10:32 -0400
X-MC-Unique: 0ljJywvpNvmK0-bP8YFqiQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 475C518D6A38;
 Wed,  8 Sep 2021 13:10:30 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13644188E4;
 Wed,  8 Sep 2021 13:10:24 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 0/4] block layer: split block APIs in graph and I/O
Date: Wed,  8 Sep 2021 09:10:17 -0400
Message-Id: <20210908131021.774533-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, block layer APIs like block-backend.h contain a mix of
functions that are either running in the main loop and under the
BQL, or are thread-safe functions and run in iothreads performing I/O.
The functions running under BQL also take care of modifying the
block graph, by using drain and/or aio_context_acquire/release.
This makes it very confusing to understand where each function
runs, and what assumptions it provided with regards to thread
safety.

We call the functions running under BQL "graph API", and 
distinguish them from the thread-safe "I/O API".

The aim of this series is to split the relevant block headers in 
graph and I/O sub-headers. The division will be done in this way:
header.h will be split in header-graph.h, header-io.h and
header-common.h. The latter will just contain the data structures
needed by header-graph and header-io. header.h will remain for
legacy and to avoid changing all includes in all QEMU c files,
but will only include the two new headers.
Once we split all relevant headers, it will be much easier to see what
uses the AioContext lock and remove it, which is the overall main
goal of this and other series that I posted/will post.

RFC: I am happy to change all includes, if you think that it would
be better than leaving an empty header.h file.

The relevant headers I found so far are:
- block-backend.h
- block.h
- block_int.h
- backup-top.h and blockdev.h (but contain very few functions)
Once these are done, we would also need to audit the callback
offered by struct Jobdriver, BlockDevOps and BlockDriver.

Each function in the graph API will have an assertion, checking
that it is always running under BQL.
I/O functions are instead thread safe (or so should be), meaning
that they *can* run under BQL, but also in an iothread in another
AioContext. Therefore they do not provide any assertion, and
need to be audited manually to verify the correctness.
RFC: Any idea on how to guarantee I/O functions is welcome.

Adding assetions has helped finding a bug already, as shown in
patch 2.

RFC: Because this task is very time consuming and requires a lot
of auditing, this series only provide block-backend.h split,
to gather initial feedbacks.

Tested this series by running unit tests, qemu-iotests and qtests 
(x86_64)
Some functions in the graph API are used everywhere but not
properly tested. Therefore their assertion is never actually run in
the tests, so despite my very careful auditing, it is not impossible
to exclude that some will trigger while actually using QEMU.

Patch 1 introduces qemu_in_main_thread(), the function used in
all assertions. This had to be introduced otherwise all unit tests
would fail, since they run in the main loop but use the code in
stubs/iothread.c
Patch 2 fixes a bug that came up when auditing the code.
Patch 3 splits block-backend header, and to reduce the diff 
I moved the assertions in patch 4.

Next steps:
1) if this series gets positive comments, convert block.h and block_int.h
2) audit graph API and replace the AioContext lock with drains,
or remove them when not necessary (requires further discussion,
not necessary now).
3) [optional as it should be already the case] audit the I/O API
and check that thread safety is guaranteed

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Emanuele Giuseppe Esposito (4):
  main-loop.h: introduce qemu_in_main_thread()
  migration: block-dirty-bitmap: add missing qemu_mutex_lock_iothread
  include/sysemu/block-backend: split header into I/O and graph API
  block/block-backend.c: assertions for block-backend

 block/block-backend.c                 | 102 +++++++++-
 include/qemu/main-loop.h              |  13 ++
 include/sysemu/block-backend-common.h |  74 ++++++++
 include/sysemu/block-backend-graph.h  | 132 +++++++++++++
 include/sysemu/block-backend-io.h     | 123 ++++++++++++
 include/sysemu/block-backend.h        | 262 +-------------------------
 migration/block-dirty-bitmap.c        |   5 +-
 softmmu/cpus.c                        |   5 +
 softmmu/qdev-monitor.c                |   2 +
 stubs/iothread-lock.c                 |   5 +
 10 files changed, 459 insertions(+), 264 deletions(-)
 create mode 100644 include/sysemu/block-backend-common.h
 create mode 100644 include/sysemu/block-backend-graph.h
 create mode 100644 include/sysemu/block-backend-io.h

-- 
2.27.0


