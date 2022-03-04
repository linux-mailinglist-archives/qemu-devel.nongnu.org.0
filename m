Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F05A04CD869
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 17:00:19 +0100 (CET)
Received: from localhost ([::1]:56352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQALr-00069U-3B
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 11:00:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nQ9zy-0007WC-Vh
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:37:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nQ9zv-0007Vq-Hz
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:37:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646408258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gDdRkUnod/NcaQxPcSnNZzWITrRwLpABy1Tl3VRgZ+Y=;
 b=VqZKHODF8WlF5G4492DCs9jlpY3r3SAUlksLpnDaW+ZJjr7XigRlWiSmlqLqFqDaG6n37e
 9nhScvvw0ZAjlQMv9huysPZKoyutBVik5ZAF0Q3godRXwSxQM3h2ANloR1NxJytN6pfF0u
 6If9C4GzpsbR2ioAgMkB/6gZqXR/fCI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-NZCTFmFxODya8yc7jKDO4A-1; Fri, 04 Mar 2022 10:37:36 -0500
X-MC-Unique: NZCTFmFxODya8yc7jKDO4A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC493824FA8;
 Fri,  4 Mar 2022 15:37:35 +0000 (UTC)
Received: from localhost (unknown [10.39.193.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 20EB783592;
 Fri,  4 Mar 2022 15:37:30 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/5] block/amend: Fix failures seen in iotest 296
Date: Fri,  4 Mar 2022 16:37:24 +0100
Message-Id: <20220304153729.711387-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I’ve tried basing my block branch on Kevin’s and noticed that after
“crypto: perform permission checks under BQL”, iotest 296 was failing.
I/We have debugged those failures and here are fixes for it.

Hence, this series is based on Kevin’s block branch
(efa33ed9b298d39e2b8c19c5f4bdd80a3b632260 at the time of writing this
cover letter).  I’ve pushed it here:

  https://gitlab.com/hreitz/qemu/-/commits/amend-job-fixes-v1

Patch 1 adds clean-up of the amend job in an error path that said commit
adds to qmp_x_blockdev_amend().

Patch 2 changes the type of a JobDriver callback added in that commit;
together with patch 3, this is kind of a matter of style, but it can
also replace patch 3 and fix the bug that it fixes in another way.

Patch 3 fixes a permission bug: When changing the permissions fails
before amend, block/crypto will still keep updating_keys to be true.
Without patch 2, that will remains so indefinitely and then
block_crypto_child_perms() will continue to unshare the CONSISTENT_READ
permission, which is wrong.  (Patch 2 fixes this problem, too,
specifically because with it, block_crypto_amend_cleanup() will always
be called when the job is dismissed, and so updating_keys will be reset
at least then.)

Patch 4 fixes an issue that’s not related to “crypto: perform permission
checks under BQL”, but it became appearent only while debugging the
other issues here, so it’s part of this series, too.

Patch 5 fixes the test itself.  It expects permission-related errors to
occur when the job is already running, not as an immediate result of the
QMP x-blockdev-amend command.  “crypto: perform permission checks under
BQL” has changed this, so the test needs to take that into account.


Ideally, I believe the following patches should be squashed into
“crypto: perform permission checks under BQL” lest bisect breaks:
- Patch 1
- Patch 2 or 3 (or both)
- Patch 5

But if that isn’t feasible, we can just take the whole series on top.


Hanna Reitz (5):
  block/amend: Clean up job on early failure
  block/amend: Always call .bdrv_amend_clean()
  block/crypto: Reset updating_keys on perm failure
  block/amend: Keep strong reference to BDS
  iotests/296: Accept early failure

 block/amend.c              |  8 ++++++--
 block/crypto.c             |  8 +++++++-
 tests/qemu-iotests/296     |  8 ++++++--
 tests/qemu-iotests/296.out | 17 +++++------------
 4 files changed, 24 insertions(+), 17 deletions(-)

-- 
2.34.1


