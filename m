Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C468D5477D8
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Jun 2022 00:54:41 +0200 (CEST)
Received: from localhost ([::1]:38156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0A08-0008OM-CV
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 18:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mauricio@mailbox.org>)
 id 1o09k2-000520-LH; Sat, 11 Jun 2022 18:38:02 -0400
Received: from mout-p-102.mailbox.org ([80.241.56.152]:56636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <mauricio@mailbox.org>)
 id 1o09k0-0008Ni-ER; Sat, 11 Jun 2022 18:38:02 -0400
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4LLCQW1r4Gz9ss1;
 Sun, 12 Jun 2022 00:37:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1654987075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=6zW25GgyjSpNgdM+GycZVm9NfcQEtIvwhzmqzoYHtPg=;
 b=drFjN0GAJevyp3lioSsar7Dsg890t8gr8AsP4CLc2wNnIqNRtm/o9AwWu+FVfYtROL4civ
 BESRPUM2+GyYE+3J+bfZUf2qB7jhsixWnTRYuOagIhJV/XwOTu/rrVZ+HcXb6BbR2uH42F
 PeWrBEKR5tmOgtJ8FPRhAhRdqMdMo+GFg1GekoRiMyhRDYZ3xW17X0VV6t/8WOoB/CWIR/
 1875EKBLUu1yl4Se2Aab3Uzuz9G1HVHSreZY4CXYGJyMGriOAgGd7yyCMtzgMZn/OiXyEr
 Vbiq8atEfrx2P45O4WGv69AuQvGXSm30udAk/9bj4ylPSSG/sOVFwGsAPycrQQ==
From: Mauricio Sandt <mauricio@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1654987075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=6zW25GgyjSpNgdM+GycZVm9NfcQEtIvwhzmqzoYHtPg=;
 b=drFjN0GAJevyp3lioSsar7Dsg890t8gr8AsP4CLc2wNnIqNRtm/o9AwWu+FVfYtROL4civ
 BESRPUM2+GyYE+3J+bfZUf2qB7jhsixWnTRYuOagIhJV/XwOTu/rrVZ+HcXb6BbR2uH42F
 PeWrBEKR5tmOgtJ8FPRhAhRdqMdMo+GFg1GekoRiMyhRDYZ3xW17X0VV6t/8WOoB/CWIR/
 1875EKBLUu1yl4Se2Aab3Uzuz9G1HVHSreZY4CXYGJyMGriOAgGd7yyCMtzgMZn/OiXyEr
 Vbiq8atEfrx2P45O4WGv69AuQvGXSm30udAk/9bj4ylPSSG/sOVFwGsAPycrQQ==
To: qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 qemu-block@nongnu.org, Mauricio Sandt <mauricio@mailbox.org>
Subject: [PATCH] hw/nvme: Add options to override hardcoded values
Date: Sun, 12 Jun 2022 00:35:09 +0200
Message-Id: <20220611223509.32280-1-mauricio@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: tx1x6j1mysrcby1zba6wna991cfum1pr
X-MBO-RS-ID: 1aceab315bb02a07492
Received-SPF: pass client-ip=80.241.56.152; envelope-from=mauricio@mailbox.org;
 helo=mout-p-102.mailbox.org
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 11 Jun 2022 18:52:28 -0400
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

This small patch is the result of some recent malware research I did
in a QEMU VM. The malware used multiple ways of querying info from
the VM disk and I needed a clean way to change those values from the
hypervisor.

I believe this functionality could be useful to more people from multiple
fields, sometimes you just want to change some default values and having
them hardcoded in the sourcecode makes that much harder.

This patch adds three config parameters to the nvme device, all of them
are optional to not break anything. If any of them are not specified,
the previous (before this patch) default is used.

-model - This takes a string and sets it as the devices model name.
If you don't specify this parameter, the default is "QEMU NVMe Ctrl".

-firmware - The firmware version string, max 8 ascii characters.
The default is whatever `QEMU_VERSION` evaluates to.

-nqn_override - Allows to set a custom nqn on the nvme device.
Only used if there is no subsystem. This string should be in the same
format as the default "nqn.2019-08.org.qemu:...", but there is no
validation for that. Its up to the user to provide a valid string.

Signed-off-by: Mauricio Sandt <mauricio@mailbox.org>
---
 hw/nvme/ctrl.c | 16 +++++++++++++---
 hw/nvme/nvme.h |  3 +++
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 1e6e0fcad9..0e67217a63 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6697,8 +6697,13 @@ static void nvme_init_subnqn(NvmeCtrl *n)
     NvmeIdCtrl *id = &n->id_ctrl;
 
     if (!subsys) {
-        snprintf((char *)id->subnqn, sizeof(id->subnqn),
+        if (n->params.nqn_override) {
+            snprintf((char *)id->subnqn, sizeof(id->subnqn),
+                 "%s", n->params.nqn_override);
+        } else {
+            snprintf((char *)id->subnqn, sizeof(id->subnqn),
                  "nqn.2019-08.org.qemu:%s", n->params.serial);
+        }
     } else {
         pstrcpy((char *)id->subnqn, sizeof(id->subnqn), (char*)subsys->subnqn);
     }
@@ -6712,8 +6717,10 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 
     id->vid = cpu_to_le16(pci_get_word(pci_conf + PCI_VENDOR_ID));
     id->ssvid = cpu_to_le16(pci_get_word(pci_conf + PCI_SUBSYSTEM_VENDOR_ID));
-    strpadcpy((char *)id->mn, sizeof(id->mn), "QEMU NVMe Ctrl", ' ');
-    strpadcpy((char *)id->fr, sizeof(id->fr), QEMU_VERSION, ' ');
+    strpadcpy((char *)id->mn, sizeof(id->mn),
+            n->params.model ? n->params.model : "QEMU NVMe Ctrl", ' ');
+    strpadcpy((char *)id->fr, sizeof(id->fr),
+            n->params.firmware ? n->params.firmware : QEMU_VERSION, ' ');
     strpadcpy((char *)id->sn, sizeof(id->sn), n->params.serial, ' ');
 
     id->cntlid = cpu_to_le16(n->cntlid);
@@ -6913,6 +6920,9 @@ static Property nvme_props[] = {
     DEFINE_PROP_LINK("subsys", NvmeCtrl, subsys, TYPE_NVME_SUBSYS,
                      NvmeSubsystem *),
     DEFINE_PROP_STRING("serial", NvmeCtrl, params.serial),
+    DEFINE_PROP_STRING("model", NvmeCtrl, params.model),
+    DEFINE_PROP_STRING("nqn_override", NvmeCtrl, params.nqn_override),
+    DEFINE_PROP_STRING("firmware", NvmeCtrl, params.firmware),
     DEFINE_PROP_UINT32("cmb_size_mb", NvmeCtrl, params.cmb_size_mb, 0),
     DEFINE_PROP_UINT32("num_queues", NvmeCtrl, params.num_queues, 0),
     DEFINE_PROP_UINT32("max_ioqpairs", NvmeCtrl, params.max_ioqpairs, 64),
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index e41771604f..45bcf3e02e 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -394,6 +394,9 @@ typedef struct NvmeCQueue {
 
 typedef struct NvmeParams {
     char     *serial;
+    char     *model;
+    char     *firmware;
+    char     *nqn_override;
     uint32_t num_queues; /* deprecated since 5.1 */
     uint32_t max_ioqpairs;
     uint16_t msix_qsize;
-- 
2.25.1


