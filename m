Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DB842E45D
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 00:44:09 +0200 (CEST)
Received: from localhost ([::1]:42894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb9SK-0001m5-L1
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 18:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mb9JK-000232-0L; Thu, 14 Oct 2021 18:34:50 -0400
Received: from [201.28.113.2] (port=23608 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mb9JI-0005Cp-M9; Thu, 14 Oct 2021 18:34:49 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 14 Oct 2021 19:34:37 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 15252800BB0;
 Thu, 14 Oct 2021 19:34:37 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 2/4] target/ppc: Fix XER access in gdbstub
Date: Thu, 14 Oct 2021 19:32:32 -0300
Message-Id: <20211014223234.127012-3-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211014223234.127012-1-matheus.ferst@eldorado.org.br>
References: <20211014223234.127012-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 14 Oct 2021 22:34:37.0532 (UTC)
 FILETIME=[AB8929C0:01D7C14B]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: laurent@vivier.eu, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 richard.henderson@linaro.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

The value of XER is split in multiple fields of CPUPPCState, like
env->xer and env->so. To get/set the whole register from gdb, we should
use cpu_read_xer/cpu_write_xer.

Fixes: da91a00f191f ("target-ppc: Split out SO, OV, CA fields from XER")
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/gdbstub.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index 1808a150e4..105c2f7dd1 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -159,7 +159,7 @@ int ppc_cpu_gdb_read_register(CPUState *cs, GByteArray *buf, int n)
             gdb_get_regl(buf, env->ctr);
             break;
         case 69:
-            gdb_get_reg32(buf, env->xer);
+            gdb_get_reg32(buf, cpu_read_xer(env));
             break;
         case 70:
             gdb_get_reg32(buf, env->fpscr);
@@ -217,7 +217,7 @@ int ppc_cpu_gdb_read_register_apple(CPUState *cs, GByteArray *buf, int n)
             gdb_get_reg64(buf, env->ctr);
             break;
         case 69 + 32:
-            gdb_get_reg32(buf, env->xer);
+            gdb_get_reg32(buf, cpu_read_xer(env));
             break;
         case 70 + 32:
             gdb_get_reg64(buf, env->fpscr);
@@ -269,7 +269,7 @@ int ppc_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
             env->ctr = ldtul_p(mem_buf);
             break;
         case 69:
-            env->xer = ldl_p(mem_buf);
+            cpu_write_xer(env, ldl_p(mem_buf));
             break;
         case 70:
             /* fpscr */
@@ -319,7 +319,7 @@ int ppc_cpu_gdb_write_register_apple(CPUState *cs, uint8_t *mem_buf, int n)
             env->ctr = ldq_p(mem_buf);
             break;
         case 69 + 32:
-            env->xer = ldl_p(mem_buf);
+            cpu_write_xer(env, ldl_p(mem_buf));
             break;
         case 70 + 32:
             /* fpscr */
-- 
2.25.1


