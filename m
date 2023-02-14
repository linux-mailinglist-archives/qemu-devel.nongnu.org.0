Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 514F4696DD8
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 20:25:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS0uf-0005fH-NC; Tue, 14 Feb 2023 14:24:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pS0ud-0005dV-4v
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 14:24:23 -0500
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pS0ub-00059J-MD
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 14:24:22 -0500
Received: by mail-ot1-x332.google.com with SMTP id
 14-20020a9d010e000000b0068bdddfa263so4980196otu.2
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 11:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J50h3U4rb2ghFI3Aci8pAi+bPj544lfXsNxzpZ0fogk=;
 b=R6XpfXN1q5KepOXUCI8/nExGGQnHpBfW224k0HXRm3/94LUuvSc9LABwvatSe+Ts6m
 4Bij723kLFMMxhdQ3Xrvs/pkwXznfR1T1NXSEBJx9NzgcRc0IaKgSPjfMzdSCqfc1D9Y
 e1mRhyIXFCfKeCQgCgEHQqKZ8xrxkQy0nosVBRSuIU5NPh+Xdj/Cdw2zhE2gXM3xTq9D
 ljHDxYtPFhbZTFZWMrlIWhsJMaLoX4/zXxS+0q1ZZX1OPB8MsAU1fHkJC89Zy6n3dpW3
 9mJ9d+XoJ+Hi/HBqC73hfgq0hyty95G78g82bJo8ddAKCOWUunFUKPSYAlaT85T2/4iR
 jiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J50h3U4rb2ghFI3Aci8pAi+bPj544lfXsNxzpZ0fogk=;
 b=Y6QG+cJFdNf7zTQkSYAxrFs7aD1lF7haSEUzXJzdLYbpcYrIJlfLmrqO0bV3gvDRP+
 CkiqxNeM0NgTmAXPGQdZKe0y6p3jF4AwRKIaW4Rs6b2fS3xnbMdxIKCXeSZgzyt6Yvsr
 G6lcs6t7JESxRHoQNUxmksiXi/Zck2YuY4VR8eul2FW4QOECow6BCk8HO1wWxFHSU99X
 snIDkVlkkKRspUcPBEVEWhU2OGPiexrlmnKF3gZsrOqiM37291ZhJ/AN2BAbOCPXLcM2
 ChbGF6HiNmp8QHUdb2+8jTMdfr/rDh+Pf3xfYBTeArxqGxoReZxkDt27+a3yidBCcOSu
 2/yA==
X-Gm-Message-State: AO0yUKVeWaswW4QKWQhcnRbuwpilLZrze8e1HlUbUJzinAcRB2Mu454y
 ocIJlcv9DeKVaonO+aom0sVxxhaZVgJsANR+
X-Google-Smtp-Source: AK7set+OCNzOWqci9SOrEJdqFtyfv8e6IU2/vRvZnSfjwAwP/P134WumiJIR/9/qR9rZjFXJGBZzlQ==
X-Received: by 2002:a05:6830:1245:b0:68b:c6b9:dcbb with SMTP id
 s5-20020a056830124500b0068bc6b9dcbbmr1600609otp.9.1676402660301; 
 Tue, 14 Feb 2023 11:24:20 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a9d6185000000b006865223e532sm6653752otk.51.2023.02.14.11.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 11:24:19 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 06/11] target/riscv/cpu.c: error out if EPMP is enabled
 without PMP
Date: Tue, 14 Feb 2023 16:23:51 -0300
Message-Id: <20230214192356.319991-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214192356.319991-1-dbarboza@ventanamicro.com>
References: <20230214192356.319991-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x332.google.com
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

Instead of silently ignoring the EPMP setting if there is no PMP
available, error out informing the user that EPMP depends on PMP
support:

$ ./qemu-system-riscv64 -cpu rv64,pmp=false,x-epmp=true
qemu-system-riscv64: Invalid configuration: EPMP requires PMP support

This will force users to pick saner options in the QEMU command line.

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 272cf1a8bf..1e67e72f90 100644
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
2.39.1


