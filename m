Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0A66A92CE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:43:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0zN-00089L-QP; Fri, 03 Mar 2023 03:42:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zI-00088f-Nh
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:42:00 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zG-0007zl-LI
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:42:00 -0500
Received: by mail-pg1-x531.google.com with SMTP id s17so1026070pgv.4
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832917;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zjgp+PZMaWiPK4UX+pTmFsQnk+WXuCTXJqH5LtU5wDA=;
 b=LMiFugxt6tuA1vSy+w4WV55ONLcA35CYtF3LwPrB6qPm5VtdEzROJQu20D4ZsshxDJ
 sAPVH6WVd0HmVCd17PPtL5Fn41OAOqDZctUesGgwwajjUelJkn8/SgQ2Batod2edUdCb
 QotppfhwkpiHTRkJwFgLFDHgZMCowuHsWW0ilFqozL24l7mD+b6nPxOb1auiTbQuJkSk
 gJkMoA1ws81iAvwcanWnlh1caP1d5mtA1MGGcL4w76KDwg6GKxfUM6bQ5Ut4iLwoMRZE
 /CapJ+dRUMjlAMieD8j5aJ5l312GvnuA+CFcawzilUDyFW5zT6d40Lli0tcba9NvH523
 DXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832917;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zjgp+PZMaWiPK4UX+pTmFsQnk+WXuCTXJqH5LtU5wDA=;
 b=RHsTcluadB77fJXjDYGc83zR6Q19u13J+kMSNmHmTQiDP/KbPNv77j5PbiwpvmvjV5
 RarNih2++CUFzuq3MPA7kgPxbw+6X5A3saudFr5CVtO2bf+284qnQLfo2ASN2XQ6XUhL
 FRACdzBDkk9vzoHiq/k420GT3hkpvgL/qSo0Gn9YoNPPIsmNvdPqXnrRALPFiIerRdq+
 N7Cic0QvaMDywD0QkGFN/TdLhDSXxxjQbckSUmaaV8zW3Gb84xUwF17FF2jD8NZUFWLL
 Dl/AY/HUJfMwPZcWVxqbsp+3t5yiDDYjvcpvpfnXWxcwuTTepoR/9Cg8+NpxrTHOtuZf
 pN5A==
X-Gm-Message-State: AO0yUKXDm6O+lv4MT+dthfAFsAOCCjma/IK0pLCc5FJSnsjP06naqx4K
 fCRD0/Poh4Ud/9/K4w45CfUFKw==
X-Google-Smtp-Source: AK7set/D5otJUcezw4pvpJxpT+/kC43+ob2y2ReD7oBCL0bYDZNjjjP/mD8IiBccc47TGIjk8471Fg==
X-Received: by 2002:aa7:982d:0:b0:5a9:e8dd:80ea with SMTP id
 q13-20020aa7982d000000b005a9e8dd80eamr1425195pfl.17.1677832917354; 
 Fri, 03 Mar 2023 00:41:57 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 j22-20020aa78d16000000b005a909290425sm1040513pfe.172.2023.03.03.00.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:56 -0800 (PST)
Subject: [PULL 29/59] target/riscv: gdbstub: Do not generate CSR XML if Zicsr
 is disabled
Date: Fri,  3 Mar 2023 00:37:10 -0800
Message-Id: <20230303083740.12817-30-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Bin Meng <bmeng@tinylab.org>, Weiwei Li <liweiwei@iscas.ac.cn>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=palmer@rivosinc.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Bin Meng <bmeng@tinylab.org>

There is no need to generate the CSR XML if the Zicsr extension
is not enabled.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-ID: <20230228104035.1879882-6-bmeng@tinylab.org>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/gdbstub.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 704f3d6922..294f0ceb1c 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -406,7 +406,10 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
         g_assert_not_reached();
     }
 
-    gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
-                             riscv_gen_dynamic_csr_xml(cs, cs->gdb_num_regs),
-                             "riscv-csr.xml", 0);
+    if (cpu->cfg.ext_icsr) {
+        int base_reg = cs->gdb_num_regs;
+        gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
+                                 riscv_gen_dynamic_csr_xml(cs, base_reg),
+                                 "riscv-csr.xml", 0);
+    }
 }
-- 
2.39.2


