Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5FC6C5A0B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 00:09:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf7GB-00080K-IE; Wed, 22 Mar 2023 18:48:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf7G9-000805-PI
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:48:45 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf7G8-0001ek-B8
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:48:45 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-5447d217bc6so364322877b3.7
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 15:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679525323;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ADneTQ/OBJ/eO647FGCO0OgM+dmE7RZtYQ6phFnnTGw=;
 b=TU9V7wq+McQSJjYtW1XtNUNA+Yd89qMHdVPb38hPIF4BhPtUUHE25KH4mmDVUM1hNr
 RH9+76yWEDW1itugI+okEgCBpNgTEnrSB06mfg6NDxGfQbpUFTaSCyJ29/2zjtQ1kBL7
 breftocQIqNeIc3slp8Dh/cpkb0k6IZpuANCOwPEw3Lpx55If8aQEWGed3yui17/nCdv
 JgB4x9yTIt9TokNUU7KWVYCR+G1WJ0YBEtUhQHJb8IhxKdD3nMP6e+ngrZv+ts0zCsNI
 HnVVzzVyoQ5CHnOPcskVR5ylXXz7cxhF5cmZvRbkxeTWf7EHh6QJm53LbYRr6c0udhsZ
 ci/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679525323;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ADneTQ/OBJ/eO647FGCO0OgM+dmE7RZtYQ6phFnnTGw=;
 b=vn+3aCCgL7GdDXYxdozeVywyXN+sX89YG/OUWGi56N6amOGkwdx0/mTZ1n7EySPyNY
 m0zmZnjzs5qfVqLdndkn1bad4uM2G02zxxquUPLvlxA3FBQ6BTu+1snHSriS/fdiIvyW
 GxNbONvv+Jr3JrjG50G9LgEodVLxUQlGye5iJ9ullDbLvWBwVmFYSCLzvwInyuSTMDUo
 TJo38Iohviwkknq/keUdI6zsqZIfHnEKhO3ubby1RVP7UlzzKqdQd2hiwxYXCP2d18sj
 fgPTtcYQuISzKtFe+1awt4v2Fil5X/CmR3RPjmHrbggyHmXcSmIZdnxOsGect4R6Vk19
 jrew==
X-Gm-Message-State: AO0yUKWNfzoYsfIkrd5kowjlDQwUdULKyc/CZDzNQr8iRwN36qPLhUar
 pefOZz14NF8TrEUoHcQpX1jB8iWeicwN+FKNM4Q=
X-Google-Smtp-Source: AKy350Y0j2q7ScyaSD1356WDgabKsDQF08uxLQj9vcDwEqP08a7E8mfQ6zxLzrHbMWnBhv/sePdJEA==
X-Received: by 2002:a05:6870:7025:b0:17a:cb34:758a with SMTP id
 u37-20020a056870702500b0017acb34758amr916964oae.34.1679523628772; 
 Wed, 22 Mar 2023 15:20:28 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:20:28 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 02/25] target/riscv/cpu.c: remove set_vext_version()
Date: Wed, 22 Mar 2023 19:19:41 -0300
Message-Id: <20230322222004.357013-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x1131.google.com
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
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
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


