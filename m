Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D4F3687BF
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 22:13:31 +0200 (CEST)
Received: from localhost ([::1]:47342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZfha-0007uG-8K
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 16:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1lZfL6-00067W-LY; Thu, 22 Apr 2021 15:50:18 -0400
Received: from [201.28.113.2] (port=23502 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1lZfL0-0002SN-3e; Thu, 22 Apr 2021 15:50:14 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 22 Apr 2021 16:31:39 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id EC2C8800BEE;
 Thu, 22 Apr 2021 16:31:38 -0300 (-03)
From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH 3/4] hw/ppc: updated build rules to use new file
Date: Thu, 22 Apr 2021 16:31:30 -0300
Message-Id: <20210422193131.22560-4-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210422193131.22560-1-lucas.araujo@eldorado.org.br>
References: <20210422193131.22560-1-lucas.araujo@eldorado.org.br>
X-OriginalArrivalTime: 22 Apr 2021 19:31:39.0102 (UTC)
 FILETIME=[1D976FE0:01D737AE]
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

Updated meson.build to compile spapr_hcall_tcg_stub.c instead of
spapr_hcall.c when disable-tcg option is used

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 hw/ppc/meson.build | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
index 218631c883..8b9b537c37 100644
--- a/hw/ppc/meson.build
+++ b/hw/ppc/meson.build
@@ -14,7 +14,6 @@ ppc_ss.add(when: 'CONFIG_PSERIES', if_true: files(
   'spapr_caps.c',
   'spapr_vio.c',
   'spapr_events.c',
-  'spapr_hcall.c',
   'spapr_iommu.c',
   'spapr_rtas.c',
   'spapr_pci.c',
@@ -29,6 +28,15 @@ ppc_ss.add(when: 'CONFIG_PSERIES', if_true: files(
   'spapr_numa.c',
   'pef.c',
 ))
+tcg_ss = ss.source_set()
+tcg_ss.add(when: 'CONFIG_TCG', if_true: files(
+  'spapr_hcall.c',
+), if_false: files(
+  'spapr_hcall_tcg_stub.c',
+))
+
+ppc_ss.add_all(when: 'CONFIG_PSERIES', if_true: tcg_ss)
+
 ppc_ss.add(when: 'CONFIG_SPAPR_RNG', if_true: files('spapr_rng.c'))
 ppc_ss.add(when: ['CONFIG_PSERIES', 'CONFIG_LINUX'], if_true: files(
   'spapr_pci_vfio.c',
-- 
2.17.1


