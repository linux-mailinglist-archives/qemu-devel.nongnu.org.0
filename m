Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95541CEFE2
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Oct 2019 02:22:02 +0200 (CEST)
Received: from localhost ([::1]:50322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHdGL-00013y-Ji
	for lists+qemu-devel@lfdr.de; Mon, 07 Oct 2019 20:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37188)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
 id 1iHd96-0002Yq-Kr
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 20:14:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
 id 1iHd94-0005NQ-L2
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 20:14:32 -0400
Received: from rs224.mailgun.us ([209.61.151.224]:21472)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71)
 (envelope-from <bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
 id 1iHd94-0005Gw-4n
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 20:14:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
 s=pic; 
 t=1570493670; h=Content-Transfer-Encoding: MIME-Version: References:
 In-Reply-To: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=0AYrTLQGGVMjJAwteX2M1fMUA+ZMU7mBXK8haObkZGg=;
 b=zQL2uxkIZj4Do4cfKzu5FyTAK1PIDVYRZuZ/MDR4m1nkX5P8EB9T4e/LVaPxsYI5PwMXiL+o
 M2BnU8wr+HjSoZsEx9CGwfq6Zuo7Ncyrp9ZgL0CtaJxvlKK005wBkhKkz0IvP/iJDGxX9Jkc
 5EfNIx03AC8578FjBDiEA5PLg5/+mYszPG6g0MLGHJyGHOEQgrUlHV/l5cv5MiLkIMxJ8xEY
 BZwxl7/1mNcX++BCIvYAygLLAdEkSkGDneb2hTejpp2EXR741sdEVawJnYXphcu1WcCfW8nu
 AQrXsNfxJ57W98p2z3IaM3g0BdBAKTV3jr96UimF4DPBPM42P0l91Q==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJlMGM5NSIsICJxZW11LWRldmVsQG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Received: from jonathan-ThinkPad-X1-Carbon.pdos.lcs.mit.edu
 (26-5-211.dynamic.csail.mit.edu [18.26.5.211])
 by mxa.mailgun.org with ESMTP id 5d9bd4e5.7f51c380ba28-smtp-out-n01;
 Tue, 08 Oct 2019 00:14:29 -0000 (UTC)
From: Jonathan Behrens <jonathan@fintelia.io>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v3 3/3] target/riscv: Make the priv register writable by GDB
Date: Mon,  7 Oct 2019 20:13:18 -0400
Message-Id: <20191008001318.219367-4-jonathan@fintelia.io>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191008001318.219367-1-jonathan@fintelia.io>
References: <20191008001318.219367-1-jonathan@fintelia.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.61.151.224
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
Cc: Jonathan Behrens <jonathan@fintelia.io>, Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently only PRV_U, PRV_S and PRV_M are supported, so this patch ensures that
the privilege mode is set to one of them. Once support for the H-extension is
added, this code will also need to properly update the virtualization status
when switching between VU/VS-modes and M-mode.

Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
---
 target/riscv/gdbstub.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 33cf7c4c7d..bc84b599c2 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -387,6 +387,15 @@ static int riscv_gdb_get_virtual(CPURISCVState *cs, uint8_t *mem_buf, int n)
 
 static int riscv_gdb_set_virtual(CPURISCVState *cs, uint8_t *mem_buf, int n)
 {
+    if (n == 0) {
+#ifndef CONFIG_USER_ONLY
+        cs->priv = ldtul_p(mem_buf) & 0x3;
+        if (cs->priv == PRV_H) {
+            cs->priv = PRV_S;
+        }
+#endif
+        return sizeof(target_ulong);
+    }
     return 0;
 }
 
-- 
2.23.0

