Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53588320B68
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 16:31:58 +0100 (CET)
Received: from localhost ([::1]:33690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDqiB-0001tB-2d
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 10:31:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cwshu@andestech.com>)
 id 1lDpJv-0005nb-30; Sun, 21 Feb 2021 09:02:47 -0500
Received: from atcsqr.andestech.com ([60.248.187.195]:10499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cwshu@andestech.com>)
 id 1lDpJr-0005Az-5e; Sun, 21 Feb 2021 09:02:46 -0500
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 11LDuwh4062723;
 Sun, 21 Feb 2021 21:56:58 +0800 (GMT-8)
 (envelope-from cwshu@andestech.com)
Received: from ubuntu1604.andestech.com (10.0.12.177) by
 ATCPCS16.andestech.com (10.0.1.222) with Microsoft SMTP Server id 14.3.487.0; 
 Sun, 21 Feb 2021 22:02:27 +0800
From: Jim Shu <cwshu@andestech.com>
To: <qemu-riscv@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 3/3] target/riscv: flush TLB pages if PMP permission has been
 changed
Date: Sun, 21 Feb 2021 22:01:22 +0800
Message-ID: <1613916082-19528-4-git-send-email-cwshu@andestech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613916082-19528-1-git-send-email-cwshu@andestech.com>
References: <1613916082-19528-1-git-send-email-cwshu@andestech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.0.12.177]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 11LDuwh4062723
Received-SPF: pass client-ip=60.248.187.195; envelope-from=cwshu@andestech.com;
 helo=ATCSQR.andestech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 21 Feb 2021 10:29:58 -0500
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Jim Shu <cwshu@andestech.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If PMP permission of any address has been changed by updating PMP entry,
flush all TLB pages to prevent from getting old permission.

Signed-off-by: Jim Shu <cwshu@andestech.com>
---
 target/riscv/pmp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index ebd874cde3..cff020122a 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -28,6 +28,7 @@
 #include "qapi/error.h"
 #include "cpu.h"
 #include "trace.h"
+#include "exec/exec-all.h"
 
 static void pmp_write_cfg(CPURISCVState *env, uint32_t addr_index,
     uint8_t val);
@@ -347,6 +348,9 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
         cfg_val = (val >> 8 * i)  & 0xff;
         pmp_write_cfg(env, (reg_index * 4) + i, cfg_val);
     }
+
+    /* If PMP permission of any addr has been changed, flush TLB pages. */
+    tlb_flush(env_cpu(env));
 }
 
 
-- 
2.30.1


