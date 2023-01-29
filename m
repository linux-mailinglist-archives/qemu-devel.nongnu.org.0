Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE80F67FE63
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 12:03:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pM5Qt-0001db-Aj; Sun, 29 Jan 2023 06:01:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1pM5Ql-0001Yi-22
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 06:01:05 -0500
Received: from [115.204.153.249] (helo=liuqiang-OptiPlex-7060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1pM5Qj-0003eT-2o
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 06:01:02 -0500
Received: from localhost (liuqiang-OptiPlex-7060 [local])
 by liuqiang-OptiPlex-7060 (OpenSMTPD) with ESMTPA id 12599e83;
 Sun, 29 Jan 2023 10:54:17 +0000 (UTC)
From: Qiang Liu <cyruscyliu@gmail.com>
To: qemu-devel@nongnu.org
Cc: Qiang Liu <cyruscyliu@gmail.com>, Paul Zimmerman <pauldzim@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] hw/usb/core: fix inconsistent ep and pid (UBS_TOKEN_SETUP)
Date: Sun, 29 Jan 2023 18:54:06 +0800
Message-Id: <20230129105406.2548988-1-cyruscyliu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.204.153.249 (failed)
Received-SPF: softfail client-ip=115.204.153.249;
 envelope-from=cyruscyliu@gmail.com; helo=liuqiang-OptiPlex-7060
X-Spam_score_int: 48
X-Spam_score: 4.8
X-Spam_bar: ++++
X-Spam_report: (4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FROM=0.001, FSL_HELO_NON_FQDN_1=0.001,
 HELO_NO_DOMAIN=0.001, NML_ADSP_CUSTOM_MED=0.9, RCVD_IN_PBL=3.335,
 RDNS_NONE=0.793, SPF_SOFTFAIL=0.665, SPOOFED_FREEMAIL=0.001,
 SPOOFED_FREEMAIL_NO_RDNS=0.001, SPOOF_GMAIL_MID=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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

Sometimes, `ep` is not enforced to 0 when `pid` is `USB_TOKEN_SETUP`. I
trigger this through dwc2
(https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg07179.html).
A similar bug was found
[here](https://gitlab.com/qemu-project/qemu/-/issues/119) and
[here](https://gitlab.com/qemu-project/qemu/-/issues/303).

Fixes: 25d5de7d81a5 ("usb: link packets to endpoints not devices")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/119
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/303
Cc: Paul Zimmerman <pauldzim@gmail.com>
Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
---
 hw/usb/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/core.c b/hw/usb/core.c
index 975f76250a..eb50a7bff8 100644
--- a/hw/usb/core.c
+++ b/hw/usb/core.c
@@ -738,7 +738,7 @@ struct USBEndpoint *usb_ep_get(USBDevice *dev, int pid, int ep)
     struct USBEndpoint *eps;
 
     assert(dev != NULL);
-    if (ep == 0) {
+    if (ep == 0 || pid == USB_TOKEN_SETUP) {
         return &dev->ep_ctl;
     }
     assert(pid == USB_TOKEN_IN || pid == USB_TOKEN_OUT);
-- 
2.25.1


