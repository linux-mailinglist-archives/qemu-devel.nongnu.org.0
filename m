Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754D52002BD
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 09:31:01 +0200 (CEST)
Received: from localhost ([::1]:37872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmBUJ-0007cY-Gn
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 03:30:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1jmBT3-0005jN-Tq
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 03:29:41 -0400
Received: from mga04.intel.com ([192.55.52.120]:38786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1jmBT2-0002VC-6a
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 03:29:41 -0400
IronPort-SDR: I9cf+S9OfIBkJuY+L8L8gzXNbEtz1nI7GYy0WeVf2wLbSzTE+QM57+gfOKnIzzEKHqgeKykpyL
 genSUNPvRURw==
X-IronPort-AV: E=McAfee;i="6000,8403,9656"; a="140406129"
X-IronPort-AV: E=Sophos;i="5.75,254,1589266800"; d="scan'208";a="140406129"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2020 00:29:37 -0700
IronPort-SDR: 81WOFsJrfgMlPdOzWkFQvVJcrpEEg65A6IEEKQodfm4pQgr+FGbfRVqo5omtaF3Game7sBMDL/
 F/elnmNnJ4mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,254,1589266800"; d="scan'208";a="292040626"
Received: from chenyi-pc.sh.intel.com ([10.239.159.72])
 by orsmga002.jf.intel.com with ESMTP; 19 Jun 2020 00:29:35 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v5 3/4] target/i386: add the missing features for
 Icelake-Server CPU model
Date: Fri, 19 Jun 2020 15:31:13 +0800
Message-Id: <20200619073114.24303-4-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619073114.24303-1-chenyi.qiang@intel.com>
References: <20200619073114.24303-1-chenyi.qiang@intel.com>
Received-SPF: pass client-ip=192.55.52.120;
 envelope-from=chenyi.qiang@intel.com; helo=mga04.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 03:29:31
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
index 1f3d8db842..3c81ca543f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -3508,6 +3508,16 @@ static X86CPUDefinition builtin_x86_defs[] = {
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


