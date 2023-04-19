Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FF26E7267
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 06:48:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poziT-0003oZ-3g; Wed, 19 Apr 2023 00:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <geoff@aeryn.lan.ktmba>)
 id 1poziR-0003oM-H4
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 00:46:47 -0400
Received: from mail1.hostfission.com ([118.127.8.195])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <geoff@aeryn.lan.ktmba>) id 1poziN-0005DW-EI
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 00:46:47 -0400
Received: from aeryn.lan.ktmba (office.hostfission.com [220.233.29.71])
 by mail1.hostfission.com (Postfix) with ESMTPS id DA1C01F0C17;
 Wed, 19 Apr 2023 14:39:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hostfission.com;
 s=mail; t=1681879190;
 bh=PVVb1n898uEVCc+DSEsNRmKY3aU/upXnZrNrZ90NaiU=;
 h=From:To:Cc:Subject:Date:From;
 b=E0/JVGvmd0+hnIgmxJgh3eImA8a4sDLGcpItSWYXv2MOqVfoLlkJ7hWhrP7beWEIT
 uJrmDHCgZutLr8UcIgt6MY7dEtzWrlGqP/D73LIRjo/0Yygu0srZYk6KMnF0A9b5Rm
 s6tJ+tiR14QnrB3lG9oQfjM8UxIqRoK5pITe4/cw=
Received: by aeryn.lan.ktmba (Postfix, from userid 1000)
 id 63BAE2E0CE0; Wed, 19 Apr 2023 14:39:50 +1000 (AEST)
From: Geoffrey McRae <geoff@hostfission.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Geoffrey McRae <geoff@hostfission.com>
Subject: [PATCH] hw/misc/ivshmem: Use 32-bit addressing for the memory BAR
Date: Wed, 19 Apr 2023 14:39:31 +1000
Message-Id: <20230419043931.36764-1-geoff@hostfission.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=118.127.8.195; envelope-from=geoff@aeryn.lan.ktmba;
 helo=mail1.hostfission.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 NO_DNS_FOR_FROM=0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Since OVMF 202211 the bios maps BAR2 to an upper address which has the
undesirable effect of making it impossible to map the memory under Linux
due to it exceeding the maximum permissible range for hotplug memory
(see `mhp_get_pluggable_range` in `mm/memory_hotplug.c`). This patch
resolves this by configuring the BAR as 32-bit.

Signed-off-by: Geoffrey McRae <geoff@hostfission.com>
---
 hw/misc/ivshmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index d66d912172..2f8f7e2030 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -913,7 +913,7 @@ static void ivshmem_common_realize(PCIDevice *dev, Error **errp)
     pci_register_bar(PCI_DEVICE(s), 2,
                      PCI_BASE_ADDRESS_SPACE_MEMORY |
                      PCI_BASE_ADDRESS_MEM_PREFETCH |
-                     PCI_BASE_ADDRESS_MEM_TYPE_64,
+                     PCI_BASE_ADDRESS_MEM_TYPE_32,
                      s->ivshmem_bar2);
 }
 
-- 
2.39.2


