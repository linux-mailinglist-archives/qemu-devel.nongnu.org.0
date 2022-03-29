Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAAB4EB4D0
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 22:45:46 +0200 (CEST)
Received: from localhost ([::1]:40776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZIin-0006yR-6O
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 16:45:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIei-0003Th-4w; Tue, 29 Mar 2022 16:41:32 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:39502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIef-0006Xl-7v; Tue, 29 Mar 2022 16:41:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=ol9lhFFbz0C0HI1uiEtAMaWQDZUzCD6GbF0LHureAoA=; 
 t=1648586489;x=1649191889; 
 b=VB+BzVIf2jmic3ew9f8kjSSwUVQ2ObX+EouBbpOf/6vV2RAq/YFU2iIXv0EDHt0ZnPr86ODAI4a8i2kQgAOvvPp6CSvrPulekprmairW7eq7mv6uDJSJfTrE95jSaSx7zMLHwG5wYIbGgHdfPS0IqLQmqRrzSX/3a8/iqP5lj/9LSiZ55mlWvcbeLr2IXniIJiqZSybrfHL3NDZQyw6ztdiPp+dJTzyNVw0/6sQvRmH5boa6cRhmUbvlSXMLq/m/MP2wGllkhPR2Ompi+WhPNF/cMmvNXEMT8XUofIdaZTr7wjERsKotq9i8+FKbYoRdvh7v0f4BHefMCw+uCIbYUg==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZIea-000374-DG; Tue, 29 Mar 2022 23:41:24 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru
Subject: [PATCH v4 00/45] Transactional block-graph modifying API
Date: Tue, 29 Mar 2022 23:40:22 +0300
Message-Id: <20220329204107.411011-1-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB6111D00391FF8D216C524AE3E2EB4979B500894C459B0CD1B929921177DFFAFE1EC2568E12C0F62BB9C206EF2094F4D7342D7423A3730B96E4
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE76D34FAA3D8B31588C2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE7DCDABBCBEAF682B1EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BEBC5CAB6D411FFA673D453368E803CF3151B8F806A73419020879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C07E7E81EEA8A9722B8941B15DA834481FA18204E546F3947C1D471462564A2E19F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006372A3B24BF85B2E607389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F790063734032FEA597FA516D81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE77E32032FFBECC12DEC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3A8421AA044726D3235872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8183A4AFAF3EA6BDC446469D8A8717206BBF593E0A4FA3DD8F536936F4E2FABAFCED7D99C6830690C4C9C2B6934AE262D3EE7EAB7254005DCED2A2FE3BEE621D36C9510FB958DCE06DB6ED91DBE5ABE359A3485EE9140A7D39D1B2EFE7B39F7738393EDB24507CE13387DFF0A840B692CF8
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34E54F8089C01448AAF3550AC89EF8E8E957FD08FBDC9DB70DFDB0389208321FB24EBF47B843A19C731D7E09C32AA3244CD1E1534FF49B71E09893DD767CC4B2B130363D8B7DA7DD4483B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGbsSphTL3p+5A==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE091173E07D013056BEF9CCAAB57D4E14343C227971916F22E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.108;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp48.i.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

Hi all!

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

 block.c                                       | 869 ++++++++++--------
 block/blkdebug.c                              |   9 +-
 block/blklogwrites.c                          |  11 +-
 block/blkreplay.c                             |   7 +-
 block/blkverify.c                             |   9 +-
 block/block-backend.c                         |  10 +-
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
 blockdev.c                                    | 818 +++++++++--------
 include/block/block.h                         |  72 +-
 include/block/block_int.h                     |  41 +-
 include/block/export.h                        |   1 +
 include/sysemu/block-backend.h                |   3 +-
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
 tests/qemu-iotests/tests/image-fleecing       |  29 +-
 tests/qemu-iotests/tests/image-fleecing.out   |   2 -
 tests/unit/test-bdrv-drain.c                  |  11 +-
 tests/unit/test-bdrv-graph-mod.c              |  94 +-
 49 files changed, 1715 insertions(+), 990 deletions(-)
 create mode 100644 stubs/blk-by-qdev-id.c
 create mode 100644 stubs/blk-exp-find-by-blk.c
 create mode 100755 tests/qemu-iotests/tests/blockdev-add-transaction
 create mode 100644 tests/qemu-iotests/tests/blockdev-add-transaction.out
 create mode 100755 tests/qemu-iotests/tests/filter-insertion
 create mode 100644 tests/qemu-iotests/tests/filter-insertion.out

-- 
2.35.1


