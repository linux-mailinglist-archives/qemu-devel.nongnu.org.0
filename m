Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0880A6B9C30
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 17:52:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc7qg-0005Lp-KL; Tue, 14 Mar 2023 12:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7qd-0005KJ-30
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:50:03 -0400
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7qb-0002cL-DT
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:50:02 -0400
Received: by mail-oo1-xc2f.google.com with SMTP id
 n27-20020a4ad63b000000b005252709efdbso2403906oon.4
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 09:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678812600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EV5OEE/WdNMUI185IdCQ9kgxw43fPzMUW63mdVe54zA=;
 b=aVKTnDy634MpT8saqpASr3tczPSnCOXZuXVJNRKbetRghkmlZgPT8iGpmJf16gV7GD
 C2VzYDMgibJ74E8fPRewk2jO6jQDg4h1pyB5UKI9gVhuPW3g5fLnr18/gxUxwxbprqtx
 nph0pNalexQfLk6+kJ26My1SrQ1gO4U9ub6ZaaXWf+jfyxs8iBIYNwQcxIDNk6BuwQqi
 QpdBLX3d4c2asjgxjdiiwhbdr7TzEN9HbLwcgO1IK6Cl5ghUWwwLM2Z6Q4lAY3Enel87
 3NoZSOtcqrN3j3cEpEXl6f1TGN1E2kWJyeRVnmzU+xvBLnqb/Q7qSQxOPWeg0KMARuKs
 caWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678812600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EV5OEE/WdNMUI185IdCQ9kgxw43fPzMUW63mdVe54zA=;
 b=RibiCUgqtMmo9tmKKJ/r18TxIsLPxHFTHGbrZ34UN5cGzNxP0XZRF9qolFKd14A25L
 FcRb7MDq0Egg05wPr3s3p8EWHLY6KXldnqjElaTxdTyJ1eXIBbTJDTLlZ28whRHdlRAb
 MEGmhmYD15t8E2ELqOxKWriok424YeDDp/WJlhDF3XCoR0+fxE25GEn/MuKpzjiZuFIG
 J1Tfx1lzZCGQcseTPsgpmiUxQUiKb+8gv9ksfCcdFane9tOyDQiUiw4eMqaILYgQiFMi
 hCA817bq/wIBq4k9yTQSYlHf2Mgu0h71Rjx+apV7vS0S3QgzMBigFcWhTdLO8oEGXRaX
 XruA==
X-Gm-Message-State: AO0yUKWKZlgFvY7SjewoLrI04Iw8qUuN/+MdgQF9D2p8D0YZBNeH3bIH
 pN+Z70urSyCx6zVZaaz+oJRC2z30b5wtJJpJZYg=
X-Google-Smtp-Source: AK7set8PNo0pjDwN1W0QkDtEpYVY93rXUEOZDEWm8X5GeuNDLjGpWrAOcag+4ZVP0g8V6fhBJHjRig==
X-Received: by 2002:a05:6820:1522:b0:520:f76:11e2 with SMTP id
 ay34-20020a056820152200b005200f7611e2mr19104844oob.9.1678812600132; 
 Tue, 14 Mar 2023 09:50:00 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 96-20020a9d04e9000000b0069451a9274bsm348689otm.28.2023.03.14.09.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:49:59 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v2 02/26] target/riscv/cpu.c: remove set_vext_version()
Date: Tue, 14 Mar 2023 13:49:24 -0300
Message-Id: <20230314164948.539135-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314164948.539135-1-dbarboza@ventanamicro.com>
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2f.google.com
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

This setter is doing nothing else but setting env->vext_ver. Assign the
value directly.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 18591aa53a..2752efe1eb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -245,11 +245,6 @@ static void set_priv_version(CPURISCVState *env, int priv_ver)
     env->priv_ver = priv_ver;
 }
 
-static void set_vext_version(CPURISCVState *env, int vext_ver)
-{
-    env->vext_ver = vext_ver;
-}
-
 #ifndef CONFIG_USER_ONLY
 static uint8_t satp_mode_from_str(const char *satp_mode_str)
 {
@@ -839,7 +834,7 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
         qemu_log("vector version is not specified, "
                  "use the default value v1.0\n");
     }
-    set_vext_version(env, vext_version);
+    env->vext_ver = vext_version;
 }
 
 /*
-- 
2.39.2


