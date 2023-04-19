Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 889266E8551
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 00:55:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppGgE-0003Gw-BT; Wed, 19 Apr 2023 18:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppGg8-0003GJ-KE; Wed, 19 Apr 2023 18:53:32 -0400
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppGfw-0000T1-Ts; Wed, 19 Apr 2023 18:53:22 -0400
Received: from mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:7f29:0:640:9a2b:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 517775FB3D;
 Thu, 20 Apr 2023 01:53:07 +0300 (MSK)
Received: from vsementsov-nix.yandex.net (unknown [2a02:6b8:b081:b583::1:16])
 by mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (smtpcorp/Yandex) with ESMTPSA id YqmhHB1OqSw0-OcFKZXr6; 
 Thu, 20 Apr 2023 01:53:06 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1681944786; bh=UykBeh/dtMAPcLeT9/nCu+pM2vJ9A8u2Im84+31x+0g=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=VZH22N7DraAmk+2lb2QhBmS5nfBCrJuzgiT6mx+Z3uM5VAitfMurBQHJhp62cxN4T
 tflpZeaUiyqVtCI4Bfu9uDT3I8ze634t/ae5onJ/fWh9tTbjREOm5CsMnTtbpipjX5
 fof4MAgK/jveVApt72q+RLGuS3XvhEhh0lCaFwQU=
Authentication-Results: mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, michael.roth@amd.com, armbru@redhat.com,
 eblake@redhat.com, jasowang@redhat.com, quintela@redhat.com,
 zhanghailiang@xfusion.com, philmd@linaro.org, thuth@redhat.com,
 berrange@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 dave@treblig.org, hreitz@redhat.com, kwolf@redhat.com,
 chen.zhang@intel.com, lizhijian@fujitsu.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH v2 0/4] COLO: improve build options
Date: Thu, 20 Apr 2023 01:52:28 +0300
Message-Id: <20230419225232.508121-1-vsementsov@yandex-team.ru>
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

COLO substem seems to be useless when CONFIG_REPLICATION is unset, as we
simply don't allow to set x-colo capability in this case. So, let's not
compile in unreachable code and interface we cannot use when
CONFIG_REPLICATION is unset.

Also, provide personal configure option for COLO Proxy subsystem.

v1 was 
[PATCH] replication: compile out some staff when replication is not configured
Supersedes: <20230411145112.497785-1-vsementsov@yandex-team.ru>

Vladimir Sementsov-Ogievskiy (4):
  block/meson.build: prefer positive condition for replication
  scripts/qapi: allow optional experimental enum values
  build: move COLO under CONFIG_REPLICATION
  configure: add --disable-colo-filters option

 block/meson.build              |  2 +-
 hmp-commands.hx                |  2 ++
 meson.build                    |  1 +
 meson_options.txt              |  2 ++
 migration/colo.c               |  6 +++++
 migration/meson.build          |  6 +++--
 migration/migration-hmp-cmds.c |  2 ++
 migration/migration.c          | 19 +++-----------
 net/meson.build                | 16 +++++++++---
 qapi/migration.json            | 12 ++++++---
 scripts/meson-buildoptions.sh  |  3 +++
 scripts/qapi/types.py          |  2 ++
 stubs/colo.c                   | 47 ++++++++++++++++++++++++++++++++++
 stubs/meson.build              |  1 +
 14 files changed, 95 insertions(+), 26 deletions(-)
 create mode 100644 stubs/colo.c

-- 
2.34.1


