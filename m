Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A1E573E32
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 22:52:29 +0200 (CEST)
Received: from localhost ([::1]:44938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBjLQ-0006GH-4y
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 16:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@codethink.co.uk>)
 id 1oBfwT-0006dl-6R; Wed, 13 Jul 2022 13:14:29 -0400
Received: from imap4.hz.codethink.co.uk ([188.40.203.114]:38714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@codethink.co.uk>)
 id 1oBfwR-0003CY-Lk; Wed, 13 Jul 2022 13:14:28 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=rainbowdash)
 by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1oBfdU-003M8o-18; Wed, 13 Jul 2022 17:54:51 +0100
Received: from ben by rainbowdash with local (Exim 4.96)
 (envelope-from <ben@rainbowdash>) id 1oBfdS-0009kn-1k;
 Wed, 13 Jul 2022 17:54:50 +0100
From: Ben Dooks <ben.dooks@sifive.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Jude Onyenegecha <jude.onyenegecha@sifive.com>,
 Sudip Mukherjee <sudip.mukherjee@sifive.com>,
 William Salmon <william.salmon@sifive.com>,
 Adnan Chowdhury <adnan.chowdhury@sifive.com>,
 Ben Dooks <ben.dooks@sifive.com>
Subject: [PATCH 3/7] pci: designware: clamp viewport index
Date: Wed, 13 Jul 2022 17:54:45 +0100
Message-Id: <20220713165449.37433-4-ben.dooks@sifive.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220713165449.37433-1-ben.dooks@sifive.com>
References: <20220713165449.37433-1-ben.dooks@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.40.203.114; envelope-from=ben@codethink.co.uk;
 helo=imap4.hz.codethink.co.uk
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Jul 2022 16:45:29 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current Linux driver for this assumes it can write the 255 into
this register and then read back the value to work out how many
viewports are supported.

Clamp the value so that the probe works and does not cause memory
corruption as the value is not well clamped elsewhere in the driver.

Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
---
 hw/pci-host/designware.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index d213d7324c..6403416634 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -345,6 +345,10 @@ static void designware_pcie_root_config_write(PCIDevice *d, uint32_t address,
         break;
 
     case DESIGNWARE_PCIE_ATU_VIEWPORT:
+        /* clamp this value, linux uses it to calculate the
+         * available number of viewports */
+        if (val >= DESIGNWARE_PCIE_NUM_VIEWPORTS)
+            val = DESIGNWARE_PCIE_NUM_VIEWPORTS-1;
         root->atu_viewport = val;
         break;
 
-- 
2.35.1


