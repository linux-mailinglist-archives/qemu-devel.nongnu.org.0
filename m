Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 536BFD667B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 17:50:09 +0200 (CEST)
Received: from localhost ([::1]:51830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iK2bn-00071g-PW
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 11:50:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33748)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
 id 1iK2YX-0005DS-HO
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 11:46:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
 id 1iK2YV-00080b-3P
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 11:46:45 -0400
Received: from rs224.mailgun.us ([209.61.151.224]:22930)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71)
 (envelope-from <bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
 id 1iK2YP-0007ma-Di
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 11:46:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
 s=pic; 
 t=1571067998; h=Content-Transfer-Encoding: MIME-Version: References:
 In-Reply-To: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=us11dJP4tYiWCt+M3OJ3tptc3yO5a5+8OevvcFXza3A=;
 b=XGRwGyV3YhA8N1XDkNkIG5iwcjbuHMtD2FP1CeGFEDauoAKinVupJ52dt1ZasSsHvmB+EzNw
 AxWDK1XxEEsF/5+gD4h+ZMsF+fkQ+tWLNm4mm7fsLSPOT542sfzAT+acBThTrNtJsvxlt6B4
 aClgMOuDMTP/wgNUNJmccFuHCvyH8viTwaPZ4i848Xv3n9zuhjfJko/dsyfjybDS03J2yPAP
 xaRdFFkIqQwd+EkR/v5iAQtTlJ36MomTvUMHc2vwQ9HD4tYBmumeWXky/T3OWmYFiPX5KqrD
 B4cenLfMXd5mXeFQ4hJWvWFzJFCweJArg0Zn8/0MXpuuQiQ3a3jQhw==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJlMGM5NSIsICJxZW11LWRldmVsQG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Received: from jonathan-ThinkPad-X1-Carbon.pdos.lcs.mit.edu
 (26-5-211.dynamic.csail.mit.edu [18.26.5.211])
 by mxa.mailgun.org with ESMTP id 5da49856.7f705dace450-smtp-out-n01;
 Mon, 14 Oct 2019 15:46:30 -0000 (UTC)
From: Jonathan Behrens <jonathan@fintelia.io>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v4 3/3] target/riscv: Make the priv register writable by GDB
Date: Mon, 14 Oct 2019 11:45:29 -0400
Message-Id: <20191014154529.287048-4-jonathan@fintelia.io>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014154529.287048-1-jonathan@fintelia.io>
References: <20191014154529.287048-1-jonathan@fintelia.io>
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Jonathan Behrens <jonathan@fintelia.io>, Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently only PRV_U, PRV_S and PRV_M are supported, so this patch ensures that
the privilege mode is set to one of them. Once support for the H-extension is
added, this code will also need to properly update the virtualization status
when switching between VU/VS-modes and M-mode.

Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---
 target/riscv/gdbstub.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 1f71604b78..1a7947e019 100644
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

