Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FBE3B1D1C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 17:04:03 +0200 (CEST)
Received: from localhost ([::1]:58008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw4Q6-0007ue-7U
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 11:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lw4O9-0004pP-2e
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:02:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lw4O3-0004kO-D9
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:02:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624460514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cO8sxFgxu9zJtiMdUA+/zw6utx458UpzjvsfKCEphHY=;
 b=KXu26kwwVrEvSnftjOTURe7RpCyivQreArM0z4ZYAvYOo1fpkEmUM/OLO6FAoBr+99bR8M
 frCDtVzo+Y6nhVbv6wX/CC/TtYXUU0S5MWpR/287MgEi/FstqxVNSpihRcDi1FQQXRbLAy
 IearXO3CARl5rZ4AZSgUaRg26b/4gv0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-2HdPQkEPP62rgzxEPVrCvw-1; Wed, 23 Jun 2021 11:01:47 -0400
X-MC-Unique: 2HdPQkEPP62rgzxEPVrCvw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0623C1932481;
 Wed, 23 Jun 2021 15:01:46 +0000 (UTC)
Received: from localhost (ovpn-113-73.ams2.redhat.com [10.36.113.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8899619D7C;
 Wed, 23 Jun 2021 15:01:45 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 0/6] block: block-status cache for data regions
Date: Wed, 23 Jun 2021 17:01:37 +0200
Message-Id: <20210623150143.188184-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

See the cover letter from v1 for the general idea:

https://lists.nongnu.org/archive/html/qemu-block/2021-06/msg00843.html


The biggest change here in v2 is that instead of having a common CoMutex
protect the block-status cache, we’re using RCU now.  So to read from
the cache, or even to invalidate it, no lock is needed, only to update
it with new data.

Disclaimer: I have no experience with RCU in practice so far, neither in
qemu nor anywhere else.  So I hope I’ve used it correctly...


Differences to v1 in detail:
- Patch 2:
  - Moved BdrvBlockStatusCache.lock up to BDS, it is now the RCU writer
    lock
  - BDS.block_status_cache is now a pointer, so it can be replaced with
    RCU
  - Moved all cache access functionality into helper functions
    (bdrv_bsc_is_data(), bdrv_bsc_invalidate_range(), bdrv_bsc_fill())
    in block.c
  - Guard BSC accesses with RCU
    (BSC.valid is to be accessed atomically, which allows resetting it
    without taking an RCU write lock)
  - Check QLIST_EMPTY(&bs->children) not just when reading from the
    cache, but when filling it, too (so we don’t need an RCU update when
    it won’t make sense)
- Patch 3: Added
- Dropped the block/nbd patch (because it would make NBD query a larger
  range; the patch’s intent was to get more information for free, which
  this would not be)


git-backport-diff against v1:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/6:[----] [--] 'block: Drop BDS comment regarding bdrv_append()'
002/6:[0169] [FC] 'block: block-status cache for data regions'
003/6:[down] 'block: Clarify that @bytes is no limit on *pnum'
004/6:[----] [--] 'block/file-posix: Do not force-cap *pnum'
005/6:[----] [--] 'block/gluster: Do not force-cap *pnum'
006/6:[----] [--] 'block/iscsi: Do not force-cap *pnum'


Max Reitz (6):
  block: Drop BDS comment regarding bdrv_append()
  block: block-status cache for data regions
  block: Clarify that @bytes is no limit on *pnum
  block/file-posix: Do not force-cap *pnum
  block/gluster: Do not force-cap *pnum
  block/iscsi: Do not force-cap *pnum

 include/block/block_int.h | 54 +++++++++++++++++++++++--
 block.c                   | 84 +++++++++++++++++++++++++++++++++++++++
 block/file-posix.c        |  7 ++--
 block/gluster.c           |  7 ++--
 block/io.c                | 61 ++++++++++++++++++++++++++--
 block/iscsi.c             |  3 --
 6 files changed, 200 insertions(+), 16 deletions(-)

-- 
2.31.1


