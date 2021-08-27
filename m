Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B683F9485
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 08:48:22 +0200 (CEST)
Received: from localhost ([::1]:53174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJVf3-0004DN-4S
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 02:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1mJVav-0007Y9-63
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 02:44:05 -0400
Received: from mga12.intel.com ([192.55.52.136]:32031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1mJVao-0001iM-13
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 02:44:04 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="197471999"
X-IronPort-AV: E=Sophos;i="5.84,355,1620716400"; d="scan'208";a="197471999"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 23:43:55 -0700
X-IronPort-AV: E=Sophos;i="5.84,355,1620716400"; d="scan'208";a="528205141"
Received: from chenyi-pc.sh.intel.com ([10.239.159.88])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 23:43:54 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 2/2] target/i386: Remove core-capability in Snowridge CPU
 model
Date: Fri, 27 Aug 2021 14:48:18 +0800
Message-Id: <20210827064818.4698-3-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210827064818.4698-1-chenyi.qiang@intel.com>
References: <20210827064818.4698-1-chenyi.qiang@intel.com>
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=chenyi.qiang@intel.com; helo=mga12.intel.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, Chenyi Qiang <chenyi.qiang@intel.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Because core-capability releated features are model-specific and KVM
won't support it, remove the core-capability in CPU model to avoid the
warning message.

Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
---
 target/i386/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index aebf81d9c9..86a15af1ed 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -3684,9 +3684,10 @@ static const X86CPUDefinition builtin_x86_defs[] = {
             },
             {
                 .version = 4,
-                .note = "no split lock detect",
+                .note = "no split lock detect, no core-capability",
                 .props = (PropValue[]) {
                     { "split-lock-detect", "off" },
+                    { "core-capability", "off" },
                     { /* end of list */ },
                 },
             },
-- 
2.17.1


