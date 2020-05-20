Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D80B1DA7AE
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 04:10:14 +0200 (CEST)
Received: from localhost ([::1]:49050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbEBR-0000Nj-0g
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 22:10:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1jbEA8-0007Dy-2b
 for qemu-devel@nongnu.org; Tue, 19 May 2020 22:08:52 -0400
Received: from mga18.intel.com ([134.134.136.126]:42314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1jbEA7-0004XI-Ac
 for qemu-devel@nongnu.org; Tue, 19 May 2020 22:08:51 -0400
IronPort-SDR: zD5n0XiVet9GvLNVA0yOJC+i0iSSKm+Z/XbIW8q3n4rWCp6AzxGO2ciLWccZgntF7Sv0/kUJZ2
 TZ7nR5KONVPw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2020 19:08:46 -0700
IronPort-SDR: yf3bNoeMtK6r1P5Vsy3EVZGjGPjc1syyFb0fRUZJSKJedDMgi+7jAsP3i1+0LtDmz7OX/mQCd3
 ZNGOpPLD6qhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,412,1583222400"; d="scan'208";a="300299762"
Received: from chenyi-pc.sh.intel.com ([10.239.159.72])
 by orsmga008.jf.intel.com with ESMTP; 19 May 2020 19:08:44 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v4 3/5] target/i386: add the missing features for
 Icelake-Server CPU model
Date: Wed, 20 May 2020 10:10:05 +0800
Message-Id: <20200520021007.30649-4-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200520021007.30649-1-chenyi.qiang@intel.com>
References: <20200520021007.30649-1-chenyi.qiang@intel.com>
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=chenyi.qiang@intel.com; helo=mga18.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 22:08:40
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, qemu-devel@nongnu.org,
 Robert Hoo <robert.hu@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the missing features(sha-ni, avx512ifma, rdpid, fsrm) in the
Icelake-Server CPU model.

Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
---
 target/i386/cpu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 52f5aa5418..b4697b0148 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -3488,6 +3488,16 @@ static X86CPUDefinition builtin_x86_defs[] = {
                     { /* end of list */ }
                 },
             },
+            {
+                .version = 4,
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


