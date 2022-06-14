Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E806754AE92
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 12:40:24 +0200 (CEST)
Received: from localhost ([::1]:37126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o13yC-0001zc-1o
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 06:40:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o13nr-0001HL-09; Tue, 14 Jun 2022 06:29:44 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:57910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o13ne-0000k2-WB; Tue, 14 Jun 2022 06:29:42 -0400
Received: from sas1-3cba3404b018.qloud-c.yandex.net
 (sas1-3cba3404b018.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd26:0:640:3cba:3404])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 896B92E0F51;
 Tue, 14 Jun 2022 13:29:18 +0300 (MSK)
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net [2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by sas1-3cba3404b018.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 2sFsIPXKWL-THM4DHMj; Tue, 14 Jun 2022 13:29:18 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1655202558; bh=stQScY/NL/quOdr2doN/0alnVABZaEzzGdL+sZN0dkM=;
 h=Cc:Message-Id:Date:Subject:To:From;
 b=RJDJenYSQAcoZs4VUp+g9zDadaIn7DkADfvoI2JNDwJfDKE+VTgcQ9axX0ajcIefM
 us98bwC2WK7ntmDWyDkhudKxkJ9T5UmEijQ3W1kgq72Pwt1qu9+o2rhnsaiB0iHQXL
 I3UIs32EgxkshlTXTUarp7SjZDW3aFvHZPNqBjcQ=
Authentication-Results: sas1-3cba3404b018.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:a427::1:2e])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 15x97ivcvu-THMmldmQ; Tue, 14 Jun 2022 13:29:17 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@yandex-team.ru, peter.maydell@linaro.org
Subject: [PULL 00/10] Block jobs & NBD patches
Date: Tue, 14 Jun 2022 13:29:00 +0300
Message-Id: <20220614102910.1431380-1-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit debd0753663bc89c86f5462a53268f2e3f680f60:

  Merge tag 'pull-testing-next-140622-1' of https://github.com/stsquad/qemu into staging (2022-06-13 21:10:57 -0700)

are available in the Git repository at:

  https://gitlab.com/vsementsov/qemu.git tags/pull-block-2022-06-14

for you to fetch changes up to 5aef6747a250f545ff53ba7e1a3ed7a3d166011a:

  MAINTAINERS: update Vladimir's address and repositories (2022-06-14 12:51:48 +0300)

----------------------------------------------------------------
Block jobs & NBD patches

- add new options for copy-before-write filter
- new trace points for NBD
- prefer unsigned type for some 'in_flight' fields
- update my addresses in MAINTAINERS (already in Stefan's tree, but
  I think it's OK to send it with this PULL)


Note also, that I've recently updated my pgp key with new address and
new expire time.
Updated key is here: https://keys.openpgp.org/search?q=vsementsov%40yandex-team.ru

----------------------------------------------------------------

Denis V. Lunev (2):
  nbd: trace long NBD operations
  block: use 'unsigned' for in_flight field on driver state

Vladimir Sementsov-Ogievskiy (8):
  block/copy-before-write: refactor option parsing
  block/copy-before-write: add on-cbw-error open parameter
  iotests: add copy-before-write: on-cbw-error tests
  util: add qemu-co-timeout
  block/block-copy: block_copy(): add timeout_ns parameter
  block/copy-before-write: implement cbw-timeout option
  iotests: copy-before-write: add cases for cbw-timeout option
  MAINTAINERS: update Vladimir's address and repositories

 MAINTAINERS                                   |  22 +-
 block/block-copy.c                            |  33 ++-
 block/copy-before-write.c                     | 111 ++++++---
 block/mirror.c                                |   2 +-
 block/nbd.c                                   |   8 +-
 block/trace-events                            |   2 +
 include/block/block-copy.h                    |   4 +-
 include/qemu/coroutine.h                      |  13 ++
 nbd/client-connection.c                       |   2 +
 nbd/trace-events                              |   3 +
 qapi/block-core.json                          |  31 ++-
 tests/qemu-iotests/pylintrc                   |   5 +
 tests/qemu-iotests/tests/copy-before-write    | 213 ++++++++++++++++++
 .../qemu-iotests/tests/copy-before-write.out  |   5 +
 util/meson.build                              |   1 +
 util/qemu-co-timeout.c                        |  89 ++++++++
 16 files changed, 492 insertions(+), 52 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/copy-before-write
 create mode 100644 tests/qemu-iotests/tests/copy-before-write.out
 create mode 100644 util/qemu-co-timeout.c

-- 
2.25.1


