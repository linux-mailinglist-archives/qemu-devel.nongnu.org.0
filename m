Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B81D43D4
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 17:09:51 +0200 (CEST)
Received: from localhost ([::1]:51930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIwYA-0001Py-K5
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 11:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54492)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <xiaoyao.li@intel.com>) id 1iIwXM-0000ru-7d
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 11:09:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <xiaoyao.li@intel.com>) id 1iIwXK-0007IQ-JU
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 11:08:59 -0400
Received: from mga01.intel.com ([192.55.52.88]:12941)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <xiaoyao.li@intel.com>)
 id 1iIwXK-0007HE-B5
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 11:08:58 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Oct 2019 08:08:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,284,1566889200"; d="scan'208";a="278147691"
Received: from lxy-clx-4s.sh.intel.com ([10.239.43.57])
 by orsmga001.jf.intel.com with ESMTP; 11 Oct 2019 08:08:51 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2] target/i386: Add Snowridge-v2 (noMPX) CPU model
Date: Fri, 11 Oct 2019 22:53:49 +0800
Message-Id: <20191011145349.123425-1-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.88
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
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add new version of Snowridge CPU model that removes MPX feature.

MPX support is being phased out by Intel. GCC has dropped it, Linux kernel
and kvm are also going to do that in the future.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
Changes in v2:
    - Use CPU model versioning mechanism instead of machine-type compat
---
 target/i386/cpu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 44f1bbdcac76..27b0a17b46a8 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -2793,6 +2793,19 @@ static X86CPUDefinition builtin_x86_defs[] = {
             CPUID_6_EAX_ARAT,
         .xlevel = 0x80000008,
         .model_id = "Intel Atom Processor (SnowRidge)",
+        .versions = (X86CPUVersionDefinition[]) {
+            { .version = 1 },
+            {
+                .version = 2,
+                .alias = "Snowridge-noMPX",
+                .props = (PropValue[]) {
+                    { "mpx", "off" },
+                    { "model-id", "Intel Atom Processor (Snowridge, no MPX)" },
+                    { /* end of list */ },
+                },
+            },
+            { /* end of list */ },
+        },
     },
     {
         .name = "KnightsMill",
-- 
2.19.1


