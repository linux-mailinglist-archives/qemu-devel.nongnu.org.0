Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F432FBFC4
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 20:16:48 +0100 (CET)
Received: from localhost ([::1]:57616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1wUh-0001dE-Rm
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 14:16:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1vpw-0002gK-K5
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:34:40 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:46236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1vpu-0001GA-IV
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:34:40 -0500
Received: by mail-pg1-x52c.google.com with SMTP id c22so13447746pgg.13
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 10:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zocLtIhc1566xSbUUG3fVWgPSfFwYEU16pDGR5baprU=;
 b=CUbXQvskoLgMtVjz9NeSFfUaOm7HyNG1AvGIPFigdXfCJkY8D1HgMmUNfZ8lAbmZzY
 eNAStYP7Q4csk0cSG27nR8zgME4rVDtVcZSA/RtXpFLOhNlYRbqKPGiobTiNynpDuZTI
 /4QIGw0LOtcX0qKuT7nWMpqaD+akxb+9NVguw4VRI4GcvZepMqX9G4issv6RDtsDa2ch
 kL6u/2GVBm6MvUisDUjfHy0nyu4x/QSZ8R+F4s4iDKirEEodPc1s6W5s2QL0wC7EmK3B
 SrAw44IXkriC+Xmg/Q4L5agaYJM9Ehzh5e0wcLAJFNCZBosTw4Sq3bcqpF4+3q4+VUss
 xfdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zocLtIhc1566xSbUUG3fVWgPSfFwYEU16pDGR5baprU=;
 b=Y2oUNlnaRwvMz8LpiLaF7FBeBmihEtVPaor+3y9Xc6aoyvlWl79xd2xCHYXWyQFTvA
 i9ueXLWA2n5YbqfJ65yTZaRi3puwApjMNhpRDmyCs0bLy53MSifzhG10v3A/nB6winUv
 BlrH8L5sFHZuhiIl2W2c6RC3Z859EiDp0i0yVUFH944TZ60uuoMwahWsqDBm+6AIiww7
 0dfZIPbP03GRyhY2X1zeKWj0Crbxq1dcSX4ZWFyj6ppZr1roG1VvZr/oMM60AWIiMKGG
 QxFBJ39R2PvYTqWWHs+c9h/nTCMtgRv0mg712eKOsupRdscWbqySHKRYH3NYNhyjvaMK
 6zRg==
X-Gm-Message-State: AOAM533QSReAhh7gqq46zx64rB9h7q8JQTHPxCLwSGWMpX41Gc91Usuk
 +hzIuBZSbb/OwSkeh9mZGKB9mKXuDS7Czg==
X-Google-Smtp-Source: ABdhPJwWXMl9xBuRlY3xjo9yFV6STgaX8ZJC0CEBymUjpdkqiBU17rKO9FZ5NoTn5trlu2V71cJyRQ==
X-Received: by 2002:a62:7fc1:0:b029:19f:1dab:5029 with SMTP id
 a184-20020a627fc10000b029019f1dab5029mr5324708pfd.13.1611081277012; 
 Tue, 19 Jan 2021 10:34:37 -0800 (PST)
Received: from localhost.localdomain (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id a136sm20651359pfd.149.2021.01.19.10.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 10:34:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] tcg: Make TCGTempSet expandable
Date: Tue, 19 Jan 2021 08:34:26 -1000
Message-Id: <20210119183428.556706-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210119183428.556706-1-richard.henderson@linaro.org>
References: <20210119183428.556706-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

Introduce a complete set of operations on TCGTempSet,
and do not directly call <qemu/bitops.h> functions.
Expand the array as necessary on SET.  Use the tcg
allocation pool so that we do not have to worry about
explicitly freeing the array.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 28 +++++++++++++++++++++++++-
 tcg/optimize.c    | 18 ++++++++---------
 tcg/tcg.c         | 51 ++++++++++++++++++++++++++++++++++++++++-------
 3 files changed, 80 insertions(+), 17 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 0d90701dcd..4d001fed39 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -524,9 +524,35 @@ typedef struct TCGTemp {
 typedef struct TCGContext TCGContext;
 
 typedef struct TCGTempSet {
-    unsigned long l[BITS_TO_LONGS(TCG_MAX_TEMPS)];
+    unsigned long *data;
+    size_t word_len;
 } TCGTempSet;
 
+void tempset_init(TCGTempSet *set, size_t len);
+bool tempset_find_first(const TCGTempSet *set, size_t *i);
+void tempset_set(TCGTempSet *set, size_t i);
+
+static inline void tempset_clear_all(TCGTempSet *set)
+{
+    memset(set->data, 0, set->word_len * sizeof(unsigned long));
+}
+
+static inline void tempset_clear(TCGTempSet *set, size_t i)
+{
+    size_t l = i / BITS_PER_LONG;
+    size_t b = i % BITS_PER_LONG;
+    if (likely(l < set->word_len)) {
+        set->data[l] &= ~BIT(b);
+    }
+}
+
+static inline bool tempset_test(const TCGTempSet *set, size_t i)
+{
+    size_t l = i / BITS_PER_LONG;
+    size_t b = i % BITS_PER_LONG;
+    return l < set->word_len && (set->data[l] & BIT(b));
+}
+
 /* While we limit helpers to 6 arguments, for 32-bit hosts, with padding,
    this imples a max of 6*2 (64-bit in) + 2 (64-bit out) = 14 operands.
    There are never more than 2 outputs, which means that we can store all
diff --git a/tcg/optimize.c b/tcg/optimize.c
index 2aa491605e..b0ecef1fb6 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -94,10 +94,10 @@ static void init_ts_info(TCGTempSet *temps_used, TCGTemp *ts)
     size_t idx = temp_idx(ts);
     TempOptInfo *ti;
 
-    if (test_bit(idx, temps_used->l)) {
+    if (tempset_test(temps_used, idx)) {
         return;
     }
-    set_bit(idx, temps_used->l);
+    tempset_set(temps_used, idx);
 
     ti = ts->state_ptr;
     if (ti == NULL) {
@@ -612,7 +612,7 @@ void tcg_optimize(TCGContext *s)
     nb_temps = s->nb_temps;
     nb_globals = s->nb_globals;
 
-    memset(&temps_used, 0, sizeof(temps_used));
+    tempset_init(&temps_used, nb_temps);
     for (i = 0; i < nb_temps; ++i) {
         TCGTemp *ts = tcg_temp(s, i);
         ts->state_ptr = NULL;
@@ -1254,7 +1254,7 @@ void tcg_optimize(TCGContext *s)
                                            op->args[1], op->args[2]);
             if (tmp != 2) {
                 if (tmp) {
-                    memset(&temps_used, 0, sizeof(temps_used));
+                    tempset_clear_all(&temps_used);
                     op->opc = INDEX_op_br;
                     op->args[0] = op->args[3];
                 } else {
@@ -1338,7 +1338,7 @@ void tcg_optimize(TCGContext *s)
             if (tmp != 2) {
                 if (tmp) {
             do_brcond_true:
-                    memset(&temps_used, 0, sizeof(temps_used));
+                    tempset_clear_all(&temps_used);
                     op->opc = INDEX_op_br;
                     op->args[0] = op->args[5];
                 } else {
@@ -1354,7 +1354,7 @@ void tcg_optimize(TCGContext *s)
                 /* Simplify LT/GE comparisons vs zero to a single compare
                    vs the high word of the input.  */
             do_brcond_high:
-                memset(&temps_used, 0, sizeof(temps_used));
+                tempset_clear_all(&temps_used);
                 op->opc = INDEX_op_brcond_i32;
                 op->args[0] = op->args[1];
                 op->args[1] = op->args[3];
@@ -1380,7 +1380,7 @@ void tcg_optimize(TCGContext *s)
                     goto do_default;
                 }
             do_brcond_low:
-                memset(&temps_used, 0, sizeof(temps_used));
+                tempset_clear_all(&temps_used);
                 op->opc = INDEX_op_brcond_i32;
                 op->args[1] = op->args[2];
                 op->args[2] = op->args[4];
@@ -1485,7 +1485,7 @@ void tcg_optimize(TCGContext *s)
             if (!(op->args[nb_oargs + nb_iargs + 1]
                   & (TCG_CALL_NO_READ_GLOBALS | TCG_CALL_NO_WRITE_GLOBALS))) {
                 for (i = 0; i < nb_globals; i++) {
-                    if (test_bit(i, temps_used.l)) {
+                    if (tempset_test(&temps_used, i)) {
                         reset_ts(tcg_temp(s, i));
                     }
                 }
@@ -1500,7 +1500,7 @@ void tcg_optimize(TCGContext *s)
                block, otherwise we only trash the output args.  "mask" is
                the non-zero bits mask for the first output arg.  */
             if (def->flags & TCG_OPF_BB_END) {
-                memset(&temps_used, 0, sizeof(temps_used));
+                tempset_clear_all(&temps_used);
             } else {
         do_reset_output:
                 for (i = 0; i < nb_oargs; i++) {
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 7284209cff..a505457cee 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1182,7 +1182,9 @@ void tcg_func_start(TCGContext *s)
     s->nb_temps = s->nb_globals;
 
     /* No temps have been previously allocated for size or locality.  */
-    memset(s->free_temps, 0, sizeof(s->free_temps));
+    for (int i = 0; i < ARRAY_SIZE(s->free_temps); ++i) {
+        tempset_init(&s->free_temps[i], TCG_MAX_TEMPS);
+    }
 
     /* No constant temps have been previously allocated. */
     for (int i = 0; i < TCG_TYPE_COUNT; ++i) {
@@ -1324,13 +1326,12 @@ TCGTemp *tcg_temp_new_internal(TCGType type, bool temp_local)
     TCGContext *s = tcg_ctx;
     TCGTempKind kind = temp_local ? TEMP_LOCAL : TEMP_NORMAL;
     TCGTemp *ts;
-    int idx, k;
+    size_t idx, k;
 
     k = type + (temp_local ? TCG_TYPE_COUNT : 0);
-    idx = find_first_bit(s->free_temps[k].l, TCG_MAX_TEMPS);
-    if (idx < TCG_MAX_TEMPS) {
+    if (tempset_find_first(&s->free_temps[k], &idx)) {
         /* There is already an available temp with the right type.  */
-        clear_bit(idx, s->free_temps[k].l);
+        tempset_clear(&s->free_temps[k], idx);
 
         ts = tcg_temp(s, idx);
         ts->temp_allocated = 1;
@@ -1403,7 +1404,7 @@ TCGv_vec tcg_temp_new_vec_matching(TCGv_vec match)
 void tcg_temp_free_internal(TCGTemp *ts)
 {
     TCGContext *s = tcg_ctx;
-    int k, idx;
+    size_t k, idx;
 
     /* In order to simplify users of tcg_constant_*, silently ignore free. */
     if (ts->kind == TEMP_CONST) {
@@ -1423,7 +1424,7 @@ void tcg_temp_free_internal(TCGTemp *ts)
 
     idx = temp_idx(ts);
     k = ts->base_type + (ts->kind == TEMP_NORMAL ? 0 : TCG_TYPE_COUNT);
-    set_bit(idx, s->free_temps[k].l);
+    tempset_set(&s->free_temps[k], idx);
 }
 
 TCGTemp *tcg_constant_internal(TCGType type, int64_t val)
@@ -4665,6 +4666,42 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
     return tcg_current_code_size(s);
 }
 
+void tempset_init(TCGTempSet *set, size_t len)
+{
+    size_t word_len = BITS_TO_LONGS(len);
+
+    set->word_len = word_len;
+    set->data = tcg_malloc(word_len * sizeof(unsigned long));
+    memset(set->data, 0, word_len * sizeof(unsigned long));
+}
+
+void tempset_set(TCGTempSet *set, size_t i)
+{
+    size_t l = i / BITS_PER_LONG;
+    size_t b = i % BITS_PER_LONG;
+
+    if (l >= set->word_len) {
+        size_t old_blen = set->word_len * sizeof(unsigned long);
+        size_t new_wlen = set->word_len * 2;
+        unsigned long *new_data = tcg_malloc(old_blen * 2);
+
+        memcpy(new_data, set->data, old_blen);
+        memset((char *)new_data + old_blen, 0, old_blen);
+
+        set->data = new_data;
+        set->word_len = new_wlen;
+    }
+    set->data[l] |= BIT(b);
+}
+
+bool tempset_find_first(const TCGTempSet *set, size_t *i)
+{
+    size_t max = set->word_len * BITS_PER_LONG;
+    size_t ret = find_first_bit(set->data, max);
+    *i = ret;
+    return ret < max;
+}
+
 #ifdef CONFIG_PROFILER
 void tcg_dump_info(void)
 {
-- 
2.25.1


