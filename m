Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1454638B576
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 19:49:53 +0200 (CEST)
Received: from localhost ([::1]:56080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljmnw-0003xI-2x
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 13:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ljmhY-0003QX-CX
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:43:16 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:42960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ljmhU-00017J-Ne
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:43:16 -0400
Received: by mail-wr1-x430.google.com with SMTP id x8so18508180wrq.9
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 10:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u9Mp8qXcR4iIAJ83/3fieCimQZgfESq9GMyz74DDHFY=;
 b=ZXfcrIdFRLV45uj9mmg9Fba39eelbz6WzY1eJhQNNyUd6Q075oN59/jK0TGRkkI9jr
 r1zaYCkI9LSMQyf5y119akiqdRrM92m2EeVM0TVwkUsxyr5JhTF5Je79kSgpPr+Rj1Y7
 1VtGHYOWIMUc/wkG6brcUItGDn1EDotLsAt3lQFUtTfnrLzQDPHXBiLWgdj1UM/Lg5Kt
 pdDMPNc5wol0G5FkUS7EIXABzp30URAOMiOBJYNuRh4e/nTXKR0iOevC6OKixoAFun6+
 lf3U6NxLrIXDvryQj7HkT+RiR/0yfwURFaobUl6TP200L6r40Oe95PvlefjAJWUwLKYn
 ckWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u9Mp8qXcR4iIAJ83/3fieCimQZgfESq9GMyz74DDHFY=;
 b=Vf/kdyNdpOxrzZyQ8QYYMiTiOMlrn+nYKqz906CEDBeBh9JsKgJ0wGrNESeLdsA+kJ
 71Er9jTWHI4f2udQDhNMI5xICV29wJLtvcPrhpTYWAS0dkS5mtlNuz498si/ON7xdMCR
 bScbOhL0RN24568HalpeSUpsfQR98GiARBsYPbryfNwefq0soSdG+9TE2oncbrp8vyTZ
 hvCbooH83196OxhhAtslrI+DimmU1kGi5IvAGkDHhyT5QN0RwQlN2ZTWGtXVw3mghepe
 M1K/LSQ+x2a/ahgbX5xd1xYnWB0/ThzbyGGfUwLnKzsaymqnDYxxcSkxRYBQzwiOwZsk
 jarA==
X-Gm-Message-State: AOAM531UVV0RSvq8InRy/BQ+TLcFoYYBcndZa6x1GsjBzmx38ZNfuXza
 o2dAHr/I5Q5JbrdY/qMyAp3FQQ==
X-Google-Smtp-Source: ABdhPJwUWa7mLgM7rz8fDqEdbFfrwio791Qg/s/k6u0Cx/fbghtXxInve/agxbeUpsEUHEh6HulSCw==
X-Received: by 2002:adf:e684:: with SMTP id r4mr5330407wrm.378.1621532591103; 
 Thu, 20 May 2021 10:43:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g66sm3322648wma.11.2021.05.20.10.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 10:43:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3CE3A1FF91;
 Thu, 20 May 2021 18:43:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 5/8] gdbstub: Replace GdbCmdContext with plain g_array()
Date: Thu, 20 May 2021 18:43:00 +0100
Message-Id: <20210520174303.12310-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210520174303.12310-1-alex.bennee@linaro.org>
References: <20210520174303.12310-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Instead of jumping through hoops let glib deal with both tracking the
number of elements and auto freeing the memory once we are done. This
allows is to drop the usage of ALLOCA(3) which the man-page mentions
its "use is discouraged".

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - don't automatically append the variable
  - fix some long lines
---
 gdbstub.c | 322 ++++++++++++++++++++++++++----------------------------
 1 file changed, 154 insertions(+), 168 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 83d47c6732..84ce770a04 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1338,6 +1338,8 @@ typedef union GdbCmdVariant {
     } thread_id;
 } GdbCmdVariant;
 
