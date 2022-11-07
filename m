Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B61C961FA15
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 17:38:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os56x-0005Zq-P9; Mon, 07 Nov 2022 11:36:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1os56t-0005Sm-2j; Mon, 07 Nov 2022 11:36:31 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1os56r-0000l8-Fr; Mon, 07 Nov 2022 11:36:30 -0500
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id A2E185E61A;
 Mon,  7 Nov 2022 19:36:11 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:7318::1:29])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 6oMWGH9or4-aANCB2bQ; Mon, 07 Nov 2022 19:36:11 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1667838971; bh=PzgWFI9oqMYrfXi2hd6ejK6DjoaxK8CmidA/7Jhw7Lo=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=sjlg+fLqZLTCAkRkW/ip3tkRpEd77jlkxco9qyXf24W6Je9xvgYBk1UNgkXsomxoz
 Mt0S83ya9iVlCt9wulA20gZuwEJ7ROHie9iwTE1BvSFMPs25wRdeK8H0KLts/g2ZOr
 TxSTElfwZ4+EF7G4XjfDzZpY+HazhF+5Wn5P1edU=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@yandex-team.ru
Subject: [PATCH v8 0/4] block: small refactorings
Date: Mon,  7 Nov 2022 19:35:54 +0300
Message-Id: <20221107163558.618889-1-vsementsov@yandex-team.ru>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Here is 4-more simple already reviewed patches from
 "[PATCH v5 00/45] Transactional block-graph modifying API" [1]

Called v8 because first part of [1] was recently merged as
 "[PATCH v7 for-7.2 00/15] block: cleanup backing and file handling"

Vladimir Sementsov-Ogievskiy (4):
  block: drop bdrv_detach_child()
  block: drop bdrv_remove_filter_or_cow_child
  block: bdrv_refresh_perms(): allow external tran
  block: refactor bdrv_list_refresh_perms to allow any list of nodes

 block.c | 141 ++++++++++++++++++++++++++++----------------------------
 1 file changed, 71 insertions(+), 70 deletions(-)

-- 
2.34.1


