Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3847069EAFB
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 00:05:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUbeW-0006gH-QH; Tue, 21 Feb 2023 18:02:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbe8-0006Nt-2s
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 18:02:08 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbe2-0006DC-QR
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 18:02:03 -0500
Received: by mail-wr1-x436.google.com with SMTP id l25so5642791wrb.3
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 15:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3AbUzmp0I2+LXLWOw3uHl6x+uQJ7u4YpaSOE0qXMtdE=;
 b=klAirB5y7Ua/1/TdxeKbL1m4q0BtIE0fKc5metXIIDWUdfG+DqwKzvxE+LKXxzPQru
 h3n/NsD0Jnac8tR1sMeowhgi2ObxJ5XmC1T58IO44PS1xvKVJJESkmsP9pa3ZKwVAGRn
 xozDx5pXF092HSFzT8Zgf0mwHK/77hUWW4rK4YRcB5dHzmIXhkJkas2iIdacDLdZt0KL
 VS1wacvuqtKx/0Hm9OO/uHzycxiudLL/aePqyLA/wVLs6KBu1PyVkLxqchW5MV3yYFnd
 Lez5HocOZIKuLuFBTmWkcfLtE0Sne+khgAwfrVL2i8FrayuJngTsBsG5oeatoB/ukcPD
 WUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3AbUzmp0I2+LXLWOw3uHl6x+uQJ7u4YpaSOE0qXMtdE=;
 b=lGHd3NGuB7NJ2GenLqF3hhUWhL8+f7LGLYjbGNN73vxvlsW9x6a4vj6Ia0Ra7aLwAa
 ViviwZehWWPsYIhGr2appzQrMuDVucnBrr6RrHbWYk5KJycz/lnRJ+4hP4+YzU+mYeAU
 +Tcamtbowezu7V8C02EPfO+7wT9WGcmxXpmgredbdoRIXm21zRjFWpQ5VCJjyDyj46mA
 6xUSyDtn40Yxz1ri6t9DWDVYvp9XhHzk+oeSgj/XC2+kv+LubN9oUdRHSiOPxRs6feiG
 MHWwnLImOlf+Q1z/rL4IEG0Zr3nzVFLgCcnQutUoUqxZwQ/tkVGGyXqbj2RkXerr2n3V
 TlOQ==
X-Gm-Message-State: AO0yUKXMnWm3czgyQvMX0RoXJ72A6ooraHbhKjIEMhpU2xD/+V82HEY6
 yk60ZYdR0r1WtW20JzH+Ozz7uw==
X-Google-Smtp-Source: AK7set/A8zkNa2r3T7pRh2Ji+R95RwfMXIFtTbSucLjzLM6KzvZvaDG59qP9PincEnRG/lwwnctnZw==
X-Received: by 2002:a5d:5145:0:b0:2c3:e5fa:d5d2 with SMTP id
 u5-20020a5d5145000000b002c3e5fad5d2mr4193981wrt.50.1677020517166; 
 Tue, 21 Feb 2023 15:01:57 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 l11-20020adff48b000000b002c592535839sm5745321wro.17.2023.02.21.15.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 15:01:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 40CB41FFC4;
 Tue, 21 Feb 2023 22:52:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 nicolas.eder@lauterbach.com, Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, mads@ynddal.dk,
 Marek Vasut <marex@denx.de>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, Bin Meng <bin.meng@windriver.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Hildenbrand <david@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v3 14/24] gdbstub: specialise target_memory_rw_debug
Date: Tue, 21 Feb 2023 22:52:17 +0000
Message-Id: <20230221225227.3735319-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221225227.3735319-1-alex.bennee@linaro.org>
References: <20230221225227.3735319-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The two implementations are different enough to encourage having a
specialisation and we can move some of the softmmu only stuff out of
gdbstub.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/internals.h | 19 ++++++++++++
 gdbstub/gdbstub.c   | 73 +++++++--------------------------------------
 gdbstub/softmmu.c   | 51 +++++++++++++++++++++++++++++++
 gdbstub/user.c      | 15 ++++++++++
 4 files changed, 96 insertions(+), 62 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 3875c6877e..9de995ce3a 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -183,6 +183,10 @@ void gdb_handle_query_xfer_auxv(GArray *params, void *user_ctx); /*user */
 
 void gdb_handle_query_attached(GArray *params, void *user_ctx); /* both */
 
