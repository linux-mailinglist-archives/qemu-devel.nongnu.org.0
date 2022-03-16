Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 693564DB7B1
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 19:01:22 +0100 (CET)
Received: from localhost ([::1]:39446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUXxZ-0006KN-E7
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 14:01:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nUXuX-0003wB-7p
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 13:58:13 -0400
Received: from [2607:f8b0:4864:20::52b] (port=42733
 helo=mail-pg1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nUXuU-0000lx-AR
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 13:58:12 -0400
Received: by mail-pg1-x52b.google.com with SMTP id o8so759637pgf.9
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 10:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L8v7GZSVDXRQMCZ/3RkmjshkslXmDrDdI01ZBmPHSvM=;
 b=z70Kcq/v+HJqnSNk+zOGignQAhaybYDRNwasG823YrI1j4DIVkyB0BOVENg128UYvQ
 augJfbkQiqp3NeUdRTNH4iHQOTxHLzwjHoDvKMoIdCVM9JpYWNZiULyEIpLxwkbXhOH7
 QxFpaKsyThSq0AwNwA+wxtv1DZX9iVs+BsjLZKzm4fRgcV0qUYp0tLhZVRE/gkyB/tjw
 cIOPJqItb4as91S4QXGvbHVuQqe/Zb+tP8UKnenYznyLRFKEHncliWrKodxFgAai+rGe
 7jv5ctxXd8xWOLB+EhfjcZLg/iPpe8tVgxAXHrXg1PxCfMJWJ3oiUC+5RFOE/GUYedWg
 pu1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L8v7GZSVDXRQMCZ/3RkmjshkslXmDrDdI01ZBmPHSvM=;
 b=0l5xbJBVyAPTrkGukkl1Xb4sgMywrX1nyh/bDg9RhmF+pt5FgluQAgeLNfXuV0MaIa
 Abn8HDK+LJ82h2Kg0IG168JKJpxcdAd6fdZPayZXJ5UIVtUW9rs+BoK3TQi6lX4iKDKX
 odSpwN56HSHcqxQQlTrtlPGgGwlVnyMlU/ybgfiDfqshyHzdmhV5JD7i1SEm/vlY5XB1
 KtfCaKExjcwaxhoLtcq+2wFWh5b1ENPB47S1Oou3b0nw/BHC7aA3hkZG/kMGC8xpC8bX
 LQwYV7LQP42qQO7kSj5oPHQ4sxpyJiwrXEL6P1zkOfDHB+vNXd4iExScNbuwEDGkGyIt
 q8jw==
X-Gm-Message-State: AOAM531r18Sjg+aLEvHwynfND9pJ1Uvdjx6Qw4Rk2GWpwjdN2QqgU59S
 gXqjuhb/XKooYLPOeNWpxFVGvH/CxiE1tw==
X-Google-Smtp-Source: ABdhPJxcyNKQeNCqY9XuPx170ngP2OdvrHudSkxrQtVQDMLGplcMbsGAldsFpFdXZva0NaVvzgA4GA==
X-Received: by 2002:a63:5014:0:b0:380:132:6b25 with SMTP id
 e20-20020a635014000000b0038001326b25mr587566pgb.211.1647453484972; 
 Wed, 16 Mar 2022 10:58:04 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 a38-20020a056a001d2600b004f70d5e92basm4053275pfx.34.2022.03.16.10.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 10:58:04 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6] target/riscv: Add isa extenstion strings to the device tree
Date: Wed, 16 Mar 2022 10:57:59 -0700
Message-Id: <20220316175759.821785-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=atishp@rivosinc.com; helo=mail-pg1-x52b.google.com
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
 Anup Patel <anup@brainfault.org>, Bin Meng <bin.meng@windriver.com>,
 Atish Patra <atishp@rivosinc.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
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
Suggested-by: Heiko Stubner <heiko@sntech.de>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
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
index ddda4906ffb7..937ccdda997b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -34,6 +34,11 @@
 
 /* RISC-V CPU definitions */
 
+struct isa_ext_data {
+        const char *name;
+        bool enabled;
+};
+
 static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
 
 const char * const riscv_int_regnames[] = {
@@ -898,6 +903,60 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
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
+     * 1. All extensions should be separated from from other multi-letter
+     *    extensions by an underscore.
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
+        ISA_EDATA_ENTRY(zdinx, ext_zdinx),
+        ISA_EDATA_ENTRY(zba, ext_zba),
+        ISA_EDATA_ENTRY(zbb, ext_zbb),
+        ISA_EDATA_ENTRY(zbc, ext_zbc),
+        ISA_EDATA_ENTRY(zbs, ext_zbs),
+        ISA_EDATA_ENTRY(zve32f, ext_zve32f),
+        ISA_EDATA_ENTRY(zve64f, ext_zve64f),
+        ISA_EDATA_ENTRY(zhinx, ext_zhinx),
+        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
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
@@ -910,6 +969,7 @@ char *riscv_isa_string(RISCVCPU *cpu)
         }
     }
     *p = '\0';
+    riscv_isa_string_ext(cpu, &isa_str, maxlen);
     return isa_str;
 }
 
-- 
2.25.1


