Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C39306B42
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 03:52:30 +0100 (CET)
Received: from localhost ([::1]:58240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4xQ5-0004fl-Tu
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 21:52:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1l4xO6-0003oH-AA
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 21:50:26 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:55638
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1l4xO3-0004F2-Fs
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 21:50:26 -0500
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id E1E96DA0755;
 Thu, 28 Jan 2021 03:50:21 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id D9623460C81; Thu, 28 Jan 2021 03:50:21 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] tcg/tci: Implement INDEX_op_ld16s_i32
Date: Thu, 28 Jan 2021 03:50:21 +0100
Message-Id: <20210128025021.2057046-1-sw@weilnetz.de>
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
 tcg/tci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 63d79dac87..615423b06c 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -621,7 +621,10 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg16(regs, t0, *(uint16_t *)(t1 + t2));
             break;
         case INDEX_op_ld16s_i32:
-            TODO();
+            t0 = *tb_ptr++;
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_s32(&tb_ptr);
+            tci_write_reg(regs, t0, *(int16_t *)(t1 + t2));
             break;
         case INDEX_op_ld_i32:
             t0 = *tb_ptr++;
-- 
2.29.2


