Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 768213127E5
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 23:31:54 +0100 (CET)
Received: from localhost ([::1]:37862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8sau-0003s0-2J
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 17:31:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l8sYZ-0002lk-W5
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 17:29:28 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:52598
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l8sYX-0005NI-HO
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 17:29:26 -0500
Received: from host109-153-84-1.range109-153.btcentralplus.com ([109.153.84.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l8sYp-00075W-0O; Sun, 07 Feb 2021 22:29:47 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Sun,  7 Feb 2021 22:29:02 +0000
Message-Id: <20210207222902.29099-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210207222902.29099-1-mark.cave-ayland@ilande.co.uk>
References: <20210207222902.29099-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 2/2] utils/fifo8: add VMSTATE_FIFO8_TEST macro
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Rewrite the existing VMSTATE_FIFO8 macro to use VMSTATE_FIFO8_TEST as per the
standard pattern in include/migration/vmstate.h.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210128221728.14887-3-mark.cave-ayland@ilande.co.uk>
---
 include/qemu/fifo8.h | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/include/qemu/fifo8.h b/include/qemu/fifo8.h
index 489c354291..28bf2cee57 100644
--- a/include/qemu/fifo8.h
+++ b/include/qemu/fifo8.h
@@ -148,12 +148,16 @@ uint32_t fifo8_num_used(Fifo8 *fifo);
 
 extern const VMStateDescription vmstate_fifo8;
 
-#define VMSTATE_FIFO8(_field, _state) {                              \
-    .name       = (stringify(_field)),                               \
-    .size       = sizeof(Fifo8),                                     \
-    .vmsd       = &vmstate_fifo8,                                    \
-    .flags      = VMS_STRUCT,                                        \
-    .offset     = vmstate_offset_value(_state, _field, Fifo8),       \
+#define VMSTATE_FIFO8_TEST(_field, _state, _test) {                  \
+    .name         = (stringify(_field)),                             \
+    .field_exists = (_test),                                         \
+    .size         = sizeof(Fifo8),                                   \
+    .vmsd         = &vmstate_fifo8,                                  \
+    .flags        = VMS_STRUCT,                                      \
+    .offset       = vmstate_offset_value(_state, _field, Fifo8),     \
 }
 
+#define VMSTATE_FIFO8(_field, _state)                                \
+    VMSTATE_FIFO8_TEST(_field, _state, NULL)
+
 #endif /* QEMU_FIFO8_H */
-- 
2.20.1


