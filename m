Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C59488536
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 19:08:37 +0100 (CET)
Received: from localhost ([::1]:51334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6G8q-00034Z-Sx
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 13:08:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n6G5W-0008PG-U2
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 13:05:10 -0500
Received: from [2001:41c9:1:41f::167] (port=40378
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n6G5S-0002Ap-CD
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 13:05:07 -0500
Received: from [2a00:23c4:8ba0:4900:614:7796:ec2b:4f88] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n6G51-000A0p-K4; Sat, 08 Jan 2022 18:04:43 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Sat,  8 Jan 2022 18:04:53 +0000
Message-Id: <20220108180453.18680-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:4900:614:7796:ec2b:4f88
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH] target/m68k: don't word align SP in stack frame if
 M68K_FEATURE_UNALIGNED_DATA feature enabled
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit a9431a03f7 ("target/m68k: add M68K_FEATURE_UNALIGNED_DATA feature") added
a new feature for processors from the 68020 onwards which do not require data
accesses to be word aligned.

Unfortunately the original commit missed an additional case whereby the SP is
still word aligned when setting up an additional format 1 stack frame so add the
necessary M68K_FEATURE_UNALIGNED_DATA feature guard.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Fixes: a9431a03f7 ("target/m68k: add M68K_FEATURE_UNALIGNED_DATA feature")
---
 target/m68k/op_helper.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index ab6b559fd3..59d8d5a09e 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -429,7 +429,10 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
         oldsr = sr;
         env->aregs[7] = sp;
         cpu_m68k_set_sr(env, sr &= ~SR_M);
-        sp = env->aregs[7] & ~1;
+        sp = env->aregs[7];
+        if (!m68k_feature(env, M68K_FEATURE_UNALIGNED_DATA)) {
+            sp &= ~1;
+        }
         do_stack_frame(env, &sp, 1, oldsr, 0, retaddr);
     } else {
         do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
-- 
2.20.1


