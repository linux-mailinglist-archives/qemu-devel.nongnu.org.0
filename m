Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 863BF33A280
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 04:28:23 +0100 (CET)
Received: from localhost ([::1]:47414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLHQU-0002Xq-HO
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 22:28:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lLHMJ-0006Vt-5W
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 22:24:04 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lLHMG-0004RY-Tt
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 22:24:02 -0500
Received: by mail-wr1-x434.google.com with SMTP id j7so3901968wrd.1
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 19:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=03j/gt08iEmB/YpVMydgNMGaK1/oqVMzCnaDLB+XL7M=;
 b=Ii/byVoiSpzMkxd5JVFe+mKtH7ToN1dOHdaNLTKmYLx9njMUCC2Z7dinJf/eUcHotO
 mAWmLX4kSV5zmWeWjyZTzd199D2xnGybLV1qZK64u47Xa6VZu0B6X9iG2eoe4hKdyICb
 qk4pZLffEfmWMCk1LfoCgp/ml3ssWSmriTrsFGKFv0ZH5lALxNtLkmVR21MlU055hi5b
 dWXXj340OU/lEv/KBjzzgklVHdRkUHpwHkt7jzR6U7guWU15v3YdmTDOjqKGnSM4tBFs
 uvY9ZjPPDKfB81tg+e9BpXoXidnMulHzfvBF5SYWTHkGyQjHpuBvniU6I10M3ksTV3Ej
 4i+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=03j/gt08iEmB/YpVMydgNMGaK1/oqVMzCnaDLB+XL7M=;
 b=moon2JVmukL192HcFy4lwvkbRFgo7VnA2hZe7cS4YT0WlVh00fGWpoKiRAkkwkxnUT
 o+1mN9Z1UYy+O0WPZqEQknSikvD3smwKKKp9kCXKiNSFhqWgOf58qjpwORX9E7KGP+Fu
 XbMoFTwXi6KVc2ePT6f+ir2JXT2I0LCKVx2UPbGOjsDlTcTGtqj8Y50jR9ZLeiHf8/Qn
 Mb8UQbeWQ8Qk/LBpkX2zJBkr2gaqfdW6QhDIKr5txUSoswoRrwXL4jVj+mD1FTBDPWpz
 TiEHx9L4jRECJRuHoPL+4vdTod2iVNVhrfl+psJppaEhSIknO+WExqaD0Lr1JBaHnd9U
 SBKQ==
X-Gm-Message-State: AOAM53288aV25LNQqUMxiwy6SVZnJRth2feGVpqibVOpoX4Wcdi94pdU
 y5fCxvGWqz1s+SUPPm9r9GdCgVt76Ms=
X-Google-Smtp-Source: ABdhPJxCIdAjkcprtUcVribnivMJvBU3iHeU1ToyMfX/M18v1lHWN9FWNazHtLWSfV2adr1VBTzppw==
X-Received: by 2002:a5d:6b50:: with SMTP id x16mr5420011wrw.379.1615692239020; 
 Sat, 13 Mar 2021 19:23:59 -0800 (PST)
Received: from localhost.localdomain ([197.61.164.30])
 by smtp.googlemail.com with ESMTPSA id e1sm14922249wrd.44.2021.03.13.19.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 19:23:58 -0800 (PST)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/8] target/xtensa: Replaced malloc/free with GLib's variants
Date: Sun, 14 Mar 2021 05:23:20 +0200
Message-Id: <20210314032324.45142-5-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314032324.45142-1-ma.mandourr@gmail.com>
References: <20210314032324.45142-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Max Filippov <jcmvbkbc@gmail.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replaced the calls to malloc() and their respective calls to
free() with GLib's allocation and deallocation functions.

Removed null checking before calling g_free() because it's
not necessary and generates style errors.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 target/xtensa/xtensa-isa.c | 53 +++++++++++++++-----------------------
 1 file changed, 21 insertions(+), 32 deletions(-)

