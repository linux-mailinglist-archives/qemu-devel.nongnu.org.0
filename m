Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AA65AC49D
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 16:02:23 +0200 (CEST)
Received: from localhost ([::1]:38298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUqCW-0008RD-N1
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 10:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1oUqA4-0006ZE-FM
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 09:59:44 -0400
Received: from [60.177.97.220] (port=41226 helo=liuqiang-OptiPlex-7060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1oUqA2-00017f-J7
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 09:59:44 -0400
Received: from localhost (liuqiang-OptiPlex-7060 [local])
 by liuqiang-OptiPlex-7060 (OpenSMTPD) with ESMTPA id 6b7501c0;
 Sun, 4 Sep 2022 12:59:34 +0000 (UTC)
From: Qiang Liu <cyruscyliu@gmail.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] hcd-xhci: drop operation with secondary stream arrays enabled
Date: Sun,  4 Sep 2022 20:59:26 +0800
Message-Id: <20220904125926.2141607-1-cyruscyliu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 60.177.97.220 (failed)
Received-SPF: softfail client-ip=60.177.97.220;
 envelope-from=cyruscyliu@gmail.com; helo=liuqiang-OptiPlex-7060
X-Spam_score_int: 65
X-Spam_score: 6.5
X-Spam_bar: ++++++
X-Spam_report: (6.5 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FROM=0.001, FSL_HELO_NON_FQDN_1=0.001,
 HELO_NO_DOMAIN=0.001, NML_ADSP_CUSTOM_MED=0.9, RCVD_IN_PBL=3.335,
 RCVD_IN_SORBS_DUL=0.001, RDNS_NONE=0.793, SPF_SOFTFAIL=0.665,
 SPOOFED_FREEMAIL=1.701, SPOOFED_FREEMAIL_NO_RDNS=0.017, SPOOF_GMAIL_MID=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
X-Spam_action: reject
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

The abort() in xhci_find_stream() can be triggered via enabling the secondary
stream arrays by setting linear stream array (LSA) bit (in endpoint context) to
0. We may show warnings and drop this operation.

Fixes: 024426acc0a2 ("usb-xhci: usb3 streams")
Reported-by: Qiang Liu <cyruscyliu@gmail.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1192
Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
---
 hw/usb/hcd-xhci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index 3c48b58dde..654f7ec24a 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -992,7 +992,9 @@ static XHCIStreamContext *xhci_find_stream(XHCIEPContext *epctx,
         }
         sctx = epctx->pstreams + streamid;
     } else {
-        FIXME("secondary streams not implemented yet");
+        fprintf(stderr, "xhci: FIXME: secondary streams not implemented yet");
+        *cc_error = CC_INVALID_STREAM_TYPE_ERROR;
+        return NULL;
     }
 
     if (sctx->sct == -1) {
-- 
2.25.1


