Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0C839007E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 14:01:15 +0200 (CEST)
Received: from localhost ([::1]:60798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llVkI-0000B5-TS
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 08:01:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1llVdd-0001wD-AL; Tue, 25 May 2021 07:54:21 -0400
Received: from [201.28.113.2] (port=5820 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1llVdb-0004P8-RR; Tue, 25 May 2021 07:54:21 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 25 May 2021 08:54:01 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id E25BD80144E;
 Tue, 25 May 2021 08:54:00 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 4/4] target/ppc: updated meson.build to support disable-tcg
Date: Tue, 25 May 2021 08:53:55 -0300
Message-Id: <20210525115355.8254-5-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210525115355.8254-1-bruno.larsen@eldorado.org.br>
References: <20210525115355.8254-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 25 May 2021 11:54:01.0078 (UTC)
 FILETIME=[A6F73960:01D7515C]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 luis.pires@eldorado.org.br, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

updated build file to not compile some sources that are unnecessary if
TCG is disabled on the system.

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/meson.build | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index 848e625302..a6a53a8d5c 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -3,11 +3,14 @@ ppc_ss.add(files(
   'cpu-models.c',
   'cpu.c',
   'cpu_init.c',
-  'dfp_helper.c',
   'excp_helper.c',
-  'fpu_helper.c',
   'gdbstub.c',
   'helper_regs.c',
+))
+
+ppc_ss.add(when: 'CONFIG_TCG', if_true: files(
+  'dfp_helper.c',
+  'fpu_helper.c',
   'int_helper.c',
   'mem_helper.c',
   'misc_helper.c',
-- 
2.17.1


