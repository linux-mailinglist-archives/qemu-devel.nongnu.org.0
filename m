Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 586B61A2436
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Apr 2020 16:42:47 +0200 (CEST)
Received: from localhost ([::1]:36892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jMBuf-00033u-Rq
	for lists+qemu-devel@lfdr.de; Wed, 08 Apr 2020 10:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60819)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fredrik@strupe.net>) id 1jM9O4-0004dI-9I
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 08:00:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fredrik@strupe.net>) id 1jM9Nz-0001i1-Fi
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 08:00:56 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:51155)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <fredrik@strupe.net>)
 id 1jM9Nx-0001et-4p; Wed, 08 Apr 2020 08:00:49 -0400
Received: from consensus.lan (cm-84.210.220.251.getinternet.no
 [84.210.220.251]) (Authenticated sender: fredrik@strupe.net)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 8299F20000E;
 Wed,  8 Apr 2020 12:00:47 +0000 (UTC)
From: Fredrik Strupe <fredrik@strupe.net>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH 2/2] target/arm: Fail on invalid size for VMUL (float)
Date: Wed,  8 Apr 2020 13:59:55 +0200
Message-Id: <20200408115953.1158-2-fredrik@strupe.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408115953.1158-1-fredrik@strupe.net>
References: <20200408115953.1158-1-fredrik@strupe.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 217.70.178.232
X-Mailman-Approved-At: Wed, 08 Apr 2020 10:41:29 -0400
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
Cc: Fredrik Strupe <fredrik@strupe.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bit 1 of VMUL (float)'s size field encodes the opcode and must be 0,
with 1 making it undefined. Thus, make VMUL (float) instructions
with size=0b10 or size=0b11 (size >= 2) undefined.

(U is 1 for VMUL, while it is 0 for VMLA/VMLS.)

Signed-off-by: Fredrik Strupe <fredrik@strupe.net>
---
 target/arm/translate.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index dfe9dbbcfd..4268eed9b7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5237,6 +5237,11 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         }
         case NEON_3R_FLOAT_MULTIPLY:
         {
+            /* Size bit 1 of VMUL (float) encodes the op and must be 0 */
+            if (u && size >= 2)  {
+                return 1;
+            }
+
             TCGv_ptr fpstatus = get_fpstatus_ptr(1);
             gen_helper_vfp_muls(tmp, tmp, tmp2, fpstatus);
             if (!u) {
-- 
2.20.1


