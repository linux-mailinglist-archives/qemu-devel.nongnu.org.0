Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B110D6F0D28
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 22:31:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps8Fs-0002vq-KY; Thu, 27 Apr 2023 16:30:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ps8Fq-0002uF-Ns; Thu, 27 Apr 2023 16:30:14 -0400
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ps8Fm-0004nV-PM; Thu, 27 Apr 2023 16:30:14 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:369a:0:640:c31a:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id DCA1C5EA85;
 Thu, 27 Apr 2023 23:29:59 +0300 (MSK)
Received: from vsementsov-nix.yandex-team.ru (unknown
 [2a02:6b8:b081:b438::1:2b])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id lTP2w70Oh0U0-bMTsXcuO; Thu, 27 Apr 2023 23:29:59 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682627399; bh=qf2m6vxf2Rl8UGTNsMjU/wLrD5N48lYBrbJ/mpzF3WU=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=X85HEZjXWkL+cefz3hFdDR6TW5ccYphkphwNfcJNTWYOdaxQ1rulCCzmtMQKTlt05
 oy9+riO8FEB03ckNCzg8uPjx5FkKrOq8wzC7chElotPGYnZIl6mfxLuEUyB+a0YwBP
 VFLdVLti4UccT2R+L/mh71uX1KOpI6jE9ZtXogoY=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, michael.roth@amd.com, armbru@redhat.com,
 eblake@redhat.com, jasowang@redhat.com, quintela@redhat.com,
 zhanghailiang@xfusion.com, philmd@linaro.org, thuth@redhat.com,
 berrange@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 dave@treblig.org, hreitz@redhat.com, kwolf@redhat.com,
 chen.zhang@intel.com, lizhijian@fujitsu.com, lukasstraub2@web.de,
 vsementsov@yandex-team.ru
Subject: [PATCH v3 0/4] COLO: improve build options
Date: Thu, 27 Apr 2023 23:29:42 +0300
Message-Id: <20230427202946.1007276-1-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
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

v3:
01: add r-bs
02: improve commit message
03: - improve commit message
    - drop ifdefs from migration/colo.c which are not needed anymore
    - don't move migrate_colo_enabled() (now just migrate_colo()), instead modify it inplace
    - keep colo-compare.c for now (will be handled in updated 04 patch)
    - so, no colo_compare_cleanup() stub needed for now, neither migrate_colo_enabled() stub
    - keep Acked-by.
04: - improve commit message
    - rename to --disable-colo-proxy to match subsystem name in MAINTAINERS
    - don't introduce CONFIG_COLO_PROXY, it actually is not needed
    - colo-compare.c is handled now and included if any of 'replication' and 'colo-proxy' are enabled
    - so, we add colo_compare_cleanup() stub in a separate stub file

Hi all!

COLO substem seems to be useless when CONFIG_REPLICATION is unset, as we
simply don't allow to set x-colo capability in this case. So, let's not
compile in unreachable code and interface we cannot use when
CONFIG_REPLICATION is unset.

Also, provide personal configure option for COLO Proxy subsystem.

Vladimir Sementsov-Ogievskiy (4):
  block/meson.build: prefer positive condition for replication
  scripts/qapi: allow optional experimental enum values
  build: move COLO under CONFIG_REPLICATION
  configure: add --disable-colo-proxy option

 block/meson.build              |  2 +-
 hmp-commands.hx                |  2 ++
 meson_options.txt              |  2 ++
 migration/colo.c               | 28 -------------------------
 migration/meson.build          |  6 ++++--
 migration/migration-hmp-cmds.c |  2 ++
 migration/options.c            | 17 ++++++++--------
 net/meson.build                | 14 +++++++++----
 qapi/migration.json            | 12 +++++++----
 scripts/meson-buildoptions.sh  |  3 +++
 scripts/qapi/types.py          |  2 ++
 stubs/colo-compare.c           |  7 +++++++
 stubs/colo.c                   | 37 ++++++++++++++++++++++++++++++++++
 stubs/meson.build              |  2 ++
 14 files changed, 88 insertions(+), 48 deletions(-)
 create mode 100644 stubs/colo-compare.c
 create mode 100644 stubs/colo.c

-- 
2.34.1


