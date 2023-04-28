Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 515AA6F1EE1
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 21:51:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psU6V-0000rS-5y; Fri, 28 Apr 2023 15:50:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1psU6R-0000q5-RG
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:49:59 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1psU6H-00011z-LP
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:49:56 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:369a:0:640:c31a:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id F011B60C9D;
 Fri, 28 Apr 2023 22:49:39 +0300 (MSK)
Received: from vsementsov-nix.yandex-team.ru (unknown
 [2a02:6b8:b081:b432::1:18])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id TnPWb50Oca60-el1yiHkL; Fri, 28 Apr 2023 22:49:39 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682711379; bh=VbDGJKYsvC6dHONbPPc760HpzEYXR2bPJgvBFhDNsak=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=1FfOWV55bjyq7uaIFrxEpUhrLkc0QkiogL0PxF+fbmId4lq/XyxaIFgH9TKAX+NXJ
 4qtpbfcGENujfY8/rPL5qDWMgdOvzASt0Ic8+TOVubT1eunVM8YN8D+pv+fABgsEtO
 6kB114VeLSIWOa9QLnLLBgzllXHQsPzRdyoregws=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: lukasstraub2@web.de, quintela@redhat.com, chen.zhang@intel.com,
 vsementsov@yandex-team.ru
Subject: [PATCH v4 00/10] COLO: improve build options
Date: Fri, 28 Apr 2023 22:49:18 +0300
Message-Id: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

v4:
01: add r-b by Lukas
02: new
03: - keep x-colo capability enum value unconditional
    - drop ifdefs in options.c and keep capability check instead
    - update stubs
    - add missed a-b by Dr. David
04: keep filter-mirror untouched, add r-b by Juan

others: new. Some further improvements of COLO module API. May be merged
separately.

Hi all!

COLO substem seems to be useless when CONFIG_REPLICATION is unset, as we
simply don't allow to set x-colo capability in this case. So, let's not
compile in unreachable code and interface we cannot use when
CONFIG_REPLICATION is unset.

Also, provide personal configure option for COLO Proxy subsystem.

Vladimir Sementsov-Ogievskiy (10):
  block/meson.build: prefer positive condition for replication
  colo: make colo_checkpoint_notify static and provide simpler API
  build: move COLO under CONFIG_REPLICATION
  configure: add --disable-colo-proxy option
  migration: drop colo_incoming_thread from MigrationIncomingState
  migration: process_incoming_migration_co: simplify code flow around
    ret
  migration: split migration_incoming_co
  migration: process_incoming_migration_co(): move colo part to colo
  migration: disallow change capabilities in COLO state
  migration: block incoming colo when capability is disabled

 block/meson.build              |   2 +-
 hmp-commands.hx                |   2 +
 include/migration/colo.h       |  18 +++++-
 meson_options.txt              |   2 +
 migration/colo.c               | 100 +++++++++++++++++++--------------
 migration/meson.build          |   6 +-
 migration/migration-hmp-cmds.c |   2 +
 migration/migration.c          |  51 +++++++----------
 migration/migration.h          |  11 +++-
 migration/options.c            |   6 +-
 net/meson.build                |  13 ++++-
 qapi/migration.json            |   9 ++-
 scripts/meson-buildoptions.sh  |   3 +
 stubs/colo-compare.c           |   7 +++
 stubs/colo.c                   |  37 ++++++++++++
 stubs/meson.build              |   2 +
 16 files changed, 181 insertions(+), 90 deletions(-)
 create mode 100644 stubs/colo-compare.c
 create mode 100644 stubs/colo.c

-- 
2.34.1