+/* softmmu only */
+void gdb_handle_query_qemu_phy_mem_mode(GArray *params, void *user_ctx);
+void gdb_handle_set_qemu_phy_mem_mode(GArray *params, void *user_ctx);
+
 /*
  * Break/Watch point support - there is an implementation for softmmu
  * and user mode.
@@ -192,4 +196,19 @@ int gdb_breakpoint_insert(CPUState *cs, int type, hwaddr addr, hwaddr len);
 int gdb_breakpoint_remove(CPUState *cs, int type, hwaddr addr, hwaddr len);
 void gdb_breakpoint_remove_all(CPUState *cs);
 
+/**
+ * gdb_target_memory_rw_debug() - handle debug access to memory
+ * @cs: CPUState
+ * @addr: nominal address, could be an entire physical address
+ * @buf: data
+ * @len: length of access
+ * @is_write: is it a write operation
+ *
+ * This function is specialised depending on the mode we are running
+ * in. For softmmu guests we can switch the interpretation of the
+ * address to a physical address.
+ */
+int gdb_target_memory_rw_debug(CPUState *cs, hwaddr addr,
+                               uint8_t *buf, int len, bool is_write);
+
 #endif /* GDBSTUB_INTERNALS_H */
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 0d90685c72..91021859a1 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -46,33 +46,6 @@
 
 #include "internals.h"
 
-#ifndef CONFIG_USER_ONLY
-static int phy_memory_mode;
-#endif
-
-static inline int target_memory_rw_debug(CPUState *cpu, target_ulong addr,
-                                         uint8_t *buf, int len, bool is_write)
-{
-    CPUClass *cc;
-
-#ifndef CONFIG_USER_ONLY
-    if (phy_memory_mode) {
-        if (is_write) {
-            cpu_physical_memory_write(addr, buf, len);
-        } else {
-            cpu_physical_memory_read(addr, buf, len);
-        }
-        return 0;
-    }
-#endif
-
-    cc = CPU_GET_CLASS(cpu);
-    if (cc->memory_rw_debug) {
-        return cc->memory_rw_debug(cpu, addr, buf, len, is_write);
-    }
-    return cpu_memory_rw_debug(cpu, addr, buf, len, is_write);
-}
-
 typedef struct GDBRegisterState {
     int base_reg;
     int num_regs;
@@ -1194,11 +1167,11 @@ static void handle_write_mem(GArray *params, void *user_ctx)
     }
 
     gdb_hextomem(gdbserver_state.mem_buf, get_param(params, 2)->data,
-             get_param(params, 1)->val_ull);
-    if (target_memory_rw_debug(gdbserver_state.g_cpu,
-                               get_param(params, 0)->val_ull,
-                               gdbserver_state.mem_buf->data,
-                               gdbserver_state.mem_buf->len, true)) {
+                 get_param(params, 1)->val_ull);
+    if (gdb_target_memory_rw_debug(gdbserver_state.g_cpu,
+                                   get_param(params, 0)->val_ull,
+                                   gdbserver_state.mem_buf->data,
+                                   gdbserver_state.mem_buf->len, true)) {
         gdb_put_packet("E14");
         return;
     }
@@ -1222,10 +1195,10 @@ static void handle_read_mem(GArray *params, void *user_ctx)
     g_byte_array_set_size(gdbserver_state.mem_buf,
                           get_param(params, 1)->val_ull);
 
-    if (target_memory_rw_debug(gdbserver_state.g_cpu,
-                               get_param(params, 0)->val_ull,
-                               gdbserver_state.mem_buf->data,
-                               gdbserver_state.mem_buf->len, false)) {
+    if (gdb_target_memory_rw_debug(gdbserver_state.g_cpu,
+                                   get_param(params, 0)->val_ull,
+                                   gdbserver_state.mem_buf->data,
+                                   gdbserver_state.mem_buf->len, false)) {
         gdb_put_packet("E14");
         return;
     }
@@ -1675,30 +1648,6 @@ static void handle_query_qemu_supported(GArray *params, void *user_ctx)
     gdb_put_strbuf();
 }
 
