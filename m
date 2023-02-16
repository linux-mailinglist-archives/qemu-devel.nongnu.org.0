Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 680B06999E0
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:23:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSh12-0000AW-QS; Thu, 16 Feb 2023 11:21:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSh10-000094-Rq
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:21:46 -0500
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSh0z-0005ue-Bp
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:21:46 -0500
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-16aa71c1600so3069682fac.11
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 08:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bzgUQCLPgU6X7MZ2uleR0+KefuKd7NhosDsVObTIs/M=;
 b=P6A+ISEvcpcseZD332yY6nUBWsOjOIT5IvzFLLL3VPeQXqnVsJ0vE08b3p2HuQr3rV
 e9oB40VmtIICtUuuMui87FE8tV4aSBjrzQXk4gHwpn2a7S98lOVf4f4hW6uawqXI6kb8
 juHdQloMq7mi8NELc47QEV//VK0bjcsqkhF41dU1FQCNJYyME06flEdyWvMFcKGurNAl
 hpvK8AI67b1ctZxZs81YFLuENTvW8TIpUR1upH8FY6suSLAKxDRH9bjH9VM5g6m8VE56
 v7Wf0WHtOzxKMdMFwqDy2JuNxmuw4NUeZ/3k+P1kYOWlqaL5BNqpHo3uAopLo4aGRqPD
 FzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bzgUQCLPgU6X7MZ2uleR0+KefuKd7NhosDsVObTIs/M=;
 b=XqnAeCePIkCiUAz+z7pEMS7UMw8643jhAZiZIVctUIlzwnw0ojAcltVgaB/lljUQzP
 eVmBFVKXf0IyCbksw+8CAw0JECerOVE8sCBtkIl6NCQvHCUxM6WrbQqa6WFr4TmLIiA4
 /6GIkuRDXzeXyo2Z1u//PLKsxLw1KUp5+Air0+lgKPVMioCSRAkEqtDhqex5R2reBd7p
 65nvQKXDMMpkLWEogYENFBg5O9lhp9KU7BjQEyZAqKECOyniljhPlLA3ViiDKlCklbd2
 qpH0P7qXJdWXNBGTYxfvBngYXWFNeM7DBkgUrTW2OEo3QCQt5nEluQus4xu2uWAGJWWZ
 ermA==
X-Gm-Message-State: AO0yUKXllkl+FiZeVU99ptRLqmhkRGFPKD+X45h/Oz7lzk8tv4HlZcp7
 xcOO3t0AFnYXdjNkTgRx0TWBAA05q+marMaw
X-Google-Smtp-Source: AK7set/sf3nc+NCzABPxXMSxXXoLMXVJ+WJ2/UGedxREGy8ROYGfHZOCHwszB7tukj034FRrXAuC9w==
X-Received: by 2002:a05:6870:4413:b0:15b:8856:f0cb with SMTP id
 u19-20020a056870441300b0015b8856f0cbmr3898408oah.57.1676564504326; 
 Thu, 16 Feb 2023 08:21:44 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a056870e15100b001600797d1b5sm693029oaa.41.2023.02.16.08.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 08:21:43 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v5 4/9] target/riscv/cpu.c: error out if EPMP is enabled
 without PMP
Date: Thu, 16 Feb 2023 13:21:21 -0300
Message-Id: <20230216162126.809482-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216162126.809482-1-dbarboza@ventanamicro.com>
References: <20230216162126.809482-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x32.google.com
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

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e34a5e3f11..4585ca74dc 100644
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


