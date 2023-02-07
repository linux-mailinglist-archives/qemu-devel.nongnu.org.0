Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DABC68D636
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 13:11:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPMou-0001Wd-OD; Tue, 07 Feb 2023 07:11:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pPMor-0001Fc-HQ
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 07:11:29 -0500
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pPMop-0004Zp-Po
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 07:11:29 -0500
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id 1DF46600D7;
 Tue,  7 Feb 2023 15:11:22 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown [2a02:6b8:b081:218::1:e])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 HBbDgg1QJGk1-xESv9t3j; Tue, 07 Feb 2023 15:11:21 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1675771881; bh=CV37YL7xgNZF+1QhXrUSsUhYFP5oxJSA7GNlsxKW9ZU=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=MYC5xojL2dS6HQsEywXecfII8Ea2IuziqLLWqZ9FViwzT35Dxuh0+TL3xwLdHUwDQ
 81yhQJuls02FIpXJ+C9OvebR6yTuiBk8VpUWul98+l3paU/f61MWyV/FmNomSct150
 9+rGGSOJg5alucFo0bgINFuElEc8v5JmkMh6dlKg=
Authentication-Results: vla1-81430ab5870b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, vsementsov@yandex-team.ru,
 philmd@linaro.org
Subject: [PATCH v2 0/3] pcie: cleanup code
Date: Tue,  7 Feb 2023 15:11:13 +0300
Message-Id: <20230207121116.325456-1-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.72;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
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

was: "[PATCH 0/4] pcie: cleanup code and add trace point"
02: add rb-s by Philippe
    drop trace-point patch for now, I plan to add QAPI event separately

Vladimir Sementsov-Ogievskiy (3):
  pcie: pcie_cap_slot_write_config(): use correct macro
  pcie_regs: drop duplicated indicator value macros
  pcie: drop unused PCIExpressIndicator

 include/hw/pci/pcie.h      |  8 --------
 include/hw/pci/pcie_regs.h | 14 --------------
 hw/pci/pcie.c              | 13 +++++++------
 3 files changed, 7 insertions(+), 28 deletions(-)

-- 
2.34.1


