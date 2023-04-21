Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 317B66EAB98
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:28:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqno-0001XG-Kg; Fri, 21 Apr 2023 09:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppqnm-0001Um-PY
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:27:50 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppqnl-0003ry-61
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:27:50 -0400
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-38dec65ab50so1188782b6e.2
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 06:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682083667; x=1684675667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=so/m75aYooy9potUy+9ZNYMFx5vS3f2yXi5Fn9XUP94=;
 b=ggVDW9GslUuTwRsSC4F9jFfYtVaz9s84MDuD1qnmfWaj03GTMAQvpWV/7wUCKoy6m/
 Yawjik58XnF3wVu3KDKTDs3spU1Fx7+qfTV/GxzWWy2B0NVfjn80qEP4j13v4Ac3yDiz
 2DAyUDqdWT7+ZFLkqwY2H+FX9ZXZrUcqtHMSPHfDn9ImxaT3TVphYySmJ10NYX53+ymI
 QBLf2pAvZ5IzGuNwSN2fE7BCsPcT95z/rp7WLOl3tujia114BVI9egVQghcbx4lMwNcE
 3UGnozPsH9ClQUlfuZda139MJN6WNER6L0PWiSqtwMOxl8maVcjsRRjnelvwTq8sP8EY
 BaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682083667; x=1684675667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=so/m75aYooy9potUy+9ZNYMFx5vS3f2yXi5Fn9XUP94=;
 b=O1NceZsJhq354PH1eqcDxG8B7F7+CKBb0pFqnCWLjPrexVxdaJzyhjpoqeuetGJIsQ
 AlhInbTTzDu9quFC3YwDDntKeBNdyhk49k4U08AU3N1l0gXhSEz0xFmTuMnx2d/lKHwz
 DWhffcBg0iECeeH9QG6jWQnsuewG6jJV/XK8Nt3Po19SCItV66chwlntQxffaxn6loDH
 7wEqjiczPh20iRgxPA5Mjemk8c6+kzA6Dd1ce7wdCM4oTgJaEumd+7skbWzNSsDNhyXm
 39DhImDa6Q1F38FkMv0izhEy/LiaxR0L3HulCRI+sXLhM2kdfruHWfQd+5QEmvqMb0A0
 pkLg==
X-Gm-Message-State: AAQBX9csftM7y8vLiyvJMNzxnROKaqQq/woSisIHTrI5dTGDSMr0DE6J
 1vphhelLrw6Hs2a2dB1NU2SpMPY+uiicpRocTeM=
X-Google-Smtp-Source: AKy350aqTGHfFFbK+ggBvg7sRDTSoVxVdq5Y/HcbVct/A+GutIlvqn9uDKtSfU6NJRBQxCIxYhghdQ==
X-Received: by 2002:a54:4e0b:0:b0:37b:8502:4c89 with SMTP id
 a11-20020a544e0b000000b0037b85024c89mr2259567oiy.18.1682083667743; 
 Fri, 21 Apr 2023 06:27:47 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 r84-20020acada57000000b003895430852dsm1623359oig.54.2023.04.21.06.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 06:27:47 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v8 05/11] target/riscv: Mask the implicitly enabled extensions
 in isa_string based on priv version
Date: Fri, 21 Apr 2023 10:27:21 -0300
Message-Id: <20230421132727.121462-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421132727.121462-1-dbarboza@ventanamicro.com>
References: <20230421132727.121462-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Using implicitly enabled extensions such as Zca/Zcf/Zcd instead of their
super extensions can simplify the extension related check. However, they
may have higher priv version than their super extensions. So we should mask
them in the isa_string based on priv version to make them invisible to user
if the specified priv version is lower than their minimal priv version.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index dd35cf378f..9bb0e6b180 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1721,7 +1721,8 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
     int i;
 
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
-        if (isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
+        if (cpu->env.priv_ver >= isa_edata_arr[i].min_version &&
+            isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
             new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
             g_free(old);
             old = new;
-- 
2.40.0


