Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 289913EA0CB
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 10:44:28 +0200 (CEST)
Received: from localhost ([::1]:38558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE6KB-00082q-7V
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 04:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mE6Hr-0004fl-51
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 04:42:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mE6Hl-0004d1-C6
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 04:42:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628757714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SptR4KPFPr6txMhY44RudKna8vmR1uI9zzfY4nzGahU=;
 b=SXvfAcvLKTOX8z5DT8nVaCb+hUZefiBchflsRyqQKYwQxdzU15k9S7owoA3PUA6Ub6ponW
 g9HDdHwIFmVbqrZdbLe55ZKMjWUdsm1a34dGrf6p7ewWErPyuNDdLoEuKkNo8zxGQ3jKgH
 Ui+8iMIsvFKKAd86VaEYh/9VE5ZC5HA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-eWVtUnKbN1mKjlspa7q0xw-1; Thu, 12 Aug 2021 04:41:52 -0400
X-MC-Unique: eWVtUnKbN1mKjlspa7q0xw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D38B4190B2A1;
 Thu, 12 Aug 2021 08:41:50 +0000 (UTC)
Received: from localhost (unknown [10.39.193.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6788C18C7A;
 Thu, 12 Aug 2021 08:41:50 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 0/6] block-status cache for data regions
Date: Thu, 12 Aug 2021 10:41:42 +0200
Message-Id: <20210812084148.14458-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

See the cover letter from v1 for the general idea:
https://lists.nongnu.org/archive/html/qemu-block/2021-06/msg00843.html

Cover letter from v2, introducing RCU locking:
https://lists.nongnu.org/archive/html/qemu-block/2021-06/msg01060.html


v3:
- Patch 2:
  - Add rcu_head object to BdrvBlockStatusCache, so we can use
    g_free_rcu() to free it instead of synchronize_rcu()+g_free()
  - Use qatomic_rcu_read() every time we read bs->block_status_cache
    (except in bdrv_close(), where no concurrency is possible)
  - Use RCU_READ_LOCK_GUARD() instead of WITH_RCU_READ_LOCK_GUARD() in
    functions where we lock the whole scope anyway
  - Same for QEMU_LOCK_GUARD() instead of WITH_QEMU_LOCK_GUARD() in
    bdrv_bsc_fill()
  - Drop from_cache variable in bdrv_co_block_status()
    (was an artifact from v1, which had a different control flow and
    needed this variable)
  - Assert that local_map returned from a protocol driver’s
    bdrv_co_block_status() implementation is equal to the offset we
    passed to it (see comment there for why we should do this)

- Patch 3:
  - Add note why block drivers should return larger *pnum values in
    addition to just saying that it’s allowed


git-backport-diff against v2:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/6:[----] [--] 'block: Drop BDS comment regarding bdrv_append()'
002/6:[0063] [FC] 'block: block-status cache for data regions'
003/6:[0004] [FC] 'block: Clarify that @bytes is no limit on *pnum'
004/6:[----] [--] 'block/file-posix: Do not force-cap *pnum'
005/6:[----] [--] 'block/gluster: Do not force-cap *pnum'
006/6:[----] [--] 'block/iscsi: Do not force-cap *pnum'


Hanna Reitz (6):
  block: Drop BDS comment regarding bdrv_append()
  block: block-status cache for data regions
  block: Clarify that @bytes is no limit on *pnum
  block/file-posix: Do not force-cap *pnum
  block/gluster: Do not force-cap *pnum
  block/iscsi: Do not force-cap *pnum

 include/block/block_int.h | 61 +++++++++++++++++++++++++++--
 block.c                   | 80 +++++++++++++++++++++++++++++++++++++++
 block/file-posix.c        |  7 ++--
 block/gluster.c           |  7 ++--
 block/io.c                | 65 +++++++++++++++++++++++++++++--
 block/iscsi.c             |  3 --
 6 files changed, 207 insertions(+), 16 deletions(-)

-- 
2.31.1


