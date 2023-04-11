Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3686DE29F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 19:35:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmHt6-0004qc-WB; Tue, 11 Apr 2023 13:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pmHsv-0004nJ-R7
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:34:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pmHsu-00036X-AE
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:34:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681234463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jWYj3b9fzZj1hXyDPgo+8fv9K4/RBbyMTfszG/GbV5g=;
 b=e649a39r3D/6AWRNsM/mf/GhCHnlZBIh/pZ8QyUAmz5dsDxHsrX3un3ftR4iHV8rbwn36g
 oaCQ9KGWuvwQVFit+0PPrzy9SWq0RT7pSOG/Ilfheexori9tdWSVAtYvBVlzTkAJn8bDBE
 NlQecPXOcrynoV/HOZhvIl0CIUS3hEM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-sVNUNZM-O3OeFaiuaTbLcQ-1; Tue, 11 Apr 2023 13:34:20 -0400
X-MC-Unique: sVNUNZM-O3OeFaiuaTbLcQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D92B11C0878B;
 Tue, 11 Apr 2023 17:34:19 +0000 (UTC)
Received: from localhost (unknown [10.39.194.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 50E874020C80;
 Tue, 11 Apr 2023 17:34:19 +0000 (UTC)
From: Hanna Czenczek <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Czenczek <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [PATCH v2 0/4] block: Split padded I/O vectors exceeding IOV_MAX
Date: Tue, 11 Apr 2023 19:34:14 +0200
Message-Id: <20230411173418.19549-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
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

RFC:
https://lists.nongnu.org/archive/html/qemu-block/2023-03/msg00446.html

v1:
https://lists.nongnu.org/archive/html/qemu-devel/2023-03/msg05049.html

As explained in the RFC’s cover letter, the problem this series
addresses is that we pad requests from the guest that are unaligned to
the underlying storage’s alignment requirements so they fit.  This
involves giving them head and/or tail padding.

We generally work with I/O vectors, so this padding is added via
prepending/appending vector elements.  We have a maximum limit on the
number of elements, though (1024, specifically), so it is possible that
padding has the vector exceed this limit, resulting in an unrecoverable
I/O error that is returned to the guest -- on a perfectly valid request,
as far as the guest is concerned.

To fix this, when the limit would be exceeded, this series temporarily
merges some (up to three) I/O vector element into one to decrease the
number of vector elements as far as necessary.


v2:
- Patch 1: Made a note in the commit message of having renamed
           qiov_slice() -> qemu_iovec_slice()

- Patch 2:
  - Renamed bdrv_padding_destroy() to bdrv_padding_finalize(),
    indicating that the padding is not just simply destroyed, but more
    steps may be taken (i.e. copying back the contents of the temporary
    buffer used for the merged elements)

  - Generally replaced “couple of” by “two or three”


Hanna Czenczek (4):
  util/iov: Make qiov_slice() public
  block: Collapse padded I/O vecs exceeding IOV_MAX
  util/iov: Remove qemu_iovec_init_extended()
  iotests/iov-padding: New test

 include/qemu/iov.h                       |   8 +-
 block/io.c                               | 166 +++++++++++++++++++++--
 util/iov.c                               |  89 +++---------
 tests/qemu-iotests/tests/iov-padding     |  85 ++++++++++++
 tests/qemu-iotests/tests/iov-padding.out |  59 ++++++++
 5 files changed, 314 insertions(+), 93 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/iov-padding
 create mode 100644 tests/qemu-iotests/tests/iov-padding.out

-- 
2.39.1


