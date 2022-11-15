Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B4A6297C3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 12:51:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouuRx-0007zv-H9; Tue, 15 Nov 2022 06:49:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1ouuRf-0007yA-AD
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 06:49:39 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1ouuRc-0008Nt-9w
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 06:49:39 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8CxfbbDfHNjdD8HAA--.9958S3;
 Tue, 15 Nov 2022 19:49:23 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bxj+DDfHNj+ZgTAA--.52019S2; 
 Tue, 15 Nov 2022 19:49:23 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	gaosong@loongson.cn,
	maobibo@loongson.cn
Subject: [PATCH] hw/loongarch: Add default stdout uart in fdt
Date: Tue, 15 Nov 2022 19:49:23 +0800
Message-Id: <20221115114923.3372414-1-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bxj+DDfHNj+ZgTAA--.52019S2
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvdXoWrKr1fZF1UJry7uryfGF4fuFg_yoWkZwc_uF
 4I9w1Fgr45Jw15Wa9aqryayFW7J3W3WFn8GF1fGrs7Xry5tr15GrZIgFsrZr42qrWj9r9x
 C3y5XwnYyFs3WjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
 xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUU5
 V7CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4
 vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7Cj
 xVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x
 0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE
 44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFVCjc4
 AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIE
 Y20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
 80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0
 I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
 k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
 xVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add "chosen" subnode into LoongArch fdt, and set it's
"stdout-path" prop to uart node.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/loongarch/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 5e4c2790bf..b59c07972a 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -69,6 +69,7 @@ static void fdt_add_uart_node(LoongArchMachineState *lams)
     qemu_fdt_setprop_string(ms->fdt, nodename, "compatible", "ns16550a");
     qemu_fdt_setprop_cells(ms->fdt, nodename, "reg", 0x0, base, 0x0, size);
     qemu_fdt_setprop_cell(ms->fdt, nodename, "clock-frequency", 100000000);
+    qemu_fdt_setprop_string(ms->fdt, "/chosen", "stdout-path", nodename);
     g_free(nodename);
 }
 
@@ -87,6 +88,7 @@ static void create_fdt(LoongArchMachineState *lams)
                             "linux,dummy-loongson3");
     qemu_fdt_setprop_cell(ms->fdt, "/", "#address-cells", 0x2);
     qemu_fdt_setprop_cell(ms->fdt, "/", "#size-cells", 0x2);
+    qemu_fdt_add_subnode(ms->fdt, "/chosen");
 }
 
 static void fdt_add_cpu_nodes(const LoongArchMachineState *lams)
-- 
2.31.1


