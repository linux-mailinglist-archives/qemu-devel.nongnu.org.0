Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4208D5744B2
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 07:53:07 +0200 (CEST)
Received: from localhost ([::1]:39734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBrmb-0001Wn-Rb
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 01:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1oBrdl-0005YK-4Q
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 01:43:57 -0400
Received: from mga05.intel.com ([192.55.52.43]:35781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1oBrdh-0005fq-VU
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 01:43:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657777433; x=1689313433;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pEu3+61NscOfyqEIRN7TQMficy0ktFFIGRMYkodUwJk=;
 b=JiHzqc3+1dJCcB0TX5bIviENLjT2nDbmBwGmRIbxwitTaTpSXj/ZnRJa
 c2Jqgwee/hbXHhcpO0TExvIgbpdL23TjqksZHpu8zuBLB3jtYtXpdb4hy
 dZv8BeGSaX9oobJXUw0sNXiiMsUhZCgvOWF4YVsd0ZI5X+ZinBSDqwGDC
 LDOZt4HKH46SOlZ2Zbb5WemENKqXkgP6gsPO02Vh0l7jG5k9fTl6huZUn
 lYRcu9x0NFLAzHTeYnXmd+k4BSChIPg/kDzpem4Vb+1t+bt6V+GOe9oF4
 nhh8HcIsGezPXIJI/ZyzLPDyQTW7TTp/f1oNdh+rT1ISkkln1ERI/UHh7 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="371733568"
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="371733568"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 22:43:50 -0700
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="653722559"
Received: from duan-server-s2600bt.bj.intel.com ([10.240.192.123])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 22:43:48 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, ehabkost@redhat.com, xiangfeix.ma@intel.com,
 xiaoyao.li@intel.com, seanjc@google.com
Subject: [PATCH v2] target/i386: Restore TSX features with taa-no
Date: Thu, 14 Jul 2022 13:36:31 +0800
Message-Id: <20220714053631.417152-1-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43;
 envelope-from=zhenzhong.duan@intel.com; helo=mga05.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On ICX-2S2 host, when run L2 guest with both L1/L2 using Icelake-Server-v3
or above, we got below warning:

"warning: host doesn't support requested feature: MSR(10AH).taa-no [bit 8]"

This is because L1 KVM doesn't expose taa-no to L2 if RTM is disabled,
then starting L2 qemu triggers the warning.

Fix it by restoring TSX features in Icelake-Server-v3, which may also help
guest performance if host isn't susceptible to TSX Async Abort (TAA)
vulnerabilities.

Fixes: d965dc35592d ("target/i386: Add ARCH_CAPABILITIES related bits into Icelake-Server CPU model")
Tested-by: Xiangfei Ma <xiangfeix.ma@intel.com>
Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
v2: Rewrite commit message

 target/i386/cpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 14f681e998cc..25ef972a3eed 100644
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


