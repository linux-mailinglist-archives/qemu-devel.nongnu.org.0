Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9834A66B6
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 21:58:07 +0100 (CET)
Received: from localhost ([::1]:34080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF0E2-0006Tj-0O
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 15:58:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExtp-0002eb-B1
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:29:06 -0500
Received: from [2a00:1450:4864:20::430] (port=34617
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExtn-0001fp-PO
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:29:05 -0500
Received: by mail-wr1-x430.google.com with SMTP id f17so33735597wrx.1
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LLRQf+EGiKb17sWi1iAuAKfuIJINjiQ+nmXe1hdPRTE=;
 b=kh1TMFQ6zXetHOCEPO4H7Dkh1BtqHIKUXOCEKtJobQx2p+B9T8gvT7x0Qhwfa7WuY8
 d2w6Rckn6istlNODQqG0JfrICtoYuQaHhaF4V3MnW5fDzsqgmOcqIZhNJZy8NAM7LlI8
 rUfFyfyVDXr9KlrsX/0E6Y9RayTNbhCwRAd6xIIKCmoBQ6ew/9ObCXJ7+C3bO3wmbP/K
 iptiEPE0pOxI0D+qNwjiCSpCXZVeD7Jp3ZLkgyJ2wHgRZ2Pw9K7eNvLCCJSKl1aTlWXB
 XcvBvV/MfomnHQqMB/L4qnnxN8J5Kvogpjw5mv5GZoRY3CBpIDwsZlhe+4RS9IpppuhL
 aTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LLRQf+EGiKb17sWi1iAuAKfuIJINjiQ+nmXe1hdPRTE=;
 b=aJv6PsGkCPfezLhxRcG1LyEhb/nH2hLaKosbiv5u4FsMEwhUd9Son8CI5IWgCNqQ+x
 BPZF+iTod1hYrtuu6OFPcouUiaaDma7lmg43Vt80qB1j3oqgGm8QJSHbspc45d8+CcEU
 a+fwm/YTGxiFGFaRN1kLIgSsn51vo+1c4DtoUQAg360QEA5DoGSU9S5Z3oGNqfDKNqvE
 Fa0FDiTh3y0lj4Scz3gCwKDqcJdKuFV/iKYjMyvseg0SJ3FMa5Z5nohWK80AjS2d9A1m
 tcOZC3u9YZm3FxFRkSQW7FZTwktVQ7Ownog9tMBfCbbhfSZpuKIC1cOeSRu94syr2Ozq
 FWkQ==
X-Gm-Message-State: AOAM533igYyHKv02u2TD3AmXnJBXsa30Ppw0SU3QuvZb5UiGUG6c4ISK
 wnDgN2Vx5sONrnqMPhJTvtgNog==
X-Google-Smtp-Source: ABdhPJxwStiajxw62nwanf61eTE6upWAj3eIHVHU7uXcsRm1JbiuGTGWKxONZwjfYahmYtueYOYI8w==
X-Received: by 2002:adf:dbcb:: with SMTP id e11mr22195928wrj.175.1643740141117; 
 Tue, 01 Feb 2022 10:29:01 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a14sm18934359wri.25.2022.02.01.10.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 10:28:59 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D4E5B1FFCD;
 Tue,  1 Feb 2022 18:20:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 22/25] tests/plugin: allow libinsn.so per-CPU counts
Date: Tue,  1 Feb 2022 18:20:47 +0000
Message-Id: <20220201182050.15087-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220201182050.15087-1-alex.bennee@linaro.org>
References: <20220201182050.15087-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 aaron@os.amperecomputing.com, robhenry@microsoft.com, f4bug@amsat.org,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Luke.Craig@ll.mit.edu, pbonzini@redhat.com, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We won't go fully flexible but for most system emulation 8 vCPUs
resolution should be enough for anybody ;-)

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220124201608.604599-20-alex.bennee@linaro.org>
---
 tests/plugin/insn.c | 39 +++++++++++++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/tests/plugin/insn.c b/tests/plugin/insn.c
index d229fdc001..d5a0a08cb4 100644
--- a/tests/plugin/insn.c
+++ b/tests/plugin/insn.c
@@ -16,22 +16,33 @@
 
 QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
 
-static uint64_t insn_count;
+#define MAX_CPUS 8 /* lets not go nuts */
+
+typedef struct {
+    uint64_t last_pc;
+    uint64_t insn_count;
+} InstructionCount;
+
+static InstructionCount counts[MAX_CPUS];
+static uint64_t inline_insn_count;
+
 static bool do_inline;
 static bool do_size;
+static bool do_frequency;
 static GArray *sizes;
 
 static void vcpu_insn_exec_before(unsigned int cpu_index, void *udata)
 {
-    static uint64_t last_pc;
+    unsigned int i = cpu_index % MAX_CPUS;
+    InstructionCount *c = &counts[i];
     uint64_t this_pc = GPOINTER_TO_UINT(udata);
-    if (this_pc == last_pc) {
+    if (this_pc == c->last_pc) {
         g_autofree gchar *out = g_strdup_printf("detected repeat execution @ 0x%"
                                                 PRIx64 "\n", this_pc);
         qemu_plugin_outs(out);
     }
-    last_pc = this_pc;
-    insn_count++;
+    c->last_pc = this_pc;
+    c->insn_count++;
 }
 
 static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
@@ -44,7 +55,7 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
 
         if (do_inline) {
             qemu_plugin_register_vcpu_insn_exec_inline(
-                insn, QEMU_PLUGIN_INLINE_ADD_U64, &insn_count, 1);
+                insn, QEMU_PLUGIN_INLINE_ADD_U64, &inline_insn_count, 1);
         } else {
             uint64_t vaddr = qemu_plugin_insn_vaddr(insn);
             qemu_plugin_register_vcpu_insn_exec_cb(
@@ -66,9 +77,9 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
 static void plugin_exit(qemu_plugin_id_t id, void *p)
 {
     g_autoptr(GString) out = g_string_new(NULL);
+    int i;
 
     if (do_size) {
-        int i;
         for (i = 0; i <= sizes->len; i++) {
             unsigned long *cnt = &g_array_index(sizes, unsigned long, i);
             if (*cnt) {
@@ -76,8 +87,20 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
                                        "len %d bytes: %ld insns\n", i, *cnt);
             }
         }
+    } else if (do_inline) {
+        g_string_append_printf(out, "insns: %" PRIu64 "\n", inline_insn_count);
     } else {
-        g_string_append_printf(out, "insns: %" PRIu64 "\n", insn_count);
+        uint64_t total_insns = 0;
+        for (i = 0; i < MAX_CPUS; i++) {
+            InstructionCount *c = &counts[i];
+            if (c->insn_count) {
+                g_string_append_printf(out, "cpu %d insns: %" PRIu64 "\n",
+                                       i, c->insn_count);
+                total_insns += c->insn_count;
+            }
+        }
+        g_string_append_printf(out, "total insns: %" PRIu64 "\n",
+                               total_insns);
     }
     qemu_plugin_outs(out->str);
 }
-- 
2.30.2


