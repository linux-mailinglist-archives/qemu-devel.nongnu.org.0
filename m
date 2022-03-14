Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E97844D8DEC
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 21:10:47 +0100 (CET)
Received: from localhost ([::1]:44272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTr1h-00017q-VQ
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 16:10:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@ya.ru>)
 id 1nTqzM-0007sv-0e; Mon, 14 Mar 2022 16:08:20 -0400
Received: from forward100j.mail.yandex.net ([5.45.198.240]:39706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@ya.ru>)
 id 1nTqzJ-000611-RK; Mon, 14 Mar 2022 16:08:19 -0400
Received: from sas8-f3d6e8a81088.qloud-c.yandex.net
 (sas8-f3d6e8a81088.qloud-c.yandex.net
 [IPv6:2a02:6b8:c1b:2a1b:0:640:f3d6:e8a8])
 by forward100j.mail.yandex.net (Yandex) with ESMTP id 1E40564F3934;
 Mon, 14 Mar 2022 23:07:32 +0300 (MSK)
Received: from sas1-384d3eaa6677.qloud-c.yandex.net
 (sas1-384d3eaa6677.qloud-c.yandex.net [2a02:6b8:c14:3a29:0:640:384d:3eaa])
 by sas8-f3d6e8a81088.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 fN8TG0rQCQ-7VfmKRt4; Mon, 14 Mar 2022 23:07:32 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail;
 t=1647288452; bh=AOvWBC8ndTQmq102/dQxeYGf3nXWMxQXkHIZD7WP+ns=;
 h=Date:Subject:Cc:To:From:Message-Id;
 b=brAeC+r+m7G2RVPLo8JPJSr2sl0MxpwC/sjGrKR807h9r5Hxc6K7ZIMwZntkcu1Sn
 IqPLJbCG0NRWB5kLeVxOep44o0PVSGnnM77c1LoLzy/Ncu559lf8lcZfuMG8K+JScJ
 BNTxKivSqIhm8KOjHuaJ+OjEfeX0/rvlEbpyHF/4=
Authentication-Results: sas8-f3d6e8a81088.qloud-c.yandex.net;
 dkim=pass header.i=@ya.ru
Received: by sas1-384d3eaa6677.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id C1cHglIHXL-7VGestfU; Mon, 14 Mar 2022 23:07:31 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
To: qemu-block@nongnu.org
Subject: [PATCH for-7.1 0/3] qapi: nbd-export: select bitmap by node/name pair
Date: Mon, 14 Mar 2022 23:07:20 +0300
Message-Id: <20220314200723.356816-1-v.sementsov-og@ya.ru>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.45.198.240; envelope-from=v.sementsov-og@ya.ru;
 helo=forward100j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

Here is small improvement for bitmap exporting interface.

Vladimir Sementsov-Ogievskiy (3):
  qapi: rename BlockDirtyBitmapMergeSource to BlockDirtyBitmapOrStr
  qapi: nbd-export: allow select bitmaps by node/name pair
  iotests/223: check new possibility of exporting bitmaps by node/name

 block/monitor/bitmap-qmp-cmds.c        |  6 +--
 blockdev-nbd.c                         |  8 +++-
 include/block/block_int-global-state.h |  2 +-
 nbd/server.c                           | 63 +++++++++++++++++---------
 qapi/block-core.json                   |  6 +--
 qapi/block-export.json                 |  5 +-
 qemu-img.c                             |  8 ++--
 qemu-nbd.c                             | 11 ++++-
 tests/qemu-iotests/223                 | 16 +++++++
 tests/qemu-iotests/223.out             | 47 ++++++++++++++++++-
 10 files changed, 133 insertions(+), 39 deletions(-)

-- 
2.35.1


