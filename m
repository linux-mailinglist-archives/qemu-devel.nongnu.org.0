Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CABFB56B4F8
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 10:59:57 +0200 (CEST)
Received: from localhost ([::1]:34916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9jq8-0002RO-Ni
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 04:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kito.cheng@sifive.com>)
 id 1o9jo4-0000oz-7I
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 04:57:49 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:34408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kito.cheng@sifive.com>)
 id 1o9jo1-0004Z2-Fc
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 04:57:47 -0400
Received: by mail-pf1-x42f.google.com with SMTP id 70so7916976pfx.1
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 01:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5PrL/oC87hd+GhzRVKVTQDW5oEqqs+15Xg9mnkDlFt0=;
 b=dMDeioEbYfMryko3uj6ttYPIFSVLSmxqCxiMviDF8JjyLiEhqLhq6cTCtMN2O4SSeX
 sOVFWKSQOXtOob8CbNcvyFdgBz6fvFpWT3GPR38ET/fGMYIoyTYz2+SEIjP4dOSXwkww
 Vy7CaTy+g8fGJ+fdL04OMV8FBvF0pBBQGFsI09zcu64JRtfED7unBnC6FggMoCM4YVpm
 pwghcfpJIrLdopu7gMi1AooPHLtXPSHeMXVO1kyrWeYiLqGLKzEYgeh3agTITEJ17qfp
 sdKmuY3A1ZrcpVbhVPxX/Tb8xammeTQ82BUpq0XywD1C/Shga4EWt34WxI0oE5iayKnv
 Cbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5PrL/oC87hd+GhzRVKVTQDW5oEqqs+15Xg9mnkDlFt0=;
 b=0DtlPvc0sSlmYm1YmQgvFoJubpmb3CAiVANDNw/XqPvVQ+ymTew1FVX3pUEDgCjzeh
 xdBG0WQ3EcR5ZJGxMiRxf24EugDZ3wEZChw75PkmOBEa5YYFsfsIJwwRXbzQ3IgDKGX+
 sArRYfNJ6+wDiXNlbsAVW3jXti0g5Sxgpl/bGFtYfCGQDZFFUGBsCeskvfOMl92O/Bm9
 20THuPrnwzqQdDkx4asfDDnGCx8oHbUEFrDmaOX23ZZ9Sb7rlMEJIElBcTdVkdXq9Wxr
 k63JavTHjLUQuevwI7iHDlGqT5mQPjghREFRRhIlHB6jciPq72Lu1Et84mc4rKNKLnjl
 O+PQ==
X-Gm-Message-State: AJIora9WqMDe0EwiortPcBSoh6pzY/3U9YCN2ssrCVn5AAlkYG1Y4Ko9
 uHYgCpbe2ayf8bgMgKCSokf0Dw==
X-Google-Smtp-Source: AGRyM1vcv9uPnnbnlzJgmQkxKU8XSCoDmWt92ikDhCHhk6lERZiadav+KiIgSLJgda9nOL1kzPaM7w==
X-Received: by 2002:a05:6a00:140f:b0:4e0:6995:9c48 with SMTP id
 l15-20020a056a00140f00b004e069959c48mr2905983pfu.59.1657270663661; 
 Fri, 08 Jul 2022 01:57:43 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 k27-20020aa7999b000000b0052ab5740130sm71854pfh.37.2022.07.08.01.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 01:57:43 -0700 (PDT)
From: Kito Cheng <kito.cheng@sifive.com>
To: alistair.francis@wdc.com, palmer@dabbelt.com, frank.chang@sifive.com,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, liweiwei@iscas.ac.cn,
 richard.henderson@linaro.org
Cc: Kito Cheng <kito.cheng@sifive.com>
Subject: [PATCH 2/2] target/riscv: Implement dump content of vector register
Date: Fri,  8 Jul 2022 16:57:36 +0800
Message-Id: <20220708085736.94546-2-kito.cheng@sifive.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20220708085736.94546-1-kito.cheng@sifive.com>
References: <20220708085736.94546-1-kito.cheng@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=kito.cheng@sifive.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Implement -d cpu,vu to dump content of vector register.

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
---
 target/riscv/cpu.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c1b96da7da..97b289d277 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -72,6 +72,15 @@ const char * const riscv_fpr_regnames[] = {
   "f30/ft10", "f31/ft11"
 };
 
+const char * const riscv_vr_regnames[] = {
+  "v0",  "v1",  "v2",  "v3",  "v4",  "v5",
+  "v6",  "v7",  "v8",  "v9",  "v10", "v11",
+  "v12", "v13", "v14", "v15", "v16", "v17",
+  "v18", "v19", "v20", "v21", "v22", "v23",
+  "v24", "v25", "v26", "v27", "v28", "v29",
+  "v30", "v31"
+};
+
 static const char * const riscv_excp_names[] = {
     "misaligned_fetch",
     "fault_fetch",
@@ -375,6 +384,28 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
             }
         }
     }
+    if (flags & CPU_DUMP_VU) {
+        int vlen = cpu->cfg.vlen;
+        int n_chunk = vlen / 64;
+        if (vlen == 32) {
+            for (i = 0; i < 32; i++) {
+                qemu_fprintf(f, "0x%08" PRIx64 "\n", env->vreg[i]);
+            }
+        } else {
+            for (i = 0; i < 32; i++) {
+                qemu_fprintf(f, " %-8s ",
+                             riscv_vr_regnames[i]);
+
+                int vec_reg_offset = i * vlen / 64;
+                qemu_fprintf(f, "0x");
+                for (int j = n_chunk - 1; j >= 0; --j) {
+                    qemu_fprintf(f, "%016" PRIx64,
+                                 env->vreg[vec_reg_offset + j]);
+                }
+                qemu_fprintf(f, "\n");
+            }
+        }
+    }
 }
 
 static void riscv_cpu_set_pc(CPUState *cs, vaddr value)
-- 
2.34.0


