Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0666A92FB
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:48:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0z3-0007k5-79; Fri, 03 Mar 2023 03:41:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0yo-0006pg-95
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:31 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0ym-0007n9-8T
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:29 -0500
Received: by mail-pj1-x1035.google.com with SMTP id l1so1810617pjt.2
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832887;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zUP3OSA2SEm6Zwc923BsVzEs0eo9CAKakWrt+naZB44=;
 b=lzEbdHZF+nYepfAlf+CrysjOAeD2QDubMHkQnvju9SkFdNi2NrOqCFdQxn1e7gYqS7
 eVYRngnHKg/XRZjNuMq6+OCGN5aK176+aaxTl1O8RO3H6Ec01rBQlox4c0bAWIZaTAd2
 CqUp61XGi0jGiThHBDVIVS1spI7cLKKG2imkdQ3vKANTvjOvMWZmBtiIaM4AHQQEfcIK
 oYC3v8jOCigEbb/rR49HwWY9FanP83xPUqXSybL8nIvprhURCnWLTZVyyG+AJdhRdpXV
 Y29uuS0WCpp14Y6o4z4KlKyXI72UIm1WhAW1csjsjxcEW2wQjocWrjP6R2seppnJ3Lc2
 vmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832887;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zUP3OSA2SEm6Zwc923BsVzEs0eo9CAKakWrt+naZB44=;
 b=ukQZ1EPR2jXYkPFeWpH4J89OFv83xEv/Y2kDgJErL1Vpkc0Ux6JsJ5ufu43hBuQZjR
 rWRF9VUBJQV8/uaZjRdaNCEM+W0YodbaXdhmEbm4VGLC7r9rY2YMBcrO/l5IRi31RKKB
 ntqhGsVAv9HuZ/ZWoBFbyykxksWHK/l4oGB5mGz6LhXgL1/dCFy5WY+gNzNSPq8BpADm
 Z3WwxBgkdenhE5DbQMI7ynNw84XPG+PD5ay5hulF1YtzQ8lWFB9ohN182JgtsCtHjKMI
 FiCdc27+MpXsGbLPxg9G2AdtPMEWD/gkxB1y3c7sobTH49nht5igCr2gfX3feah2RDI4
 vPCg==
X-Gm-Message-State: AO0yUKVIRPm0Zrm/+RmmXDk0rRZXu1wXObiGGNtuBnZz+3m495WqkGj3
 IF6IpjOhEGoaDescWNAQ7oligw==
X-Google-Smtp-Source: AK7set8u5WTnGJ5WcPWAQ3lgFoE0CmLNWonzfRBgIVlz3cr8XHgdQ4J7hk9psxa+eWhjsk0EhVsebA==
X-Received: by 2002:a17:90b:1e05:b0:237:7149:b333 with SMTP id
 pg5-20020a17090b1e0500b002377149b333mr791616pjb.43.1677832886938; 
 Fri, 03 Mar 2023 00:41:26 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 1-20020a630301000000b004fb11a7f2d4sm977214pgd.57.2023.03.03.00.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:26 -0800 (PST)
Subject: [PULL 05/59] target/riscv/cpu.c: error out if EPMP is enabled without
 PMP
Date: Fri,  3 Mar 2023 00:36:46 -0800
Message-Id: <20230303083740.12817-6-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Bin Meng <bmeng@tinylab.org>, 
 Andrew Jones <ajones@ventanamicro.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Instead of silently ignoring the EPMP setting if there is no PMP
available, error out informing the user that EPMP depends on PMP
support:

$ ./qemu-system-riscv64 -cpu rv64,pmp=false,x-epmp=true
qemu-system-riscv64: Invalid configuration: EPMP requires PMP support

This will force users to pick saner options in the QEMU command line.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-ID: <20230222185205.355361-6-dbarboza@ventanamicro.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/cpu.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 13e55ec5bd..aec7830c44 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -925,13 +925,18 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 
     if (cpu->cfg.pmp) {
         riscv_set_feature(env, RISCV_FEATURE_PMP);
+    }
+
+    if (cpu->cfg.epmp) {
+        riscv_set_feature(env, RISCV_FEATURE_EPMP);
 
         /*
          * Enhanced PMP should only be available
          * on harts with PMP support
          */
-        if (cpu->cfg.epmp) {
-            riscv_set_feature(env, RISCV_FEATURE_EPMP);
+        if (!cpu->cfg.pmp) {
+            error_setg(errp, "Invalid configuration: EPMP requires PMP support");
+            return;
         }
     }
 
-- 
2.39.2


