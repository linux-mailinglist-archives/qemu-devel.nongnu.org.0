Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D2E702E66
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:37:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXv6-0002CM-Oq; Mon, 15 May 2023 09:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pyXun-0001y9-P1
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:07:03 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pyXuj-0001xP-Gb
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:06:59 -0400
Received: from mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c14:750a:0:640:e46:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 6AC0060505;
 Mon, 15 May 2023 16:06:51 +0300 (MSK)
Received: from vsementsov-nix.yandex.net (unknown
 [2a02:6b8:8f:4:7a31:c1ff:fef2:bf07])
 by mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id f6aGDc2OcCg0-YyA7k97I; Mon, 15 May 2023 16:06:50 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1684156010; bh=m4OMhONmhKBzWRok2iN3e+0e92mipw/nryf+ghcjn8E=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=JtsSL61WoFbLQqFJF/VASMes9Vvcbcm8H76aXM2IMymsepiyyniCFSagbsY00BJCt
 6dqdEhX+e3iOdREohgg87cAn9Inpv+SBf4ZELFw5rQN2l/5GeNI6KZh/wwjo27Lgvo
 KDi18jDr0gw7OCZMw5FYnKbyRKFpNb5ZLivgb1V8=
Authentication-Results: mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: jasowang@redhat.com, philmd@linaro.org, thuth@redhat.com,
 berrange@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 leobras@redhat.com, peterx@redhat.com, quintela@redhat.com,
 zhanghailiang@xfusion.com, chen.zhang@intel.com, lukasstraub2@web.de,
 vsementsov@yandex-team.ru
Subject: [PATCH v5 0/3] COLO: improve build options
Date: Mon, 15 May 2023 16:06:37 +0300
Message-Id: <20230515130640.46035-1-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi all!

Most patches merged, thanks to Juan!

Here is remaining three patches.

01: update commit msg, add r-b by Zhang,
  - patch is unrelated to 02-03, may be merged in separate

02: fix missed invocation in migration/rdma.c
03: fix reversed assertion

Vladimir Sementsov-Ogievskiy (3):
  configure: add --disable-colo-proxy option
  migration: split migration_incoming_co
  migration: process_incoming_migration_co(): move colo part to colo

 include/migration/colo.h      |  9 +++++++-
 meson_options.txt             |  2 ++
 migration/colo.c              | 43 ++++++++++++++++++++++++++++++++---
 migration/migration.c         | 30 ++++--------------------
 migration/migration.h         |  9 +++++++-
 migration/rdma.c              |  5 ++--
 net/meson.build               | 13 ++++++++---
 scripts/meson-buildoptions.sh |  3 +++
 stubs/colo-compare.c          |  7 ++++++
 stubs/colo.c                  |  6 ++---
 stubs/meson.build             |  1 +
 11 files changed, 88 insertions(+), 40 deletions(-)
 create mode 100644 stubs/colo-compare.c

-- 
2.34.1


