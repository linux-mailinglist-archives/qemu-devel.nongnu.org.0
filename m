Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E699702D25
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 14:54:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXha-0004Zi-DM; Mon, 15 May 2023 08:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pyXhU-0004Yr-Iu
 for qemu-devel@nongnu.org; Mon, 15 May 2023 08:53:16 -0400
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pyXhQ-0006sE-NQ
 for qemu-devel@nongnu.org; Mon, 15 May 2023 08:53:15 -0400
Received: from mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:a49a:0:640:edd6:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 1EA8D60B22;
 Mon, 15 May 2023 15:53:03 +0300 (MSK)
Received: from vsementsov-nix.yandex.net (unknown
 [2a02:6b8:8f:4:7a31:c1ff:fef2:bf07])
 by mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id VqZgEb0OeGk0-JnnxaRns; Mon, 15 May 2023 15:53:02 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1684155182; bh=adLZj0QgbMlTvf9UFF/w0YsqiuRHWg81C2eGv2os/Mc=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=PWB/YGbjhprajNl3e9bm2H1Ne2sJ+ftyaocXHOnGKwdLtV6c1xuJ6CNDfr1Mg1OJT
 sCU7XGOvIHVk1hxlVI4O3PfWXysIkhCl3vWmVzt+xdk449W+K+pWCKnmkJwH1xp/Kg
 t3MJeFxP+0oL0Jl6DFYi+NfEwSskRzhDlhYpA4BA=
Authentication-Results: mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: marcel.apfelbaum@gmail.com, mst@redhat.com, philmd@linaro.org,
 david@redhat.com, peterx@redhat.com, pbonzini@redhat.com,
 den-plotnikov@yandex-team.ru, lersek@redhat.com, kraxel@redhat.com,
 dgilbert@redhat.com, quintela@redhat.com, armbru@redhat.com,
 vsementsov@yandex-team.ru
Subject: [PATCH v3 0/3] ROM migration
Date: Mon, 15 May 2023 15:52:26 +0300
Message-Id: <20230515125229.44836-1-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
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

v3:
01: follow small refactoring advice by David + r-b
02: r-b by Devid
03: add error message example to commit message
    r-bs by Devid and Juan

v2: simply ignore romfile on incoming migration when romsize is
specified.

Here I suggest a way to solve a problem, when we have existing
running QEMU with old option ROM of small size and want to migrate to
new environment where we don't have this ROM file.

All the details are in patch 03; 01-02 are simple code style
improvements.

Vladimir Sementsov-Ogievskiy (3):
  pci: pci_add_option_rom(): improve style
  pci: pci_add_option_rom(): refactor: use g_autofree for path variable
  pci: ROM preallocation for incoming migration

 hw/pci/pci.c | 100 +++++++++++++++++++++++++++------------------------
 1 file changed, 53 insertions(+), 47 deletions(-)

-- 
2.34.1


