Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE8957D4AD
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 22:15:01 +0200 (CEST)
Received: from localhost ([::1]:52876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEcZX-0007S4-Nk
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 16:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1oEXjK-0002Vn-RL; Thu, 21 Jul 2022 11:04:46 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:51688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1oEXjJ-0006OD-3S; Thu, 21 Jul 2022 11:04:46 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id BA21011EEAC;
 Thu, 21 Jul 2022 15:04:42 +0000 (UTC)
From: ~igrr <igrr@git.sr.ht>
Date: Wed, 28 Apr 2021 15:33:30 +1200
Subject: [PATCH qemu] hw/block/m25p80: correct dummy bytes for GD flash
MIME-Version: 1.0
Message-ID: <165841588259.32254.13711058338366500866-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
Cc: Martin Johnson <M.J.Johnson@massey.ac.nz>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 36
X-Spam_score: 3.6
X-Spam_bar: +++
X-Spam_report: (3.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 FREEMAIL_FORGED_REPLYTO=2.095, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 21 Jul 2022 16:12:41 -0400
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
Reply-To: ~igrr <igrokhotkov@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Martin Johnson <M.J.Johnson@massey.ac.nz>

Gigadevice flash chips supported in m25p80.c (GD25Q32, GD25Q64)
require a dummy bytes in DIO and QIO modes, similar to Winbond W25Q32
and W25Q64. This patch fixes this behavior.

Signed-off-by: Ivan Grokhotkov <ivan@espressif.com>
Signed-off-by: Martin Johnson <M.J.Johnson@massey.ac.nz>
---
This patch was submitted into our fork at
https://github.com/espressif/qemu/pull/18. The patch seems applicable to
the upstream project, so I am submitting it on behalf of the author.

 hw/block/m25p80.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index a8d2519141..72a209b031 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -168,6 +168,7 @@ typedef struct FlashPartInfo {
 
 #define SPANSION_CONTINUOUS_READ_MODE_CMD_LEN 1
 #define WINBOND_CONTINUOUS_READ_MODE_CMD_LEN 1
+#define GIGADEVICE_CONTINUOUS_READ_MODE_CMD_LEN 1
 
 static const FlashPartInfo known_devices[] = {
     /* Atmel -- some are (confusingly) marketed as "DataFlash" */
@@ -430,6 +431,7 @@ typedef enum {
     MAN_WINBOND,
     MAN_SST,
     MAN_ISSI,
+    MAN_GIGADEVICE,
     MAN_GENERIC,
 } Manufacturer;
 
@@ -514,6 +516,8 @@ static inline Manufacturer get_man(Flash *s)
         return MAN_SST;
     case 0x9D:
         return MAN_ISSI;
+    case 0xC8:
+        return MAN_GIGADEVICE;
     default:
         return MAN_GENERIC;
     }
@@ -992,6 +996,9 @@ static void decode_dio_read_cmd(Flash *s)
     case MAN_WINBOND:
         s->needed_bytes += WINBOND_CONTINUOUS_READ_MODE_CMD_LEN;
         break;
+    case MAN_GIGADEVICE:
+        s->needed_bytes += GIGADEVICE_CONTINUOUS_READ_MODE_CMD_LEN;
+        break;
     case MAN_SPANSION:
         s->needed_bytes += SPANSION_CONTINUOUS_READ_MODE_CMD_LEN;
         s->needed_bytes += extract32(s->spansion_cr2v,
@@ -1042,6 +1049,10 @@ static void decode_qio_read_cmd(Flash *s)
         s->needed_bytes += WINBOND_CONTINUOUS_READ_MODE_CMD_LEN;
         s->needed_bytes += 4;
         break;
+    case MAN_GIGADEVICE:
+        s->needed_bytes += GIGADEVICE_CONTINUOUS_READ_MODE_CMD_LEN;
+        s->needed_bytes += 4;
+        break;
     case MAN_SPANSION:
         s->needed_bytes += SPANSION_CONTINUOUS_READ_MODE_CMD_LEN;
         s->needed_bytes += extract32(s->spansion_cr2v,
-- 
2.34.2

