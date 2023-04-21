Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5F96EA97B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 13:42:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppp92-0006r9-RZ; Fri, 21 Apr 2023 07:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppp8t-0006jz-1r; Fri, 21 Apr 2023 07:41:31 -0400
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppp8p-0001Es-AV; Fri, 21 Apr 2023 07:41:29 -0400
Received: from mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:7f29:0:640:9a2b:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id E1F295EA58;
 Fri, 21 Apr 2023 14:41:16 +0300 (MSK)
Received: from vsementsov-nix.yandex.net (unknown [2a02:6b8:b081:8816::1:4])
 by mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id 3fdrVT1OnCg0-GxekjUah; Fri, 21 Apr 2023 14:41:16 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682077276; bh=rL+kXpSOEWYcH4c6xjHn4nrU3rXwMIOm1/+q4ukVN6U=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=FFoh/ieVohBTyyjRBm8UMOBqQ+DdEX+gLyBIdYdJH5mkpZSiCJoDEK0+3aK0Egk2R
 WQMOUnVapayFJny/5MONA7/MC1EadUatgwrLGiCs8cokv4ulKcN5VforPNkobLzWnU
 PLIzLV18mVJ8BSv/EcBGH02BN+vnWYOUL4XC97Z4=
Authentication-Results: mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 alexander.ivanov@virtuozzo.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH v7 0/7] blockdev-replace
Date: Fri, 21 Apr 2023 14:40:55 +0300
Message-Id: <20230421114102.884457-1-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi all!

That's a non-transactional part of
"[PATCH v5 00/45] Transactional block-graph modifying API".

The new command helps to insert filters everywhere you want:

 - replace qdev block-node by qdev-id
 - replace export block-node by export-id
 - replace any child of parent block-node by node-name and child name

To simplify things, let's postpone transaction support and start from
blockdev-replace single command. That still allows to insert filters
here and there!)

v7: rebase and change QAPI versions to 8.1

Vladimir Sementsov-Ogievskiy (7):
  block-backend: blk_root(): drop const specifier on return type
  block/export: add blk_by_export_id()
  block: make bdrv_find_child() function public
  qapi: add x-blockdev-replace command
  block: bdrv_get_xdbg_block_graph(): report export ids
  iotests.py: introduce VM.assert_edges_list() method
  iotests: add filter-insertion

 block.c                                       |  17 ++
 block/block-backend.c                         |   2 +-
 block/export/export.c                         |  31 +++
 blockdev.c                                    |  70 ++++-
 include/block/block_int-io.h                  |   1 +
 include/block/export.h                        |   1 +
 include/sysemu/block-backend-global-state.h   |   3 +-
 qapi/block-core.json                          |  62 +++++
 stubs/blk-by-qdev-id.c                        |   9 +
 stubs/blk-exp-find-by-blk.c                   |   9 +
 stubs/meson.build                             |   2 +
 tests/qemu-iotests/iotests.py                 |  17 ++
 tests/qemu-iotests/tests/filter-insertion     | 257 ++++++++++++++++++
 tests/qemu-iotests/tests/filter-insertion.out |   5 +
 14 files changed, 470 insertions(+), 16 deletions(-)
 create mode 100644 stubs/blk-by-qdev-id.c
 create mode 100644 stubs/blk-exp-find-by-blk.c
 create mode 100755 tests/qemu-iotests/tests/filter-insertion
 create mode 100644 tests/qemu-iotests/tests/filter-insertion.out

-- 
2.34.1


