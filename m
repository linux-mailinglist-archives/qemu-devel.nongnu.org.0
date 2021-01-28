Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F91306AE7
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 03:05:55 +0100 (CET)
Received: from localhost ([::1]:37666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4wh0-0001dI-45
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 21:05:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1l4wfh-00016j-VW
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 21:04:33 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:55432
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1l4wff-0007QQ-6K
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 21:04:33 -0500
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id 9557ADA0755;
 Thu, 28 Jan 2021 03:04:28 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 75668460C81; Thu, 28 Jan 2021 03:04:28 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2] tcg/tci: Implement INDEX_op_ld8s_i64
Date: Thu, 28 Jan 2021 03:04:25 +0100
Message-Id: <20210128020425.2055454-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

That TCG opcode is used by debian-buster (arm64) running ffmpeg:

    qemu-aarch64 /usr/bin/ffmpeg -i theora.mkv theora.webm

Reported-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

v2: Fixed as suggested by Richard Henderson <richard.henderson@linaro.org>

Thank you,
Stefan

 tcg/tci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index ddbb259e1d..63d79dac87 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -886,7 +886,10 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg8(regs, t0, *(uint8_t *)(t1 + t2));
             break;
         case INDEX_op_ld8s_i64:
-            TODO();
+            t0 = *tb_ptr++;
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_s32(&tb_ptr);
+            tci_write_reg(regs, t0, *(int8_t *)(t1 + t2));
             break;
         case INDEX_op_ld16u_i64:
             t0 = *tb_ptr++;
-- 
2.29.2


