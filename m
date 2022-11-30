Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F0F63CFED
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 08:53:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0Hrq-0002Fz-MW; Wed, 30 Nov 2022 02:50:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1p0Hrb-00028Q-Vo; Wed, 30 Nov 2022 02:50:40 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1p0HrX-0001AF-I2; Wed, 30 Nov 2022 02:50:39 -0500
Received: from localhost.localdomain (unknown [180.175.30.174])
 by APP-01 (Coremail) with SMTP id qwCowACnrDBAC4djxmiWAw--.18654S3;
 Wed, 30 Nov 2022 15:50:26 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v8 1/9] target/riscv: add cfg properties for Zc* extension
Date: Wed, 30 Nov 2022 15:49:53 +0800
Message-Id: <20221130075001.19130-2-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221130075001.19130-1-liweiwei@iscas.ac.cn>
References: <20221130075001.19130-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACnrDBAC4djxmiWAw--.18654S3
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy7CF1DurykGFWkAFyrZwb_yoW8KF15pr
 48G3yYkrWDJr17C3yfXF1UK3Z8Wwn29ayIg392qF1xuFW7ArW5XF1vkw1UWF45tFs5Xa1a
 9F17CF15CwsrJa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
 A2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
 M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
 v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
 F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48JMx
 C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
 wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
 vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
 0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
 W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbec_DUUUUU==
X-Originating-IP: [180.175.30.174]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add properties for Zca,Zcb,Zcf,Zcd,Zcmp,Zcmt extension
Add check for these properties

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 target/riscv/cpu.h |  6 ++++++
 2 files changed, 49 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c705331bbe..3d06b57416 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -808,6 +808,49 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             }
         }
 
+        if (cpu->cfg.ext_c) {
+            cpu->cfg.ext_zca = true;
+            if (cpu->cfg.ext_f && env->misa_mxl_max == MXL_RV32) {
+                cpu->cfg.ext_zcf = true;
+            }
+            if (cpu->cfg.ext_d) {
+                cpu->cfg.ext_zcd = true;
+            }
+        }
+
+        if (env->misa_mxl_max != MXL_RV32 && cpu->cfg.ext_zcf) {
+            error_setg(errp, "Zcf extension is only relevant to RV32");
+            return;
+        }
+
+        if (!cpu->cfg.ext_f && cpu->cfg.ext_zcf) {
+            error_setg(errp, "Zcf extension requires F extension");
+            return;
+        }
+
+        if (!cpu->cfg.ext_d && cpu->cfg.ext_zcd) {
+            error_setg(errp, "Zcd extension requires D extension");
+            return;
+        }
+
+        if ((cpu->cfg.ext_zcf || cpu->cfg.ext_zcd || cpu->cfg.ext_zcb ||
+             cpu->cfg.ext_zcmp || cpu->cfg.ext_zcmt) && !cpu->cfg.ext_zca) {
+            error_setg(errp, "Zcf/Zcd/Zcb/Zcmp/Zcmt extensions require Zca "
+                             "extension");
+            return;
+        }
+
+        if (cpu->cfg.ext_zcd && (cpu->cfg.ext_zcmp || cpu->cfg.ext_zcmt)) {
+            error_setg(errp, "Zcmp/Zcmt extensions are incompatible with "
+                             "Zcd extension");
+            return;
+        }
+
+        if (cpu->cfg.ext_zcmt && !cpu->cfg.ext_icsr) {
+            error_setg(errp, "Zcmt extension requires Zicsr extension");
+            return;
+        }
+
         if (cpu->cfg.ext_zk) {
             cpu->cfg.ext_zkn = true;
             cpu->cfg.ext_zkr = true;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9bd539d77a..6e915b6937 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -434,6 +434,12 @@ struct RISCVCPUConfig {
     bool ext_zbkc;
     bool ext_zbkx;
     bool ext_zbs;
+    bool ext_zca;
+    bool ext_zcb;
+    bool ext_zcd;
+    bool ext_zcf;
+    bool ext_zcmp;
+    bool ext_zcmt;
     bool ext_zk;
     bool ext_zkn;
     bool ext_zknd;
-- 
2.25.1


