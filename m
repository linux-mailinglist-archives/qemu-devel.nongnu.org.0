Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E41443276
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:13:59 +0100 (CET)
Received: from localhost ([::1]:44108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwQA-0003ZO-9t
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mhwIL-0007CH-QO
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:05:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mhwIJ-0004F7-7U
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:05:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635869147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wFAG12TFUonEgHqAWykZHokIHHnqGqDegloYCCpAxnQ=;
 b=XQ1KDBE5xTfbmhCOnBlfOjvaSMdfDcN0cJWsdPYXLyM8V73BVA7UyKao39PDeLVPqMbz5J
 9SXNohaZs2BT51qMTbtRDVnFWYqmt2p9Ubf0qA1ZQjgqpBAjRTXNXTbdw0qs6GWTz7p6Jm
 bpLViglYvTPk5JDxSbc4FNLV29KPmuU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-yMYcRpHLNzKqNEyjW-f8GA-1; Tue, 02 Nov 2021 12:05:46 -0400
X-MC-Unique: yMYcRpHLNzKqNEyjW-f8GA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5104810A8E06;
 Tue,  2 Nov 2021 16:05:45 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 471F55D9D3;
 Tue,  2 Nov 2021 16:05:44 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 00/12] Block layer patches
Date: Tue,  2 Nov 2021 17:05:16 +0100
Message-Id: <20211102160528.206766-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 8cb41fda78c7ebde0dd248c6afe1d336efb0de50:

  Merge remote-tracking branch 'remotes/philmd/tags/machine-20211101' into staging (2021-11-02 05:53:45 -0400)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to a8951438946d72d74c9bdbdb38fce95aa2973a88:

  block/nvme: Extract nvme_free_queue() from nvme_free_queue_pair() (2021-11-02 15:49:13 +0100)

----------------------------------------------------------------
Block layer patches

- Fail gracefully when blockdev-snapshot creates loops
- ide: Fix IDENTIFY DEVICE for disks > 128 GiB
- file-posix: Fix return value translation for AIO discards
- file-posix: add 'aio-max-batch' option
- rbd: implement bdrv_co_block_status
- Code cleanups and build fixes

----------------------------------------------------------------
Ari Sundholm (1):
      block/file-posix: Fix return value translation for AIO discards

Fabrice Fontaine (1):
      block/export/fuse.c: fix musl build

Hanna Reitz (1):
      block-backend: Silence clang -m32 compiler warning

Kevin Wolf (1):
      block: Fail gracefully when blockdev-snapshot creates loops

Peter Lieven (1):
      block/rbd: implement bdrv_co_block_status

Philippe Mathieu-Daudé (3):
      block/nvme: Automatically free qemu_memalign() with QEMU_AUTO_VFREE
      block/nvme: Display CQ/SQ pointer in nvme_free_queue_pair()
      block/nvme: Extract nvme_free_queue() from nvme_free_queue_pair()

Samuel Thibault (1):
      ide: Cap LBA28 capacity announcement to 2^28-1

Stefano Garzarella (3):
      file-posix: add `aio-max-batch` option
      linux-aio: add `dev_max_batch` parameter to laio_co_submit()
      linux-aio: add `dev_max_batch` parameter to laio_io_unplug()

 qapi/block-core.json       |   7 +++
 include/block/raw-aio.h    |   6 ++-
 block.c                    |  10 ++++
 block/block-backend.c      |   2 +-
 block/export/fuse.c        |   4 ++
 block/file-posix.c         |  18 ++++++--
 block/linux-aio.c          |  38 ++++++++++-----
 block/nvme.c               |  22 +++++----
 block/rbd.c                | 112 +++++++++++++++++++++++++++++++++++++++++++++
 hw/ide/core.c              |   8 +++-
 block/trace-events         |   2 +-
 tests/qemu-iotests/085     |  31 ++++++++++++-
 tests/qemu-iotests/085.out |  33 +++++++++++--
 13 files changed, 258 insertions(+), 35 deletions(-)


