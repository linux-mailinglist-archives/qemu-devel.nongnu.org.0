Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B668D6AF79F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:30:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZesH-0004mh-Pb; Tue, 07 Mar 2023 16:29:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZesF-0004ld-VK
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:29:31 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZesB-0000xJ-IU
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:29:31 -0500
Received: by mail-wr1-x434.google.com with SMTP id bx12so13499862wrb.11
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 13:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678224566;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cXl20dTDEEzD6Qn7nLBX+7ZZUM1kWGm37AG39KPgBlk=;
 b=PB9G2eA/Q1h6/+4/NpQ1+m47nrbu1A9yscAmpesK7P43vZ0m7i5fvAVyIaP4uAA1xH
 DJJDoxmX+BwUVmJ9BOWnefIYjO6I0kFNUUXYC8sTPDQv6UJ1ye6K350F3K8YtJsondhZ
 3WzrePOmn8t7QrYiOUngLs807pdhoXMj/rwHomh9JnmgpJ+pj1vE+pAADIl9QwJi5r1D
 OBJHk/b9lcruRCsE+CGWiTaMLgOIaUdJsZb5qndKtf5tzNTeoUKOUEeCvCA/QFOWGkl3
 l5EZdWxUMOfDRNHybHsbToAtp/U8VUExrGEGcuLRoOF0/ODhrfhUZ5qOQYE/2ErlczfK
 GzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678224566;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cXl20dTDEEzD6Qn7nLBX+7ZZUM1kWGm37AG39KPgBlk=;
 b=CU458yfqYPyandhMXZGX0nuT6cuZlOnpdjLTpiPlX6DmJJ+ZZU8M1L9ioTstZQADDX
 x+tn9c8FLLEO3H91LwNcalu4awPH7JXeKC5JJmkEbps+J66AFok+xApWdaomVZPffPnD
 x65WyX2zkbRLD1x4fpJOMNl7VzzxkXXOiZTGKgtSfOFpOS0UdEWqSGu2PnCMIn3LOD+i
 qfMtXhL+pVSXkfo59S2tvB4q46ErTHPYfzuDhMyf6GpEHaLo/wfXtM9PW5UFtSm+O+Eh
 D/YXJIXZ+O3Wfc/NERBy+N8ffplK2HChE35CHFk+gnfvWdHUGooihkjUevyPNCgljuGH
 9UZg==
X-Gm-Message-State: AO0yUKXogzytwRJ5NRHPsRQSkN4kN9SUfIuJUouSXqHBElJJf8Zb8XIS
 KPUy+mPJSo16De9O4hJHuF7Thw==
X-Google-Smtp-Source: AK7set/h7BOX+2p/AR1RcUaUtsWbaCwsfC42f0EZPfYg5sLNNW+z6nCz5zEEeBGwqTKPa9mSWFdt/g==
X-Received: by 2002:adf:f445:0:b0:2c3:db9e:4b06 with SMTP id
 f5-20020adff445000000b002c3db9e4b06mr10956259wrp.45.1678224566295; 
 Tue, 07 Mar 2023 13:29:26 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a5d5048000000b002c592535839sm13395600wrt.17.2023.03.07.13.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 13:29:24 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 27D481FFC4;
 Tue,  7 Mar 2023 21:21:41 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 15/30] gdbstub: specialise target_memory_rw_debug
Date: Tue,  7 Mar 2023 21:21:24 +0000
Message-Id: <20230307212139.883112-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307212139.883112-1-alex.bennee@linaro.org>
References: <20230307212139.883112-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

The two implementations are different enough to encourage having a
specialisation and we can move some of the softmmu only stuff out of
gdbstub.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230302190846.2593720-16-alex.bennee@linaro.org>
Message-Id: <20230303025805.625589-16-richard.henderson@linaro.org>

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 20caacd744..d8c0292d99 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -185,6 +185,10 @@ void gdb_handle_query_xfer_auxv(GArray *params, void *user_ctx); /*user */
 
 void gdb_handle_query_attached(GArray *params, void *user_ctx); /* both */
 
+/* softmmu only */
+void gdb_handle_query_qemu_phy_mem_mode(GArray *params, void *user_ctx);
+void gdb_handle_set_qemu_phy_mem_mode(GArray *params, void *user_ctx);
+
 /*
  * Break/Watch point support - there is an implementation for softmmu
  * and user mode.
@@ -194,4 +198,19 @@ int gdb_breakpoint_insert(CPUState *cs, int type, vaddr addr, vaddr len);
 int gdb_breakpoint_remove(CPUState *cs, int type, vaddr addr, vaddr len);
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
index 52d1769f57..ed38ab0aaa 100644
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
@@ -1195,11 +1168,11 @@ static void handle_write_mem(GArray *params, void *user_ctx)
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
@@ -1223,10 +1196,10 @@ static void handle_read_mem(GArray *params, void *user_ctx)
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
@@ -1676,30 +1649,6 @@ static void handle_query_qemu_supported(GArray *params, void *user_ctx)
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
@@ -1790,7 +1739,7 @@ static const GdbCmdParseEntry gdb_gen_query_table[] = {
     },
 #ifndef CONFIG_USER_ONLY
     {
-        .handler = handle_query_qemu_phy_mem_mode,
+        .handler = gdb_handle_query_qemu_phy_mem_mode,
         .cmd = "qemu.PhyMemMode",
     },
 #endif
@@ -1806,7 +1755,7 @@ static const GdbCmdParseEntry gdb_gen_set_table[] = {
     },
 #ifndef CONFIG_USER_ONLY
     {
-        .handler = handle_set_qemu_phy_mem_mode,
+        .handler = gdb_handle_set_qemu_phy_mem_mode,
         .cmd = "qemu.PhyMemMode:",
         .cmd_startswith = 1,
         .schema = "l0"
diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index 7c180b779a..ab2d182654 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -413,9 +413,60 @@ void gdb_exit(int code)
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
index c0fd83b373..92663d971c 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -378,6 +378,21 @@ int gdb_continue_partial(char *newstates)
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
2.39.2


