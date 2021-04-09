Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 236DD35A2D6
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 18:18:52 +0200 (CEST)
Received: from localhost ([::1]:56712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUtqN-000161-5n
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 12:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lUtnf-0007L7-34
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:16:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lUtnd-0003Hk-At
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:16:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617984960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FSOm/+ZhEOPq25HnbSriniCqN0u1/TmE5wbcPo/m8Bw=;
 b=DSajuTe+ctNYxv5Df693TKcmGIrsfGqgCDiB3R0ljfpJ9bAmO4ZOQn+SDpVV45z5HQcL/G
 nALT6iMHYMWULr6L11yjDhZoeKOrYAf/3RS7Ax987rEmvCuS604g9/pqJrV7BwyTUPy+Eq
 Q0+h/hIN+7hLgPamjIDeTWJNx6IGvPY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-9SNwFDidPU-6EJIZfnJfiQ-1; Fri, 09 Apr 2021 12:15:59 -0400
X-MC-Unique: 9SNwFDidPU-6EJIZfnJfiQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A69F801FCE;
 Fri,  9 Apr 2021 16:15:58 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-63.ams2.redhat.com [10.36.115.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3823B5D6A1;
 Fri,  9 Apr 2021 16:15:57 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 00/10] Block layer fixes for 6.0-rc3
Date: Fri,  9 Apr 2021 18:15:38 +0200
Message-Id: <20210409161548.341297-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit ce69aa92d71e13db9c3702a8e8305e8d2463aeb8:

  Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-04-08 16:45:31 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to c2c731a4d35062295cd3260e66b3754588a2fad4:

  test-blockjob: Test job_wait_unpaused() (2021-04-09 18:00:29 +0200)

----------------------------------------------------------------
Block layer fixes

- mirror: Fix job-complete race condition causing unexpected errors
- fdc: Fix 'fallback' property on sysbus floppy disk controllers
- rbd: Fix memory leaks
- iotest improvements

----------------------------------------------------------------
Max Reitz (6):
      iotests/qsd-jobs: Filter events in the first test
      iotests: Test mirror-top filter permissions
      mirror: Move open_backing_file to exit_common
      mirror: Do not enter a paused job on completion
      job: Allow complete for jobs on standby
      test-blockjob: Test job_wait_unpaused()

Philippe Mathieu-Daudé (1):
      hw/block/fdc: Fix 'fallback' property on sysbus floppy disk controllers

Stefano Garzarella (2):
      block/rbd: fix memory leak in qemu_rbd_connect()
      block/rbd: fix memory leak in qemu_rbd_co_create_opts()

Vladimir Sementsov-Ogievskiy (1):
      iotests: add test for removing persistent bitmap from backing file

 block/mirror.c                                     |  28 +++--
 block/rbd.c                                        |  10 +-
 hw/block/fdc.c                                     |   4 +-
 job.c                                              |   4 +-
 tests/unit/test-blockjob.c                         | 121 +++++++++++++++++++++
 tests/qemu-iotests/tests/mirror-top-perms          | 121 +++++++++++++++++++++
 tests/qemu-iotests/tests/mirror-top-perms.out      |   5 +
 tests/qemu-iotests/tests/qsd-jobs                  |   5 +-
 tests/qemu-iotests/tests/qsd-jobs.out              |  10 --
 .../qemu-iotests/tests/remove-bitmap-from-backing  |  69 ++++++++++++
 .../tests/remove-bitmap-from-backing.out           |   6 +
 11 files changed, 349 insertions(+), 34 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/mirror-top-perms
 create mode 100644 tests/qemu-iotests/tests/mirror-top-perms.out
 create mode 100755 tests/qemu-iotests/tests/remove-bitmap-from-backing
 create mode 100644 tests/qemu-iotests/tests/remove-bitmap-from-backing.out


