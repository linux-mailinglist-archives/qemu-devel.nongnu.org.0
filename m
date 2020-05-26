Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 091111C84C4
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 10:26:56 +0200 (CEST)
Received: from localhost ([::1]:55736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWbrr-0007EX-2f
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 04:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1jWbqo-0005yG-4m; Thu, 07 May 2020 04:25:50 -0400
Received: from relay.sw.ru ([185.231.240.75]:37766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1jWbql-0004md-PF; Thu, 07 May 2020 04:25:49 -0400
Received: from dptest2.qa.sw.ru ([10.94.4.71])
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <dplotnikov@virtuozzo.com>)
 id 1jWbqa-00024P-5H; Thu, 07 May 2020 11:25:36 +0300
From: Denis Plotnikov <dplotnikov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v24 0/4] implement zstd cluster compression method
Date: Thu,  7 May 2020 11:25:17 +0300
Message-Id: <20200507082521.29210-1-dplotnikov@virtuozzo.com>
X-Mailer: git-send-email 2.17.0
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=dplotnikov@virtuozzo.com; helo=relay.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 04:25:44
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 qemu-block@nongnu.org, armbru@redhat.com, mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v24:
   01: add "compression_type" to the tests output [Max]
       hopefully, I've found them all.

v23:
   Undecided: whether to add zstd(zlib) compression
              details to the qcow2 spec
   03: tighten assertion on zstd decompression [Eric]
   04: use _rm_test_img appropriately [Max]

v22:
   03: remove assignemnt in if condition

v21:
   03:
       * remove the loop on compression [Max]
       * use designated initializers [Max]
   04:
       * don't erase user's options [Max]
       * use _rm_test_img [Max]
       * add unsupported qcow2 options [Max]

v20:
   04: fix a number of flaws [Vladimir]
       * don't use $RAND_FILE passing to qemu-io,
         so check $TEST_DIR is redundant
       * re-arrage $RAND_FILE writing
       * fix a typo

v19:
   04: fix a number of flaws [Eric]
       * remove rudundant test case descriptions
       * fix stdout redirect
       * don't use (())
       * use peek_file_be instead of od
       * check $TEST_DIR for spaces and other before using
       * use $RAND_FILE safer

v18:
   * 04: add quotes to all file name variables [Vladimir] 
   * 04: add Vladimir's comment according to "qemu-io write -s"
         option issue.

v17:
   * 03: remove incorrect comment in zstd decompress [Vladimir]
   * 03: remove "paraniod" and rewrite the comment on decompress [Vladimir]
   * 03: fix dead assignment [Vladimir]
   * 04: add and remove quotes [Vladimir]
   * 04: replace long offset form with the short one [Vladimir]

v16:
   * 03: ssize_t for ret, size_t for zstd_ret [Vladimir]
   * 04: small fixes according to the comments [Vladimir] 

v15:
   * 01: aiming qemu 5.1 [Eric]
   * 03: change zstd_res definition place [Vladimir]
   * 04: add two new test cases [Eric]
         1. test adjacent cluster compression with zstd
         2. test incompressible cluster processing
   * 03, 04: many rewording and gramma fixing [Eric]

v14:
   * fix bug on compression - looping until compress == 0 [Me]
   * apply reworked Vladimir's suggestions:
      1. not mixing ssize_t with size_t
      2. safe check for ENOMEM in compression part - avoid overflow
      3. tolerate sanity check allow zstd to make progress only
         on one of the buffers
v13:
   * 03: add progress sanity check to decompression loop [Vladimir]
     03: add successful decompression check [Me]

v12:
   * 03: again, rework compression and decompression loops
         to make them more correct [Vladimir]
     03: move assert in compression to more appropriate place
             [Vladimir]
v11:
   * 03: the loops don't need "do{}while" form anymore and
         the they were buggy (missed "do" in the beginning)
         replace them with usual "while(){}" loops [Vladimir]
v10:
   * 03: fix zstd (de)compressed loops for multi-frame
         cases [Vladimir]
