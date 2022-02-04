Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C33CF4AA17F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 21:59:59 +0100 (CET)
Received: from localhost ([::1]:59070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG5gU-0007fL-SI
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 15:59:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5WY-00004q-B4
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:49:42 -0500
Received: from [2a00:1450:4864:20::433] (port=44659
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5WN-0008A8-HV
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:49:42 -0500
Received: by mail-wr1-x433.google.com with SMTP id k18so13422900wrg.11
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 12:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LLRQf+EGiKb17sWi1iAuAKfuIJINjiQ+nmXe1hdPRTE=;
 b=VRVByL+d/k68NmkgxLc8pLyACmxVuBDNdJ4EdI+LKnr8WiP+t/UikQs0vjgb2E8oZ7
 zr9YCJKAIFfF9HRGxlUXiyqcDgkqP6p3pUCSMq1tAwqcrQifujdk8+qIICaieSTegP2y
 zQS6pEu7iFTARr+ii8662Kgvf+d8a87uQa/TZVuHPJGEH5853THzSzt5gN6yT3eXuZfy
 +cxWKv4mo0ERhfYzvsyTTjya/JuODX78Y46bDL1QXjy2Y4Jg3r5IFSD29UdXcaN2KQi8
 Rh4sK0VuOKF7fHMlUlHNuaoLcErZopvudCqWO/fG5S6ZxnaaEAQ8eHV0eKKSzQKpamn+
 KXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LLRQf+EGiKb17sWi1iAuAKfuIJINjiQ+nmXe1hdPRTE=;
 b=v3jDkIe/TtvZKlb7+KwwFGUoar/eDe7+ZuzADUvwIJzZn65E3b6DnqrreC1ThCAar6
 RTluMX3nvAZd8kkLl6je0Y3KIPGFPOb3DRLKRSLRbV81RUNdFX7LU9H8ojv/T8MWoJkA
 B2iyRcLxiqXqthy1cypNeoOMY2wa9AfzCB5j0jnyfjNkHtvFOS3nVQu7/INmgb1T60vh
 5E7zieMGDMNZPOiiJWfyg+hDK7t0qQHDuk0Ytw3deZI+I4rUS5FEstZ0GLB835s6zLcT
 7wjGCse1gxzw71XN0GOvIe5BSv+He1rQOG2GAttcvBNb1ppkLDnGKX5XWmelPARw6jjN
 NdFQ==
X-Gm-Message-State: AOAM532L8ptkzeF5Nw/J/6szQLQlg3DHYwpx2a2RDbHS64Zv+PWhBA3k
 z2xu6vA8SHZ/UHT+S6aNk9hufg==
X-Google-Smtp-Source: ABdhPJzmhWK7BnfdkQ6LcrrWhO2OuloHfak3pciPuvISRJ76EJ/z2PIwy5qGEwNf9tyBYvN6F8XhUQ==
X-Received: by 2002:a5d:4703:: with SMTP id y3mr553243wrq.277.1644007763957;
 Fri, 04 Feb 2022 12:49:23 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e13sm3276118wrq.35.2022.02.04.12.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 12:49:17 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 86AA81FFCE;
 Fri,  4 Feb 2022 20:43:37 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PATCH  v3 23/26] tests/plugin: allow libinsn.so per-CPU counts
Date: Fri,  4 Feb 2022 20:43:32 +0000
Message-Id: <20220204204335.1689602-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220204204335.1689602-1-alex.bennee@linaro.org>
References: <20220204204335.1689602-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
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


