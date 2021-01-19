Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BFC2FC015
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 20:35:55 +0100 (CET)
Received: from localhost ([::1]:37898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1wnC-0001Hz-V5
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 14:35:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1vq0-0002oD-5f
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:34:44 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:33024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1vpx-0001Gh-TP
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:34:43 -0500
Received: by mail-pj1-x1032.google.com with SMTP id lw17so1807767pjb.0
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 10:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zOwDuzEJMzDZCUyUS+fhCAa4pwhGVLCD5TGZAxSX0pU=;
 b=rzOUb5ZF/eVr/EnXqI9R72RKraBsGeZqOyoR/rU9u2X8ly60Q9BAnoyHgml96LeAIt
 lBDiwsL9OOD1U/UuUAseHZRwSq4Aqd9wo9vgjngsDoffnIRtsoVZEOEVCUR0dmeELEYp
 AtN0+8p+5GACoNhThUBy+a2ygZ8vnQSCTAFxWijvsbTI8I1Um4Z9Ndl+mlhzt7As/ZNS
 pkmGXT7b6oZR1lcy5whsiVWFQ07q5GK0kow0DMbjZI6wdec+vpBe/9uQU3Qlkmx0pcvh
 w44aHeBAtWytcKPjeF9xWsl5RduY1eneQ1Md4ZtH4avSIGFJ+Bkppt9MgGrv3MG6+IXU
 5JcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zOwDuzEJMzDZCUyUS+fhCAa4pwhGVLCD5TGZAxSX0pU=;
 b=iTLZeJmGb2280U7YB9dFzZpzDt9mlvFOEIu2GjFqQpUY2GnuE6+AIMPhDwA4eFu/Wa
 pxJC8IjewbJ05/iKIa6KYhkRNna7JxOYmLQ9SMjamSFSGB+XzXGlMYqvZ6Q0Zyc8jlbf
 uqlh7BLEJY3A7j9qXEc8U/VKWW2gZ2YD9Vwgt5bRlSkU4MUtRaZCqUXiQT1qsWdifm7h
 sc3Wdr81bU1DzXnRnUYI5ILCiTOj4W/sly2EX/dYjulo9R9dNBoy2YEWWbgPCWyBSzGY
 Q+E47CIVwzInVcJUTe8gA5fnDc5OOiKLjngq/P9HxUSvuHuplHQYae7bmErHIpnJgwIQ
 w9Eg==
X-Gm-Message-State: AOAM532YhYVh4xw5FdNhxw9UgmTlLdAWtkxwHXS/jnCYJ+fcA+qgD+Ab
 bQ92xOpey385HOpSWvP27OcxQW06CYV6aA==
X-Google-Smtp-Source: ABdhPJw9yoU5YlYF41miGrl9hFEQV05YtavaRu2k31e7V5sNcp8q9LjMU2UM5pbP9GnHp4UfDnDYRA==
X-Received: by 2002:a17:90a:2e88:: with SMTP id
 r8mr1151552pjd.84.1611081280372; 
 Tue, 19 Jan 2021 10:34:40 -0800 (PST)
Received: from localhost.localdomain (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id a136sm20651359pfd.149.2021.01.19.10.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 10:34:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] tcg: Dynamically allocate temporaries
Date: Tue, 19 Jan 2021 08:34:28 -1000
Message-Id: <20210119183428.556706-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210119183428.556706-1-richard.henderson@linaro.org>
References: <20210119183428.556706-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: lvivier@redhat.com, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The caching of constant temps has resulted in a larger overall usage,
overflowing the statically allocated array.  Instead, allocate temps
as needed, placing pointers to the allocated temps into a GPtrArray
for later indexing.

Buglink: https://bugs.launchpad.net/bugs/1912065
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h |  6 ++--
 tcg/tcg.c         | 74 +++++++++++++++++++++++++++++------------------
 2 files changed, 49 insertions(+), 31 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 996addd90c..1da3bce0c8 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -275,7 +275,7 @@ typedef struct TCGPool {
 
 #define TCG_POOL_CHUNK_SIZE 32768
 
-#define TCG_MAX_TEMPS 512
+#define TCG_INIT_TEMPS 512
 #define TCG_MAX_INSNS 512
 
 /* when the size of the arguments of a called function is smaller than
@@ -696,7 +696,7 @@ struct TCGContext {
 
     GHashTable *const_table[TCG_TYPE_COUNT];
     TCGTempSet free_temps[TCG_TYPE_COUNT * 2];
-    TCGTemp temps[TCG_MAX_TEMPS]; /* globals first, temps after */
+    GPtrArray *temps; /* globals first, temps after */
 
     QTAILQ_HEAD(, TCGOp) ops, free_ops;
     QSIMPLEQ_HEAD(, TCGLabel) labels;
@@ -749,7 +749,7 @@ static inline void *tcg_splitwx_to_rw(const void *rx)
 static inline TCGTemp *tcg_temp(TCGContext *s, size_t idx)
 {
     tcg_debug_assert(idx < s->nb_temps);
-    return &s->temps[idx];
+    return g_ptr_array_index(s->temps, idx);
 }
 
 static inline size_t temp_idx(TCGTemp *ts)
diff --git a/tcg/tcg.c b/tcg/tcg.c
index a505457cee..5ca6860107 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -816,19 +816,24 @@ void tcg_register_thread(void)
 void tcg_register_thread(void)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
-    TCGContext *s = g_malloc(sizeof(*s));
-    unsigned int i, n;
+    TCGContext *s = g_memdup(&tcg_init_ctx, sizeof(*s));
+    unsigned int i, n = tcg_init_ctx.nb_globals;
+    TCGTemp *glob;
     bool err;
 
-    *s = tcg_init_ctx;
-
-    /* Relink mem_base.  */
-    for (i = 0, n = tcg_init_ctx.nb_globals; i < n; ++i) {
+    /* Copy the globals. */
+    s->temps = g_ptr_array_sized_new(TCG_INIT_TEMPS);
+    glob = g_new(TCGTemp, n);
+    for (i = 0; i < n; ++i) {
         TCGTemp *its = tcg_temp(&tcg_init_ctx, i);
+        TCGTemp *ots = glob + i;
+
+        *ots = *its;
         if (its->mem_base) {
-            TCGTemp *ots = tcg_temp(s, i);
-            ots->mem_base = tcg_temp(s, temp_idx(its->mem_base));
+            /* Relink mem_base. */
+            ots->mem_base = glob + temp_idx(its->mem_base);
         }
+        g_ptr_array_add(s->temps, ots);
     }
 
     /* Claim an entry in tcg_ctxs */
@@ -986,11 +991,11 @@ void tcg_context_init(TCGContext *s)
 
     memset(s, 0, sizeof(*s));
     s->nb_globals = 0;
+    s->temps = g_ptr_array_sized_new(TCG_INIT_TEMPS);
 
-    /* Count total number of arguments and allocate the corresponding
-       space */
+    /* Count total number of arguments and allocate the corresponding space */
     total_args = 0;
-    for(op = 0; op < NB_OPS; op++) {
+    for (op = 0; op < NB_OPS; op++) {
         def = &tcg_op_defs[op];
         n = def->nb_iargs + def->nb_oargs;
         total_args += n;
@@ -998,7 +1003,7 @@ void tcg_context_init(TCGContext *s)
 
     args_ct = g_new0(TCGArgConstraint, total_args);
 
-    for(op = 0; op < NB_OPS; op++) {
+    for (op = 0; op < NB_OPS; op++) {
         def = &tcg_op_defs[op];
         def->args_ct = args_ct;
         n = def->nb_iargs + def->nb_oargs;
@@ -1179,11 +1184,13 @@ void tcg_prologue_init(TCGContext *s)
 void tcg_func_start(TCGContext *s)
 {
     tcg_pool_reset(s);
+
     s->nb_temps = s->nb_globals;
+    g_ptr_array_set_size(s->temps, s->nb_globals);
 
     /* No temps have been previously allocated for size or locality.  */
     for (int i = 0; i < ARRAY_SIZE(s->free_temps); ++i) {
-        tempset_init(&s->free_temps[i], TCG_MAX_TEMPS);
+        tempset_init(&s->free_temps[i], TCG_INIT_TEMPS);
     }
 
     /* No constant temps have been previously allocated. */
@@ -1208,27 +1215,40 @@ void tcg_func_start(TCGContext *s)
 
 static TCGTemp *tcg_temp_alloc(TCGContext *s)
 {
-    int n = s->nb_temps++;
     TCGTemp *ret;
+    int n = s->nb_temps;
 
-    tcg_debug_assert(n < TCG_MAX_TEMPS);
-    ret = &s->temps[n];
+    /* Note that TCGTemp.index is 16 bits. */
+    tcg_debug_assert(n <= UINT16_MAX);
+    s->nb_temps = n + 1;
+
+    /* Non-global temps are allocated from the pool. */
+    ret = tcg_malloc(sizeof(TCGTemp));
     memset(ret, 0, sizeof(TCGTemp));
     ret->index = n;
 
+    g_ptr_array_add(s->temps, ret);
     return ret;
 }
 
-static inline TCGTemp *tcg_global_alloc(TCGContext *s)
+static TCGTemp *tcg_global_alloc(TCGContext *s)
 {
-    TCGTemp *ts;
+    TCGTemp *ret;
+    int n = s->nb_globals;
 
+    /* Note that TCGTemp.index is 16 bits. */
+    tcg_debug_assert(n <= UINT16_MAX);
     tcg_debug_assert(s->nb_globals == s->nb_temps);
-    s->nb_globals++;
-    ts = tcg_temp_alloc(s);
-    ts->kind = TEMP_GLOBAL;
+    s->nb_globals = n + 1;
+    s->nb_temps = n + 1;
 
-    return ts;
+    /* Global temps are allocated from the main heap and live forever. */
+    ret = g_new0(TCGTemp, 1);
+    ret->index = n;
+    ret->kind = TEMP_GLOBAL;
+
+    g_ptr_array_add(s->temps, ret);
+    return ret;
 }
 
 static TCGTemp *tcg_global_reg_new_internal(TCGContext *s, TCGType type,
@@ -1236,9 +1256,7 @@ static TCGTemp *tcg_global_reg_new_internal(TCGContext *s, TCGType type,
 {
     TCGTemp *ts;
 
-    if (TCG_TARGET_REG_BITS == 32 && type != TCG_TYPE_I32) {
-        tcg_abort();
-    }
+    tcg_debug_assert(TCG_TARGET_REG_BITS != 32 || type == TCG_TYPE_I32);
 
     ts = tcg_global_alloc(s);
     ts->base_type = type;
@@ -1299,7 +1317,7 @@ TCGTemp *tcg_global_mem_new_internal(TCGType type, TCGv_ptr base,
         pstrcat(buf, sizeof(buf), "_0");
         ts->name = strdup(buf);
 
-        tcg_debug_assert(ts2 == ts + 1);
+        tcg_debug_assert(temp_idx(ts2) == temp_idx(ts) + 1);
         ts2->base_type = TCG_TYPE_I64;
         ts2->type = TCG_TYPE_I32;
         ts2->indirect_reg = indirect_reg;
@@ -1347,7 +1365,7 @@ TCGTemp *tcg_temp_new_internal(TCGType type, bool temp_local)
             ts->temp_allocated = 1;
             ts->kind = kind;
 
-            tcg_debug_assert(ts2 == ts + 1);
+            tcg_debug_assert(temp_idx(ts2) == temp_idx(ts) + 1);
             ts2->base_type = TCG_TYPE_I64;
             ts2->type = TCG_TYPE_I32;
             ts2->temp_allocated = 1;
@@ -1456,7 +1474,7 @@ TCGTemp *tcg_constant_internal(TCGType type, int64_t val)
              */
             ts->val = val;
 
-            tcg_debug_assert(ts2 == ts + 1);
+            tcg_debug_assert(temp_idx(ts2) == temp_idx(ts) + 1);
             ts2->base_type = TCG_TYPE_I64;
             ts2->type = TCG_TYPE_I32;
             ts2->kind = TEMP_CONST;
-- 
2.25.1


