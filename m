Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F656F7A65
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:09:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujrV-000876-OJ; Thu, 04 May 2023 21:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujrT-00086g-Ju
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:03:51 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujrS-0006tU-2X
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:03:51 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1aaebed5bd6so8160455ad.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248627; x=1685840627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eSrZR2FEgMCsszLbeTj2jVznuk5gFjIpd0QGja6u5o4=;
 b=OqHMPqN2baAfIHwCqKAsMhYx4WAnShdAh66sOy6rBixdMZdbukMEW3puDo80azEA6a
 Xqp4dYwuEXW4dfniUSx5SvvmDb/4FEHo95oAWdpfIKkao2hCJ5OtVfpsyTHk6caTdGe9
 pQHTbYd97Rv6RDt7/rLGucb4Dvqta4guj1fmdce6GyL8G2Ze0J7a8epgZxMALiFIE6Sv
 NBxgu/7lVizgBdFj2e4unBVR+0E5LYVdEB3WDH3QFFBBcGlu3nzDu5UAn+h2xPyPGf7M
 E1fJoFHwybRv7PZQiLrUxy5HIsgXyCYvSucncmJdW8saJ99Noox3G/sJfmvkXfftbchR
 E/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248627; x=1685840627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eSrZR2FEgMCsszLbeTj2jVznuk5gFjIpd0QGja6u5o4=;
 b=HmFcO/EL6IvXHu6xGJETbtJivmAPp9k6CKaylPtIrcaoOKdGUb2fSLI5d1bdkQ6A93
 9S2kpL8oQbGpE9GhuoBC+B1W88JpJ4NRky0j2b3cc2r1Z+H6UaToar000rids0tWWPD1
 HLJ3afwRQCPCcAl6ol8CoL6QvgmzEWqAsoklOcjpwoFpUXcYqMre1YuslnIKDMwcMn4y
 hjfU6K4+boHssl9MReVaJv2rPSzHNvkL+M3ysNbcC4uatgGCQHThDo0A6h4O/TXoQDZx
 0TG9WQ4IY1BABXS0Vo7B3edSeNsHGqMT7S5+mGpfzIn9L9J2SMb10fPjIkUFdwz5Ffxj
 EJ5Q==
X-Gm-Message-State: AC+VfDzM5CweBIvHeHGsgv8z+iKvSarKQrZBs/yXCp+DcLIMYWQq2o2I
 UmNyAdH4eiijTFiqghG1EUtMPiAAt2Q5Cw==
X-Google-Smtp-Source: ACHHUZ4v10kTb5GIV4uQpjG0+7Hf+8R4fMEWPFzrXN3uZtT6YoWbDMTtqKfktiC8J8SS/W2lveKWgw==
X-Received: by 2002:a17:902:b904:b0:1ac:34fe:d040 with SMTP id
 bf4-20020a170902b90400b001ac34fed040mr2778146plb.50.1683248627332; 
 Thu, 04 May 2023 18:03:47 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:03:46 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 09/89] target/riscv: add cfg properties for Zc* extension
Date: Fri,  5 May 2023 11:01:21 +1000
Message-Id: <20230505010241.21812-10-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

Add properties for Zca,Zcb,Zcf,Zcd,Zcmp,Zcmt extension.
Add check for these properties.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230307081403.61950-2-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h |  6 ++++++
 target/riscv/cpu.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5adefe4ab5..e5f7c860d1 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -438,6 +438,12 @@ struct RISCVCPUConfig {
     bool ext_zbkc;
     bool ext_zbkx;
     bool ext_zbs;
+    bool ext_zca;
+    bool ext_zcb;
+    bool ext_zcd;
+    bool ext_zcf;
+    bool ext_zcmp;
+    bool ext_zcmt;
     bool ext_zk;
     bool ext_zkn;
     bool ext_zknd;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cea0d3cbdd..97b0a77d8e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -939,6 +939,49 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         }
     }
 
+    if (cpu->cfg.ext_c) {
+        cpu->cfg.ext_zca = true;
+        if (cpu->cfg.ext_f && env->misa_mxl_max == MXL_RV32) {
+            cpu->cfg.ext_zcf = true;
+        }
+        if (cpu->cfg.ext_d) {
+            cpu->cfg.ext_zcd = true;
+        }
+    }
+
+    if (env->misa_mxl_max != MXL_RV32 && cpu->cfg.ext_zcf) {
+        error_setg(errp, "Zcf extension is only relevant to RV32");
+        return;
+    }
+
+    if (!cpu->cfg.ext_f && cpu->cfg.ext_zcf) {
+        error_setg(errp, "Zcf extension requires F extension");
+        return;
+    }
+
+    if (!cpu->cfg.ext_d && cpu->cfg.ext_zcd) {
+        error_setg(errp, "Zcd extension requires D extension");
+        return;
+    }
+
+    if ((cpu->cfg.ext_zcf || cpu->cfg.ext_zcd || cpu->cfg.ext_zcb ||
+         cpu->cfg.ext_zcmp || cpu->cfg.ext_zcmt) && !cpu->cfg.ext_zca) {
+        error_setg(errp, "Zcf/Zcd/Zcb/Zcmp/Zcmt extensions require Zca "
+                         "extension");
+        return;
+    }
+
+    if (cpu->cfg.ext_zcd && (cpu->cfg.ext_zcmp || cpu->cfg.ext_zcmt)) {
+        error_setg(errp, "Zcmp/Zcmt extensions are incompatible with "
+                         "Zcd extension");
+        return;
+    }
+
+    if (cpu->cfg.ext_zcmt && !cpu->cfg.ext_icsr) {
+        error_setg(errp, "Zcmt extension requires Zicsr extension");
+        return;
+    }
+
     if (cpu->cfg.ext_zk) {
         cpu->cfg.ext_zkn = true;
         cpu->cfg.ext_zkr = true;
-- 
2.40.0


