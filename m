Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DC32B3B82
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 03:51:04 +0100 (CET)
Received: from localhost ([::1]:40710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keUbf-0008Fu-6V
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 21:51:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1keUZj-0006Y4-MG; Sun, 15 Nov 2020 21:49:03 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1keUZf-0002sJ-Ab; Sun, 15 Nov 2020 21:49:03 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CZD6L0VDJzhbCC;
 Mon, 16 Nov 2020 10:48:42 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Mon, 16 Nov 2020
 10:48:43 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v3 0/7] silence the compiler warnings
Date: Mon, 16 Nov 2020 10:48:03 +0800
Message-ID: <20201116024810.2415819-1-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga06-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 21:48:52
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Chen Qun <kuhn.chenqun@huawei.com>, zhang.zhanghailiang@huawei.com,
 ganqixin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi folks,
  This series fix some "fall through" warnings reported by GCC_9.3. They've been 
reviewed for a long time. Some of these patchs may be important for QEMU 5.2. 
Such as the Patch6 miss a break statement. Others only add "fall through" 
comments and may not have a negative impact for QEMU 5.2.


Thanks,
Chen Qun


Since v2:
- Patch3：Add Richard Henderson、Philippe Mathieu-Daudé and Thomas Huth reviewed tag.
- Patch4: Laurent pull it to master, remove it.
- Patch6->Patch5: Add Richard Henderson and Philippe Mathieu-Daudé reviewed tag.
- Patch7->Patch6: Add Thomas Huth reviewed tag and David Gibson acked tag.
- Patch8->Patch7: Tweak LOG_UNIMP message base on Thomas Huth comment; 
  Add Philippe Mathieu-Daudé and Thomas Huth reviewed tag; Add David Gibson acked tag.

Since v1:
- Patch1: Add comments to explain the two case of fall through.
  Addressed Richard Henderson and Thomas Huth review comment.
- Patch2: Addressed Peter Maydell review comment.
- Patch3: Add QEMU_NORETURN to cpu_exit_tb_from_sighandler() function to
  avoid the compiler warnings.
- Patch4: Addressed Thomas Huth review comment.
- Patch5: Addressed Artyom Tarasenko and Philippe Mathieu-Daudé review
  comment.
- Patch6: Combine the /* fall through */ to the preceding comments.
  Addressed  Artyom Tarasenko review comment.
- Patch7: Add a "break" statement here instead of /* fall through */
  comments.
- Patch8: Replace the TODO by a LOG_UNIMP call and add break statement
- Patch9: Discard this patch since a patch already exists for fix this 
  issue(https://lore.kernel.org/qemu-devel/20200711154242.41222-1-ysato@users)


Chen Qun (7):
  target/i386: silence the compiler warnings in gen_shiftd_rm_T1
  hw/intc/arm_gicv3_kvm: silence the compiler warnings
  accel/tcg/user-exec: silence the compiler warnings
  target/sparc/translate: silence the compiler warnings
  target/sparc/win_helper: silence the compiler warnings
  ppc: Add a missing break for PPC6xx_INPUT_TBEN
  target/ppc: replaced the TODO with LOG_UNIMP and add break for silence
    warnings

 accel/tcg/user-exec.c     | 3 ++-
 hw/intc/arm_gicv3_kvm.c   | 8 ++++++++
 hw/ppc/ppc.c              | 1 +
 target/i386/translate.c   | 7 +++++--
 target/ppc/mmu_helper.c   | 5 +++--
 target/sparc/translate.c  | 2 +-
 target/sparc/win_helper.c | 2 +-
 7 files changed, 21 insertions(+), 7 deletions(-)

-- 
2.27.0


