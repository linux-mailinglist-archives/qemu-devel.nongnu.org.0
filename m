Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB2199264
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 13:43:34 +0200 (CEST)
Received: from localhost ([::1]:41318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0lV7-00038R-6J
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 07:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59836)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i0lP7-0004i5-29
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 07:37:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i0lOv-0007l7-8n
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 07:37:13 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:48181 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1i0lOt-0007hj-9h
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 07:37:07 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id A43F11A2068;
 Thu, 22 Aug 2019 13:35:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 772491A205C;
 Thu, 22 Aug 2019 13:35:58 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Aug 2019 13:35:34 +0200
Message-Id: <1566473750-17743-11-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566473750-17743-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1566473750-17743-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH 10/26] target/mips: Clean up handling of CP0
 register 11
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
Cc: aurelien@aurel32.net, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Clean up handling of CP0 register 11.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/translate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index b376103..87257d7 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -7213,7 +7213,7 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_11:
         switch (sel) {
-        case 0:
+        case CP0_REG11__COMPARE:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_Compare));
             register_name = "Compare";
             break;
@@ -7933,7 +7933,7 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_11:
         switch (sel) {
-        case 0:
+        case CP0_REG11__COMPARE:
             gen_helper_mtc0_compare(cpu_env, arg);
             register_name = "Compare";
             break;
@@ -8700,7 +8700,7 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_11:
         switch (sel) {
-        case 0:
+        case CP0_REG11__COMPARE:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_Compare));
             register_name = "Compare";
             break;
@@ -9406,7 +9406,7 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_11:
         switch (sel) {
-        case 0:
+        case CP0_REG11__COMPARE:
             gen_helper_mtc0_compare(cpu_env, arg);
             register_name = "Compare";
             break;
-- 
2.7.4


