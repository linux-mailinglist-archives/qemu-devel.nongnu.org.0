Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B20AF14C190
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 21:22:15 +0100 (CET)
Received: from localhost ([::1]:37290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwXNG-0001XQ-Pa
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 15:22:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38355)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iwXKf-0005Ml-4B
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 15:19:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iwXKd-0001AB-3C
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 15:19:33 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:41531 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iwXKc-0006gc-So
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 15:19:31 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 7ED921A1FEE;
 Tue, 28 Jan 2020 21:09:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 6902E1A1E9A;
 Tue, 28 Jan 2020 21:09:48 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/6] disas: Add a field for target-dependant data
Date: Tue, 28 Jan 2020 21:09:17 +0100
Message-Id: <1580242161-20333-3-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580242161-20333-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1580242161-20333-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
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
Cc: peter.maydell@linaro.org, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

This patch adds a field "target_info" to the structure
disassemble_info. The purpose of this field is to enable targets
to pass to disassembler code any additional data thet deem suitable.

Reviewed-by: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Message-Id: <1579883929-1517-6-git-send-email-aleksandar.markovic@rt-rk.com>
---
 include/disas/dis-asm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
index e9c7dd8..f87f468 100644
--- a/include/disas/dis-asm.h
+++ b/include/disas/dis-asm.h
@@ -372,6 +372,9 @@ typedef struct disassemble_info {
   /* Command line options specific to the target disassembler.  */
   char * disassembler_options;
 
+  /* Field intended to be used by targets in any way they deem suitable.  */
+  int64_t target_info;
+
   /* Options for Capstone disassembly.  */
   int cap_arch;
   int cap_mode;
-- 
2.7.4