+#define get_param(p, i)    (&g_array_index(p, GdbCmdVariant, i))
+
 static const char *cmd_next_param(const char *param, const char delimiter)
 {
     static const char all_delimiters[] = ",;:=";
@@ -1363,55 +1365,52 @@ static const char *cmd_next_param(const char *param, const char delimiter)
 }
 
 static int cmd_parse_params(const char *data, const char *schema,
-                            GdbCmdVariant *params, int *num_params)
+                            GArray *params)
 {
-    int curr_param;
     const char *curr_schema, *curr_data;
 
-    *num_params = 0;
-
-    if (!schema) {
-        return 0;
-    }
+    g_assert(schema);
+    g_assert(params->len == 0);
 
     curr_schema = schema;
-    curr_param = 0;
     curr_data = data;
     while (curr_schema[0] && curr_schema[1] && *curr_data) {
+        GdbCmdVariant this_param;
+
         switch (curr_schema[0]) {
         case 'l':
             if (qemu_strtoul(curr_data, &curr_data, 16,
-                             &params[curr_param].val_ul)) {
+                             &this_param.val_ul)) {
                 return -EINVAL;
             }
-            curr_param++;
             curr_data = cmd_next_param(curr_data, curr_schema[1]);
+            g_array_append_val(params, this_param);
             break;
         case 'L':
             if (qemu_strtou64(curr_data, &curr_data, 16,
-                              (uint64_t *)&params[curr_param].val_ull)) {
+                              (uint64_t *)&this_param.val_ull)) {
                 return -EINVAL;
             }
-            curr_param++;
             curr_data = cmd_next_param(curr_data, curr_schema[1]);
+            g_array_append_val(params, this_param);
             break;
         case 's':
-            params[curr_param].data = curr_data;
-            curr_param++;
+            this_param.data = curr_data;
             curr_data = cmd_next_param(curr_data, curr_schema[1]);
+            g_array_append_val(params, this_param);
             break;
         case 'o':
-            params[curr_param].opcode = *(uint8_t *)curr_data;
-            curr_param++;
+            this_param.opcode = *(uint8_t *)curr_data;
             curr_data = cmd_next_param(curr_data, curr_schema[1]);
+            g_array_append_val(params, this_param);
             break;
         case 't':
-            params[curr_param].thread_id.kind =
+            this_param.thread_id.kind =
                 read_thread_id(curr_data, &curr_data,
-                               &params[curr_param].thread_id.pid,
-                               &params[curr_param].thread_id.tid);
-            curr_param++;
+                               &this_param.thread_id.pid,
+                               &this_param.thread_id.tid);
             curr_data = cmd_next_param(curr_data, curr_schema[1]);
+            g_array_append_val(params, this_param);
             break;
         case '?':
             curr_data = cmd_next_param(curr_data, curr_schema[1]);
@@ -1422,16 +1421,10 @@ static int cmd_parse_params(const char *data, const char *schema,
         curr_schema += 2;
     }
 
-    *num_params = curr_param;
     return 0;
 }
 
-typedef struct GdbCmdContext {
-    GdbCmdVariant *params;
-    int num_params;
-} GdbCmdContext;
-
-typedef void (*GdbCmdHandler)(GdbCmdContext *gdb_ctx, void *user_ctx);
+typedef void (*GdbCmdHandler)(GArray *params, void *user_ctx);
 
 /*
  * cmd_startswith -> cmd is compared using startswith
@@ -1471,8 +1464,8 @@ static inline int startswith(const char *string, const char *pattern)
 static int process_string_cmd(void *user_ctx, const char *data,
                               const GdbCmdParseEntry *cmds, int num_cmds)
 {
-    int i, schema_len, max_num_params = 0;
-    GdbCmdContext gdb_ctx;
+    int i;
+    g_autoptr(GArray) params = g_array_new(false, true, sizeof(GdbCmdVariant));
 
     if (!cmds) {
         return -1;
@@ -1488,24 +1481,13 @@ static int process_string_cmd(void *user_ctx, const char *data,
         }
 
         if (cmd->schema) {
-            schema_len = strlen(cmd->schema);
-            if (schema_len % 2) {
-                return -2;
+            if (cmd_parse_params(&data[strlen(cmd->cmd)],
+                                 cmd->schema, params)) {
+                return -1;
             }
-
-            max_num_params = schema_len / 2;
-        }
-
-        gdb_ctx.params =
-            (GdbCmdVariant *)alloca(sizeof(*gdb_ctx.params) * max_num_params);
-        memset(gdb_ctx.params, 0, sizeof(*gdb_ctx.params) * max_num_params);
-
-        if (cmd_parse_params(&data[strlen(cmd->cmd)], cmd->schema,
-                             gdb_ctx.params, &gdb_ctx.num_params)) {
-            return -1;
         }
 
-        cmd->handler(&gdb_ctx, user_ctx);
+        cmd->handler(params, user_ctx);
         return 0;
     }
 
@@ -1528,18 +1510,18 @@ static void run_cmd_parser(const char *data, const GdbCmdParseEntry *cmd)
     }
 }
 
-static void handle_detach(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_detach(GArray *params, void *user_ctx)
 {
     GDBProcess *process;
     uint32_t pid = 1;
 
     if (gdbserver_state.multiprocess) {
-        if (!gdb_ctx->num_params) {
+        if (!params->len) {
             put_packet("E22");
             return;
         }
 
-        pid = gdb_ctx->params[0].val_ul;
+        pid = get_param(params, 0)->val_ul;
     }
 
     process = gdb_get_process(pid);
@@ -1562,22 +1544,22 @@ static void handle_detach(GdbCmdContext *gdb_ctx, void *user_ctx)
     put_packet("OK");
 }
 
-static void handle_thread_alive(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_thread_alive(GArray *params, void *user_ctx)
 {
     CPUState *cpu;
 
-    if (!gdb_ctx->num_params) {
+    if (!params->len) {
         put_packet("E22");
         return;
     }
 
-    if (gdb_ctx->params[0].thread_id.kind == GDB_READ_THREAD_ERR) {
+    if (get_param(params, 0)->thread_id.kind == GDB_READ_THREAD_ERR) {
         put_packet("E22");
         return;
     }
 
-    cpu = gdb_get_cpu(gdb_ctx->params[0].thread_id.pid,
-                      gdb_ctx->params[0].thread_id.tid);
+    cpu = gdb_get_cpu(get_param(params, 0)->thread_id.pid,
+                      get_param(params, 0)->thread_id.tid);
     if (!cpu) {
         put_packet("E22");
         return;
@@ -1586,17 +1568,17 @@ static void handle_thread_alive(GdbCmdContext *gdb_ctx, void *user_ctx)
     put_packet("OK");
 }
 
-static void handle_continue(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_continue(GArray *params, void *user_ctx)
 {
-    if (gdb_ctx->num_params) {
-        gdb_set_cpu_pc(gdb_ctx->params[0].val_ull);
+    if (params->len) {
+        gdb_set_cpu_pc(get_param(params, 0)->val_ull);
     }
 
     gdbserver_state.signal = 0;
     gdb_continue();
 }
 
-static void handle_cont_with_sig(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_cont_with_sig(GArray *params, void *user_ctx)
 {
     unsigned long signal = 0;
 
@@ -1604,8 +1586,8 @@ static void handle_cont_with_sig(GdbCmdContext *gdb_ctx, void *user_ctx)
      * Note: C sig;[addr] is currently unsupported and we simply
      *       omit the addr parameter
      */
