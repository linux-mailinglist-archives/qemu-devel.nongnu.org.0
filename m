Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EE63687AC
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 22:06:45 +0200 (CEST)
Received: from localhost ([::1]:35574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZfb2-0002pD-VI
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 16:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1lZfJo-0004V2-1Y; Thu, 22 Apr 2021 15:48:56 -0400
Received: from [201.28.113.2] (port=24689 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1lZfJl-0001sp-FD; Thu, 22 Apr 2021 15:48:55 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 22 Apr 2021 16:31:37 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id C557F800BEE;
 Thu, 22 Apr 2021 16:31:37 -0300 (-03)
From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH 1/4] target/ppc: updated build options
Date: Thu, 22 Apr 2021 16:31:28 -0300
Message-Id: <20210422193131.22560-2-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210422193131.22560-1-lucas.araujo@eldorado.org.br>
References: <20210422193131.22560-1-lucas.araujo@eldorado.org.br>
X-OriginalArrivalTime: 22 Apr 2021 19:31:37.0961 (UTC)
 FILETIME=[1CE95590:01D737AE]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: bruno.larsen@eldorado.org.br, lucas.araujo@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

updated meson.build to not compile tcg-only files

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 target/ppc/meson.build | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index bbfef90e08..b369a6bcd0 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -2,10 +2,17 @@ ppc_ss = ss.source_set()
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
@@ -13,21 +20,22 @@ ppc_ss.add(files(
   'translate.c',
 ))
 
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


