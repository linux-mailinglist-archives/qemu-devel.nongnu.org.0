Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBB555FA3B
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 10:20:32 +0200 (CEST)
Received: from localhost ([::1]:34806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Sw1-0003k8-JM
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 04:20:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o6Srb-0001ET-K3; Wed, 29 Jun 2022 04:15:55 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:55312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o6SrX-0006ci-4m; Wed, 29 Jun 2022 04:15:55 -0400
Received: from myt5-4c5921969858.qloud-c.yandex.net
 (myt5-4c5921969858.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3b1a:0:640:4c59:2196])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 5CC9A2E1C81;
 Wed, 29 Jun 2022 11:15:39 +0300 (MSK)
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net [2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by myt5-4c5921969858.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 xcLq2T5krt-FcJ4P3uC; Wed, 29 Jun 2022 11:15:39 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1656490539; bh=NQU0Bk+Ft0P7If7mPLwOvuFrTfIrDyPXvS/Ht6JXCHs=;
 h=Cc:Message-Id:Date:Subject:To:From;
 b=Lk1Qm4PdW8MTIAJcpURzzMd4XiGGzoJBkB423YjWxex4C8yhK9OcA6Sbed/i5d/VU
 LD12eC+rQipsPYOm/4Hg877hcQPt/VCU0x8NxJFDB5/OT7AWb3fKQ2wZ/C4XRIZuY7
 7DtkM+AgSimnFsMYpjd+TtyKGyEblufwZrGfvw8c=
Authentication-Results: myt5-4c5921969858.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:232::1:2a])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 2dQcHHKpZi-FcMqI2Y3; Wed, 29 Jun 2022 11:15:38 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, vsementsov@yandex-team.ru,
 peter.maydell@linaro.org
Subject: [PULL v2 0/9] Block jobs & NBD patches
Date: Wed, 29 Jun 2022 11:15:15 +0300
Message-Id: <20220629081517.446432-1-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit ad4c7f529a279685da84297773b4ec8080153c2d:

  Merge tag 'pull-semi-20220628' of https://gitlab.com/rth7680/qemu into staging (2022-06-28 10:24:31 +0530)

are available in the Git repository at:

  https://gitlab.com/vsementsov/qemu.git tags/pull-block-2022-06-14-v2

for you to fetch changes up to 1b8f777673985af366de099ad4e41d334b36fb12:

  block: use 'unsigned' for in_flight field on driver state (2022-06-29 10:57:02 +0300)

----------------------------------------------------------------
Block jobs & NBD patches

v2: - add arguments to QEMUMachine constructor in test, to make it work
      on arm in gitlab pipeline
    - use bdrv_inc_in_flight() / bdrv_dec_in_flight() instead of direct
      manipulation with bs->in_flight

- add new options for copy-before-write filter
- new trace points for NBD
- prefer unsigned type for some 'in_flight' fields

Denis V. Lunev (2):
  nbd: trace long NBD operations
  block: use 'unsigned' for in_flight field on driver state

Vladimir Sementsov-Ogievskiy (7):
  block/copy-before-write: refactor option parsing
  block/copy-before-write: add on-cbw-error open parameter
  iotests: add copy-before-write: on-cbw-error tests
  util: add qemu-co-timeout
  block/block-copy: block_copy(): add timeout_ns parameter
  block/copy-before-write: implement cbw-timeout option
  iotests: copy-before-write: add cases for cbw-timeout option

 block/block-copy.c                            |  33 ++-
 block/copy-before-write.c                     | 110 ++++++---
 block/mirror.c                                |   2 +-
 block/nbd.c                                   |   8 +-
 block/trace-events                            |   2 +
 include/block/block-copy.h                    |   4 +-
 include/qemu/coroutine.h                      |  13 ++
 nbd/client-connection.c                       |   2 +
 nbd/trace-events                              |   3 +
 qapi/block-core.json                          |  31 ++-
 tests/qemu-iotests/pylintrc                   |   5 +
 tests/qemu-iotests/tests/copy-before-write    | 216 ++++++++++++++++++
 .../qemu-iotests/tests/copy-before-write.out  |   5 +
 util/meson.build                              |   1 +
 util/qemu-co-timeout.c                        |  89 ++++++++
 15 files changed, 482 insertions(+), 42 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/copy-before-write
 create mode 100644 tests/qemu-iotests/tests/copy-before-write.out
 create mode 100644 util/qemu-co-timeout.c

-- 
2.25.1


