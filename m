Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F13CB6A93E6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 10:25:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0zn-0000Uh-QU; Fri, 03 Mar 2023 03:42:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zg-0008V9-QC
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:42:25 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zf-00086w-B7
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:42:24 -0500
Received: by mail-pl1-x62d.google.com with SMTP id n6so1987360plf.5
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832942;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YwFKiArhbxJLyBVT/Z+JtOcropCSjORrRpC5cWL6qGo=;
 b=XMVZpgvz+3T+O9QwKocc7Keysdq6Qzgf/L8/cNGuEbz0227eSJNkVsZKV2kBbS/ayy
 8OkB8kVpcytZjNFfYE0fjJRPp6he4+/mBsl1vGPMKfctIRXWd+V3kHG1R5OLdyh59Ue5
 gv/fjywgNwlDWITjiaAJP1njr6nx1pY3DBuuTepeKFxXRF4InFAPdRrWJ4CHHadyQdkP
 PqrPtxpsG7vLLxAMZry8LaHz23jdZu7+1Fv9x8ar4/zow92srW7qwoNtin0hrLTyNcqq
 fEOUCiFLIUvoNw+sPErgj1fNdkBAws+omgQajF3/PX+J9Bk8/HZdOq6EBjMgaGnOny+k
 r3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832942;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YwFKiArhbxJLyBVT/Z+JtOcropCSjORrRpC5cWL6qGo=;
 b=ehOLjGrOjExRHWYLzzPJuVOmvwQRJurhvLGYmiZrxegDqa4hT6zXu7dJUCjaFeDLpp
 o6GDoY/rP/47pUC/F6ECzPJ9knbORk9o/pPdSHmcIXRIx8OH3NcsZ2yAG54ntT7JfIed
 MKASBdE3Roz3g6NwRn/PednjO4L6c+kkPiwK/1TV66J1E9Ka6icBzIilwgLpnK1uJWuf
 PyEH4xgmXp+v1bL6/LO6va6H4haGh2VuMWByNwjZmClz2m/fIOce+rVW77aKdaz5Yfow
 4NiHbnyB1ZYGbOdt2kJDH1rIZEXfZZJH+D53klbLcmGBNwi4cv3TylLXhykz8FGd5YKm
 ENfw==
X-Gm-Message-State: AO0yUKXreRxtEQJT2741mLxuZoqjlnIBiEraK56je27hIh6Oc4WepIQP
 1s5ykG26Ua7pDewhAsB0blUvZw==
X-Google-Smtp-Source: AK7set8ZuYT41+MzIaUOWYmZiQyuse4/dntmjpUUtJWYgvJUxWjL1IVLcUl7L86VbO+mxS/wUwmltg==
X-Received: by 2002:a05:6a20:158e:b0:cd:929d:27fc with SMTP id
 h14-20020a056a20158e00b000cd929d27fcmr1810423pzj.45.1677832941938; 
 Fri, 03 Mar 2023 00:42:21 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 i22-20020aa78d96000000b005d932d0c029sm1044509pfr.65.2023.03.03.00.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:42:21 -0800 (PST)
Subject: [PULL 48/59] target/riscv: Fix the relationship between
 menvcfg.PBMTE/STCE and Svpbmt/Sstc extensions
Date: Fri,  3 Mar 2023 00:37:29 -0800
Message-Id: <20230303083740.12817-49-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>, Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x62d.google.com
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

menvcfg.PBMTE/STCE are read-only zero if Svpbmt/Sstc are not implemented.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <20230224040852.37109-2-liweiwei@iscas.ac.cn>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/csr.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 1b0a0c1693..b20b00a9a7 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1885,10 +1885,12 @@ static RISCVException read_menvcfg(CPURISCVState *env, int csrno,
 static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
+    RISCVCPUConfig *cfg = &env_archcpu(env)->cfg;
     uint64_t mask = MENVCFG_FIOM | MENVCFG_CBIE | MENVCFG_CBCFE | MENVCFG_CBZE;
 
     if (riscv_cpu_mxl(env) == MXL_RV64) {
-        mask |= MENVCFG_PBMTE | MENVCFG_STCE;
+        mask |= (cfg->ext_svpbmt ? MENVCFG_PBMTE : 0) |
+                (cfg->ext_sstc ? MENVCFG_STCE : 0);
     }
     env->menvcfg = (env->menvcfg & ~mask) | (val & mask);
 
@@ -1905,7 +1907,9 @@ static RISCVException read_menvcfgh(CPURISCVState *env, int csrno,
 static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
-    uint64_t mask = MENVCFG_PBMTE | MENVCFG_STCE;
+    RISCVCPUConfig *cfg = &env_archcpu(env)->cfg;
+    uint64_t mask = (cfg->ext_svpbmt ? MENVCFG_PBMTE : 0) |
+                    (cfg->ext_sstc ? MENVCFG_STCE : 0);
     uint64_t valh = (uint64_t)val << 32;
 
     env->menvcfg = (env->menvcfg & ~mask) | (valh & mask);
-- 
2.39.2


