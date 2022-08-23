Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E42859D79E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 11:59:55 +0200 (CEST)
Received: from localhost ([::1]:47874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQQhN-0006km-Nm
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 05:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1oQQf5-0001MV-4H; Tue, 23 Aug 2022 05:57:31 -0400
Received: from relay.virtuozzo.com ([130.117.225.111]:46328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1oQQf3-0001vk-Bb; Tue, 23 Aug 2022 05:57:30 -0400
Received: from [192.168.16.122] (helo=iris.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <den@openvz.org>) id 1oQQdP-00H9Gd-Ig;
 Tue, 23 Aug 2022 11:57:10 +0200
From: "Denis V. Lunev" <den@openvz.org>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Cc: "Denis V . Lunev" <den@openvz.org>, Peter Krempa <pkrempa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH v4 0/2] block: add missed block_acct_setup with new block
 device init procedure
Date: Tue, 23 Aug 2022 11:57:17 +0200
Message-Id: <20220823095719.105387-1-den@openvz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=130.117.225.111; envelope-from=den@openvz.org;
 helo=relay.virtuozzo.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

Commit 5f76a7aac156ca75680dad5df4a385fd0b58f6b1 is looking harmless from
the first glance, but it has changed things a lot. 'libvirt' uses it to
detect that it should follow new initialization way and this changes
things considerably. With this procedure followed, blockdev_init() is
not called anymore and thus block_acct_setup() helper is not called.

This means in particular that defaults for block accounting statistics
are changed and account_invalid/account_failed are actually initialized
as false instead of true originally.

This commit changes things to match original world. There are the following
constraints:
* new default value in block_acct_init() is set to true
* block_acct_setup() inside blockdev_init() is called before
  blkconf_apply_backend_options()
* thus newly created option in block device properties has precedence if
  specified

Changes from v3:
* fixed accidentally wrong submission. Contains changes which should be
  sent as v3

Changes from v2:
* called bool_from_onoffauto(account_..., true) in the first patch to
  preserve original semantics before patch 2

Changes from v1:
* set account_invalid/account_failed to true by default
* pass OnOffAuto to block_acct_init() to handle double initialization (patch 1)
* changed properties on BLK device to OnOffAuto

Signed-off-by: Denis V. Lunev <den@openvz.org>
CC: Peter Krempa <pkrempa@redhat.com>
CC: Markus Armbruster <armbru@redhat.com>
CC: John Snow <jsnow@redhat.com>
CC: Kevin Wolf <kwolf@redhat.com>
CC: Hanna Reitz <hreitz@redhat.com>
CC: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>



