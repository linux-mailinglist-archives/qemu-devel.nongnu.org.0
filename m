Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7380A5F44A8
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:48:06 +0200 (CEST)
Received: from localhost ([::1]:45702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofiHF-0004xW-7T
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhgP-0007T8-K5
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:10:01 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:36406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhgN-000095-IO
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:10:01 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 c3-20020a1c3503000000b003bd21e3dd7aso753069wma.1
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=JWHCVViNcRApsXs2Lz0jpQ9zDW3pHhm3wfNG9Nif7M4=;
 b=K82ItZRNgakVbF87rkVPR6LOCJ3Fhf/IgAdbfkYPlOTlRLiwfgxAQpRnDXD0vvmEzi
 NMY7OvT8gOOKht+lsIJQPW/iA4oIK1ZCHonAWuLQGAovPHE8QKoFEfVhJxep5lh68hF7
 UJmu4MmhnTRvwnFfVQjIWIVJI0BMYQ10f/f4ZejnprQIxXFMOBSBeBShfqTZgYCn8GbA
 lw5ZYAU469SpIn0YNXfAtGg5Z9WN8Cd/7Gm3ytJKLXGkGg4RKfZBmKRrD8FrBtylEZ2V
 AKuGi2LuBAmqFgCckzbO+2Fg3BE82F17wZpaRucC2pf1hj/b6P2OQRA08iQygQAKD+pY
 1oxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=JWHCVViNcRApsXs2Lz0jpQ9zDW3pHhm3wfNG9Nif7M4=;
 b=g+nj9vmx7Rt+epOVCfHM5F0zsFUT0v2+ryRA4LgOmiHsLu4yuH1RcHZHlncCz/3asz
 6DeB17VcnVKiCyuWxTNgJvEFz1ZTtG5ahnumJyygSy+czQ6kRZXKEdhhFTFXD1zHnmIA
 egcfUb9UPXoASOc1e7pewxLYbdhPWNU9HVJii6XYNtufTn0WZVG4tvoJp/S2dxF5mz1L
 DOacZEGi272x+28xO7luAHBoFRRs0PncdAE3HDjfoY1f+ovnHkMKwOA5qlOpPcVKFi79
 Jjjy+8hm0OdCu75C5210jbSYiT0Ak3mBVMkaM38adNMXwfkx8vRprfQsUFpjdNKi6PdU
 mBIA==
X-Gm-Message-State: ACrzQf1Qemt6aSeeKJj1hOzUzA1OV3eJFGTPcR1nOPoaX6L6+orP/zT9
 2LNfSKjdGpfYKufEQ60xjQpvBhcdZj0YRQ==
X-Google-Smtp-Source: AMsMyM6TRSynoWDap9jjuym+xcJfLXj7NzpWizZMRBwNutxSOFdB3eE+aFtbAmZK98iFSp3DK85Z/Q==
X-Received: by 2002:a05:600c:3511:b0:3b4:bb85:f1e3 with SMTP id
 h17-20020a05600c351100b003b4bb85f1e3mr10307717wmq.0.1664888998223; 
 Tue, 04 Oct 2022 06:09:58 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a05600c510900b003a5c244fc13sm21402872wms.2.2022.10.04.06.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:09:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 389C61FFD6;
 Tue,  4 Oct 2022 14:01:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 34/54] disas: use result of ->read_memory_func
Date: Tue,  4 Oct 2022 14:01:18 +0100
Message-Id: <20221004130138.2299307-35-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This gets especially confusing if you start plugging in host addresses
from a trace and you wonder why the output keeps changing. Report when
read_memory_func fails instead of blindly disassembling the buffer
contents.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220929114231.583801-35-alex.bennee@linaro.org>

