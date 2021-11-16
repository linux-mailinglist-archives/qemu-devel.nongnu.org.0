Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3092345329F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 14:10:13 +0100 (CET)
Received: from localhost ([::1]:49298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmyDz-0006VM-KM
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 08:10:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmyAP-0003gk-Ve
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 08:06:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmyAM-000704-Ih
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 08:06:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637067985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=keXN4gsHIWiQ2odAYNtvjW5HksIt2/uKP8lyC5SuuZo=;
 b=YxgQjKRrAl0w+R71Cku/7rAWhQjHZJMWdYqFRMYF/pkwDdu75BPOmrv8rMSzXMrRwWUILJ
 PdA+Wm1uZwgKILif/aqFeeKClFe1bHU9VOUSAY0V4qimoYhiRq49/0EVgiMbxXtJugmmCt
 8/+/hCtsHww3z8gTyeCJgIN26Wqt7bQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-UM5z4TPkP7-Gsun8bDn39A-1; Tue, 16 Nov 2021 08:06:22 -0500
X-MC-Unique: UM5z4TPkP7-Gsun8bDn39A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBC9E824F87;
 Tue, 16 Nov 2021 13:06:20 +0000 (UTC)
Received: from localhost (unknown [10.39.192.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AAE65D9DE;
 Tue, 16 Nov 2021 13:06:20 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL v2 00/13] Block patches
Date: Tue, 16 Nov 2021 14:06:05 +0100
Message-Id: <20211116130618.700441-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 42f6c9179be4401974dd3a75ee72defd16b5092d:

  Merge tag 'pull-ppc-20211112' of https://github.com/legoater/qemu into staging (2021-11-12 12:28:25 +0100)

are available in the Git repository at:

  https://gitlab.com/hreitz/qemu.git tags/pull-block-2021-11-16

for you to fetch changes up to 5dbd0ce115c7720268e653fe928bb6a0c1314a80:

  file-posix: Fix alignment after reopen changing O_DIRECT (2021-11-16 11:30:29 +0100)

----------------------------------------------------------------
Block patches for 6.2.0-rc1:
- Fixes to image streaming job and block layer reconfiguration to make
  iotest 030 pass again
- docs: Deprecate incorrectly typed device_add arguments
- file-posix: Fix alignment after reopen changing O_DIRECT

----------------------------------------------------------------
v2:
- Fixed iotest 142 (modified by "file-posix: Fix alignment after reopen
  changing O_DIRECT") -- at least I hope so: for me, it now passes on a
  4k block device, and the gitlab pipeline passed, too

- Note that because I had to modify Kevin's pull request, I did not want
  to merge it partially (with a merge commit), but instead decided to
  apply all patches from the pull request mails (including their message
  IDs)

----------------------------------------------------------------
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

Kevin Wolf (2):
  docs: Deprecate incorrectly typed device_add arguments
  file-posix: Fix alignment after reopen changing O_DIRECT

Stefan Hajnoczi (1):
  softmmu/qdev-monitor: fix use-after-free in qdev_set_id()

 docs/about/deprecated.rst   |  14 +++
 include/qemu/transactions.h |   3 +
 block.c                     | 233 +++++++++++++++++++++++++++---------
 block/file-posix.c          |  20 +++-
 block/stream.c              |   7 +-
 softmmu/qdev-monitor.c      |   2 +-
 util/transactions.c         |   8 +-
 tests/qemu-iotests/030      |  11 +-
 tests/qemu-iotests/142      |  29 +++++
 tests/qemu-iotests/142.out  |  18 +++
 10 files changed, 279 insertions(+), 66 deletions(-)

-- 
2.33.1


