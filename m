Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9D04C04CF
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 23:42:59 +0100 (CET)
Received: from localhost ([::1]:42778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMds2-0002wG-Ao
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 17:42:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nMdoB-0008VW-Ci
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:38:59 -0500
Received: from [2607:f8b0:4864:20::233] (port=42902
 helo=mail-oi1-x233.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nMdo8-0001kD-QM
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:38:59 -0500
Received: by mail-oi1-x233.google.com with SMTP id a6so16239298oid.9
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 14:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CMLA9XmhgLmnrkJsSU7Hf5KvpAaSmmAL50O+rMZoAIk=;
 b=Esplp2JEBoi/M9Je+p3QbS5+zMCULPlcJGio/hN0G+ivPqAtAjSZbS4SXBkZ2zVQfX
 Eh/psQEuF3x7UoeJLJRCazCx31dAeh8b9OfD9fnzHOEhs/zmkUdImziHPikgdKaoowlM
 q9lx87JZNOabIzZeTQsZ4QLLr3r5UIC4npaLkSzyQkesPGFkmgOS//Vv4sOQKCc8JIbe
 +cFyDrGr8grs3Kvkycen1NAr2B86774Nt9gOSW0zWxvFUE5CKArpdTbvY9Gtm8cxdYFy
 +ts4MvMW/i+UZHPIk28WCOxnMpJ+c0puU0Yqmoh9prF/mtxr7Esn86FvFLUgPcvSjXq6
 72cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CMLA9XmhgLmnrkJsSU7Hf5KvpAaSmmAL50O+rMZoAIk=;
 b=qiW7lw/3qtN6ijte0bAscI2XXGMsMTzLBJcFZ36ly2IToYGTV1MvLUhVjt+dNdEHVm
 Bq3gQY07fOXH2W+YSyl/ojlnVLk7vQpq+bk3YmPNFydjKXn5T168L11kk8ivjARD27uV
 RGiZTDJl2BUcJUIeXW0JrvUGNnsGlcJao6zWrUJzD4e30dhOFxJSm+UsMtZqpw9VR1az
 xRgmtvTll9lCoX8irnlcgmW9fJEnikPxywFn5UeZYiKxKOpPoYnxxsmd4QgYEuNDhr2t
 1cOYsnIPhLLrrNO25QPwtaeF0qV/9dJf0S5JOg2yLD7MAlSqAtucXmMsONbAelKqwlr2
 s2Xw==
X-Gm-Message-State: AOAM530BnAqciewYgXpCmzXRzaeoEQDmfex+LUYy76pOGM1C7FptwGFX
 RC+UVE5oV1N7/Kntl6B/t9RWcJMxEhJyaw==
X-Google-Smtp-Source: ABdhPJz2gKUiYfTKgfLp4heybsrWR39pL9STFr7mVTMHyOkQJ2wsNnyerdlIpupU2L6QHbx5wHe4Hg==
X-Received: by 2002:a05:6808:14c9:b0:2d5:166:5937 with SMTP id
 f9-20020a05680814c900b002d501665937mr3223736oiw.122.1645569535447; 
 Tue, 22 Feb 2022 14:38:55 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id i26sm5739249oou.27.2022.02.22.14.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 14:38:54 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] target/riscv: Add isa extenstion strings to the device tree
Date: Tue, 22 Feb 2022 14:38:30 -0800
Message-Id: <20220222223830.2319856-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::233
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=atishp@rivosinc.com; helo=mail-oi1-x233.google.com
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
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Linux kernel parses the ISA extensions from "riscv,isa" DT
property. It used to parse only the single letter base extensions
until now. A generic ISA extension parsing framework was proposed[1]
recently that can parse multi-letter ISA extensions as well.

Generate the extended ISA string by appending  the available ISA extensions
to the "riscv,isa" string if it is enabled so that kernel can process it.

[1] https://lkml.org/lkml/2022/2/15/263

Suggested-by: Heiko Stubner <heiko@sntech.de>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Changes from v2->v3:
1. Used g_strconcat to replace snprintf & a max isa string length as
suggested by Anup.
2. I have not included the Tested-by Tag from Heiko because the
implementation changed from v2 to v3.

Changes from v1->v2:
1. Improved the code redability by using arrays instead of individual check
---
 target/riscv/cpu.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b0a40b83e7a8..2c7ff6ef555a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -34,6 +34,12 @@
 
 /* RISC-V CPU definitions */
 
+/* This includes the null terminated character '\0' */
+struct isa_ext_data {
+        const char *name;
+        bool enabled;
+};
+
 static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
 
 const char * const riscv_int_regnames[] = {
@@ -881,6 +887,28 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_props(dc, riscv_cpu_properties);
 }
 
+static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
+{
+    char *old = *isa_str;
+    char *new = *isa_str;
+    int i;
+    struct isa_ext_data isa_edata_arr[] = {
+        { "svpbmt", cpu->cfg.ext_svpbmt   },
+        { "svinval", cpu->cfg.ext_svinval },
+        { "svnapot", cpu->cfg.ext_svnapot },
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
@@ -893,6 +921,7 @@ char *riscv_isa_string(RISCVCPU *cpu)
         }
     }
     *p = '\0';
+    riscv_isa_string_ext(cpu, &isa_str, maxlen);
     return isa_str;
 }
 
-- 
2.30.2


