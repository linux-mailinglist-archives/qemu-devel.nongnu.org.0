Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A30DD4F3551
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 15:49:56 +0200 (CEST)
Received: from localhost ([::1]:51250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbjZD-0003Dg-Dc
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 09:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nbjWQ-0000ye-IK
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 09:47:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nbjWN-0004bZ-7w
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 09:47:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649166417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6uQlIwCtnokk/73FszIaf6Dyfd0ACaH69A8PB7ZKPkE=;
 b=R2/kbagJ0i4pVkqiNLSkcFuK78NVK5KgLgkAB91wdSHXQ4QoccF7ObRxBDVkUkwCTiTMDu
 QlKarD48Nuzd7bNGzEVJr4YTOAOtjlEZzX8SpJoN3/u3G+65v3UWFLDqSLFc1vjnOt2HQu
 bsn81vyKPPUcU1QiYVYTmj+81vPqTS0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-xQIrxUwCPXOa-78f7BF6Zg-1; Tue, 05 Apr 2022 09:46:54 -0400
X-MC-Unique: xQIrxUwCPXOa-78f7BF6Zg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72B8B3C11A18;
 Tue,  5 Apr 2022 13:46:54 +0000 (UTC)
Received: from localhost (unknown [10.39.195.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CBDA40D284F;
 Tue,  5 Apr 2022 13:46:54 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 0/3] qcow2: Improve refcount structure rebuilding
Date: Tue,  5 Apr 2022 15:46:49 +0200
Message-Id: <20220405134652.19278-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

v2 cover letter:
https://lists.nongnu.org/archive/html/qemu-block/2022-03/msg01260.html

v1 cover letter:
https://lists.nongnu.org/archive/html/qemu-block/2021-03/msg00651.html

This series fixes the qcow2 refcount structure rebuilding mechanism for
when the qcow2 image file doesn’t allow writes beyond the end of file
(e.g. because it’s on an LVM block device).

v3:
- Added patch 3 (didn’t squash this into patch 1, because (a) Eric gave
  his R-b on 1 as-is, and (b) I ended up retouching
  rebuild_refcount_structure() as a whole, not just the new helper, so a
  dedicated patch made more sense)
- In patch 1: Changed `assert(reftable_size_changed == true)` to just
  `assert(reftable_size_changed)`
- In patch 2: In comments, replaced “were” by “was”


git-backport-diff against v2:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/3:[0002] [FC] 'qcow2: Improve refcount structure rebuilding'
002/3:[0006] [FC] 'iotests/108: Test new refcount rebuild algorithm'
003/3:[down] 'qcow2: Add errp to rebuild_refcount_structure()'


Hanna Reitz (3):
  qcow2: Improve refcount structure rebuilding
  iotests/108: Test new refcount rebuild algorithm
  qcow2: Add errp to rebuild_refcount_structure()

 block/qcow2-refcount.c     | 353 ++++++++++++++++++++++++++-----------
 tests/qemu-iotests/108     | 259 ++++++++++++++++++++++++++-
 tests/qemu-iotests/108.out |  81 +++++++++
 3 files changed, 587 insertions(+), 106 deletions(-)

-- 
2.35.1


