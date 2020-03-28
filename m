Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2AF19634A
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Mar 2020 04:08:28 +0100 (CET)
Received: from localhost ([::1]:49628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jI1pk-0006hQ-1R
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 23:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55475)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chenyi.qiang@intel.com>) id 1jI1mn-0002is-J0
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 23:05:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chenyi.qiang@intel.com>) id 1jI1mm-00043z-MI
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 23:05:25 -0400
Received: from mga12.intel.com ([192.55.52.136]:6621)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <chenyi.qiang@intel.com>)
 id 1jI1mm-0003if-CU
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 23:05:24 -0400
IronPort-SDR: HGrUaBuMPUGe0SWR5NV+A7m481zuSMVOe20h5bpLeUpZvIvM5w4ruukXvslnWiT1l6UooU7x5N
 2R6ulvasugaw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2020 20:05:23 -0700
IronPort-SDR: kbqMjpbRIysa9cCXj2mMZHLmqwULcV0bpnSZPwp6VubAQj0DPNghxMxi5y7LSQoqXvPTpPSbkp
 +rkxHZAFJDGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,314,1580803200"; d="scan'208";a="421319461"
Received: from chenyi-pc.sh.intel.com ([10.239.159.72])
 by orsmga005.jf.intel.com with ESMTP; 27 Mar 2020 20:05:21 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v2 3/4] target/i386: add the missing features for
 Icelake-Server CPU model
Date: Sat, 28 Mar 2020 11:06:24 +0800
Message-Id: <20200328030625.16428-4-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200328030625.16428-1-chenyi.qiang@intel.com>
References: <20200328030625.16428-1-chenyi.qiang@intel.com>
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 192.55.52.136
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
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, qemu-devel@nongnu.org,
 Robert Hoo <robert.hu@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the SHA_NI and AVX512IFMA feature bits in FEAT_7_0_EBX, RDPID
feature bit in FEAT_7_0_ECX and FSRM feature bit in FEAT_7_0_EDX.

Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
---
 target/i386/cpu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index b01421c6bb..babb074abf 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -3552,6 +3552,16 @@ static X86CPUDefinition builtin_x86_defs[] = {
                     { /* end of list */ }
                 },
             },
+            {
+                .version = 3,
+                .props = (PropValue[]) {
+                    { "sha-ni", "on" },
+                    { "avx512ifma", "on" },
+                    { "rdpid", "on" },
+                    { "fsrm", "on" },
+                    { /* end of list */ }
+                },
+            },
             { /* end of list */ }
         }
     },
-- 
2.17.1


