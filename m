Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA356EE0BB
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 12:57:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prGLZ-0001vt-Hw; Tue, 25 Apr 2023 06:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1prGLT-0001u0-1X
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 06:56:28 -0400
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1prGLQ-0004ga-KU
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 06:56:26 -0400
Received: from mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c00:2582:0:640:9a17:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 7CC4A5EBD6;
 Tue, 25 Apr 2023 13:56:17 +0300 (MSK)
Received: from vsementsov-nix.yandex-team.ru (unknown
 [2a02:6b8:b081:b440::1:14])
 by mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id 4uDLUS1OcKo0-5J0b9cCi; Tue, 25 Apr 2023 13:56:16 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682420176; bh=UD2+Ftsy+Xg9H0gzE/do8MmNBwIcy2aY5bffB+ZuVp0=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=kAS2fJx0kojtTC/zqjaj4f9fgoqQ2+FnHRU+Xqhb3wQOZZIfgk0D5Qno4i7MjNsLM
 jhxszlpO73D+M83JR+fFy5piLxrMWQ8oxcxGonZMeHZUZXQBCfEwFuM89GMi37JLOD
 /RSPVMY4fm3m74P6MjS0vm9kfxvMwKxi/pIEtF1U=
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: marcel.apfelbaum@gmail.com, mst@redhat.com, philmd@linaro.org,
 david@redhat.com, peterx@redhat.com, pbonzini@redhat.com,
 vsementsov@yandex-team.ru, den-plotnikov@yandex-team.ru, lersek@redhat.com,
 kraxel@redhat.com
Subject: [PATCH 0/3] ROM migration
Date: Tue, 25 Apr 2023 13:56:00 +0300
Message-Id: <20230425105603.137823-1-vsementsov@yandex-team.ru>
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

That's a substitution for my first attempt:
 [PATCH] pci: make ROM memory resizable
 <20230424203647.94614-1-vsementsov@yandex-team.ru>

Here I suggest another way to solve a problem, when we have existing
running QEMU with old option ROM of small size and want to migrate to
new environment where we don't have this ROM file.

All the details are in patch 03; 01-02 are simple code style
improvements.

Vladimir Sementsov-Ogievskiy (3):
  pci: pci_add_option_rom(): improve style
  pci: pci_add_option_rom(): refactor: use g_autofree for path variable
  pci: ROM preallocation for incoming migration

 hw/pci/pci.c | 98 ++++++++++++++++++++++++++++------------------------
 1 file changed, 52 insertions(+), 46 deletions(-)

-- 
2.34.1


