Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3674C0B93
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 06:17:18 +0100 (CET)
Received: from localhost ([::1]:57390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMk1d-00088c-J3
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 00:17:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan@sysprogs.com>) id 1nMk0E-0007Jw-4N
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 00:15:50 -0500
Received: from sysprogs.com ([45.79.83.98]:50344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan@sysprogs.com>) id 1nMk0B-0007Vt-0J
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 00:15:48 -0500
Received: from sys2 (unknown [174.1.100.17])
 by sysprogs.com (Postfix) with ESMTPSA id 2C8AF11A35C;
 Wed, 23 Feb 2022 05:15:44 +0000 (UTC)
From: "Ivan Shcherbakov" <ivan@sysprogs.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 1/3] whpx: Fixed reporting of the CPU context to GDB for 64-bit
Date: Tue, 22 Feb 2022 21:15:41 -0800
Message-ID: <00f701d82874$68b02000$3a106000$@sysprogs.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdgoctCV6yhjHZQETOWQ/yD6MZ7mQA==
Content-Language: en-us
Received-SPF: pass client-ip=45.79.83.98; envelope-from=ivan@sysprogs.com;
 helo=sysprogs.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: armbru@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi All,

We have been looking into kernel-debugging Linux VMs running on Windows with
Hyper-V enabled (that forces the virtualization software to use WHPX), and
it turned out, none of the major virtualization tools supports it properly.
I've added the missing parts to QEMU and it looks pretty solid: setting
breakpoints in the kernel, running, stepping in/over works reliably and
fast.
The changes involved 3 parts:
1. Fixing the x64 register reporting to gdb (this patch)
2. Fixing synchronization of CR8 <=> APIC.TPR, that was preventing
WHvSetVirtualProcessorRegisters() from working
3. Implementing software breakpoints 

It would be great if the changes could be integrated into the QEMU
repository, allowing other Windows users to debug their VMs.
Below is the description of the first patch.

This change makes sure that stopping in the 64-bit mode will set the
HF_CS64_MASK flag in env->hflags (see x86_update_hflags() in
target/i386/cpu.c).
Without it, the code in gdbstub.c would only use the 32-bit register values
when debugging 64-bit targets, making debugging effectively impossible.

Signed-off-by: Ivan Shcherbakov <ivan@sysprogs.com>
---
 target/i386/whpx/whpx-all.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index ef896da0a2..edd4fafbdf 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -604,6 +604,8 @@ static void whpx_get_registers(CPUState *cpu)
         whpx_apic_get(x86_cpu->apic_state);
     }
 
+    x86_update_hflags(env);
+
     return;
 }
 
-- 


