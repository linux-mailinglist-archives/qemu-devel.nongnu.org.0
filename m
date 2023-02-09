Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF776911FB
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 21:12:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQDDw-0001e0-6q; Thu, 09 Feb 2023 15:08:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pQDDn-0001bD-Ai
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 15:08:43 -0500
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pQDDk-0002hp-Hm
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 15:08:43 -0500
Received: from myt5-8800bd68420f.qloud-c.yandex.net
 (myt5-8800bd68420f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:4615:0:640:8800:bd68])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 42C3B61AE7;
 Thu,  9 Feb 2023 23:08:31 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:6518::1:1])
 by myt5-8800bd68420f.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 A8lCI60OTGk1-TjfqXSKC; Thu, 09 Feb 2023 23:08:30 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1675973310; bh=4idUn3gQVhg47qMVrKAPhRCtyv+mFieIGtY3jF5wbTE=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=ZuKhLRH0kel4N79jCo7kjcCUNnvHSR37lQh0Litzc1tjjhPCJgoJgJqF9v7+czPUI
 tDntw6QktZx4qhAqA7M/mz6cpl0jy1lZsNlv85O8ac+UK6Dv4/oWAuElyPPCpDa3X/
 Nkq8tlmDerYA8bgeuyDTgY2Gww7M3Jrgt4jAVPJo=
Authentication-Results: myt5-8800bd68420f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, vsementsov@yandex-team.ru, den-plotnikov@yandex-team.ru
Subject: [PATCH v3 09/15] pcie: pcie_cap_slot_enable_power() use correct helper
Date: Thu,  9 Feb 2023 23:08:02 +0300
Message-Id: <20230209200808.869275-10-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230209200808.869275-1-vsementsov@yandex-team.ru>
References: <20230209200808.869275-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
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

*_by_mask() helpers shouldn't be used here (and that's the only one).
*_by_mask() helpers do shift their value argument, but in pcie.c code
we use values that are already shifted appropriately.
Happily, PCI_EXP_SLTCTL_PWR_ON is zero, so shift doesn't matter. But if
we apply same helper for PCI_EXP_SLTCTL_PWR_OFF constant it will do
wrong thing.

So, let's use instead pci_word_test_and_clear_mask() which is already
used in the file to clear PCI_EXP_SLTCTL_PWR_OFF bit in
pcie_cap_slot_init() and pcie_cap_slot_reset().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 hw/pci/pcie.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index ccdb2377e1..db8360226f 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -373,8 +373,8 @@ void pcie_cap_slot_enable_power(PCIDevice *dev)
     uint32_t sltcap = pci_get_long(exp_cap + PCI_EXP_SLTCAP);
 
     if (sltcap & PCI_EXP_SLTCAP_PCP) {
-        pci_set_word_by_mask(exp_cap + PCI_EXP_SLTCTL,
-                             PCI_EXP_SLTCTL_PCC, PCI_EXP_SLTCTL_PWR_ON);
+        pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTCTL,
+                                     PCI_EXP_SLTCTL_PCC);
     }
 }
 
-- 
2.34.1


