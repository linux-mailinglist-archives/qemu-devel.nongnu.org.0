Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 954746AAED8
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 10:43:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYktG-0006Fm-II; Sun, 05 Mar 2023 04:42:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1pYktF-0006Fd-4h
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 04:42:49 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1pYktD-0003qG-ME
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 04:42:48 -0500
Received: by mail-pl1-x62f.google.com with SMTP id h8so7107667plf.10
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 01:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1678009366;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ILwjHQajLaOUmIyvDpFoiDpazq31RWka6WaeoRzZMRw=;
 b=l9wnk3QXyvMKPC1JzKP7oix6kCabFrCmZ97LqMpUJZCqjYxO1j1FP+e0idzO5i6k6U
 efLs1314vvYTMfoyLLiduzVhFMFtftxvGjCFmPT7VNk0zVYM4wzF/YGyIjNN2z1M9AXb
 XUQLdzTyuwKqWmRzisxeuSdRasVXcvY9xJSMx4sgP3arPw39z+dNhQ1Z7dadVPR4qovn
 28Xx1I7wdzDZ2wUB/+/Ue5GxzKdptJ5Cuu/jGUY+Rq07dQVxj2MNPnxkHRMos9n2fp+s
 P1/PC2xznbp3Dib5rxZuwkk4OjWEgWwN/NaLafD1eXgifKRimIOIDzgZrTsrKk9g00cR
 Z9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678009366;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ILwjHQajLaOUmIyvDpFoiDpazq31RWka6WaeoRzZMRw=;
 b=7HOjMhMSJmoje02XWLt05IsPLW/N5dJGGcAHs4JNBWsILSClUDlMMkORo22ZAwDFmb
 lUXnPb1Lk7Cx5tq/U1JOSZrFh2AJ0dthaBx8XI7T2KALS1ZeXK+BQyyj5berzYyfgI3g
 Ow5yayrW2YZ09S+TQbCzOfcSWZpc0dfgQTC9w6UIw3D2vOeWK72dng1PCvBnUpYu+Ba7
 LT9s2nvkFhkKaL3YCxLQ1DkqhHRfLBrcCm/ORZXcvJ/HfFT7+3Hi8AsriAOm8kVWGEWg
 sPhXhFl1jvlfBnfdCKvsFMwRVP6IqSKxhnz8JVUfOjwEvuykct1GD/AKJgLpt0N6LJkI
 FMXQ==
X-Gm-Message-State: AO0yUKXjTqz+AAm9uW4qemlBM/MYVEtU5uOLWqI0Q6h/1cU9re2tVWQ1
 hGKqdYMoZ4cDz5zT4qyppPDwYWRZaievbtF2M346fWPY/GB8NuvBnv9mouiLA2uaNya/2AGmf/6
 4xGheCpTYdrQ+KFiI410//GTounIUiR/CTmZcGRIz8Lnuj5rLAe85tePjHYdZ1GAu4RR+P9SB
X-Google-Smtp-Source: AK7set9EdDz7jXJvH5ei++z4YG3fWzeoe8Dm6r3oDQeNMJULe5Ktq1DcoWcV3xCzcfVc0falTTmFLQ==
X-Received: by 2002:a17:903:8cb:b0:19e:8e73:e977 with SMTP id
 lk11-20020a17090308cb00b0019e8e73e977mr8437612plb.67.1678009365735; 
 Sun, 05 Mar 2023 01:42:45 -0800 (PST)
Received: from hsinchu25.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a170902d20300b0019adbef6a63sm4448469ply.235.2023.03.05.01.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 01:42:45 -0800 (PST)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Jim Shu <jim.shu@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 2/2] target/riscv: Make the "virt" register writable by GDB
Date: Sun,  5 Mar 2023 09:42:29 +0000
Message-Id: <20230305094231.1616-2-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230305094231.1616-1-jim.shu@sifive.com>
References: <20230305094231.1616-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=jim.shu@sifive.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch also enables debugger to set current privilege mode to
VU/VS-mode.

Extend previous commit 81d2929c41d32af138f3562f5a7b309f6eac7ca7 to
support H-extension.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/gdbstub.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 1755fd9d51..a7f234beaf 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -203,15 +203,29 @@ static int riscv_gdb_get_virtual(CPURISCVState *cs, GByteArray *buf, int n)
 
 static int riscv_gdb_set_virtual(CPURISCVState *cs, uint8_t *mem_buf, int n)
 {
+#ifdef CONFIG_USER_ONLY
+    if (n >= 0 && n <= 1) {
+        return sizeof(target_ulong);
+    }
+#else
+    bool virt;
+
     if (n == 0) {
-#ifndef CONFIG_USER_ONLY
         cs->priv = ldtul_p(mem_buf) & 0x3;
         if (cs->priv == PRV_H) {
             cs->priv = PRV_S;
         }
-#endif
+        return sizeof(target_ulong);
+    } else if (n == 1) {
+        virt = ldtul_p(mem_buf) & 0x1;
+        if ((cs->priv == PRV_M) && (virt == true)) {
+            /* M-mode only supports V=0. */
+            virt = false;
+        }
+        riscv_cpu_set_virt_enabled(cs, virt);
         return sizeof(target_ulong);
     }
+#endif
     return 0;
 }
 
-- 
2.17.1


