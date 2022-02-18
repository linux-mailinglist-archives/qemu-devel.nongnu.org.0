Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E0A4BBDD0
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 17:52:32 +0100 (CET)
Received: from localhost ([::1]:58934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL6Ug-0002MY-UY
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 11:52:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nL6PP-00080p-Vr; Fri, 18 Feb 2022 11:47:03 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:48172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nL6PM-0007ZA-Kx; Fri, 18 Feb 2022 11:47:03 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 80C2920896;
 Fri, 18 Feb 2022 16:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645202816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=SHHPXzHVaXTncR+1zcq0I1jkRrXwjiEdJ2zyeEQu6b4=;
 b=Fw+i3Vw2a4tEBDGnGB1WbLTSLokAbaWqDrRqZOsjioXI44St/SEStGghmAc6M+2pgsHRjJ
 c3GaZBATv/NT3YxFusoIlU2I6Hn6wbJtrZ7Wc93i0CaHBcPXcLqzyWGEn3CiP26rpOdjbb
 KRAlx++4FFlm43Qq7Za/SZ86T5jXado=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] RiscV cleanups for user-related life cycles
Date: Fri, 18 Feb 2022 17:46:41 +0100
Message-Id: <20220218164646.132112-1-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is a few cleanups regarding user oriented life-cycle use cases.
When a device is accessible to user creation, there are a few
life-cycle use cases to consider:
+ init -> finalize (happen when introspection the object).
+ init -> realize-failure -> finalize (realize must report errors due
to miss configuration and leave in a 'good' state)

This series fixes issues I've spotted in the riscv hart array and
interrupt controllers. It is organized as follows:
+ patch 1 prevent memory leak in riscv array array
+ patch 2 introduce a new function in the riscv cpu needed by next
  pacthes
+ patches 3/4/5 prevent memory leaks and add error reporting in plic and
  aclint devices

Thanks,
--
Damien

Damien Hedde (5):
  hw/riscv/riscv_hart: free the harts array when the object is finalized
  target/riscv: add riscv_cpu_release_claimed_interrupts function
  hw/intc/sifive_plic: report errors and free allocated memory
  hw/intc/riscv_aclint: swi: report errors and free allocated memory
  hw/intc/riscv_aclint: mtimer: report errors and free allocated memory

 target/riscv/cpu.h        |   7 +++
 hw/intc/riscv_aclint.c    | 112 ++++++++++++++++++++++++++++----------
 hw/intc/sifive_plic.c     |  90 ++++++++++++++++++++----------
 hw/riscv/riscv_hart.c     |   8 +++
 target/riscv/cpu_helper.c |   8 +++
 5 files changed, 168 insertions(+), 57 deletions(-)

-- 
2.35.1