diff --git a/disas.c b/disas.c
index f07b6e760b..94d3b45042 100644
--- a/disas.c
+++ b/disas.c
@@ -83,18 +83,18 @@ static int print_insn_objdump(bfd_vma pc, disassemble_info *info,
                               const char *prefix)
 {
     int i, n = info->buffer_length;
-    uint8_t *buf = g_malloc(n);
-
-    info->read_memory_func(pc, buf, n, info);
-
-    for (i = 0; i < n; ++i) {
-        if (i % 32 == 0) {
-            info->fprintf_func(info->stream, "\n%s: ", prefix);
+    g_autofree uint8_t *buf = g_malloc(n);
+
+    if (info->read_memory_func(pc, buf, n, info) == 0) {
+        for (i = 0; i < n; ++i) {
+            if (i % 32 == 0) {
+                info->fprintf_func(info->stream, "\n%s: ", prefix);
+            }
+            info->fprintf_func(info->stream, "%02x", buf[i]);
         }
-        info->fprintf_func(info->stream, "%02x", buf[i]);
+    } else {
+        info->fprintf_func(info->stream, "unable to read memory");
     }
-
-    g_free(buf);
     return n;
 }
 
diff --git a/disas/capstone.c b/disas/capstone.c
index 20bc8f9669..fe3efb0d3c 100644
--- a/disas/capstone.c
+++ b/disas/capstone.c
@@ -191,37 +191,43 @@ bool cap_disas_target(disassemble_info *info, uint64_t pc, size_t size)
         size_t tsize = MIN(sizeof(cap_buf) - csize, size);
         const uint8_t *cbuf = cap_buf;
 
-        info->read_memory_func(pc + csize, cap_buf + csize, tsize, info);
-        csize += tsize;
-        size -= tsize;
+        if (info->read_memory_func(pc + csize, cap_buf + csize, tsize, info) == 0) {
+            csize += tsize;
+            size -= tsize;
 
-        while (cs_disasm_iter(handle, &cbuf, &csize, &pc, insn)) {
-            cap_dump_insn(info, insn);
-        }
+            while (cs_disasm_iter(handle, &cbuf, &csize, &pc, insn)) {
+                cap_dump_insn(info, insn);
+            }
+
+            /* If the target memory is not consumed, go back for more... */
+            if (size != 0) {
+                /*
+                 * ... taking care to move any remaining fractional insn
+                 * to the beginning of the buffer.
+                 */
+                if (csize != 0) {
+                    memmove(cap_buf, cbuf, csize);
+                }
+                continue;
+            }
 
-        /* If the target memory is not consumed, go back for more... */
-        if (size != 0) {
             /*
-             * ... taking care to move any remaining fractional insn
-             * to the beginning of the buffer.
+             * Since the target memory is consumed, we should not have
+             * a remaining fractional insn.
              */
             if (csize != 0) {
-                memmove(cap_buf, cbuf, csize);
+                info->fprintf_func(info->stream,
+                                   "Disassembler disagrees with translator "
+                                   "over instruction decoding\n"
+                                   "Please report this to qemu-devel@nongnu.org\n");
             }
-            continue;
-        }
+            break;
 
-        /*
-         * Since the target memory is consumed, we should not have
-         * a remaining fractional insn.
-         */
-        if (csize != 0) {
+        } else {
             info->fprintf_func(info->stream,
-                "Disassembler disagrees with translator "
-                "over instruction decoding\n"
-                "Please report this to qemu-devel@nongnu.org\n");
+                               "0x%08" PRIx64 ": unable to read memory\n", pc);
+            break;
         }
-        break;
     }
 
     cs_close(&handle);
@@ -286,16 +292,23 @@ bool cap_disas_monitor(disassemble_info *info, uint64_t pc, int count)
 
         /* Make certain that we can make progress.  */
         assert(tsize != 0);
-        info->read_memory_func(pc + csize, cap_buf + csize, tsize, info);
-        csize += tsize;
-
-        if (cs_disasm_iter(handle, &cbuf, &csize, &pc, insn)) {
-            cap_dump_insn(info, insn);
-            if (--count <= 0) {
-                break;
+        if (info->read_memory_func(pc + csize, cap_buf + csize,
+                                   tsize, info) == 0)
+        {
+            csize += tsize;
+
+            if (cs_disasm_iter(handle, &cbuf, &csize, &pc, insn)) {
+                cap_dump_insn(info, insn);
+                if (--count <= 0) {
+                    break;
+                }
             }
+            memmove(cap_buf, cbuf, csize);
+        } else {
+            info->fprintf_func(info->stream,
+                               "0x%08" PRIx64 ": unable to read memory\n", pc);
+            break;
         }
-        memmove(cap_buf, cbuf, csize);
     }
 
     cs_close(&handle);
-- 
2.34.1


