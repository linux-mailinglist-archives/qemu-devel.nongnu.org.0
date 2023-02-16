Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B87699BCF
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 19:05:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSicG-0000Aj-CF; Thu, 16 Feb 2023 13:04:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSicE-00009p-6i
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 13:04:18 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSicC-0005oT-BQ
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 13:04:17 -0500
Received: from iva8-99b070b76c56.qloud-c.yandex.net
 (iva8-99b070b76c56.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:1099:0:640:99b0:70b7])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id ED079629BC;
 Thu, 16 Feb 2023 21:04:11 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:8813::1:16])
 by iva8-99b070b76c56.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 u3q89J0Qp8c1-p27dZgi2; Thu, 16 Feb 2023 21:04:11 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676570651; bh=rpEBsfck65Xp6MZdZ6eq8uqVcvDqA9fpR1aXcYudBsQ=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=vm9Cc03TRERG7RF0weveu4yjyTuiAQoH4B1FWySv/Uuun2cvL+lUAREHvqV3PBhDX
 KduZat45qBuD44qEbCWDVHZH5cH7LJ6l78W3M+G+7SmQMvHFprxD9plwpL6qQ1JC9h
 nyYuu5OY37pB4z/VDyllkOiYaqu4ys7aj8XdB+zk=
Authentication-Results: iva8-99b070b76c56.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, philmd@linaro.org, vsementsov@yandex-team.ru,
 den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
Subject: [PATCH v5 12/18] pcie: set power indicator to off on reset by default
Date: Thu, 16 Feb 2023 21:03:50 +0300
Message-Id: <20230216180356.156832-13-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216180356.156832-1-vsementsov@yandex-team.ru>
References: <20230216180356.156832-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
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

It should be zero, the only valid values are ON, OFF and BLINK.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Anton Kuchin <antonkuchin@yandex-team.ru>
---
 hw/pci/pcie.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 90faf0710a..b8c24cf45f 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -684,6 +684,7 @@ void pcie_cap_slot_reset(PCIDevice *dev)
                                  PCI_EXP_SLTCTL_PDCE |
                                  PCI_EXP_SLTCTL_ABPE);
     pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTCTL,
+                               PCI_EXP_SLTCTL_PWR_IND_OFF |
                                PCI_EXP_SLTCTL_ATTN_IND_OFF);
 
     if (dev->cap_present & QEMU_PCIE_SLTCAP_PCP) {
-- 
2.34.1


