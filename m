Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F5756648
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jun 2019 12:09:45 +0200 (CEST)
Received: from localhost ([::1]:38478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hg4s2-0007ez-TD
	for lists+qemu-devel@lfdr.de; Wed, 26 Jun 2019 06:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44806)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hg4pp-00063w-GM
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 06:07:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hg4pn-0003P3-Vw
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 06:07:25 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:39496 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hg4pn-0003NS-Hr
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 06:07:23 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id EDCC61A21E9;
 Wed, 26 Jun 2019 12:07:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id BC78A1A2033;
 Wed, 26 Jun 2019 12:07:20 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Wed, 26 Jun 2019 12:07:09 +0200
Message-Id: <1561543629-20327-9-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561543629-20327-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1561543629-20327-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v6 8/8] target/mips: Fix big endian host
 behavior for interleave MSA instructions
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
Cc: arikalo@wavecomp.com, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Fix big endian host behavior for interleave MSA instructions. Previous
fix used TARGET_WORDS_BIGENDIAN instead of HOST_WORDS_BIGENDIAN, which
was a mistake.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/msa_helper.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/mips/msa_helper.c b/target/mips/msa_helper.c
index 7a9bfb3..8bad636 100644
--- a/target/mips/msa_helper.c
+++ b/target/mips/msa_helper.c
@@ -1737,7 +1737,7 @@ void helper_msa_ilvev_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
 
     switch (df) {
     case DF_BYTE:
-#if defined(TARGET_WORDS_BIGENDIAN)
+#if defined(HOST_WORDS_BIGENDIAN)
         pwd->b[8]  = pws->b[9];
         pwd->b[9]  = pwt->b[9];
         pwd->b[10] = pws->b[11];
@@ -1774,7 +1774,7 @@ void helper_msa_ilvev_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
 #endif
         break;
     case DF_HALF:
-#if defined(TARGET_WORDS_BIGENDIAN)
+#if defined(HOST_WORDS_BIGENDIAN)
         pwd->h[4] = pws->h[5];
         pwd->h[5] = pwt->h[5];
         pwd->h[6] = pws->h[7];
@@ -1795,7 +1795,7 @@ void helper_msa_ilvev_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
 #endif
         break;
     case DF_WORD:
-#if defined(TARGET_WORDS_BIGENDIAN)
+#if defined(HOST_WORDS_BIGENDIAN)
         pwd->w[2] = pws->w[3];
         pwd->w[3] = pwt->w[3];
         pwd->w[0] = pws->w[1];
@@ -1825,7 +1825,7 @@ void helper_msa_ilvod_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
 
     switch (df) {
     case DF_BYTE:
-#if defined(TARGET_WORDS_BIGENDIAN)
+#if defined(HOST_WORDS_BIGENDIAN)
         pwd->b[7]  = pwt->b[6];
         pwd->b[6]  = pws->b[6];
         pwd->b[5]  = pwt->b[4];
@@ -1862,7 +1862,7 @@ void helper_msa_ilvod_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
 #endif
         break;
     case DF_HALF:
-#if defined(TARGET_WORDS_BIGENDIAN)
+#if defined(HOST_WORDS_BIGENDIAN)
         pwd->h[3] = pwt->h[2];
         pwd->h[2] = pws->h[2];
         pwd->h[1] = pwt->h[0];
@@ -1883,7 +1883,7 @@ void helper_msa_ilvod_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
 #endif
         break;
     case DF_WORD:
-#if defined(TARGET_WORDS_BIGENDIAN)
+#if defined(HOST_WORDS_BIGENDIAN)
         pwd->w[1] = pwt->w[0];
         pwd->w[0] = pws->w[0];
         pwd->w[3] = pwt->w[2];
@@ -1913,7 +1913,7 @@ void helper_msa_ilvl_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
 
     switch (df) {
     case DF_BYTE:
-#if defined(TARGET_WORDS_BIGENDIAN)
+#if defined(HOST_WORDS_BIGENDIAN)
         pwd->b[7]  = pwt->b[15];
         pwd->b[6]  = pws->b[15];
         pwd->b[5]  = pwt->b[14];
@@ -1950,7 +1950,7 @@ void helper_msa_ilvl_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
 #endif
         break;
     case DF_HALF:
-#if defined(TARGET_WORDS_BIGENDIAN)
+#if defined(HOST_WORDS_BIGENDIAN)
         pwd->h[3] = pwt->h[7];
         pwd->h[2] = pws->h[7];
         pwd->h[1] = pwt->h[6];
@@ -1971,7 +1971,7 @@ void helper_msa_ilvl_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
 #endif
         break;
     case DF_WORD:
-#if defined(TARGET_WORDS_BIGENDIAN)
+#if defined(HOST_WORDS_BIGENDIAN)
         pwd->w[1] = pwt->w[3];
         pwd->w[0] = pws->w[3];
         pwd->w[3] = pwt->w[2];
@@ -2001,7 +2001,7 @@ void helper_msa_ilvr_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
 
     switch (df) {
     case DF_BYTE:
-#if defined(TARGET_WORDS_BIGENDIAN)
+#if defined(HOST_WORDS_BIGENDIAN)
         pwd->b[8]  = pws->b[0];
         pwd->b[9]  = pwt->b[0];
         pwd->b[10] = pws->b[1];
@@ -2038,7 +2038,7 @@ void helper_msa_ilvr_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
 #endif
         break;
     case DF_HALF:
-#if defined(TARGET_WORDS_BIGENDIAN)
+#if defined(HOST_WORDS_BIGENDIAN)
         pwd->h[4] = pws->h[0];
         pwd->h[5] = pwt->h[0];
         pwd->h[6] = pws->h[1];
@@ -2059,7 +2059,7 @@ void helper_msa_ilvr_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
 #endif
         break;
     case DF_WORD:
-#if defined(TARGET_WORDS_BIGENDIAN)
+#if defined(HOST_WORDS_BIGENDIAN)
         pwd->w[2] = pws->w[0];
         pwd->w[3] = pwt->w[0];
         pwd->w[0] = pws->w[1];
-- 
2.7.4


