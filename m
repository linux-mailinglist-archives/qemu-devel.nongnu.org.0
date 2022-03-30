Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C444ECCE9
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 21:06:20 +0200 (CEST)
Received: from localhost ([::1]:52132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZde7-0008KS-Ea
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 15:06:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZdbz-0006eE-M9; Wed, 30 Mar 2022 15:04:08 -0400
Received: from smtp55.i.mail.ru ([217.69.128.35]:43812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZdbv-0007yz-12; Wed, 30 Mar 2022 15:04:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=CKNiIzLhnr01y4dBR0vXvTsMpYDhXPggJiXKtqzw7UQ=; 
 t=1648667043;x=1649272443; 
 b=XfhMtYPPFtg7cwH9or9QjVhPozKDtnUY8aAMFxXorUJbpNz4IIG54WziJa8uX7nlJHILVnU4av0dmF35OHK1+1KANK68Jp9mAFDQrah36+dwIaMU6EQ5bNWrvli536z4ZVWlO9JG3o4Mpq+xycQYxFAyQhvEH6rbJol5I6p4+V/92SlHe0U3/aD4gxequtP65X03LFOGE1uwmMzYhDRZ406dufj6uCnVlduAzV2pm27E853BerViVZHphELi3wac+MZs4v7JCCBea1P6CjkzwD+0ZdeUhAtg33ymjvr91R7Kr//UhYziRsnIKh/n1jjFQh6lFDjCP1zj8YPOBHKfcA==;
Received: by smtp55.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZdbq-0006R6-0F; Wed, 30 Mar 2022 22:03:58 +0300
Message-ID: <4d56f439-b1b4-324c-c042-848b5f98c820@mail.ru>
Date: Wed, 30 Mar 2022 22:03:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 00/45] Transactional block-graph modifying API
Content-Language: en-US
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp55.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB61C24934C3AF654FA0FDE5B3EC8CDA719600894C459B0CD1B93E85922EF49CE3CE1961EC3B10F5216384071998ED16A5775A4E072B40C18CE0
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7A3295C83650092F9EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006379A70878BADDF00B98638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D85ABACACD06897577F910843F2AE820E56F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE73D04F0695778128A9FA2833FD35BB23D9E625A9149C048EE9ECD01F8117BC8BEA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F446042972877693876707352033AC447995A7AD18CB629EEF1311BF91D2E47CDBA5A96583BA9C0B312567BB2376E601842F6C81A19E625A9149C048EE652FD71AFB96DC7DCFA063A519E5965DD8FC6C240DEA7642DBF02ECDB25306B2B78CF848AE20165D0A6AB1C7CE11FEE3B355ED1E20F5346AAD7EC71F1DB88427C4224003CC836476EA7A3FFF5B025636E2021AF6380DFAD1A18204E546F3947CB11811A4A51E3B096D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F7900637348E9AE83E9EA32CEFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A5C0121749765FA754E5B0C6D79AB9444ABEC35B25CA09525ED59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75040BF32255FAA22B410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34A1AF43396E40A36F86F2019440AB46369EED2D9754DC9E91AACECA955402C0D84B291B5800CC29351D7E09C32AA3244C6C506C0331D72B47E9F5A064A4C239DA35DA7DC5AF9B58C0927AC6DF5659F194
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojlgoDDUY05+UV376GZ1YwyA==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FEAD650169EA6E029FC6AF2B8DE88E68F4802AF573E655DF53E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=217.69.128.35;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp55.i.mail.ru
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL=1.31,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Outdated :(. I should rebase it on master, there are a lot of conflicts after Emanuele's series.

29.03.2022 23:40, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> That's a big series, which unites some of my previous ones, and
> completes them with necessary additions to finally implement block-graph
> modifying API. The series is called "v4" as it inherits
> "[PATCH v3 00/11] blockdev-replace" (among other things).
> 
> After this series, we have blockdev-add, blockdev-del and
> x-blockdev-replace transaction actions, which allows to insert and
> remove filters.
> 
> Additional challenge is to avoid intermediate permission update. That's
> and existing paradigm of block graph modifications: first do all the
> modifications and then refresh the permissions. Now we should bring this
> paradigm to block-graph modifying transactions: if several graph
> modifying commands are sequential in one transaction, permission are
> updated after the last of these commands. The application of this is
> possibility to correct copy-before-write filter permission requirements
> (see last patch).
> 
> I now unite all these things into one series because:
>   - they depend on each other and I have to rebase them together when
>   something needs fix or refactoring
>   - just to resend with my new email address
> If needed, parts may go in separate, and I can split them again if
> necessary.
> 
> So, what is here:
> 
> 1. "[PATCH 00/14] block: cleanup backing and file handling" series,
> unchanged:
> 
>    block: BlockDriver: add .filtered_child_is_backing field
>    block: introduce bdrv_open_file_child() helper
>    block/blklogwrites: don't care to remove bs->file child on failure
>    test-bdrv-graph-mod: update test_parallel_perm_update test case
>    tests-bdrv-drain: bdrv_replace_test driver: declare supports_backing
>    test-bdrv-graph-mod: fix filters to be filters
>    block: document connection between child roles and
>      bs->backing/bs->file
>    block/snapshot: stress that we fallback to primary child
>    Revert "block: Let replace_child_noperm free children"
>    Revert "block: Let replace_child_tran keep indirect pointer"
>    Revert "block: Restructure remove_file_or_backing_child()"
>    Revert "block: Pass BdrvChild ** to replace_child_noperm"
>    block: Manipulate bs->file / bs->backing pointers in .attach/.detach
>    block/snapshot: drop indirection around bdrv_snapshot_fallback_ptr
> 
> 2. implement bdrv_unref_tran() - the key thing to implement blockdev-del
> transaction action later.
> This part inherits from "[PATCH 00/14] block: blockdev-del force=false".
> Still force=false is not realized and qcow2 is untouched, as the target
> now is transactional removement.
> 
>    block: refactor bdrv_remove_file_or_backing_child to bdrv_remove_child
>    block: drop bdrv_detach_child()
>    block: drop bdrv_remove_filter_or_cow_child
>    block: bdrv_refresh_perms(): allow external tran
>    block: refactor bdrv_list_refresh_perms to allow any list of nodes
>    block: make permission update functions public
>    block: add bdrv_try_set_aio_context_tran transaction action
>    block: implemet bdrv_unref_tran()
> 
> 3. Move blockdev.c transactions to util/transactions.c API.
> 
>    blockdev: refactor transaction to use Transaction API
>    blockdev: transactions: rename some things
>    blockdev: qmp_transaction: refactor loop to classic for
>    blockdev: transaction: refactor handling transaction properties
>    blockdev: qmp_transaction: drop extra generic layer
> 
> 4. add blockdev-del transaction action
> 
>    qapi: block: add blockdev-del transaction action
> 
> 5. add blockdev-add transaction action
> (inherits from "[PATCH 0/2] blockdev-add transaction")
> 
>    block: introduce BDRV_O_NOPERM flag
>    block: bdrv_insert_node(): use BDRV_O_NOPERM
>    qapi: block: add blockdev-add transaction action
>    iotests: add blockdev-add-transaction
> 
> 6. add x-blockdev-replace command and transaction action
> (inherits from "[PATCH v3 00/11] blockdev-replace")
> 
>    block-backend: blk_root(): drop const specifier on return type
>    block/export: add blk_by_export_id()
>    block: make bdrv_find_child() function public
>    block: bdrv_replace_child_bs(): move to external transaction
>    qapi: add x-blockdev-replace command
>    qapi: add x-blockdev-replace transaction action
>    block: bdrv_get_xdbg_block_graph(): report export ids
>    iotests.py: qemu_img_create: use imgfmt by default
>    iotests.py: introduce VM.assert_edges_list() method
>    iotests.py: add VM.qmp_check() helper
>    iotests: add filter-insertion
> 
> 7. Correct permission scheme of copy-before-write filter, with help of
> new design of graph-modifying API.
> 
>    block: bdrv_open_inherit: create BlockBackend only when necessary
>    block/copy-before-write: correct permission scheme
> 
>   block.c                                       | 869 ++++++++++--------
>   block/blkdebug.c                              |   9 +-
>   block/blklogwrites.c                          |  11 +-
>   block/blkreplay.c                             |   7 +-
>   block/blkverify.c                             |   9 +-
>   block/block-backend.c                         |  10 +-
>   block/bochs.c                                 |   7 +-
>   block/cloop.c                                 |   7 +-
>   block/commit.c                                |   1 +
>   block/copy-before-write.c                     |  24 +-
>   block/copy-on-read.c                          |   9 +-
>   block/crypto.c                                |  11 +-
>   block/dmg.c                                   |   7 +-
>   block/export/export.c                         |  31 +
>   block/filter-compress.c                       |   6 +-
>   block/mirror.c                                |   1 +
>   block/monitor/block-hmp-cmds.c                |   2 +-
>   block/parallels.c                             |   7 +-
>   block/preallocate.c                           |   9 +-
>   block/qcow.c                                  |   6 +-
>   block/qcow2.c                                 |   8 +-
>   block/qed.c                                   |   8 +-
>   block/raw-format.c                            |   4 +-
>   block/replication.c                           |   8 +-
>   block/snapshot.c                              |  60 +-
>   block/throttle.c                              |   8 +-
>   block/vdi.c                                   |   7 +-
>   block/vhdx.c                                  |   7 +-
>   block/vmdk.c                                  |   7 +-
>   block/vpc.c                                   |   7 +-
>   blockdev.c                                    | 818 +++++++++--------
>   include/block/block.h                         |  72 +-
>   include/block/block_int.h                     |  41 +-
>   include/block/export.h                        |   1 +
>   include/sysemu/block-backend.h                |   3 +-
>   qapi/block-core.json                          |  73 +-
>   qapi/transaction.json                         |  35 +-
>   stubs/blk-by-qdev-id.c                        |   9 +
>   stubs/blk-exp-find-by-blk.c                   |   9 +
>   stubs/meson.build                             |   2 +
>   tests/qemu-iotests/iotests.py                 |  23 +
>   .../tests/blockdev-add-transaction            |  52 ++
>   .../tests/blockdev-add-transaction.out        |   6 +
>   tests/qemu-iotests/tests/filter-insertion     | 253 +++++
>   tests/qemu-iotests/tests/filter-insertion.out |   5 +
>   tests/qemu-iotests/tests/image-fleecing       |  29 +-
>   tests/qemu-iotests/tests/image-fleecing.out   |   2 -
>   tests/unit/test-bdrv-drain.c                  |  11 +-
>   tests/unit/test-bdrv-graph-mod.c              |  94 +-
>   49 files changed, 1715 insertions(+), 990 deletions(-)
>   create mode 100644 stubs/blk-by-qdev-id.c
>   create mode 100644 stubs/blk-exp-find-by-blk.c
>   create mode 100755 tests/qemu-iotests/tests/blockdev-add-transaction
>   create mode 100644 tests/qemu-iotests/tests/blockdev-add-transaction.out
>   create mode 100755 tests/qemu-iotests/tests/filter-insertion
>   create mode 100644 tests/qemu-iotests/tests/filter-insertion.out
> 


-- 
Best regards,
Vladimir

