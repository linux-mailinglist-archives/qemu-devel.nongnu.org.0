Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 801B844D660
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 13:11:57 +0100 (CET)
Received: from localhost ([::1]:46376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml8vs-0003Qy-BB
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 07:11:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ml8sn-0008Px-RR
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 07:08:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ml8sh-0002zb-Rn
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 07:08:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636632518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dMGJPP2Wwxt5DXFq9QQ64wRZRQ8Qq6fx6fVROR097IM=;
 b=PfhLduO/3gp8+u+IEki4Ma1RKmBI1xUUlRcDOvQWDXvbjAYRXL0Iu4CCNCMf35a1vYbmsp
 xvRt3HY3+UKsciST2bCv7unOFv7tZ2jR0gxlGkoopvFI/WnUNIxGF3jmriu0VakbPZbNmW
 xcMtPU6cObXUjLb/RjiYFftFj93+kNA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-5M3iZHAeOaa0yEPtzpPHOw-1; Thu, 11 Nov 2021 07:08:35 -0500
X-MC-Unique: 5M3iZHAeOaa0yEPtzpPHOw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 397FC81C85D;
 Thu, 11 Nov 2021 12:08:34 +0000 (UTC)
Received: from localhost (unknown [10.39.193.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D18CB19C59;
 Thu, 11 Nov 2021 12:08:30 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 00/10] block: Attempt on fixing 030-reported errors
Date: Thu, 11 Nov 2021 13:08:19 +0100
Message-Id: <20211111120829.81329-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

v1 cover letter:
https://lists.nongnu.org/archive/html/qemu-devel/2021-11/msg01287.html

In v2 I’ve addressed the comments I’ve received from Kevin and Vladimir.
To this end, I’ve retained only the non-controversial part in patch 5,
and split everything else (i.e. the stuff relating to
bdrv_replace_child_tran()) into the dedicated patches 6 and 8.

Kevin’s most important comments (to my understanding) were that:

(A) When bdrv_remove_file_or_backing_child() uses
    bdrv_replace_child_tran(), we have to ensure that the BDS lives as
    long as the transaction does.  This is solved by keeping a strong
    reference to it that’s released only when the transaction is cleaned
    up (and the new patch 7 ensures that the .clean() handler will be
    invoked after all .commit()/.abort() handlers, so the reference will
    really live as long as the transaction does).

(B) bdrv_replace_node_noperm() passes a pointer to loop-local variable,
    which is a really bad idea considering the transaction lives much
    longer than one loop iteration.
    Luckily, the new_bs it passes is always non-NULL, and so
    bdrv_replace_child_tran() actually doesn’t need to store the
    BdrvChild ** pointer, because for a non-NULL new_bs, there is
    nothing to revert in the abort handler.  We just need to clarify
    this, not store the pointer in case of a non-NULL new_bs, and assert
    that bdrv_replace_node_noperm() and its relatives are only used to
    replace an existing node by some other existing (i.e. non-NULL)
    node.


git-backport-diff against v1:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/10:[----] [--] 'stream: Traverse graph after modification'
002/10:[0005] [FC] 'block: Manipulate children list in .attach/.detach'
003/10:[----] [--] 'block: Unite remove_empty_child and child_free'
004/10:[----] [--] 'block: Drop detached child from ignore list'
005/10:[0040] [FC] 'block: Pass BdrvChild ** to replace_child_noperm'
006/10:[down] 'block: Restructure remove_file_or_backing_child()'
007/10:[down] 'transactions: Invoke clean() after everything else'
008/10:[down] 'block: Let replace_child_tran keep indirect pointer'
009/10:[0020] [FC] 'block: Let replace_child_noperm free children'
010/10:[----] [--] 'iotests/030: Unthrottle parallel jobs in reverse'


Detailed per-patch changes:

Patch 2:
 - Dropped stale comment about undoing bdrv_attach_child_noperm()’s list
   insertion in the respective abort handler

Patch 5:
 - Split off everything related to bdrv_replace_child_tran()

Patch 6:
 - Added (split off from patch 5)
 - Keep the `if (!child) { return; }` path before getting childp

Patch 7:
 - Added: I wanted bdrv_remove_file_or_backing_child() to keep a strong
   BDS reference throughout the transaction, and the simplest way (i.e.
   the one where I wouldn’t have to think too hard) was to add this
   patch and have transactions invoke .clean() after all
   .commit()/.abort() handlers are done.  This way we can just drop the
   reference in .clean() and need not care about the order the
   transaction actions were added in.

Patch 8:
 - Added (split off from patch 5)
 - The BdrvChild ** pointer is now only stored in the
   BdrvReplaceChildState if new_bs is NULL.  Otherwise, we don’t need
   it, because we won’t need to reinstate the child in the abort
   handler.  This way we don’t have to worry about
   bdrv_replace_node_noperm() passing a pointer to a loop-local
   variable (because the new_bs it passes is never NULL).
 - In the same vein, assert that bdrv_replace_node() and relatives
   cannot be called to replace the node by NULL.
 - Have bdrv_remove_file_or_backing_child() keep a strong reference to
   the parent BDS throughout the transaction, so the &bs->backing or
   &bs->file pointer remains valid
 - Moved the comment explaining why we want to pass &s->child instead of
   s->childp to bdrv_replace_child_noperm() in
   bdrv_replace_child_abort() from patch 9 here (and also keep passing
   &s->child instead of s->childp).  It is already relevant now that
   s->childp is valid only if new_bs is NULL.

Patch 9:
 - The comment this used to add to bdrv_replace_child_abort() is now
   already added by patch 8, we just need to drop the TODO note there
 - Also drop the TODO note above bdrv_replace_child_tran()


Hanna Reitz (10):
  stream: Traverse graph after modification
  block: Manipulate children list in .attach/.detach
  block: Unite remove_empty_child and child_free
  block: Drop detached child from ignore list
  block: Pass BdrvChild ** to replace_child_noperm
  block: Restructure remove_file_or_backing_child()
  transactions: Invoke clean() after everything else
  block: Let replace_child_tran keep indirect pointer
  block: Let replace_child_noperm free children
  iotests/030: Unthrottle parallel jobs in reverse

 include/qemu/transactions.h |   3 +
 block.c                     | 233 +++++++++++++++++++++++++++---------
 block/stream.c              |   7 +-
 util/transactions.c         |   8 +-
 tests/qemu-iotests/030      |  11 +-
 5 files changed, 201 insertions(+), 61 deletions(-)

-- 
2.33.1


