Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1F94D863D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 14:53:07 +0100 (CET)
Received: from localhost ([::1]:40784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTl8E-0003Ym-Rw
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 09:53:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTkbP-0001Jv-5K
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:19:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTkbM-0006Xn-89
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:19:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647263947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bzxWq4PNIMc4peu9oFQQY25QNGWn40DfCAB0PZS36d4=;
 b=TMfiYydp6dDMWPaWSgtxnYOTatFuf01Q+rr2h2+Ru+KCATNYDlWymw4mx8XzZC+cB2XntV
 G6CIxtM3QEND6z1PG0nlucd9zNII5bU3mWBdVJ0xpIZx/uR3/3eZC46htR6D1QoTIeEDjm
 +2zos/KFIV+fK66wvhw8ZQflbUesXpg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-JUkpJK1vOqyxcGjQknU6hA-1; Mon, 14 Mar 2022 09:19:04 -0400
X-MC-Unique: JUkpJK1vOqyxcGjQknU6hA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F2C1899ECB;
 Mon, 14 Mar 2022 13:19:04 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45C701686D;
 Mon, 14 Mar 2022 13:18:58 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 00/10] block: bug fixes in preparation of AioContext removal
Date: Mon, 14 Mar 2022 09:18:44 -0400
Message-Id: <20220314131854.2202651-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This serie aims to remove and clean up some bugs that came up
when trying to replace the AioContext lock and still protect
BlockDriverState fields.

They were part of the serie "Removal of Aiocontext lock
through drains: protect bdrv_replace_child_noperm", but since
that serie is still a work in progress and these fixes are
pretty much independent, I split that in two separate series.

---
v2:
* change comments in patch 2 and 3, .attach() and .detach() callbacks.
* remove job_sleep_ns patch, as it was causing random deadlocks in test 030

Emanuele Giuseppe Esposito (10):
  drains: create bh only when polling
  bdrv_parent_drained_begin_single: handle calls from coroutine context
  block/io.c: fix bdrv_child_cb_drained_begin invocations from a
    coroutine
  block.c: bdrv_replace_child_noperm: first remove the child, and then
    call ->detach()
  block.c: bdrv_replace_child_noperm: first call ->attach(), and then
    add child
  test-bdrv-drain.c: adapt test to the coming subtree drains
  test-bdrv-drain.c: remove test_detach_by_parent_cb()
  tests/unit/test-bdrv-drain.c: graph setup functions can't run in
    coroutines
  child_job_drained_poll: override polling condition only when in home
    thread
  tests/qemu-iotests/030: test_stream_parallel should use
    auto_finalize=False

 block.c                      |  41 ++++++---
 block/io.c                   | 137 +++++++++++++++++++++++++---
 blockjob.c                   |  13 ++-
 include/block/block-io.h     |  20 +++--
 tests/qemu-iotests/030       |  12 +--
 tests/unit/test-bdrv-drain.c | 169 +++++++++++++++++++----------------
 6 files changed, 267 insertions(+), 125 deletions(-)

-- 
2.31.1


