Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FF755456F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 12:55:41 +0200 (CEST)
Received: from localhost ([::1]:42952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3y1M-0006eq-HG
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 06:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1o3xpf-0008Ag-7x
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 06:43:35 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53558 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1o3xpc-0003xj-8K
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 06:43:34 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0838rJi+BtUAA--.28846S12; 
 Wed, 22 Jun 2022 18:43:07 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org,
 chenhuacai@loongson.cn
Subject: [PATCH 10/10] target/loongarch: Add lock when writing timer clear reg
Date: Wed, 22 Jun 2022 18:43:01 +0800
Message-Id: <20220622104301.804447-11-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220622104301.804447-1-yangxiaojuan@loongson.cn>
References: <20220622104301.804447-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxL0838rJi+BtUAA--.28846S12
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw18Zr1kWw4rGr4xZFyDAwb_yoW8WF17pr
 9rCrsFgrWkJrZF9a1kZa4Yq3s8Xr45Wr47uan2kryxCw43X3s2qry8J3ZI9F4DGayrXr1F
 qrnY9a4jvay8XaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is such error info when running linux kernel:
    tcg_handle_interrupt: assertion failed: (qemu_mutex_iothread_locked()).
    calling stack:
    #0 in raise () at /lib64/libc.so.6
    #1 in abort () at /lib64/libc.so.6
    #2 in g_assertion_message_expr.cold () at /lib64/libglib-2.0.so.0
    #3 in g_assertion_message_expr () at /lib64/libglib-2.0.so.0
    #4 in tcg_handle_interrupt (cpu=0x632000030800, mask=2) at ../accel/tcg/tcg-accel-ops.c:79
    #5 in cpu_interrupt (cpu=0x632000030800, mask=2) at ../softmmu/cpus.c:248
    #6 in loongarch_cpu_set_irq (opaque=0x632000030800, irq=11, level=0)
       at ../target/loongarch/cpu.c:100
    #7 in helper_csrwr_ticlr (env=0x632000039440, val=1) at ../target/loongarch/csr_helper.c:85
    #8 in code_gen_buffer ()
    #9 in cpu_tb_exec (cpu=0x632000030800, itb=0x7fff946ac280, tb_exit=0x7ffe4fcb6c30)
       at ../accel/tcg/cpu-exec.c:358

Add mutex iothread lock around loongarch_cpu_set_irq in csrwr_ticlr() to
fix the bug.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 target/loongarch/csr_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/loongarch/csr_helper.c b/target/loongarch/csr_helper.c
index 24a9389364..7e02787895 100644
--- a/target/loongarch/csr_helper.c
+++ b/target/loongarch/csr_helper.c
@@ -81,7 +81,9 @@ target_ulong helper_csrwr_ticlr(CPULoongArchState *env, target_ulong val)
     int64_t old_v = 0;
 
     if (val & 0x1) {
+        qemu_mutex_lock_iothread();
         loongarch_cpu_set_irq(cpu, IRQ_TIMER, 0);
+        qemu_mutex_unlock_iothread();
     }
     return old_v;
 }
-- 
2.31.1


