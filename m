Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C90729F9E8
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 01:43:20 +0100 (CET)
Received: from localhost ([::1]:53302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYIVj-00030b-3k
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 20:43:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kYITo-0001Vw-Qh; Thu, 29 Oct 2020 20:41:20 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:2059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kYITl-00013V-Sl; Thu, 29 Oct 2020 20:41:20 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CMk542JtDzhZRH;
 Fri, 30 Oct 2020 08:41:12 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Fri, 30 Oct 2020
 08:41:02 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v2 0/8] silence the compiler warnings
Date: Fri, 30 Oct 2020 08:40:38 +0800
Message-ID: <20201030004046.2191790-1-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga06-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 20:41:10
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

Since v1:
- Patch1: Add comments to explain the two case of fall through. Addressed Richard Henderson and Thomas Huth review comment.
- Patch2: Addressed Peter Maydell review comment.
- Patch3: Add QEMU_NORETURN to cpu_exit_tb_from_sighandler() function to avoid the compiler warnings.
- Patch4: Addressed Thomas Huth review comment.
- Patch5: Addressed Artyom Tarasenko and Philippe Mathieu-Daudé review comment.
- Patch6: Combine the /* fall through */ to the preceding comments. Addressed  Artyom Tarasenko review comment.
- Patch7: Add a "break" statement here instead of /* fall through */ comments.
- Patch8: Replace the TODO by a LOG_UNIMP call and add break statement
- Patch9: Discard this patch since a patch already exists for fix this issue(https://lore.kernel.org/qemu-devel/20200711154242.41222-1-ysato@users)



Chen Qun (8):
  target/i386: silence the compiler warnings in gen_shiftd_rm_T1
  hw/intc/arm_gicv3_kvm: silence the compiler warnings
  accel/tcg/user-exec: silence the compiler warnings
  linux-user/mips/cpu_loop: silence the compiler warnings
  target/sparc/translate: silence the compiler warnings
  target/sparc/win_helper: silence the compiler warnings
  ppc: Add a missing break for PPC6xx_INPUT_TBEN
  target/ppc: replaced the TODO with LOG_UNIMP and add break for silence
    warnings

 accel/tcg/user-exec.c      | 3 ++-
 hw/intc/arm_gicv3_kvm.c    | 8 ++++++++
 hw/ppc/ppc.c               | 1 +
 linux-user/mips/cpu_loop.c | 4 ++++
 target/i386/translate.c    | 7 +++++--
 target/ppc/mmu_helper.c    | 5 +++--
 target/sparc/translate.c   | 2 +-
 target/sparc/win_helper.c  | 2 +-
 8 files changed, 25 insertions(+), 7 deletions(-)

-- 
2.27.0


