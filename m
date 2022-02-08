Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 195CA4ADEA1
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 17:50:50 +0100 (CET)
Received: from localhost ([::1]:55940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHThZ-00074f-7a
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 11:50:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHSYc-0000SL-TA
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:37:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHSYH-0002en-TK
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:37:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644334628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7/JMXpacklYPGw2A2ZgDRVorqb9v+m/H8r57fqv039I=;
 b=K/jgNAi6ZY1bDhO5ZRzQjl4D9O06c+fRRwjB3hBBX502MDtNd5fY8vIYZx9zzKetXT5VJg
 HSJ1A+69j7TjS2lAB1ZOPXnzmSIG2I0Iy56zfqwNn9viM0V8Qbhc+WI5OW34zaux7NGGN8
 pXloTh5qrelMxcJ++hnDK3TiZ14Lrs0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-_K_nh0WfMdWh9YCs2p-kAA-1; Tue, 08 Feb 2022 10:37:00 -0500
X-MC-Unique: _K_nh0WfMdWh9YCs2p-kAA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDDA283DD21;
 Tue,  8 Feb 2022 15:36:58 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC8F87D473;
 Tue,  8 Feb 2022 15:36:57 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/6] block: bug fixes in preparation of AioContext removal
Date: Tue,  8 Feb 2022 10:36:49 -0500
Message-Id: <20220208153655.1251658-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This serie is based on "job: replace AioContext lock with job_mutex"

Based-on: <20220208143513.1077229-1-eesposit@redhat.com>

Emanuele Giuseppe Esposito (6):
  block/io.c: fix bdrv_child_cb_drained_begin invocations from a
    coroutine
  block.c: bdrv_replace_child_noperm: first remove the child, and then
    call ->detach()
  block.c: bdrv_replace_child_noperm: first call ->attach(), and then
    add child
  test-bdrv-drain.c: adapt test to the coming subtree drains
  test-bdrv-drain.c: remove test_detach_by_parent_cb()
  jobs: ensure sleep in job_sleep_ns is fully performed

 block.c                      | 18 +++++++-----
 block/io.c                   |  7 ++++-
 include/block/block-io.h     |  8 ++++--
 job.c                        | 19 +++++++------
 tests/qemu-iotests/030       |  2 +-
 tests/qemu-iotests/151       |  4 +--
 tests/unit/test-bdrv-drain.c | 53 ++++++++++++------------------------
 tests/unit/test-blockjob.c   |  2 +-
 8 files changed, 55 insertions(+), 58 deletions(-)

-- 
2.31.1


