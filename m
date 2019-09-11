Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 847ECAFDA6
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 15:22:42 +0200 (CEST)
Received: from localhost ([::1]:50990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i82a1-00083b-It
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 09:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58705)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i82YA-0006ij-Q9
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 09:20:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i82Y7-0006iA-Qp
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 09:20:45 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:35393 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1i82Y7-00062C-Ki
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 09:20:43 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 8FAFB1A1E97;
 Wed, 11 Sep 2019 15:19:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 77BA01A1E2D;
 Wed, 11 Sep 2019 15:19:38 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Wed, 11 Sep 2019 15:19:26 +0200
Message-Id: <1568207966-25202-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH] target/mips: gdbstub: Revert commit 8e0b373
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
Cc: arikalo@wavecomp.com, Libo Zhou <zhlb29@foxmail.com>,
 amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Libo Zhou <zhlb29@foxmail.com>

Multiple report from users were received regarding failures
of "packet g" comminucation with gdb. Revert this commit until
a better solution is developed.

Suggested-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Signed-off-by: Libo Zhou <zhlb29@foxmail.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/gdbstub.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/mips/gdbstub.c b/target/mips/gdbstub.c
index ebcc98b..bbb2544 100644
--- a/target/mips/gdbstub.c
+++ b/target/mips/gdbstub.c
@@ -38,7 +38,7 @@ int mips_cpu_gdb_read_register(CPUState *cs, uint8_t *mem_buf, int n)
             return gdb_get_regl(mem_buf, (int32_t)env->active_fpu.fcr0);
         default:
             if (env->CP0_Status & (1 << CP0St_FR)) {
-                return gdb_get_reg64(mem_buf,
+                return gdb_get_regl(mem_buf,
                     env->active_fpu.fpr[n - 38].d);
             } else {
                 return gdb_get_regl(mem_buf,
@@ -99,7 +99,6 @@ int mips_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
             break;
         default:
             if (env->CP0_Status & (1 << CP0St_FR)) {
-                uint64_t tmp = ldq_p(mem_buf);
                 env->active_fpu.fpr[n - 38].d = tmp;
             } else {
                 env->active_fpu.fpr[n - 38].w[FP_ENDIAN_IDX] = tmp;
-- 
2.7.4


