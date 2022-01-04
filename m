Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E347B4849AE
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 22:06:02 +0100 (CET)
Received: from localhost ([::1]:34228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4r0M-0008Lc-0U
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 16:06:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1n4qw2-0005dW-8P; Tue, 04 Jan 2022 16:01:34 -0500
Received: from [201.28.113.2] (port=18444 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1n4qw0-0000Ie-P7; Tue, 04 Jan 2022 16:01:33 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 4 Jan 2022 18:01:26 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 022F28006C0;
 Tue,  4 Jan 2022 18:01:25 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 1/2] linux-user/ppc: deliver SIGTRAP on POWERPC_EXCP_TRAP
Date: Tue,  4 Jan 2022 18:00:14 -0300
Message-Id: <20220104210015.457468-2-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220104210015.457468-1-matheus.ferst@eldorado.org.br>
References: <20220104210015.457468-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 Jan 2022 21:01:26.0436 (UTC)
 FILETIME=[3CDB1E40:01D801AE]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, laurent@vivier.eu,
 groug@kaod.org, clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Handle POWERPC_EXCP_TRAP in cpu_loop to deliver SIGTRAP on tw[i]/td[i].
The si_code comes from do_program_check in the kernel source file
arch/powerpc/kernel/traps.c

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 linux-user/ppc/cpu_loop.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
index 46e6ffd6d3..6c99feb19b 100644
--- a/linux-user/ppc/cpu_loop.c
+++ b/linux-user/ppc/cpu_loop.c
@@ -188,7 +188,8 @@ void cpu_loop(CPUPPCState *env)
                 }
                 break;
             case POWERPC_EXCP_TRAP:
-                cpu_abort(cs, "Tried to call a TRAP\n");
+                si_signo = TARGET_SIGTRAP;
+                si_code = TARGET_TRAP_BRKPT;
                 break;
             default:
                 /* Should not happen ! */
-- 
2.25.1


