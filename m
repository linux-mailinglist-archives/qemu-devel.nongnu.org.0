Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 826544EB45A
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 22:00:25 +0200 (CEST)
Received: from localhost ([::1]:49420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZI0t-00079l-W0
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 16:00:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nZHxw-0005Tn-Lb
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 15:57:21 -0400
Received: from [2607:f8b0:4864:20::52f] (port=35447
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nZHxu-0004vH-Sx
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 15:57:20 -0400
Received: by mail-pg1-x52f.google.com with SMTP id z128so15712916pgz.2
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 12:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U28UX+KknfBQMHJ0Njiwqq4sjqzE4xwH++gkC1d5ZC0=;
 b=RDfC6St1RQYAE2YgbypIRJpVNG/elN6KtpMhY5Yq18iP2p6kEp7gwJA4NqRtb/x+vT
 XT69LBgnOAref3as+gCgibk/MDkPu6QOpdB5Wuheu77O9nU9veXC1Tu5946r8WLurF86
 qlfuPUeoeS8OcVcH7KjaE/K1f9teSLltQS+b8uw8rkj717ekNfN91kzLc06kyiyTHaM0
 IciQQU/ElmdDIe00Efqah2FzYRbVTOwAzrNGKeWEhBkwgMfjd8uYP1QSzqWnEHyAeyU5
 ZF8FQNhSw822tjdAN/lm1gVyX8FHN5tiQxtDmmzCjb8Qe6CWNKm8m7/iuO3dWe2EBacH
 TdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U28UX+KknfBQMHJ0Njiwqq4sjqzE4xwH++gkC1d5ZC0=;
 b=YcNe3hiWnBvwpodBE0bTJ31XP9bUD13Z7PTvFDN/I18da/DqjGL69oPFuTau+96qfG
 1XPQprzkjjMG+lB6nfk9qbPf5/3IGOVEzVL394RR0PpbAl+QPSTWai/tsjAqCIWOn7DC
 JKRqya5mjHHzmGSUnFL3Od+By2P2Rb8vJP4CwQuzUHGzsspQeHEj0fa+VlvKsMbvvndf
 1HQ0262cRBbMV7tbHWgbGFn3YddlBkr+gx1nSr9U22MDCL9yavwY6xcUQGKjqzqqFUWv
 Q32qj3TiffxaQabchcE9+bPWBPMHT26pwduAUEO/9Ba4S1TfXSrNyGX8rS82c6E0AAob
 /I4A==
X-Gm-Message-State: AOAM530vr4i0efUNAWoFTWFUU2OhfJYldygD1TvkrbfzJ3RU62OX1lSr
 wKmvbfcwJOJ8TIGCKLD3rctN6dIwmIfJPg==
X-Google-Smtp-Source: ABdhPJwuQBGBLPub9kcAOs0mR2Xogq8hVJGFFI773s22IoDbqcHbpBHwt8zvS8qYnpw4GIJtP/1glQ==
X-Received: by 2002:a65:5a06:0:b0:375:81c9:74b1 with SMTP id
 y6-20020a655a06000000b0037581c974b1mr3184821pgs.122.1648583836214; 
 Tue, 29 Mar 2022 12:57:16 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 c63-20020a624e42000000b004fa9ee41b7bsm19984251pfb.217.2022.03.29.12.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 12:57:15 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7] target/riscv: Add isa extenstion strings to the device tree
Date: Tue, 29 Mar 2022 12:56:57 -0700
Message-Id: <20220329195657.1725425-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=atishp@rivosinc.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-riscv@nongnu.org, Heiko Stubner <heiko@sntech.de>,
 Frank Chang <frank.chang@sifive.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Linux kernel parses the ISA extensions from "riscv,isa" DT
property. It used to parse only the single letter base extensions
until now. A generic ISA extension parsing framework was proposed[1]
recently that can parse multi-letter ISA extensions as well.

Generate the extended ISA string by appending the available ISA extensions
to the "riscv,isa" string if it is enabled so that kernel can process it.

[1] https://lkml.org/lkml/2022/2/15/263

Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
Suggested-by: Heiko Stubner <heiko@sntech.de>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---

Changes from v6->v7:
1. Fixed indentation and typo.
2. Added Reviewed-by tags.

Changes from v5->v6:
1. Improved commit message.
2. Fixed a typo for Zfh.

Changes from v4->v5:
1. Fixed the order of Zxx extensions.
2. Added a comment clearly describing the rules of extension order.

Changes from v3->v4:
1. Fixed the order of the extension names.
2. Added all the available ISA extensions in Qemu.

Changes from v2->v3:
1. Used g_strconcat to replace snprintf & a max isa string length as
suggested by Anup.
2. I have not included the Tested-by Tag from Heiko because the
implementation changed from v2 to v3.

Changes from v1->v2:
1. Improved the code redability by using arrays instead of individual check
---
 target/riscv/cpu.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 198274fb34e5..86e48ff54dd1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -34,6 +34,11 @@
 
 /* RISC-V CPU definitions */
 
+struct isa_ext_data {
+    const char *name;
+    bool enabled;
+};
+
 static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
 
 const char * const riscv_int_regnames[] = {
@@ -920,6 +925,60 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_props(dc, riscv_cpu_properties);
 }
 
+#define ISA_EDATA_ENTRY(name, prop) {#name, cpu->cfg.prop}
+
+static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
+{
+    char *old = *isa_str;
+    char *new = *isa_str;
+    int i;
+
+    /**
+     * Here are the ordering rules of extension naming defined by RISC-V
+     * specification :
+     * 1. All extensions should be separated from other multi-letter extensions
+     *    by an underscore.
+     * 2. The first letter following the 'Z' conventionally indicates the most
+     *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
+     *    If multiple 'Z' extensions are named, they should be ordered first
+     *    by category, then alphabetically within a category.
+     * 3. Standard supervisor-level extensions (starts with 'S') should be
+     *    listed after standard unprivileged extensions.  If multiple
+     *    supervisor-level extensions are listed, they should be ordered
+     *    alphabetically.
+     * 4. Non-standard extensions (starts with 'X') must be listed after all
+     *    standard extensions. They must be separated from other multi-letter
+     *    extensions by an underscore.
+     */
+    struct isa_ext_data isa_edata_arr[] = {
+        ISA_EDATA_ENTRY(zfh, ext_zfh),
+        ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
+        ISA_EDATA_ENTRY(zfinx, ext_zfinx),
+        ISA_EDATA_ENTRY(zhinx, ext_zhinx),
+        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
+        ISA_EDATA_ENTRY(zdinx, ext_zdinx),
+        ISA_EDATA_ENTRY(zba, ext_zba),
+        ISA_EDATA_ENTRY(zbb, ext_zbb),
+        ISA_EDATA_ENTRY(zbc, ext_zbc),
+        ISA_EDATA_ENTRY(zbs, ext_zbs),
+        ISA_EDATA_ENTRY(zve32f, ext_zve32f),
+        ISA_EDATA_ENTRY(zve64f, ext_zve64f),
+        ISA_EDATA_ENTRY(svinval, ext_svinval),
+        ISA_EDATA_ENTRY(svnapot, ext_svnapot),
+        ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),
+    };
+
+    for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
+        if (isa_edata_arr[i].enabled) {
+            new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
+            g_free(old);
+            old = new;
+        }
+    }
+
+    *isa_str = new;
+}
+
 char *riscv_isa_string(RISCVCPU *cpu)
 {
     int i;
@@ -932,6 +991,7 @@ char *riscv_isa_string(RISCVCPU *cpu)
         }
     }
     *p = '\0';
+    riscv_isa_string_ext(cpu, &isa_str, maxlen);
     return isa_str;
 }
 
-- 
2.25.1