-#ifndef CONFIG_USER_ONLY
-static void handle_query_qemu_phy_mem_mode(GArray *params,
-                                           void *user_ctx)
-{
-    g_string_printf(gdbserver_state.str_buf, "%d", phy_memory_mode);
-    gdb_put_strbuf();
-}
-
-static void handle_set_qemu_phy_mem_mode(GArray *params, void *user_ctx)
-{
-    if (!params->len) {
-        gdb_put_packet("E22");
-        return;
-    }
-
-    if (!get_param(params, 0)->val_ul) {
-        phy_memory_mode = 0;
-    } else {
-        phy_memory_mode = 1;
-    }
-    gdb_put_packet("OK");
-}
-#endif
-
 static const GdbCmdParseEntry gdb_gen_query_set_common_table[] = {
     /* Order is important if has same prefix */
     {
@@ -1789,7 +1738,7 @@ static const GdbCmdParseEntry gdb_gen_query_table[] = {
     },
 #ifndef CONFIG_USER_ONLY
     {
-        .handler = handle_query_qemu_phy_mem_mode,
+        .handler = gdb_handle_query_qemu_phy_mem_mode,
         .cmd = "qemu.PhyMemMode",
     },
 #endif
@@ -1805,7 +1754,7 @@ static const GdbCmdParseEntry gdb_gen_set_table[] = {
     },
 #ifndef CONFIG_USER_ONLY
     {
-        .handler = handle_set_qemu_phy_mem_mode,
+        .handler = gdb_handle_set_qemu_phy_mem_mode,
         .cmd = "qemu.PhyMemMode:",
         .cmd_startswith = 1,
         .schema = "l0"
diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index ade0cc366c..d9b9ba0a32 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -406,9 +406,60 @@ void gdb_exit(int code)
   qemu_chr_fe_deinit(&gdbserver_system_state.chr, true);
 }
 
+/*
+ * Memory access
+ */
+static int phy_memory_mode;
+
+int gdb_target_memory_rw_debug(CPUState *cpu, hwaddr addr,
+                               uint8_t *buf, int len, bool is_write)
+{
+    CPUClass *cc;
+
+    if (phy_memory_mode) {
+        if (is_write) {
+            cpu_physical_memory_write(addr, buf, len);
+        } else {
+            cpu_physical_memory_read(addr, buf, len);
+        }
+        return 0;
+    }
+
+    cc = CPU_GET_CLASS(cpu);
+    if (cc->memory_rw_debug) {
+        return cc->memory_rw_debug(cpu, addr, buf, len, is_write);
+    }
+
+    return cpu_memory_rw_debug(cpu, addr, buf, len, is_write);
+}
+
+
 /*
  * Softmmu specific command helpers
  */
+
+void gdb_handle_query_qemu_phy_mem_mode(GArray *params,
+                                        void *user_ctx)
+{
+    g_string_printf(gdbserver_state.str_buf, "%d", phy_memory_mode);
+    gdb_put_strbuf();
+}
+
+void gdb_handle_set_qemu_phy_mem_mode(GArray *params, void *user_ctx)
+{
+    if (!params->len) {
+        gdb_put_packet("E22");
+        return;
+    }
+
+    if (!get_param(params, 0)->val_ul) {
+        phy_memory_mode = 0;
+    } else {
+        phy_memory_mode = 1;
+    }
+    gdb_put_packet("OK");
+}
+
 void gdb_handle_query_rcmd(GArray *params, void *user_ctx)
 {
     const guint8 zero = 0;
diff --git a/gdbstub/user.c b/gdbstub/user.c
index 90dfe49f27..b956c0e297 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -373,6 +373,21 @@ int gdb_continue_partial(char *newstates)
     return res;
 }
 
+/*
+ * Memory access helpers
+ */
+int gdb_target_memory_rw_debug(CPUState *cpu, hwaddr addr,
+                               uint8_t *buf, int len, bool is_write)
+{
+    CPUClass *cc;
+
+    cc = CPU_GET_CLASS(cpu);
+    if (cc->memory_rw_debug) {
+        return cc->memory_rw_debug(cpu, addr, buf, len, is_write);
+    }
+    return cpu_memory_rw_debug(cpu, addr, buf, len, is_write);
+}
+
 /*
  * Break/Watch point helpers
  */
-- 
2.39.1


