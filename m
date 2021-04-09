Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4136C35A22C
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 17:41:36 +0200 (CEST)
Received: from localhost ([::1]:46532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUtGJ-0003sD-8K
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 11:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lUtCg-0002Xa-M1; Fri, 09 Apr 2021 11:37:50 -0400
Received: from [201.28.113.2] (port=41884 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lUtCf-0002YS-Bx; Fri, 09 Apr 2021 11:37:50 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 9 Apr 2021 12:19:21 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 94227800172;
 Fri,  9 Apr 2021 12:19:21 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] target/ppc: updated build rules for disable-tcg option
Date: Fri,  9 Apr 2021 12:19:16 -0300
Message-Id: <20210409151916.97326-5-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210409151916.97326-1-bruno.larsen@eldorado.org.br>
References: <20210409151916.97326-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 09 Apr 2021 15:19:21.0767 (UTC)
 FILETIME=[B7AAAB70:01D72D53]
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
Cc: lucas.araujo@eldorado.org.br, lagarcia@br.ibm.com,
 luis.pires@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, andre.silva@eldorado.org.br,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

updated the meson file to respect the disable-tcg option and only add
relevant files to the build process

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/meson.build | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index bbfef90e08..23f9346a6e 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -2,32 +2,40 @@ ppc_ss = ss.source_set()
 ppc_ss.add(files(
   'cpu-models.c',
   'cpu.c',
+  'gdbstub.c',
+))
+
+ppc_ss.add(libdecnumber)
+
+ppc_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files('kvm-stub.c'))
+ppc_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('user_only_helper.c'))
+ppc_ss.add(when: 'CONFIG_TCG', if_true: files(
   'dfp_helper.c',
   'excp_helper.c',
   'fpu_helper.c',
-  'gdbstub.c',
   'int_helper.c',
   'mem_helper.c',
   'misc_helper.c',
   'timebase_helper.c',
   'translate.c',
-))
+), if_false: files('tcg-stub.c'))
 
-ppc_ss.add(libdecnumber)
-
-ppc_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files('kvm-stub.c'))
-ppc_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('user_only_helper.c'))
 
 ppc_softmmu_ss = ss.source_set()
 ppc_softmmu_ss.add(files(
   'arch_dump.c',
   'machine.c',
+  'monitor.c',
+))
+ppc_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
   'mmu-hash32.c',
   'mmu_helper.c',
-  'monitor.c',
 ))
+
 ppc_softmmu_ss.add(when: 'TARGET_PPC64', if_true: files(
   'compat.c',
+))
+ppc_softmmu_ss.add(when: ['TARGET_PPC64', 'CONFIG_TCG'], if_true: files(
   'mmu-book3s-v3.c',
   'mmu-hash64.c',
   'mmu-radix64.c',
-- 
2.17.1