diff --git a/target/xtensa/xtensa-isa.c b/target/xtensa/xtensa-isa.c
index 630b4f9da1..5afdba77aa 100644
--- a/target/xtensa/xtensa-isa.c
+++ b/target/xtensa/xtensa-isa.c
@@ -79,7 +79,7 @@ int xtensa_insnbuf_size(xtensa_isa isa)
 xtensa_insnbuf xtensa_insnbuf_alloc(xtensa_isa isa)
 {
     xtensa_insnbuf result = (xtensa_insnbuf)
-        malloc(xtensa_insnbuf_size(isa) * sizeof(xtensa_insnbuf_word));
+        g_try_malloc(xtensa_insnbuf_size(isa) * sizeof(xtensa_insnbuf_word));
 
     CHECK_ALLOC(result, 0);
     return result;
@@ -89,7 +89,7 @@ xtensa_insnbuf xtensa_insnbuf_alloc(xtensa_isa isa)
 void xtensa_insnbuf_free(xtensa_isa isa __attribute__ ((unused)),
                          xtensa_insnbuf buf)
 {
-    free(buf);
+    g_free(buf);
 }
 
 
@@ -237,7 +237,7 @@ xtensa_isa xtensa_isa_init(void *xtensa_modules, xtensa_isa_status *errno_p,
 
     /* Set up the opcode name lookup table. */
     isa->opname_lookup_table =
-        malloc(isa->num_opcodes * sizeof(xtensa_lookup_entry));
+        g_try_new(xtensa_lookup_entry, isa->num_opcodes);
     CHECK_ALLOC_FOR_INIT(isa->opname_lookup_table, NULL, errno_p, error_msg_p);
     for (n = 0; n < isa->num_opcodes; n++) {
         isa->opname_lookup_table[n].key = isa->opcodes[n].name;
@@ -248,7 +248,7 @@ xtensa_isa xtensa_isa_init(void *xtensa_modules, xtensa_isa_status *errno_p,
 
     /* Set up the state name lookup table. */
     isa->state_lookup_table =
-        malloc(isa->num_states * sizeof(xtensa_lookup_entry));
+        g_try_new(xtensa_lookup_entry, isa->num_states);
     CHECK_ALLOC_FOR_INIT(isa->state_lookup_table, NULL, errno_p, error_msg_p);
     for (n = 0; n < isa->num_states; n++) {
         isa->state_lookup_table[n].key = isa->states[n].name;
@@ -259,7 +259,7 @@ xtensa_isa xtensa_isa_init(void *xtensa_modules, xtensa_isa_status *errno_p,
 
     /* Set up the sysreg name lookup table. */
     isa->sysreg_lookup_table =
-        malloc(isa->num_sysregs * sizeof(xtensa_lookup_entry));
+        g_try_new(xtensa_lookup_entry, isa->num_sysregs);
     CHECK_ALLOC_FOR_INIT(isa->sysreg_lookup_table, NULL, errno_p, error_msg_p);
     for (n = 0; n < isa->num_sysregs; n++) {
         isa->sysreg_lookup_table[n].key = isa->sysregs[n].name;
@@ -271,7 +271,7 @@ xtensa_isa xtensa_isa_init(void *xtensa_modules, xtensa_isa_status *errno_p,
     /* Set up the user & system sysreg number tables. */
     for (is_user = 0; is_user < 2; is_user++) {
         isa->sysreg_table[is_user] =
-            malloc((isa->max_sysreg_num[is_user] + 1) * sizeof(xtensa_sysreg));
+            g_try_new(xtensa_sysreg, isa->max_sysreg_num[is_user] + 1);
         CHECK_ALLOC_FOR_INIT(isa->sysreg_table[is_user], NULL,
                              errno_p, error_msg_p);
 
@@ -290,7 +290,7 @@ xtensa_isa xtensa_isa_init(void *xtensa_modules, xtensa_isa_status *errno_p,
 
     /* Set up the interface lookup table. */
     isa->interface_lookup_table =
-        malloc(isa->num_interfaces * sizeof(xtensa_lookup_entry));
+        g_try_new(xtensa_lookup_entry, isa->num_interfaces);
     CHECK_ALLOC_FOR_INIT(isa->interface_lookup_table, NULL, errno_p,
                          error_msg_p);
     for (n = 0; n < isa->num_interfaces; n++) {
@@ -302,7 +302,7 @@ xtensa_isa xtensa_isa_init(void *xtensa_modules, xtensa_isa_status *errno_p,
 
     /* Set up the funcUnit lookup table. */
     isa->funcUnit_lookup_table =
-        malloc(isa->num_funcUnits * sizeof(xtensa_lookup_entry));
+        g_try_new(xtensa_lookup_entry, isa->num_funcUnits);
     CHECK_ALLOC_FOR_INIT(isa->funcUnit_lookup_table, NULL, errno_p,
                          error_msg_p);
     for (n = 0; n < isa->num_funcUnits; n++) {
@@ -332,36 +332,25 @@ void xtensa_isa_free(xtensa_isa isa)
      * structure to its initial state.
      */
 
-    if (intisa->opname_lookup_table) {
-        free(intisa->opname_lookup_table);
-        intisa->opname_lookup_table = 0;
-    }
+    g_free(intisa->opname_lookup_table);
+    intisa->opname_lookup_table = 0;
 
-    if (intisa->state_lookup_table) {
-        free(intisa->state_lookup_table);
-        intisa->state_lookup_table = 0;
-    }
+    g_free(intisa->state_lookup_table);
+    intisa->state_lookup_table = 0;
+
+    g_free(intisa->sysreg_lookup_table);
+    intisa->sysreg_lookup_table = 0;
 
-    if (intisa->sysreg_lookup_table) {
-        free(intisa->sysreg_lookup_table);
-        intisa->sysreg_lookup_table = 0;
-    }
     for (n = 0; n < 2; n++) {
-        if (intisa->sysreg_table[n]) {
-            free(intisa->sysreg_table[n]);
-            intisa->sysreg_table[n] = 0;
-        }
+        g_free(intisa->sysreg_table[n]);
+        intisa->sysreg_table[n] = 0;
     }
 
-    if (intisa->interface_lookup_table) {
-        free(intisa->interface_lookup_table);
-        intisa->interface_lookup_table = 0;
-    }
+    g_free(intisa->interface_lookup_table);
+    intisa->interface_lookup_table = 0;
 
-    if (intisa->funcUnit_lookup_table) {
-        free(intisa->funcUnit_lookup_table);
-        intisa->funcUnit_lookup_table = 0;
-    }
+    g_free(intisa->funcUnit_lookup_table);
+    intisa->funcUnit_lookup_table = 0;
 }
 
 
-- 
2.25.1