v9:
   * 01: fix error checking and reporting in qcow2_amend compression type part [Vladimir]
   * 03: replace asserts with -EIO in qcow2_zstd_decompression [Vladimir, Alberto]
   * 03: reword/amend/add comments, fix typos [Vladimir]

v8:
   * 03: switch zstd API from simple to stream [Eric]
         No need to state a special cluster layout for zstd
         compressed clusters.
v7:
   * use qapi_enum_parse instead of the open-coding [Eric]
   * fix wording, typos and spelling [Eric]

v6:
   * "block/qcow2-threads: fix qcow2_decompress" is removed from the series
      since it has been accepted by Max already
   * add compile time checking for Qcow2Header to be a multiple of 8 [Max, Alberto]
   * report error on qcow2 amending when the compression type is actually chnged [Max]
   * remove the extra space and the extra new line [Max]
   * re-arrange acks and signed-off-s [Vladimir]

v5:
   * replace -ENOTSUP with abort in qcow2_co_decompress [Vladimir]
   * set cluster size for all test cases in the beginning of the 287 test

v4:
   * the series is rebased on top of 01 "block/qcow2-threads: fix qcow2_decompress"
   * 01 is just a no-change resend to avoid extra dependencies. Still, it may be merged in separate

v3:
   * remove redundant max compression type value check [Vladimir, Eric]
     (the switch below checks everything)
   * prevent compression type changing on "qemu-img amend" [Vladimir]
   * remove zstd config setting, since it has been added already by
     "migration" patches [Vladimir]
   * change the compression type error message [Vladimir] 
   * fix alignment and 80-chars exceeding [Vladimir]

v2:
   * rework compression type setting [Vladimir]
   * squash iotest changes to the compression type introduction patch [Vladimir, Eric]
   * fix zstd availability checking in zstd iotest [Vladimir]
   * remove unnecessry casting [Eric]
   * remove rudundant checks [Eric]
   * fix compressed cluster layout in qcow2 spec [Vladimir]
   * fix wording [Eric, Vladimir]
   * fix compression type filtering in iotests [Eric]

v1:
   the initial series


Denis Plotnikov (4):
  qcow2: introduce compression type feature
  qcow2: rework the cluster compression routine
  qcow2: add zstd cluster compression
  iotests: 287: add qcow2 compression type test

 docs/interop/qcow2.txt           |   1 +
 configure                        |   2 +-
 qapi/block-core.json             |  23 ++-
 block/qcow2.h                    |  20 ++-
 include/block/block_int.h        |   1 +
 block/qcow2-threads.c            | 240 +++++++++++++++++++++++++++++--
 block/qcow2.c                    | 120 ++++++++++++++++
 tests/qemu-iotests/031.out       |  14 +-
 tests/qemu-iotests/036.out       |   4 +-
 tests/qemu-iotests/049.out       | 102 ++++++-------
 tests/qemu-iotests/060.out       |   1 +
 tests/qemu-iotests/061.out       |  34 +++--
 tests/qemu-iotests/065           |  28 ++--
 tests/qemu-iotests/080           |   2 +-
 tests/qemu-iotests/082.out       |  48 ++++++-
 tests/qemu-iotests/085.out       |  38 ++---
 tests/qemu-iotests/144.out       |   4 +-
 tests/qemu-iotests/182.out       |   2 +-
 tests/qemu-iotests/185.out       |   8 +-
 tests/qemu-iotests/198.out       |   2 +
 tests/qemu-iotests/206.out       |   5 +
 tests/qemu-iotests/242.out       |   5 +
 tests/qemu-iotests/255.out       |   8 +-
 tests/qemu-iotests/274.out       |  49 ++++---
 tests/qemu-iotests/280.out       |   2 +-
 tests/qemu-iotests/287           | 152 ++++++++++++++++++++
 tests/qemu-iotests/287.out       |  67 +++++++++
 tests/qemu-iotests/common.filter |   3 +-
 tests/qemu-iotests/group         |   1 +
 29 files changed, 824 insertions(+), 162 deletions(-)
 create mode 100755 tests/qemu-iotests/287
 create mode 100644 tests/qemu-iotests/287.out

-- 
2.17.0


