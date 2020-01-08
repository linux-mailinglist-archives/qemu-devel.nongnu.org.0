Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2CC133B9A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 07:17:23 +0100 (CET)
Received: from localhost ([::1]:37918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ip4ef-0005PJ-HY
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 01:17:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49188)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1ip4ca-0003jT-6T
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 01:15:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1ip4cY-00069Q-PV
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 01:15:11 -0500
Received: from mga17.intel.com ([192.55.52.151]:12862)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1ip4cY-00063A-HG
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 01:15:10 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Jan 2020 22:15:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,408,1571727600"; d="scan'208";a="254120986"
Received: from tao-optiplex-7060.sh.intel.com ([10.239.159.36])
 by fmsmga002.fm.intel.com with ESMTP; 07 Jan 2020 22:15:02 -0800
From: Tao Xu <tao3.xu@intel.com>
To: pbonzini@redhat.com,
	rth@twiddle.net,
	ehabkost@redhat.com
Subject: [PATCH RESEND v2 2/4] target/i386: Remove monitor from some CPU models
Date: Wed,  8 Jan 2020 14:14:56 +0800
Message-Id: <20200108061458.8080-3-tao3.xu@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200108061458.8080-1-tao3.xu@intel.com>
References: <20200108061458.8080-1-tao3.xu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.151
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
Cc: tao3.xu@intel.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add new version of Snowridge, Denverton, Opteron_G3, EPYC, and Dhyana
CPU model to remove MONITOR/MWAIT feature.

After QEMU/KVM use "-overcommit cpu-pm=on" to expose MONITOR/MWAIT
(commit id 6f131f13e68d648a8e4f083c667ab1acd88ce4cd), the MONITOR/MWAIT
feature in these CPU model is unused.

Signed-off-by: Tao Xu <tao3.xu@intel.com>
---
 target/i386/cpu.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6981aa2a34..a6eb1b81fd 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -3678,6 +3678,14 @@ static X86CPUDefinition builtin_x86_defs[] = {
                     { /* end of list */ },
                 },
             },
+            {
+                .version = 3,
+                .props = (PropValue[]) {
+                    /* mpx was already removed by -v2 above */
+                    { "monitor", "off" },
+                    { /* end of list */ },
+                },
+            },
             { /* end of list */ },
         },
     },
@@ -3789,6 +3797,17 @@ static X86CPUDefinition builtin_x86_defs[] = {
             CPUID_EXT3_ABM | CPUID_EXT3_SVM | CPUID_EXT3_LAHF_LM,
         .xlevel = 0x80000008,
         .model_id = "AMD Opteron 23xx (Gen 3 Class Opteron)",
+        .versions = (X86CPUVersionDefinition[]) {
+            { .version = 1 },
+            {
+                .version = 2,
+                .props = (PropValue[]) {
+                    { "monitor", "off" },
+                    { /* end of list */ },
+                },
+            },
+            { /* end of list */ },
+        },
     },
     {
         .name = "Opteron_G4",
@@ -3913,6 +3932,14 @@ static X86CPUDefinition builtin_x86_defs[] = {
                     { /* end of list */ }
                 }
             },
+            {
+                .version = 3,
+                .props = (PropValue[]) {
+                    /* ibpb was already enabled by -v2 above */
+                    { "monitor", "off" },
+                    { /* end of list */ },
+                },
+            },
             { /* end of list */ }
         }
     },
@@ -3965,6 +3992,17 @@ static X86CPUDefinition builtin_x86_defs[] = {
         .xlevel = 0x8000001E,
         .model_id = "Hygon Dhyana Processor",
         .cache_info = &epyc_cache_info,
+        .versions = (X86CPUVersionDefinition[]) {
+            { .version = 1 },
+            {
+                .version = 2,
+                .props = (PropValue[]) {
+                    { "monitor", "off" },
+                    { /* end of list */ },
+                },
+            },
+            { /* end of list */ },
+        },
     },
 };
 
-- 
2.20.1


