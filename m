Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CB568D62E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 13:11:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPMnC-00061h-Vd; Tue, 07 Feb 2023 07:09:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pPMn8-00061I-N6
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 07:09:42 -0500
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pPMn6-00046z-PP
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 07:09:42 -0500
Received: from myt6-23a5e62c0090.qloud-c.yandex.net
 (myt6-23a5e62c0090.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:1da3:0:640:23a5:e62c])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 97C1F62984;
 Tue,  7 Feb 2023 15:09:32 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown [2a02:6b8:b081:218::1:e])
 by myt6-23a5e62c0090.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 O9b4CX1QdqM1-8c9pUX9v; Tue, 07 Feb 2023 15:09:31 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1675771771; bh=05tmy70KSiMrmEAE96kD760DZ4N1j0edQSSUwubw3uU=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=o7GMy4pJw2oJtJbmEOyE/OBaoD8fo/3bCAM2rBYk2CDNtmnbVrnXnb1vNMBchDfMw
 nj3catA4n1w3M8U/X4FTEeJ41Vhfm5e7wKQsM2yr8yxeeTEdDhkjFzpcKUUrlfMj/k
 gGCpC8ScA8YzK/LpJoubRSVFjXKMd27Sc/xUlMaE=
Authentication-Results: myt6-23a5e62c0090.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, vsementsov@yandex-team.ru,
 philmd@linaro.org
Subject: [PATCH 1/4] pcie: pcie_cap_slot_write_config(): use correct macro
Date: Tue,  7 Feb 2023 15:09:18 +0300
Message-Id: <20230207120922.325203-2-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207120922.325203-1-vsementsov@yandex-team.ru>
References: <20230207120922.325203-1-vsementsov@yandex-team.ru>
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

PCI_EXP_SLTCTL_PIC_OFF is a value, and PCI_EXP_SLTCTL_PIC is a mask.
Happily PCI_EXP_SLTCTL_PIC_OFF is a maximum value for this mask and is
equal to the mask itself. Still the code looks like a bug. Let's make
it more reader-friendly.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 hw/pci/pcie.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 924fdabd15..82ef723983 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -770,9 +770,9 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
      * control of powered off slots before powering them on.
      */
     if ((sltsta & PCI_EXP_SLTSTA_PDS) && (val & PCI_EXP_SLTCTL_PCC) &&
-        (val & PCI_EXP_SLTCTL_PIC_OFF) == PCI_EXP_SLTCTL_PIC_OFF &&
+        (val & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PIC_OFF &&
         (!(old_slt_ctl & PCI_EXP_SLTCTL_PCC) ||
-        (old_slt_ctl & PCI_EXP_SLTCTL_PIC_OFF) != PCI_EXP_SLTCTL_PIC_OFF)) {
+        (old_slt_ctl & PCI_EXP_SLTCTL_PIC) != PCI_EXP_SLTCTL_PIC_OFF)) {
         pcie_cap_slot_do_unplug(dev);
     }
     pcie_cap_update_power(dev);
-- 
2.34.1


