Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5725A5B7
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jun 2019 22:12:54 +0200 (CEST)
Received: from localhost ([::1]:36122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgxEr-0006MV-3L
	for lists+qemu-devel@lfdr.de; Fri, 28 Jun 2019 16:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41322)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
 id 1hgxE3-0005ty-BZ
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 16:12:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
 id 1hgxE1-00011s-2L
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 16:12:03 -0400
Received: from rs224.mailgun.us ([209.61.151.224]:36877)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71)
 (envelope-from <bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
 id 1hgxE0-00010a-HZ
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 16:12:01 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
 s=pic; 
 t=1561752718; h=Content-Transfer-Encoding: MIME-Version: Message-Id:
 Date: Subject: Cc: To: From: Sender;
 bh=rK9dVQoGRf7gzhJQ62FeEPYEuGqaPsFuSSy+cUnHJAI=;
 b=gZ2Und5WnREAXSydkjIhE0XtIerlfqdGvpmZ+GcbgtEmuUBeIQC9FKhdkDab6kI9cHmXo/EE
 ZZVYMP0AX4WvG2QoExoSXNtgjOceK2r+bCDi2Rmvo03/paShH1bIRazvT6sZKxWXEbIONZWM
 kbtRwkteoyjcxboMvCicnUIFyVP3bfB3/Bl8xSbi4YzeEu/ttsVvO72paeWAZ8TDfUCsbrGX
 hImX0TlZMSQ/mVTD6j6TohPULkmsjDkNtRhbLXZkTV+M7WYx19Sttx71jcGx+8Hju4dIlX+J
 Ro0BOZXlxYcY+tTSlvavs4vaZSNlIKzBIS0jzYcNMjH00GQvROrAkQ==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJlMGM5NSIsICJxZW11LWRldmVsQG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Received: from jonathan-ThinkPad-X1-Carbon.csail.mit.edu
 (30-9-3.wireless.csail.mit.edu [128.30.9.3])
 by mxa.mailgun.org with ESMTP id 5d16748d.7f301001b800-smtp-out-n02;
 Fri, 28 Jun 2019 20:11:57 -0000 (UTC)
From: jonathan@fintelia.io
To: qemu-riscv@nongnu.org
Date: Fri, 28 Jun 2019 16:11:33 -0400
Message-Id: <20190628201133.14235-1-jonathan@fintelia.io>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.61.151.224
Subject: [Qemu-devel] [PATCH] target/riscv: Hardwire mcounter.TM and upper
 bits of [m|s]counteren
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Jonathan Behrens <jonathan@fintelia.io>, Palmer Dabbelt <palmer@sifive.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jonathan Behrens <jonathan@fintelia.io>

QEMU currently always triggers an illegal instruction exception when code
attempts to read the time CSR. This is valid behavor, but only if the TM bit in
mcounteren is hardwired to zero. This change also corrects mcounteren and scounteren CSRs to be 32-bits on both
32-bit and 64-bit targets.

Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
---
 target/riscv/cpu.h | 4 ++--
 target/riscv/csr.c | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0adb307f32..2d0cbe9c78 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -151,8 +151,8 @@ struct CPURISCVState {
     target_ulong mcause;
     target_ulong mtval;  /* since: priv-1.10.0 */
 
-    target_ulong scounteren;
-    target_ulong mcounteren;
+    uint32_t scounteren;
+    uint32_t mcounteren;
 
     target_ulong sscratch;
     target_ulong mscratch;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e0d4586760..89cf9734c3 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -473,7 +473,8 @@ static int write_mcounteren(CPURISCVState *env, int csrno, target_ulong val)
     if (env->priv_ver < PRIV_VERSION_1_10_0) {
         return -1;
     }
-    env->mcounteren = val;
+    /* mcounteren.TM is hardwired to zero, all other bits are writable */
+    env->mcounteren = val & ~(1 << (CSR_TIME & 31));
     return 0;
 }
 
-- 
2.22.0

