Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B796A56B26A
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 07:51:41 +0200 (CEST)
Received: from localhost ([::1]:50492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9gtw-0005PT-Ar
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 01:51:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1o9grf-0003nM-IX
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 01:49:19 -0400
Received: from mga01.intel.com ([192.55.52.88]:5649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1o9grb-0003lE-CO
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 01:49:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657259355; x=1688795355;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NuERnqTqJubzrxhsXPji87qvW9sb9DrM5XgHfHvvTBE=;
 b=lpVFcsV5W8AlxkT4ObLHP2rXC/UjyYoi/DejQxGDZJj9GTTl9G28HcFQ
 jYfAmP/tEsZkPjJR1xY9fDaNc2Ag7Qa2pw/0iBd5SIzu8bziOjfrvAykD
 5a8qHEyl4RpiZfLE8bRXVie0vPgGewZbQEUgKNwtZJsmbDVMdaMhugUy1
 qQ65aa51PYFr1Nh/Ck30CsJuz2Jqrxyq7EeZEa+62XCYgK2hTKO94zihK
 /hVtm5WiBUlAklT3wQ1blsoa7AXvpmVyVgArwbcQ9frwSMdknNhvcgScv
 w2QUTeGzfZOynoG/RKM9+lO0cF8SVjFzzPr+BSJjFhLP6wyOCuCQuZQiS w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="309760899"
X-IronPort-AV: E=Sophos;i="5.92,254,1650956400"; d="scan'208";a="309760899"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 22:49:11 -0700
X-IronPort-AV: E=Sophos;i="5.92,254,1650956400"; d="scan'208";a="651432862"
Received: from duan-server-s2600bt.bj.intel.com ([10.240.192.123])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 22:49:09 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, ehabkost@redhat.com, xiangfeix.ma@intel.com,
 xiaoyao.li@intel.com
Subject: [PATCH] target/i386: Restore TSX features with taa-no
Date: Fri,  8 Jul 2022 13:42:03 +0800
Message-Id: <20220708054203.194978-1-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.88;
 envelope-from=zhenzhong.duan@intel.com; helo=mga01.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In L1 kernel side, taa-no is cleared because RTM is disabled
which will lead to below warning when starting L2 qemu:

"warning: host doesn't support requested feature: MSR(10AH).taa-no [bit 8]"

If host isn't susceptible to TSX Async Abort (TAA) vulnerabilities,
exposing TSX to L2 may help performance too.

Fixes: d965dc35592d ("target/i386: Add ARCH_CAPABILITIES related bits into Icelake-Server CPU model")
Tested-by: Xiangfei Ma <xiangfeix.ma@intel.com>
Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 target/i386/cpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6a57ef13af86..bda2569c73cc 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -3423,6 +3423,9 @@ static const X86CPUDefinition builtin_x86_defs[] = {
             {
                 .version = 3,
                 .props = (PropValue[]) {
+                    /* Restore TSX features removed by -v2 above */
+                    { "hle", "on" },
+                    { "rtm", "on" },
                     { "arch-capabilities", "on" },
                     { "rdctl-no", "on" },
                     { "ibrs-all", "on" },
-- 
2.25.1


