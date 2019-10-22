Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA904DFD3D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 07:57:25 +0200 (CEST)
Received: from localhost ([::1]:50420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMnAa-0002l2-Cx
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 01:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58939)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <svens@stackframe.org>) id 1iMn86-000145-CO
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 01:54:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <svens@stackframe.org>) id 1iMn84-0000A6-8F
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 01:54:49 -0400
Received: from [2001:470:70c5:1111::170] (port=51036 helo=smtp.duncanthrax.net)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <svens@stackframe.org>)
 id 1iMn82-00009A-Cr
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 01:54:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=tiTGDMHN1vZNDWvO4Ruj3FTopNbi9p5DHVfqGHj/pzc=; b=ZLioB7SZ9PI8KafF93Qfhvc7Wc
 Xb+rWR+Z3OP8HTODIuJnq5NkvRsQnFBEPi+OoQ4aRoFr9xa7PqldBUAFgyS9icsVX4ex4929KlLaf
 uCPO44ZNS3kK7FzB0PY+GVeYJGBiwMl33GipZStZ2cXf9hllBCMasWaK4LJapT4ezsAE=;
Received: from hsi-kbw-046-005-233-221.hsi8.kabel-badenwuerttemberg.de
 ([46.5.233.221] helo=x280.stackframe.org)
 by smtp.eurescom.eu with esmtpa (Exim 4.86_2)
 (envelope-from <svens@stackframe.org>)
 id 1iMn7w-00072u-26; Tue, 22 Oct 2019 07:54:40 +0200
From: Sven Schnelle <svens@stackframe.org>
To: Richard Henderson <rth@twiddle.net>
Subject: [PATCH v2 3/6] ps2: accept 'Set Key Make and Break' commands
Date: Tue, 22 Oct 2019 07:54:12 +0200
Message-Id: <20191022055415.18122-4-svens@stackframe.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191022055415.18122-1-svens@stackframe.org>
References: <20191022055415.18122-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:470:70c5:1111::170
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
Cc: Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

HP-UX sends both the 'Set key make and break (0xfc) and
'Set all key typematic make and break' (0xfa). QEMU response
with 'Resend' as it doesn't handle these commands. HP-UX than
reports an PS/2 max retransmission exceeded error. Add these
commands and just reply with ACK.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 hw/input/ps2.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 67f92f6112..6c2c7066a6 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -49,6 +49,8 @@
 #define KBD_CMD_RESET_DISABLE	0xF5	/* reset and disable scanning */
 #define KBD_CMD_RESET_ENABLE   	0xF6    /* reset and enable scanning */
 #define KBD_CMD_RESET		0xFF	/* Reset */
+#define KBD_CMD_SET_MAKE_BREAK  0xFC    /* Set Make and Break mode */
+#define KBD_CMD_SET_TYPEMATIC   0xFA    /* Set Typematic Make and Break mode */
 
 /* Keyboard Replies */
 #define KBD_REPLY_POR		0xAA	/* Power on reset */
@@ -592,6 +594,10 @@ void ps2_write_keyboard(void *opaque, int val)
                 KBD_REPLY_ACK,
                 KBD_REPLY_POR);
             break;
+        case KBD_CMD_SET_TYPEMATIC:
+        case KBD_CMD_SET_MAKE_BREAK:
+            ps2_queue(&s->common, KBD_REPLY_ACK);
+            break;
         default:
             ps2_queue(&s->common, KBD_REPLY_RESEND);
             break;
-- 
2.23.0