-    if (gdb_ctx->num_params) {
-        signal = gdb_ctx->params[0].val_ul;
+    if (params->len) {
+        signal = get_param(params, 0)->val_ul;
     }
 
     gdbserver_state.signal = gdb_signal_to_target(signal);
@@ -1615,27 +1597,27 @@ static void handle_cont_with_sig(GdbCmdContext *gdb_ctx, void *user_ctx)
     gdb_continue();
 }
 
-static void handle_set_thread(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_set_thread(GArray *params, void *user_ctx)
 {
     CPUState *cpu;
 
-    if (gdb_ctx->num_params != 2) {
+    if (params->len != 2) {
         put_packet("E22");
         return;
     }
 
-    if (gdb_ctx->params[1].thread_id.kind == GDB_READ_THREAD_ERR) {
+    if (get_param(params, 1)->thread_id.kind == GDB_READ_THREAD_ERR) {
         put_packet("E22");
         return;
     }
 
-    if (gdb_ctx->params[1].thread_id.kind != GDB_ONE_THREAD) {
+    if (get_param(params, 1)->thread_id.kind != GDB_ONE_THREAD) {
         put_packet("OK");
         return;
     }
 
-    cpu = gdb_get_cpu(gdb_ctx->params[1].thread_id.pid,
-                      gdb_ctx->params[1].thread_id.tid);
+    cpu = gdb_get_cpu(get_param(params, 1)->thread_id.pid,
+                      get_param(params, 1)->thread_id.tid);
     if (!cpu) {
         put_packet("E22");
         return;
@@ -1645,7 +1627,7 @@ static void handle_set_thread(GdbCmdContext *gdb_ctx, void *user_ctx)
      * Note: This command is deprecated and modern gdb's will be using the
      *       vCont command instead.
      */
-    switch (gdb_ctx->params[0].opcode) {
+    switch (get_param(params, 0)->opcode) {
     case 'c':
         gdbserver_state.c_cpu = cpu;
         put_packet("OK");
@@ -1660,18 +1642,18 @@ static void handle_set_thread(GdbCmdContext *gdb_ctx, void *user_ctx)
     }
 }
 
-static void handle_insert_bp(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_insert_bp(GArray *params, void *user_ctx)
 {
     int res;
 
-    if (gdb_ctx->num_params != 3) {
+    if (params->len != 3) {
         put_packet("E22");
         return;
     }
 
-    res = gdb_breakpoint_insert(gdb_ctx->params[0].val_ul,
-                                gdb_ctx->params[1].val_ull,
-                                gdb_ctx->params[2].val_ull);
+    res = gdb_breakpoint_insert(get_param(params, 0)->val_ul,
+                                get_param(params, 1)->val_ull,
+                                get_param(params, 2)->val_ull);
     if (res >= 0) {
         put_packet("OK");
         return;
@@ -1683,18 +1665,18 @@ static void handle_insert_bp(GdbCmdContext *gdb_ctx, void *user_ctx)
     put_packet("E22");
 }
 
-static void handle_remove_bp(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_remove_bp(GArray *params, void *user_ctx)
 {
     int res;
 
-    if (gdb_ctx->num_params != 3) {
+    if (params->len != 3) {
         put_packet("E22");
         return;
     }
 
-    res = gdb_breakpoint_remove(gdb_ctx->params[0].val_ul,
-                                gdb_ctx->params[1].val_ull,
-                                gdb_ctx->params[2].val_ull);
+    res = gdb_breakpoint_remove(get_param(params, 0)->val_ul,
+                                get_param(params, 1)->val_ull,
+                                get_param(params, 2)->val_ull);
     if (res >= 0) {
         put_packet("OK");
         return;
@@ -1717,7 +1699,7 @@ static void handle_remove_bp(GdbCmdContext *gdb_ctx, void *user_ctx)
  * the remote gdb to fallback to older methods.
  */
 
-static void handle_set_reg(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_set_reg(GArray *params, void *user_ctx)
 {
     int reg_size;
 
@@ -1726,19 +1708,19 @@ static void handle_set_reg(GdbCmdContext *gdb_ctx, void *user_ctx)
         return;
     }
 
-    if (gdb_ctx->num_params != 2) {
+    if (params->len != 2) {
         put_packet("E22");
         return;
     }
 
-    reg_size = strlen(gdb_ctx->params[1].data) / 2;
-    hextomem(gdbserver_state.mem_buf, gdb_ctx->params[1].data, reg_size);
+    reg_size = strlen(get_param(params, 1)->data) / 2;
+    hextomem(gdbserver_state.mem_buf, get_param(params, 1)->data, reg_size);
     gdb_write_register(gdbserver_state.g_cpu, gdbserver_state.mem_buf->data,
-                       gdb_ctx->params[0].val_ull);
+                       get_param(params, 0)->val_ull);
     put_packet("OK");
 }
 
-static void handle_get_reg(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_get_reg(GArray *params, void *user_ctx)
 {
     int reg_size;
 
@@ -1747,14 +1729,14 @@ static void handle_get_reg(GdbCmdContext *gdb_ctx, void *user_ctx)
         return;
     }
 
-    if (!gdb_ctx->num_params) {
+    if (!params->len) {
         put_packet("E14");
         return;
     }
 
     reg_size = gdb_read_register(gdbserver_state.g_cpu,
                                  gdbserver_state.mem_buf,
-                                 gdb_ctx->params[0].val_ull);
+                                 get_param(params, 0)->val_ull);
     if (!reg_size) {
         put_packet("E14");
         return;
@@ -1766,22 +1748,24 @@ static void handle_get_reg(GdbCmdContext *gdb_ctx, void *user_ctx)
     put_strbuf();
 }
 
-static void handle_write_mem(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_write_mem(GArray *params, void *user_ctx)
 {
-    if (gdb_ctx->num_params != 3) {
+    if (params->len != 3) {
         put_packet("E22");
         return;
     }
 
     /* hextomem() reads 2*len bytes */
-    if (gdb_ctx->params[1].val_ull > strlen(gdb_ctx->params[2].data) / 2) {
+    if (get_param(params, 1)->val_ull >
+        strlen(get_param(params, 2)->data) / 2) {
         put_packet("E22");
         return;
     }
 
-    hextomem(gdbserver_state.mem_buf, gdb_ctx->params[2].data,
-             gdb_ctx->params[1].val_ull);
-    if (target_memory_rw_debug(gdbserver_state.g_cpu, gdb_ctx->params[0].val_ull,
+    hextomem(gdbserver_state.mem_buf, get_param(params, 2)->data,
+             get_param(params, 1)->val_ull);
+    if (target_memory_rw_debug(gdbserver_state.g_cpu,
+                               get_param(params, 0)->val_ull,
                                gdbserver_state.mem_buf->data,
                                gdbserver_state.mem_buf->len, true)) {
         put_packet("E14");
@@ -1791,22 +1775,24 @@ static void handle_write_mem(GdbCmdContext *gdb_ctx, void *user_ctx)
     put_packet("OK");
 }
 
-static void handle_read_mem(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_read_mem(GArray *params, void *user_ctx)
 {
-    if (gdb_ctx->num_params != 2) {
+    if (params->len != 2) {
         put_packet("E22");
         return;
     }
 
     /* memtohex() doubles the required space */
-    if (gdb_ctx->params[1].val_ull > MAX_PACKET_LENGTH / 2) {
+    if (get_param(params, 1)->val_ull > MAX_PACKET_LENGTH / 2) {
         put_packet("E22");
         return;
     }
 
-    g_byte_array_set_size(gdbserver_state.mem_buf, gdb_ctx->params[1].val_ull);
+    g_byte_array_set_size(gdbserver_state.mem_buf,
+                          get_param(params, 1)->val_ull);
 
-    if (target_memory_rw_debug(gdbserver_state.g_cpu, gdb_ctx->params[0].val_ull,
+    if (target_memory_rw_debug(gdbserver_state.g_cpu,
+                               get_param(params, 0)->val_ull,
                                gdbserver_state.mem_buf->data,
                                gdbserver_state.mem_buf->len, false)) {
         put_packet("E14");
@@ -1818,19 +1804,19 @@ static void handle_read_mem(GdbCmdContext *gdb_ctx, void *user_ctx)
     put_strbuf();
 }
 
-static void handle_write_all_regs(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_write_all_regs(GArray *params, void *user_ctx)
 {
     target_ulong addr, len;
     uint8_t *registers;
     int reg_size;
 
-    if (!gdb_ctx->num_params) {
+    if (!params->len) {
         return;
     }
 
     cpu_synchronize_state(gdbserver_state.g_cpu);
-    len = strlen(gdb_ctx->params[0].data) / 2;
-    hextomem(gdbserver_state.mem_buf, gdb_ctx->params[0].data, len);
+    len = strlen(get_param(params, 0)->data) / 2;
+    hextomem(gdbserver_state.mem_buf, get_param(params, 0)->data, len);
     registers = gdbserver_state.mem_buf->data;
     for (addr = 0; addr < gdbserver_state.g_cpu->gdb_num_g_regs && len > 0;
          addr++) {
@@ -1841,7 +1827,7 @@ static void handle_write_all_regs(GdbCmdContext *gdb_ctx, void *user_ctx)
     put_packet("OK");
 }
 
-static void handle_read_all_regs(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_read_all_regs(GArray *params, void *user_ctx)
 {
     target_ulong addr, len;
 
@@ -1859,14 +1845,14 @@ static void handle_read_all_regs(GdbCmdContext *gdb_ctx, void *user_ctx)
     put_strbuf();
 }
 
-static void handle_file_io(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_file_io(GArray *params, void *user_ctx)
 {
-    if (gdb_ctx->num_params >= 1 && gdbserver_state.current_syscall_cb) {
+    if (params->len >= 1 && gdbserver_state.current_syscall_cb) {
         target_ulong ret, err;
 
-        ret = (target_ulong)gdb_ctx->params[0].val_ull;
-        if (gdb_ctx->num_params >= 2) {
-            err = (target_ulong)gdb_ctx->params[1].val_ull;
+        ret = (target_ulong)get_param(params, 0)->val_ull;
+        if (params->len >= 2) {
+            err = (target_ulong)get_param(params, 1)->val_ull;
         } else {
             err = 0;
         }
@@ -1874,7 +1860,7 @@ static void handle_file_io(GdbCmdContext *gdb_ctx, void *user_ctx)
         gdbserver_state.current_syscall_cb = NULL;
     }
 
-    if (gdb_ctx->num_params >= 3 && gdb_ctx->params[2].opcode == (uint8_t)'C') {
+    if (params->len >= 3 && get_param(params, 2)->opcode == (uint8_t)'C') {
         put_packet("T02");
         return;
     }
@@ -1882,23 +1868,23 @@ static void handle_file_io(GdbCmdContext *gdb_ctx, void *user_ctx)
     gdb_continue();
 }
 
-static void handle_step(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_step(GArray *params, void *user_ctx)
 {
-    if (gdb_ctx->num_params) {
-        gdb_set_cpu_pc((target_ulong)gdb_ctx->params[0].val_ull);
+    if (params->len) {
+        gdb_set_cpu_pc((target_ulong)get_param(params, 0)->val_ull);
     }
 
     cpu_single_step(gdbserver_state.c_cpu, get_sstep_flags());
     gdb_continue();
 }
 
-static void handle_backward(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_backward(GArray *params, void *user_ctx)
 {
     if (replay_mode != REPLAY_MODE_PLAY) {
         put_packet("E22");
     }
-    if (gdb_ctx->num_params == 1) {
-        switch (gdb_ctx->params[0].opcode) {
+    if (params->len == 1) {
+        switch (get_param(params, 0)->opcode) {
         case 's':
             if (replay_reverse_step()) {
                 gdb_continue();
@@ -1920,20 +1906,20 @@ static void handle_backward(GdbCmdContext *gdb_ctx, void *user_ctx)
     put_packet("");
 }
 
-static void handle_v_cont_query(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_v_cont_query(GArray *params, void *user_ctx)
 {
     put_packet("vCont;c;C;s;S");
 }
 
-static void handle_v_cont(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_v_cont(GArray *params, void *user_ctx)
 {
     int res;
 
-    if (!gdb_ctx->num_params) {
+    if (!params->len) {
         return;
     }
 
-    res = gdb_handle_vcont(gdb_ctx->params[0].data);
+    res = gdb_handle_vcont(get_param(params, 0)->data);
     if ((res == -EINVAL) || (res == -ERANGE)) {
         put_packet("E22");
     } else if (res) {
@@ -1941,17 +1927,17 @@ static void handle_v_cont(GdbCmdContext *gdb_ctx, void *user_ctx)
     }
 }
 
-static void handle_v_attach(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_v_attach(GArray *params, void *user_ctx)
 {
     GDBProcess *process;
     CPUState *cpu;
 
     g_string_assign(gdbserver_state.str_buf, "E22");
-    if (!gdb_ctx->num_params) {
+    if (!params->len) {
         goto cleanup;
     }
 
-    process = gdb_get_process(gdb_ctx->params[0].val_ul);
+    process = gdb_get_process(get_param(params, 0)->val_ul);
     if (!process) {
         goto cleanup;
     }
@@ -1972,7 +1958,7 @@ cleanup:
     put_strbuf();
 }
 
-static void handle_v_kill(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_v_kill(GArray *params, void *user_ctx)
 {
     /* Kill the target */
     put_packet("OK");
@@ -2007,43 +1993,43 @@ static const GdbCmdParseEntry gdb_v_commands_table[] = {
     },
 };
 
-static void handle_v_commands(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_v_commands(GArray *params, void *user_ctx)
 {
-    if (!gdb_ctx->num_params) {
+    if (!params->len) {
         return;
     }
 
-    if (process_string_cmd(NULL, gdb_ctx->params[0].data,
+    if (process_string_cmd(NULL, get_param(params, 0)->data,
                            gdb_v_commands_table,
                            ARRAY_SIZE(gdb_v_commands_table))) {
         put_packet("");
     }
 }
 
-static void handle_query_qemu_sstepbits(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_query_qemu_sstepbits(GArray *params, void *user_ctx)
 {
     g_string_printf(gdbserver_state.str_buf, "ENABLE=%x,NOIRQ=%x,NOTIMER=%x",
                     SSTEP_ENABLE, SSTEP_NOIRQ, SSTEP_NOTIMER);
     put_strbuf();
 }
 
-static void handle_set_qemu_sstep(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_set_qemu_sstep(GArray *params, void *user_ctx)
 {
-    if (!gdb_ctx->num_params) {
+    if (!params->len) {
         return;
     }
 
-    sstep_flags = gdb_ctx->params[0].val_ul;
+    sstep_flags = get_param(params, 0)->val_ul;
     put_packet("OK");
 }
 
-static void handle_query_qemu_sstep(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_query_qemu_sstep(GArray *params, void *user_ctx)
 {
     g_string_printf(gdbserver_state.str_buf, "0x%x", sstep_flags);
     put_strbuf();
 }
 
-static void handle_query_curr_tid(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_query_curr_tid(GArray *params, void *user_ctx)
 {
     CPUState *cpu;
     GDBProcess *process;
@@ -2060,7 +2046,7 @@ static void handle_query_curr_tid(GdbCmdContext *gdb_ctx, void *user_ctx)
     put_strbuf();
 }
 
-static void handle_query_threads(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_query_threads(GArray *params, void *user_ctx)
 {
     if (!gdbserver_state.query_cpu) {
         put_packet("l");
@@ -2073,25 +2059,25 @@ static void handle_query_threads(GdbCmdContext *gdb_ctx, void *user_ctx)
     gdbserver_state.query_cpu = gdb_next_attached_cpu(gdbserver_state.query_cpu);
 }
 
-static void handle_query_first_threads(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_query_first_threads(GArray *params, void *user_ctx)
 {
     gdbserver_state.query_cpu = gdb_first_attached_cpu();
-    handle_query_threads(gdb_ctx, user_ctx);
+    handle_query_threads(params, user_ctx);
 }
 
-static void handle_query_thread_extra(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_query_thread_extra(GArray *params, void *user_ctx)
 {
     g_autoptr(GString) rs = g_string_new(NULL);
     CPUState *cpu;
 
-    if (!gdb_ctx->num_params ||
-        gdb_ctx->params[0].thread_id.kind == GDB_READ_THREAD_ERR) {
+    if (!params->len ||
+        get_param(params, 0)->thread_id.kind == GDB_READ_THREAD_ERR) {
         put_packet("E22");
         return;
     }
 
-    cpu = gdb_get_cpu(gdb_ctx->params[0].thread_id.pid,
-                      gdb_ctx->params[0].thread_id.tid);
+    cpu = gdb_get_cpu(get_param(params, 0)->thread_id.pid,
+                      get_param(params, 0)->thread_id.tid);
     if (!cpu) {
         return;
     }
@@ -2116,7 +2102,7 @@ static void handle_query_thread_extra(GdbCmdContext *gdb_ctx, void *user_ctx)
 }
 
 #ifdef CONFIG_USER_ONLY
-static void handle_query_offsets(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_query_offsets(GArray *params, void *user_ctx)
 {
     TaskState *ts;
 
@@ -2131,17 +2117,17 @@ static void handle_query_offsets(GdbCmdContext *gdb_ctx, void *user_ctx)
     put_strbuf();
 }
 #else
-static void handle_query_rcmd(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_query_rcmd(GArray *params, void *user_ctx)
 {
     const guint8 zero = 0;
     int len;
 
-    if (!gdb_ctx->num_params) {
+    if (!params->len) {
         put_packet("E22");
         return;
     }
 
-    len = strlen(gdb_ctx->params[0].data);
+    len = strlen(get_param(params, 0)->data);
     if (len % 2) {
         put_packet("E01");
         return;
@@ -2149,7 +2135,7 @@ static void handle_query_rcmd(GdbCmdContext *gdb_ctx, void *user_ctx)
 
     g_assert(gdbserver_state.mem_buf->len == 0);
     len = len / 2;
-    hextomem(gdbserver_state.mem_buf, gdb_ctx->params[0].data, len);
+    hextomem(gdbserver_state.mem_buf, get_param(params, 0)->data, len);
     g_byte_array_append(gdbserver_state.mem_buf, &zero, 1);
     qemu_chr_be_write(gdbserver_state.mon_chr, gdbserver_state.mem_buf->data,
                       gdbserver_state.mem_buf->len);
@@ -2157,7 +2143,7 @@ static void handle_query_rcmd(GdbCmdContext *gdb_ctx, void *user_ctx)
 }
 #endif
 
-static void handle_query_supported(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_query_supported(GArray *params, void *user_ctx)
 {
     CPUClass *cc;
 
@@ -2178,8 +2164,8 @@ static void handle_query_supported(GdbCmdContext *gdb_ctx, void *user_ctx)
     }
 #endif
 
-    if (gdb_ctx->num_params &&
-        strstr(gdb_ctx->params[0].data, "multiprocess+")) {
+    if (params->len &&
+        strstr(get_param(params, 0)->data, "multiprocess+")) {
         gdbserver_state.multiprocess = true;
     }
 
@@ -2187,7 +2173,7 @@ static void handle_query_supported(GdbCmdContext *gdb_ctx, void *user_ctx)
     put_strbuf();
 }
 
-static void handle_query_xfer_features(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_query_xfer_features(GArray *params, void *user_ctx)
 {
     GDBProcess *process;
     CPUClass *cc;
@@ -2195,7 +2181,7 @@ static void handle_query_xfer_features(GdbCmdContext *gdb_ctx, void *user_ctx)
     const char *xml;
     const char *p;
 
-    if (gdb_ctx->num_params < 3) {
+    if (params->len < 3) {
         put_packet("E22");
         return;
     }
@@ -2208,15 +2194,15 @@ static void handle_query_xfer_features(GdbCmdContext *gdb_ctx, void *user_ctx)
     }
 
     gdb_has_xml = true;
-    p = gdb_ctx->params[0].data;
+    p = get_param(params, 0)->data;
     xml = get_feature_xml(p, &p, process);
     if (!xml) {
         put_packet("E00");
         return;
     }
 
-    addr = gdb_ctx->params[1].val_ul;
-    len = gdb_ctx->params[2].val_ul;
+    addr = get_param(params, 1)->val_ul;
+    len = get_param(params, 2)->val_ul;
     total_len = strlen(xml);
     if (addr > total_len) {
         put_packet("E00");
@@ -2240,18 +2226,18 @@ static void handle_query_xfer_features(GdbCmdContext *gdb_ctx, void *user_ctx)
 }
 
 #if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX_USER)
-static void handle_query_xfer_auxv(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_query_xfer_auxv(GArray *params, void *user_ctx)
 {
     TaskState *ts;
     unsigned long offset, len, saved_auxv, auxv_len;
 
-    if (gdb_ctx->num_params < 2) {
+    if (params->len < 2) {
         put_packet("E22");
         return;
     }
 
-    offset = gdb_ctx->params[0].val_ul;
-    len = gdb_ctx->params[1].val_ul;
+    offset = get_param(params, 0)->val_ul;
+    len = get_param(params, 1)->val_ul;
     ts = gdbserver_state.c_cpu->opaque;
     saved_auxv = ts->info->saved_auxv;
     auxv_len = ts->info->auxv_len;
@@ -2286,12 +2272,12 @@ static void handle_query_xfer_auxv(GdbCmdContext *gdb_ctx, void *user_ctx)
 }
 #endif
 
-static void handle_query_attached(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_query_attached(GArray *params, void *user_ctx)
 {
     put_packet(GDB_ATTACHED);
 }
 
-static void handle_query_qemu_supported(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_query_qemu_supported(GArray *params, void *user_ctx)
 {
     g_string_printf(gdbserver_state.str_buf, "sstepbits;sstep");
 #ifndef CONFIG_USER_ONLY
@@ -2301,21 +2287,21 @@ static void handle_query_qemu_supported(GdbCmdContext *gdb_ctx, void *user_ctx)
 }
 
 #ifndef CONFIG_USER_ONLY
-static void handle_query_qemu_phy_mem_mode(GdbCmdContext *gdb_ctx,
+static void handle_query_qemu_phy_mem_mode(GArray *params,
                                            void *user_ctx)
 {
     g_string_printf(gdbserver_state.str_buf, "%d", phy_memory_mode);
     put_strbuf();
 }
 
-static void handle_set_qemu_phy_mem_mode(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_set_qemu_phy_mem_mode(GArray *params, void *user_ctx)
 {
-    if (!gdb_ctx->num_params) {
+    if (!params->len) {
         put_packet("E22");
         return;
     }
 
-    if (!gdb_ctx->params[0].val_ul) {
+    if (!get_param(params, 0)->val_ul) {
         phy_memory_mode = 0;
     } else {
         phy_memory_mode = 1;
@@ -2438,45 +2424,45 @@ static const GdbCmdParseEntry gdb_gen_set_table[] = {
 #endif
 };
 
-static void handle_gen_query(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_gen_query(GArray *params, void *user_ctx)
 {
-    if (!gdb_ctx->num_params) {
+    if (!params->len) {
         return;
     }
 
-    if (!process_string_cmd(NULL, gdb_ctx->params[0].data,
+    if (!process_string_cmd(NULL, get_param(params, 0)->data,
                             gdb_gen_query_set_common_table,
                             ARRAY_SIZE(gdb_gen_query_set_common_table))) {
         return;
     }
 
-    if (process_string_cmd(NULL, gdb_ctx->params[0].data,
+    if (process_string_cmd(NULL, get_param(params, 0)->data,
                            gdb_gen_query_table,
                            ARRAY_SIZE(gdb_gen_query_table))) {
         put_packet("");
     }
 }
 
-static void handle_gen_set(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_gen_set(GArray *params, void *user_ctx)
 {
-    if (!gdb_ctx->num_params) {
+    if (!params->len) {
         return;
     }
 
-    if (!process_string_cmd(NULL, gdb_ctx->params[0].data,
+    if (!process_string_cmd(NULL, get_param(params, 0)->data,
                             gdb_gen_query_set_common_table,
                             ARRAY_SIZE(gdb_gen_query_set_common_table))) {
         return;
     }
 
-    if (process_string_cmd(NULL, gdb_ctx->params[0].data,
+    if (process_string_cmd(NULL, get_param(params, 0)->data,
                            gdb_gen_set_table,
                            ARRAY_SIZE(gdb_gen_set_table))) {
         put_packet("");
     }
 }
 
-static void handle_target_halt(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_target_halt(GArray *params, void *user_ctx)
 {
     g_string_printf(gdbserver_state.str_buf, "T%02xthread:", GDB_SIGNAL_TRAP);
     gdb_append_thread_id(gdbserver_state.c_cpu, gdbserver_state.str_buf);
-- 
2.20.1


