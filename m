Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D7D4ECFFC
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:22:34 +0200 (CEST)
Received: from localhost ([::1]:55338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZhe5-0003dq-9h
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:22:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsl-0007rF-OW
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:35 -0400
Received: from [2a00:1450:4864:20::230] (port=45602
 helo=mail-lj1-x230.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsj-00038z-Dy
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:35 -0400
Received: by mail-lj1-x230.google.com with SMTP id q14so29437682ljc.12
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IbhYQSkIjwUmKPbhfWP1GCkHvEjV9/GKv23bKqbQrOc=;
 b=NipDNkpjYBFgIdgemUUJMFogo2u8bizU39KkinIZ3U3FCACCCi/jBH44L4eZbJYsDH
 9iU8/SemGS9HMdWIdCoKDHQ4sKseYNW/Kwn5okbhv7ClkA6wbv8RHsLKT3cdjDNiq5Us
 aD/DEOzT7iAt5UzX88jsFVmq6hN1dcK+0rGNoar58wDBM1xqAsmNp+r+frBn/z7sVicu
 vWIA0ZPpW9bQfjO5M9r2iJlP4sfvDsHHVafdO9My6ooZ0ChTQR9b1eHJNi7QtdRR+Y5a
 6+kcZC8Aqk9qiTu9Dp8JcB7YVL7h/HhWGjTJIjnsGDlEQf1s5l5m390CvpQqN2CdwEvx
 ggqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IbhYQSkIjwUmKPbhfWP1GCkHvEjV9/GKv23bKqbQrOc=;
 b=ToK0crMSJR0C1dunTAWQW5LSCJwo6cmOU8X2C0nA+lD0aP33pG/IdLOI+aM+z6p4It
 +BzG/A02I78/q30Ybo1UFtFK8cv0G+BdqXeq/sVoby5LbhauvCFiR+l4fSELEMyPiqzj
 pYFweBONc72ZkOOlgH+yoK5ghFD1DAZnMXbEMIrc6Ea/LYPBknYCiiy0gxh6mnhtbinW
 Y5zdufvY+GrOmtD/7s0D80aliirKjoWUFWreVzKZTyjJJ5ZVsuu+7qoC7o8vzC730QOO
 n35TOs1QSSzKP2YOohOgPrTQaHY1OO5mY8S0Yr8+40CVmnuTJZ54TXMKjYMTWVD9ujOK
 BNiw==
X-Gm-Message-State: AOAM533oNh/CCBB/uhV8Cv5F50jQx3wV/q+sfRMW8EXjpQDMgOcGq4p3
 HRV2Qta9FynolnvZt+4JpajnxA==
X-Google-Smtp-Source: ABdhPJxNwqIlKXg4AoHA04ahnJXEyjYk5wzZ6bKBmgH2PO1r/Y5Xq8HUzcLC0pZTrTlPu50QgTGngA==
X-Received: by 2002:a2e:82c5:0:b0:247:e81f:8b02 with SMTP id
 n5-20020a2e82c5000000b00247e81f8b02mr8255460ljh.90.1648675770727; 
 Wed, 30 Mar 2022 14:29:30 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:30 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 00/45] Transactional block-graph modifying API
Date: Thu, 31 Mar 2022 00:28:17 +0300
Message-Id: <20220330212902.590099-1-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::230
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lj1-x230.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:13 -0400
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
Cc: kwolf@redhat.com, hreitz@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

v5: rebased on master, sorry for the noise

That's a big series, which unites some of my previous ones, and
completes them with necessary additions to finally implement block-graph
modifying API. The series is called "v4" as it inherits
"[PATCH v3 00/11] blockdev-replace" (among other things).

After this series, we have blockdev-add, blockdev-del and
x-blockdev-replace transaction actions, which allows to insert and
remove filters.

Additional challenge is to avoid intermediate permission update. That's
and existing paradigm of block graph modifications: first do all the
modifications and then refresh the permissions. Now we should bring this
paradigm to block-graph modifying transactions: if several graph
modifying commands are sequential in one transaction, permission are
updated after the last of these commands. The application of this is
possibility to correct copy-before-write filter permission requirements
(see last patch).

I now unite all these things into one series because:
 - they depend on each other and I have to rebase them together when
 something needs fix or refactoring
 - just to resend with my new email address
If needed, parts may go in separate, and I can split them again if
necessary.

So, what is here:

1. "[PATCH 00/14] block: cleanup backing and file handling" series,
unchanged:

  block: BlockDriver: add .filtered_child_is_backing field
  block: introduce bdrv_open_file_child() helper
  block/blklogwrites: don't care to remove bs->file child on failure
  test-bdrv-graph-mod: update test_parallel_perm_update test case
  tests-bdrv-drain: bdrv_replace_test driver: declare supports_backing
  test-bdrv-graph-mod: fix filters to be filters
  block: document connection between child roles and
    bs->backing/bs->file
  block/snapshot: stress that we fallback to primary child
  Revert "block: Let replace_child_noperm free children"
  Revert "block: Let replace_child_tran keep indirect pointer"
  Revert "block: Restructure remove_file_or_backing_child()"
  Revert "block: Pass BdrvChild ** to replace_child_noperm"
  block: Manipulate bs->file / bs->backing pointers in .attach/.detach
  block/snapshot: drop indirection around bdrv_snapshot_fallback_ptr

2. implement bdrv_unref_tran() - the key thing to implement blockdev-del
transaction action later.
This part inherits from "[PATCH 00/14] block: blockdev-del force=false".
Still force=false is not realized and qcow2 is untouched, as the target
now is transactional removement.

  block: refactor bdrv_remove_file_or_backing_child to bdrv_remove_child
  block: drop bdrv_detach_child()
  block: drop bdrv_remove_filter_or_cow_child
  block: bdrv_refresh_perms(): allow external tran
  block: refactor bdrv_list_refresh_perms to allow any list of nodes
  block: make permission update functions public
  block: add bdrv_try_set_aio_context_tran transaction action
  block: implemet bdrv_unref_tran()

3. Move blockdev.c transactions to util/transactions.c API.

  blockdev: refactor transaction to use Transaction API
  blockdev: transactions: rename some things
  blockdev: qmp_transaction: refactor loop to classic for
  blockdev: transaction: refactor handling transaction properties
  blockdev: qmp_transaction: drop extra generic layer

4. add blockdev-del transaction action

  qapi: block: add blockdev-del transaction action

5. add blockdev-add transaction action
(inherits from "[PATCH 0/2] blockdev-add transaction")

  block: introduce BDRV_O_NOPERM flag
  block: bdrv_insert_node(): use BDRV_O_NOPERM
  qapi: block: add blockdev-add transaction action
  iotests: add blockdev-add-transaction

6. add x-blockdev-replace command and transaction action
(inherits from "[PATCH v3 00/11] blockdev-replace")

  block-backend: blk_root(): drop const specifier on return type
  block/export: add blk_by_export_id()
  block: make bdrv_find_child() function public
  block: bdrv_replace_child_bs(): move to external transaction
  qapi: add x-blockdev-replace command
  qapi: add x-blockdev-replace transaction action
  block: bdrv_get_xdbg_block_graph(): report export ids
  iotests.py: qemu_img_create: use imgfmt by default
  iotests.py: introduce VM.assert_edges_list() method
  iotests.py: add VM.qmp_check() helper
  iotests: add filter-insertion

7. Correct permission scheme of copy-before-write filter, with help of
new design of graph-modifying API.

  block: bdrv_open_inherit: create BlockBackend only when necessary
  block/copy-before-write: correct permission scheme

 block.c                                       | 871 ++++++++++--------
 block/blkdebug.c                              |   9 +-
 block/blklogwrites.c                          |  11 +-
 block/blkreplay.c                             |   7 +-
 block/blkverify.c                             |   9 +-
 block/block-backend.c                         |  11 +-
 block/bochs.c                                 |   7 +-
 block/cloop.c                                 |   7 +-
 block/commit.c                                |   1 +
 block/copy-before-write.c                     |  24 +-
 block/copy-on-read.c                          |   9 +-
 block/crypto.c                                |  11 +-
 block/dmg.c                                   |   7 +-
 block/export/export.c                         |  31 +
 block/filter-compress.c                       |   6 +-
 block/mirror.c                                |   1 +
 block/monitor/block-hmp-cmds.c                |   2 +-
 block/parallels.c                             |   7 +-
 block/preallocate.c                           |   9 +-
 block/qcow.c                                  |   6 +-
 block/qcow2.c                                 |   8 +-
 block/qed.c                                   |   8 +-
 block/raw-format.c                            |   4 +-
 block/replication.c                           |   8 +-
 block/snapshot.c                              |  60 +-
 block/throttle.c                              |   8 +-
 block/vdi.c                                   |   7 +-
 block/vhdx.c                                  |   7 +-
 block/vmdk.c                                  |   7 +-
 block/vpc.c                                   |   7 +-
 blockdev.c                                    | 842 +++++++++--------
 include/block/block-common.h                  |  47 +-
 include/block/block-global-state.h            |  24 +-
 include/block/block_int-common.h              |  36 +-
 include/block/block_int-global-state.h        |   3 +-
 include/block/block_int-io.h                  |   1 +
 include/block/export.h                        |   1 +
 include/sysemu/block-backend-global-state.h   |   3 +-
 qapi/block-core.json                          |  73 +-
 qapi/transaction.json                         |  35 +-
 stubs/blk-by-qdev-id.c                        |   9 +
 stubs/blk-exp-find-by-blk.c                   |   9 +
 stubs/meson.build                             |   2 +
 tests/qemu-iotests/iotests.py                 |  23 +
 .../tests/blockdev-add-transaction            |  52 ++
 .../tests/blockdev-add-transaction.out        |   6 +
 tests/qemu-iotests/tests/filter-insertion     | 253 +++++
 tests/qemu-iotests/tests/filter-insertion.out |   5 +
 tests/qemu-iotests/tests/image-fleecing       |  20 +-
 tests/qemu-iotests/tests/image-fleecing.out   |   8 -
 tests/unit/test-bdrv-drain.c                  |  11 +-
 tests/unit/test-bdrv-graph-mod.c              |  94 +-
 52 files changed, 1725 insertions(+), 1002 deletions(-)
 create mode 100644 stubs/blk-by-qdev-id.c
 create mode 100644 stubs/blk-exp-find-by-blk.c
 create mode 100755 tests/qemu-iotests/tests/blockdev-add-transaction
 create mode 100644 tests/qemu-iotests/tests/blockdev-add-transaction.out
 create mode 100755 tests/qemu-iotests/tests/filter-insertion
 create mode 100644 tests/qemu-iotests/tests/filter-insertion.out

-- 
2.35.1


