Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE6A226AE
	for <lists+qemu-devel@lfdr.de>; Sun, 19 May 2019 12:58:57 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46907 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSJWq-0006tY-MT
	for lists+qemu-devel@lfdr.de; Sun, 19 May 2019 06:58:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56581)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hSJRo-0003EQ-5i
	for qemu-devel@nongnu.org; Sun, 19 May 2019 06:53:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hSJRl-0001oD-Uk
	for qemu-devel@nongnu.org; Sun, 19 May 2019 06:53:44 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:42712 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1hSJRl-00015m-N3
	for qemu-devel@nongnu.org; Sun, 19 May 2019 06:53:41 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 813191A0F04;
	Sun, 19 May 2019 12:52:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
	[10.10.13.43])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 65A591A1FBA;
	Sun, 19 May 2019 12:52:33 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Sun, 19 May 2019 12:52:15 +0200
Message-Id: <1558263144-8776-2-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558263144-8776-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1558263144-8776-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PULL 01/10] target/mips: Make the results of
 DIV_<U|S>.<B|H|W|D> the same as on hardware
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mateja Marjanovic <Mateja.Marjanovic@rt-rk.com>

MSA instructions DIV_<U|S>.<B|H|W|D> when dividing by zero,
didn't return the same value when executed on a referent hardware
(FPGA MIPS 64 r6, little endian) and when executed on QEMU, which
is not a real bug, because the result when dividing by zero is
UNPREDICTABLE [1] (page 141, 142).

[1] MIPS Architecture for Programmers
    Volume IV-j: The MIPS64 SIMD
    Architecture Module, Revision 1.12

Signed-off-by: Mateja Marjanovic <mateja.marjanovic@rt-rk.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Message-Id: <1554207110-9113-2-git-send-email-mateja.marjanovic@rt-rk.com>
---
 target/mips/msa_helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/mips/msa_helper.c b/target/mips/msa_helper.c
index c74e3cd..596190b 100644
--- a/target/mips/msa_helper.c
+++ b/target/mips/msa_helper.c
@@ -641,14 +641,15 @@ static inline int64_t msa_div_s_df(uint32_t df, int64_t arg1, int64_t arg2)
     if (arg1 == DF_MIN_INT(df) && arg2 == -1) {
         return DF_MIN_INT(df);
     }
-    return arg2 ? arg1 / arg2 : 0;
+    return arg2 ? arg1 / arg2
+                : arg1 >= 0 ? -1 : 1;
 }
 
 static inline int64_t msa_div_u_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     uint64_t u_arg1 = UNSIGNED(arg1, df);
     uint64_t u_arg2 = UNSIGNED(arg2, df);
-    return u_arg2 ? u_arg1 / u_arg2 : 0;
+    return arg2 ? u_arg1 / u_arg2 : -1;
 }
 
 static inline int64_t msa_mod_s_df(uint32_t df, int64_t arg1, int64_t arg2)
-- 
2.7.4


