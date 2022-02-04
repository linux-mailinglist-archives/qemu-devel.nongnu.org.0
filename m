Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E89CF4AA191
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 22:07:03 +0100 (CET)
Received: from localhost ([::1]:41554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG5nL-0006vS-0r
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 16:07:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5W9-0008Af-Uh
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:49:18 -0500
Received: from [2a00:1450:4864:20::333] (port=54994
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5W7-00088v-QU
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:49:17 -0500
Received: by mail-wm1-x333.google.com with SMTP id c192so5358699wma.4
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 12:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JEfEtb4g9JFuRdRoJCsBM6RTHKvLT1onRYy1y1hxc1E=;
 b=a5oew5cPIgnaxJ6WOl++/JN8xWmGLaWelJSjkYiYkNaq0de3shdsIYQug9SUkGa08c
 diBNvjToWUp+CMOFiIPVsU67Xiya+TC9iH4Cb6Ej/Wyv6CjT7jppofRmoMCOuEKINqAl
 MsTDh5aDP446/F5f3F8/fqZ9ZtWUXQ2G1Y6xnLmnVMHgTkMFUY3DTn/vi1kANXl3S4oI
 Od1sbKrzWIsD4VyI+78xyAsJ5SBvwGgDDVfYdHgRi0fqLuomOVYPN0MLxnLesm8R2Pto
 syiYQxE3U4srLGXlCazDxdIeG6M9FZjXAUGFeg9/+ymr9mnWzhyS5lW9aaslxQlOsecU
 JYBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JEfEtb4g9JFuRdRoJCsBM6RTHKvLT1onRYy1y1hxc1E=;
 b=0X6wmcKLUomS83j8RQbr+hpsUWvVNYGJS0HcQ+WATudlBQsLrSESSxPcvDBnaDjfNP
 PBhLsGVStUVWaxxcosn43ZQTa1Tbj2tNhmhif8eNs9zZveH7XtnLhhQ+hcqMtaMVWy/D
 /OWFBylO3nHFPVP47vj3ApFPACGVLlQyDIa+sHh7VF7fsa7Qh3c2FaeN7CTu/dJsGRPD
 DGTy8teTa5G1bruzvLk0mbinxW1+50jiRQ1eXOVVa5KjnEd+ooMreRrwzf2gdh8Iq24y
 cOqqfvXXvCZIKFyEoGYgiowXxQCqIYLzwwk1h5np+tAj0dHz8Q//xYqUspI3Uc/eqOlo
 I2aw==
X-Gm-Message-State: AOAM531r1fc3ksj2hN2vXFHDIzussriDJHcTsO4nfXNGKbJOn4nyiG/p
 gdtus6O9HAyGkK8hfKLs5KZG5A==
X-Google-Smtp-Source: ABdhPJxmCRX+E6CYJ3od9q1dFS9vkY341JbIKP5+frHQrvj4rWWL0xPUmlmW3QEeboHD3hKDhKGEDg==
X-Received: by 2002:a05:600c:35d4:: with SMTP id
 r20mr3653316wmq.147.1644007754545; 
 Fri, 04 Feb 2022 12:49:14 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k20sm11928096wmi.36.2022.02.04.12.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 12:49:10 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9440B1FFCF;
 Fri,  4 Feb 2022 20:43:37 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 24/26] tests/plugins: add instruction matching to libinsn.so
Date: Fri,  4 Feb 2022 20:43:33 +0000
Message-Id: <20220204204335.1689602-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220204204335.1689602-1-alex.bennee@linaro.org>
References: <20220204204335.1689602-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, Luke.Craig@ll.mit.edu,
 kuhn.chenqun@huawei.com, Vasilev Oleg <vasilev.oleg@huawei.com>,
 f4bug@amsat.org, robhenry@microsoft.com, aaron@os.amperecomputing.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds simple instruction matching to the libinsn.so plugin which
is useful for examining the execution distance between instructions.
For example to track how often we flush in ARM due to TLB updates:

  -plugin ./tests/plugin/libinsn.so,match=tlbi

which leads to output like this:

  0xffffffc01019a918, 'tlbi vale1is, x1', 5702 hits, 31825 match hits, Δ+8112 since last match, 68859 avg insns/match
  0xffffffc01019a918, 'tlbi vale1is, x1', 5703 hits, 56593 match hits, Δ+17712125 since last match, 33455 avg insns/match
  0xffffffc01019a918, 'tlbi vale1is, x1', 5704 hits, 56594 match hits, Δ+12689 since last match, 33454 avg insns/match
  0xffffffc01019a918, 'tlbi vale1is, x1', 5705 hits, 56595 match hits, Δ+12585 since last match, 33454 avg insns/match
  0xffffffc01019a918, 'tlbi vale1is, x1', 5706 hits, 56596 match hits, Δ+10491 since last match, 33454 avg insns/match
  0xffffffc01019a918, 'tlbi vale1is, x1', 5707 hits, 56597 match hits, Δ+4721 since last match, 33453 avg insns/match
  0xffffffc01019a918, 'tlbi vale1is, x1', 5708 hits, 56598 match hits, Δ+10733 since last match, 33453 avg insns/match
  0xffffffc01019a918, 'tlbi vale1is, x1', 5709 hits, 56599 match hits, Δ+61959 since last match, 33453 avg insns/match
  0xffffffc01019a918, 'tlbi vale1is, x1', 5710 hits, 56600 match hits, Δ+55235 since last match, 33454 avg insns/match
  0xffffffc01019a918, 'tlbi vale1is, x1', 5711 hits, 56601 match hits, Δ+54373 since last match, 33454 avg insns/match
  0xffffffc01019a918, 'tlbi vale1is, x1', 5712 hits, 56602 match hits, Δ+2705 since last match, 33453 avg insns/match
  0xffffffc01019a918, 'tlbi vale1is, x1', 5713 hits, 56603 match hits, Δ+17262 since last match, 33453 avg insns/match
  0xffffffc01019a918, 'tlbi vale1is, x1', 5714 hits, 56604 match hits, Δ+17206 since last match, 33453 avg insns/match
  0xffffffc01019a918, 'tlbi vale1is, x1', 5715 hits, 56605 match hits, Δ+28940 since last match, 33453 avg insns/match
  0xffffffc01019a918, 'tlbi vale1is, x1', 5716 hits, 56606 match hits, Δ+7370 since last match, 33452 avg insns/match
  0xffffffc01019a918, 'tlbi vale1is, x1', 5717 hits, 56607 match hits, Δ+7066 since last match, 33452 avg insns/match

showing we do some sort of TLBI invalidation every 33 thousand
instructions.

Cc: Vasilev Oleg <vasilev.oleg@huawei.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Emilio Cota <cota@braap.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220124201608.604599-21-alex.bennee@linaro.org>

---
v2
  - quote disassembly
  - try and improve formatting
---
 tests/plugin/insn.c | 89 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 88 insertions(+), 1 deletion(-)

diff --git a/tests/plugin/insn.c b/tests/plugin/insn.c
index d5a0a08cb4..cd5ea5d4ae 100644
--- a/tests/plugin/insn.c
+++ b/tests/plugin/insn.c
@@ -28,9 +28,25 @@ static uint64_t inline_insn_count;
 
 static bool do_inline;
 static bool do_size;
-static bool do_frequency;
 static GArray *sizes;
 
+typedef struct {
+    char *match_string;
+    uint64_t hits[MAX_CPUS];
+    uint64_t last_hit[MAX_CPUS];
+    uint64_t total_delta[MAX_CPUS];
+    GPtrArray *history[MAX_CPUS];
+} Match;
+
+static GArray *matches;
+
+typedef struct {
+    Match *match;
+    uint64_t vaddr;
+    uint64_t hits;
+    char *disas;
+} Instruction;
+
 static void vcpu_insn_exec_before(unsigned int cpu_index, void *udata)
 {
     unsigned int i = cpu_index % MAX_CPUS;
@@ -45,6 +61,37 @@ static void vcpu_insn_exec_before(unsigned int cpu_index, void *udata)
     c->insn_count++;
 }
 
+static void vcpu_insn_matched_exec_before(unsigned int cpu_index, void *udata)
+{
+    unsigned int i = cpu_index % MAX_CPUS;
+    Instruction *insn = (Instruction *) udata;
+    Match *match = insn->match;
+    g_autoptr(GString) ts = g_string_new("");
+
+    insn->hits++;
+    g_string_append_printf(ts, "0x%" PRIx64 ", '%s', %"PRId64 " hits",
+                           insn->vaddr, insn->disas, insn->hits);
+
+    uint64_t icount = counts[i].insn_count;
+    uint64_t delta = icount - match->last_hit[i];
+
+    match->hits[i]++;
+    match->total_delta[i] += delta;
+
+    g_string_append_printf(ts,
+                           ", %"PRId64" match hits, "
+                           "Δ+%"PRId64 " since last match,"
+                           " %"PRId64 " avg insns/match\n",
+                           match->hits[i], delta,
+                           match->total_delta[i] / match->hits[i]);
+
+    match->last_hit[i] = icount;
+
+    qemu_plugin_outs(ts->str);
+
+    g_ptr_array_add(match->history[i], insn);
+}
+
 static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
 {
     size_t n = qemu_plugin_tb_n_insns(tb);
@@ -71,6 +118,29 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
             unsigned long *cnt = &g_array_index(sizes, unsigned long, sz);
             (*cnt)++;
         }
+
+        /*
+         * If we are tracking certain instructions we will need more
+         * information about the instruction which we also need to
+         * save if there is a hit.
+         */
+        if (matches) {
+            char *insn_disas = qemu_plugin_insn_disas(insn);
+            int j;
+            for (j = 0; j < matches->len; j++) {
+                Match *m = &g_array_index(matches, Match, j);
+                if (g_str_has_prefix(insn_disas, m->match_string)) {
+                    Instruction *rec = g_new0(Instruction, 1);
+                    rec->disas = g_strdup(insn_disas);
+                    rec->vaddr = qemu_plugin_insn_vaddr(insn);
+                    rec->match = m;
+                    qemu_plugin_register_vcpu_insn_exec_cb(
+                        insn, vcpu_insn_matched_exec_before,
+                        QEMU_PLUGIN_CB_NO_REGS, rec);
+                }
+            }
+            g_free(insn_disas);
+        }
     }
 }
 
@@ -105,6 +175,21 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
     qemu_plugin_outs(out->str);
 }
 
+
+/* Add a match to the array of matches */
+static void parse_match(char *match)
+{
+    Match new_match = { .match_string = match };
+    int i;
+    for (i = 0; i < MAX_CPUS; i++) {
+        new_match.history[i] = g_ptr_array_new();
+    }
+    if (!matches) {
+        matches = g_array_new(false, true, sizeof(Match));
+    }
+    g_array_append_val(matches, new_match);
+}
+
 QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
                                            const qemu_info_t *info,
                                            int argc, char **argv)
@@ -122,6 +207,8 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
                 fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
                 return -1;
             }
+        } else if (g_strcmp0(tokens[0], "match") == 0) {
+            parse_match(tokens[1]);
         } else {
             fprintf(stderr, "option parsing failed: %s\n", opt);
             return -1;
-- 
2.30.2


