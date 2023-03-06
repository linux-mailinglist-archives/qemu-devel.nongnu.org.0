Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3926AC0C0
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 14:24:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZApL-0004l0-FR; Mon, 06 Mar 2023 08:24:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pZApD-0004jG-L4; Mon, 06 Mar 2023 08:24:23 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pZApA-00060M-Of; Mon, 06 Mar 2023 08:24:23 -0500
Received: from localhost.localdomain (unknown [180.165.240.213])
 by APP-05 (Coremail) with SMTP id zQCowAAnLfF56QVkk5BADA--.8932S3;
 Mon, 06 Mar 2023 21:24:10 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v2 1/1] hw/riscv: Add signature dump function for spike to run
 ACT tests
Date: Mon,  6 Mar 2023 21:24:07 +0800
Message-Id: <20230306132407.81790-2-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230306132407.81790-1-liweiwei@iscas.ac.cn>
References: <20230306132407.81790-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAnLfF56QVkk5BADA--.8932S3
X-Coremail-Antispam: 1UD129KBjvJXoWxZF1DXrWfZF1fuF1UJrW5Jrb_yoWruFykpF
 s3CFn8uryUJFn3GFnxtw1xCa1rGan5WF1jkrsxuw1rZFs8WFyUAaykt3WUZan8GF4Ivw45
 AFWDKFy3Ka15Zw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBK14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
 vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
 r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
 v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
 Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x
 0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8
 JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIx
 AIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbec_DUUUUU=
 =
X-Originating-IP: [180.165.240.213]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
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

Add signature and signature-granularity properties in spike to specify the target
signatrue file and the line size for signature data.

Recgonize the signature section between begin_signature and end_signature symbols
when loading elf of ACT tests. Then dump signature data in signature section just
before the ACT tests exit.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 hw/char/riscv_htif.c         | 36 +++++++++++++++++++++++++++++++++++-
 hw/riscv/spike.c             | 16 ++++++++++++++++
 include/hw/char/riscv_htif.h |  3 +++
 3 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
index 098de50e35..f97d77747e 100644
--- a/hw/char/riscv_htif.c
+++ b/hw/char/riscv_htif.c
@@ -29,6 +29,8 @@
 #include "chardev/char-fe.h"
 #include "qemu/timer.h"
 #include "qemu/error-report.h"
+#include "exec/address-spaces.h"
+#include "sysemu/dma.h"
 
 #define RISCV_DEBUG_HTIF 0
 #define HTIF_DEBUG(fmt, ...)                                                   \
@@ -51,7 +53,7 @@
 /* PK system call number */
 #define PK_SYS_WRITE            64
 
-static uint64_t fromhost_addr, tohost_addr;
+static uint64_t fromhost_addr, tohost_addr, sig_addr, sig_len;
 
 void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_value,
                           uint64_t st_size)
@@ -68,6 +70,10 @@ void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_value,
             error_report("HTIF tohost must be 8 bytes");
             exit(1);
         }
+    } else if (strcmp("begin_signature", st_name) == 0) {
+        sig_addr = st_value;
+    } else if (strcmp("end_signature", st_name) == 0) {
+        sig_len = st_value - sig_addr;
     }
 }
 
@@ -161,6 +167,34 @@ static void htif_handle_tohost_write(HTIFState *s, uint64_t val_written)
         /* frontend syscall handler, shutdown and exit code support */
         if (cmd == HTIF_SYSTEM_CMD_SYSCALL) {
             if (payload & 0x1) {
+                /* Dump signature data to sig_file if specified */
+                if (sig_file) {
+                    char *sig_data = g_malloc(sig_len);
+                    dma_memory_read(&address_space_memory, sig_addr, sig_data,
+                                    sig_len, MEMTXATTRS_UNSPECIFIED);
+                    FILE *signature = fopen(sig_file, "w");
+                    if (signature == NULL) {
+                        error_report("open %s: %s", sig_file,
+                                     strerror(errno));
+                        exit(1);
+                    }
+
+                    for (int i = 0; i < sig_len; i += line_size) {
+                        for (int j = line_size; j > 0; j--) {
+                            if (i + j <= sig_len) {
+                                fprintf(signature, "%02x",
+                                        sig_data[i + j - 1] & 0xff);
+                            } else {
+                                fprintf(signature, "%02x", 0);
+                            }
+                        }
+                        fprintf(signature, "\n");
+                    }
+
+                    fclose(signature);
+                    g_free(sig_data);
+                }
+
                 /* exit code */
                 int exit_code = payload >> 1;
                 exit(exit_code);
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index a584d5b3a2..eaa7f54fd6 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -41,6 +41,9 @@
 
 #include <libfdt.h>
 
+const char *sig_file;
+uint8_t line_size = 16;
+
 static const MemMapEntry spike_memmap[] = {
     [SPIKE_MROM] =     {     0x1000,     0xf000 },
     [SPIKE_HTIF] =     {  0x1000000,     0x1000 },
@@ -332,6 +335,11 @@ static void spike_board_init(MachineState *machine)
                  htif_custom_base);
 }
 
+static void spike_set_signature(Object *obj, const char *val, Error **errp)
+{
+    sig_file = g_strdup(val);
+}
+
 static void spike_machine_instance_init(Object *obj)
 {
 }
@@ -350,6 +358,14 @@ static void spike_machine_class_init(ObjectClass *oc, void *data)
     mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
     mc->numa_mem_supported = true;
     mc->default_ram_id = "riscv.spike.ram";
+    object_class_property_add_str(oc, "signature", NULL, spike_set_signature);
+    object_class_property_set_description(oc, "signature",
+                                          "File to write ACT test signature");
+    object_class_property_add_uint8_ptr(oc, "signature-granularity",
+                                        &line_size, OBJ_PROP_FLAG_WRITE);
+    object_class_property_set_description(oc, "signature-granularity",
+                                          "Size of each line in ACT signature "
+                                          "file");
 }
 
 static const TypeInfo spike_machine_typeinfo = {
diff --git a/include/hw/char/riscv_htif.h b/include/hw/char/riscv_htif.h
index 5958c5b986..df493fdf6b 100644
--- a/include/hw/char/riscv_htif.h
+++ b/include/hw/char/riscv_htif.h
@@ -40,6 +40,9 @@ typedef struct HTIFState {
     uint64_t pending_read;
 } HTIFState;
 
+extern const char *sig_file;
+extern uint8_t line_size;
+
 /* HTIF symbol callback */
 void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_value,
     uint64_t st_size);
-- 
2.25.1


